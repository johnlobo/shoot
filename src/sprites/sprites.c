#include <cpctelera.h>
#include "../entities/entities.h"

const u8 palette[16] = {
	0x00, 0x0D, 0x01, 0x02, 0x04, 0x0E, 0x0B, 0x14,
	0x09, 0x0C, 0x12, 0x03, 0x06, 0x0F, 0x18, 0x1A
};

const u8 bullet01_0[8] = {
	0x0F,
	0x0F,
	0x0F,
	0x00,
	0x15,
	0x2A,
	0x15,
	0x2A
};

const u8 bullet01_1[8] = {
	0x0F,
	0x0F,
	0x0F,
	0x00,
	0x2A,
	0x15,
	0x2A,
	0x15
};
const u8 bullet02_0[4] = {
	0x2A,
	0x2A,
	0x2A,
	0x2A
};


const u8 G_ship_00[40] = {
	0x00, 0x14, 0x28, 0x00, 0x00,
	0x00, 0x14, 0x28, 0x00, 0x00,
	0x00, 0x14, 0x28, 0x00, 0x00,
	0x00, 0x14, 0x28, 0x00, 0x00,
	0xA8, 0x3C, 0x3C, 0x54, 0x00,
	0x3C, 0x2D, 0x1E, 0x3C, 0x00,
	0x28, 0x3C, 0x3C, 0x14, 0x00,
	0x00, 0x15, 0x22, 0x00, 0x00
};


const u8 G_ship_01[40] = {
	0x00, 0x14, 0xA8, 0x00, 0x00,
	0x00, 0x44, 0xA0, 0x00, 0x00,
	0x00, 0x44, 0xA0, 0x00, 0x00,
	0x00, 0x44, 0xA0, 0x00, 0x00,
	0x28, 0xCC, 0xF0, 0x54, 0x00,
	0x0C, 0x89, 0x5A, 0xF0, 0x00,
	0x08, 0xD8, 0xF0, 0x50, 0x00,
	0x00, 0x15, 0x22, 0x00, 0x00
};


const u8 G_ship_02[40] = {
	0x00, 0x54, 0x28, 0x00, 0x00,
	0x00, 0x50, 0x88, 0x00, 0x00,
	0x00, 0x50, 0x88, 0x00, 0x00,
	0x00, 0x50, 0x88, 0x00, 0x00,
	0xA8, 0xF0, 0xCC, 0x54, 0x00,
	0xF0, 0xA5, 0x46, 0x0C, 0x00,
	0xA0, 0xF0, 0xE4, 0x04, 0x00,
	0x00, 0x11, 0x2A, 0x00, 0x00
};


const u8 G_shoot_00[4] = {
	0x7B,
	0xB7,
	0x7B,
	0xB7
};


const u8 G_shoot_01[4] = {
	0xA2,
	0x2A,
	0x2A,
	0x2A
};


const u8 G_shoot_02[4] = {
	0x51,
	0x15,
	0x15,
	0x15
};


const u8 G_baddie03_00[40] = {
	0x00, 0xF0, 0xF0, 0x00, 0x00,
	0x50, 0x3F, 0x3F, 0xA0, 0x00,
	0x15, 0x3F, 0x3F, 0x2A, 0x00,
	0x3F, 0x7A, 0xB5, 0x3F, 0x00,
	0x3F, 0x50, 0xA0, 0x3F, 0x00,
	0xA2, 0x50, 0xA0, 0x51, 0x00,
	0xA2, 0x50, 0xA0, 0x51, 0x00,
	0x00, 0x54, 0xA8, 0x00, 0x00
};


const u8 G_baddie03_01[40] = {
	0x51, 0x3F, 0x2A, 0x00, 0x00,
	0x51, 0x3F, 0x7A, 0x00, 0x00,
	0x00, 0x00, 0x3F, 0xA0, 0x00,
	0x00, 0x50, 0xB5, 0xA0, 0x00,
	0x00, 0xF0, 0xB5, 0x2A, 0x00,
	0x54, 0xF0, 0xB5, 0x2A, 0x00,
	0x54, 0xF0, 0x00, 0x2A, 0x00,
	0x54, 0xA8, 0x00, 0xA2, 0x00
};


const u8 G_baddie03_02[40] = {
	0x51, 0xB7, 0x2A, 0x00, 0x00,
	0x00, 0x15, 0x3F, 0xA0, 0x00,
	0x00, 0x00, 0xB5, 0x7A, 0x00,
	0xF8, 0xF0, 0xB5, 0x7A, 0x00,
	0xF8, 0xF0, 0xB5, 0x7A, 0x00,
	0x00, 0x00, 0xB5, 0x7A, 0x00,
	0x00, 0x15, 0x3F, 0xA0, 0x00,
	0x51, 0xB7, 0x2A, 0x00, 0x00
};


const u8 G_baddie03_03[40] = {
	0x54, 0xA8, 0x00, 0xA2, 0x00,
	0x54, 0xF0, 0x00, 0x2A, 0x00,
	0x54, 0xF0, 0xB5, 0x2A, 0x00,
	0x00, 0xF0, 0xB5, 0x2A, 0x00,
	0x00, 0x50, 0xB5, 0xA0, 0x00,
	0x00, 0x00, 0x3F, 0xA0, 0x00,
	0x51, 0x3F, 0x7A, 0x00, 0x00,
	0x51, 0x3F, 0x2A, 0x00, 0x00
};


const u8 G_baddie03_04[40] = {
	0x00, 0x54, 0xA8, 0x00, 0x00,
	0xA2, 0x50, 0xA0, 0x51, 0x00,
	0xA2, 0x50, 0xA0, 0x51, 0x00,
	0x3F, 0x50, 0xA0, 0x3F, 0x00,
	0x3F, 0x7A, 0xB5, 0x3F, 0x00,
	0x15, 0x3F, 0x3F, 0x2A, 0x00,
	0x50, 0x3F, 0x3F, 0xA0, 0x00,
	0x00, 0xF0, 0xF0, 0x00, 0x00
};


const u8 G_baddie03_05[40] = {
	0x51, 0x00, 0x54, 0xA8, 0x00,
	0x15, 0x00, 0xF0, 0xA8, 0x00,
	0x15, 0x7A, 0xF0, 0xA8, 0x00,
	0x15, 0x7A, 0xF0, 0x00, 0x00,
	0x50, 0x7A, 0xA0, 0x00, 0x00,
	0x50, 0x3F, 0x00, 0x00, 0x00,
	0x00, 0xB5, 0x3F, 0xA2, 0x00,
	0x00, 0x15, 0x3F, 0xA2, 0x00
};


const u8 G_baddie03_06[40] = {
	0x00, 0x15, 0x7B, 0xA2, 0x00,
	0x50, 0x3F, 0x2A, 0x00, 0x00,
	0xB5, 0x7A, 0x00, 0x00, 0x00,
	0xB5, 0x7A, 0xF0, 0xF4, 0x00,
	0xB5, 0x7A, 0xF0, 0xF4, 0x00,
	0xB5, 0x7A, 0x00, 0x00, 0x00,
	0x50, 0x3F, 0x2A, 0x00, 0x00,
	0x00, 0x15, 0x7B, 0xA2, 0x00
};


const u8 G_baddie03_07[40] = {
	0x00, 0x15, 0x3F, 0xA2, 0x00,
	0x00, 0xB5, 0x3F, 0xA2, 0x00,
	0x50, 0x3F, 0x00, 0x00, 0x00,
	0x50, 0x7A, 0xA0, 0x00, 0x00,
	0x15, 0x7A, 0xF0, 0x00, 0x00,
	0x15, 0x7A, 0xF0, 0xA8, 0x00,
	0x15, 0x00, 0xF0, 0xA8, 0x00,
	0x51, 0x00, 0x54, 0xA8, 0x00
};




const u8 G_star_00[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x14, 0xBC, 0x00,
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};


const u8 G_star_01[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x14, 0xB4, 0x00,
	0x00, 0x78, 0xF8, 0x28,
	0x00, 0x14, 0xB4, 0x00,
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};


const u8 G_star_02[32] = {
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x28, 0xA0, 0x28,
	0x00, 0x14, 0x14, 0x00,
	0x14, 0xA0, 0xA8, 0xB4,
	0x00, 0x14, 0x14, 0x00,
	0x00, 0x28, 0xA0, 0x28,
	0x00, 0x00, 0x28, 0x00,
	0x00, 0x00, 0x00, 0x00
};


const u8 G_star_03[32] = {
	0x14, 0x00, 0xA0, 0x14,
	0x00, 0xA0, 0x00, 0xA0,
	0x00, 0x00, 0x00, 0x00,
	0x50, 0x00, 0x00, 0x50,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0xA0, 0x00, 0xA0,
	0x14, 0x00, 0xA0, 0x14,
	0x00, 0x00, 0x28, 0x00
};


const u8 G_star_04[32] = {
	0x14, 0x00, 0xA0, 0x14,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x50, 0x00, 0x00, 0x50,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x14, 0x00, 0x00, 0x14,
	0x00, 0x00, 0xA0, 0x00
};

const u8 G_star_05[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
};


/* Name    : toque */
const u8 toque000[18] =
{
	2,   8, 		 /* Width x Height */
	/* pixels */
	64, 128,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0
};
/* Name    : toque */
const u8 toque001[18] =
{
//	  2,   8, 		 /* Width x Height */
	/* pixels */
	64, 128,
	0,   0,
	64,   0,
	0, 128,
	64,  64,
	0,   0,
	0,   0,
	0,   0
};
/* Name    : toque */
const u8 toque002[18] =
{
//	  2,   8, 		 /* Width x Height */
	/* pixels */
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	64,   0,
	128, 128,
	0,  64,
	0,   0
};
/* Name    : toque */
const u8 toque003[18] =
{
//	  2,   8, 		 /* Width x Height */
	/* pixels */
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	128,   0,
	0,  64
};

const u8 toque004[18] =
{
//	  2,   8, 		 /* Width x Height */
	/* pixels */
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0,
	0,   0
};


const u8 G_explosion_8x8_00[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x11, 0x00, 0x00,
	0x00, 0x51, 0x33, 0x00,
	0x00, 0xE7, 0x2A, 0x00,
	0x00, 0x00, 0x22, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};


const u8 G_explosion_8x8_01[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0xA2, 0x11, 0x00,
	0x00, 0x15, 0xA2, 0x00,
	0x00, 0x51, 0xB3, 0x00,
	0x00, 0x67, 0x2A, 0x00,
	0x00, 0x11, 0x51, 0x00,
	0x00, 0x00, 0x00, 0x00
};


const u8 G_explosion_8x8_02[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x9B, 0x00, 0x00, 0x22,
	0x00, 0xA2, 0x11, 0x00,
	0x00, 0x15, 0xA2, 0x00,
	0x00, 0x51, 0x51, 0x8A,
	0x00, 0x2A, 0x2A, 0x11,
	0x11, 0x51, 0x51, 0x00,
	0x00, 0x11, 0x00, 0x00
};


const u8 G_explosion_8x8_03[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x9B, 0x00, 0x00, 0x22,
	0x00, 0x2A, 0x15, 0x00,
	0x00, 0x51, 0x00, 0x00,
	0x00, 0x00, 0xA2, 0xA2,
	0x00, 0x2A, 0x00, 0x11,
	0x00, 0x15, 0x45, 0x00,
	0x22, 0x51, 0x00, 0x22
};


const u8 G_explosion_8x8_04[32] = {
	0x00, 0x00, 0x00, 0x00,
	0x8A, 0x00, 0x00, 0xA2,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x2A, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x45,
	0x00, 0x51, 0x00, 0x00,
	0x22, 0x00, 0x00, 0x00
};


const u8 G_explosion_8x8_10[32] = {
	0x00, 0x11, 0x22, 0x00,
	0x00, 0x33, 0x33, 0x00,
	0x11, 0x33, 0xF3, 0x22,
	0x11, 0x73, 0xF3, 0x33,
	0x11, 0xF3, 0x3F, 0x33,
	0x11, 0xF3, 0x7B, 0x22,
	0x00, 0x33, 0x33, 0x00,
	0x00, 0x11, 0x22, 0x00
};


const u8 G_explosion_8x8_11[32] = {
	0x00, 0x11, 0x22, 0x00,
	0x00, 0x33, 0x33, 0x00,
	0x11, 0x73, 0xB3, 0x22,
	0x11, 0xB7, 0x3F, 0x33,
	0x11, 0xB7, 0x3F, 0xB3,
	0x11, 0xB7, 0x2A, 0xA2,
	0x00, 0x33, 0xF3, 0x00,
	0x00, 0x11, 0x22, 0x00
};


const u8 G_explosion_8x8_12[32] = {
	0x00, 0x11, 0x22, 0x00,
	0x00, 0x73, 0xB3, 0x00,
	0x11, 0xB7, 0x7B, 0x22,
	0x51, 0x3F, 0x15, 0xA2,
	0x51, 0x2A, 0x00, 0x2A,
	0x11, 0x2A, 0x00, 0xA2,
	0x00, 0x37, 0x7B, 0x00,
	0x00, 0x51, 0x00, 0x00
};


const u8 G_explosion_8x8_13[32] = {
	0x00, 0x45, 0x8A, 0x00,
	0x00, 0x37, 0x3B, 0x00,
	0x45, 0x2A, 0x15, 0xA2,
	0x15, 0x00, 0x00, 0xA2,
	0x15, 0x00, 0x00, 0x00,
	0x51, 0x2A, 0x00, 0xA2,
	0x00, 0xA2, 0x51, 0x00,
	0x00, 0x51, 0x00, 0x00
};


const u8 G_explosion_8x8_14[32] = {
	0x00, 0x11, 0x00, 0x00,
	0x00, 0x00, 0x11, 0x00,
	0x00, 0x00, 0x00, 0x8A,
	0x45, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0xA2,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x51, 0x00, 0x00
};


const u8 G_heart[15] = {
	0x51, 0x11, 0x00,
	0xB3, 0x33, 0x22,
	0x11, 0x33, 0x00,
	0x00, 0x22, 0x00,
	0x00, 0x22, 0x00
};


const u8 G_green_flag[10] = {
	0x00, 0xD7,
	0x41, 0x57,
	0x83, 0x57,
	0x00, 0x55,
	0x00, 0x55
};


const u8 G_red_flag[10] = {
	0x00, 0x77,
	0x11, 0x77,
	0x33, 0x77,
	0x00, 0x55,
	0x00, 0x55
};


const u8 G_skull_still[40] = {
	0x00, 0xFF, 0xFF, 0xAA, 0x00,
	0x55, 0xFF, 0xFF, 0xFF, 0x00,
	0x55, 0xC0, 0xEA, 0xD5, 0x00,
	0x55, 0xFF, 0xFF, 0xFF, 0x00,
	0x55, 0xFF, 0x55, 0xFF, 0x00,
	0x00, 0xFF, 0xFF, 0xAA, 0x00,
	0x00, 0x55, 0x55, 0x00, 0x00,
	0x00, 0x55, 0xFF, 0x00, 0x00
};


const u8 G_skull_left_00[40] = {
	0x55, 0xFF, 0xFF, 0x00, 0x00,
	0xFF, 0xFF, 0xFF, 0xAA, 0x00,
	0xEA, 0x55, 0x80, 0xAA, 0x00,
	0xFF, 0xFF, 0xFF, 0xBB, 0x2A,
	0xFF, 0xAA, 0xFF, 0xBB, 0x2A,
	0x55, 0xFF, 0xFF, 0x73, 0x15,
	0x00, 0xAA, 0xBB, 0xB7, 0x2A,
	0x00, 0xFF, 0xBB, 0x2A, 0x15
};


const u8 G_skull_left_01[40] = {
	0x55, 0xFF, 0xFF, 0x00, 0x00,
	0xFF, 0xFF, 0xFF, 0xAA, 0x00,
	0xEA, 0x55, 0x80, 0xAA, 0x00,
	0xFF, 0xFF, 0xFF, 0xAA, 0x15,
	0xFF, 0xAA, 0xFF, 0xBB, 0x2A,
	0x55, 0xFF, 0xFF, 0x73, 0x15,
	0x00, 0xAA, 0xBB, 0xB3, 0x2A,
	0x00, 0xFF, 0xBB, 0xB7, 0x2A
};


const u8 G_skull_right_00[40] = {
	0x00, 0x00, 0xFF, 0xFF, 0xAA,
	0x00, 0x55, 0xFF, 0xFF, 0xFF,
	0x00, 0x55, 0x40, 0xAA, 0xD5,
	0x15, 0x77, 0xFF, 0xFF, 0xFF,
	0x15, 0x77, 0xFF, 0x55, 0xFF,
	0x2A, 0xB3, 0xFF, 0xFF, 0xAA,
	0x15, 0x7B, 0x77, 0x55, 0x00,
	0x2A, 0x15, 0x77, 0xFF, 0x00
};


const u8 G_skull_right_01[40] = {
	0x00, 0x00, 0xFF, 0xFF, 0xAA,
	0x00, 0x55, 0xFF, 0xFF, 0xFF,
	0x00, 0x55, 0x40, 0xAA, 0xD5,
	0x2A, 0x55, 0xFF, 0xFF, 0xFF,
	0x15, 0x77, 0xFF, 0x55, 0xFF,
	0x2A, 0xB3, 0xFF, 0xFF, 0xAA,
	0x15, 0x73, 0x77, 0x55, 0x00,
	0x15, 0x7B, 0x77, 0xFF, 0x00
};


const u8 G_baddie_shot_00[8] = {
	0x11, 0x22,
	0x73, 0xB3,
	0x73, 0xB3,
	0x11, 0x22
};


const u8 G_baddie_shot_01[6] = {
	0x11, 0x00,
	0x73, 0x22,
	0x11, 0x00
};


const u8 G_baddie_shot_02[2] = {
	0xB3,
	0x33
};


const u8 G_engine_00[2] = {
	0x15, 0x22
};


const u8 G_engine_01[2] = {
	0x11, 0x2A
};


const u8 G_baddie04_00[40] = {
	0x00, 0x10, 0x20, 0x00, 0x00,
	0x00, 0x30, 0x30, 0x00, 0x00,
	0x10, 0x30, 0x30, 0x20, 0x00,
	0x90, 0xB8, 0x74, 0x60, 0x00,
	0x90, 0x30, 0x30, 0x60, 0x00,
	0x40, 0x40, 0x80, 0x80, 0x00,
	0x40, 0x00, 0x00, 0x80, 0x00,
	0x14, 0x00, 0x00, 0x28, 0x00
};


const u8 G_baddie04_01[40] = {
	0x00, 0x90, 0x30, 0x20, 0x00,
	0x40, 0x74, 0x30, 0x20, 0x00,
	0x00, 0x90, 0x30, 0x20, 0x00,
	0x40, 0x10, 0x30, 0x20, 0x00,
	0x28, 0x10, 0xB8, 0x20, 0x00,
	0x00, 0x40, 0x30, 0x00, 0x00,
	0x00, 0x80, 0x60, 0x00, 0x00,
 	0x14, 0x00, 0x80, 0x00, 0x00
};


const u8 G_baddie04_02[40] = {
	0x00, 0x40, 0x80, 0x00, 0x00,
	0x68, 0x90, 0x30, 0x00, 0x00,
	0x00, 0x10, 0xB8, 0x20, 0x00,
	0x00, 0x90, 0x30, 0x30, 0x00,
	0x00, 0x90, 0x30, 0x30, 0x00,
	0x00, 0x10, 0xB8, 0x20, 0x00,
	0x68, 0x90, 0x30, 0x00, 0x00,
	0x00, 0x40, 0x80, 0x00, 0x00,
};


const u8 G_baddie04_03[40] = {
	0x14, 0x00, 0x80, 0x00, 0x00,
	0x00, 0x80, 0x60, 0x00, 0x00,
	0x00, 0x40, 0x30, 0x00, 0x00,
	0x28, 0x10, 0xB8, 0x20, 0x00,
	0x40, 0x10, 0x30, 0x20, 0x00,
	0x00, 0x90, 0x30, 0x20, 0x00,
	0x40, 0x74, 0x30, 0x20, 0x00,
	0x00, 0x90, 0x30, 0x20, 0x00
};


const u8 G_baddie04_04[40] = {
	0x14, 0x00, 0x00, 0x28, 0x00,
	0x40, 0x00, 0x00, 0x80, 0x00,
	0x40, 0x40, 0x80, 0x80, 0x00,
	0x90, 0x30, 0x30, 0x60, 0x00,
	0x90, 0xB8, 0x74, 0x60, 0x00,
	0x10, 0x30, 0x30, 0x20, 0x00,
	0x00, 0x30, 0x30, 0x00, 0x00,
	0x00, 0x10, 0x20, 0x00, 0x00
};


const u8 G_baddie04_05[40] = {
	0x00, 0x40, 0x00, 0x28, 0x00,
	0x00, 0x90, 0x40, 0x00, 0x00,
	0x00, 0x30, 0x80, 0x00, 0x00,
	0x10, 0x74, 0x20, 0x14, 0x00,
	0x10, 0x30, 0x20, 0x80, 0x00,
	0x10, 0x30, 0x60, 0x00, 0x00,
	0x10, 0x30, 0xB8, 0x80, 0x00,
	0x10, 0x30, 0x60, 0x00, 0x00
};


const u8 G_baddie04_06[40] = {
	0x00, 0x40, 0x80, 0x00, 0x00,
	0x00, 0x30, 0x60, 0x94, 0x00,
	0x10, 0x74, 0x20, 0x00, 0x00,
	0x30, 0x30, 0x60, 0x00, 0x00,
	0x30, 0x30, 0x60, 0x00, 0x00,
	0x10, 0x74, 0x20, 0x00, 0x00,
	0x00, 0x30, 0x60, 0x94, 0x00,
	0x00, 0x40, 0x80, 0x00, 0x00,
};


const u8 G_baddie04_07[40] = {
	0x10, 0x30, 0x60, 0x00, 0x00,
	0x10, 0x30, 0xB8, 0x80, 0x00,
	0x10, 0x30, 0x60, 0x00, 0x00,
	0x10, 0x30, 0x20, 0x80, 0x00,
	0x10, 0x74, 0x20, 0x14, 0x00,
	0x00, 0x30, 0x80, 0x00, 0x00,
	0x00, 0x90, 0x40, 0x00, 0x00,
	0x00, 0x40, 0x00, 0x28, 0x00
};


const u8 G_baddie05_00[40] = {
	0x00, 0xC3, 0x03, 0x00,
	0x41, 0x03, 0x03, 0x02,
	0x03, 0x30, 0x30, 0x03,
	0x03, 0x12, 0x21, 0x03,
	0x03, 0x12, 0x21, 0x03,
	0x03, 0x03, 0x03, 0x03,
	0x01, 0x03, 0x03, 0x02,
	0x00, 0x03, 0x03, 0x00
};

const u8 sprite_buffer[40] = {
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00
};





