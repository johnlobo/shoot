#include <stdio.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"

TIPO_EXPLOSION stars[MAX_STARS];
u8 active_stars;
u8 *star_sprites[6];
long stars_last_updated;
long star_counter;

//
//STARS
//

//******************************************************************************
// Función: init_stars()
//
//******************************************************************************
void init_stars() {
	u8 i = 0;

	for (i = 0; i < MAX_STARS; i++) {
		stars[i].activo = 0;
		stars[i].fase = 0;
		stars[i].x = 0;
		stars[i].y = 0;
		stars[i].h = 0;
		stars[i].w = 0;
		stars[i].last_moved = 0;
	}
	active_stars = 0;
	stars_last_updated = 0;
	star_counter = 0;
	star_sprites[0] = (u8*) G_star_00;
	star_sprites[1] = (u8*) G_star_01;
	star_sprites[2] = (u8*) G_star_02;
	star_sprites[3] = (u8*) G_star_03;
	star_sprites[4] = (u8*) G_star_04;
	star_sprites[5] = (u8*) G_star_05;
}
//******************************************************************************
// Función: create_star(u8 x, u8 y)
//
//******************************************************************************
void create_star(u8 x, u8 y) {
	u8 i = 0;

	while (stars[i].activo) {
		i++;
	} //buscar explosion no activa disponible

	stars[i].activo = 1;
	stars[i].fase = 0;
	stars[i].x = x;
	stars[i].y = y;
	stars[i].w = 4;
	stars[i].h = 8;
	stars[i].speed = 200;
	active_stars++;
}

//******************************************************************************
// Función: void update_stars()
//
//******************************************************************************
void update_stars() {
	u8 i = 0;
	star_counter++;
	if (active_stars) {
		for (i = 0; i < MAX_STARS; i++) {
			if ((stars[i].activo) && ((star_counter - stars[i].last_moved) > STARS_SPEED)) {
				stars[i].last_moved = star_counter;
				if (stars[i].fase < 5) {
					stars[i].fase++;
				}
				else {
					//delete star
					stars[i].activo = 0;
					active_stars--;
				}

			}
		}
	}

}

//******************************************************************************
// Función: draw_stars(u8* screen)
//
//******************************************************************************
void draw_stars(u8* screen) {
	u8 i;
	u8 *pscreen;

	i = 0;

	if (active_stars) {
		for (i = 0; i < MAX_STARS; i++) {
			if (stars[i].activo) {
				pscreen = cpct_getScreenPtr(screen, stars[i].x, stars[i].y);
				cpct_drawSprite((u8*) star_sprites[5], pscreen, stars[i].w, stars[i].h);
				cpct_drawSprite((u8*) star_sprites[stars[i].fase], pscreen, stars[i].w, stars[i].h);
			}
		}
	}
}

u8 get_active_stars(){
	return active_stars;
}
