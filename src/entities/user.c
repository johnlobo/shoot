#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"

TShip user;
u8 shoot_type;
u8 choice = 0;
u8* const user_anim[3] = {G_ship00_0, G_ship00_2, G_ship00_1};

void center_user() {
  user.e.x = (SCREEN_WIDTH + user.e.w) / 2;
  user.e.y = 199 - (user.e.h);
}

void init_user() {
  user.e.w = 5;
  user.e.h = 14;
  user.e.sprite_set = (u8**) user_anim;
  user.e.num_frames = 3;
  user.score = 0;
  user.shield = 0;
  user.lives = DEFAULT_USER_LIVES;
  user.max_shots = 3;
  user.e.frame = 0;
  user.e.shift = ON_EVEN_PIXEL;
  user.e.topvx = 8;
  user.e.topvy = 10;
  user.shield = 0;
  user.last_moved = 0;
  shoot_type = 1;
  user.speed = DEFAULT_USER_SPEED;
  center_user();
}

void init_user_level() {
  user.e.w = 5;
  user.e.h = 14;
  user.e.vx = 0;
  user.e.vy = 0;
  user.e.ax = 0;
  user.e.ay = 0;
  user.dead = 0;
  set_hostility(ON);
}

//******************************************************************************
//
//
//******************************************************************************
long get_last_moved_user() {
  return user.last_moved;
}

u8 get_user_max_shots() {
  return user.max_shots;
}
u8 get_user_speed() {
  return user.speed;
}
u8 get_user_lives() {
  return user.lives;
}
u8 get_user_dead() {
  return user.dead;
}

void update_user() {

  user.e.ax = 0;

  // Scan Keyboard
  cpct_scanKeyboard_f();

  //
  // Check possible keys to press, and do actions
  //

  // KEY = Up or Down
  if ((cpct_isKeyPressed(Key_Q)) || (cpct_isKeyPressed(Key_CursorUp)) || (cpct_isKeyPressed(Joy0_Up))) {
    user.e.ay = -2;
  } else if ((cpct_isKeyPressed(Key_A)) || (cpct_isKeyPressed(Key_CursorDown)) || (cpct_isKeyPressed(Joy0_Down))) {
    user.e.ay = 2;
  }
  // KEY =  Right or Left
  if ((cpct_isKeyPressed(Key_P)) || (cpct_isKeyPressed(Key_CursorRight)) || (cpct_isKeyPressed(Joy0_Right))) {
    user.e.ax = 2;
    user.e.frame = 2;
  } else if ((cpct_isKeyPressed(Key_O)) || (cpct_isKeyPressed(Key_CursorLeft)) || (cpct_isKeyPressed(Joy0_Left))) {
    user.e.ax = -2;
    user.e.frame = 1;
  } else
    user.e.frame = 0;

  // KEY = Space
  if ((cpct_isKeyPressed(Key_Space)) || (cpct_isKeyPressed(Joy0_Fire1))) {
    create_shot(user.e.x + 4, user.e.y, shoot_type);
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
  user.last_moved = get_time();
}

void draw_user(u8* screen) {
  u8* pscreen;

  if (!user.dead) {
    pscreen = cpct_getScreenPtr(screen, user.e.x / 2, user.e.y);

    if (user.e.x & 1) {
      shiftSpritePixelsRightToBuffer((u8*) user.e.sprite_set[user.e.frame], user.e.w * user.e.h);
      cpct_drawSprite( (u8*) sprite_buffer, pscreen, user.e.w, user.e.h);
    } else
      cpct_drawSprite( (u8*) user.e.sprite_set[user.e.frame], pscreen, user.e.w, user.e.h);
  }
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
u8 check_collision_user(u8 x, u8 y, u8 w, u8 h) {
  u8 collision = 0;

  if (!user.dead) {
    if (fast_collision(x, y, (w * 2) - 1, h, user.e.x, user.e.y, (user.e.w * 2) - 1, user.e.h)) {
      collision = 1;
      create_explosion(user.e.x + user.e.w, user.e.y, 0);
      user.lives--;
      user.dead = 1;
      set_hostility(OFF);
    }
  }
  return collision;
}
