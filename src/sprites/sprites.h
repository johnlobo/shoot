#ifndef _SPRITES_H_
#define _SPRITES_H_

#include <types.h>
#include "../entities/entities.h"

///////////////////////////////////////////////////////////////////////////////////////
// Palette Definition
//       Palette defined using Firmware Colours (Mode 0, 16 colours + border)


extern const u8 palette[16];
extern const u8 bullet01_0[8];
extern const u8 bullet01_1[8];
extern const u8 bullet02_0[4];


extern const u8 G_N_0[12];
extern const u8 G_N_1[12];
extern const u8 G_N_2[12];
extern const u8 G_N_3[12];
extern const u8 G_N_4[12];
extern const u8 G_N_5[12];
extern const u8 G_ship_00[40];
extern const u8 G_ship_01[40];
extern const u8 G_ship_02[40];
extern const u8 G_shoot_00[4];
extern const u8 G_shoot_00[4];
extern const u8 G_shoot_00[4];
extern const u8 G_baddie03_00[40];
extern const u8 G_baddie03_01[40];
extern const u8 G_baddie03_02[40];
extern const u8 G_baddie03_03[40];
extern const u8 G_baddie03_04[40];
extern const u8 G_baddie03_05[40];
extern const u8 G_baddie03_06[40];
extern const u8 G_baddie03_07[40];
extern const u8 G_star_00[32];
extern const u8 G_star_01[32];
extern const u8 G_star_02[32];
extern const u8 G_star_03[32];
extern const u8 G_star_04[32];
extern const u8 G_star_05[32];
extern const u8 toque000[18];
extern const u8 toque001[18];
extern const u8 toque002[18];
extern const u8 toque003[18];
extern const u8 toque004[18];
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
extern const u8 G_skull_still[40];
extern const u8 G_skull_left_00[40];
extern const u8 G_skull_left_01[40];
extern const u8 G_skull_right_00[40];
extern const u8 G_skull_right_01[40];
extern const u8 G_baddie_shot_00[8];
extern const u8 G_baddie_shot_01[6];
extern const u8 G_baddie_shot_02[2];
extern const u8 G_engine_00[2];
extern const u8 G_engine_01[2];
extern const u8 G_baddie04_00[40];
extern const u8 G_baddie04_01[40];
extern const u8 G_baddie04_02[40];
extern const u8 G_baddie04_03[40];
extern const u8 G_baddie04_04[40];
extern const u8 G_baddie04_05[40];
extern const u8 G_baddie04_06[40];
extern const u8 G_baddie04_07[40];
extern const u8 G_baddie05_00[40];
extern const u8 sprite_buffer[40];

void shiftSpritePixelsRightToBuffer(u8* sprite, u8 size);
void shiftSpritePixelsRight(u8* sprite, u8 size);
void shiftSpritePixelsLeft(u8* sprite, u8 size);
void shiftSprite(TEntity *e);

#endif


