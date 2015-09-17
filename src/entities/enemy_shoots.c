#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"


TEnemy_shoot enemy_shoots[MAX_ENEMY_SHOOTS];
u8 active_enemy_shoots;
u8* const es_0_anim[1] = {bullet02_0};
u8* const es_1_anim[2] = {bullet01_0, bullet01_1};

//******************************************************************************
// Función: void init_enemy_enemy_shoots()
//
//******************************************************************************
void init_enemy_shoots(){
	u8 k;
	for (k=0;k<MAX_ENEMY_SHOOTS;k++){
		enemy_shoots[k].active=0;
	}
	active_enemy_shoots=0;
}
//******************************************************************************
// Función: 
//
//******************************************************************************
void create_enemy_shoot(u8 x, u8 y, u8 type, i16 angle, u8 speed){
	u8 k;
	if (active_enemy_shoots < MAX_ENEMY_SHOOTS){
	k=0;
	while (enemy_shoots[k].active){
		k++;
	}
	enemy_shoots[k].active=1;
	enemy_shoots[k].e.frame=0;
	enemy_shoots[k].e.x=x;
	enemy_shoots[k].e.y=y;
	enemy_shoots[k].f.x=x*SCALE_FACTOR;
	enemy_shoots[k].f.y=y*SCALE_FACTOR;
	enemy_shoots[k].f.angle = angle;
	enemy_shoots[k].f.v = speed;
	switch (type){

		case 0:
			enemy_shoots[k].e.w=1;
			enemy_shoots[k].e.h=4;
			enemy_shoots[k].e.num_frames=1;
			enemy_shoots[k].e.sprite_set = (u8**) es_0_anim;
			break;
		case 1:
			enemy_shoots[k].e.w=1;
			enemy_shoots[k].e.h=8;
			enemy_shoots[k].e.num_frames=2;
			enemy_shoots[k].e.sprite_set = (u8**) es_1_anim;
			break;
		}
	active_enemy_shoots++;
	//prota.lastShot = getTime();
	//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}
//******************************************************************************
// Función: moverDisparos()
//
//******************************************************************************
void update_enemy_shoots(){
	u8 i,j;
	i=0;
	j=0;
	if (active_enemy_shoots>0){
		for (i=0;i<MAX_ENEMY_SHOOTS;i++){
			if (enemy_shoots[i].active){
				enemy_shoots[i].f.x += (enemy_shoots[i].f.v * cosine(enemy_shoots[i].f.angle));
				enemy_shoots[i].f.y -= (enemy_shoots[i].f.v * sine(enemy_shoots[i].f.angle)) * 2;
				enemy_shoots[i].e.x = enemy_shoots[i].f.x >> 8;
				enemy_shoots[i].e.y = enemy_shoots[i].f.y >> 8;
				if (inside_screen(enemy_shoots[i].e.x, enemy_shoots[i].e.y, enemy_shoots[i].e.w, enemy_shoots[i].e.h)){
					if (check_collision_enemies(enemy_shoots[i].e.x,enemy_shoots[i].e.y,enemy_shoots[i].e.w,enemy_shoots[i].e.h)){
						create_explosion(enemy_shoots[i].e.x,enemy_shoots[i].e.y,0);
						enemy_shoots[i].active=0;
						active_enemy_shoots--;
					} else {
						enemy_shoots[i].e.frame++;
						if (enemy_shoots[i].e.frame==enemy_shoots[i].e.num_frames)
							enemy_shoots[i].e.frame=0;
						}
				} else {
					//Borro Disparo
					enemy_shoots[i].active=0;
					active_enemy_shoots--;
				}
			}
		}
	}

}

//******************************************************************************
// Función: 
//
//******************************************************************************
void draw_enemy_shoots(u8* screen){
	u8* pscreen;
	u8 k;

	k=0;
	if (active_enemy_shoots>0){
		for (k=0;k<MAX_ENEMY_SHOOTS;k++){
			if (enemy_shoots[k].active){
       		pscreen = cpct_getScreenPtr(screen, enemy_shoots[k].e.x/2, enemy_shoots[k].e.y);
       		if (enemy_shoots[k].e.x & 1) {
					shiftSpritePixelsRightToBuffer((u8*) enemy_shoots[k].e.sprite_set[enemy_shoots[k].e.frame], enemy_shoots[k].e.w * enemy_shoots[k].e.h);
					cpct_drawSprite( (u8*) sprite_buffer, pscreen, enemy_shoots[k].e.w, enemy_shoots[k].e.h);
				} else
 	      			cpct_drawSprite((u8*) enemy_shoots[k].e.sprite_set[enemy_shoots[k].e.frame],pscreen,enemy_shoots[k].e.w,enemy_shoots[k].e.h);
			}
		}
	}
}

u8 get_active_enemy_shoots(){
	return active_enemy_shoots;
}