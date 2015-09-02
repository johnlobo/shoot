#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

//SYSTEM
#define MODE 0
#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 200
#define SCALE_FACTOR 256
//PATTERNS
#define TRANSLATE 0
#define ROTATE  1
#define TRANSLATE_TO 2
#define TRANSLATE_HOME 3
//MATH
//#define PI 3.1415926
#define PIXEL_SCALE 256
//SHOOTS
#define SHOOT_JUMP 10
#define SALTO_DISPARO_MALO 4
#define MAX_SHOOTS 10
//ENEMIES
#define MAX_ENEMIES 30
#define MAX_ENEMY_GROUPS 4
#define ENEMY_GAP 2
//EXPLOSIONS
#define MAX_EXPLOSIONES 30
#define EXPLOSIONS_SPEED 20
//MESSAGES
#define MAX_MESSAGES 10

typedef struct
{
   u8 CMD;
   u8 v;
   u8 x;
   u8 y;
   i16 theta;
   i16 max;
   u8 frames;
} TPattern;

typedef struct
{
   u8 num_CMDs;
   TPattern patterns[10];
} TPatternSet;

typedef struct
{
   u8 dir;
   i8 vx, vy;
   u8 num_steps;
} TStage;

typedef struct
{
   u8 num_stages;
   TStage stages[8];
} TMovement;

typedef struct
{
   u8 active;
   i16 x, y;
   u8 enemy_type;
   u8 num_enemies;
   u8 sleep;
} TEnemy_group;

// Struct to note the shifting status of a sprite
typedef enum {
   ON_EVEN_PIXEL = 0,  // Sprite is un-shifted (starts on even pixel)
   ON_ODD_PIXEL  = 1   // Sprite is shifted    (starts on odd pixel)
} TShiftStatus;

typedef struct {
   i32 x;  
   i32 y;   // X, Y coordinates of entity in a subpixel world (in pixels*SCALE)
   u8  v;         // Velocity scalar controlling entity movement (In pixels)
   u8 dir;
   i16 angle;
   i16 acum_angle;

} TPhysics;

typedef struct {
   u8  x,  y;          // Pixel Location
   u8 nx, ny;          // Next pixel location
   u8  w,  h;          // Width and height of the entity (in bytes!)
   u8 **sprite_set;     // Sprite set
   TShiftStatus shift; // Sprite shifting status (EVEN, ODD)
} TEntity;

typedef struct  {
   u8 *sprite;
   i8 x;
   u8 y;  // X, Y coordinates of entity in the screen (in bytes)
   i8 vx, vy;
   i8 topvx, topvy;
   i8 ax, ay;
   u8 w, h;
   u8 max_shoots;
   u8 shield;
   u8 lives;
   u32 score;
   u8 speed;
   u8 engine_state;
   TShiftStatus shift;
   long last_moved;
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
   long last_moved;
// u8 objetivox;
} TShoot;

//ENEMY
typedef  struct {    // minimun sprite structure
   u8 active;
   TPhysics f;
   u8 x, y;
   u8 w;
   u8 h;
   u8 dir;
   u8 num_frames;
   u8 frame;
   u8 speed;
   u8 movement;
   u8 stage;
   u8 stage_step;
   long last_moved;
   u8 home_x;
   u8 home_y;
   u8 step;
   u8 cur_cmd;
   TPatternSet *patternQueue;
   u8 patternQueuePos;
   TEntity e;
   char *sprite[8];     //2 bytes   01
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
   long last_moved;
} TIPO_EXPLOSION;

//MESSAGES
typedef struct {
   u8 active;
   u8 x;
   u8 y; //2 bytes 89   current coordinates
   u8 text[30];
   u8 time;
} TMessage;

extern const TMovement movements[2];
extern const TPatternSet pattern01;

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
void create_enemy(i32 x, i32 y, u8 type);
void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies);
void update_enemies();
void draw_enemies(u8* screen);
u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h);
u8 get_active_enemies();
void update_enemies2(u8* screen);
void debug_enemies(u8* screen);

//USER
long get_last_moved_user();
void init_user();
void user_init_level();
u8 get_user_max_shoots();
u8 get_user_speed();
u8 get_user_dead();
void user_engine(u8* screen);
void update_user();
void draw_user(u8* screen);
void set_score(u32 new_score);
void add_score(u16 new_add_score);
u32 get_score();

//EXPLOSIONES
long get_last_moved_explosions();
void init_explosions();
void create_explosion(u8 x, u8 y, u8 tipo);
void update_explosions();
void draw_explosions(u8* screen);

//MESSAGES
void strcpy(i8* to, const i8* from);
u8 strlen(const char *str);
void blue_message();
void red_message();
void colour_message (u8 backg, u8 t);
void init_messages();
void create_message(u8 x, u8 y, u8 time, u8 *message);
void draw_messages(u8* screen);
void color_test(u8* screen);

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  UTILITY GLOBALS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

#endif
