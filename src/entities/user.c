#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h" 

TShip user;
u8 shoot_type;

void init_user(){

    user.w = 4;
    user.h = 8;
    user.x = 39-(user.w/2);
    user.y = 199-(user.h);
    user.vx = 0;
    user.vy = 0;
    user.topvx = 4;
    user.topvy = 5;
    user.ax=0;
    user.ay=0;
    user.sprite = (u8*) G_ship_00;

    user.max_shoots = 10;
    shoot_type = 1;
}

u8 get_user_max_shoots(){
	return user.max_shoots;
}

void update_user() {
      u8 x,y;

      user.ax=0;

   // Scan Keyboard
     cpct_scanKeyboard_f();

   //
   // Check possible keys to press, and do actions
   //

   // KEY = Cursor Up
     if ((cpct_isKeyPressed(Key_Q))){ 
        user.ay = -2;
    }
   // KEY = Cursor Right
    if ((cpct_isKeyPressed(Key_P))){ 
        user.ax = 2;
    }
   // KEY = Cursor Left
    if (cpct_isKeyPressed(Key_O)){
        user.ax=-2;    
    }
   // KEY = Cursor Down
    if (cpct_isKeyPressed(Key_A)){
        user.ay=2;    
    }
    // KEY = D
    if (cpct_isKeyPressed(Key_D)){
        shoot_type=(shoot_type+1)%2;
      }
    // KEY = H
    if (cpct_isKeyPressed(Key_H)){
        create_enemy((rand()%80),(rand()%199),(rand()%3));
      }
    // KEY = J
    if (cpct_isKeyPressed(Key_J)){
        x=rand()%80;
        y=rand()%199;
        create_enemy(x,y,(rand()%3));
        create_enemy(x+8,y,(rand()%3));
        create_enemy(x+16,y,(rand()%3));
      }  
    // KEY = K
    if (cpct_isKeyPressed(Key_K)){
        create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
      }
    // KEY = Space
    if (cpct_isKeyPressed(Key_Space)){
        create_shoot(user.x+2, user.y, shoot_type);
      }

    // KEY = L
    if (cpct_isKeyPressed(Key_L)){
        create_explosion(user.x+2, user.y, shoot_type);
      }

    if (user.ax!=0){
      if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
        user.vx+=user.ax;
      }
    }

    if (user.vx>0){
      user.vx--;
    } else if (user.vx<0){
      user.vx++;
    }

    user.x+=user.vx;

    if (user.x<0)
      user.x=0;
    else if (user.x> 79-user.w){
      user.x = 79-user.w;
    }
  }

void draw_user(u8* screen){
	u8* pscreen;
    pscreen = cpct_getScreenPtr(screen, user.x, user.y);
    cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
}