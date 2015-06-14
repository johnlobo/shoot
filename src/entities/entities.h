#include <types.h>

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
   u8   *npscreen;  // Pointer the next Screen Video memory location where entity will be drawn
   u8   x, y;  // X, Y coordinates of entity in the screen (in bytes)
   u8   w, h;
   u8   nx, ny;  // Next X, Y coordinates of entity in the screen (in bytes)
   u8   pw, ph;  // Previous Width and height of the entity (depending on animation). Used to erase it
   i8	   vx, vy;
   u8   draw;  // Flag to be set when the entity needs to be drawn again
} TEntity;
