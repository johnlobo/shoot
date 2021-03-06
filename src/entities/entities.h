#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>

//SYSTEM
#define MODE 0
#define SCREEN_WIDTH 159
#define SCREEN_HEIGHT 199
#define SCALE_FACTOR 256
#define MAX_LEVEL 2
#define ON 1
#define OFF 0
//PATTERNS
#define TRANSLATE 0
#define ROTATE  1
#define ROTATE_TO 2
#define TRANSLATE_TO 3
#define TRANSLATE_HOME 4
#define TRANSPORT_TO 5
#define SLEEP 6
//ENEMY STATES
#define ENEMY_STILL 0
#define ENEMY_MOVING 1
#define ENEMY_SLEEP 2
//MATH
#define PIXEL_SCALE 256
//SHOTS
#define SHOOT_JUMP 15
#define SALTO_DISPARO_MALO 4
#define MAX_SHOTS 10
//ENEMIES
#define MAX_ENEMIES 20
#define MAX_ENEMY_GROUPS 4
#define ENEMY_GAP 3
//ENEMY_SHOOTS
#define MAX_ENEMY_SHOTS 20
//EXPLOSIONS
#define MAX_EXPLOSIONES 30
#define EXPLOSIONS_SPEED 20
#define MAX_STARS 10
#define STARS_SPEED 50
//MESSAGES
#define MAX_MESSAGES 10
//USER
#define DEFAULT_USER_LIVES 3
#define DEFAULT_USER_SPEED 13

typedef struct
{
   u8 CMD;
   i16 v;
   i16 x;
   i16 y;
   i16 angle;
   u8 frames;
} TPattern;

typedef struct
{
   u8 num_CMDs;
   u8 repeat;
   TPattern patterns[10];
} TPatternSet;


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
   u8 sleep;
} TPhysics;

typedef struct {
   i16  x,  y;          // Pixel Location
   u8  w,  h;          // Width and height of the entity (in bytes!)
   i8 vx, vy;
   i8 topvx, topvy;
   i8 ax, ay;
   u8 **sprite_set;     // Sprite set
   u8 num_frames;
   u8 frame;
   TShiftStatus shift; // Sprite shifting status (EVEN, ODD)
} TEntity;

typedef struct  {
   TEntity e;
   u8 *sprite;
   u8 max_shots;
   u8 shield;
   u8 lives;
   u32 score;
   u8 speed;
   u8 dead;
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
   i16 x, y;
   i16 obj_x, obj_y;
   u8 w;
   u8 h;
   u8 dir;
   u8 num_frames;
   u8 frame;
   u8 speed;
   i16 home_x, home_y;
   u8 step;
   u8 cur_cmd;
   TPatternSet *patternQueue;
   u8 patternQueuePos;
   TEntity e;
   u8 *sprite[8];
   u8 state;
} TEnemy;

typedef struct
{
   u8 active;
   i16 x, y;
   u8 enemy_type;
   u8 num_enemies;
   u8 sleep;
} TEnemy_group;

//ENEMY SHOOT
typedef  struct {    // minimun sprite structure
   TEntity e;
   TPhysics f;
   u8 active;
   u8 type;
   long last_moved;
// u8 objetivox;
} TEnemy_shot;

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
   u8 delay;
   u8 fixed;
   u8 color;
} TMessage;

extern const TPatternSet pattern01_left, pattern01_right, pattern02_left, pattern02_right, pattern03, pattern04;
extern const TPatternSet attack01;

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////
//////  PUBLIC UTILITY FUNCTIONS
//////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

//SHOOTS
void init_shots();
void create_shot(u8 x, u8 y, u8 type);
void update_shots();
void draw_shots(u8* screen);
u8 get_active_shots();

//ENEMY SHOTS
u8 get_active_enemy_shots();
void init_enemy_shots();
void create_enemy_shot(u8 x, u8 y, u8 type, i16 angle, u8 speed);
void update_enemy_shots();
void draw_enemy_shots(u8* screen);

//ENEMIES
void init_enemies();
void create_enemy(i16 x, i16 y, u8 type, i16 home_x, i16 home_y, u8 pattern);
void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies);
void draw_enemies(u8* screen);
u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h);
u8 get_active_enemies();
u8 get_active_groups();
void update_enemies();
void debug_enemies();
void enemies_full_attack();
void set_hostility(u8 onoff);
u8 get_hostility();

//USER
long get_last_moved_user();
void center_user();
void init_user();
void init_user_level();
u8 get_user_max_shots();
u8 get_user_speed();
u8 get_user_lives();
u8 get_user_dead();
void update_user();
void draw_user(u8* screen);
void set_score(u32 new_score);
void add_score(u16 new_add_score);
u32 get_score();
u8 check_collision_user(u8 x, u8 y, u8 w, u8 h);

//EXPLOSIONES
long get_last_moved_explosions();
void init_explosions();
void create_explosion(u8 x, u8 y, u8 tipo);
void update_explosions();
void draw_explosions(u8* screen);
u8 get_active_explosions();

//STARS
void init_stars();
void create_star(u8 x, u8 y);
void update_stars();
void draw_stars(u8* screen);
u8 get_active_stars();

//MESSAGES
void strcpy(i8* to, const i8* from);
u8 strlen(const char *str);
void blue_message();
void red_message();
void colour_message (u8 backg, u8 t);
void init_messages();
void create_centered_message(u8 y, u8 delay, u8 time, u8 *text, u8 color);
void draw_messages(u8* screen);
void color_test(u8* screen);

//LEVELS
void start_level(u8 lev);
void update_level();
u8 get_end_level();
u8 get_level_max_enemy_shots();

#endif
