#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"


TEnemy enemies[MAX_ENEMIES];
u8 active_enemies;
TEnemy_group groups [MAX_ENEMY_GROUPS];
u8 active_groups;
//******************************************************************************
// Función: inicializarDisparos()
//
//******************************************************************************
void init_enemies(){
	u8 k;
	for (k=0;k<MAX_SHOOTS;k++){
		enemies[k].active=0;
		enemies[k].x=0;
		enemies[k].y=0;
		enemies[k].w=0;
		enemies[k].h=0;
		enemies[k].dir=0;
		enemies[k].frame=0;
		enemies[k].lastmoved=0;
	}
	active_enemies=0;
}


//******************************************************************************
// Función: create_enemy
//	basado en trayectorias
//******************************************************************************
void create_enemy(i16 x, i16 y, u8 type){
	u8 k;
	if (active_enemies < MAX_ENEMIES){
		k=0;
		while (enemies[k].active){
			k++;
		}
		enemies[k].active=1;
		enemies[k].frame=0;
		switch (type){

			case 1:
			enemies[k].x=x;
			enemies[k].y=y;
			enemies[k].w=6;
			enemies[k].h=12;
			enemies[k].num_frames=0;
			enemies[k].sprite[0]= (u8*) G_baddie02_00;
			enemies[k].sprite[1]= (u8*) G_baddie02_01;
			enemies[k].sprite[2]= (u8*) G_baddie02_02;
			enemies[k].sprite[3]= (u8*) G_baddie02_03;
			enemies[k].sprite[4]= (u8*) G_baddie02_04;
			enemies[k].sprite[5]= (u8*) G_baddie02_05;
			enemies[k].sprite[6]= (u8*) G_baddie02_06;
			enemies[k].sprite[7]= (u8*) G_baddie02_07;
			enemies[k].movement=0;
			enemies[k].stage=0;
			enemies[k].stage_step=0;
			break;
			default:
			enemies[k].x=x;
			enemies[k].y=y;
			enemies[k].w=5;
			enemies[k].h=16;
			enemies[k].num_frames=0;
			enemies[k].sprite[0]= (u8*) G_baddie01_00;
			enemies[k].sprite[1]= (u8*) G_baddie01_01;
			enemies[k].sprite[2]= (u8*) G_baddie01_02;
			enemies[k].sprite[3]= (u8*) G_baddie01_03;
			enemies[k].sprite[4]= (u8*) G_baddie01_04;
			enemies[k].sprite[5]= (u8*) G_baddie01_05;
			enemies[k].sprite[6]= (u8*) G_baddie01_06;
			enemies[k].sprite[7]= (u8*) G_baddie01_07;
			enemies[k].movement=1;
			enemies[k].stage=0;
			enemies[k].stage_step=0;
			break;
		}
		active_enemies++;
	//prota.lastShot = getTime();
	//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}

void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
	u8 k;
	if (active_groups < MAX_ENEMY_GROUPS){
		k=0;
		while (groups[k].active){
			k++;
		}
		groups[k].active=1;
		groups[k].x=x;
		groups[k].y=y;
		groups[k].enemy_type=type;
		groups[k].num_enemies=num_enemies;
		groups[k].sleep=ENEMY_GAP;
		active_groups++;
	}
}

//******************************************************************************
// Función: update_enemies()
//	Basado en movimientos
//******************************************************************************
void update_enemies(){
	u8 i;

	i=0;
	if (active_enemies>0){
		for (i=0;i<MAX_ENEMIES;i++){
			if (enemies[i].active){
				if (enemies[i].movement<99){
					if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
						enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
						enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
						enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
						enemies[i].stage_step++;
					} else {
						enemies[i].stage++;
						enemies[i].stage_step=0;
						if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
							enemies[i].stage=0;
						}
					}

				}
			}
		}
	}

	if (active_groups>0){
		i=0;
		for (i=0;i<MAX_ENEMY_GROUPS;i++){
			if (groups[i].active){
				if (groups[i].sleep==0){
					groups[i].sleep=ENEMY_GAP;
					create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
					if (groups[i].num_enemies==0){
						groups[i].active=0;
						active_groups--;
					}else{
						groups[i].num_enemies--;
					}
				}else{
					groups[i].sleep--;
				}

			}
		}
	}
}

u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
	return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
}

//******************************************************************************
// Función: 
//
//******************************************************************************
void draw_enemies(u8* screen){
	u8* pscreen;
	u8 k;

	k=0;
	if (active_enemies>0){
		for (k=0;k<MAX_SHOOTS;k++){
			if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
				pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
				cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
			}
		}
	}
}