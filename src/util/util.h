#ifndef  __util_h__
#define __util_h__

#include <cpctelera.h>

#define CHECK_BIT(var,pos) (((var)>>(pos)) & 1)

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void	cpc_PrintGphStr(u8 *text, int destino);
void	cpc_PrintGphStr2X(u8 *text, int destino);
void	cpc_SetInkGphStr(u8 a, u8 b);
void 	set_stack(int destino);

void timer_on(void);
void timer_off(void);
unsigned long get_time();

unsigned char fast_collision(unsigned char x1, unsigned char y1, unsigned char w1, unsigned char h1, unsigned char x2, unsigned char y2, unsigned char w2, unsigned char h2);

cpct_keyID wait_for_keypress();

i16 sine(i16 angle);
i16 cosine(i16 angle);

#endif
