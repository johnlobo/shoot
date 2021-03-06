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
void strcpy(i8* to, const i8* from) {
	u8 i;
	i = 30;
	while (i) {
		*to++ = *from++;
		i--;
	}
}

u8 strlen(const char *str)
{
	const char *s;

	for (s = str; *s; ++s);
	return (s - str);
}

/////////////////////////////////////////////////////////////////////////
//
//
//Valores que se ven bien --> 0 (negro), 2 (verde), 8 (azul oscuro), 10 verde (claro),
//32 (morado), 34 (rojo), 40 azul (claro), 42 (amarillo), 128 (gris), 130 (caqui), 136 (azul),
//138 (rojo oscuro), 160 (azulillo), 162 (naranja), 168 (añil), 170 (blanoo)
//
// otros:  186 (blanco y morado)
void colour_message (u8 backg, u8 t) {
	cpc_SetInkGphStr(0, backg);
	cpc_SetInkGphStr(1, t);
	cpc_SetInkGphStr(2, t);
	cpc_SetInkGphStr(3, t);
}

/////////////////////////////////////////////////////////////////////////
//
//
void red_message() {
	//tintas para los textos 34,138,162; 34,162,34
	cpc_SetInkGphStr(0, 0);
	cpc_SetInkGphStr(1, 34);
	cpc_SetInkGphStr(2, 162);
	cpc_SetInkGphStr(3, 34);
}

/////////////////////////////////////////////////////////////////////////
//
//
void blue_message() {
	//tintas para los textos 40,40,128; 136,40,136; 40,40,136
	cpc_SetInkGphStr(0, 0);
	cpc_SetInkGphStr(1, 40);
	cpc_SetInkGphStr(2, 40);
	cpc_SetInkGphStr(3, 136);
}

void init_messages() {
	u8 i;

	for (i = 0; i < MAX_MESSAGES; i++) {
		messages[i].active = 0;
		messages[i].x = 0;
		messages[i].y = 0;
		messages[i].time = 0;
		messages[i].fixed = 0;
		messages[i].delay = 0;
		messages[i].color = 0;
	}
	active_messages = 0;
}

void create_centered_message(u8 y, u8 delay, u8 time, u8 *text, u8 color) {
	u8 i = 0;
	u8 x = 0;

	x = (80 - (strlen(text) * 2)) / 2;

	while (messages[i].active == 1) {
		i++;
	} //buscar mensaje no activo disponible
	messages[i].active = 1;
	messages[i].x = x;
	messages[i].y = y;
	if (!time)
		messages[i].fixed = 1;
	else
		messages[i].time = time;
	messages[i].delay = delay;
	strcpy(messages[i].text, text);
	messages[i].color = color;
	active_messages++;
}

void draw_messages(u8* screen) {
	u8 i;
	//u8* pscreen;

	if (active_messages) {
		for (i = 0; i < MAX_MESSAGES; i++) {
			if (messages[i].active) {
				if (messages[i].delay)
					messages[i].delay--;
				else {
					if (messages[i].color)
						red_message();
					else
						blue_message();
					cpc_PrintGphStr(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
					if (!messages[i].fixed) {
						messages[i].time--;
						if (!messages[i].time) {
							messages[i].active = 0;
							active_messages--;
						}
					}
				}
			}
		}
	}
}
