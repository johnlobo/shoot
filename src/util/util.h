#ifndef  __util_h__
#define __util_h__

void	cpc_PrintGphStr(char *text, int destino);
void	cpc_PrintGphStr2X(char *text, int destino);
void	cpc_SetInkGphStr(char a, char b);
void 	set_stack(int destino);

void timer_on(void);
void timer_off(void);
unsigned long get_time();

unsigned char fast_collision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2);
#endif
