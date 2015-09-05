#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"

TShip user;
u8 shoot_type;
u8 choice=0;
u8 *engine_anim[2];

void init_user() {

  user.w = 4;
  user.h = 8;
  user.x = 39 - (user.w / 2);
  user.y = 199 - (user.h);
  user.vx = 0;
  user.vy = 0;
  user.topvx = 4;
  user.topvy = 5;
  user.ax = 0;
  user.ay = 0;
  user.sprite = (u8*) G_ship_00;
  user.score = 0;
  user.shield = 0;
  user.lives = 0;

  user.max_shoots = 3;
  shoot_type = 1;
  user.last_moved = 0;
  user.engine_state = 0;

  user.shift = ON_EVEN_PIXEL;

  engine_anim[0] = (u8*) G_engine_00;
  engine_anim[1] = (u8*) G_engine_01;

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

  pscreen = cpct_getScreenPtr(screen, user.x + 1, user.y + 7);
  cpct_drawSprite( (u8*) engine_anim[user.engine_state], pscreen, 2, 1);
}

void update_user() {
  u8 x, y;

  user.ax = 0;

  // Scan Keyboard
  cpct_scanKeyboard_f();

  //
  // Check possible keys to press, and do actions
  //

  // KEY = Up or Down
  if ((cpct_isKeyPressed(Key_Q))) {
    user.ay = -2;
  } else if (cpct_isKeyPressed(Key_A)) {
    user.ay = 2;
  }
  // KEY =  Right or Left
  if ((cpct_isKeyPressed(Key_P))) {
    user.ax = 2;
  } else if (cpct_isKeyPressed(Key_O)) {
    user.ax = -2;
  }

  // KEY = D
  if (cpct_isKeyPressed(Key_D)) {
    shoot_type = (shoot_type + 1) % 2;
  }
  // KEY = H
  if (cpct_isKeyPressed(Key_H)) {
    //create_enemy((rand()%80),(rand()%199),(rand()%3));
    create_enemy(10, 120, (rand() % 3), 10, 10);
  }
  // KEY = J
  if (cpct_isKeyPressed(Key_J)) {
    x = rand() % 80;
    y = rand() % 199;
    create_enemy(x, y, (rand() % 3), 10, 10);
    create_enemy(x + 10, y, (rand() % 3), 10, 10);
    create_enemy(x + 20, y, (rand() % 3), 10, 10);
  }
  // KEY = K
  if (cpct_isKeyPressed(Key_K)) {
    create_enemy_group((rand() % 10) + 5, rand() % 40, rand() % 3, 12);
  }
  // KEY = Space
  if (cpct_isKeyPressed(Key_Space)) {
    create_shoot(user.x + 2, user.y, shoot_type);
  }

  // KEY = L
  if (cpct_isKeyPressed(Key_L)) {
    create_explosion((rand() % 20) + 5, (rand() % 80) + 20, rand() % 2);
  }

  //Kinematics
  if (user.ax != 0) {
    if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))) {
      user.vx += user.ax;
    }
  }

  if (user.vx > 0) {
    user.vx--;
  } else if (user.vx < 0) {
    user.vx++;
  }

  user.x += user.vx;

  if (user.x < 0)
    user.x = 0;
  else if (user.x > 79 - user.w) {
    user.x = 79 - user.w;
  }
}

void draw_user(u8* screen) {
  u8* pscreen;
  pscreen = cpct_getScreenPtr(screen, user.x, user.y);
  cpct_drawSprite( (u8*) user.sprite, pscreen, user.w, user.h);
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