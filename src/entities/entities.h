#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#define MODE 0 
#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 200

#define SHOOT_JUMP 10
#define SALTO_DISPARO_MALO 4
#define MAX_SHOOTS 10

#define MAX_ENEMIES 30
#define MAX_ENEMY_GROUPS 4
#define ENEMY_GAP 3

#define MAX_EXPLOSIONES 30

#define MAX_WAYPOINTS 20

//
// Information for solid objects that occupy a rectangular space in the screen
//
typedef struct {
   u8	x, y;
   u8	vx, vy;
   u8   w, h;   // Width and height in bytes
   u8 colour;   // Colour pattern use for drawing
} TBlock;

typedef struct 
{
   u8 x;
   u8 y;
} TWaypoint;

typedef struct 
{
   u8 dir;
   i8 vx,vy;
   u8 num_steps;
} TStage;

typedef struct 
{
   u8 num_stages;
   TStage stages[8];
} TMovement;

typedef struct
{
   u8 waypoints;
   TWaypoint wp[MAX_WAYPOINTS];
   u8 vx[MAX_WAYPOINTS];
   u8 vy[MAX_WAYPOINTS];
} TTrajectory;

typedef struct 
{
   u8 active;
   i16 x,y;
   u8 enemy_type;
   u8 num_enemies;
   u8 sleep;
}TEnemy_group;

typedef struct  {
   u8	*pscreen;  // Pointer to Screen Video memory location where entity will be drawn
   u8 *npscreen;  // Pointer the next Screen Video memory location where entity will be drawn
   u8 *sprite;
   i8 x; 
   u8 y;  // X, Y coordinates of entity in the screen (in bytes)
   i8 vx,vy;
   i8 topvx, topvy;
   i8 ax,ay;
   u8 w, h;
   u8 nx, ny;  // Next X, Y coordinates of entity in the screen (in bytes)
   u8 pw, ph;  // Previous Width and height of the entity (depending on animation). Used to erase it
   u8 draw;  // Flag to be set when the entity needs to be drawn again
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
   long lastmoved;
// u8 objetivox;
} TShoot;

//ENEMY
typedef  struct {    // minimun sprite structure
   char *sprite[8];     //2 bytes   01
   i16 x,y;
   u8 w;
   u8 h;
   u8 dir;
   u8 active;
   u8 num_frames;
   u8 frame;
   u8 speed;
   u8 trajectory;
   u8 trajectory_step;
   u8 movement;
   u8 stage;
   u8 stage_step;
   long lastmoved;
// u8 objetivox;
} TEnemy;

//EXPLOSION
typedef struct {
   u8 tipo;
   u8 fase;
   u8 activo;
   u8 x;
   u8 y; //2 bytes 89   current coordinates
   u8 h;
   u8 w;
   u8* memoriaPantalla[2];
   u8 speed;
   long lastmoved;
} TIPO_EXPLOSION;

extern const TTrajectory trajectories[1];
extern const TMovement movements[2];

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  PUBLIC UTILITY FUNCTIONS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

//SHOOTS
void init_shoots();
void create_shoot(u8 x, u8 y, u8 type);
void update_shoots();
void draw_shoots(u8* screen);
//ENEMIES
void init_enemies();
void create_enemy(i16 x, i16 y, u8 type);
void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies);
void update_enemies();
void draw_enemies(u8* screen);
//USER
void init_user();
u8 get_user_max_shoots();
void update_user();
void draw_user(u8* screen);
//EXPLOSIONES
void init_explosions();
void create_explosion(u8 tipo, u8 x, u8 y);
void update_explosions();
void draw_explosions(u8* screen);

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  UTILITY GLOBALS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

#endif
