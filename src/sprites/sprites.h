#ifndef _SPRITES_H_
#define _SPRITES_H_

#include <types.h>
#include "../entities/entities.h"
#include "baddie_fly.h"
#include "baddie_ship.h"
#include "baddie_bird.h"
#include "baddie_ball.h"
#include "ship00.h"

extern const u8 palette[16];
extern const u8 bullet01_0[8];
extern const u8 bullet01_1[8];
extern const u8 bullet02_0[4];
extern const u8 G_shoot_00[4];
extern const u8 G_shoot_00[4];
extern const u8 G_shoot_00[4];
extern const u8 G_baddie05_00[9*5];
extern const u8 G_baddie05_01[9*5];
extern const u8 G_baddie05_02[9*5];
extern const u8 G_baddie05_03[9*5];
extern const u8 G_baddie05_04[9*5];
extern const u8 G_baddie05_05[9*5];
extern const u8 G_baddie05_06[9*5];
extern const u8 G_baddie05_07[9*5];
extern const u8 toque000[2*8];
extern const u8 toque001[2*8];
extern const u8 toque002[2*8];
extern const u8 toque003[2*8];
extern const u8 toque004[2*8];
extern const u8 G_explosion_8x8_00[32];
extern const u8 G_explosion_8x8_01[32];
extern const u8 G_explosion_8x8_02[32];
extern const u8 G_explosion_8x8_03[32];
extern const u8 G_explosion_8x8_04[32];
extern const u8 G_explosion_8x8_10[32];
extern const u8 G_explosion_8x8_11[32];
extern const u8 G_explosion_8x8_12[32];
extern const u8 G_explosion_8x8_13[32];
extern const u8 G_explosion_8x8_14[32];
extern const u8 G_heart[15];
extern const u8 G_green_flag[10];
extern const u8 G_red_flag[10];
extern const u8 G_skull_still[48];
extern const u8 G_skull_left_00[48];
extern const u8 G_skull_left_01[48];
extern const u8 G_skull_right_00[48];
extern const u8 G_skull_right_01[48];
extern const u8 G_baddie_shot_00[8];
extern const u8 G_baddie_shot_01[6];
extern const u8 G_baddie_shot_02[2];

extern const u8 sprite_buffer[84];

u8 inside_screen(i16 x, i16 y, u8 w, u8 h);
void shiftSpritePixelsRightToBuffer(u8* sprite, u8 size);
void shiftSpritePixelsRight(u8* sprite, u8 size);
void shiftSpritePixelsLeft(u8* sprite, u8 size);
void shiftSprite(TEntity *e);

#endif


