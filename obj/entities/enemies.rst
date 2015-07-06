                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul  6 16:29:22 2015
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
   4556                      31 _enemies::
   4556                      32 	.ds 360
   46BE                      33 _active_enemies::
   46BE                      34 	.ds 1
   46BF                      35 _groups::
   46BF                      36 	.ds 16
   46CF                      37 _active_groups::
   46CF                      38 	.ds 1
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
   22DF 21 56 45      [10]   77 	ld	hl,#_enemies
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
   232F 21 BE 46      [10]  135 	ld	hl,#_active_enemies + 0
   2332 36 00         [10]  136 	ld	(hl), #0x00
   2334 33            [ 6]  137 	inc	sp
   2335 DD E1         [14]  138 	pop	ix
   2337 C9            [10]  139 	ret
                            140 ;src/entities/enemies.c:34: void create_enemy(i16 x, i16 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_enemy
                            143 ; ---------------------------------
   2338                     144 _create_enemy::
   2338 DD E5         [15]  145 	push	ix
   233A DD 21 00 00   [14]  146 	ld	ix,#0
   233E DD 39         [15]  147 	add	ix,sp
   2340 21 E0 FF      [10]  148 	ld	hl,#-32
   2343 39            [11]  149 	add	hl,sp
   2344 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/enemies.c:36: if (active_enemies < MAX_ENEMIES){
   2345 3A BE 46      [13]  152 	ld	a,(#_active_enemies + 0)
   2348 D6 0A         [ 7]  153 	sub	a, #0x0A
   234A D2 C3 25      [10]  154 	jp	NC,00109$
                            155 ;src/entities/enemies.c:38: while (enemies[k].active){
   234D 11 00 00      [10]  156 	ld	de,#0x0000
   2350                     157 00101$:
   2350 21 56 45      [10]  158 	ld	hl,#_enemies
   2353 19            [11]  159 	add	hl,de
   2354 DD 75 F8      [19]  160 	ld	-8 (ix),l
   2357 DD 74 F9      [19]  161 	ld	-7 (ix),h
   235A DD 7E F8      [19]  162 	ld	a,-8 (ix)
   235D C6 17         [ 7]  163 	add	a, #0x17
   235F 6F            [ 4]  164 	ld	l,a
   2360 DD 7E F9      [19]  165 	ld	a,-7 (ix)
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
   2373 DD 7E F8      [19]  180 	ld	a,-8 (ix)
   2376 C6 19         [ 7]  181 	add	a, #0x19
   2378 6F            [ 4]  182 	ld	l,a
   2379 DD 7E F9      [19]  183 	ld	a,-7 (ix)
   237C CE 00         [ 7]  184 	adc	a, #0x00
   237E 67            [ 4]  185 	ld	h,a
   237F 36 00         [10]  186 	ld	(hl),#0x00
                            187 ;src/entities/enemies.c:46: enemies[k].x=x;
   2381 DD 7E F8      [19]  188 	ld	a,-8 (ix)
   2384 C6 10         [ 7]  189 	add	a, #0x10
   2386 DD 77 FA      [19]  190 	ld	-6 (ix),a
   2389 DD 7E F9      [19]  191 	ld	a,-7 (ix)
   238C CE 00         [ 7]  192 	adc	a, #0x00
   238E DD 77 FB      [19]  193 	ld	-5 (ix),a
                            194 ;src/entities/enemies.c:47: enemies[k].y=y;
   2391 DD 7E F8      [19]  195 	ld	a,-8 (ix)
   2394 C6 12         [ 7]  196 	add	a, #0x12
   2396 DD 77 FC      [19]  197 	ld	-4 (ix),a
   2399 DD 7E F9      [19]  198 	ld	a,-7 (ix)
   239C CE 00         [ 7]  199 	adc	a, #0x00
   239E DD 77 FD      [19]  200 	ld	-3 (ix),a
                            201 ;src/entities/enemies.c:48: enemies[k].w=6;
   23A1 DD 7E F8      [19]  202 	ld	a,-8 (ix)
   23A4 C6 14         [ 7]  203 	add	a, #0x14
   23A6 DD 77 FE      [19]  204 	ld	-2 (ix),a
   23A9 DD 7E F9      [19]  205 	ld	a,-7 (ix)
   23AC CE 00         [ 7]  206 	adc	a, #0x00
   23AE DD 77 FF      [19]  207 	ld	-1 (ix),a
                            208 ;src/entities/enemies.c:49: enemies[k].h=12;
   23B1 DD 7E F8      [19]  209 	ld	a,-8 (ix)
   23B4 C6 15         [ 7]  210 	add	a, #0x15
   23B6 DD 77 F6      [19]  211 	ld	-10 (ix),a
   23B9 DD 7E F9      [19]  212 	ld	a,-7 (ix)
   23BC CE 00         [ 7]  213 	adc	a, #0x00
   23BE DD 77 F7      [19]  214 	ld	-9 (ix),a
                            215 ;src/entities/enemies.c:50: enemies[k].num_frames=0;
   23C1 DD 7E F8      [19]  216 	ld	a,-8 (ix)
   23C4 C6 18         [ 7]  217 	add	a, #0x18
   23C6 DD 77 F4      [19]  218 	ld	-12 (ix),a
   23C9 DD 7E F9      [19]  219 	ld	a,-7 (ix)
   23CC CE 00         [ 7]  220 	adc	a, #0x00
   23CE DD 77 F5      [19]  221 	ld	-11 (ix),a
                            222 ;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   23D1 DD 7E F8      [19]  223 	ld	a,-8 (ix)
   23D4 C6 02         [ 7]  224 	add	a, #0x02
   23D6 DD 77 F2      [19]  225 	ld	-14 (ix),a
   23D9 DD 7E F9      [19]  226 	ld	a,-7 (ix)
   23DC CE 00         [ 7]  227 	adc	a, #0x00
   23DE DD 77 F3      [19]  228 	ld	-13 (ix),a
                            229 ;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   23E1 DD 7E F8      [19]  230 	ld	a,-8 (ix)
   23E4 C6 04         [ 7]  231 	add	a, #0x04
   23E6 DD 77 F0      [19]  232 	ld	-16 (ix),a
   23E9 DD 7E F9      [19]  233 	ld	a,-7 (ix)
   23EC CE 00         [ 7]  234 	adc	a, #0x00
   23EE DD 77 F1      [19]  235 	ld	-15 (ix),a
                            236 ;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   23F1 DD 7E F8      [19]  237 	ld	a,-8 (ix)
   23F4 C6 06         [ 7]  238 	add	a, #0x06
   23F6 DD 77 EE      [19]  239 	ld	-18 (ix),a
   23F9 DD 7E F9      [19]  240 	ld	a,-7 (ix)
   23FC CE 00         [ 7]  241 	adc	a, #0x00
   23FE DD 77 EF      [19]  242 	ld	-17 (ix),a
                            243 ;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2401 DD 7E F8      [19]  244 	ld	a,-8 (ix)
   2404 C6 08         [ 7]  245 	add	a, #0x08
   2406 DD 77 EC      [19]  246 	ld	-20 (ix),a
   2409 DD 7E F9      [19]  247 	ld	a,-7 (ix)
   240C CE 00         [ 7]  248 	adc	a, #0x00
   240E DD 77 ED      [19]  249 	ld	-19 (ix),a
                            250 ;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2411 DD 7E F8      [19]  251 	ld	a,-8 (ix)
   2414 C6 0A         [ 7]  252 	add	a, #0x0A
   2416 DD 77 EA      [19]  253 	ld	-22 (ix),a
   2419 DD 7E F9      [19]  254 	ld	a,-7 (ix)
   241C CE 00         [ 7]  255 	adc	a, #0x00
   241E DD 77 EB      [19]  256 	ld	-21 (ix),a
                            257 ;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2421 DD 7E F8      [19]  258 	ld	a,-8 (ix)
   2424 C6 0C         [ 7]  259 	add	a, #0x0C
   2426 DD 77 E8      [19]  260 	ld	-24 (ix),a
   2429 DD 7E F9      [19]  261 	ld	a,-7 (ix)
   242C CE 00         [ 7]  262 	adc	a, #0x00
   242E DD 77 E9      [19]  263 	ld	-23 (ix),a
                            264 ;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2431 DD 7E F8      [19]  265 	ld	a,-8 (ix)
   2434 C6 0E         [ 7]  266 	add	a, #0x0E
   2436 DD 77 E6      [19]  267 	ld	-26 (ix),a
   2439 DD 7E F9      [19]  268 	ld	a,-7 (ix)
   243C CE 00         [ 7]  269 	adc	a, #0x00
   243E DD 77 E7      [19]  270 	ld	-25 (ix),a
                            271 ;src/entities/enemies.c:59: enemies[k].movement=0;
   2441 DD 7E F8      [19]  272 	ld	a,-8 (ix)
   2444 C6 1D         [ 7]  273 	add	a, #0x1D
   2446 DD 77 E4      [19]  274 	ld	-28 (ix),a
   2449 DD 7E F9      [19]  275 	ld	a,-7 (ix)
   244C CE 00         [ 7]  276 	adc	a, #0x00
   244E DD 77 E5      [19]  277 	ld	-27 (ix),a
                            278 ;src/entities/enemies.c:60: enemies[k].stage=0;
   2451 DD 7E F8      [19]  279 	ld	a,-8 (ix)
   2454 C6 1E         [ 7]  280 	add	a, #0x1E
   2456 DD 77 E2      [19]  281 	ld	-30 (ix),a
   2459 DD 7E F9      [19]  282 	ld	a,-7 (ix)
   245C CE 00         [ 7]  283 	adc	a, #0x00
   245E DD 77 E3      [19]  284 	ld	-29 (ix),a
                            285 ;src/entities/enemies.c:61: enemies[k].stage_step=0;
   2461 DD 7E F8      [19]  286 	ld	a,-8 (ix)
   2464 C6 1F         [ 7]  287 	add	a, #0x1F
   2466 DD 77 E0      [19]  288 	ld	-32 (ix),a
   2469 DD 7E F9      [19]  289 	ld	a,-7 (ix)
   246C CE 00         [ 7]  290 	adc	a, #0x00
   246E DD 77 E1      [19]  291 	ld	-31 (ix),a
                            292 ;src/entities/enemies.c:43: switch (type){
   2471 DD 7E 08      [19]  293 	ld	a,8 (ix)
   2474 3D            [ 4]  294 	dec	a
   2475 C2 1D 25      [10]  295 	jp	NZ,00105$
                            296 ;src/entities/enemies.c:46: enemies[k].x=x;
   2478 DD 6E FA      [19]  297 	ld	l,-6 (ix)
   247B DD 66 FB      [19]  298 	ld	h,-5 (ix)
   247E DD 7E 04      [19]  299 	ld	a,4 (ix)
   2481 77            [ 7]  300 	ld	(hl),a
   2482 23            [ 6]  301 	inc	hl
   2483 DD 7E 05      [19]  302 	ld	a,5 (ix)
   2486 77            [ 7]  303 	ld	(hl),a
                            304 ;src/entities/enemies.c:47: enemies[k].y=y;
   2487 DD 6E FC      [19]  305 	ld	l,-4 (ix)
   248A DD 66 FD      [19]  306 	ld	h,-3 (ix)
   248D DD 7E 06      [19]  307 	ld	a,6 (ix)
   2490 77            [ 7]  308 	ld	(hl),a
   2491 23            [ 6]  309 	inc	hl
   2492 DD 7E 07      [19]  310 	ld	a,7 (ix)
   2495 77            [ 7]  311 	ld	(hl),a
                            312 ;src/entities/enemies.c:48: enemies[k].w=6;
   2496 DD 6E FE      [19]  313 	ld	l,-2 (ix)
   2499 DD 66 FF      [19]  314 	ld	h,-1 (ix)
   249C 36 06         [10]  315 	ld	(hl),#0x06
                            316 ;src/entities/enemies.c:49: enemies[k].h=12;
   249E DD 6E F6      [19]  317 	ld	l,-10 (ix)
   24A1 DD 66 F7      [19]  318 	ld	h,-9 (ix)
   24A4 36 0C         [10]  319 	ld	(hl),#0x0C
                            320 ;src/entities/enemies.c:50: enemies[k].num_frames=0;
   24A6 DD 6E F4      [19]  321 	ld	l,-12 (ix)
   24A9 DD 66 F5      [19]  322 	ld	h,-11 (ix)
   24AC 36 00         [10]  323 	ld	(hl),#0x00
                            324 ;src/entities/enemies.c:51: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   24AE DD 6E F8      [19]  325 	ld	l,-8 (ix)
   24B1 DD 66 F9      [19]  326 	ld	h,-7 (ix)
   24B4 36 92         [10]  327 	ld	(hl),#<(_G_baddie02_00)
   24B6 23            [ 6]  328 	inc	hl
   24B7 36 34         [10]  329 	ld	(hl),#>(_G_baddie02_00)
                            330 ;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   24B9 DD 6E F2      [19]  331 	ld	l,-14 (ix)
   24BC DD 66 F3      [19]  332 	ld	h,-13 (ix)
   24BF 36 DA         [10]  333 	ld	(hl),#<(_G_baddie02_01)
   24C1 23            [ 6]  334 	inc	hl
   24C2 36 34         [10]  335 	ld	(hl),#>(_G_baddie02_01)
                            336 ;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   24C4 DD 6E F0      [19]  337 	ld	l,-16 (ix)
   24C7 DD 66 F1      [19]  338 	ld	h,-15 (ix)
   24CA 36 22         [10]  339 	ld	(hl),#<(_G_baddie02_02)
   24CC 23            [ 6]  340 	inc	hl
   24CD 36 35         [10]  341 	ld	(hl),#>(_G_baddie02_02)
                            342 ;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24CF DD 6E EE      [19]  343 	ld	l,-18 (ix)
   24D2 DD 66 EF      [19]  344 	ld	h,-17 (ix)
   24D5 36 6A         [10]  345 	ld	(hl),#<(_G_baddie02_03)
   24D7 23            [ 6]  346 	inc	hl
   24D8 36 35         [10]  347 	ld	(hl),#>(_G_baddie02_03)
                            348 ;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   24DA DD 6E EC      [19]  349 	ld	l,-20 (ix)
   24DD DD 66 ED      [19]  350 	ld	h,-19 (ix)
   24E0 36 B2         [10]  351 	ld	(hl),#<(_G_baddie02_04)
   24E2 23            [ 6]  352 	inc	hl
   24E3 36 35         [10]  353 	ld	(hl),#>(_G_baddie02_04)
                            354 ;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   24E5 DD 6E EA      [19]  355 	ld	l,-22 (ix)
   24E8 DD 66 EB      [19]  356 	ld	h,-21 (ix)
   24EB 36 FA         [10]  357 	ld	(hl),#<(_G_baddie02_05)
   24ED 23            [ 6]  358 	inc	hl
   24EE 36 35         [10]  359 	ld	(hl),#>(_G_baddie02_05)
                            360 ;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   24F0 DD 6E E8      [19]  361 	ld	l,-24 (ix)
   24F3 DD 66 E9      [19]  362 	ld	h,-23 (ix)
   24F6 36 42         [10]  363 	ld	(hl),#<(_G_baddie02_06)
   24F8 23            [ 6]  364 	inc	hl
   24F9 36 36         [10]  365 	ld	(hl),#>(_G_baddie02_06)
                            366 ;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   24FB DD 6E E6      [19]  367 	ld	l,-26 (ix)
   24FE DD 66 E7      [19]  368 	ld	h,-25 (ix)
   2501 36 8A         [10]  369 	ld	(hl),#<(_G_baddie02_07)
   2503 23            [ 6]  370 	inc	hl
   2504 36 36         [10]  371 	ld	(hl),#>(_G_baddie02_07)
                            372 ;src/entities/enemies.c:59: enemies[k].movement=0;
   2506 DD 6E E4      [19]  373 	ld	l,-28 (ix)
   2509 DD 66 E5      [19]  374 	ld	h,-27 (ix)
   250C 36 00         [10]  375 	ld	(hl),#0x00
                            376 ;src/entities/enemies.c:60: enemies[k].stage=0;
   250E DD 6E E2      [19]  377 	ld	l,-30 (ix)
   2511 DD 66 E3      [19]  378 	ld	h,-29 (ix)
   2514 36 00         [10]  379 	ld	(hl),#0x00
                            380 ;src/entities/enemies.c:61: enemies[k].stage_step=0;
   2516 E1            [10]  381 	pop	hl
   2517 E5            [11]  382 	push	hl
   2518 36 00         [10]  383 	ld	(hl),#0x00
                            384 ;src/entities/enemies.c:62: break;
   251A C3 BF 25      [10]  385 	jp	00106$
                            386 ;src/entities/enemies.c:63: default:
   251D                     387 00105$:
                            388 ;src/entities/enemies.c:64: enemies[k].x=x;
   251D DD 6E FA      [19]  389 	ld	l,-6 (ix)
   2520 DD 66 FB      [19]  390 	ld	h,-5 (ix)
   2523 DD 7E 04      [19]  391 	ld	a,4 (ix)
   2526 77            [ 7]  392 	ld	(hl),a
   2527 23            [ 6]  393 	inc	hl
   2528 DD 7E 05      [19]  394 	ld	a,5 (ix)
   252B 77            [ 7]  395 	ld	(hl),a
                            396 ;src/entities/enemies.c:65: enemies[k].y=y;
   252C DD 6E FC      [19]  397 	ld	l,-4 (ix)
   252F DD 66 FD      [19]  398 	ld	h,-3 (ix)
   2532 DD 7E 06      [19]  399 	ld	a,6 (ix)
   2535 77            [ 7]  400 	ld	(hl),a
   2536 23            [ 6]  401 	inc	hl
   2537 DD 7E 07      [19]  402 	ld	a,7 (ix)
   253A 77            [ 7]  403 	ld	(hl),a
                            404 ;src/entities/enemies.c:66: enemies[k].w=5;
   253B DD 6E FE      [19]  405 	ld	l,-2 (ix)
   253E DD 66 FF      [19]  406 	ld	h,-1 (ix)
   2541 36 05         [10]  407 	ld	(hl),#0x05
                            408 ;src/entities/enemies.c:67: enemies[k].h=16;
   2543 DD 6E F6      [19]  409 	ld	l,-10 (ix)
   2546 DD 66 F7      [19]  410 	ld	h,-9 (ix)
   2549 36 10         [10]  411 	ld	(hl),#0x10
                            412 ;src/entities/enemies.c:68: enemies[k].num_frames=0;
   254B DD 6E F4      [19]  413 	ld	l,-12 (ix)
   254E DD 66 F5      [19]  414 	ld	h,-11 (ix)
   2551 36 00         [10]  415 	ld	(hl),#0x00
                            416 ;src/entities/enemies.c:69: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2553 DD 6E F8      [19]  417 	ld	l,-8 (ix)
   2556 DD 66 F9      [19]  418 	ld	h,-7 (ix)
   2559 36 12         [10]  419 	ld	(hl),#<(_G_baddie01_00)
   255B 23            [ 6]  420 	inc	hl
   255C 36 32         [10]  421 	ld	(hl),#>(_G_baddie01_00)
                            422 ;src/entities/enemies.c:70: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   255E DD 6E F2      [19]  423 	ld	l,-14 (ix)
   2561 DD 66 F3      [19]  424 	ld	h,-13 (ix)
   2564 36 62         [10]  425 	ld	(hl),#<(_G_baddie01_01)
   2566 23            [ 6]  426 	inc	hl
   2567 36 32         [10]  427 	ld	(hl),#>(_G_baddie01_01)
                            428 ;src/entities/enemies.c:71: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   2569 DD 6E F0      [19]  429 	ld	l,-16 (ix)
   256C DD 66 F1      [19]  430 	ld	h,-15 (ix)
   256F 36 B2         [10]  431 	ld	(hl),#<(_G_baddie01_02)
   2571 23            [ 6]  432 	inc	hl
   2572 36 32         [10]  433 	ld	(hl),#>(_G_baddie01_02)
                            434 ;src/entities/enemies.c:72: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2574 DD 6E EE      [19]  435 	ld	l,-18 (ix)
   2577 DD 66 EF      [19]  436 	ld	h,-17 (ix)
   257A 36 02         [10]  437 	ld	(hl),#<(_G_baddie01_03)
   257C 23            [ 6]  438 	inc	hl
   257D 36 33         [10]  439 	ld	(hl),#>(_G_baddie01_03)
                            440 ;src/entities/enemies.c:73: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   257F DD 6E EC      [19]  441 	ld	l,-20 (ix)
   2582 DD 66 ED      [19]  442 	ld	h,-19 (ix)
   2585 36 52         [10]  443 	ld	(hl),#<(_G_baddie01_04)
   2587 23            [ 6]  444 	inc	hl
   2588 36 33         [10]  445 	ld	(hl),#>(_G_baddie01_04)
                            446 ;src/entities/enemies.c:74: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   258A DD 6E EA      [19]  447 	ld	l,-22 (ix)
   258D DD 66 EB      [19]  448 	ld	h,-21 (ix)
   2590 36 A2         [10]  449 	ld	(hl),#<(_G_baddie01_05)
   2592 23            [ 6]  450 	inc	hl
   2593 36 33         [10]  451 	ld	(hl),#>(_G_baddie01_05)
                            452 ;src/entities/enemies.c:75: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2595 DD 6E E8      [19]  453 	ld	l,-24 (ix)
   2598 DD 66 E9      [19]  454 	ld	h,-23 (ix)
   259B 36 F2         [10]  455 	ld	(hl),#<(_G_baddie01_06)
   259D 23            [ 6]  456 	inc	hl
   259E 36 33         [10]  457 	ld	(hl),#>(_G_baddie01_06)
                            458 ;src/entities/enemies.c:76: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   25A0 DD 6E E6      [19]  459 	ld	l,-26 (ix)
   25A3 DD 66 E7      [19]  460 	ld	h,-25 (ix)
   25A6 36 42         [10]  461 	ld	(hl),#<(_G_baddie01_07)
   25A8 23            [ 6]  462 	inc	hl
   25A9 36 34         [10]  463 	ld	(hl),#>(_G_baddie01_07)
                            464 ;src/entities/enemies.c:77: enemies[k].movement=1;
   25AB DD 6E E4      [19]  465 	ld	l,-28 (ix)
   25AE DD 66 E5      [19]  466 	ld	h,-27 (ix)
   25B1 36 01         [10]  467 	ld	(hl),#0x01
                            468 ;src/entities/enemies.c:78: enemies[k].stage=0;
   25B3 DD 6E E2      [19]  469 	ld	l,-30 (ix)
   25B6 DD 66 E3      [19]  470 	ld	h,-29 (ix)
   25B9 36 00         [10]  471 	ld	(hl),#0x00
                            472 ;src/entities/enemies.c:79: enemies[k].stage_step=0;
   25BB E1            [10]  473 	pop	hl
   25BC E5            [11]  474 	push	hl
   25BD 36 00         [10]  475 	ld	(hl),#0x00
                            476 ;src/entities/enemies.c:81: }
   25BF                     477 00106$:
                            478 ;src/entities/enemies.c:82: active_enemies++;
   25BF 21 BE 46      [10]  479 	ld	hl, #_active_enemies+0
   25C2 34            [11]  480 	inc	(hl)
   25C3                     481 00109$:
   25C3 DD F9         [10]  482 	ld	sp, ix
   25C5 DD E1         [14]  483 	pop	ix
   25C7 C9            [10]  484 	ret
                            485 ;src/entities/enemies.c:88: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            486 ;	---------------------------------
                            487 ; Function create_enemy_group
                            488 ; ---------------------------------
   25C8                     489 _create_enemy_group::
   25C8 DD E5         [15]  490 	push	ix
   25CA DD 21 00 00   [14]  491 	ld	ix,#0
   25CE DD 39         [15]  492 	add	ix,sp
                            493 ;src/entities/enemies.c:90: if (active_groups < MAX_ENEMY_GROUPS){
   25D0 3A CF 46      [13]  494 	ld	a,(#_active_groups + 0)
   25D3 D6 02         [ 7]  495 	sub	a, #0x02
   25D5 30 4E         [12]  496 	jr	NC,00106$
                            497 ;src/entities/enemies.c:92: while (groups[k].active){
   25D7 16 00         [ 7]  498 	ld	d,#0x00
   25D9                     499 00101$:
   25D9 6A            [ 4]  500 	ld	l,d
   25DA 26 00         [ 7]  501 	ld	h,#0x00
   25DC 29            [11]  502 	add	hl, hl
   25DD 29            [11]  503 	add	hl, hl
   25DE 29            [11]  504 	add	hl, hl
   25DF 3E BF         [ 7]  505 	ld	a,#<(_groups)
   25E1 85            [ 4]  506 	add	a, l
   25E2 4F            [ 4]  507 	ld	c,a
   25E3 3E 46         [ 7]  508 	ld	a,#>(_groups)
   25E5 8C            [ 4]  509 	adc	a, h
   25E6 47            [ 4]  510 	ld	b,a
   25E7 0A            [ 7]  511 	ld	a,(bc)
   25E8 B7            [ 4]  512 	or	a, a
   25E9 28 03         [12]  513 	jr	Z,00103$
                            514 ;src/entities/enemies.c:93: k++;
   25EB 14            [ 4]  515 	inc	d
   25EC 18 EB         [12]  516 	jr	00101$
   25EE                     517 00103$:
                            518 ;src/entities/enemies.c:95: groups[k].active=1;
   25EE 3E 01         [ 7]  519 	ld	a,#0x01
   25F0 02            [ 7]  520 	ld	(bc),a
                            521 ;src/entities/enemies.c:96: groups[k].x=x;
   25F1 69            [ 4]  522 	ld	l, c
   25F2 60            [ 4]  523 	ld	h, b
   25F3 23            [ 6]  524 	inc	hl
   25F4 DD 7E 04      [19]  525 	ld	a,4 (ix)
   25F7 77            [ 7]  526 	ld	(hl),a
   25F8 23            [ 6]  527 	inc	hl
   25F9 DD 7E 05      [19]  528 	ld	a,5 (ix)
   25FC 77            [ 7]  529 	ld	(hl),a
                            530 ;src/entities/enemies.c:97: groups[k].y=y;
   25FD 69            [ 4]  531 	ld	l, c
   25FE 60            [ 4]  532 	ld	h, b
   25FF 23            [ 6]  533 	inc	hl
   2600 23            [ 6]  534 	inc	hl
   2601 23            [ 6]  535 	inc	hl
   2602 DD 7E 06      [19]  536 	ld	a,6 (ix)
   2605 77            [ 7]  537 	ld	(hl),a
   2606 23            [ 6]  538 	inc	hl
   2607 DD 7E 07      [19]  539 	ld	a,7 (ix)
   260A 77            [ 7]  540 	ld	(hl),a
                            541 ;src/entities/enemies.c:98: groups[k].enemy_type=type;
   260B 21 05 00      [10]  542 	ld	hl,#0x0005
   260E 09            [11]  543 	add	hl,bc
   260F DD 7E 08      [19]  544 	ld	a,8 (ix)
   2612 77            [ 7]  545 	ld	(hl),a
                            546 ;src/entities/enemies.c:99: groups[k].num_enemies=num_enemies;
   2613 21 06 00      [10]  547 	ld	hl,#0x0006
   2616 09            [11]  548 	add	hl,bc
   2617 DD 7E 09      [19]  549 	ld	a,9 (ix)
   261A 77            [ 7]  550 	ld	(hl),a
                            551 ;src/entities/enemies.c:100: groups[k].sleep=ENEMY_GAP;
   261B 21 07 00      [10]  552 	ld	hl,#0x0007
   261E 09            [11]  553 	add	hl,bc
   261F 36 05         [10]  554 	ld	(hl),#0x05
                            555 ;src/entities/enemies.c:101: active_groups++;
   2621 21 CF 46      [10]  556 	ld	hl, #_active_groups+0
   2624 34            [11]  557 	inc	(hl)
   2625                     558 00106$:
   2625 DD E1         [14]  559 	pop	ix
   2627 C9            [10]  560 	ret
                            561 ;src/entities/enemies.c:109: void update_enemies(){
                            562 ;	---------------------------------
                            563 ; Function update_enemies
                            564 ; ---------------------------------
   2628                     565 _update_enemies::
   2628 DD E5         [15]  566 	push	ix
   262A DD 21 00 00   [14]  567 	ld	ix,#0
   262E DD 39         [15]  568 	add	ix,sp
   2630 21 F1 FF      [10]  569 	ld	hl,#-15
   2633 39            [11]  570 	add	hl,sp
   2634 F9            [ 6]  571 	ld	sp,hl
                            572 ;src/entities/enemies.c:113: if (active_enemies>0){
   2635 3A BE 46      [13]  573 	ld	a,(#_active_enemies + 0)
   2638 B7            [ 4]  574 	or	a, a
   2639 CA 1F 28      [10]  575 	jp	Z,00112$
                            576 ;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
   263C 01 39 2A      [10]  577 	ld	bc,#_movements+0
   263F DD 36 F1 00   [19]  578 	ld	-15 (ix),#0x00
   2643 DD 36 F2 00   [19]  579 	ld	-14 (ix),#0x00
   2647 DD 36 F3 00   [19]  580 	ld	-13 (ix),#0x00
   264B                     581 00124$:
                            582 ;src/entities/enemies.c:115: if (enemies[i].active){
   264B 3E 56         [ 7]  583 	ld	a,#<(_enemies)
   264D DD 86 F2      [19]  584 	add	a, -14 (ix)
   2650 DD 77 FE      [19]  585 	ld	-2 (ix),a
   2653 3E 45         [ 7]  586 	ld	a,#>(_enemies)
   2655 DD 8E F3      [19]  587 	adc	a, -13 (ix)
   2658 DD 77 FF      [19]  588 	ld	-1 (ix),a
   265B DD 6E FE      [19]  589 	ld	l,-2 (ix)
   265E DD 66 FF      [19]  590 	ld	h,-1 (ix)
   2661 11 17 00      [10]  591 	ld	de, #0x0017
   2664 19            [11]  592 	add	hl, de
   2665 7E            [ 7]  593 	ld	a,(hl)
   2666 B7            [ 4]  594 	or	a, a
   2667 CA 04 28      [10]  595 	jp	Z,00125$
                            596 ;src/entities/enemies.c:116: if (enemies[i].movement<99){
   266A DD 7E FE      [19]  597 	ld	a,-2 (ix)
   266D C6 1D         [ 7]  598 	add	a, #0x1D
   266F DD 77 FC      [19]  599 	ld	-4 (ix),a
   2672 DD 7E FF      [19]  600 	ld	a,-1 (ix)
   2675 CE 00         [ 7]  601 	adc	a, #0x00
   2677 DD 77 FD      [19]  602 	ld	-3 (ix),a
   267A DD 6E FC      [19]  603 	ld	l,-4 (ix)
   267D DD 66 FD      [19]  604 	ld	h,-3 (ix)
   2680 7E            [ 7]  605 	ld	a,(hl)
   2681 DD 77 FB      [19]  606 	ld	-5 (ix), a
   2684 D6 63         [ 7]  607 	sub	a, #0x63
   2686 D2 04 28      [10]  608 	jp	NC,00125$
                            609 ;src/entities/enemies.c:117: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   2689 DD 7E FE      [19]  610 	ld	a,-2 (ix)
   268C C6 1F         [ 7]  611 	add	a, #0x1F
   268E 5F            [ 4]  612 	ld	e,a
   268F DD 7E FF      [19]  613 	ld	a,-1 (ix)
   2692 CE 00         [ 7]  614 	adc	a, #0x00
   2694 57            [ 4]  615 	ld	d,a
   2695 1A            [ 7]  616 	ld	a,(de)
   2696 DD 77 FA      [19]  617 	ld	-6 (ix),a
   2699 D5            [11]  618 	push	de
   269A DD 5E FB      [19]  619 	ld	e,-5 (ix)
   269D 16 00         [ 7]  620 	ld	d,#0x00
   269F 6B            [ 4]  621 	ld	l, e
   26A0 62            [ 4]  622 	ld	h, d
   26A1 29            [11]  623 	add	hl, hl
   26A2 29            [11]  624 	add	hl, hl
   26A3 29            [11]  625 	add	hl, hl
   26A4 29            [11]  626 	add	hl, hl
   26A5 29            [11]  627 	add	hl, hl
   26A6 19            [11]  628 	add	hl, de
   26A7 D1            [10]  629 	pop	de
   26A8 09            [11]  630 	add	hl, bc
   26A9 23            [ 6]  631 	inc	hl
   26AA E5            [11]  632 	push	hl
   26AB FD E1         [14]  633 	pop	iy
   26AD DD 7E FE      [19]  634 	ld	a,-2 (ix)
   26B0 C6 1E         [ 7]  635 	add	a, #0x1E
   26B2 DD 77 F8      [19]  636 	ld	-8 (ix),a
   26B5 DD 7E FF      [19]  637 	ld	a,-1 (ix)
   26B8 CE 00         [ 7]  638 	adc	a, #0x00
   26BA DD 77 F9      [19]  639 	ld	-7 (ix),a
   26BD DD 6E F8      [19]  640 	ld	l,-8 (ix)
   26C0 DD 66 F9      [19]  641 	ld	h,-7 (ix)
   26C3 7E            [ 7]  642 	ld	a,(hl)
   26C4 DD 77 FB      [19]  643 	ld	-5 (ix), a
   26C7 87            [ 4]  644 	add	a, a
   26C8 87            [ 4]  645 	add	a, a
   26C9 67            [ 4]  646 	ld	h,a
   26CA C5            [11]  647 	push	bc
   26CB 4C            [ 4]  648 	ld	c,h
   26CC 06 00         [ 7]  649 	ld	b,#0x00
   26CE FD 09         [15]  650 	add	iy, bc
   26D0 C1            [10]  651 	pop	bc
   26D1 FD E5         [15]  652 	push	iy
   26D3 E1            [10]  653 	pop	hl
   26D4 23            [ 6]  654 	inc	hl
   26D5 23            [ 6]  655 	inc	hl
   26D6 23            [ 6]  656 	inc	hl
   26D7 DD 7E FA      [19]  657 	ld	a,-6 (ix)
   26DA 96            [ 7]  658 	sub	a,(hl)
   26DB D2 D1 27      [10]  659 	jp	NC,00104$
                            660 ;src/entities/enemies.c:118: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   26DE DD 7E FE      [19]  661 	ld	a,-2 (ix)
   26E1 C6 16         [ 7]  662 	add	a, #0x16
   26E3 DD 77 F6      [19]  663 	ld	-10 (ix),a
   26E6 DD 7E FF      [19]  664 	ld	a,-1 (ix)
   26E9 CE 00         [ 7]  665 	adc	a, #0x00
   26EB DD 77 F7      [19]  666 	ld	-9 (ix),a
   26EE FD 7E 00      [19]  667 	ld	a, 0 (iy)
   26F1 DD 6E F6      [19]  668 	ld	l,-10 (ix)
   26F4 DD 66 F7      [19]  669 	ld	h,-9 (ix)
   26F7 77            [ 7]  670 	ld	(hl),a
                            671 ;src/entities/enemies.c:119: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   26F8 FD 21 10 00   [14]  672 	ld	iy,#0x0010
   26FC C5            [11]  673 	push	bc
   26FD DD 4E FE      [19]  674 	ld	c,-2 (ix)
   2700 DD 46 FF      [19]  675 	ld	b,-1 (ix)
   2703 FD 09         [15]  676 	add	iy, bc
   2705 C1            [10]  677 	pop	bc
   2706 FD 7E 00      [19]  678 	ld	a,0 (iy)
   2709 DD 77 F6      [19]  679 	ld	-10 (ix),a
   270C FD 7E 01      [19]  680 	ld	a,1 (iy)
   270F DD 77 F7      [19]  681 	ld	-9 (ix),a
   2712 DD 6E FC      [19]  682 	ld	l,-4 (ix)
   2715 DD 66 FD      [19]  683 	ld	h,-3 (ix)
   2718 7E            [ 7]  684 	ld	a,(hl)
   2719 D5            [11]  685 	push	de
   271A 5F            [ 4]  686 	ld	e,a
   271B 16 00         [ 7]  687 	ld	d,#0x00
   271D 6B            [ 4]  688 	ld	l, e
   271E 62            [ 4]  689 	ld	h, d
   271F 29            [11]  690 	add	hl, hl
   2720 29            [11]  691 	add	hl, hl
   2721 29            [11]  692 	add	hl, hl
   2722 29            [11]  693 	add	hl, hl
   2723 29            [11]  694 	add	hl, hl
   2724 19            [11]  695 	add	hl, de
   2725 D1            [10]  696 	pop	de
   2726 09            [11]  697 	add	hl,bc
   2727 23            [ 6]  698 	inc	hl
   2728 DD 75 F4      [19]  699 	ld	-12 (ix),l
   272B DD 74 F5      [19]  700 	ld	-11 (ix),h
   272E DD 6E F8      [19]  701 	ld	l,-8 (ix)
   2731 DD 66 F9      [19]  702 	ld	h,-7 (ix)
   2734 7E            [ 7]  703 	ld	a,(hl)
   2735 87            [ 4]  704 	add	a, a
   2736 87            [ 4]  705 	add	a, a
   2737 67            [ 4]  706 	ld	h,a
   2738 DD 7E F4      [19]  707 	ld	a,-12 (ix)
   273B 84            [ 4]  708 	add	a, h
   273C 6F            [ 4]  709 	ld	l,a
   273D DD 7E F5      [19]  710 	ld	a,-11 (ix)
   2740 CE 00         [ 7]  711 	adc	a, #0x00
   2742 67            [ 4]  712 	ld	h,a
   2743 23            [ 6]  713 	inc	hl
   2744 7E            [ 7]  714 	ld	a,(hl)
   2745 6F            [ 4]  715 	ld	l,a
   2746 17            [ 4]  716 	rla
   2747 9F            [ 4]  717 	sbc	a, a
   2748 67            [ 4]  718 	ld	h,a
   2749 DD 7E F6      [19]  719 	ld	a,-10 (ix)
   274C 85            [ 4]  720 	add	a, l
   274D 6F            [ 4]  721 	ld	l,a
   274E DD 7E F7      [19]  722 	ld	a,-9 (ix)
   2751 8C            [ 4]  723 	adc	a, h
   2752 FD 75 00      [19]  724 	ld	0 (iy), l
   2755 FD 77 01      [19]  725 	ld	1 (iy), a
                            726 ;src/entities/enemies.c:120: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2758 DD 7E FE      [19]  727 	ld	a,-2 (ix)
   275B C6 12         [ 7]  728 	add	a, #0x12
   275D DD 77 F4      [19]  729 	ld	-12 (ix),a
   2760 DD 7E FF      [19]  730 	ld	a,-1 (ix)
   2763 CE 00         [ 7]  731 	adc	a, #0x00
   2765 DD 77 F5      [19]  732 	ld	-11 (ix),a
   2768 DD 6E F4      [19]  733 	ld	l,-12 (ix)
   276B DD 66 F5      [19]  734 	ld	h,-11 (ix)
   276E 7E            [ 7]  735 	ld	a,(hl)
   276F DD 77 F6      [19]  736 	ld	-10 (ix),a
   2772 23            [ 6]  737 	inc	hl
   2773 7E            [ 7]  738 	ld	a,(hl)
   2774 DD 77 F7      [19]  739 	ld	-9 (ix),a
   2777 DD 6E FC      [19]  740 	ld	l,-4 (ix)
   277A DD 66 FD      [19]  741 	ld	h,-3 (ix)
   277D 7E            [ 7]  742 	ld	a,(hl)
   277E D5            [11]  743 	push	de
   277F 5F            [ 4]  744 	ld	e,a
   2780 16 00         [ 7]  745 	ld	d,#0x00
   2782 6B            [ 4]  746 	ld	l, e
   2783 62            [ 4]  747 	ld	h, d
   2784 29            [11]  748 	add	hl, hl
   2785 29            [11]  749 	add	hl, hl
   2786 29            [11]  750 	add	hl, hl
   2787 29            [11]  751 	add	hl, hl
   2788 29            [11]  752 	add	hl, hl
   2789 19            [11]  753 	add	hl, de
   278A D1            [10]  754 	pop	de
   278B 09            [11]  755 	add	hl,bc
   278C 23            [ 6]  756 	inc	hl
   278D DD 75 FE      [19]  757 	ld	-2 (ix),l
   2790 DD 74 FF      [19]  758 	ld	-1 (ix),h
   2793 DD 6E F8      [19]  759 	ld	l,-8 (ix)
   2796 DD 66 F9      [19]  760 	ld	h,-7 (ix)
   2799 7E            [ 7]  761 	ld	a,(hl)
   279A 87            [ 4]  762 	add	a, a
   279B 87            [ 4]  763 	add	a, a
   279C 67            [ 4]  764 	ld	h,a
   279D DD 7E FE      [19]  765 	ld	a,-2 (ix)
   27A0 84            [ 4]  766 	add	a, h
   27A1 6F            [ 4]  767 	ld	l,a
   27A2 DD 7E FF      [19]  768 	ld	a,-1 (ix)
   27A5 CE 00         [ 7]  769 	adc	a, #0x00
   27A7 67            [ 4]  770 	ld	h,a
   27A8 23            [ 6]  771 	inc	hl
   27A9 23            [ 6]  772 	inc	hl
   27AA 7E            [ 7]  773 	ld	a,(hl)
   27AB 6F            [ 4]  774 	ld	l,a
   27AC 17            [ 4]  775 	rla
   27AD 9F            [ 4]  776 	sbc	a, a
   27AE 67            [ 4]  777 	ld	h,a
   27AF DD 7E F6      [19]  778 	ld	a,-10 (ix)
   27B2 85            [ 4]  779 	add	a, l
   27B3 DD 77 F6      [19]  780 	ld	-10 (ix),a
   27B6 DD 7E F7      [19]  781 	ld	a,-9 (ix)
   27B9 8C            [ 4]  782 	adc	a, h
   27BA DD 77 F7      [19]  783 	ld	-9 (ix),a
   27BD DD 6E F4      [19]  784 	ld	l,-12 (ix)
   27C0 DD 66 F5      [19]  785 	ld	h,-11 (ix)
   27C3 DD 7E F6      [19]  786 	ld	a,-10 (ix)
   27C6 77            [ 7]  787 	ld	(hl),a
   27C7 23            [ 6]  788 	inc	hl
   27C8 DD 7E F7      [19]  789 	ld	a,-9 (ix)
   27CB 77            [ 7]  790 	ld	(hl),a
                            791 ;src/entities/enemies.c:121: enemies[i].stage_step++;
   27CC 1A            [ 7]  792 	ld	a,(de)
   27CD 3C            [ 4]  793 	inc	a
   27CE 12            [ 7]  794 	ld	(de),a
   27CF 18 33         [12]  795 	jr	00125$
   27D1                     796 00104$:
                            797 ;src/entities/enemies.c:123: enemies[i].stage++;
   27D1 DD 7E FB      [19]  798 	ld	a,-5 (ix)
   27D4 3C            [ 4]  799 	inc	a
   27D5 DD 77 F4      [19]  800 	ld	-12 (ix),a
   27D8 DD 6E F8      [19]  801 	ld	l,-8 (ix)
   27DB DD 66 F9      [19]  802 	ld	h,-7 (ix)
   27DE DD 7E F4      [19]  803 	ld	a,-12 (ix)
   27E1 77            [ 7]  804 	ld	(hl),a
                            805 ;src/entities/enemies.c:124: enemies[i].stage_step=0;
   27E2 AF            [ 4]  806 	xor	a, a
   27E3 12            [ 7]  807 	ld	(de),a
                            808 ;src/entities/enemies.c:125: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   27E4 DD 6E FC      [19]  809 	ld	l,-4 (ix)
   27E7 DD 66 FD      [19]  810 	ld	h,-3 (ix)
   27EA 5E            [ 7]  811 	ld	e, (hl)
   27EB 16 00         [ 7]  812 	ld	d,#0x00
   27ED 6B            [ 4]  813 	ld	l, e
   27EE 62            [ 4]  814 	ld	h, d
   27EF 29            [11]  815 	add	hl, hl
   27F0 29            [11]  816 	add	hl, hl
   27F1 29            [11]  817 	add	hl, hl
   27F2 29            [11]  818 	add	hl, hl
   27F3 29            [11]  819 	add	hl, hl
   27F4 19            [11]  820 	add	hl, de
   27F5 09            [11]  821 	add	hl,bc
   27F6 DD 7E F4      [19]  822 	ld	a,-12 (ix)
   27F9 96            [ 7]  823 	sub	a,(hl)
   27FA 38 08         [12]  824 	jr	C,00125$
                            825 ;src/entities/enemies.c:126: enemies[i].stage=0;
   27FC DD 6E F8      [19]  826 	ld	l,-8 (ix)
   27FF DD 66 F9      [19]  827 	ld	h,-7 (ix)
   2802 36 00         [10]  828 	ld	(hl),#0x00
   2804                     829 00125$:
                            830 ;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
   2804 DD 7E F2      [19]  831 	ld	a,-14 (ix)
   2807 C6 24         [ 7]  832 	add	a, #0x24
   2809 DD 77 F2      [19]  833 	ld	-14 (ix),a
   280C DD 7E F3      [19]  834 	ld	a,-13 (ix)
   280F CE 00         [ 7]  835 	adc	a, #0x00
   2811 DD 77 F3      [19]  836 	ld	-13 (ix),a
   2814 DD 34 F1      [23]  837 	inc	-15 (ix)
   2817 DD 7E F1      [19]  838 	ld	a,-15 (ix)
   281A D6 0A         [ 7]  839 	sub	a, #0x0A
   281C DA 4B 26      [10]  840 	jp	C,00124$
   281F                     841 00112$:
                            842 ;src/entities/enemies.c:135: if (active_groups>0){
   281F 3A CF 46      [13]  843 	ld	a,(#_active_groups + 0)
   2822 B7            [ 4]  844 	or	a, a
   2823 28 73         [12]  845 	jr	Z,00128$
                            846 ;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2825 DD 36 F1 00   [19]  847 	ld	-15 (ix),#0x00
   2829                     848 00126$:
                            849 ;src/entities/enemies.c:138: if (groups[i].active){
   2829 DD 6E F1      [19]  850 	ld	l,-15 (ix)
   282C 26 00         [ 7]  851 	ld	h,#0x00
   282E 29            [11]  852 	add	hl, hl
   282F 29            [11]  853 	add	hl, hl
   2830 29            [11]  854 	add	hl, hl
   2831 3E BF         [ 7]  855 	ld	a,#<(_groups)
   2833 85            [ 4]  856 	add	a, l
   2834 5F            [ 4]  857 	ld	e,a
   2835 3E 46         [ 7]  858 	ld	a,#>(_groups)
   2837 8C            [ 4]  859 	adc	a, h
   2838 57            [ 4]  860 	ld	d,a
   2839 1A            [ 7]  861 	ld	a,(de)
   283A B7            [ 4]  862 	or	a, a
   283B 28 51         [12]  863 	jr	Z,00127$
                            864 ;src/entities/enemies.c:139: if (groups[i].sleep==0){
   283D 21 07 00      [10]  865 	ld	hl,#0x0007
   2840 19            [11]  866 	add	hl,de
   2841 7E            [ 7]  867 	ld	a,(hl)
   2842 B7            [ 4]  868 	or	a, a
   2843 20 46         [12]  869 	jr	NZ,00117$
                            870 ;src/entities/enemies.c:140: groups[i].sleep=ENEMY_GAP;
   2845 36 05         [10]  871 	ld	(hl),#0x05
                            872 ;src/entities/enemies.c:141: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2847 6B            [ 4]  873 	ld	l, e
   2848 62            [ 4]  874 	ld	h, d
   2849 01 05 00      [10]  875 	ld	bc, #0x0005
   284C 09            [11]  876 	add	hl, bc
   284D 4E            [ 7]  877 	ld	c,(hl)
   284E 6B            [ 4]  878 	ld	l, e
   284F 62            [ 4]  879 	ld	h, d
   2850 23            [ 6]  880 	inc	hl
   2851 23            [ 6]  881 	inc	hl
   2852 23            [ 6]  882 	inc	hl
   2853 7E            [ 7]  883 	ld	a,(hl)
   2854 DD 77 F4      [19]  884 	ld	-12 (ix),a
   2857 23            [ 6]  885 	inc	hl
   2858 7E            [ 7]  886 	ld	a,(hl)
   2859 DD 77 F5      [19]  887 	ld	-11 (ix),a
   285C 6B            [ 4]  888 	ld	l, e
   285D 62            [ 4]  889 	ld	h, d
   285E 23            [ 6]  890 	inc	hl
   285F 7E            [ 7]  891 	ld	a, (hl)
   2860 23            [ 6]  892 	inc	hl
   2861 66            [ 7]  893 	ld	h,(hl)
   2862 6F            [ 4]  894 	ld	l,a
   2863 D5            [11]  895 	push	de
   2864 79            [ 4]  896 	ld	a,c
   2865 F5            [11]  897 	push	af
   2866 33            [ 6]  898 	inc	sp
   2867 DD 4E F4      [19]  899 	ld	c,-12 (ix)
   286A DD 46 F5      [19]  900 	ld	b,-11 (ix)
   286D C5            [11]  901 	push	bc
   286E E5            [11]  902 	push	hl
   286F CD 38 23      [17]  903 	call	_create_enemy
   2872 F1            [10]  904 	pop	af
   2873 F1            [10]  905 	pop	af
   2874 33            [ 6]  906 	inc	sp
   2875 D1            [10]  907 	pop	de
                            908 ;src/entities/enemies.c:142: if (groups[i].num_enemies==0){
   2876 21 06 00      [10]  909 	ld	hl,#0x0006
   2879 19            [11]  910 	add	hl,de
   287A 7E            [ 7]  911 	ld	a,(hl)
   287B B7            [ 4]  912 	or	a, a
   287C 20 08         [12]  913 	jr	NZ,00114$
                            914 ;src/entities/enemies.c:143: groups[i].active=0;
   287E AF            [ 4]  915 	xor	a, a
   287F 12            [ 7]  916 	ld	(de),a
                            917 ;src/entities/enemies.c:144: active_groups--;
   2880 21 CF 46      [10]  918 	ld	hl, #_active_groups+0
   2883 35            [11]  919 	dec	(hl)
   2884 18 08         [12]  920 	jr	00127$
   2886                     921 00114$:
                            922 ;src/entities/enemies.c:146: groups[i].num_enemies--;
   2886 C6 FF         [ 7]  923 	add	a,#0xFF
   2888 77            [ 7]  924 	ld	(hl),a
   2889 18 03         [12]  925 	jr	00127$
   288B                     926 00117$:
                            927 ;src/entities/enemies.c:149: groups[i].sleep--;
   288B C6 FF         [ 7]  928 	add	a,#0xFF
   288D 77            [ 7]  929 	ld	(hl),a
   288E                     930 00127$:
                            931 ;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   288E DD 34 F1      [23]  932 	inc	-15 (ix)
   2891 DD 7E F1      [19]  933 	ld	a,-15 (ix)
   2894 D6 02         [ 7]  934 	sub	a, #0x02
   2896 38 91         [12]  935 	jr	C,00126$
   2898                     936 00128$:
   2898 DD F9         [10]  937 	ld	sp, ix
   289A DD E1         [14]  938 	pop	ix
   289C C9            [10]  939 	ret
                            940 ;src/entities/enemies.c:157: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                            941 ;	---------------------------------
                            942 ; Function inside_screen
                            943 ; ---------------------------------
   289D                     944 _inside_screen::
   289D DD E5         [15]  945 	push	ix
   289F DD 21 00 00   [14]  946 	ld	ix,#0
   28A3 DD 39         [15]  947 	add	ix,sp
   28A5 3B            [ 6]  948 	dec	sp
                            949 ;src/entities/enemies.c:158: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   28A6 DD CB 05 7E   [20]  950 	bit	7, 5 (ix)
   28AA 20 38         [12]  951 	jr	NZ,00103$
   28AC DD 5E 08      [19]  952 	ld	e,8 (ix)
   28AF 16 00         [ 7]  953 	ld	d,#0x00
   28B1 DD 6E 04      [19]  954 	ld	l,4 (ix)
   28B4 DD 66 05      [19]  955 	ld	h,5 (ix)
   28B7 19            [11]  956 	add	hl,de
   28B8 11 A0 80      [10]  957 	ld	de, #0x80A0
   28BB 29            [11]  958 	add	hl, hl
   28BC 3F            [ 4]  959 	ccf
   28BD CB 1C         [ 8]  960 	rr	h
   28BF CB 1D         [ 8]  961 	rr	l
   28C1 ED 52         [15]  962 	sbc	hl, de
   28C3 30 1F         [12]  963 	jr	NC,00103$
   28C5 DD CB 07 7E   [20]  964 	bit	7, 7 (ix)
   28C9 20 19         [12]  965 	jr	NZ,00103$
   28CB DD 5E 09      [19]  966 	ld	e,9 (ix)
   28CE 16 00         [ 7]  967 	ld	d,#0x00
   28D0 DD 6E 06      [19]  968 	ld	l,6 (ix)
   28D3 DD 66 07      [19]  969 	ld	h,7 (ix)
   28D6 19            [11]  970 	add	hl,de
   28D7 11 C8 80      [10]  971 	ld	de, #0x80C8
   28DA 29            [11]  972 	add	hl, hl
   28DB 3F            [ 4]  973 	ccf
   28DC CB 1C         [ 8]  974 	rr	h
   28DE CB 1D         [ 8]  975 	rr	l
   28E0 ED 52         [15]  976 	sbc	hl, de
   28E2 38 04         [12]  977 	jr	C,00104$
   28E4                     978 00103$:
   28E4 2E 00         [ 7]  979 	ld	l,#0x00
   28E6 18 02         [12]  980 	jr	00105$
   28E8                     981 00104$:
   28E8 2E 01         [ 7]  982 	ld	l,#0x01
   28EA                     983 00105$:
   28EA 33            [ 6]  984 	inc	sp
   28EB DD E1         [14]  985 	pop	ix
   28ED C9            [10]  986 	ret
                            987 ;src/entities/enemies.c:165: void draw_enemies(u8* screen){
                            988 ;	---------------------------------
                            989 ; Function draw_enemies
                            990 ; ---------------------------------
   28EE                     991 _draw_enemies::
   28EE DD E5         [15]  992 	push	ix
   28F0 DD 21 00 00   [14]  993 	ld	ix,#0
   28F4 DD 39         [15]  994 	add	ix,sp
   28F6 21 F1 FF      [10]  995 	ld	hl,#-15
   28F9 39            [11]  996 	add	hl,sp
   28FA F9            [ 6]  997 	ld	sp,hl
                            998 ;src/entities/enemies.c:170: if (active_enemies>0){
   28FB 3A BE 46      [13]  999 	ld	a,(#_active_enemies + 0)
   28FE B7            [ 4] 1000 	or	a, a
   28FF CA 34 2A      [10] 1001 	jp	Z,00109$
                           1002 ;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
   2902 DD 36 F1 00   [19] 1003 	ld	-15 (ix),#0x00
   2906 11 00 00      [10] 1004 	ld	de,#0x0000
   2909                    1005 00107$:
                           1006 ;src/entities/enemies.c:172: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2909 21 56 45      [10] 1007 	ld	hl,#_enemies
   290C 19            [11] 1008 	add	hl,de
   290D DD 75 FC      [19] 1009 	ld	-4 (ix),l
   2910 DD 74 FD      [19] 1010 	ld	-3 (ix),h
   2913 DD 6E FC      [19] 1011 	ld	l,-4 (ix)
   2916 DD 66 FD      [19] 1012 	ld	h,-3 (ix)
   2919 01 17 00      [10] 1013 	ld	bc, #0x0017
   291C 09            [11] 1014 	add	hl, bc
   291D 7E            [ 7] 1015 	ld	a,(hl)
   291E B7            [ 4] 1016 	or	a, a
   291F CA 24 2A      [10] 1017 	jp	Z,00108$
   2922 DD 7E FC      [19] 1018 	ld	a,-4 (ix)
   2925 C6 15         [ 7] 1019 	add	a, #0x15
   2927 DD 77 F2      [19] 1020 	ld	-14 (ix),a
   292A DD 7E FD      [19] 1021 	ld	a,-3 (ix)
   292D CE 00         [ 7] 1022 	adc	a, #0x00
   292F DD 77 F3      [19] 1023 	ld	-13 (ix),a
   2932 DD 6E F2      [19] 1024 	ld	l,-14 (ix)
   2935 DD 66 F3      [19] 1025 	ld	h,-13 (ix)
   2938 46            [ 7] 1026 	ld	b,(hl)
   2939 DD 7E FC      [19] 1027 	ld	a,-4 (ix)
   293C C6 14         [ 7] 1028 	add	a, #0x14
   293E DD 77 FE      [19] 1029 	ld	-2 (ix),a
   2941 DD 7E FD      [19] 1030 	ld	a,-3 (ix)
   2944 CE 00         [ 7] 1031 	adc	a, #0x00
   2946 DD 77 FF      [19] 1032 	ld	-1 (ix),a
   2949 DD 6E FE      [19] 1033 	ld	l,-2 (ix)
   294C DD 66 FF      [19] 1034 	ld	h,-1 (ix)
   294F 4E            [ 7] 1035 	ld	c,(hl)
   2950 DD 7E FC      [19] 1036 	ld	a,-4 (ix)
   2953 C6 12         [ 7] 1037 	add	a, #0x12
   2955 DD 77 FA      [19] 1038 	ld	-6 (ix),a
   2958 DD 7E FD      [19] 1039 	ld	a,-3 (ix)
   295B CE 00         [ 7] 1040 	adc	a, #0x00
   295D DD 77 FB      [19] 1041 	ld	-5 (ix),a
   2960 DD 6E FA      [19] 1042 	ld	l,-6 (ix)
   2963 DD 66 FB      [19] 1043 	ld	h,-5 (ix)
   2966 7E            [ 7] 1044 	ld	a,(hl)
   2967 DD 77 F8      [19] 1045 	ld	-8 (ix),a
   296A 23            [ 6] 1046 	inc	hl
   296B 7E            [ 7] 1047 	ld	a,(hl)
   296C DD 77 F9      [19] 1048 	ld	-7 (ix),a
   296F DD 7E FC      [19] 1049 	ld	a,-4 (ix)
   2972 C6 10         [ 7] 1050 	add	a, #0x10
   2974 DD 77 F6      [19] 1051 	ld	-10 (ix),a
   2977 DD 7E FD      [19] 1052 	ld	a,-3 (ix)
   297A CE 00         [ 7] 1053 	adc	a, #0x00
   297C DD 77 F7      [19] 1054 	ld	-9 (ix),a
   297F DD 6E F6      [19] 1055 	ld	l,-10 (ix)
   2982 DD 66 F7      [19] 1056 	ld	h,-9 (ix)
   2985 7E            [ 7] 1057 	ld	a,(hl)
   2986 DD 77 F4      [19] 1058 	ld	-12 (ix),a
   2989 23            [ 6] 1059 	inc	hl
   298A 7E            [ 7] 1060 	ld	a,(hl)
   298B DD 77 F5      [19] 1061 	ld	-11 (ix),a
   298E D5            [11] 1062 	push	de
   298F C5            [11] 1063 	push	bc
   2990 DD 6E F8      [19] 1064 	ld	l,-8 (ix)
   2993 DD 66 F9      [19] 1065 	ld	h,-7 (ix)
   2996 E5            [11] 1066 	push	hl
   2997 DD 6E F4      [19] 1067 	ld	l,-12 (ix)
   299A DD 66 F5      [19] 1068 	ld	h,-11 (ix)
   299D E5            [11] 1069 	push	hl
   299E CD 9D 28      [17] 1070 	call	_inside_screen
   29A1 F1            [10] 1071 	pop	af
   29A2 F1            [10] 1072 	pop	af
   29A3 F1            [10] 1073 	pop	af
   29A4 7D            [ 4] 1074 	ld	a,l
   29A5 D1            [10] 1075 	pop	de
   29A6 B7            [ 4] 1076 	or	a, a
   29A7 28 7B         [12] 1077 	jr	Z,00108$
                           1078 ;src/entities/enemies.c:173: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   29A9 DD 6E FA      [19] 1079 	ld	l,-6 (ix)
   29AC DD 66 FB      [19] 1080 	ld	h,-5 (ix)
   29AF 4E            [ 7] 1081 	ld	c,(hl)
   29B0 23            [ 6] 1082 	inc	hl
   29B1 46            [ 7] 1083 	ld	b,(hl)
   29B2 DD 6E F6      [19] 1084 	ld	l,-10 (ix)
   29B5 DD 66 F7      [19] 1085 	ld	h,-9 (ix)
   29B8 7E            [ 7] 1086 	ld	a, (hl)
   29B9 23            [ 6] 1087 	inc	hl
   29BA 66            [ 7] 1088 	ld	h,(hl)
   29BB 6F            [ 4] 1089 	ld	l,a
   29BC 65            [ 4] 1090 	ld	h,l
   29BD E5            [11] 1091 	push	hl
   29BE DD 6E 04      [19] 1092 	ld	l,4 (ix)
   29C1 DD 66 05      [19] 1093 	ld	h,5 (ix)
   29C4 E5            [11] 1094 	push	hl
   29C5 FD E1         [14] 1095 	pop	iy
   29C7 E1            [10] 1096 	pop	hl
   29C8 D5            [11] 1097 	push	de
   29C9 79            [ 4] 1098 	ld	a,c
   29CA F5            [11] 1099 	push	af
   29CB 33            [ 6] 1100 	inc	sp
   29CC E5            [11] 1101 	push	hl
   29CD 33            [ 6] 1102 	inc	sp
   29CE FD E5         [15] 1103 	push	iy
   29D0 CD B8 43      [17] 1104 	call	_cpct_getScreenPtr
   29D3 F1            [10] 1105 	pop	af
   29D4 F1            [10] 1106 	pop	af
   29D5 D1            [10] 1107 	pop	de
   29D6 4D            [ 4] 1108 	ld	c, l
   29D7 44            [ 4] 1109 	ld	b, h
                           1110 ;src/entities/enemies.c:174: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   29D8 DD 6E F2      [19] 1111 	ld	l,-14 (ix)
   29DB DD 66 F3      [19] 1112 	ld	h,-13 (ix)
   29DE 7E            [ 7] 1113 	ld	a,(hl)
   29DF DD 77 F4      [19] 1114 	ld	-12 (ix),a
   29E2 DD 6E FE      [19] 1115 	ld	l,-2 (ix)
   29E5 DD 66 FF      [19] 1116 	ld	h,-1 (ix)
   29E8 7E            [ 7] 1117 	ld	a,(hl)
   29E9 DD 77 F6      [19] 1118 	ld	-10 (ix),a
   29EC DD 71 F8      [19] 1119 	ld	-8 (ix),c
   29EF DD 70 F9      [19] 1120 	ld	-7 (ix),b
   29F2 DD 6E FC      [19] 1121 	ld	l,-4 (ix)
   29F5 DD 66 FD      [19] 1122 	ld	h,-3 (ix)
   29F8 01 16 00      [10] 1123 	ld	bc, #0x0016
   29FB 09            [11] 1124 	add	hl, bc
   29FC 7E            [ 7] 1125 	ld	a,(hl)
   29FD 87            [ 4] 1126 	add	a, a
   29FE 4F            [ 4] 1127 	ld	c,a
   29FF DD 6E FC      [19] 1128 	ld	l,-4 (ix)
   2A02 DD 66 FD      [19] 1129 	ld	h,-3 (ix)
   2A05 06 00         [ 7] 1130 	ld	b,#0x00
   2A07 09            [11] 1131 	add	hl, bc
   2A08 4E            [ 7] 1132 	ld	c,(hl)
   2A09 23            [ 6] 1133 	inc	hl
   2A0A 46            [ 7] 1134 	ld	b,(hl)
   2A0B D5            [11] 1135 	push	de
   2A0C DD 66 F4      [19] 1136 	ld	h,-12 (ix)
   2A0F DD 6E F6      [19] 1137 	ld	l,-10 (ix)
   2A12 E5            [11] 1138 	push	hl
   2A13 DD 6E F8      [19] 1139 	ld	l,-8 (ix)
   2A16 DD 66 F9      [19] 1140 	ld	h,-7 (ix)
   2A19 E5            [11] 1141 	push	hl
   2A1A C5            [11] 1142 	push	bc
   2A1B CD 89 41      [17] 1143 	call	_cpct_drawSprite
   2A1E 21 06 00      [10] 1144 	ld	hl,#6
   2A21 39            [11] 1145 	add	hl,sp
   2A22 F9            [ 6] 1146 	ld	sp,hl
   2A23 D1            [10] 1147 	pop	de
   2A24                    1148 00108$:
                           1149 ;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
   2A24 21 24 00      [10] 1150 	ld	hl,#0x0024
   2A27 19            [11] 1151 	add	hl,de
   2A28 EB            [ 4] 1152 	ex	de,hl
   2A29 DD 34 F1      [23] 1153 	inc	-15 (ix)
   2A2C DD 7E F1      [19] 1154 	ld	a,-15 (ix)
   2A2F D6 0A         [ 7] 1155 	sub	a, #0x0A
   2A31 DA 09 29      [10] 1156 	jp	C,00107$
   2A34                    1157 00109$:
   2A34 DD F9         [10] 1158 	ld	sp, ix
   2A36 DD E1         [14] 1159 	pop	ix
   2A38 C9            [10] 1160 	ret
                           1161 	.area _CODE
                           1162 	.area _INITIALIZER
                           1163 	.area _CABS (ABS)
