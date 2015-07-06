                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul  6 16:11:50 2015
                              5 ;--------------------------------------------------------
                              6 	.module enemies
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _inside_screen
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _active_groups
                             16 	.globl _groups
                             17 	.globl _active_enemies
                             18 	.globl _enemies
                             19 	.globl _init_enemies
                             20 	.globl _create_enemy
                             21 	.globl _create_enemy_group
                             22 	.globl _update_enemies
                             23 	.globl _draw_enemies
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   4564                      31 _enemies::
   4564                      32 	.ds 360
   46CC                      33 _active_enemies::
   46CC                      34 	.ds 1
   46CD                      35 _groups::
   46CD                      36 	.ds 16
   46DD                      37 _active_groups::
   46DD                      38 	.ds 1
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/entities/enemies.c:14: void init_enemies(){
                             64 ;	---------------------------------
                             65 ; Function init_enemies
                             66 ; ---------------------------------
   22CF                      67 _init_enemies::
   22CF DD E5         [15]   68 	push	ix
   22D1 DD 21 00 00   [14]   69 	ld	ix,#0
   22D5 DD 39         [15]   70 	add	ix,sp
   22D7 3B            [ 6]   71 	dec	sp
                             72 ;src/entities/enemies.c:16: for (k=0;k<MAX_SHOOTS;k++){
   22D8 DD 36 FF 00   [19]   73 	ld	-1 (ix),#0x00
   22DC 11 00 00      [10]   74 	ld	de,#0x0000
   22DF                      75 00102$:
                             76 ;src/entities/enemies.c:17: enemies[k].active=0;
   22DF 21 64 45      [10]   77 	ld	hl,#_enemies
   22E2 19            [11]   78 	add	hl,de
   22E3 4D            [ 4]   79 	ld	c,l
   22E4 44            [ 4]   80 	ld	b,h
   22E5 21 17 00      [10]   81 	ld	hl,#0x0017
   22E8 09            [11]   82 	add	hl,bc
   22E9 36 00         [10]   83 	ld	(hl),#0x00
                             84 ;src/entities/enemies.c:18: enemies[k].x=0;
   22EB 21 10 00      [10]   85 	ld	hl,#0x0010
   22EE 09            [11]   86 	add	hl,bc
   22EF AF            [ 4]   87 	xor	a, a
   22F0 77            [ 7]   88 	ld	(hl), a
   22F1 23            [ 6]   89 	inc	hl
   22F2 77            [ 7]   90 	ld	(hl), a
                             91 ;src/entities/enemies.c:19: enemies[k].y=0;
   22F3 21 12 00      [10]   92 	ld	hl,#0x0012
   22F6 09            [11]   93 	add	hl,bc
   22F7 AF            [ 4]   94 	xor	a, a
   22F8 77            [ 7]   95 	ld	(hl), a
   22F9 23            [ 6]   96 	inc	hl
   22FA 77            [ 7]   97 	ld	(hl), a
                             98 ;src/entities/enemies.c:20: enemies[k].w=0;
   22FB 21 14 00      [10]   99 	ld	hl,#0x0014
   22FE 09            [11]  100 	add	hl,bc
   22FF 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/enemies.c:21: enemies[k].h=0;
   2301 21 15 00      [10]  103 	ld	hl,#0x0015
   2304 09            [11]  104 	add	hl,bc
   2305 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/enemies.c:22: enemies[k].dir=0;
   2307 21 16 00      [10]  107 	ld	hl,#0x0016
   230A 09            [11]  108 	add	hl,bc
   230B 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/enemies.c:23: enemies[k].frame=0;
   230D 21 19 00      [10]  111 	ld	hl,#0x0019
   2310 09            [11]  112 	add	hl,bc
   2311 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/enemies.c:24: enemies[k].lastmoved=0;
   2313 21 20 00      [10]  115 	ld	hl,#0x0020
   2316 09            [11]  116 	add	hl,bc
   2317 AF            [ 4]  117 	xor	a, a
   2318 77            [ 7]  118 	ld	(hl), a
   2319 23            [ 6]  119 	inc	hl
   231A 77            [ 7]  120 	ld	(hl), a
   231B 23            [ 6]  121 	inc	hl
   231C AF            [ 4]  122 	xor	a, a
   231D 77            [ 7]  123 	ld	(hl), a
   231E 23            [ 6]  124 	inc	hl
   231F 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/enemies.c:16: for (k=0;k<MAX_SHOOTS;k++){
   2320 21 24 00      [10]  127 	ld	hl,#0x0024
   2323 19            [11]  128 	add	hl,de
   2324 EB            [ 4]  129 	ex	de,hl
   2325 DD 34 FF      [23]  130 	inc	-1 (ix)
   2328 DD 7E FF      [19]  131 	ld	a,-1 (ix)
   232B D6 0A         [ 7]  132 	sub	a, #0x0A
   232D 38 B0         [12]  133 	jr	C,00102$
                            134 ;src/entities/enemies.c:26: active_enemies=0;
   232F 21 CC 46      [10]  135 	ld	hl,#_active_enemies + 0
   2332 36 00         [10]  136 	ld	(hl), #0x00
   2334 33            [ 6]  137 	inc	sp
   2335 DD E1         [14]  138 	pop	ix
   2337 C9            [10]  139 	ret
                            140 ;src/entities/enemies.c:34: void create_enemy(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_enemy
                            143 ; ---------------------------------
   2338                     144 _create_enemy::
   2338 DD E5         [15]  145 	push	ix
   233A DD 21 00 00   [14]  146 	ld	ix,#0
   233E DD 39         [15]  147 	add	ix,sp
   2340 21 DC FF      [10]  148 	ld	hl,#-36
   2343 39            [11]  149 	add	hl,sp
   2344 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/enemies.c:36: if (active_enemies < MAX_ENEMIES){
   2345 3A CC 46      [13]  152 	ld	a,(#_active_enemies + 0)
   2348 D6 0A         [ 7]  153 	sub	a, #0x0A
   234A D2 D7 25      [10]  154 	jp	NC,00109$
                            155 ;src/entities/enemies.c:38: while (enemies[k].active){
   234D 11 00 00      [10]  156 	ld	de,#0x0000
   2350                     157 00101$:
   2350 21 64 45      [10]  158 	ld	hl,#_enemies
   2353 19            [11]  159 	add	hl,de
   2354 DD 75 FE      [19]  160 	ld	-2 (ix),l
   2357 DD 74 FF      [19]  161 	ld	-1 (ix),h
   235A DD 7E FE      [19]  162 	ld	a,-2 (ix)
   235D C6 17         [ 7]  163 	add	a, #0x17
   235F 6F            [ 4]  164 	ld	l,a
   2360 DD 7E FF      [19]  165 	ld	a,-1 (ix)
   2363 CE 00         [ 7]  166 	adc	a, #0x00
   2365 67            [ 4]  167 	ld	h,a
   2366 7E            [ 7]  168 	ld	a,(hl)
   2367 B7            [ 4]  169 	or	a, a
   2368 28 07         [12]  170 	jr	Z,00103$
                            171 ;src/entities/enemies.c:39: k++;
   236A 21 24 00      [10]  172 	ld	hl,#0x0024
   236D 19            [11]  173 	add	hl,de
   236E EB            [ 4]  174 	ex	de,hl
   236F 18 DF         [12]  175 	jr	00101$
   2371                     176 00103$:
                            177 ;src/entities/enemies.c:41: enemies[k].active=1;
   2371 36 01         [10]  178 	ld	(hl),#0x01
                            179 ;src/entities/enemies.c:42: enemies[k].frame=0;
   2373 DD 7E FE      [19]  180 	ld	a,-2 (ix)
   2376 C6 19         [ 7]  181 	add	a, #0x19
   2378 6F            [ 4]  182 	ld	l,a
   2379 DD 7E FF      [19]  183 	ld	a,-1 (ix)
   237C CE 00         [ 7]  184 	adc	a, #0x00
   237E 67            [ 4]  185 	ld	h,a
   237F 36 00         [10]  186 	ld	(hl),#0x00
                            187 ;src/entities/enemies.c:46: enemies[k].x=x;
   2381 DD 7E FE      [19]  188 	ld	a,-2 (ix)
   2384 C6 10         [ 7]  189 	add	a, #0x10
   2386 DD 77 FC      [19]  190 	ld	-4 (ix),a
   2389 DD 7E FF      [19]  191 	ld	a,-1 (ix)
   238C CE 00         [ 7]  192 	adc	a, #0x00
   238E DD 77 FD      [19]  193 	ld	-3 (ix),a
   2391 DD 7E 04      [19]  194 	ld	a,4 (ix)
   2394 DD 77 FA      [19]  195 	ld	-6 (ix),a
   2397 DD 36 FB 00   [19]  196 	ld	-5 (ix),#0x00
                            197 ;src/entities/enemies.c:47: enemies[k].y=y;
   239B DD 7E FE      [19]  198 	ld	a,-2 (ix)
   239E C6 12         [ 7]  199 	add	a, #0x12
   23A0 DD 77 F8      [19]  200 	ld	-8 (ix),a
   23A3 DD 7E FF      [19]  201 	ld	a,-1 (ix)
   23A6 CE 00         [ 7]  202 	adc	a, #0x00
   23A8 DD 77 F9      [19]  203 	ld	-7 (ix),a
   23AB DD 7E 05      [19]  204 	ld	a,5 (ix)
   23AE DD 77 F6      [19]  205 	ld	-10 (ix),a
   23B1 DD 36 F7 00   [19]  206 	ld	-9 (ix),#0x00
                            207 ;src/entities/enemies.c:48: enemies[k].w=6;
   23B5 DD 7E FE      [19]  208 	ld	a,-2 (ix)
   23B8 C6 14         [ 7]  209 	add	a, #0x14
   23BA DD 77 F4      [19]  210 	ld	-12 (ix),a
   23BD DD 7E FF      [19]  211 	ld	a,-1 (ix)
   23C0 CE 00         [ 7]  212 	adc	a, #0x00
   23C2 DD 77 F5      [19]  213 	ld	-11 (ix),a
                            214 ;src/entities/enemies.c:49: enemies[k].h=12;
   23C5 DD 7E FE      [19]  215 	ld	a,-2 (ix)
   23C8 C6 15         [ 7]  216 	add	a, #0x15
   23CA DD 77 F2      [19]  217 	ld	-14 (ix),a
   23CD DD 7E FF      [19]  218 	ld	a,-1 (ix)
   23D0 CE 00         [ 7]  219 	adc	a, #0x00
   23D2 DD 77 F3      [19]  220 	ld	-13 (ix),a
                            221 ;src/entities/enemies.c:50: enemies[k].num_frames=0;
   23D5 DD 7E FE      [19]  222 	ld	a,-2 (ix)
   23D8 C6 18         [ 7]  223 	add	a, #0x18
   23DA DD 77 F0      [19]  224 	ld	-16 (ix),a
   23DD DD 7E FF      [19]  225 	ld	a,-1 (ix)
   23E0 CE 00         [ 7]  226 	adc	a, #0x00
   23E2 DD 77 F1      [19]  227 	ld	-15 (ix),a
                            228 ;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   23E5 DD 7E FE      [19]  229 	ld	a,-2 (ix)
   23E8 C6 02         [ 7]  230 	add	a, #0x02
   23EA DD 77 EE      [19]  231 	ld	-18 (ix),a
   23ED DD 7E FF      [19]  232 	ld	a,-1 (ix)
   23F0 CE 00         [ 7]  233 	adc	a, #0x00
   23F2 DD 77 EF      [19]  234 	ld	-17 (ix),a
                            235 ;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   23F5 DD 7E FE      [19]  236 	ld	a,-2 (ix)
   23F8 C6 04         [ 7]  237 	add	a, #0x04
   23FA DD 77 EC      [19]  238 	ld	-20 (ix),a
   23FD DD 7E FF      [19]  239 	ld	a,-1 (ix)
   2400 CE 00         [ 7]  240 	adc	a, #0x00
   2402 DD 77 ED      [19]  241 	ld	-19 (ix),a
                            242 ;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   2405 DD 7E FE      [19]  243 	ld	a,-2 (ix)
   2408 C6 06         [ 7]  244 	add	a, #0x06
   240A DD 77 EA      [19]  245 	ld	-22 (ix),a
   240D DD 7E FF      [19]  246 	ld	a,-1 (ix)
   2410 CE 00         [ 7]  247 	adc	a, #0x00
   2412 DD 77 EB      [19]  248 	ld	-21 (ix),a
                            249 ;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2415 DD 7E FE      [19]  250 	ld	a,-2 (ix)
   2418 C6 08         [ 7]  251 	add	a, #0x08
   241A DD 77 E8      [19]  252 	ld	-24 (ix),a
   241D DD 7E FF      [19]  253 	ld	a,-1 (ix)
   2420 CE 00         [ 7]  254 	adc	a, #0x00
   2422 DD 77 E9      [19]  255 	ld	-23 (ix),a
                            256 ;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2425 DD 7E FE      [19]  257 	ld	a,-2 (ix)
   2428 C6 0A         [ 7]  258 	add	a, #0x0A
   242A DD 77 E6      [19]  259 	ld	-26 (ix),a
   242D DD 7E FF      [19]  260 	ld	a,-1 (ix)
   2430 CE 00         [ 7]  261 	adc	a, #0x00
   2432 DD 77 E7      [19]  262 	ld	-25 (ix),a
                            263 ;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2435 DD 7E FE      [19]  264 	ld	a,-2 (ix)
   2438 C6 0C         [ 7]  265 	add	a, #0x0C
   243A DD 77 E4      [19]  266 	ld	-28 (ix),a
   243D DD 7E FF      [19]  267 	ld	a,-1 (ix)
   2440 CE 00         [ 7]  268 	adc	a, #0x00
   2442 DD 77 E5      [19]  269 	ld	-27 (ix),a
                            270 ;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2445 DD 7E FE      [19]  271 	ld	a,-2 (ix)
   2448 C6 0E         [ 7]  272 	add	a, #0x0E
   244A DD 77 E2      [19]  273 	ld	-30 (ix),a
   244D DD 7E FF      [19]  274 	ld	a,-1 (ix)
   2450 CE 00         [ 7]  275 	adc	a, #0x00
   2452 DD 77 E3      [19]  276 	ld	-29 (ix),a
                            277 ;src/entities/enemies.c:59: enemies[k].movement=0;
   2455 DD 7E FE      [19]  278 	ld	a,-2 (ix)
   2458 C6 1D         [ 7]  279 	add	a, #0x1D
   245A DD 77 E0      [19]  280 	ld	-32 (ix),a
   245D DD 7E FF      [19]  281 	ld	a,-1 (ix)
   2460 CE 00         [ 7]  282 	adc	a, #0x00
   2462 DD 77 E1      [19]  283 	ld	-31 (ix),a
                            284 ;src/entities/enemies.c:60: enemies[k].stage=0;
   2465 DD 7E FE      [19]  285 	ld	a,-2 (ix)
   2468 C6 1E         [ 7]  286 	add	a, #0x1E
   246A DD 77 DE      [19]  287 	ld	-34 (ix),a
   246D DD 7E FF      [19]  288 	ld	a,-1 (ix)
   2470 CE 00         [ 7]  289 	adc	a, #0x00
   2472 DD 77 DF      [19]  290 	ld	-33 (ix),a
                            291 ;src/entities/enemies.c:61: enemies[k].stage_step=0;
   2475 DD 7E FE      [19]  292 	ld	a,-2 (ix)
   2478 C6 1F         [ 7]  293 	add	a, #0x1F
   247A DD 77 DC      [19]  294 	ld	-36 (ix),a
   247D DD 7E FF      [19]  295 	ld	a,-1 (ix)
   2480 CE 00         [ 7]  296 	adc	a, #0x00
   2482 DD 77 DD      [19]  297 	ld	-35 (ix),a
                            298 ;src/entities/enemies.c:43: switch (type){
   2485 DD 7E 06      [19]  299 	ld	a,6 (ix)
   2488 3D            [ 4]  300 	dec	a
   2489 C2 31 25      [10]  301 	jp	NZ,00105$
                            302 ;src/entities/enemies.c:46: enemies[k].x=x;
   248C DD 6E FC      [19]  303 	ld	l,-4 (ix)
   248F DD 66 FD      [19]  304 	ld	h,-3 (ix)
   2492 DD 7E FA      [19]  305 	ld	a,-6 (ix)
   2495 77            [ 7]  306 	ld	(hl),a
   2496 23            [ 6]  307 	inc	hl
   2497 DD 7E FB      [19]  308 	ld	a,-5 (ix)
   249A 77            [ 7]  309 	ld	(hl),a
                            310 ;src/entities/enemies.c:47: enemies[k].y=y;
   249B DD 6E F8      [19]  311 	ld	l,-8 (ix)
   249E DD 66 F9      [19]  312 	ld	h,-7 (ix)
   24A1 DD 7E F6      [19]  313 	ld	a,-10 (ix)
   24A4 77            [ 7]  314 	ld	(hl),a
   24A5 23            [ 6]  315 	inc	hl
   24A6 DD 7E F7      [19]  316 	ld	a,-9 (ix)
   24A9 77            [ 7]  317 	ld	(hl),a
                            318 ;src/entities/enemies.c:48: enemies[k].w=6;
   24AA DD 6E F4      [19]  319 	ld	l,-12 (ix)
   24AD DD 66 F5      [19]  320 	ld	h,-11 (ix)
   24B0 36 06         [10]  321 	ld	(hl),#0x06
                            322 ;src/entities/enemies.c:49: enemies[k].h=12;
   24B2 DD 6E F2      [19]  323 	ld	l,-14 (ix)
   24B5 DD 66 F3      [19]  324 	ld	h,-13 (ix)
   24B8 36 0C         [10]  325 	ld	(hl),#0x0C
                            326 ;src/entities/enemies.c:50: enemies[k].num_frames=0;
   24BA DD 6E F0      [19]  327 	ld	l,-16 (ix)
   24BD DD 66 F1      [19]  328 	ld	h,-15 (ix)
   24C0 36 00         [10]  329 	ld	(hl),#0x00
                            330 ;src/entities/enemies.c:51: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   24C2 DD 6E FE      [19]  331 	ld	l,-2 (ix)
   24C5 DD 66 FF      [19]  332 	ld	h,-1 (ix)
   24C8 36 A0         [10]  333 	ld	(hl),#<(_G_baddie02_00)
   24CA 23            [ 6]  334 	inc	hl
   24CB 36 34         [10]  335 	ld	(hl),#>(_G_baddie02_00)
                            336 ;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   24CD DD 6E EE      [19]  337 	ld	l,-18 (ix)
   24D0 DD 66 EF      [19]  338 	ld	h,-17 (ix)
   24D3 36 E8         [10]  339 	ld	(hl),#<(_G_baddie02_01)
   24D5 23            [ 6]  340 	inc	hl
   24D6 36 34         [10]  341 	ld	(hl),#>(_G_baddie02_01)
                            342 ;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   24D8 DD 6E EC      [19]  343 	ld	l,-20 (ix)
   24DB DD 66 ED      [19]  344 	ld	h,-19 (ix)
   24DE 36 30         [10]  345 	ld	(hl),#<(_G_baddie02_02)
   24E0 23            [ 6]  346 	inc	hl
   24E1 36 35         [10]  347 	ld	(hl),#>(_G_baddie02_02)
                            348 ;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24E3 DD 6E EA      [19]  349 	ld	l,-22 (ix)
   24E6 DD 66 EB      [19]  350 	ld	h,-21 (ix)
   24E9 36 78         [10]  351 	ld	(hl),#<(_G_baddie02_03)
   24EB 23            [ 6]  352 	inc	hl
   24EC 36 35         [10]  353 	ld	(hl),#>(_G_baddie02_03)
                            354 ;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   24EE DD 6E E8      [19]  355 	ld	l,-24 (ix)
   24F1 DD 66 E9      [19]  356 	ld	h,-23 (ix)
   24F4 36 C0         [10]  357 	ld	(hl),#<(_G_baddie02_04)
   24F6 23            [ 6]  358 	inc	hl
   24F7 36 35         [10]  359 	ld	(hl),#>(_G_baddie02_04)
                            360 ;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   24F9 DD 6E E6      [19]  361 	ld	l,-26 (ix)
   24FC DD 66 E7      [19]  362 	ld	h,-25 (ix)
   24FF 36 08         [10]  363 	ld	(hl),#<(_G_baddie02_05)
   2501 23            [ 6]  364 	inc	hl
   2502 36 36         [10]  365 	ld	(hl),#>(_G_baddie02_05)
                            366 ;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2504 DD 6E E4      [19]  367 	ld	l,-28 (ix)
   2507 DD 66 E5      [19]  368 	ld	h,-27 (ix)
   250A 36 50         [10]  369 	ld	(hl),#<(_G_baddie02_06)
   250C 23            [ 6]  370 	inc	hl
   250D 36 36         [10]  371 	ld	(hl),#>(_G_baddie02_06)
                            372 ;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   250F DD 6E E2      [19]  373 	ld	l,-30 (ix)
   2512 DD 66 E3      [19]  374 	ld	h,-29 (ix)
   2515 36 98         [10]  375 	ld	(hl),#<(_G_baddie02_07)
   2517 23            [ 6]  376 	inc	hl
   2518 36 36         [10]  377 	ld	(hl),#>(_G_baddie02_07)
                            378 ;src/entities/enemies.c:59: enemies[k].movement=0;
   251A DD 6E E0      [19]  379 	ld	l,-32 (ix)
   251D DD 66 E1      [19]  380 	ld	h,-31 (ix)
   2520 36 00         [10]  381 	ld	(hl),#0x00
                            382 ;src/entities/enemies.c:60: enemies[k].stage=0;
   2522 DD 6E DE      [19]  383 	ld	l,-34 (ix)
   2525 DD 66 DF      [19]  384 	ld	h,-33 (ix)
   2528 36 00         [10]  385 	ld	(hl),#0x00
                            386 ;src/entities/enemies.c:61: enemies[k].stage_step=0;
   252A E1            [10]  387 	pop	hl
   252B E5            [11]  388 	push	hl
   252C 36 00         [10]  389 	ld	(hl),#0x00
                            390 ;src/entities/enemies.c:62: break;
   252E C3 D3 25      [10]  391 	jp	00106$
                            392 ;src/entities/enemies.c:63: default:
   2531                     393 00105$:
                            394 ;src/entities/enemies.c:64: enemies[k].x=x;
   2531 DD 6E FC      [19]  395 	ld	l,-4 (ix)
   2534 DD 66 FD      [19]  396 	ld	h,-3 (ix)
   2537 DD 7E FA      [19]  397 	ld	a,-6 (ix)
   253A 77            [ 7]  398 	ld	(hl),a
   253B 23            [ 6]  399 	inc	hl
   253C DD 7E FB      [19]  400 	ld	a,-5 (ix)
   253F 77            [ 7]  401 	ld	(hl),a
                            402 ;src/entities/enemies.c:65: enemies[k].y=y;
   2540 DD 6E F8      [19]  403 	ld	l,-8 (ix)
   2543 DD 66 F9      [19]  404 	ld	h,-7 (ix)
   2546 DD 7E F6      [19]  405 	ld	a,-10 (ix)
   2549 77            [ 7]  406 	ld	(hl),a
   254A 23            [ 6]  407 	inc	hl
   254B DD 7E F7      [19]  408 	ld	a,-9 (ix)
   254E 77            [ 7]  409 	ld	(hl),a
                            410 ;src/entities/enemies.c:66: enemies[k].w=5;
   254F DD 6E F4      [19]  411 	ld	l,-12 (ix)
   2552 DD 66 F5      [19]  412 	ld	h,-11 (ix)
   2555 36 05         [10]  413 	ld	(hl),#0x05
                            414 ;src/entities/enemies.c:67: enemies[k].h=16;
   2557 DD 6E F2      [19]  415 	ld	l,-14 (ix)
   255A DD 66 F3      [19]  416 	ld	h,-13 (ix)
   255D 36 10         [10]  417 	ld	(hl),#0x10
                            418 ;src/entities/enemies.c:68: enemies[k].num_frames=0;
   255F DD 6E F0      [19]  419 	ld	l,-16 (ix)
   2562 DD 66 F1      [19]  420 	ld	h,-15 (ix)
   2565 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/entities/enemies.c:69: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2567 DD 6E FE      [19]  423 	ld	l,-2 (ix)
   256A DD 66 FF      [19]  424 	ld	h,-1 (ix)
   256D 36 20         [10]  425 	ld	(hl),#<(_G_baddie01_00)
   256F 23            [ 6]  426 	inc	hl
   2570 36 32         [10]  427 	ld	(hl),#>(_G_baddie01_00)
                            428 ;src/entities/enemies.c:70: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   2572 DD 6E EE      [19]  429 	ld	l,-18 (ix)
   2575 DD 66 EF      [19]  430 	ld	h,-17 (ix)
   2578 36 70         [10]  431 	ld	(hl),#<(_G_baddie01_01)
   257A 23            [ 6]  432 	inc	hl
   257B 36 32         [10]  433 	ld	(hl),#>(_G_baddie01_01)
                            434 ;src/entities/enemies.c:71: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   257D DD 6E EC      [19]  435 	ld	l,-20 (ix)
   2580 DD 66 ED      [19]  436 	ld	h,-19 (ix)
   2583 36 C0         [10]  437 	ld	(hl),#<(_G_baddie01_02)
   2585 23            [ 6]  438 	inc	hl
   2586 36 32         [10]  439 	ld	(hl),#>(_G_baddie01_02)
                            440 ;src/entities/enemies.c:72: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2588 DD 6E EA      [19]  441 	ld	l,-22 (ix)
   258B DD 66 EB      [19]  442 	ld	h,-21 (ix)
   258E 36 10         [10]  443 	ld	(hl),#<(_G_baddie01_03)
   2590 23            [ 6]  444 	inc	hl
   2591 36 33         [10]  445 	ld	(hl),#>(_G_baddie01_03)
                            446 ;src/entities/enemies.c:73: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   2593 DD 6E E8      [19]  447 	ld	l,-24 (ix)
   2596 DD 66 E9      [19]  448 	ld	h,-23 (ix)
   2599 36 60         [10]  449 	ld	(hl),#<(_G_baddie01_04)
   259B 23            [ 6]  450 	inc	hl
   259C 36 33         [10]  451 	ld	(hl),#>(_G_baddie01_04)
                            452 ;src/entities/enemies.c:74: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   259E DD 6E E6      [19]  453 	ld	l,-26 (ix)
   25A1 DD 66 E7      [19]  454 	ld	h,-25 (ix)
   25A4 36 B0         [10]  455 	ld	(hl),#<(_G_baddie01_05)
   25A6 23            [ 6]  456 	inc	hl
   25A7 36 33         [10]  457 	ld	(hl),#>(_G_baddie01_05)
                            458 ;src/entities/enemies.c:75: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   25A9 DD 6E E4      [19]  459 	ld	l,-28 (ix)
   25AC DD 66 E5      [19]  460 	ld	h,-27 (ix)
   25AF 36 00         [10]  461 	ld	(hl),#<(_G_baddie01_06)
   25B1 23            [ 6]  462 	inc	hl
   25B2 36 34         [10]  463 	ld	(hl),#>(_G_baddie01_06)
                            464 ;src/entities/enemies.c:76: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   25B4 DD 6E E2      [19]  465 	ld	l,-30 (ix)
   25B7 DD 66 E3      [19]  466 	ld	h,-29 (ix)
   25BA 36 50         [10]  467 	ld	(hl),#<(_G_baddie01_07)
   25BC 23            [ 6]  468 	inc	hl
   25BD 36 34         [10]  469 	ld	(hl),#>(_G_baddie01_07)
                            470 ;src/entities/enemies.c:77: enemies[k].movement=1;
   25BF DD 6E E0      [19]  471 	ld	l,-32 (ix)
   25C2 DD 66 E1      [19]  472 	ld	h,-31 (ix)
   25C5 36 01         [10]  473 	ld	(hl),#0x01
                            474 ;src/entities/enemies.c:78: enemies[k].stage=0;
   25C7 DD 6E DE      [19]  475 	ld	l,-34 (ix)
   25CA DD 66 DF      [19]  476 	ld	h,-33 (ix)
   25CD 36 00         [10]  477 	ld	(hl),#0x00
                            478 ;src/entities/enemies.c:79: enemies[k].stage_step=0;
   25CF E1            [10]  479 	pop	hl
   25D0 E5            [11]  480 	push	hl
   25D1 36 00         [10]  481 	ld	(hl),#0x00
                            482 ;src/entities/enemies.c:81: }
   25D3                     483 00106$:
                            484 ;src/entities/enemies.c:82: active_enemies++;
   25D3 21 CC 46      [10]  485 	ld	hl, #_active_enemies+0
   25D6 34            [11]  486 	inc	(hl)
   25D7                     487 00109$:
   25D7 DD F9         [10]  488 	ld	sp, ix
   25D9 DD E1         [14]  489 	pop	ix
   25DB C9            [10]  490 	ret
                            491 ;src/entities/enemies.c:88: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            492 ;	---------------------------------
                            493 ; Function create_enemy_group
                            494 ; ---------------------------------
   25DC                     495 _create_enemy_group::
   25DC DD E5         [15]  496 	push	ix
   25DE DD 21 00 00   [14]  497 	ld	ix,#0
   25E2 DD 39         [15]  498 	add	ix,sp
                            499 ;src/entities/enemies.c:90: if (active_groups < MAX_ENEMY_GROUPS){
   25E4 3A DD 46      [13]  500 	ld	a,(#_active_groups + 0)
   25E7 D6 02         [ 7]  501 	sub	a, #0x02
   25E9 30 4E         [12]  502 	jr	NC,00106$
                            503 ;src/entities/enemies.c:92: while (groups[k].active){
   25EB 16 00         [ 7]  504 	ld	d,#0x00
   25ED                     505 00101$:
   25ED 6A            [ 4]  506 	ld	l,d
   25EE 26 00         [ 7]  507 	ld	h,#0x00
   25F0 29            [11]  508 	add	hl, hl
   25F1 29            [11]  509 	add	hl, hl
   25F2 29            [11]  510 	add	hl, hl
   25F3 3E CD         [ 7]  511 	ld	a,#<(_groups)
   25F5 85            [ 4]  512 	add	a, l
   25F6 4F            [ 4]  513 	ld	c,a
   25F7 3E 46         [ 7]  514 	ld	a,#>(_groups)
   25F9 8C            [ 4]  515 	adc	a, h
   25FA 47            [ 4]  516 	ld	b,a
   25FB 0A            [ 7]  517 	ld	a,(bc)
   25FC B7            [ 4]  518 	or	a, a
   25FD 28 03         [12]  519 	jr	Z,00103$
                            520 ;src/entities/enemies.c:93: k++;
   25FF 14            [ 4]  521 	inc	d
   2600 18 EB         [12]  522 	jr	00101$
   2602                     523 00103$:
                            524 ;src/entities/enemies.c:95: groups[k].active=1;
   2602 3E 01         [ 7]  525 	ld	a,#0x01
   2604 02            [ 7]  526 	ld	(bc),a
                            527 ;src/entities/enemies.c:96: groups[k].x=x;
   2605 69            [ 4]  528 	ld	l, c
   2606 60            [ 4]  529 	ld	h, b
   2607 23            [ 6]  530 	inc	hl
   2608 DD 7E 04      [19]  531 	ld	a,4 (ix)
   260B 77            [ 7]  532 	ld	(hl),a
   260C 23            [ 6]  533 	inc	hl
   260D DD 7E 05      [19]  534 	ld	a,5 (ix)
   2610 77            [ 7]  535 	ld	(hl),a
                            536 ;src/entities/enemies.c:97: groups[k].y=y;
   2611 69            [ 4]  537 	ld	l, c
   2612 60            [ 4]  538 	ld	h, b
   2613 23            [ 6]  539 	inc	hl
   2614 23            [ 6]  540 	inc	hl
   2615 23            [ 6]  541 	inc	hl
   2616 DD 7E 06      [19]  542 	ld	a,6 (ix)
   2619 77            [ 7]  543 	ld	(hl),a
   261A 23            [ 6]  544 	inc	hl
   261B DD 7E 07      [19]  545 	ld	a,7 (ix)
   261E 77            [ 7]  546 	ld	(hl),a
                            547 ;src/entities/enemies.c:98: groups[k].enemy_type=type;
   261F 21 05 00      [10]  548 	ld	hl,#0x0005
   2622 09            [11]  549 	add	hl,bc
   2623 DD 7E 08      [19]  550 	ld	a,8 (ix)
   2626 77            [ 7]  551 	ld	(hl),a
                            552 ;src/entities/enemies.c:99: groups[k].num_enemies=num_enemies;
   2627 21 06 00      [10]  553 	ld	hl,#0x0006
   262A 09            [11]  554 	add	hl,bc
   262B DD 7E 09      [19]  555 	ld	a,9 (ix)
   262E 77            [ 7]  556 	ld	(hl),a
                            557 ;src/entities/enemies.c:100: groups[k].sleep=ENEMY_GAP;
   262F 21 07 00      [10]  558 	ld	hl,#0x0007
   2632 09            [11]  559 	add	hl,bc
   2633 36 04         [10]  560 	ld	(hl),#0x04
                            561 ;src/entities/enemies.c:101: active_groups++;
   2635 21 DD 46      [10]  562 	ld	hl, #_active_groups+0
   2638 34            [11]  563 	inc	(hl)
   2639                     564 00106$:
   2639 DD E1         [14]  565 	pop	ix
   263B C9            [10]  566 	ret
                            567 ;src/entities/enemies.c:109: void update_enemies(){
                            568 ;	---------------------------------
                            569 ; Function update_enemies
                            570 ; ---------------------------------
   263C                     571 _update_enemies::
   263C DD E5         [15]  572 	push	ix
   263E DD 21 00 00   [14]  573 	ld	ix,#0
   2642 DD 39         [15]  574 	add	ix,sp
   2644 21 F1 FF      [10]  575 	ld	hl,#-15
   2647 39            [11]  576 	add	hl,sp
   2648 F9            [ 6]  577 	ld	sp,hl
                            578 ;src/entities/enemies.c:113: if (active_enemies>0){
   2649 3A CC 46      [13]  579 	ld	a,(#_active_enemies + 0)
   264C B7            [ 4]  580 	or	a, a
   264D CA 33 28      [10]  581 	jp	Z,00112$
                            582 ;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
   2650 01 44 2A      [10]  583 	ld	bc,#_movements+0
   2653 DD 36 F1 00   [19]  584 	ld	-15 (ix),#0x00
   2657 DD 36 F7 00   [19]  585 	ld	-9 (ix),#0x00
   265B DD 36 F8 00   [19]  586 	ld	-8 (ix),#0x00
   265F                     587 00124$:
                            588 ;src/entities/enemies.c:115: if (enemies[i].active){
   265F 3E 64         [ 7]  589 	ld	a,#<(_enemies)
   2661 DD 86 F7      [19]  590 	add	a, -9 (ix)
   2664 DD 77 FB      [19]  591 	ld	-5 (ix),a
   2667 3E 45         [ 7]  592 	ld	a,#>(_enemies)
   2669 DD 8E F8      [19]  593 	adc	a, -8 (ix)
   266C DD 77 FC      [19]  594 	ld	-4 (ix),a
   266F DD 6E FB      [19]  595 	ld	l,-5 (ix)
   2672 DD 66 FC      [19]  596 	ld	h,-4 (ix)
   2675 11 17 00      [10]  597 	ld	de, #0x0017
   2678 19            [11]  598 	add	hl, de
   2679 7E            [ 7]  599 	ld	a,(hl)
   267A B7            [ 4]  600 	or	a, a
   267B CA 18 28      [10]  601 	jp	Z,00125$
                            602 ;src/entities/enemies.c:116: if (enemies[i].movement<99){
   267E DD 7E FB      [19]  603 	ld	a,-5 (ix)
   2681 C6 1D         [ 7]  604 	add	a, #0x1D
   2683 DD 77 F5      [19]  605 	ld	-11 (ix),a
   2686 DD 7E FC      [19]  606 	ld	a,-4 (ix)
   2689 CE 00         [ 7]  607 	adc	a, #0x00
   268B DD 77 F6      [19]  608 	ld	-10 (ix),a
   268E DD 6E F5      [19]  609 	ld	l,-11 (ix)
   2691 DD 66 F6      [19]  610 	ld	h,-10 (ix)
   2694 7E            [ 7]  611 	ld	a,(hl)
   2695 DD 77 F4      [19]  612 	ld	-12 (ix), a
   2698 D6 63         [ 7]  613 	sub	a, #0x63
   269A D2 18 28      [10]  614 	jp	NC,00125$
                            615 ;src/entities/enemies.c:117: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   269D DD 7E FB      [19]  616 	ld	a,-5 (ix)
   26A0 C6 1F         [ 7]  617 	add	a, #0x1F
   26A2 5F            [ 4]  618 	ld	e,a
   26A3 DD 7E FC      [19]  619 	ld	a,-4 (ix)
   26A6 CE 00         [ 7]  620 	adc	a, #0x00
   26A8 57            [ 4]  621 	ld	d,a
   26A9 1A            [ 7]  622 	ld	a,(de)
   26AA DD 77 FF      [19]  623 	ld	-1 (ix),a
   26AD D5            [11]  624 	push	de
   26AE DD 5E F4      [19]  625 	ld	e,-12 (ix)
   26B1 16 00         [ 7]  626 	ld	d,#0x00
   26B3 6B            [ 4]  627 	ld	l, e
   26B4 62            [ 4]  628 	ld	h, d
   26B5 29            [11]  629 	add	hl, hl
   26B6 29            [11]  630 	add	hl, hl
   26B7 29            [11]  631 	add	hl, hl
   26B8 29            [11]  632 	add	hl, hl
   26B9 29            [11]  633 	add	hl, hl
   26BA 19            [11]  634 	add	hl, de
   26BB D1            [10]  635 	pop	de
   26BC 09            [11]  636 	add	hl, bc
   26BD 23            [ 6]  637 	inc	hl
   26BE E5            [11]  638 	push	hl
   26BF FD E1         [14]  639 	pop	iy
   26C1 DD 7E FB      [19]  640 	ld	a,-5 (ix)
   26C4 C6 1E         [ 7]  641 	add	a, #0x1E
   26C6 DD 77 FD      [19]  642 	ld	-3 (ix),a
   26C9 DD 7E FC      [19]  643 	ld	a,-4 (ix)
   26CC CE 00         [ 7]  644 	adc	a, #0x00
   26CE DD 77 FE      [19]  645 	ld	-2 (ix),a
   26D1 DD 6E FD      [19]  646 	ld	l,-3 (ix)
   26D4 DD 66 FE      [19]  647 	ld	h,-2 (ix)
   26D7 7E            [ 7]  648 	ld	a,(hl)
   26D8 DD 77 F4      [19]  649 	ld	-12 (ix), a
   26DB 87            [ 4]  650 	add	a, a
   26DC 87            [ 4]  651 	add	a, a
   26DD 67            [ 4]  652 	ld	h,a
   26DE C5            [11]  653 	push	bc
   26DF 4C            [ 4]  654 	ld	c,h
   26E0 06 00         [ 7]  655 	ld	b,#0x00
   26E2 FD 09         [15]  656 	add	iy, bc
   26E4 C1            [10]  657 	pop	bc
   26E5 FD E5         [15]  658 	push	iy
   26E7 E1            [10]  659 	pop	hl
   26E8 23            [ 6]  660 	inc	hl
   26E9 23            [ 6]  661 	inc	hl
   26EA 23            [ 6]  662 	inc	hl
   26EB DD 7E FF      [19]  663 	ld	a,-1 (ix)
   26EE 96            [ 7]  664 	sub	a,(hl)
   26EF D2 E5 27      [10]  665 	jp	NC,00104$
                            666 ;src/entities/enemies.c:118: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   26F2 DD 7E FB      [19]  667 	ld	a,-5 (ix)
   26F5 C6 16         [ 7]  668 	add	a, #0x16
   26F7 DD 77 F2      [19]  669 	ld	-14 (ix),a
   26FA DD 7E FC      [19]  670 	ld	a,-4 (ix)
   26FD CE 00         [ 7]  671 	adc	a, #0x00
   26FF DD 77 F3      [19]  672 	ld	-13 (ix),a
   2702 FD 7E 00      [19]  673 	ld	a, 0 (iy)
   2705 DD 6E F2      [19]  674 	ld	l,-14 (ix)
   2708 DD 66 F3      [19]  675 	ld	h,-13 (ix)
   270B 77            [ 7]  676 	ld	(hl),a
                            677 ;src/entities/enemies.c:119: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   270C FD 21 10 00   [14]  678 	ld	iy,#0x0010
   2710 C5            [11]  679 	push	bc
   2711 DD 4E FB      [19]  680 	ld	c,-5 (ix)
   2714 DD 46 FC      [19]  681 	ld	b,-4 (ix)
   2717 FD 09         [15]  682 	add	iy, bc
   2719 C1            [10]  683 	pop	bc
   271A FD 7E 00      [19]  684 	ld	a,0 (iy)
   271D DD 77 F2      [19]  685 	ld	-14 (ix),a
   2720 FD 7E 01      [19]  686 	ld	a,1 (iy)
   2723 DD 77 F3      [19]  687 	ld	-13 (ix),a
   2726 DD 6E F5      [19]  688 	ld	l,-11 (ix)
   2729 DD 66 F6      [19]  689 	ld	h,-10 (ix)
   272C 7E            [ 7]  690 	ld	a,(hl)
   272D D5            [11]  691 	push	de
   272E 5F            [ 4]  692 	ld	e,a
   272F 16 00         [ 7]  693 	ld	d,#0x00
   2731 6B            [ 4]  694 	ld	l, e
   2732 62            [ 4]  695 	ld	h, d
   2733 29            [11]  696 	add	hl, hl
   2734 29            [11]  697 	add	hl, hl
   2735 29            [11]  698 	add	hl, hl
   2736 29            [11]  699 	add	hl, hl
   2737 29            [11]  700 	add	hl, hl
   2738 19            [11]  701 	add	hl, de
   2739 D1            [10]  702 	pop	de
   273A 09            [11]  703 	add	hl,bc
   273B 23            [ 6]  704 	inc	hl
   273C DD 75 F9      [19]  705 	ld	-7 (ix),l
   273F DD 74 FA      [19]  706 	ld	-6 (ix),h
   2742 DD 6E FD      [19]  707 	ld	l,-3 (ix)
   2745 DD 66 FE      [19]  708 	ld	h,-2 (ix)
   2748 7E            [ 7]  709 	ld	a,(hl)
   2749 87            [ 4]  710 	add	a, a
   274A 87            [ 4]  711 	add	a, a
   274B 67            [ 4]  712 	ld	h,a
   274C DD 7E F9      [19]  713 	ld	a,-7 (ix)
   274F 84            [ 4]  714 	add	a, h
   2750 6F            [ 4]  715 	ld	l,a
   2751 DD 7E FA      [19]  716 	ld	a,-6 (ix)
   2754 CE 00         [ 7]  717 	adc	a, #0x00
   2756 67            [ 4]  718 	ld	h,a
   2757 23            [ 6]  719 	inc	hl
   2758 7E            [ 7]  720 	ld	a,(hl)
   2759 6F            [ 4]  721 	ld	l,a
   275A 17            [ 4]  722 	rla
   275B 9F            [ 4]  723 	sbc	a, a
   275C 67            [ 4]  724 	ld	h,a
   275D DD 7E F2      [19]  725 	ld	a,-14 (ix)
   2760 85            [ 4]  726 	add	a, l
   2761 6F            [ 4]  727 	ld	l,a
   2762 DD 7E F3      [19]  728 	ld	a,-13 (ix)
   2765 8C            [ 4]  729 	adc	a, h
   2766 FD 75 00      [19]  730 	ld	0 (iy), l
   2769 FD 77 01      [19]  731 	ld	1 (iy), a
                            732 ;src/entities/enemies.c:120: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   276C DD 7E FB      [19]  733 	ld	a,-5 (ix)
   276F C6 12         [ 7]  734 	add	a, #0x12
   2771 DD 77 F9      [19]  735 	ld	-7 (ix),a
   2774 DD 7E FC      [19]  736 	ld	a,-4 (ix)
   2777 CE 00         [ 7]  737 	adc	a, #0x00
   2779 DD 77 FA      [19]  738 	ld	-6 (ix),a
   277C DD 6E F9      [19]  739 	ld	l,-7 (ix)
   277F DD 66 FA      [19]  740 	ld	h,-6 (ix)
   2782 7E            [ 7]  741 	ld	a,(hl)
   2783 DD 77 F2      [19]  742 	ld	-14 (ix),a
   2786 23            [ 6]  743 	inc	hl
   2787 7E            [ 7]  744 	ld	a,(hl)
   2788 DD 77 F3      [19]  745 	ld	-13 (ix),a
   278B DD 6E F5      [19]  746 	ld	l,-11 (ix)
   278E DD 66 F6      [19]  747 	ld	h,-10 (ix)
   2791 7E            [ 7]  748 	ld	a,(hl)
   2792 D5            [11]  749 	push	de
   2793 5F            [ 4]  750 	ld	e,a
   2794 16 00         [ 7]  751 	ld	d,#0x00
   2796 6B            [ 4]  752 	ld	l, e
   2797 62            [ 4]  753 	ld	h, d
   2798 29            [11]  754 	add	hl, hl
   2799 29            [11]  755 	add	hl, hl
   279A 29            [11]  756 	add	hl, hl
   279B 29            [11]  757 	add	hl, hl
   279C 29            [11]  758 	add	hl, hl
   279D 19            [11]  759 	add	hl, de
   279E D1            [10]  760 	pop	de
   279F 09            [11]  761 	add	hl,bc
   27A0 23            [ 6]  762 	inc	hl
   27A1 DD 75 FB      [19]  763 	ld	-5 (ix),l
   27A4 DD 74 FC      [19]  764 	ld	-4 (ix),h
   27A7 DD 6E FD      [19]  765 	ld	l,-3 (ix)
   27AA DD 66 FE      [19]  766 	ld	h,-2 (ix)
   27AD 7E            [ 7]  767 	ld	a,(hl)
   27AE 87            [ 4]  768 	add	a, a
   27AF 87            [ 4]  769 	add	a, a
   27B0 67            [ 4]  770 	ld	h,a
   27B1 DD 7E FB      [19]  771 	ld	a,-5 (ix)
   27B4 84            [ 4]  772 	add	a, h
   27B5 6F            [ 4]  773 	ld	l,a
   27B6 DD 7E FC      [19]  774 	ld	a,-4 (ix)
   27B9 CE 00         [ 7]  775 	adc	a, #0x00
   27BB 67            [ 4]  776 	ld	h,a
   27BC 23            [ 6]  777 	inc	hl
   27BD 23            [ 6]  778 	inc	hl
   27BE 7E            [ 7]  779 	ld	a,(hl)
   27BF 6F            [ 4]  780 	ld	l,a
   27C0 17            [ 4]  781 	rla
   27C1 9F            [ 4]  782 	sbc	a, a
   27C2 67            [ 4]  783 	ld	h,a
   27C3 DD 7E F2      [19]  784 	ld	a,-14 (ix)
   27C6 85            [ 4]  785 	add	a, l
   27C7 DD 77 F2      [19]  786 	ld	-14 (ix),a
   27CA DD 7E F3      [19]  787 	ld	a,-13 (ix)
   27CD 8C            [ 4]  788 	adc	a, h
   27CE DD 77 F3      [19]  789 	ld	-13 (ix),a
   27D1 DD 6E F9      [19]  790 	ld	l,-7 (ix)
   27D4 DD 66 FA      [19]  791 	ld	h,-6 (ix)
   27D7 DD 7E F2      [19]  792 	ld	a,-14 (ix)
   27DA 77            [ 7]  793 	ld	(hl),a
   27DB 23            [ 6]  794 	inc	hl
   27DC DD 7E F3      [19]  795 	ld	a,-13 (ix)
   27DF 77            [ 7]  796 	ld	(hl),a
                            797 ;src/entities/enemies.c:121: enemies[i].stage_step++;
   27E0 1A            [ 7]  798 	ld	a,(de)
   27E1 3C            [ 4]  799 	inc	a
   27E2 12            [ 7]  800 	ld	(de),a
   27E3 18 33         [12]  801 	jr	00125$
   27E5                     802 00104$:
                            803 ;src/entities/enemies.c:123: enemies[i].stage++;
   27E5 DD 7E F4      [19]  804 	ld	a,-12 (ix)
   27E8 3C            [ 4]  805 	inc	a
   27E9 DD 77 F9      [19]  806 	ld	-7 (ix),a
   27EC DD 6E FD      [19]  807 	ld	l,-3 (ix)
   27EF DD 66 FE      [19]  808 	ld	h,-2 (ix)
   27F2 DD 7E F9      [19]  809 	ld	a,-7 (ix)
   27F5 77            [ 7]  810 	ld	(hl),a
                            811 ;src/entities/enemies.c:124: enemies[i].stage_step=0;
   27F6 AF            [ 4]  812 	xor	a, a
   27F7 12            [ 7]  813 	ld	(de),a
                            814 ;src/entities/enemies.c:125: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   27F8 DD 6E F5      [19]  815 	ld	l,-11 (ix)
   27FB DD 66 F6      [19]  816 	ld	h,-10 (ix)
   27FE 5E            [ 7]  817 	ld	e, (hl)
   27FF 16 00         [ 7]  818 	ld	d,#0x00
   2801 6B            [ 4]  819 	ld	l, e
   2802 62            [ 4]  820 	ld	h, d
   2803 29            [11]  821 	add	hl, hl
   2804 29            [11]  822 	add	hl, hl
   2805 29            [11]  823 	add	hl, hl
   2806 29            [11]  824 	add	hl, hl
   2807 29            [11]  825 	add	hl, hl
   2808 19            [11]  826 	add	hl, de
   2809 09            [11]  827 	add	hl,bc
   280A DD 7E F9      [19]  828 	ld	a,-7 (ix)
   280D 96            [ 7]  829 	sub	a,(hl)
   280E 38 08         [12]  830 	jr	C,00125$
                            831 ;src/entities/enemies.c:126: enemies[i].stage=0;
   2810 DD 6E FD      [19]  832 	ld	l,-3 (ix)
   2813 DD 66 FE      [19]  833 	ld	h,-2 (ix)
   2816 36 00         [10]  834 	ld	(hl),#0x00
   2818                     835 00125$:
                            836 ;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
   2818 DD 7E F7      [19]  837 	ld	a,-9 (ix)
   281B C6 24         [ 7]  838 	add	a, #0x24
   281D DD 77 F7      [19]  839 	ld	-9 (ix),a
   2820 DD 7E F8      [19]  840 	ld	a,-8 (ix)
   2823 CE 00         [ 7]  841 	adc	a, #0x00
   2825 DD 77 F8      [19]  842 	ld	-8 (ix),a
   2828 DD 34 F1      [23]  843 	inc	-15 (ix)
   282B DD 7E F1      [19]  844 	ld	a,-15 (ix)
   282E D6 0A         [ 7]  845 	sub	a, #0x0A
   2830 DA 5F 26      [10]  846 	jp	C,00124$
   2833                     847 00112$:
                            848 ;src/entities/enemies.c:135: if (active_groups>0){
   2833 3A DD 46      [13]  849 	ld	a,(#_active_groups + 0)
   2836 B7            [ 4]  850 	or	a, a
   2837 28 6E         [12]  851 	jr	Z,00128$
                            852 ;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2839 DD 36 F1 00   [19]  853 	ld	-15 (ix),#0x00
   283D                     854 00126$:
                            855 ;src/entities/enemies.c:138: if (groups[i].active){
   283D DD 6E F1      [19]  856 	ld	l,-15 (ix)
   2840 26 00         [ 7]  857 	ld	h,#0x00
   2842 29            [11]  858 	add	hl, hl
   2843 29            [11]  859 	add	hl, hl
   2844 29            [11]  860 	add	hl, hl
   2845 3E CD         [ 7]  861 	ld	a,#<(_groups)
   2847 85            [ 4]  862 	add	a, l
   2848 5F            [ 4]  863 	ld	e,a
   2849 3E 46         [ 7]  864 	ld	a,#>(_groups)
   284B 8C            [ 4]  865 	adc	a, h
   284C 57            [ 4]  866 	ld	d,a
   284D 1A            [ 7]  867 	ld	a,(de)
   284E B7            [ 4]  868 	or	a, a
   284F 28 4C         [12]  869 	jr	Z,00127$
                            870 ;src/entities/enemies.c:139: if (groups[i].sleep==0){
   2851 21 07 00      [10]  871 	ld	hl,#0x0007
   2854 19            [11]  872 	add	hl,de
   2855 7E            [ 7]  873 	ld	a,(hl)
   2856 B7            [ 4]  874 	or	a, a
   2857 20 41         [12]  875 	jr	NZ,00117$
                            876 ;src/entities/enemies.c:140: groups[i].sleep=ENEMY_GAP;
   2859 36 04         [10]  877 	ld	(hl),#0x04
                            878 ;src/entities/enemies.c:141: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   285B 6B            [ 4]  879 	ld	l, e
   285C 62            [ 4]  880 	ld	h, d
   285D 01 05 00      [10]  881 	ld	bc, #0x0005
   2860 09            [11]  882 	add	hl, bc
   2861 7E            [ 7]  883 	ld	a,(hl)
   2862 DD 77 F9      [19]  884 	ld	-7 (ix),a
   2865 6B            [ 4]  885 	ld	l, e
   2866 62            [ 4]  886 	ld	h, d
   2867 23            [ 6]  887 	inc	hl
   2868 23            [ 6]  888 	inc	hl
   2869 23            [ 6]  889 	inc	hl
   286A 4E            [ 7]  890 	ld	c,(hl)
   286B 23            [ 6]  891 	inc	hl
   286C 46            [ 7]  892 	ld	b,(hl)
   286D 6B            [ 4]  893 	ld	l, e
   286E 62            [ 4]  894 	ld	h, d
   286F 23            [ 6]  895 	inc	hl
   2870 7E            [ 7]  896 	ld	a, (hl)
   2871 23            [ 6]  897 	inc	hl
   2872 66            [ 7]  898 	ld	h,(hl)
   2873 47            [ 4]  899 	ld	b, a
   2874 D5            [11]  900 	push	de
   2875 DD 7E F9      [19]  901 	ld	a,-7 (ix)
   2878 F5            [11]  902 	push	af
   2879 33            [ 6]  903 	inc	sp
   287A 79            [ 4]  904 	ld	a,c
   287B F5            [11]  905 	push	af
   287C 33            [ 6]  906 	inc	sp
   287D C5            [11]  907 	push	bc
   287E 33            [ 6]  908 	inc	sp
   287F CD 38 23      [17]  909 	call	_create_enemy
   2882 F1            [10]  910 	pop	af
   2883 33            [ 6]  911 	inc	sp
   2884 D1            [10]  912 	pop	de
                            913 ;src/entities/enemies.c:142: if (groups[i].num_enemies==0){
   2885 21 06 00      [10]  914 	ld	hl,#0x0006
   2888 19            [11]  915 	add	hl,de
   2889 7E            [ 7]  916 	ld	a,(hl)
   288A B7            [ 4]  917 	or	a, a
   288B 20 08         [12]  918 	jr	NZ,00114$
                            919 ;src/entities/enemies.c:143: groups[i].active=0;
   288D AF            [ 4]  920 	xor	a, a
   288E 12            [ 7]  921 	ld	(de),a
                            922 ;src/entities/enemies.c:144: active_groups--;
   288F 21 DD 46      [10]  923 	ld	hl, #_active_groups+0
   2892 35            [11]  924 	dec	(hl)
   2893 18 08         [12]  925 	jr	00127$
   2895                     926 00114$:
                            927 ;src/entities/enemies.c:146: groups[i].num_enemies--;
   2895 C6 FF         [ 7]  928 	add	a,#0xFF
   2897 77            [ 7]  929 	ld	(hl),a
   2898 18 03         [12]  930 	jr	00127$
   289A                     931 00117$:
                            932 ;src/entities/enemies.c:149: groups[i].sleep--;
   289A C6 FF         [ 7]  933 	add	a,#0xFF
   289C 77            [ 7]  934 	ld	(hl),a
   289D                     935 00127$:
                            936 ;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   289D DD 34 F1      [23]  937 	inc	-15 (ix)
   28A0 DD 7E F1      [19]  938 	ld	a,-15 (ix)
   28A3 D6 02         [ 7]  939 	sub	a, #0x02
   28A5 38 96         [12]  940 	jr	C,00126$
   28A7                     941 00128$:
   28A7 DD F9         [10]  942 	ld	sp, ix
   28A9 DD E1         [14]  943 	pop	ix
   28AB C9            [10]  944 	ret
                            945 ;src/entities/enemies.c:157: u8 inside_screen(i8 x, i8 y, u8 w, u8 h){
                            946 ;	---------------------------------
                            947 ; Function inside_screen
                            948 ; ---------------------------------
   28AC                     949 _inside_screen::
   28AC DD E5         [15]  950 	push	ix
   28AE DD 21 00 00   [14]  951 	ld	ix,#0
   28B2 DD 39         [15]  952 	add	ix,sp
   28B4 3B            [ 6]  953 	dec	sp
                            954 ;src/entities/enemies.c:158: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   28B5 DD CB 04 7E   [20]  955 	bit	7, 4 (ix)
   28B9 20 3E         [12]  956 	jr	NZ,00103$
   28BB DD 6E 04      [19]  957 	ld	l,4 (ix)
   28BE DD 7E 04      [19]  958 	ld	a,4 (ix)
   28C1 17            [ 4]  959 	rla
   28C2 9F            [ 4]  960 	sbc	a, a
   28C3 67            [ 4]  961 	ld	h,a
   28C4 DD 5E 06      [19]  962 	ld	e,6 (ix)
   28C7 16 00         [ 7]  963 	ld	d,#0x00
   28C9 19            [11]  964 	add	hl,de
   28CA 11 A0 80      [10]  965 	ld	de, #0x80A0
   28CD 29            [11]  966 	add	hl, hl
   28CE 3F            [ 4]  967 	ccf
   28CF CB 1C         [ 8]  968 	rr	h
   28D1 CB 1D         [ 8]  969 	rr	l
   28D3 ED 52         [15]  970 	sbc	hl, de
   28D5 30 22         [12]  971 	jr	NC,00103$
   28D7 DD CB 05 7E   [20]  972 	bit	7, 5 (ix)
   28DB 20 1C         [12]  973 	jr	NZ,00103$
   28DD DD 6E 05      [19]  974 	ld	l,5 (ix)
   28E0 DD 7E 05      [19]  975 	ld	a,5 (ix)
   28E3 17            [ 4]  976 	rla
   28E4 9F            [ 4]  977 	sbc	a, a
   28E5 67            [ 4]  978 	ld	h,a
   28E6 DD 5E 07      [19]  979 	ld	e,7 (ix)
   28E9 16 00         [ 7]  980 	ld	d,#0x00
   28EB 19            [11]  981 	add	hl,de
   28EC 11 C8 80      [10]  982 	ld	de, #0x80C8
   28EF 29            [11]  983 	add	hl, hl
   28F0 3F            [ 4]  984 	ccf
   28F1 CB 1C         [ 8]  985 	rr	h
   28F3 CB 1D         [ 8]  986 	rr	l
   28F5 ED 52         [15]  987 	sbc	hl, de
   28F7 38 04         [12]  988 	jr	C,00104$
   28F9                     989 00103$:
   28F9 2E 00         [ 7]  990 	ld	l,#0x00
   28FB 18 02         [12]  991 	jr	00105$
   28FD                     992 00104$:
   28FD 2E 01         [ 7]  993 	ld	l,#0x01
   28FF                     994 00105$:
   28FF 33            [ 6]  995 	inc	sp
   2900 DD E1         [14]  996 	pop	ix
   2902 C9            [10]  997 	ret
                            998 ;src/entities/enemies.c:165: void draw_enemies(u8* screen){
                            999 ;	---------------------------------
                           1000 ; Function draw_enemies
                           1001 ; ---------------------------------
   2903                    1002 _draw_enemies::
   2903 DD E5         [15] 1003 	push	ix
   2905 DD 21 00 00   [14] 1004 	ld	ix,#0
   2909 DD 39         [15] 1005 	add	ix,sp
   290B 21 F3 FF      [10] 1006 	ld	hl,#-13
   290E 39            [11] 1007 	add	hl,sp
   290F F9            [ 6] 1008 	ld	sp,hl
                           1009 ;src/entities/enemies.c:170: if (active_enemies>0){
   2910 3A CC 46      [13] 1010 	ld	a,(#_active_enemies + 0)
   2913 B7            [ 4] 1011 	or	a, a
   2914 CA 3F 2A      [10] 1012 	jp	Z,00109$
                           1013 ;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
   2917 DD 36 F3 00   [19] 1014 	ld	-13 (ix),#0x00
   291B 11 00 00      [10] 1015 	ld	de,#0x0000
   291E                    1016 00107$:
                           1017 ;src/entities/enemies.c:172: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   291E 21 64 45      [10] 1018 	ld	hl,#_enemies
   2921 19            [11] 1019 	add	hl,de
   2922 DD 75 FE      [19] 1020 	ld	-2 (ix),l
   2925 DD 74 FF      [19] 1021 	ld	-1 (ix),h
   2928 DD 6E FE      [19] 1022 	ld	l,-2 (ix)
   292B DD 66 FF      [19] 1023 	ld	h,-1 (ix)
   292E 01 17 00      [10] 1024 	ld	bc, #0x0017
   2931 09            [11] 1025 	add	hl, bc
   2932 7E            [ 7] 1026 	ld	a,(hl)
   2933 B7            [ 4] 1027 	or	a, a
   2934 CA 2F 2A      [10] 1028 	jp	Z,00108$
   2937 DD 7E FE      [19] 1029 	ld	a,-2 (ix)
   293A C6 15         [ 7] 1030 	add	a, #0x15
   293C DD 77 F9      [19] 1031 	ld	-7 (ix),a
   293F DD 7E FF      [19] 1032 	ld	a,-1 (ix)
   2942 CE 00         [ 7] 1033 	adc	a, #0x00
   2944 DD 77 FA      [19] 1034 	ld	-6 (ix),a
   2947 DD 6E F9      [19] 1035 	ld	l,-7 (ix)
   294A DD 66 FA      [19] 1036 	ld	h,-6 (ix)
   294D 46            [ 7] 1037 	ld	b,(hl)
   294E DD 7E FE      [19] 1038 	ld	a,-2 (ix)
   2951 C6 14         [ 7] 1039 	add	a, #0x14
   2953 DD 77 F4      [19] 1040 	ld	-12 (ix),a
   2956 DD 7E FF      [19] 1041 	ld	a,-1 (ix)
   2959 CE 00         [ 7] 1042 	adc	a, #0x00
   295B DD 77 F5      [19] 1043 	ld	-11 (ix),a
   295E DD 6E F4      [19] 1044 	ld	l,-12 (ix)
   2961 DD 66 F5      [19] 1045 	ld	h,-11 (ix)
   2964 7E            [ 7] 1046 	ld	a,(hl)
   2965 DD 77 FB      [19] 1047 	ld	-5 (ix),a
   2968 DD 7E FE      [19] 1048 	ld	a,-2 (ix)
   296B C6 12         [ 7] 1049 	add	a, #0x12
   296D DD 77 F7      [19] 1050 	ld	-9 (ix),a
   2970 DD 7E FF      [19] 1051 	ld	a,-1 (ix)
   2973 CE 00         [ 7] 1052 	adc	a, #0x00
   2975 DD 77 F8      [19] 1053 	ld	-8 (ix),a
   2978 DD 6E F7      [19] 1054 	ld	l,-9 (ix)
   297B DD 66 F8      [19] 1055 	ld	h,-8 (ix)
   297E 4E            [ 7] 1056 	ld	c,(hl)
   297F 23            [ 6] 1057 	inc	hl
   2980 66            [ 7] 1058 	ld	h,(hl)
   2981 DD 71 F6      [19] 1059 	ld	-10 (ix),c
   2984 DD 7E FE      [19] 1060 	ld	a,-2 (ix)
   2987 C6 10         [ 7] 1061 	add	a, #0x10
   2989 DD 77 FC      [19] 1062 	ld	-4 (ix),a
   298C DD 7E FF      [19] 1063 	ld	a,-1 (ix)
   298F CE 00         [ 7] 1064 	adc	a, #0x00
   2991 DD 77 FD      [19] 1065 	ld	-3 (ix),a
   2994 DD 6E FC      [19] 1066 	ld	l,-4 (ix)
   2997 DD 66 FD      [19] 1067 	ld	h,-3 (ix)
   299A 4E            [ 7] 1068 	ld	c,(hl)
   299B 23            [ 6] 1069 	inc	hl
   299C 66            [ 7] 1070 	ld	h,(hl)
   299D D5            [11] 1071 	push	de
   299E C5            [11] 1072 	push	bc
   299F 33            [ 6] 1073 	inc	sp
   29A0 DD 66 FB      [19] 1074 	ld	h,-5 (ix)
   29A3 DD 6E F6      [19] 1075 	ld	l,-10 (ix)
   29A6 E5            [11] 1076 	push	hl
   29A7 79            [ 4] 1077 	ld	a,c
   29A8 F5            [11] 1078 	push	af
   29A9 33            [ 6] 1079 	inc	sp
   29AA CD AC 28      [17] 1080 	call	_inside_screen
   29AD F1            [10] 1081 	pop	af
   29AE F1            [10] 1082 	pop	af
   29AF 7D            [ 4] 1083 	ld	a,l
   29B0 D1            [10] 1084 	pop	de
   29B1 B7            [ 4] 1085 	or	a, a
   29B2 28 7B         [12] 1086 	jr	Z,00108$
                           1087 ;src/entities/enemies.c:173: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   29B4 DD 6E F7      [19] 1088 	ld	l,-9 (ix)
   29B7 DD 66 F8      [19] 1089 	ld	h,-8 (ix)
   29BA 4E            [ 7] 1090 	ld	c,(hl)
   29BB 23            [ 6] 1091 	inc	hl
   29BC 46            [ 7] 1092 	ld	b,(hl)
   29BD DD 6E FC      [19] 1093 	ld	l,-4 (ix)
   29C0 DD 66 FD      [19] 1094 	ld	h,-3 (ix)
   29C3 7E            [ 7] 1095 	ld	a, (hl)
   29C4 23            [ 6] 1096 	inc	hl
   29C5 66            [ 7] 1097 	ld	h,(hl)
   29C6 6F            [ 4] 1098 	ld	l,a
   29C7 65            [ 4] 1099 	ld	h,l
   29C8 E5            [11] 1100 	push	hl
   29C9 DD 6E 04      [19] 1101 	ld	l,4 (ix)
   29CC DD 66 05      [19] 1102 	ld	h,5 (ix)
   29CF E5            [11] 1103 	push	hl
   29D0 FD E1         [14] 1104 	pop	iy
   29D2 E1            [10] 1105 	pop	hl
   29D3 D5            [11] 1106 	push	de
   29D4 79            [ 4] 1107 	ld	a,c
   29D5 F5            [11] 1108 	push	af
   29D6 33            [ 6] 1109 	inc	sp
   29D7 E5            [11] 1110 	push	hl
   29D8 33            [ 6] 1111 	inc	sp
   29D9 FD E5         [15] 1112 	push	iy
   29DB CD C6 43      [17] 1113 	call	_cpct_getScreenPtr
   29DE F1            [10] 1114 	pop	af
   29DF F1            [10] 1115 	pop	af
   29E0 D1            [10] 1116 	pop	de
   29E1 4D            [ 4] 1117 	ld	c, l
   29E2 44            [ 4] 1118 	ld	b, h
                           1119 ;src/entities/enemies.c:174: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   29E3 DD 6E F9      [19] 1120 	ld	l,-7 (ix)
   29E6 DD 66 FA      [19] 1121 	ld	h,-6 (ix)
   29E9 7E            [ 7] 1122 	ld	a,(hl)
   29EA DD 77 FC      [19] 1123 	ld	-4 (ix),a
   29ED DD 6E F4      [19] 1124 	ld	l,-12 (ix)
   29F0 DD 66 F5      [19] 1125 	ld	h,-11 (ix)
   29F3 7E            [ 7] 1126 	ld	a,(hl)
   29F4 DD 77 F6      [19] 1127 	ld	-10 (ix),a
   29F7 DD 71 F7      [19] 1128 	ld	-9 (ix),c
   29FA DD 70 F8      [19] 1129 	ld	-8 (ix),b
   29FD DD 6E FE      [19] 1130 	ld	l,-2 (ix)
   2A00 DD 66 FF      [19] 1131 	ld	h,-1 (ix)
   2A03 01 16 00      [10] 1132 	ld	bc, #0x0016
   2A06 09            [11] 1133 	add	hl, bc
   2A07 7E            [ 7] 1134 	ld	a,(hl)
   2A08 87            [ 4] 1135 	add	a, a
   2A09 4F            [ 4] 1136 	ld	c,a
   2A0A DD 6E FE      [19] 1137 	ld	l,-2 (ix)
   2A0D DD 66 FF      [19] 1138 	ld	h,-1 (ix)
   2A10 06 00         [ 7] 1139 	ld	b,#0x00
   2A12 09            [11] 1140 	add	hl, bc
   2A13 4E            [ 7] 1141 	ld	c,(hl)
   2A14 23            [ 6] 1142 	inc	hl
   2A15 46            [ 7] 1143 	ld	b,(hl)
   2A16 D5            [11] 1144 	push	de
   2A17 DD 66 FC      [19] 1145 	ld	h,-4 (ix)
   2A1A DD 6E F6      [19] 1146 	ld	l,-10 (ix)
   2A1D E5            [11] 1147 	push	hl
   2A1E DD 6E F7      [19] 1148 	ld	l,-9 (ix)
   2A21 DD 66 F8      [19] 1149 	ld	h,-8 (ix)
   2A24 E5            [11] 1150 	push	hl
   2A25 C5            [11] 1151 	push	bc
   2A26 CD 97 41      [17] 1152 	call	_cpct_drawSprite
   2A29 21 06 00      [10] 1153 	ld	hl,#6
   2A2C 39            [11] 1154 	add	hl,sp
   2A2D F9            [ 6] 1155 	ld	sp,hl
   2A2E D1            [10] 1156 	pop	de
   2A2F                    1157 00108$:
                           1158 ;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
   2A2F 21 24 00      [10] 1159 	ld	hl,#0x0024
   2A32 19            [11] 1160 	add	hl,de
   2A33 EB            [ 4] 1161 	ex	de,hl
   2A34 DD 34 F3      [23] 1162 	inc	-13 (ix)
   2A37 DD 7E F3      [19] 1163 	ld	a,-13 (ix)
   2A3A D6 0A         [ 7] 1164 	sub	a, #0x0A
   2A3C DA 1E 29      [10] 1165 	jp	C,00107$
   2A3F                    1166 00109$:
   2A3F DD F9         [10] 1167 	ld	sp, ix
   2A41 DD E1         [14] 1168 	pop	ix
   2A43 C9            [10] 1169 	ret
                           1170 	.area _CODE
                           1171 	.area _INITIALIZER
                           1172 	.area _CABS (ABS)
