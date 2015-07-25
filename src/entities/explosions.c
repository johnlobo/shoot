#include <stdio.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"

//explosiones
TIPO_EXPLOSION explosiones[MAX_EXPLOSIONES];
u8 explosiones_activas;
u8 *explosion_sprite[2][4];
long explosiones_lastUpdated;

//
//EXPLOSIONES
//
//******************************************************************************
// Función: inicializarExplosiones()
//
//******************************************************************************
void init_explosions(){
	u8 i = 0;
	
	for (i=0;i<MAX_EXPLOSIONES;i++){
		explosiones[i].activo=0;
		explosiones[i].tipo=0;
		explosiones[i].fase=0;
		explosiones[i].x=0;
		explosiones[i].y=0;
		explosiones[i].h=0;
		explosiones[i].w=0;
		explosiones[i].lastmoved=0;
	}
	explosiones_activas=0;
	explosion_sprite[0][0]= (u8*) explosion02000;
	explosion_sprite[0][1]= (u8*) explosion02001;
	explosion_sprite[0][2]= (u8*) explosion02002;
	explosion_sprite[0][3]= (u8*) explosion02003;
	explosion_sprite[1][0]= (u8*) toque000;
	explosion_sprite[1][1]= (u8*) toque001;
	explosion_sprite[1][2]= (u8*) toque002;
	explosion_sprite[1][3]= (u8*) toque003;
}
//******************************************************************************
// Función: crearExplosion(u8 tipo, u8 x, u8 y)
//
//******************************************************************************
void create_explosion(u8 x, u8 y, u8 tipo){
	u8 i;
	i=0;
	while (explosiones[i].activo==1) { 
		i++;
	} //buscar explosion no activa disponible
	explosiones[i].activo=1;
	explosiones[i].tipo=tipo;
	explosiones[i].fase=0;
	explosiones[i].x=x;
	explosiones[i].y=y;
	//explosiones[i].memoriaPantalla[0] = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
	if (!tipo){
		explosiones[i].h=16;
		explosiones[i].w=4;
	} else {
		explosiones[i].h=8;
		explosiones[i].w=2;
	}
	explosiones_activas++;
}

//******************************************************************************
// Función: 
//
//******************************************************************************
void update_explosions(){
	u8 i=0;
	if (explosiones_activas>0){
		for (i=0;i<MAX_EXPLOSIONES;i++){
			if (explosiones[i].activo==1){
				if (explosiones[i].fase<3){
					explosiones[i].fase++;
				}
				else {
					//borrar explosion
					explosiones[i].activo=0;
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
void draw_explosions(u8* screen){
	u8 i;
	u8 *pscreen;

	i = 0;

	if (explosiones_activas>0){
		for (i=0;i<MAX_EXPLOSIONES;i++){
			if (explosiones[i].activo==1){
				pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
				cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
			}
		}
	}
}
