;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Fri Aug  7 15:43:54 2015
;--------------------------------------------------------
	.module timer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_time
	.globl _timer_off
	.globl _timer_on
	.globl _nTimeLast
	.globl _nFPS
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_timer0:
	.ds 2
_timer1:
	.ds 2
_nFPS::
	.ds 1
_nTimeLast::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/util/timer.c:12: void timer_on(void) {
;	---------------------------------
; Function timer_on
; ---------------------------------
_timer_on::
;src/util/timer.c:41: __endasm;
	DI
	IM 1
	PUSH HL
	LD HL, #_timer0
	LD (HL),#0X0000
	LD HL,#0X0038
	LD (HL),#0XC3 ;JP
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
	LD HL,#_timer0
	desborde:
	INC (HL)
	INC HL
	JR Z,desborde
	POP AF
	POP HL
	EI
	RET
	term:
	ret
;src/util/timer.c:47: void timer_off(void) {
;	---------------------------------
; Function timer_off
; ---------------------------------
_timer_off::
;src/util/timer.c:56: __endasm;
	DI
	IM 1
	LD HL,#0X0038
	LD (HL),#0XFB ;EI
	INC HL
	LD (HL),#0XC9 ;RET
	EI
	ret
;src/util/timer.c:62: unsigned long get_time()
;	---------------------------------
; Function get_time
; ---------------------------------
_get_time::
;src/util/timer.c:65: nTime = (timer1 << 8) + timer0;
	ld	hl,#_timer1 + 0
	ld	d, (hl)
	ld	e,#0x00
	ld	hl,(_timer0)
	add	hl,de
	ld	de,#0x0000
;src/util/timer.c:66: return nTime;
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
