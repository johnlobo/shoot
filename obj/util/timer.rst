                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:54 2015
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
   6B9E                      24 _timer0:
   6B9E                      25 	.ds 2
   6BA0                      26 _timer1:
   6BA0                      27 	.ds 2
   6BA2                      28 _nFPS::
   6BA2                      29 	.ds 1
   6BA3                      30 _nTimeLast::
   6BA3                      31 	.ds 4
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
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
                             56 ;src/util/timer.c:12: void timer_on(void) {
                             57 ;	---------------------------------
                             58 ; Function timer_on
                             59 ; ---------------------------------
   4E1B                      60 _timer_on::
                             61 ;src/util/timer.c:41: __endasm;
   4E1B F3            [ 4]   62 	DI
   4E1C ED 56         [ 8]   63 	IM 1
   4E1E E5            [11]   64 	PUSH HL
   4E1F 21 9E 6B      [10]   65 	LD HL, #_timer0
   4E22 36 00         [10]   66 	LD (HL),#0X0000
   4E24 21 38 00      [10]   67 	LD HL,#0X0038
   4E27 36 C3         [10]   68 	LD (HL),#0XC3 ;JP
   4E29 23            [ 6]   69 	INC HL
   4E2A 21 35 4E      [10]   70 	LD HL,#interrupcion
   4E2D 22 39 00      [16]   71 	LD (#0X0039),HL
   4E30 E1            [10]   72 	POP HL
   4E31 FB            [ 4]   73 	EI
   4E32 C3 43 4E      [10]   74 	JP term
   4E35                      75 	interrupcion:
   4E35 F3            [ 4]   76 	DI
   4E36 E5            [11]   77 	PUSH HL
   4E37 F5            [11]   78 	PUSH AF
   4E38 21 9E 6B      [10]   79 	LD HL,#_timer0
   4E3B                      80 	desborde:
   4E3B 34            [11]   81 	INC (HL)
   4E3C 23            [ 6]   82 	INC HL
   4E3D 28 FC         [12]   83 	JR Z,desborde
   4E3F F1            [10]   84 	POP AF
   4E40 E1            [10]   85 	POP HL
   4E41 FB            [ 4]   86 	EI
   4E42 C9            [10]   87 	RET
   4E43                      88 	term:
   4E43 C9            [10]   89 	ret
                             90 ;src/util/timer.c:47: void timer_off(void) {
                             91 ;	---------------------------------
                             92 ; Function timer_off
                             93 ; ---------------------------------
   4E44                      94 _timer_off::
                             95 ;src/util/timer.c:56: __endasm;
   4E44 F3            [ 4]   96 	DI
   4E45 ED 56         [ 8]   97 	IM 1
   4E47 21 38 00      [10]   98 	LD HL,#0X0038
   4E4A 36 FB         [10]   99 	LD (HL),#0XFB ;EI
   4E4C 23            [ 6]  100 	INC HL
   4E4D 36 C9         [10]  101 	LD (HL),#0XC9 ;RET
   4E4F FB            [ 4]  102 	EI
   4E50 C9            [10]  103 	ret
                            104 ;src/util/timer.c:62: unsigned long get_time()
                            105 ;	---------------------------------
                            106 ; Function get_time
                            107 ; ---------------------------------
   4E51                     108 _get_time::
                            109 ;src/util/timer.c:65: nTime = (timer1 << 8) + timer0;
   4E51 21 A0 6B      [10]  110 	ld	hl,#_timer1 + 0
   4E54 56            [ 7]  111 	ld	d, (hl)
   4E55 1E 00         [ 7]  112 	ld	e,#0x00
   4E57 2A 9E 6B      [16]  113 	ld	hl,(_timer0)
   4E5A 19            [11]  114 	add	hl,de
   4E5B 11 00 00      [10]  115 	ld	de,#0x0000
                            116 ;src/util/timer.c:66: return nTime;
   4E5E C9            [10]  117 	ret
                            118 	.area _CODE
                            119 	.area _INITIALIZER
                            120 	.area _CABS (ABS)
