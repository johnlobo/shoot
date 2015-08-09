#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"


TShoot shoots[MAX_SHOOTS];
u8 active_shoots;

//******************************************************************************
// Función: inicializarDisparos()
//
//******************************************************************************
void init_shoots(){
	u8 k;
	for (k=0;k<MAX_SHOOTS;k++){
		shoots[k].active=0;
		shoots[k].x=0;
		shoots[k].y=0;
		shoots[k].w=0;
		shoots[k].h=0;
		shoots[k].frame=0;
		shoots[k].lastmoved=0;
	}
	active_shoots=0;
}
//******************************************************************************
// Función: 
//
//******************************************************************************
void create_shoot(u8 x, u8 y, u8 type){
	u8 k;
	if (active_shoots < get_user_max_shoots()){
	k=0;
	while (shoots[k].active){
		k++;
	}
	shoots[k].active=1;
	shoots[k].frame=0;
	switch (type){

		case 1:
			shoots[k].x=x;
			shoots[k].y=y;
			shoots[k].w=1;
			shoots[k].h=4;
			shoots[k].num_frames=1;
			shoots[k].sprite[0]= (u8*) bullet02_0;
			break;
		default:
			shoots[k].x=x;
			shoots[k].y=y;
			shoots[k].w=1;
			shoots[k].h=8;
			shoots[k].num_frames=2;
			shoots[k].sprite[0]= (u8*) bullet01_0;
			shoots[k].sprite[1]= (u8*) bullet01_1;
			break;
		}
	active_shoots++;
	//prota.lastShot = getTime();
	//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
	}
}
//******************************************************************************
// Función: moverDisparos()
//
//******************************************************************************
void update_shoots(){
	u8 i,j;
	i=0;
	j=0;
	if (active_shoots>0){
		for (i=0;i<MAX_SHOOTS;i++){
			if (shoots[i].active){
				shoots[i].y-=SHOOT_JUMP;
				if (shoots[i].y<200){
					if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
						create_explosion(shoots[i].x,shoots[i].y,0);
						shoots[i].active=0;
						active_shoots--;
						add_score(10);
					} else {
						shoots[i].frame++;
						if (shoots[i].frame==shoots[i].num_frames)
							shoots[i].frame=0;
						}
				} else {
					//Borro Disparo
					shoots[i].active=0;
					active_shoots--;
				}
			}
		}
	}

}

//******************************************************************************
// Función: 
//
//******************************************************************************
void draw_shoots(u8* screen){
	u8* pscreen;
	u8 k;

	k=0;
	if (active_shoots>0){
		for (k=0;k<MAX_SHOOTS;k++){
			if (shoots[k].active){
       		pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
 	      	cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
			}
		}
	}
}