#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"


TEnemy enemies[MAX_ENEMIES];
u8 active_enemies;
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
// Función: 
//
//******************************************************************************
void create_enemy(u8 x, u8 y, u8 type){
	u8 k;
	if (active_enemies < get_user_max_shoots()){
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
			enemies[k].trajectory=1;
			enemies[k].trajectory_step=0;
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
			enemies[k].trajectory=1;
			enemies[k].trajectory_step=0;
			break;
		}
		active_enemies++;
	//prota.lastShot = getTime();
	//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}
//******************************************************************************
// Función: moverDisparos()
//
//******************************************************************************
void update_enemies(){
	u8 i;
	i8 dx;
	i8 dy;

	i=0;
	if (active_enemies>0){
		for (i=0;i<MAX_SHOOTS;i++){
			if (enemies[i].active){
				if (enemies[i].trajectory>0){
					dx = enemies[i].x-trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
					dy = enemies[i].x-trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
					if ((dx==0) && (dy==0)){
						if (enemies[i].trajectory_step<trajectories[enemies[i].trajectory].waypoints){
							enemies[i].trajectory_step++;
						}
						else{
							enemies[i].trajectory_step=0;
							enemies[i].trajectory=0;
						}

					}else{
						if (dx>0){
							if ((u8) dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step]){
								enemies[i].x+=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
							}
							else {
								enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
							}
						} else{
							if (-dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step])
								enemies[i].x-=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
							else 
								enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
						}
					} 
				}
			}
		}
	}

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
			if (enemies[k].active){
				pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
				cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
			}
		}
	}
}