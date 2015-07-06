#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"

TShip user;
u8 shoot_type;

void init_user(){
/*
	user.x = 39;
    user.y = 183;
    user.w = 6;
    user.h = 16;
    user.sprite = (u8*) ship01;
*/

    user.w = 6;
    user.h = 16;
    user.x = 39-(user.w/2);
    user.y = 199-(user.h);
    user.sprite = (u8*) ship03;

    user.vx = 2;
    user.vy = 4;
    user.max_shoots = 10;
    shoot_type = 1;
}

u8 get_user_max_shoots(){
	return user.max_shoots;
}

///////////////////////////////////////////////////////////////////////////////
// Scan Keyboard and update user actions as requested by the user
//
    void update_user() {
      u8 x,y;

   // Scan Keyboard
     cpct_scanKeyboard_f();

   //
   // Check possible keys to press, and do actions
   //

   // KEY = Cursor Up
     if ((cpct_isKeyPressed(Key_Q))){ 
      if ((user.y-user.vy)>0)
        user.y = user.y - user.vy;
      else
        user.y = 0;
    }
   // KEY = Cursor Right
    if ((cpct_isKeyPressed(Key_P))){ 
      if ((user.x+user.vx<(79-user.w)))
        user.x = user.x + user.vx;
      else     
        user.x = 79-user.w;
    }
   // KEY = Cursor Left
    if (cpct_isKeyPressed(Key_O)){
      if ((user.x-user.vx)>0) 
        user.x = user.x - user.vx;    
      else
        user.x = 0;
    }
   // KEY = Cursor Down
    if (cpct_isKeyPressed(Key_A)){
      if ((user.y<(199-user.h) ))
        user.y = user.y + user.vy;
      else
        user.y = 199-user.h;
    }
    // KEY = D
    if (cpct_isKeyPressed(Key_D)){
        shoot_type=(shoot_type+1)%2;
      }
    // KEY = H
    if (cpct_isKeyPressed(Key_H)){
        create_enemy((rand()%80),(rand()%199),(rand()%2));
      }
    if (cpct_isKeyPressed(Key_J)){
        x=rand()%80;
        y=rand()%199;
        create_enemy(x,y,(rand()%2));
        create_enemy(x+8,y,(rand()%2));
        create_enemy(x+16,y,(rand()%2));
        create_enemy(x+24,y,(rand()%2));
      }  
    if (cpct_isKeyPressed(Key_K)){
        create_enemy_group((rand()%80),(rand()%199),(rand()%2),4);
      }
    // KEY = Space
    if (cpct_isKeyPressed(Key_Space)){
        create_shoot(user.x+3, user.y-1, shoot_type);
      }

  }

void draw_user(u8* screen){
	u8* pscreen;
    pscreen = cpct_getScreenPtr(screen, user.x, user.y);
    cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
}