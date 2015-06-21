	#ifndef  __util_h__
	#define __util_h__

void						cpc_PrintGphStr(char *text, int destino);
void						cpc_PrintGphStrM1(char *text, int destino);
void						cpc_PrintGphStr2X(char *text, int destino);
void						cpc_PrintGphStrM12X(char *text, int destino);

void						cpc_PrintGphStrXY(char *text, char a, char b);
void						cpc_PrintGphStrXYM1(char *text, char a, char b);
void						cpc_PrintGphStrXY2X(char *text, char a, char b);
void						cpc_PrintGphStrXYM12X(char *text, char a, char b);
void						cpc_SetInkGphStr(char a, char b);
void						cpc_SetInkGphStrM1(char a, char b);

void     					cpc_PrintGphStrStd(char color, char *cadena, int destino);
void  		   				cpc_PrintGphStrStdXY(char color, char *cadena, char x, char y);

void 	set_stack(int destino);

	#endif /* __printgphstr_h__ */
