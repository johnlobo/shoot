#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"

TShip user;
u8 shoot_type;
u8 choice=0;
u8* const user_anim[3] = {G_ship_00, G_ship_01, G_ship_02};
u8* const engine_anim[2] = {G_engine_00, G_engine_01};


void init_user() {

  user.e.w = 5;
  user.e.h = 8;
  user.e.x = (SCREEN_WIDTH + user.e.w) / 2;
  user.e.y = 199 - (user.e.h);
  user.e.sprite_set = (u8**) user_anim;
  user.e.num_frames = 3;
  user.e.frame = 0;
  user.e.shift = ON_EVEN_PIXEL;
  user.e.vx = 0;
  user.e.vy = 0;
  user.e.topvx = 8;
  user.e.topvy = 10;
  user.e.ax = 0;
  user.e.ay = 0;

  user.score = 0;
  user.shield = 0;
  user.lives = 0;

  user.max_shoots = 3;
  shoot_type = 1;
  user.last_moved = 0;
  user.engine_state = 0;

}

void user_init_level() {
  user.lives = 3;
  user.shield = 0;
  user.max_shoots = 3;
}

//******************************************************************************
//
//
//******************************************************************************
long get_last_moved_user() {
  return user.last_moved;
}

u8 get_user_max_shoots() {
  return user.max_shoots;
}
u8 get_user_speed() {
  return user.speed;
}
//u8 get_user_dead(){
//  return user.dead;
//}

void user_engine(u8* screen) {
  u8* pscreen;

  user.engine_state++;
  if (user.engine_state == 2) user.engine_state = 0;

  pscreen = cpct_getScreenPtr(screen, user.e.x + 1, user.e.y + 7);
  cpct_drawSprite( (u8*) engine_anim[user.engine_state], pscreen, 2, 1);
}

void update_user() {

  user.e.ax = 0;

  // Scan Keyboard
  cpct_scanKeyboard_f();

  //
  // Check possible keys to press, and do actions
  //

  // KEY = Up or Down
  if ((cpct_isKeyPressed(Key_Q))) {
    user.e.ay = -2;
  } else if (cpct_isKeyPressed(Key_A)) {
    user.e.ay = 2;
  }
  // KEY =  Right or Left
  if ((cpct_isKeyPressed(Key_P))) {
    user.e.ax = 3;
    user.e.frame = 2;
  } else if (cpct_isKeyPressed(Key_O)) {
    user.e.ax = -3;
    user.e.frame = 1;
  } else
    user.e.frame = 0;

  // KEY = Space
  if (cpct_isKeyPressed(Key_Space)) {
    create_shoot(user.e.x+3, user.e.y, shoot_type);
  }

  // KEY = 1
  if (cpct_isKeyPressed(Key_1)) {
    create_enemy(10, 10, 1, 10, 10);
  }
  // KEY = 2
  if (cpct_isKeyPressed(Key_2)) {
    create_enemy(10, 10, 2, 10, 10);
  }
  // KEY = 3
  if (cpct_isKeyPressed(Key_3)) {
    create_enemy(10, 10, 3, 10, 10);
  }
  // KEY = 4
  if (cpct_isKeyPressed(Key_4)) {
    create_enemy(10, 10, 4, 10, 10);
  }
  // KEY = 5
  if (cpct_isKeyPressed(Key_5)) {
    create_enemy(10, 10, 5, 10, 10);
  }


  //Kinematics
  if (user.e.ax != 0) {
    if ((( user.e.vx >= 0 ) && (user.e.vx < user.e.topvx)) || ((user.e.vx <= 0 ) && (user.e.vx > -user.e.topvx))) {
      user.e.vx += user.e.ax;
    }
  }

  if (user.e.vx > 0) {
    user.e.vx--;
  } else if (user.e.vx < 0) {
    user.e.vx++;
  }

  user.e.x += user.e.vx;

  if (user.e.x < 0)
    user.e.x = 0;
  else if (user.e.x > SCREEN_WIDTH - user.e.w) {
    user.e.x = SCREEN_WIDTH - user.e.w;
  }
}

void draw_user(u8* screen) {
  u8* pscreen;
  
  pscreen = cpct_getScreenPtr(screen, user.e.x/2, user.e.y);

  if (user.e.x & 1){ 
      shiftSpritePixelsRightToBuffer((u8*) user.e.sprite_set[user.e.frame], user.e.w * user.e.h);
      cpct_drawSprite( (u8*) sprite_buffer, pscreen, user.e.w, user.e.h);
    } else
      cpct_drawSprite( (u8*) user.e.sprite_set[user.e.frame], pscreen, user.e.w, user.e.h);
}

void set_score(u32 new_score) {
  user.score = new_score;
}
void add_score(u16 new_add_score) {
  user.score += new_add_score;
}
u32 get_score() {
  return user.score;
}