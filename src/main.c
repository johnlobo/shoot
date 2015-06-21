//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <stdio.h>
#include <cpctelera.h>
#include "entities/entities.h"
#include "sprites/sprites.h"
#include "starfield/starfield.h"
#include "random/random.h"
#include "util/util.h"

#define SCR_VMEM  (u8*)0xC000
#define SCR_BUFF  (u8*)0x8000

// Background information
// Starting screen coordinates of the top-left pixel (in bytes)
// Width and Height of the background (in tiles)
#define BACK_X  0
#define BACK_Y  0
#define BACK_W  64
#define BACK_H  199


///////////////////////////////////////////////////////////////////////////////////////
// Global variables
//

TBlock block01,block02;
TEntity user;
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
// Draws a sprite
//

     void draw_sprite(u8* screen){
       u8* pscreen;
       pscreen = cpct_getScreenPtr(screen, user.x, user.y);
       cpct_drawSprite(ship01,pscreen,user.w,user.h);
     }
/////////////////////////////////////////////////////////////////////////
// Draws a block
//

     void draw_blocks(u8* screen){
       u8* pscreen;

       pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
       cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);

     }

/////////////////////////////////////////////////////////////////////////
// Clears screen
//
     void clear_screen(u8* screen){
       cpct_memset(screen, 0x00, 0x4000);   
     }

/////////////////////////////////////////////////////////////////////////
// Update blocks position
//

     void updateBlock(){
      if (block01.vx<128){
        if ((block01.x+block01.vx)<(80-block01.w)){
          block01.x = block01.x + block01.vx;
        }
        else{
          block01.x = 79-block01.w;
          block01.vx = - block01.vx;
        }
      } else {
        if (( (i8) (block01.x+block01.vx))>0){
          block01.x = block01.x + block01.vx;
        }
        else{
          block01.x = 0;
          block01.vx = - block01.vx;
        }
      }
    }

////////////////////////////////////////////////////////////////////////////////
// Scan Keyboard and update user actions as requested by the user
//
void updateUser() {
   // Scan Keyboard
 cpct_scanKeyboard_f();

   //
   // Check possible keys to press, and do actions
   //

   // KEY = Cursor Up
 if ((cpct_isKeyPressed(Key_CursorUp))){ 
  if ((user.y-user.vy)>0)
    user.y = user.y - user.vy;
  else
    user.y = 0;
}
   // KEY = Cursor Right
if ((cpct_isKeyPressed(Key_CursorRight))){ 
  if ((user.x+user.vx<(79-user.w)))
    user.x = user.x + user.vx;
  else     
    user.x = 79-user.w;
}
   // KEY = Cursor Left
if (cpct_isKeyPressed(Key_CursorLeft)){
  if ((user.x-user.vx)>0) 
    user.x = user.x - user.vx;    
  else
    user.x = 0;
}
   // KEY = Cursor Down
if (cpct_isKeyPressed(Key_CursorDown)){
  if ((user.y<(199-user.h) ))
    user.y = user.y + user.vy;
  else
    user.y = 199-user.h;
}

  // KEY = Space
if (cpct_isKeyPressed(Key_Space)){
  // Scan Keyboard
  cpct_scanKeyboard_f();
  
  while(!cpct_isKeyPressed(Key_P)){
    // Scan Keyboard
    cpct_scanKeyboard_f();
  }
}

}

/////////////////////////////////////////////////////////////////////////
// Initialization
//

void initialization(){

  pvmem = SCR_BUFF;

  if (ESTRELLAS_ACTIVADAS)
    inicializarEstrellas();

  block01.x = 50;
  block01.y = 10;
  block01.vx = 2;
  block01.vy = 0;
  block01.w = 20;
  block01.h = 40;

  block02.x = 15;
  block02.y = 15;
  block02.vx = 4;
  block02.vy = 0;
  block02.w = 25;
  block02.h = 20;
  
  user.x = 39;
  user.y = 183;
  user.w = 6;
  user.h = 16;
  user.vx = 2;
  user.vy = 4;

    //tintas para los textos
  cpc_SetInkGphStr(0,0);
  cpc_SetInkGphStr(1,2);
  cpc_SetInkGphStr(2,8);
  cpc_SetInkGphStr(3,42);

}

/////////////////////////////////////////////////////////////////////////
// main
//

void main(void) {

  // Reubico el stack
  set_stack(0x1000);

   cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   //cpct_fw2hw       (G_palette, 16);   // Convert Firmware colours to Hardware colours 
   cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
   cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
   cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)

   // Clean up Screen and BackBuffer filling them up with 0's
   cpct_memset(SCR_VMEM, 0x00, 0x4000);
   cpct_memset(SCR_BUFF, 0x00, 0x4000);

   initialization(); 
   
   // Loop forever
   while (1){

    clear_screen(pvmem);
      //#include <stdlib.h>drawFrame(pvmem);
    updateUser();
    updateBlock();
    if (ESTRELLAS_ACTIVADAS){
     moverEstrellas();
     pintarEstrellas(pvmem);
   }
   
   //draw_blocks(pvmem);

   draw_sprite(pvmem);

   pvmem = changeVideoMemoryPage();

      // Synchronize next frame drawing with VSYNC
   cpct_waitVSYNC();
 } 

}
