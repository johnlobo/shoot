#include <stdio.h>
#include <cpctelera.h>
#include "entities.h"
#include "../util/util.h"

//explosiones
TMessage messages[MAX_MESSAGES];
u8 active_messages;
u8 aux_txt2[40];

//
// Copy a string into a given buffer
//
void strcpy(i8* to, const i8* from){
	u8 i;
	i=30;
	while (i){
		*to++ = *from++;
		i--;
	}
}

u8 strlen(const char *str)
{
    const char *s;
    
    for (s = str; *s; ++s);
    return(s - str);
}

/////////////////////////////////////////////////////////////////////////
// 
//
//Valores que se ven bien --> 0 (negro), 2 (verde), 8 (azul oscuro), 10 verde (claro), 
//32 (morado), 34 (rojo), 40 azul (claro), 42 (amarillo), 128 (gris), 130 (caqui), 136 (azul), 
//138 (rojo oscuro), 160 (azulillo), 162 (naranja), 168 (añil), 170 (blanoo)
//
// otros:  186 (blanco y morado)
    void colour_message (u8 backg, u8 t){
      cpc_SetInkGphStr(0,backg);
      cpc_SetInkGphStr(1,t);
      cpc_SetInkGphStr(2,t);
      cpc_SetInkGphStr(3,t);
    }

/////////////////////////////////////////////////////////////////////////
// 
//
void red_message(){
      //tintas para los textos
	cpc_SetInkGphStr(0,0);
	cpc_SetInkGphStr(1,34);
	cpc_SetInkGphStr(2,138);
	cpc_SetInkGphStr(3,162);
}

/////////////////////////////////////////////////////////////////////////
// 
//
void blue_message(){
      //tintas para los textos
	cpc_SetInkGphStr(0,0);
	cpc_SetInkGphStr(1,136);
	cpc_SetInkGphStr(2,40);
	cpc_SetInkGphStr(3,136);
}    

void init_messages(){
	u8 i;

	for(i=0; i<MAX_MESSAGES; i++){
		messages[i].active=0;
		messages[i].x=0;
		messages[i].y=0;
		messages[i].time=0;
	}
	active_messages=0;
}

void create_message(u8 x, u8 y, u8 delay, u8 time, u8 *text){
	u8 i;
	i=0;
	while (messages[i].active==1) { 
		i++;
	} //buscar mensaje no activo disponible
	messages[i].active=1;
	messages[i].x = x;
	messages[i].y = y;
	messages[i].time = time;
	messages[i].delay = delay;
	strcpy(messages[i].text,text);
	active_messages++;
}

void draw_messages(u8* screen){
	u8 i;
	//u8* pscreen;

	if (active_messages){
		blue_message();
		for (i=0;i<MAX_MESSAGES;i++){
			if (messages[i].active){
				if (messages[i].delay)
					messages[i].delay--;
				else{
				//pscreen = cpct_getScreenPtr(screen, messages[i].x-2, messages[i].y-4);
				//cpct_drawSolidBox(pscreen , cpct_px2byteM0(3, 3), strlen(messages[i].text)*2+4, 18);
				cpc_PrintGphStr(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
				messages[i].time--;
				if (!messages[i].time){
					messages[i].active=0;
					active_messages--;
				}
			}
			}
		}
	}
}

void color_test(u8* screen){
	u8 i,x,y;
	u8 aux_txt[3];

	x=0;
	y=0;
	for (i=1;i<255;i++){
		if ((i%15)==0){
			x=0;
			y+=12;
		}
		colour_message (0,i);
		sprintf(aux_txt,"%02d",x);
		cpc_PrintGphStr(aux_txt, (int) cpct_getScreenPtr(screen, x, y));
		x+=5;
	} 
}