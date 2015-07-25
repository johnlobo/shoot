                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:52 2015
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
   597D                      24 _timer0:
   597D                      25 	.ds 2
   597F                      26 _timer1:
   597F                      27 	.ds 2
   5981                      28 _nFPS::
   5981                      29 	.ds 1
   5982                      30 _nTimeLast::
   5982                      31 	.ds 4
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
   4698                      60 _timer_on::
                             61 ;src/util/timer.c:41: __endasm;
   4698 F3            [ 4]   62 	DI
   4699 ED 56         [ 8]   63 	IM 1
   469B E5            [11]   64 	PUSH HL
   469C 21 7D 59      [10]   65 	LD HL, #_timer0
   469F 36 00         [10]   66 	LD (HL),#0X0000
   46A1 21 38 00      [10]   67 	LD HL,#0X0038
   46A4 36 C3         [10]   68 	LD (HL),#0XC3 ;JP
   46A6 23            [ 6]   69 	INC HL
   46A7 21 B2 46      [10]   70 	LD HL,#interrupcion
   46AA 22 39 00      [16]   71 	LD (#0X0039),HL
   46AD E1            [10]   72 	POP HL
   46AE FB            [ 4]   73 	EI
   46AF C3 C0 46      [10]   74 	JP term
   46B2                      75 	interrupcion:
   46B2 F3            [ 4]   76 	DI
   46B3 E5            [11]   77 	PUSH HL
   46B4 F5            [11]   78 	PUSH AF
   46B5 21 7D 59      [10]   79 	LD HL,#_timer0
   46B8                      80 	desborde:
   46B8 34            [11]   81 	INC (HL)
   46B9 23            [ 6]   82 	INC HL
   46BA 28 FC         [12]   83 	JR Z,desborde
   46BC F1            [10]   84 	POP AF
   46BD E1            [10]   85 	POP HL
   46BE FB            [ 4]   86 	EI
   46BF C9            [10]   87 	RET
   46C0                      88 	term:
   46C0 C9            [10]   89 	ret
                             90 ;src/util/timer.c:47: void timer_off(void) {
                             91 ;	---------------------------------
                             92 ; Function timer_off
                             93 ; ---------------------------------
   46C1                      94 _timer_off::
                             95 ;src/util/timer.c:56: __endasm;
   46C1 F3            [ 4]   96 	DI
   46C2 ED 56         [ 8]   97 	IM 1
   46C4 21 38 00      [10]   98 	LD HL,#0X0038
   46C7 36 FB         [10]   99 	LD (HL),#0XFB ;EI
   46C9 23            [ 6]  100 	INC HL
   46CA 36 C9         [10]  101 	LD (HL),#0XC9 ;RET
   46CC FB            [ 4]  102 	EI
   46CD C9            [10]  103 	ret
                            104 ;src/util/timer.c:62: unsigned long get_time()
                            105 ;	---------------------------------
                            106 ; Function get_time
                            107 ; ---------------------------------
   46CE                     108 _get_time::
                            109 ;src/util/timer.c:65: nTime = (timer1 << 8) + timer0;
   46CE 21 7F 59      [10]  110 	ld	hl,#_timer1 + 0
   46D1 56            [ 7]  111 	ld	d, (hl)
   46D2 1E 00         [ 7]  112 	ld	e,#0x00
   46D4 2A 7D 59      [16]  113 	ld	hl,(_timer0)
   46D7 19            [11]  114 	add	hl,de
   46D8 11 00 00      [10]  115 	ld	de,#0x0000
                            116 ;src/util/timer.c:66: return nTime;
   46DB C9            [10]  117 	ret
                            118 	.area _CODE
                            119 	.area _INITIALIZER
                            120 	.area _CABS (ABS)
