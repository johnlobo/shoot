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
   652D                      24 _timer0:
   652D                      25 	.ds 2
   652F                      26 _timer1:
   652F                      27 	.ds 2
   6531                      28 _nFPS::
   6531                      29 	.ds 1
   6532                      30 _nTimeLast::
   6532                      31 	.ds 4
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
   4796                      60 _timer_on::
                             61 ;src/util/timer.c:41: __endasm;
   4796 F3            [ 4]   62 	DI
   4797 ED 56         [ 8]   63 	IM 1
   4799 E5            [11]   64 	PUSH HL
   479A 21 2D 65      [10]   65 	LD HL, #_timer0
   479D 36 00         [10]   66 	LD (HL),#0X0000
   479F 21 38 00      [10]   67 	LD HL,#0X0038
   47A2 36 C3         [10]   68 	LD (HL),#0XC3 ;JP
   47A4 23            [ 6]   69 	INC HL
   47A5 21 B0 47      [10]   70 	LD HL,#interrupcion
   47A8 22 39 00      [16]   71 	LD (#0X0039),HL
   47AB E1            [10]   72 	POP HL
   47AC FB            [ 4]   73 	EI
   47AD C3 BE 47      [10]   74 	JP term
   47B0                      75 	interrupcion:
   47B0 F3            [ 4]   76 	DI
   47B1 E5            [11]   77 	PUSH HL
   47B2 F5            [11]   78 	PUSH AF
   47B3 21 2D 65      [10]   79 	LD HL,#_timer0
   47B6                      80 	desborde:
   47B6 34            [11]   81 	INC (HL)
   47B7 23            [ 6]   82 	INC HL
   47B8 28 FC         [12]   83 	JR Z,desborde
   47BA F1            [10]   84 	POP AF
   47BB E1            [10]   85 	POP HL
   47BC FB            [ 4]   86 	EI
   47BD C9            [10]   87 	RET
   47BE                      88 	term:
   47BE C9            [10]   89 	ret
                             90 ;src/util/timer.c:47: void timer_off(void) {
                             91 ;	---------------------------------
                             92 ; Function timer_off
                             93 ; ---------------------------------
   47BF                      94 _timer_off::
                             95 ;src/util/timer.c:56: __endasm;
   47BF F3            [ 4]   96 	DI
   47C0 ED 56         [ 8]   97 	IM 1
   47C2 21 38 00      [10]   98 	LD HL,#0X0038
   47C5 36 FB         [10]   99 	LD (HL),#0XFB ;EI
   47C7 23            [ 6]  100 	INC HL
   47C8 36 C9         [10]  101 	LD (HL),#0XC9 ;RET
   47CA FB            [ 4]  102 	EI
   47CB C9            [10]  103 	ret
                            104 ;src/util/timer.c:62: unsigned long get_time()
                            105 ;	---------------------------------
                            106 ; Function get_time
                            107 ; ---------------------------------
   47CC                     108 _get_time::
                            109 ;src/util/timer.c:65: nTime = (timer1 << 8) + timer0;
   47CC 21 2F 65      [10]  110 	ld	hl,#_timer1 + 0
   47CF 56            [ 7]  111 	ld	d, (hl)
   47D0 1E 00         [ 7]  112 	ld	e,#0x00
   47D2 2A 2D 65      [16]  113 	ld	hl,(_timer0)
   47D5 19            [11]  114 	add	hl,de
   47D6 11 00 00      [10]  115 	ld	de,#0x0000
                            116 ;src/util/timer.c:66: return nTime;
   47D9 C9            [10]  117 	ret
                            118 	.area _CODE
                            119 	.area _INITIALIZER
                            120 	.area _CABS (ABS)
