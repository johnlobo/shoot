                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:47:07 2015
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
   6C02                      24 _timer0:
   6C02                      25 	.ds 2
   6C04                      26 _timer1:
   6C04                      27 	.ds 2
   6C06                      28 _nFPS::
   6C06                      29 	.ds 1
   6C07                      30 _nTimeLast::
   6C07                      31 	.ds 4
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
   4E8D                      60 _timer_on::
                             61 ;src/util/timer.c:41: __endasm;
   4E8D F3            [ 4]   62 	DI
   4E8E ED 56         [ 8]   63 	IM 1
   4E90 E5            [11]   64 	PUSH HL
   4E91 21 02 6C      [10]   65 	LD HL, #_timer0
   4E94 36 00         [10]   66 	LD (HL),#0X0000
   4E96 21 38 00      [10]   67 	LD HL,#0X0038
   4E99 36 C3         [10]   68 	LD (HL),#0XC3 ;JP
   4E9B 23            [ 6]   69 	INC HL
   4E9C 21 A7 4E      [10]   70 	LD HL,#interrupcion
   4E9F 22 39 00      [16]   71 	LD (#0X0039),HL
   4EA2 E1            [10]   72 	POP HL
   4EA3 FB            [ 4]   73 	EI
   4EA4 C3 B5 4E      [10]   74 	JP term
   4EA7                      75 	interrupcion:
   4EA7 F3            [ 4]   76 	DI
   4EA8 E5            [11]   77 	PUSH HL
   4EA9 F5            [11]   78 	PUSH AF
   4EAA 21 02 6C      [10]   79 	LD HL,#_timer0
   4EAD                      80 	desborde:
   4EAD 34            [11]   81 	INC (HL)
   4EAE 23            [ 6]   82 	INC HL
   4EAF 28 FC         [12]   83 	JR Z,desborde
   4EB1 F1            [10]   84 	POP AF
   4EB2 E1            [10]   85 	POP HL
   4EB3 FB            [ 4]   86 	EI
   4EB4 C9            [10]   87 	RET
   4EB5                      88 	term:
   4EB5 C9            [10]   89 	ret
                             90 ;src/util/timer.c:47: void timer_off(void) {
                             91 ;	---------------------------------
                             92 ; Function timer_off
                             93 ; ---------------------------------
   4EB6                      94 _timer_off::
                             95 ;src/util/timer.c:56: __endasm;
   4EB6 F3            [ 4]   96 	DI
   4EB7 ED 56         [ 8]   97 	IM 1
   4EB9 21 38 00      [10]   98 	LD HL,#0X0038
   4EBC 36 FB         [10]   99 	LD (HL),#0XFB ;EI
   4EBE 23            [ 6]  100 	INC HL
   4EBF 36 C9         [10]  101 	LD (HL),#0XC9 ;RET
   4EC1 FB            [ 4]  102 	EI
   4EC2 C9            [10]  103 	ret
                            104 ;src/util/timer.c:62: unsigned long get_time()
                            105 ;	---------------------------------
                            106 ; Function get_time
                            107 ; ---------------------------------
   4EC3                     108 _get_time::
                            109 ;src/util/timer.c:65: nTime = (timer1 << 8) + timer0;
   4EC3 21 04 6C      [10]  110 	ld	hl,#_timer1 + 0
   4EC6 56            [ 7]  111 	ld	d, (hl)
   4EC7 1E 00         [ 7]  112 	ld	e,#0x00
   4EC9 2A 02 6C      [16]  113 	ld	hl,(_timer0)
   4ECC 19            [11]  114 	add	hl,de
   4ECD 11 00 00      [10]  115 	ld	de,#0x0000
                            116 ;src/util/timer.c:66: return nTime;
   4ED0 C9            [10]  117 	ret
                            118 	.area _CODE
                            119 	.area _INITIALIZER
                            120 	.area _CABS (ABS)
