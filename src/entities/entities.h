#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#define SHOOT_JUMP 10
#define SALTO_DISPARO_MALO 4
#define MAX_SHOOTS 10

//
// Information for solid objects that occupy a rectangular space in the screen
//
typedef struct {
   u8	x, y;
   u8	vx, vy;
   u8   w, h;   // Width and height in bytes
   u8 colour;   // Colour pattern use for drawing
} TBlock;


typedef struct  {
   u8	*pscreen;  // Pointer to Screen Video memory location where entity will be drawn
   u8 *npscreen;  // Pointer the next Screen Video memory location where entity will be drawn
   u8 *sprite;
   u8   x, y;  // X, Y coordinates of entity in the screen (in bytes)
   u8   w, h;
   u8   nx, ny;  // Next X, Y coordinates of entity in the screen (in bytes)
   u8   pw, ph;  // Previous Width and height of the entity (depending on animation). Used to erase it
   i8	   vx, vy;
   u8   draw;  // Flag to be set when the entity needs to be drawn again
   u8 max_shoots;
} TShip;

//SHOOT
typedef  struct {    // minimun sprite structure
   char *sprite[2];     //2 bytes   01
   u8 x;
   u8 y; 
   u8 w;
   u8 h;
   u8 active;
   u8 num_frames;
   u8 frame;
   u8 speed;
   u8 new;
   u8 dead;
   long lastmoved;
// unsigned char objetivox;
} TShoot;

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  PUBLIC UTILITY FUNCTIONS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
void init_shoots();
void create_shoot(u8 x, u8 y, u8 type);
void update_shoots();
void draw_shoots(u8* screen);

void init_user();
u8 get_user_max_shoots();
void update_user();
void draw_user(u8* screen);


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  UTILITY GLOBALS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////


#endif
