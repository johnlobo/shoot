#include <types.h>

static u16 timer0;
static u16 timer1;

//******************************************************************************
// Función timerOn()
// Procedmiento que activa el temporizador en las interrupciones
//******************************************************************************
void timer_on(void) {
	__asm
	DI
	IM 1	
	PUSH HL
	LD HL, #_timer0
	LD (HL),#0X0000
	INC HL
	INC HL
	LD (HL),#0X0000
	LD HL,#0X0038
	LD (HL),#0XC3		;JP
	INC HL
	LD HL,#interrupcion
	LD (#0X0039),HL
	POP HL
	EI
	JP term
interrupcion:
	DI
	PUSH HL
	PUSH AF
	LD	HL,#_timer0
desborde:
	INC (HL)
	INC HL
	JR	Z,desborde
	POP AF
	POP HL
	EI
	RET
term:
	__endasm;
}
//******************************************************************************
// Función timerOff()
// Detiene el temporizador y vuelve al modo de firmware desactivado
//******************************************************************************
void timer_off(void) {
	__asm
	DI
	IM 1
	LD HL,#0X0038
	LD (HL),#0XFB		;EI
	INC HL
	LD (HL),#0XC9		;RET
	EI
	__endasm;
}
//******************************************************************************
// Función getTime()
// Obtiene el valor del temporizador
//******************************************************************************
unsigned long get_time()
{
	unsigned long nTime = 0;
	nTime = (timer1 << 8) + timer0;
	return nTime;
}
