                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 23:41:04 2015
                              5 ;--------------------------------------------------------
                              6 	.module timer
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_time
                             13 	.globl _timer_off
                             14 	.globl _timer_on
                             15 	.globl _nTimeLast
                             16 	.globl _nFPS
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _INITIALIZED
   5632                      28 _timer0:
   5632                      29 	.ds 2
   5634                      30 _timer1:
   5634                      31 	.ds 2
   5636                      32 _nFPS::
   5636                      33 	.ds 1
   5637                      34 _nTimeLast::
   5637                      35 	.ds 4
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/util/timer.c:10: void timer_on(void) {
                             57 ;	---------------------------------
                             58 ; Function timer_on
                             59 ; ---------------------------------
   4456                      60 _timer_on::
                             61 ;src/util/timer.c:39: __endasm;
   4456 F3            [ 4]   62 	DI
   4457 ED 56         [ 8]   63 	IM 1
   4459 E5            [11]   64 	PUSH HL
   445A 21 32 56      [10]   65 	LD HL, #_timer0
   445D 36 00         [10]   66 	LD (HL),#0X0000
   445F 21 38 00      [10]   67 	LD HL,#0X0038
   4462 36 C3         [10]   68 	LD (HL),#0XC3 ;JP
   4464 23            [ 6]   69 	INC HL
   4465 21 70 44      [10]   70 	LD HL,#interrupcion
   4468 22 39 00      [16]   71 	LD (#0X0039),HL
   446B E1            [10]   72 	POP HL
   446C FB            [ 4]   73 	EI
   446D C3 7E 44      [10]   74 	JP term
   4470                      75 	interrupcion:
   4470 F3            [ 4]   76 	DI
   4471 E5            [11]   77 	PUSH HL
   4472 F5            [11]   78 	PUSH AF
   4473 21 32 56      [10]   79 	LD HL,#_timer0
   4476                      80 	desborde:
   4476 34            [11]   81 	INC (HL)
   4477 23            [ 6]   82 	INC HL
   4478 28 FC         [12]   83 	JR Z,desborde
   447A F1            [10]   84 	POP AF
   447B E1            [10]   85 	POP HL
   447C FB            [ 4]   86 	EI
   447D C9            [10]   87 	RET
   447E                      88 	term:
   447E C9            [10]   89 	ret
                             90 ;src/util/timer.c:45: void timer_off(void) {
                             91 ;	---------------------------------
                             92 ; Function timer_off
                             93 ; ---------------------------------
   447F                      94 _timer_off::
                             95 ;src/util/timer.c:54: __endasm;
   447F F3            [ 4]   96 	DI
   4480 ED 56         [ 8]   97 	IM 1
   4482 21 38 00      [10]   98 	LD HL,#0X0038
   4485 36 FB         [10]   99 	LD (HL),#0XFB ;EI
   4487 23            [ 6]  100 	INC HL
   4488 36 C9         [10]  101 	LD (HL),#0XC9 ;RET
   448A FB            [ 4]  102 	EI
   448B C9            [10]  103 	ret
                            104 ;src/util/timer.c:60: unsigned long get_time()
                            105 ;	---------------------------------
                            106 ; Function get_time
                            107 ; ---------------------------------
   448C                     108 _get_time::
                            109 ;src/util/timer.c:63: nTime = (timer1 << 8) + timer0;
   448C 21 34 56      [10]  110 	ld	hl,#_timer1 + 0
   448F 56            [ 7]  111 	ld	d, (hl)
   4490 1E 00         [ 7]  112 	ld	e,#0x00
   4492 2A 32 56      [16]  113 	ld	hl,(_timer0)
   4495 19            [11]  114 	add	hl,de
   4496 11 00 00      [10]  115 	ld	de,#0x0000
                            116 ;src/util/timer.c:64: return nTime;
   4499 C9            [10]  117 	ret
                            118 	.area _CODE
                            119 	.area _INITIALIZER
   57CB                     120 __xinit__timer0:
   57CB 00 00               121 	.dw #0x0000
   57CD                     122 __xinit__timer1:
   57CD 00 00               123 	.dw #0x0000
   57CF                     124 __xinit__nFPS:
   57CF 00                  125 	.db #0x00	; 0
   57D0                     126 __xinit__nTimeLast:
   57D0 00 00 00 00         127 	.byte #0x00,#0x00,#0x00,#0x00	; 0
                            128 	.area _CABS (ABS)
