#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

#define MODE 0 
#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 200

//Patterns
#define TRANSLATE 0
#define ROTATE  1
#define TRANSLATE_TO 2
#define EXIT_LEFT 3
#define EXIT_RIGHT 4
#define ENTER_LEFT 5
#define ENTER_RIGHT 6

#define PI 3.1415926

#define SHOOT_JUMP 10
#define SALTO_DISPARO_MALO 4
#define MAX_SHOOTS 10

#define MAX_ENEMIES 30
#define MAX_ENEMY_GROUPS 4
#define ENEMY_GAP 3

#define MAX_EXPLOSIONES 30
#define EXPLOSIONS_SPEED 30

#define MAX_MESSAGES 10

#define MAX_WAYPOINTS 20

typedef struct
{
   u8 CMD;
   u8 v;
   i8 x;
   f32 theta;
   f32 max;
   u8 frames;
}TPattern;

typedef struct
{
   u8 num_CMDs;
   TPattern patterns[10];
} TPatternSet;

typedef struct 
{
   f32 x;
   f32 y;
   u8 v;
   f32 theta;
   f32 cosine;
   f32 sine;
   f32 dt;
   f32 dtheta;
   void *leader;
   f32 formation_offset;
   TPattern *cur_pattern;
   u8 cur_cmd;
   TPatternSet *patternQueue;
   u8 patternQueuePos;
   u8 alive;
} TEnemy2;

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
   u8 *sprite;
   i8 x; 
   u8 y;  // X, Y coordinates of entity in the screen (in bytes)
   i8 vx,vy;
   i8 topvx, topvy;
   i8 ax,ay;
   u8 w, h;
   u8 max_shoots;
   u8 shield;
   u8 lives;
   u32 score;
   u8 speed;
   u8 engine_state;
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
   long last_moved;
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
u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h);

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

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  UTILITY GLOBALS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

#endif
