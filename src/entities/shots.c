#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"


TShoot shots[MAX_SHOTS];
u8 active_shots;

//******************************************************************************
// Función: inicializarDisparos()
//
//******************************************************************************
void init_shots() {
	u8 k;
	for (k = 0; k < MAX_SHOTS; k++) {
		shots[k].active = 0;
	}
	active_shots = 0;
}
//******************************************************************************
// Función:
//
//******************************************************************************
void create_shot(u8 x, u8 y, u8 type) {
	u8 k;
	if (active_shots < get_user_max_shots()) {
		k = 0;
		while (shots[k].active) {
			k++;
		}
		shots[k].active = 1;
		shots[k].frame = 0;
		switch (type) {

		case 1:
			shots[k].x = x;
			shots[k].y = y;
			shots[k].w = 1;
			shots[k].h = 4;
			shots[k].num_frames = 1;
			shots[k].sprite[0] = (u8*) bullet02_0;
			break;
		default:
			shots[k].x = x;
			shots[k].y = y;
			shots[k].w = 1;
			shots[k].h = 8;
			shots[k].num_frames = 2;
			shots[k].sprite[0] = (u8*) bullet01_0;
			shots[k].sprite[1] = (u8*) bullet01_1;
			break;
		}
		active_shots++;
		//prota.lastShot = getTime();
		//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}
//******************************************************************************
// Función: moverDisparos()
//
//******************************************************************************
void update_shots() {
	u8 i, j;
	i = 0;
	j = 0;
	if (active_shots > 0) {
		for (i = 0; i < MAX_SHOTS; i++) {
			if (shots[i].active) {
				shots[i].y -= SHOOT_JUMP;
				if (shots[i].y < 200) {
					if (check_collision_enemies(shots[i].x, shots[i].y, shots[i].w, shots[i].h)) {
						shots[i].active = 0;
						active_shots--;
						add_score(10);
					} else {
						shots[i].frame++;
						if (shots[i].frame == shots[i].num_frames)
							shots[i].frame = 0;
					}
				} else {
					//Borro Disparo
					shots[i].active = 0;
					active_shots--;
				}
			}
		}
	}

}

//******************************************************************************
// Función:
//
//******************************************************************************
void draw_shots(u8* screen) {
	u8* pscreen;
	u8 k;

	k = 0;
	if (active_shots > 0) {
		for (k = 0; k < MAX_SHOTS; k++) {
			if (shots[k].active) {
				pscreen = cpct_getScreenPtr(screen, shots[k].x / 2, shots[k].y);
				if (shots[k].x & 1) {
					shiftSpritePixelsRightToBuffer((u8*) shots[k].sprite[shots[k].frame], shots[k].w * shots[k].h);
					cpct_drawSprite( (u8*) sprite_buffer, pscreen, shots[k].w, shots[k].h);
				} else
					cpct_drawSprite(shots[k].sprite[shots[k].frame], pscreen, shots[k].w, shots[k].h);
			}
		}
	}
}

u8 get_active_shots() {
	return active_shots;
}