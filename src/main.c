#include <stdio.h>
#include <cpctelera.h>
#include "entities/entities.h"
#include "sprites/sprites.h"
#include "starfield/starfield.h"
#include "util/util.h"


// Modo Debug
#define DEBUG 0
// Automata de estados
#define STATE_MENU      2
#define STATE_HELP      3
#define STATE_GAME      4
#define STATE_EXIT      5
#define STATE_WIN       6
#define STATE_LOSE      7
#define STATE_LEVELUP   8
#define STATE_REDEFINE  9
#define STATE_DEAD      11
#define STATE_TEST01    12

#define INITIAL_STATE STATE_MENU

// Memory management
// Program Stack locations
#define NEW_STACK_LOCATION       (void*)0x400
#define PREVIOUS_STACK_LOCATION  (void*)0xC000
#define SCR_VMEM  (u8*)0xC000
#define SCR_BUFF  (u8*)0x8000


// Definiciones del disparo del prota

#define SONIDO_ACTIVADO 0

///////////////////////////////////////////////////////////////////////////////////////
// Global variables
//

//Autómata de estados
u8 state;
u8 previous_state;

u8* pvmem;
u8* prev_pvmem;     // Pointer to video memory (or backbuffer) where to draw sprites
u8 aux_txt[40];
u8 level = 0;

long last_update, delta_time;

///////////////////////////////////////////////////////////////////////////////////////
// Change Video Memory Page
//    This function changes what is drawn on screen by changing video memory page.
// It alternates between page C0 (0xC000 - 0xFFFF) to page 40 (0x4000 - 0x7FFF).
// Page C0 is default video memory, page 40 is used in this example as Back Buffer.
//
u8* changeVideoMemoryPage(u8 set_page) {
  static u8 page   = 0;   // Static value to remember the last page shown (0 = page 80, 1 = page C0)
  u8* screen;

  // if a set_page is set to 1 video memory starts at #C000 if is set to 2, at #8000
  if (set_page == 1)
    page = 1;
  else if (set_page == 2)
    page = 0;

  // Depending on which was the last page shown, we show the other
  // now, and change the page for the next time
  if (page) {
    cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at bank 3 (0xC000 - 0xFFFF)
    page = 0;                              // Next page = 0
    screen = SCR_BUFF;
  } else {
    cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at bank 1 (0x8000 - 0x7FFF)
    page = 1;                              // Next page = 1
    screen = SCR_VMEM;
  }
  return screen;
}


/////////////////////////////////////////////////////////////////////////
// Clears screen
//
void clear_screen(u8* screen) {
  cpct_memset_f64(screen, 0x00, 0x4000);
}

/////////////////////////////////////////////////////////////////////////
// Clears both screens
//
void clear_both_screens() {
  cpct_memset_f64(SCR_VMEM, 0x00, 0x4000);
  cpct_memset_f64(SCR_BUFF, 0x00, 0x4000);
}

void draw_lives_flags(u8* screen) {
  u8 i;
  u8 avance;
  u8 aux;
  u8 aux2;
  u8 *pscreen;

  avance = 0;
  //Pînto Banderas verdes una cada cinco niveles
  aux = level / 5;
  for (i = 0; i < aux; i++) {
    pscreen = cpct_getScreenPtr(screen, avance, 0);
    cpct_drawSprite((u8*) G_green_flag, pscreen , 2, 5);
    avance = avance + 3;
  }
  //Pînto Banderas rojas una cada nivel
  aux2 = level - (aux * 5);
  for (i = 0; i < aux2; i++) {
    pscreen = cpct_getScreenPtr(screen, avance, 0);
    cpct_drawSprite((u8*) G_red_flag, pscreen, 2, 5);
    avance = avance + 3;
  }
  //Pînto corazones por cada vida
  for (i = 0; i < get_user_lives(); i++) {
    pscreen = cpct_getScreenPtr(screen, 76 - (i * 3), 0);
    cpct_drawSprite((u8*) G_heart, pscreen, 3, 5);
  }

}

/////////////////////////////////////////////////////////////////////////
// Draw scoreboard
//

void draw_scoreboard(u8* screen) {
  red_message();
  sprintf(aux_txt, "%08d", get_score());
  cpc_PrintGphStr(aux_txt, (int) cpct_getScreenPtr(screen, 32, 0));
  draw_lives_flags(screen);
}

/////////////////////////////////////////////////////////////////////////
// Initialization
//

void initial_setup() {

  cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours
  cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
  cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
  cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)

  // Clean up Screen and BackBuffer filling them up with 0's
  clear_both_screens();

  state = INITIAL_STATE;

  pvmem = SCR_BUFF;
  prev_pvmem = pvmem;

  cpct_setRandomSeedUniform_u8((u8) get_time());
}

void init_level() {
  init_user_level();
  init_enemies();
  init_explosions();
  init_shots();
  init_enemy_shots();
  init_messages();
}

void init_game() {
  if (STARFIELD_ACTIVE)
    init_starfield();

  init_user();
  init_level();
  set_score(0);
  level = 1;
}

u8 menu() {
  u8 choice = 0;

  timer_on();

  changeVideoMemoryPage(1); //Initialize video memory to #C000

  //  Synchronize next frame drawing with VSYNC
  cpct_waitVSYNC();

  clear_screen(SCR_VMEM);

  red_message();
  cpc_PrintGphStr2X("SPACE;RETRO;INVADERS", (int) cpct_getScreenPtr(SCR_VMEM, 20, 16));
  blue_message();
  cpc_PrintGphStr("1;PLAY", (int) cpct_getScreenPtr(SCR_VMEM, 24, 5 * 16));
  cpc_PrintGphStr("2;REDEFINE;KEYS", (int) cpct_getScreenPtr(SCR_VMEM, 24, 6 * 16));
  cpc_PrintGphStr("3;HELP", (int) cpct_getScreenPtr(SCR_VMEM, 24, 7 * 16));
  red_message();
  cpc_PrintGphStr2X("C;2015;JOHN;LOBO", (int) cpct_getScreenPtr(SCR_VMEM, 24, 11 * 16));


  while (choice == 0) {

    // Scan Keyboard
    cpct_scanKeyboard_f();

    if (cpct_isKeyPressed(Key_1))
      choice = STATE_GAME;
    if (cpct_isKeyPressed(Key_2))
      choice = STATE_REDEFINE;
    if (cpct_isKeyPressed(Key_3))
      choice = STATE_HELP;
  }

  timer_off();

  return choice;
}


u8 redefine_keys() {

  return STATE_MENU;
}


u8 help() {
  u8 choice = 0;

  clear_screen(SCR_VMEM);

  red_message();
  //  Synchronize next frame drawing with VSYNC
  cpct_waitVSYNC();
  cpc_PrintGphStr2X("HELP", (int) cpct_getScreenPtr(SCR_VMEM, 36, 10));
  blue_message();
  cpc_PrintGphStr2X("PRESS;A;KEY", (int) cpct_getScreenPtr(SCR_VMEM, 29, 30));

  wait_for_keypress();

  return STATE_MENU;
}

u8 level_up() {
  if (level < MAX_LEVEL) {
    red_message();
    //  Synchronize next frame drawing with VSYNC
    cpct_waitVSYNC();
    cpc_PrintGphStr("CONGRATULATIONS;HERO", (int) cpct_getScreenPtr(prev_pvmem, 20, 80));
    blue_message();
    cpc_PrintGphStr("LEVEL;COMPLETE", (int) cpct_getScreenPtr(prev_pvmem, 26, 100));
    cpc_PrintGphStr("PRESS;TO;CONTINUE", (int) cpct_getScreenPtr(prev_pvmem, 23, 120));

    wait_for_keypress();

    level++;
    return STATE_GAME;
  } else
    return STATE_WIN;
}

u8 dead() {
  if (get_user_lives() > 0) {
    red_message();
    cpc_PrintGphStr("TOUGH;LUCK;HERO", (int) cpct_getScreenPtr(prev_pvmem, 25, 80));
    blue_message();
    cpc_PrintGphStr("YOU;VE;BEEN;HITTED", (int) cpct_getScreenPtr(prev_pvmem, 22, 100));
    cpc_PrintGphStr("PRESS;TO;CONTINUE", (int) cpct_getScreenPtr(prev_pvmem, 23, 120));

    wait_for_keypress();

    center_user();

    return STATE_GAME;
  }
  else
    return STATE_LOSE;
}

u8 win() {
  red_message();
  //  Synchronize next frame drawing with VSYNC
  cpct_waitVSYNC();
  cpc_PrintGphStr("CONGRATULATIONS;HERO", (int) cpct_getScreenPtr(prev_pvmem, 20, 80));
  blue_message();
  cpc_PrintGphStr("YOU;WIN", (int) cpct_getScreenPtr(prev_pvmem, 33, 100));
  cpc_PrintGphStr("PRESS;TO;CONTINUE", (int) cpct_getScreenPtr(prev_pvmem, 23, 140));

  wait_for_keypress();

  return STATE_MENU;

}


u8 game_over() {
  red_message();
  //  Synchronize next frame drawing with VSYNC
  cpct_waitVSYNC();
  cpc_PrintGphStr("GAME;OVER;HERO", (int) cpct_getScreenPtr(prev_pvmem, 26, 80));
  blue_message();
  cpc_PrintGphStr("MAYBE;NEXT;TIME", (int) cpct_getScreenPtr(prev_pvmem, 25, 100));
  cpc_PrintGphStr("PRESS;TO;CONTINUE", (int) cpct_getScreenPtr(prev_pvmem, 23, 140));

  wait_for_keypress();
  return STATE_MENU;
}

u8 game(u8 level) {
  u16 i = 0;

  last_update = 0;
  delta_time = 0;

  timer_on();

  init_level();

  start_level(level);

  while (state == STATE_GAME) {

    delta_time = get_time() - last_update;

    //Starfield
    if ((STARFIELD_ACTIVE) && (delta_time > VELOCIDAD_ESTRELLAS)) {
      update_starfield();
    }
    //Explosions
    update_explosions();

    //User
    if ((delta_time > get_user_speed()) && (!get_user_dead())) {
      update_user();
    }

    update_shots();
    update_enemies(pvmem);

    update_enemy_shots();

    clear_screen(pvmem);

    //  Synchronize next frame drawing with VSYNC
    cpct_waitVSYNC();

    //Draw Starfield
    if (STARFIELD_ACTIVE) {
      draw_starfield(pvmem);
    }

    //Draw all elements
    draw_enemies(pvmem);
    if (!get_user_dead())
      draw_user(pvmem);
    draw_shots(pvmem);
    draw_enemy_shots(pvmem);
    draw_explosions(pvmem);

    draw_messages(pvmem);
    draw_scoreboard(pvmem);

    prev_pvmem = pvmem;
    pvmem = changeVideoMemoryPage(0);


    if ((get_user_dead()) && (!get_active_explosions()) && (!get_active_shots()) && (!get_active_enemy_shots())) {
      state = STATE_DEAD;
      break;
    } else if (cpct_isKeyPressed(Key_Esc)) {    // ESC
      state = STATE_MENU;
      break;
    } else if (get_end_level()) {
      state = STATE_LEVELUP;
      break;
    } else
      update_level();
  }

  timer_off();

  return state;

}

//******************************************************************************
// Función main()
// Bucle principal del Juego
//******************************************************************************
int main() {

  cpct_disableFirmware();  // Disable firmware to prevent it from interfering

  // Stack copy and relocation
  cpct_memcpy(NEW_STACK_LOCATION - 6, PREVIOUS_STACK_LOCATION - 6, 6);
  cpct_setStackLocation(NEW_STACK_LOCATION - 6);

  initial_setup();

  while (state != STATE_EXIT) {
    switch (state) {
    case STATE_MENU:
      state = menu();
      break;

    case STATE_REDEFINE:
      state = redefine_keys();
      break;

    case STATE_HELP:
      state = help();
      break;

    case STATE_GAME:

      init_game();

      //bucle de juego y subida de nivel
      while ((state != STATE_LOSE) && (state != STATE_WIN) && (state != STATE_MENU)) {

        state = game(level);

        if (state == STATE_LEVELUP) {
          state = level_up();
        }

        if (state == STATE_DEAD) {
          state = dead();
        }
      }
      break;

    case STATE_WIN:
      state = win();
      break;

    case STATE_LOSE:
      state = game_over();
      break;
    }
  }

  return 0;
}
