#include <stdio.h>
#include <cpctelera.h>
#include "entities/entities.h"
#include "sprites/sprites.h"
#include "starfield/starfield.h"
#include "util/util.h"


// Modo Debug
#define DEBUG 1
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

#define INITIAL_STATE STATE_MENU


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

u8* pvmem;     // Pointer to video memory (or backbuffer) where to draw sprites
u8 aux_txt[40];

///////////////////////////////////////////////////////////////////////////////////////
// Change Video Memory Page
//    This function changes what is drawn on screen by changing video memory page. 
// It alternates between page C0 (0xC000 - 0xFFFF) to page 40 (0x4000 - 0x7FFF). 
// Page C0 is default video memory, page 40 is used in this example as Back Buffer.
//
u8* changeVideoMemoryPage() {
   static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   u8* screen;

      // Depending on which was the last page shown, we show the other 
      // now, and change the page for the next time 
   if (page) {
         cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
         page = 0;  
         screen = SCR_BUFF;                            // Next page = 0
       } else {
         cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
         page = 1;                              // Next page = 1
         screen = SCR_VMEM;
       }
       return screen;
     }


/////////////////////////////////////////////////////////////////////////
// Clears screen
//
     void clear_screen(u8* screen){
       cpct_memset_f64(screen, 0x00, 0x4000);   
     }

/////////////////////////////////////////////////////////////////////////
// Clears both screens
//
     void clear_both_screens(){
       cpct_memset_f64(SCR_VMEM, 0x00, 0x4000);   
       cpct_memset_f64(SCR_BUFF, 0x00, 0x4000);   
     }

/////////////////////////////////////////////////////////////////////////
// Draw scoreboard
//

     void draw_scoreboard(u8* screen){
      sprintf(aux_txt,"%08d",get_score());
      colour_message(0, 2);
      cpc_PrintGphStr(aux_txt,(int) cpct_getScreenPtr(screen, 4, 8));
      red_message();
      cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
    }

/////////////////////////////////////////////////////////////////////////
// Initialization
//

    void initialization(){

      pvmem = SCR_BUFF;

      cpct_setRandomSeedUniform_u8((u8) get_time());

      if (STARFIELD_ACTIVE)
        init_stars();

      init_user();
      init_shoots();
      init_enemies();
      init_explosions();
      init_messages();

    }

/////////////////////////////////////////////////////////////////////////
// main
//

    void main(void) {


   // Loop forever
     while (1){

      clear_screen(pvmem);

      update_user();
      update_shoots();
    //update_blocks();
      update_enemies();
      update_explosions();

    

     if (STARFIELD_ACTIVE)
       draw_stars(pvmem);

   //draw_blocks(pvmem);
     draw_user(pvmem);
     draw_shoots(pvmem);
     draw_enemies(pvmem);
     draw_explosions(pvmem);

     draw_messages(pvmem);
     draw_scoreboard(pvmem);


// Synchronize next frame drawing with VSYNC
//   cpct_waitVSYNC(); 

     pvmem = changeVideoMemoryPage();

   } 

 }

 void initial_setup(){
  // Reubico el stack
  set_stack(0x1000);

  cpct_disableFirmware();             // Disable firmware to prevent it from interfering
  cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
  cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
  cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
  cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)

   // Clean up Screen and BackBuffer filling them up with 0's
  clear_both_screens();
}

void init_game(){

}

void init_level(){

}

u8 menu(){
  u8 choice=0;

  clear_screen(SCR_VMEM);

  red_message();
  cpc_PrintGphStr2X("SPACE;RETRO;INVADERS", (int) cpct_getScreenPtr(SCR_VMEM, 20, 16));
  blue_message();
  cpc_PrintGphStr("1;JUGAR", (int) cpct_getScreenPtr(SCR_VMEM, 30, 4*16));
  cpc_PrintGphStr("2;AYUDA", (int) cpct_getScreenPtr(SCR_VMEM, 30, 5*16));
  cpc_PrintGphStr("3;REDEFINIR;TECLAS", (int) cpct_getScreenPtr(SCR_VMEM, 30, 6*16));
  cpc_PrintGphStr("ESC;SALIR", (int) cpct_getScreenPtr(SCR_VMEM, 30, 7*16));

  cpc_PrintGphStr("C;2014;GLASNOST;CORP", (int) cpct_getScreenPtr(SCR_VMEM, 30, 10*16));
  red_message();
  cpc_PrintGphStr("JOHN;LOBO", (int) cpct_getScreenPtr(SCR_VMEM, 30, 11*16));


  while (choice==0) {
     // Scan Keyboard
    cpct_scanKeyboard_f();

    if (cpct_isKeyPressed(Key_1)){ 
      init_game();
      choice=STATE_GAME;
    }
    if (cpct_isKeyPressed(Key_2))    
      choice=STATE_HELP;
    if (cpct_isKeyPressed(Key_3))    
      choice=STATE_REDEFINE;
    if (cpct_isKeyPressed(Key_Esc)){    
      choice=STATE_EXIT;
    }
  }
  return choice; 
}

u8 help(){

  return STATE_MENU;

}

u8 win(){

  return STATE_MENU;

}

u8 game_over(){

  return STATE_LOSE;

}

u8 game(){

  timer_on();
  
  if (SONIDO_ACTIVADO){ 
  }
  clear_both_screens();

  initialization(); 
  create_message(25,96,30,";VAMOS;AL;ATAQUE;");
  
  init_level();
  
  while(1)
  {

    //Espera al barrido
    //scr_waitVSYNC();

    //Starfield
    if ((STARFIELD_ACTIVE) && (get_time()-get_last_moved_stars()>VELOCIDAD_ESTRELLAS)){
      update_stars();
    }
    //Explosions
    if ((explosiones_activas>0)&&((get_time()-get_last_moved_explosions())>VELOCIDAD_EXPLOSIONES)){
      update_explosions();
    }
    //User
    if ((get_time()-get_last_moved_user())>get_user_speed()){
      update_user();
    }
    
    // Rest of upadtes
    update_shoots();
    update_enemies();
    
    // Synchronize next frame drawing with VSYNC
    //   cpct_waitVSYNC(); 
    
    //Animations
    if (!get_user_dead())
      user_engine();
    
    //Draw Starfield
    if (STARFIELD_ACTIVE){
      draw_stars(pvmem);
    }

    //Draw all elements
    draw_user(pvmem);
    draw_shoots(pvmem);
    draw_enemies(pvmem);
    draw_explosions(pvmem);

    draw_messages(pvmem);
    draw_scoreboard(pvmem);
    
    
    if ((prota.dead) && (!explosiones_activas) && (!disparos_activos) && (!disparos_malos_activos) && (!explosion_prota_activada)){
      state = STATE_DEAD;
      break;
    }

    if (cpct_isKeyPressed(Key_Esc)){     // ESC
      state = STATE_MENU;
      break;
    }
    

    // Hostilidad
    //if ((DEBUG) && (cpc_TestKey(KEY_HOSTILITY)==1)){      
    //  hostilidad=!hostilidad;
    //}
    
    
    //if ((malos_activos==0) && (explosiones_activas==0) && (!disparos_activos) && (!disparos_malos_activos)){
    //  state = STATE_LEVELUP;
    //  break;
    //}


     pvmem = changeVideoMemoryPage();
    
  }
  
  //Desactivar sonido
  if (SONIDO_ACTIVADO){

  }
  
  timer_off();
  
  return state;

}

//******************************************************************************
// Función main()
// Bucle principal del Juego
//******************************************************************************
int main() {
  initial_setup();

  while (state != STATE_EXIT) {
    switch(state) {
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
      nivel=1;
      prota.vidas=3;
      prota.escudo=0;
      prota.max_disparos=2;
      //Inicializo putuacion
      cambio_score=0;
      score=0;
      //bucle de juego y subida de nivel
      while ((state!=STATE_LOSE) && (state!=STATE_WIN) && (state!=STATE_MENU)) {

        if (SONIDO_ACTIVADO) cpc_WyzSetPlayerOff();
        state = game();
        if (SONIDO_ACTIVADO){ 
          //cpc_WyzInitPlayer(SOUND_TABLE_0, RULE_TABLE_0, EFFECT_TABLE, SONG_TABLE_0);
          //cpc_WyzLoadSong(0);
          //cpc_WyzSetPlayerOn();
        }
        if (state==STATE_LEVELUP)
          state=level_up();
        if (state==STATE_DEAD){
          prota.vidas--;
          state=end();
        }
      }
      break;

      case STATE_WIN:
      state = win();
      break;
      
      case STATE_LOSE:
      state = gameOver();
      break;
      
      default:
      state = STATE_EXIT;
      break;
    }
  }
  if (SONIDO_ACTIVADO) cpc_WyzSetPlayerOff();

  return 0;  
}
