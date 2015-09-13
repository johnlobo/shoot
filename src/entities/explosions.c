#include <stdio.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"

//explosiones
TIPO_EXPLOSION explosiones[MAX_EXPLOSIONES];
u8 explosiones_activas;
u8 *explosion_sprite[2][5];
long explosiones_lastUpdated;

TIPO_EXPLOSION stars[MAX_STARS];
u8 active_stars;
u8 *star_sprites[6];
long stars_last_updated;
long star_counter;

//
//EXPLOSIONES
//
//******************************************************************************
// Función: inicializarExplosiones()
//
//******************************************************************************
void init_explosions() {
	u8 i = 0;

	for (i = 0; i < MAX_EXPLOSIONES; i++) {
		explosiones[i].activo = 0;
		explosiones[i].tipo = 0;
		explosiones[i].fase = 0;
		explosiones[i].x = 0;
		explosiones[i].y = 0;
		explosiones[i].h = 0;
		explosiones[i].w = 0;
		explosiones[i].last_moved = 0;
	}
	explosiones_activas = 0;
	explosion_sprite[0][0] = (u8*) G_explosion_8x8_00;
	explosion_sprite[0][1] = (u8*) G_explosion_8x8_01;
	explosion_sprite[0][2] = (u8*) G_explosion_8x8_02;
	explosion_sprite[0][3] = (u8*) G_explosion_8x8_03;
	explosion_sprite[0][4] = (u8*) G_explosion_8x8_04;
	explosion_sprite[1][0] = (u8*) toque000;
	explosion_sprite[1][1] = (u8*) toque001;
	explosion_sprite[1][2] = (u8*) toque002;
	explosion_sprite[1][3] = (u8*) toque003;
}
//******************************************************************************
// Función: crearExplosion(u8 tipo, u8 x, u8 y)
//
//******************************************************************************
void create_explosion(u8 x, u8 y, u8 tipo) {
	u8 i;
	i = 0;
	while (explosiones[i].activo == 1) {
		i++;
	} //buscar explosion no activa disponible
	explosiones[i].activo = 1;
	explosiones[i].tipo = tipo;
	explosiones[i].fase = 0;
	explosiones[i].x = x;
	explosiones[i].y = y;
	//explosiones[i].memoriaPantalla[0] = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
	if (!tipo) {
		explosiones[i].h = 8;
		explosiones[i].w = 4;
	} else {
		explosiones[i].h = 8;
		explosiones[i].w = 2;
	}
	explosiones_activas++;
}

//******************************************************************************
// Función:
//
//******************************************************************************
void update_explosions() {
	u8 i = 0;
	if ((explosiones_activas > 0) && ((get_time() - explosiones_lastUpdated > EXPLOSIONS_SPEED))) {
		for (i = 0; i < MAX_EXPLOSIONES; i++) {
			if (explosiones[i].activo == 1) {
				if (explosiones[i].fase < 5) {
					explosiones[i].fase++;
				}
				else {
					//borrar explosion
					explosiones[i].activo = 0;
					explosiones_activas--;
				}

			}
		}
	}

}

//******************************************************************************
// Función:
//
//******************************************************************************
void draw_explosions(u8* screen) {
	u8 i;
	u8 *pscreen;

	i = 0;

	if (explosiones_activas > 0) {
		for (i = 0; i < MAX_EXPLOSIONES; i++) {
			if (explosiones[i].activo == 1) {
				pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
				cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase], pscreen, explosiones[i].w, explosiones[i].h);
			}
		}
	}
}

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
// Función:
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
