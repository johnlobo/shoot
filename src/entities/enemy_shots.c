#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"


TEnemy_shot enemy_shots[MAX_ENEMY_SHOTS];
u8 active_enemy_shots;
u8* const es_0_anim[1] = {G_baddie_shot_01};
u8* const es_1_anim[2] = {bullet01_0, bullet01_1};

//******************************************************************************
// Función: void init_enemy_enemy_shots()
//
//******************************************************************************
void init_enemy_shots(){
	u8 k;
	for (k=0;k<MAX_ENEMY_SHOTS;k++){
		enemy_shots[k].active=0;
	}
	active_enemy_shots=0;
}
//******************************************************************************
// Función: 
//
//******************************************************************************
void create_enemy_shot(u8 x, u8 y, u8 type, i16 angle, u8 speed){
	u8 k;
	if (active_enemy_shots < MAX_ENEMY_SHOTS){
	k=0;
	while (enemy_shots[k].active){
		k++;
	}
	enemy_shots[k].active=1;
	enemy_shots[k].e.frame=0;
	enemy_shots[k].e.x=x;
	enemy_shots[k].e.y=y;
	enemy_shots[k].f.x=(i32)(x*SCALE_FACTOR);
	enemy_shots[k].f.y=(i32)(y*SCALE_FACTOR);
	enemy_shots[k].f.angle = angle;
	enemy_shots[k].f.v = speed;
	switch (type){

		case 0:
			enemy_shots[k].e.w=2;
			enemy_shots[k].e.h=3;
			enemy_shots[k].e.num_frames=1;
			enemy_shots[k].e.sprite_set = (u8**) es_0_anim;
			break;
		case 1:
			enemy_shots[k].e.w=1;
			enemy_shots[k].e.h=8;
			enemy_shots[k].e.num_frames=2;
			enemy_shots[k].e.sprite_set = (u8**) es_1_anim;
			break;
		}
	active_enemy_shots++;
	//prota.lastShot = getTime();
	//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}
//******************************************************************************
// Función: moverDisparos()
//
//******************************************************************************
void update_enemy_shots(){
	u8 i,j;
	i=0;
	j=0;
	if (active_enemy_shots>0){
		for (i=0;i<MAX_ENEMY_SHOTS;i++){
			if (enemy_shots[i].active){
				enemy_shots[i].f.x += (enemy_shots[i].f.v * cosine(enemy_shots[i].f.angle));
				enemy_shots[i].f.y -= (enemy_shots[i].f.v * sine(enemy_shots[i].f.angle)) * 2;
				enemy_shots[i].e.x = enemy_shots[i].f.x >> 8;
				enemy_shots[i].e.y = enemy_shots[i].f.y >> 8;
				if (inside_screen(enemy_shots[i].e.x, enemy_shots[i].e.y, enemy_shots[i].e.w, enemy_shots[i].e.h)){
					if (check_collision_user(enemy_shots[i].e.x,enemy_shots[i].e.y,enemy_shots[i].e.w,enemy_shots[i].e.h)){
						enemy_shots[i].active=OFF;
						active_enemy_shots--;
					} else {
						enemy_shots[i].e.frame++;
						if (enemy_shots[i].e.frame==enemy_shots[i].e.num_frames)
							enemy_shots[i].e.frame=0;
						}
				} else {
					//Borro Disparo
					enemy_shots[i].active=OFF;
					active_enemy_shots--;
				}
			}
		}
	}

}

//******************************************************************************
// Función: 
//
//******************************************************************************
void draw_enemy_shots(u8* screen){
	u8* pscreen;
	u8 k;

	k=0;
	if (active_enemy_shots>0){
		for (k=0;k<MAX_ENEMY_SHOTS;k++){
			if (enemy_shots[k].active){
       		pscreen = cpct_getScreenPtr(screen, enemy_shots[k].e.x/2, enemy_shots[k].e.y);
       		if (enemy_shots[k].e.x & 1) {
					shiftSpritePixelsRightToBuffer((u8*) enemy_shots[k].e.sprite_set[enemy_shots[k].e.frame], enemy_shots[k].e.w * enemy_shots[k].e.h);
					cpct_drawSprite( (u8*) sprite_buffer, pscreen, enemy_shots[k].e.w, enemy_shots[k].e.h);
				} else
 	      			cpct_drawSprite((u8*) enemy_shots[k].e.sprite_set[enemy_shots[k].e.frame],pscreen,enemy_shots[k].e.w,enemy_shots[k].e.h);
			}
		}
	}
}

u8 get_active_enemy_shots(){
	return active_enemy_shots;
}