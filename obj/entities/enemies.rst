                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 03:16:35 2015
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
   4EAF                      31 _enemies::
   4EAF                      32 	.ds 1080
   52E7                      33 _active_enemies::
   52E7                      34 	.ds 1
   52E8                      35 _groups::
   52E8                      36 	.ds 32
   5308                      37 _active_groups::
   5308                      38 	.ds 1
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
                             63 ;src/entities/enemies.c:16: void init_enemies(){
                             64 ;	---------------------------------
                             65 ; Function init_enemies
                             66 ; ---------------------------------
   22D4                      67 _init_enemies::
   22D4 DD E5         [15]   68 	push	ix
   22D6 DD 21 00 00   [14]   69 	ld	ix,#0
   22DA DD 39         [15]   70 	add	ix,sp
   22DC 3B            [ 6]   71 	dec	sp
                             72 ;src/entities/enemies.c:18: for (k=0;k<MAX_ENEMIES;k++){
   22DD DD 36 FF 00   [19]   73 	ld	-1 (ix),#0x00
   22E1 11 00 00      [10]   74 	ld	de,#0x0000
   22E4                      75 00102$:
                             76 ;src/entities/enemies.c:19: enemies[k].active=0;
   22E4 21 AF 4E      [10]   77 	ld	hl,#_enemies
   22E7 19            [11]   78 	add	hl,de
   22E8 4D            [ 4]   79 	ld	c,l
   22E9 44            [ 4]   80 	ld	b,h
   22EA 21 17 00      [10]   81 	ld	hl,#0x0017
   22ED 09            [11]   82 	add	hl,bc
   22EE 36 00         [10]   83 	ld	(hl),#0x00
                             84 ;src/entities/enemies.c:20: enemies[k].x=0;
   22F0 21 10 00      [10]   85 	ld	hl,#0x0010
   22F3 09            [11]   86 	add	hl,bc
   22F4 AF            [ 4]   87 	xor	a, a
   22F5 77            [ 7]   88 	ld	(hl), a
   22F6 23            [ 6]   89 	inc	hl
   22F7 77            [ 7]   90 	ld	(hl), a
                             91 ;src/entities/enemies.c:21: enemies[k].y=0;
   22F8 21 12 00      [10]   92 	ld	hl,#0x0012
   22FB 09            [11]   93 	add	hl,bc
   22FC AF            [ 4]   94 	xor	a, a
   22FD 77            [ 7]   95 	ld	(hl), a
   22FE 23            [ 6]   96 	inc	hl
   22FF 77            [ 7]   97 	ld	(hl), a
                             98 ;src/entities/enemies.c:22: enemies[k].w=0;
   2300 21 14 00      [10]   99 	ld	hl,#0x0014
   2303 09            [11]  100 	add	hl,bc
   2304 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/enemies.c:23: enemies[k].h=0;
   2306 21 15 00      [10]  103 	ld	hl,#0x0015
   2309 09            [11]  104 	add	hl,bc
   230A 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/enemies.c:24: enemies[k].dir=0;
   230C 21 16 00      [10]  107 	ld	hl,#0x0016
   230F 09            [11]  108 	add	hl,bc
   2310 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/enemies.c:25: enemies[k].frame=0;
   2312 21 19 00      [10]  111 	ld	hl,#0x0019
   2315 09            [11]  112 	add	hl,bc
   2316 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/enemies.c:26: enemies[k].lastmoved=0;
   2318 21 20 00      [10]  115 	ld	hl,#0x0020
   231B 09            [11]  116 	add	hl,bc
   231C AF            [ 4]  117 	xor	a, a
   231D 77            [ 7]  118 	ld	(hl), a
   231E 23            [ 6]  119 	inc	hl
   231F 77            [ 7]  120 	ld	(hl), a
   2320 23            [ 6]  121 	inc	hl
   2321 AF            [ 4]  122 	xor	a, a
   2322 77            [ 7]  123 	ld	(hl), a
   2323 23            [ 6]  124 	inc	hl
   2324 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/enemies.c:18: for (k=0;k<MAX_ENEMIES;k++){
   2325 21 24 00      [10]  127 	ld	hl,#0x0024
   2328 19            [11]  128 	add	hl,de
   2329 EB            [ 4]  129 	ex	de,hl
   232A DD 34 FF      [23]  130 	inc	-1 (ix)
   232D DD 7E FF      [19]  131 	ld	a,-1 (ix)
   2330 D6 1E         [ 7]  132 	sub	a, #0x1E
   2332 38 B0         [12]  133 	jr	C,00102$
                            134 ;src/entities/enemies.c:28: active_enemies=0;
   2334 21 E7 52      [10]  135 	ld	hl,#_active_enemies + 0
   2337 36 00         [10]  136 	ld	(hl), #0x00
   2339 33            [ 6]  137 	inc	sp
   233A DD E1         [14]  138 	pop	ix
   233C C9            [10]  139 	ret
                            140 ;src/entities/enemies.c:36: void create_enemy(i16 x, i16 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_enemy
                            143 ; ---------------------------------
   233D                     144 _create_enemy::
   233D DD E5         [15]  145 	push	ix
   233F DD 21 00 00   [14]  146 	ld	ix,#0
   2343 DD 39         [15]  147 	add	ix,sp
   2345 21 E0 FF      [10]  148 	ld	hl,#-32
   2348 39            [11]  149 	add	hl,sp
   2349 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/enemies.c:38: if (active_enemies < MAX_ENEMIES){
   234A 3A E7 52      [13]  152 	ld	a,(#_active_enemies + 0)
   234D D6 1E         [ 7]  153 	sub	a, #0x1E
   234F D2 77 26      [10]  154 	jp	NC,00110$
                            155 ;src/entities/enemies.c:40: while (enemies[k].active){
   2352 11 00 00      [10]  156 	ld	de,#0x0000
   2355                     157 00101$:
   2355 21 AF 4E      [10]  158 	ld	hl,#_enemies
   2358 19            [11]  159 	add	hl,de
   2359 DD 75 FE      [19]  160 	ld	-2 (ix),l
   235C DD 74 FF      [19]  161 	ld	-1 (ix),h
   235F DD 7E FE      [19]  162 	ld	a,-2 (ix)
   2362 C6 17         [ 7]  163 	add	a, #0x17
   2364 6F            [ 4]  164 	ld	l,a
   2365 DD 7E FF      [19]  165 	ld	a,-1 (ix)
   2368 CE 00         [ 7]  166 	adc	a, #0x00
   236A 67            [ 4]  167 	ld	h,a
   236B 7E            [ 7]  168 	ld	a,(hl)
   236C B7            [ 4]  169 	or	a, a
   236D 28 07         [12]  170 	jr	Z,00103$
                            171 ;src/entities/enemies.c:41: k++;
   236F 21 24 00      [10]  172 	ld	hl,#0x0024
   2372 19            [11]  173 	add	hl,de
   2373 EB            [ 4]  174 	ex	de,hl
   2374 18 DF         [12]  175 	jr	00101$
   2376                     176 00103$:
                            177 ;src/entities/enemies.c:43: enemies[k].active=1;
   2376 36 01         [10]  178 	ld	(hl),#0x01
                            179 ;src/entities/enemies.c:44: enemies[k].frame=0;
   2378 DD 7E FE      [19]  180 	ld	a,-2 (ix)
   237B C6 19         [ 7]  181 	add	a, #0x19
   237D 6F            [ 4]  182 	ld	l,a
   237E DD 7E FF      [19]  183 	ld	a,-1 (ix)
   2381 CE 00         [ 7]  184 	adc	a, #0x00
   2383 67            [ 4]  185 	ld	h,a
   2384 36 00         [10]  186 	ld	(hl),#0x00
                            187 ;src/entities/enemies.c:48: enemies[k].x=x;
   2386 DD 7E FE      [19]  188 	ld	a,-2 (ix)
   2389 C6 10         [ 7]  189 	add	a, #0x10
   238B DD 77 FC      [19]  190 	ld	-4 (ix),a
   238E DD 7E FF      [19]  191 	ld	a,-1 (ix)
   2391 CE 00         [ 7]  192 	adc	a, #0x00
   2393 DD 77 FD      [19]  193 	ld	-3 (ix),a
                            194 ;src/entities/enemies.c:49: enemies[k].y=y;
   2396 DD 7E FE      [19]  195 	ld	a,-2 (ix)
   2399 C6 12         [ 7]  196 	add	a, #0x12
   239B DD 77 FA      [19]  197 	ld	-6 (ix),a
   239E DD 7E FF      [19]  198 	ld	a,-1 (ix)
   23A1 CE 00         [ 7]  199 	adc	a, #0x00
   23A3 DD 77 FB      [19]  200 	ld	-5 (ix),a
                            201 ;src/entities/enemies.c:50: enemies[k].w=6;
   23A6 DD 7E FE      [19]  202 	ld	a,-2 (ix)
   23A9 C6 14         [ 7]  203 	add	a, #0x14
   23AB DD 77 F8      [19]  204 	ld	-8 (ix),a
   23AE DD 7E FF      [19]  205 	ld	a,-1 (ix)
   23B1 CE 00         [ 7]  206 	adc	a, #0x00
   23B3 DD 77 F9      [19]  207 	ld	-7 (ix),a
                            208 ;src/entities/enemies.c:51: enemies[k].h=12;
   23B6 DD 7E FE      [19]  209 	ld	a,-2 (ix)
   23B9 C6 15         [ 7]  210 	add	a, #0x15
   23BB DD 77 F6      [19]  211 	ld	-10 (ix),a
   23BE DD 7E FF      [19]  212 	ld	a,-1 (ix)
   23C1 CE 00         [ 7]  213 	adc	a, #0x00
   23C3 DD 77 F7      [19]  214 	ld	-9 (ix),a
                            215 ;src/entities/enemies.c:52: enemies[k].num_frames=0;
   23C6 DD 7E FE      [19]  216 	ld	a,-2 (ix)
   23C9 C6 18         [ 7]  217 	add	a, #0x18
   23CB DD 77 F4      [19]  218 	ld	-12 (ix),a
   23CE DD 7E FF      [19]  219 	ld	a,-1 (ix)
   23D1 CE 00         [ 7]  220 	adc	a, #0x00
   23D3 DD 77 F5      [19]  221 	ld	-11 (ix),a
                            222 ;src/entities/enemies.c:54: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   23D6 DD 7E FE      [19]  223 	ld	a,-2 (ix)
   23D9 C6 02         [ 7]  224 	add	a, #0x02
   23DB DD 77 F2      [19]  225 	ld	-14 (ix),a
   23DE DD 7E FF      [19]  226 	ld	a,-1 (ix)
   23E1 CE 00         [ 7]  227 	adc	a, #0x00
   23E3 DD 77 F3      [19]  228 	ld	-13 (ix),a
                            229 ;src/entities/enemies.c:55: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   23E6 DD 7E FE      [19]  230 	ld	a,-2 (ix)
   23E9 C6 04         [ 7]  231 	add	a, #0x04
   23EB DD 77 F0      [19]  232 	ld	-16 (ix),a
   23EE DD 7E FF      [19]  233 	ld	a,-1 (ix)
   23F1 CE 00         [ 7]  234 	adc	a, #0x00
   23F3 DD 77 F1      [19]  235 	ld	-15 (ix),a
                            236 ;src/entities/enemies.c:56: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   23F6 DD 7E FE      [19]  237 	ld	a,-2 (ix)
   23F9 C6 06         [ 7]  238 	add	a, #0x06
   23FB DD 77 EE      [19]  239 	ld	-18 (ix),a
   23FE DD 7E FF      [19]  240 	ld	a,-1 (ix)
   2401 CE 00         [ 7]  241 	adc	a, #0x00
   2403 DD 77 EF      [19]  242 	ld	-17 (ix),a
                            243 ;src/entities/enemies.c:57: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2406 DD 7E FE      [19]  244 	ld	a,-2 (ix)
   2409 C6 08         [ 7]  245 	add	a, #0x08
   240B DD 77 EC      [19]  246 	ld	-20 (ix),a
   240E DD 7E FF      [19]  247 	ld	a,-1 (ix)
   2411 CE 00         [ 7]  248 	adc	a, #0x00
   2413 DD 77 ED      [19]  249 	ld	-19 (ix),a
                            250 ;src/entities/enemies.c:58: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2416 DD 7E FE      [19]  251 	ld	a,-2 (ix)
   2419 C6 0A         [ 7]  252 	add	a, #0x0A
   241B DD 77 EA      [19]  253 	ld	-22 (ix),a
   241E DD 7E FF      [19]  254 	ld	a,-1 (ix)
   2421 CE 00         [ 7]  255 	adc	a, #0x00
   2423 DD 77 EB      [19]  256 	ld	-21 (ix),a
                            257 ;src/entities/enemies.c:59: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2426 DD 7E FE      [19]  258 	ld	a,-2 (ix)
   2429 C6 0C         [ 7]  259 	add	a, #0x0C
   242B DD 77 E8      [19]  260 	ld	-24 (ix),a
   242E DD 7E FF      [19]  261 	ld	a,-1 (ix)
   2431 CE 00         [ 7]  262 	adc	a, #0x00
   2433 DD 77 E9      [19]  263 	ld	-23 (ix),a
                            264 ;src/entities/enemies.c:60: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2436 DD 7E FE      [19]  265 	ld	a,-2 (ix)
   2439 C6 0E         [ 7]  266 	add	a, #0x0E
   243B DD 77 E6      [19]  267 	ld	-26 (ix),a
   243E DD 7E FF      [19]  268 	ld	a,-1 (ix)
   2441 CE 00         [ 7]  269 	adc	a, #0x00
   2443 DD 77 E7      [19]  270 	ld	-25 (ix),a
                            271 ;src/entities/enemies.c:61: enemies[k].movement=0;
   2446 DD 7E FE      [19]  272 	ld	a,-2 (ix)
   2449 C6 1D         [ 7]  273 	add	a, #0x1D
   244B DD 77 E4      [19]  274 	ld	-28 (ix),a
   244E DD 7E FF      [19]  275 	ld	a,-1 (ix)
   2451 CE 00         [ 7]  276 	adc	a, #0x00
   2453 DD 77 E5      [19]  277 	ld	-27 (ix),a
                            278 ;src/entities/enemies.c:62: enemies[k].stage=0;
   2456 DD 7E FE      [19]  279 	ld	a,-2 (ix)
   2459 C6 1E         [ 7]  280 	add	a, #0x1E
   245B DD 77 E2      [19]  281 	ld	-30 (ix),a
   245E DD 7E FF      [19]  282 	ld	a,-1 (ix)
   2461 CE 00         [ 7]  283 	adc	a, #0x00
   2463 DD 77 E3      [19]  284 	ld	-29 (ix),a
                            285 ;src/entities/enemies.c:63: enemies[k].stage_step=0;
   2466 DD 7E FE      [19]  286 	ld	a,-2 (ix)
   2469 C6 1F         [ 7]  287 	add	a, #0x1F
   246B DD 77 E0      [19]  288 	ld	-32 (ix),a
   246E DD 7E FF      [19]  289 	ld	a,-1 (ix)
   2471 CE 00         [ 7]  290 	adc	a, #0x00
   2473 DD 77 E1      [19]  291 	ld	-31 (ix),a
                            292 ;src/entities/enemies.c:45: switch (type){
   2476 DD 7E 08      [19]  293 	ld	a,8 (ix)
   2479 3D            [ 4]  294 	dec	a
   247A 28 0B         [12]  295 	jr	Z,00104$
   247C DD 7E 08      [19]  296 	ld	a,8 (ix)
   247F D6 02         [ 7]  297 	sub	a, #0x02
   2481 CA 2C 25      [10]  298 	jp	Z,00105$
   2484 C3 D1 25      [10]  299 	jp	00106$
                            300 ;src/entities/enemies.c:47: case 1:
   2487                     301 00104$:
                            302 ;src/entities/enemies.c:48: enemies[k].x=x;
   2487 DD 6E FC      [19]  303 	ld	l,-4 (ix)
   248A DD 66 FD      [19]  304 	ld	h,-3 (ix)
   248D DD 7E 04      [19]  305 	ld	a,4 (ix)
   2490 77            [ 7]  306 	ld	(hl),a
   2491 23            [ 6]  307 	inc	hl
   2492 DD 7E 05      [19]  308 	ld	a,5 (ix)
   2495 77            [ 7]  309 	ld	(hl),a
                            310 ;src/entities/enemies.c:49: enemies[k].y=y;
   2496 DD 6E FA      [19]  311 	ld	l,-6 (ix)
   2499 DD 66 FB      [19]  312 	ld	h,-5 (ix)
   249C DD 7E 06      [19]  313 	ld	a,6 (ix)
   249F 77            [ 7]  314 	ld	(hl),a
   24A0 23            [ 6]  315 	inc	hl
   24A1 DD 7E 07      [19]  316 	ld	a,7 (ix)
   24A4 77            [ 7]  317 	ld	(hl),a
                            318 ;src/entities/enemies.c:50: enemies[k].w=6;
   24A5 DD 6E F8      [19]  319 	ld	l,-8 (ix)
   24A8 DD 66 F9      [19]  320 	ld	h,-7 (ix)
   24AB 36 06         [10]  321 	ld	(hl),#0x06
                            322 ;src/entities/enemies.c:51: enemies[k].h=12;
   24AD DD 6E F6      [19]  323 	ld	l,-10 (ix)
   24B0 DD 66 F7      [19]  324 	ld	h,-9 (ix)
   24B3 36 0C         [10]  325 	ld	(hl),#0x0C
                            326 ;src/entities/enemies.c:52: enemies[k].num_frames=0;
   24B5 DD 6E F4      [19]  327 	ld	l,-12 (ix)
   24B8 DD 66 F5      [19]  328 	ld	h,-11 (ix)
   24BB 36 00         [10]  329 	ld	(hl),#0x00
                            330 ;src/entities/enemies.c:53: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   24BD DD 6E FE      [19]  331 	ld	l,-2 (ix)
   24C0 DD 66 FF      [19]  332 	ld	h,-1 (ix)
   24C3 36 FD         [10]  333 	ld	(hl),#<(_G_baddie02_00)
   24C5 23            [ 6]  334 	inc	hl
   24C6 36 39         [10]  335 	ld	(hl),#>(_G_baddie02_00)
                            336 ;src/entities/enemies.c:54: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   24C8 DD 6E F2      [19]  337 	ld	l,-14 (ix)
   24CB DD 66 F3      [19]  338 	ld	h,-13 (ix)
   24CE 36 45         [10]  339 	ld	(hl),#<(_G_baddie02_01)
   24D0 23            [ 6]  340 	inc	hl
   24D1 36 3A         [10]  341 	ld	(hl),#>(_G_baddie02_01)
                            342 ;src/entities/enemies.c:55: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   24D3 DD 6E F0      [19]  343 	ld	l,-16 (ix)
   24D6 DD 66 F1      [19]  344 	ld	h,-15 (ix)
   24D9 36 8D         [10]  345 	ld	(hl),#<(_G_baddie02_02)
   24DB 23            [ 6]  346 	inc	hl
   24DC 36 3A         [10]  347 	ld	(hl),#>(_G_baddie02_02)
                            348 ;src/entities/enemies.c:56: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24DE DD 6E EE      [19]  349 	ld	l,-18 (ix)
   24E1 DD 66 EF      [19]  350 	ld	h,-17 (ix)
   24E4 36 D5         [10]  351 	ld	(hl),#<(_G_baddie02_03)
   24E6 23            [ 6]  352 	inc	hl
   24E7 36 3A         [10]  353 	ld	(hl),#>(_G_baddie02_03)
                            354 ;src/entities/enemies.c:57: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   24E9 DD 6E EC      [19]  355 	ld	l,-20 (ix)
   24EC DD 66 ED      [19]  356 	ld	h,-19 (ix)
   24EF 36 1D         [10]  357 	ld	(hl),#<(_G_baddie02_04)
   24F1 23            [ 6]  358 	inc	hl
   24F2 36 3B         [10]  359 	ld	(hl),#>(_G_baddie02_04)
                            360 ;src/entities/enemies.c:58: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   24F4 DD 6E EA      [19]  361 	ld	l,-22 (ix)
   24F7 DD 66 EB      [19]  362 	ld	h,-21 (ix)
   24FA 36 65         [10]  363 	ld	(hl),#<(_G_baddie02_05)
   24FC 23            [ 6]  364 	inc	hl
   24FD 36 3B         [10]  365 	ld	(hl),#>(_G_baddie02_05)
                            366 ;src/entities/enemies.c:59: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   24FF DD 6E E8      [19]  367 	ld	l,-24 (ix)
   2502 DD 66 E9      [19]  368 	ld	h,-23 (ix)
   2505 36 AD         [10]  369 	ld	(hl),#<(_G_baddie02_06)
   2507 23            [ 6]  370 	inc	hl
   2508 36 3B         [10]  371 	ld	(hl),#>(_G_baddie02_06)
                            372 ;src/entities/enemies.c:60: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   250A DD 6E E6      [19]  373 	ld	l,-26 (ix)
   250D DD 66 E7      [19]  374 	ld	h,-25 (ix)
   2510 36 F5         [10]  375 	ld	(hl),#<(_G_baddie02_07)
   2512 23            [ 6]  376 	inc	hl
   2513 36 3B         [10]  377 	ld	(hl),#>(_G_baddie02_07)
                            378 ;src/entities/enemies.c:61: enemies[k].movement=0;
   2515 DD 6E E4      [19]  379 	ld	l,-28 (ix)
   2518 DD 66 E5      [19]  380 	ld	h,-27 (ix)
   251B 36 00         [10]  381 	ld	(hl),#0x00
                            382 ;src/entities/enemies.c:62: enemies[k].stage=0;
   251D DD 6E E2      [19]  383 	ld	l,-30 (ix)
   2520 DD 66 E3      [19]  384 	ld	h,-29 (ix)
   2523 36 00         [10]  385 	ld	(hl),#0x00
                            386 ;src/entities/enemies.c:63: enemies[k].stage_step=0;
   2525 E1            [10]  387 	pop	hl
   2526 E5            [11]  388 	push	hl
   2527 36 00         [10]  389 	ld	(hl),#0x00
                            390 ;src/entities/enemies.c:64: break;
   2529 C3 73 26      [10]  391 	jp	00107$
                            392 ;src/entities/enemies.c:65: case 2:
   252C                     393 00105$:
                            394 ;src/entities/enemies.c:66: enemies[k].x=x;
   252C DD 6E FC      [19]  395 	ld	l,-4 (ix)
   252F DD 66 FD      [19]  396 	ld	h,-3 (ix)
   2532 DD 7E 04      [19]  397 	ld	a,4 (ix)
   2535 77            [ 7]  398 	ld	(hl),a
   2536 23            [ 6]  399 	inc	hl
   2537 DD 7E 05      [19]  400 	ld	a,5 (ix)
   253A 77            [ 7]  401 	ld	(hl),a
                            402 ;src/entities/enemies.c:67: enemies[k].y=y;
   253B DD 6E FA      [19]  403 	ld	l,-6 (ix)
   253E DD 66 FB      [19]  404 	ld	h,-5 (ix)
   2541 DD 7E 06      [19]  405 	ld	a,6 (ix)
   2544 77            [ 7]  406 	ld	(hl),a
   2545 23            [ 6]  407 	inc	hl
   2546 DD 7E 07      [19]  408 	ld	a,7 (ix)
   2549 77            [ 7]  409 	ld	(hl),a
                            410 ;src/entities/enemies.c:68: enemies[k].w=4;
   254A DD 6E F8      [19]  411 	ld	l,-8 (ix)
   254D DD 66 F9      [19]  412 	ld	h,-7 (ix)
   2550 36 04         [10]  413 	ld	(hl),#0x04
                            414 ;src/entities/enemies.c:69: enemies[k].h=8;
   2552 DD 6E F6      [19]  415 	ld	l,-10 (ix)
   2555 DD 66 F7      [19]  416 	ld	h,-9 (ix)
   2558 36 08         [10]  417 	ld	(hl),#0x08
                            418 ;src/entities/enemies.c:70: enemies[k].num_frames=0;
   255A DD 6E F4      [19]  419 	ld	l,-12 (ix)
   255D DD 66 F5      [19]  420 	ld	h,-11 (ix)
   2560 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/entities/enemies.c:71: enemies[k].sprite[0]= (u8*) G_baddie03_00;
   2562 DD 6E FE      [19]  423 	ld	l,-2 (ix)
   2565 DD 66 FF      [19]  424 	ld	h,-1 (ix)
   2568 36 F5         [10]  425 	ld	(hl),#<(_G_baddie03_00)
   256A 23            [ 6]  426 	inc	hl
   256B 36 3E         [10]  427 	ld	(hl),#>(_G_baddie03_00)
                            428 ;src/entities/enemies.c:72: enemies[k].sprite[1]= (u8*) G_baddie03_01;
   256D DD 6E F2      [19]  429 	ld	l,-14 (ix)
   2570 DD 66 F3      [19]  430 	ld	h,-13 (ix)
   2573 36 15         [10]  431 	ld	(hl),#<(_G_baddie03_01)
   2575 23            [ 6]  432 	inc	hl
   2576 36 3F         [10]  433 	ld	(hl),#>(_G_baddie03_01)
                            434 ;src/entities/enemies.c:73: enemies[k].sprite[2]= (u8*) G_baddie03_02;
   2578 DD 6E F0      [19]  435 	ld	l,-16 (ix)
   257B DD 66 F1      [19]  436 	ld	h,-15 (ix)
   257E 36 35         [10]  437 	ld	(hl),#<(_G_baddie03_02)
   2580 23            [ 6]  438 	inc	hl
   2581 36 3F         [10]  439 	ld	(hl),#>(_G_baddie03_02)
                            440 ;src/entities/enemies.c:74: enemies[k].sprite[3]= (u8*) G_baddie03_03;
   2583 DD 6E EE      [19]  441 	ld	l,-18 (ix)
   2586 DD 66 EF      [19]  442 	ld	h,-17 (ix)
   2589 36 55         [10]  443 	ld	(hl),#<(_G_baddie03_03)
   258B 23            [ 6]  444 	inc	hl
   258C 36 3F         [10]  445 	ld	(hl),#>(_G_baddie03_03)
                            446 ;src/entities/enemies.c:75: enemies[k].sprite[4]= (u8*) G_baddie03_04;
   258E DD 6E EC      [19]  447 	ld	l,-20 (ix)
   2591 DD 66 ED      [19]  448 	ld	h,-19 (ix)
   2594 36 75         [10]  449 	ld	(hl),#<(_G_baddie03_04)
   2596 23            [ 6]  450 	inc	hl
   2597 36 3F         [10]  451 	ld	(hl),#>(_G_baddie03_04)
                            452 ;src/entities/enemies.c:76: enemies[k].sprite[5]= (u8*) G_baddie03_05;
   2599 DD 6E EA      [19]  453 	ld	l,-22 (ix)
   259C DD 66 EB      [19]  454 	ld	h,-21 (ix)
   259F 36 95         [10]  455 	ld	(hl),#<(_G_baddie03_05)
   25A1 23            [ 6]  456 	inc	hl
   25A2 36 3F         [10]  457 	ld	(hl),#>(_G_baddie03_05)
                            458 ;src/entities/enemies.c:77: enemies[k].sprite[6]= (u8*) G_baddie03_06;
   25A4 DD 6E E8      [19]  459 	ld	l,-24 (ix)
   25A7 DD 66 E9      [19]  460 	ld	h,-23 (ix)
   25AA 36 B5         [10]  461 	ld	(hl),#<(_G_baddie03_06)
   25AC 23            [ 6]  462 	inc	hl
   25AD 36 3F         [10]  463 	ld	(hl),#>(_G_baddie03_06)
                            464 ;src/entities/enemies.c:78: enemies[k].sprite[7]= (u8*) G_baddie03_07;
   25AF DD 6E E6      [19]  465 	ld	l,-26 (ix)
   25B2 DD 66 E7      [19]  466 	ld	h,-25 (ix)
   25B5 36 D5         [10]  467 	ld	(hl),#<(_G_baddie03_07)
   25B7 23            [ 6]  468 	inc	hl
   25B8 36 3F         [10]  469 	ld	(hl),#>(_G_baddie03_07)
                            470 ;src/entities/enemies.c:79: enemies[k].movement=0;
   25BA DD 6E E4      [19]  471 	ld	l,-28 (ix)
   25BD DD 66 E5      [19]  472 	ld	h,-27 (ix)
   25C0 36 00         [10]  473 	ld	(hl),#0x00
                            474 ;src/entities/enemies.c:80: enemies[k].stage=0;
   25C2 DD 6E E2      [19]  475 	ld	l,-30 (ix)
   25C5 DD 66 E3      [19]  476 	ld	h,-29 (ix)
   25C8 36 00         [10]  477 	ld	(hl),#0x00
                            478 ;src/entities/enemies.c:81: enemies[k].stage_step=0;
   25CA E1            [10]  479 	pop	hl
   25CB E5            [11]  480 	push	hl
   25CC 36 00         [10]  481 	ld	(hl),#0x00
                            482 ;src/entities/enemies.c:82: break;
   25CE C3 73 26      [10]  483 	jp	00107$
                            484 ;src/entities/enemies.c:83: default:
   25D1                     485 00106$:
                            486 ;src/entities/enemies.c:84: enemies[k].x=x;
   25D1 DD 6E FC      [19]  487 	ld	l,-4 (ix)
   25D4 DD 66 FD      [19]  488 	ld	h,-3 (ix)
   25D7 DD 7E 04      [19]  489 	ld	a,4 (ix)
   25DA 77            [ 7]  490 	ld	(hl),a
   25DB 23            [ 6]  491 	inc	hl
   25DC DD 7E 05      [19]  492 	ld	a,5 (ix)
   25DF 77            [ 7]  493 	ld	(hl),a
                            494 ;src/entities/enemies.c:85: enemies[k].y=y;
   25E0 DD 6E FA      [19]  495 	ld	l,-6 (ix)
   25E3 DD 66 FB      [19]  496 	ld	h,-5 (ix)
   25E6 DD 7E 06      [19]  497 	ld	a,6 (ix)
   25E9 77            [ 7]  498 	ld	(hl),a
   25EA 23            [ 6]  499 	inc	hl
   25EB DD 7E 07      [19]  500 	ld	a,7 (ix)
   25EE 77            [ 7]  501 	ld	(hl),a
                            502 ;src/entities/enemies.c:86: enemies[k].w=5;
   25EF DD 6E F8      [19]  503 	ld	l,-8 (ix)
   25F2 DD 66 F9      [19]  504 	ld	h,-7 (ix)
   25F5 36 05         [10]  505 	ld	(hl),#0x05
                            506 ;src/entities/enemies.c:87: enemies[k].h=16;
   25F7 DD 6E F6      [19]  507 	ld	l,-10 (ix)
   25FA DD 66 F7      [19]  508 	ld	h,-9 (ix)
   25FD 36 10         [10]  509 	ld	(hl),#0x10
                            510 ;src/entities/enemies.c:88: enemies[k].num_frames=0;
   25FF DD 6E F4      [19]  511 	ld	l,-12 (ix)
   2602 DD 66 F5      [19]  512 	ld	h,-11 (ix)
   2605 36 00         [10]  513 	ld	(hl),#0x00
                            514 ;src/entities/enemies.c:89: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2607 DD 6E FE      [19]  515 	ld	l,-2 (ix)
   260A DD 66 FF      [19]  516 	ld	h,-1 (ix)
   260D 36 7D         [10]  517 	ld	(hl),#<(_G_baddie01_00)
   260F 23            [ 6]  518 	inc	hl
   2610 36 37         [10]  519 	ld	(hl),#>(_G_baddie01_00)
                            520 ;src/entities/enemies.c:90: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   2612 DD 6E F2      [19]  521 	ld	l,-14 (ix)
   2615 DD 66 F3      [19]  522 	ld	h,-13 (ix)
   2618 36 CD         [10]  523 	ld	(hl),#<(_G_baddie01_01)
   261A 23            [ 6]  524 	inc	hl
   261B 36 37         [10]  525 	ld	(hl),#>(_G_baddie01_01)
                            526 ;src/entities/enemies.c:91: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   261D DD 6E F0      [19]  527 	ld	l,-16 (ix)
   2620 DD 66 F1      [19]  528 	ld	h,-15 (ix)
   2623 36 1D         [10]  529 	ld	(hl),#<(_G_baddie01_02)
   2625 23            [ 6]  530 	inc	hl
   2626 36 38         [10]  531 	ld	(hl),#>(_G_baddie01_02)
                            532 ;src/entities/enemies.c:92: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2628 DD 6E EE      [19]  533 	ld	l,-18 (ix)
   262B DD 66 EF      [19]  534 	ld	h,-17 (ix)
   262E 36 6D         [10]  535 	ld	(hl),#<(_G_baddie01_03)
   2630 23            [ 6]  536 	inc	hl
   2631 36 38         [10]  537 	ld	(hl),#>(_G_baddie01_03)
                            538 ;src/entities/enemies.c:93: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   2633 DD 6E EC      [19]  539 	ld	l,-20 (ix)
   2636 DD 66 ED      [19]  540 	ld	h,-19 (ix)
   2639 36 BD         [10]  541 	ld	(hl),#<(_G_baddie01_04)
   263B 23            [ 6]  542 	inc	hl
   263C 36 38         [10]  543 	ld	(hl),#>(_G_baddie01_04)
                            544 ;src/entities/enemies.c:94: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   263E DD 6E EA      [19]  545 	ld	l,-22 (ix)
   2641 DD 66 EB      [19]  546 	ld	h,-21 (ix)
   2644 36 0D         [10]  547 	ld	(hl),#<(_G_baddie01_05)
   2646 23            [ 6]  548 	inc	hl
   2647 36 39         [10]  549 	ld	(hl),#>(_G_baddie01_05)
                            550 ;src/entities/enemies.c:95: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2649 DD 6E E8      [19]  551 	ld	l,-24 (ix)
   264C DD 66 E9      [19]  552 	ld	h,-23 (ix)
   264F 36 5D         [10]  553 	ld	(hl),#<(_G_baddie01_06)
   2651 23            [ 6]  554 	inc	hl
   2652 36 39         [10]  555 	ld	(hl),#>(_G_baddie01_06)
                            556 ;src/entities/enemies.c:96: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2654 DD 6E E6      [19]  557 	ld	l,-26 (ix)
   2657 DD 66 E7      [19]  558 	ld	h,-25 (ix)
   265A 36 AD         [10]  559 	ld	(hl),#<(_G_baddie01_07)
   265C 23            [ 6]  560 	inc	hl
   265D 36 39         [10]  561 	ld	(hl),#>(_G_baddie01_07)
                            562 ;src/entities/enemies.c:97: enemies[k].movement=1;
   265F DD 6E E4      [19]  563 	ld	l,-28 (ix)
   2662 DD 66 E5      [19]  564 	ld	h,-27 (ix)
   2665 36 01         [10]  565 	ld	(hl),#0x01
                            566 ;src/entities/enemies.c:98: enemies[k].stage=0;
   2667 DD 6E E2      [19]  567 	ld	l,-30 (ix)
   266A DD 66 E3      [19]  568 	ld	h,-29 (ix)
   266D 36 00         [10]  569 	ld	(hl),#0x00
                            570 ;src/entities/enemies.c:99: enemies[k].stage_step=0;
   266F E1            [10]  571 	pop	hl
   2670 E5            [11]  572 	push	hl
   2671 36 00         [10]  573 	ld	(hl),#0x00
                            574 ;src/entities/enemies.c:101: }
   2673                     575 00107$:
                            576 ;src/entities/enemies.c:102: active_enemies++;
   2673 21 E7 52      [10]  577 	ld	hl, #_active_enemies+0
   2676 34            [11]  578 	inc	(hl)
   2677                     579 00110$:
   2677 DD F9         [10]  580 	ld	sp, ix
   2679 DD E1         [14]  581 	pop	ix
   267B C9            [10]  582 	ret
                            583 ;src/entities/enemies.c:108: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            584 ;	---------------------------------
                            585 ; Function create_enemy_group
                            586 ; ---------------------------------
   267C                     587 _create_enemy_group::
   267C DD E5         [15]  588 	push	ix
   267E DD 21 00 00   [14]  589 	ld	ix,#0
   2682 DD 39         [15]  590 	add	ix,sp
                            591 ;src/entities/enemies.c:110: if (active_groups < MAX_ENEMY_GROUPS){
   2684 3A 08 53      [13]  592 	ld	a,(#_active_groups + 0)
   2687 D6 04         [ 7]  593 	sub	a, #0x04
   2689 30 4E         [12]  594 	jr	NC,00106$
                            595 ;src/entities/enemies.c:112: while (groups[k].active){
   268B 16 00         [ 7]  596 	ld	d,#0x00
   268D                     597 00101$:
   268D 6A            [ 4]  598 	ld	l,d
   268E 26 00         [ 7]  599 	ld	h,#0x00
   2690 29            [11]  600 	add	hl, hl
   2691 29            [11]  601 	add	hl, hl
   2692 29            [11]  602 	add	hl, hl
   2693 3E E8         [ 7]  603 	ld	a,#<(_groups)
   2695 85            [ 4]  604 	add	a, l
   2696 4F            [ 4]  605 	ld	c,a
   2697 3E 52         [ 7]  606 	ld	a,#>(_groups)
   2699 8C            [ 4]  607 	adc	a, h
   269A 47            [ 4]  608 	ld	b,a
   269B 0A            [ 7]  609 	ld	a,(bc)
   269C B7            [ 4]  610 	or	a, a
   269D 28 03         [12]  611 	jr	Z,00103$
                            612 ;src/entities/enemies.c:113: k++;
   269F 14            [ 4]  613 	inc	d
   26A0 18 EB         [12]  614 	jr	00101$
   26A2                     615 00103$:
                            616 ;src/entities/enemies.c:115: groups[k].active=1;
   26A2 3E 01         [ 7]  617 	ld	a,#0x01
   26A4 02            [ 7]  618 	ld	(bc),a
                            619 ;src/entities/enemies.c:116: groups[k].x=x;
   26A5 69            [ 4]  620 	ld	l, c
   26A6 60            [ 4]  621 	ld	h, b
   26A7 23            [ 6]  622 	inc	hl
   26A8 DD 7E 04      [19]  623 	ld	a,4 (ix)
   26AB 77            [ 7]  624 	ld	(hl),a
   26AC 23            [ 6]  625 	inc	hl
   26AD DD 7E 05      [19]  626 	ld	a,5 (ix)
   26B0 77            [ 7]  627 	ld	(hl),a
                            628 ;src/entities/enemies.c:117: groups[k].y=y;
   26B1 69            [ 4]  629 	ld	l, c
   26B2 60            [ 4]  630 	ld	h, b
   26B3 23            [ 6]  631 	inc	hl
   26B4 23            [ 6]  632 	inc	hl
   26B5 23            [ 6]  633 	inc	hl
   26B6 DD 7E 06      [19]  634 	ld	a,6 (ix)
   26B9 77            [ 7]  635 	ld	(hl),a
   26BA 23            [ 6]  636 	inc	hl
   26BB DD 7E 07      [19]  637 	ld	a,7 (ix)
   26BE 77            [ 7]  638 	ld	(hl),a
                            639 ;src/entities/enemies.c:118: groups[k].enemy_type=type;
   26BF 21 05 00      [10]  640 	ld	hl,#0x0005
   26C2 09            [11]  641 	add	hl,bc
   26C3 DD 7E 08      [19]  642 	ld	a,8 (ix)
   26C6 77            [ 7]  643 	ld	(hl),a
                            644 ;src/entities/enemies.c:119: groups[k].num_enemies=num_enemies;
   26C7 21 06 00      [10]  645 	ld	hl,#0x0006
   26CA 09            [11]  646 	add	hl,bc
   26CB DD 7E 09      [19]  647 	ld	a,9 (ix)
   26CE 77            [ 7]  648 	ld	(hl),a
                            649 ;src/entities/enemies.c:120: groups[k].sleep=ENEMY_GAP;
   26CF 21 07 00      [10]  650 	ld	hl,#0x0007
   26D2 09            [11]  651 	add	hl,bc
   26D3 36 03         [10]  652 	ld	(hl),#0x03
                            653 ;src/entities/enemies.c:121: active_groups++;
   26D5 21 08 53      [10]  654 	ld	hl, #_active_groups+0
   26D8 34            [11]  655 	inc	(hl)
   26D9                     656 00106$:
   26D9 DD E1         [14]  657 	pop	ix
   26DB C9            [10]  658 	ret
                            659 ;src/entities/enemies.c:129: void update_enemies(){
                            660 ;	---------------------------------
                            661 ; Function update_enemies
                            662 ; ---------------------------------
   26DC                     663 _update_enemies::
   26DC DD E5         [15]  664 	push	ix
   26DE DD 21 00 00   [14]  665 	ld	ix,#0
   26E2 DD 39         [15]  666 	add	ix,sp
   26E4 21 EB FF      [10]  667 	ld	hl,#-21
   26E7 39            [11]  668 	add	hl,sp
   26E8 F9            [ 6]  669 	ld	sp,hl
                            670 ;src/entities/enemies.c:133: if (active_enemies>0){
   26E9 3A E7 52      [13]  671 	ld	a,(#_active_enemies + 0)
   26EC B7            [ 4]  672 	or	a, a
   26ED CA A4 2B      [10]  673 	jp	Z,00112$
                            674 ;src/entities/enemies.c:134: for (i=0;i<MAX_ENEMIES;i++){
   26F0 DD 36 EB 00   [19]  675 	ld	-21 (ix),#0x00
   26F4 DD 36 FC 00   [19]  676 	ld	-4 (ix),#0x00
   26F8 DD 36 FD 00   [19]  677 	ld	-3 (ix),#0x00
   26FC DD 36 FE 00   [19]  678 	ld	-2 (ix),#0x00
   2700 DD 36 FF 00   [19]  679 	ld	-1 (ix),#0x00
   2704                     680 00124$:
                            681 ;src/entities/enemies.c:135: if (enemies[i].active){
   2704 3E AF         [ 7]  682 	ld	a,#<(_enemies)
   2706 DD 86 FE      [19]  683 	add	a, -2 (ix)
   2709 DD 77 F8      [19]  684 	ld	-8 (ix),a
   270C 3E 4E         [ 7]  685 	ld	a,#>(_enemies)
   270E DD 8E FF      [19]  686 	adc	a, -1 (ix)
   2711 DD 77 F9      [19]  687 	ld	-7 (ix),a
   2714 DD 4E F8      [19]  688 	ld	c,-8 (ix)
   2717 DD 46 F9      [19]  689 	ld	b,-7 (ix)
   271A C5            [11]  690 	push	bc
   271B FD E1         [14]  691 	pop	iy
   271D FD 7E 17      [19]  692 	ld	a,23 (iy)
   2720 DD 77 F7      [19]  693 	ld	-9 (ix), a
   2723 B7            [ 4]  694 	or	a, a
   2724 CA 79 2B      [10]  695 	jp	Z,00125$
                            696 ;src/entities/enemies.c:136: if (enemies[i].movement<99){
   2727 DD 7E F8      [19]  697 	ld	a,-8 (ix)
   272A C6 1D         [ 7]  698 	add	a, #0x1D
   272C DD 77 FA      [19]  699 	ld	-6 (ix),a
   272F DD 7E F9      [19]  700 	ld	a,-7 (ix)
   2732 CE 00         [ 7]  701 	adc	a, #0x00
   2734 DD 77 FB      [19]  702 	ld	-5 (ix),a
   2737 DD 6E FA      [19]  703 	ld	l,-6 (ix)
   273A DD 66 FB      [19]  704 	ld	h,-5 (ix)
   273D 56            [ 7]  705 	ld	d,(hl)
   273E 7A            [ 4]  706 	ld	a,d
   273F D6 63         [ 7]  707 	sub	a, #0x63
   2741 D2 79 2B      [10]  708 	jp	NC,00125$
                            709 ;src/entities/enemies.c:137: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   2744 DD 7E F8      [19]  710 	ld	a,-8 (ix)
   2747 C6 1F         [ 7]  711 	add	a, #0x1F
   2749 DD 77 F5      [19]  712 	ld	-11 (ix),a
   274C DD 7E F9      [19]  713 	ld	a,-7 (ix)
   274F CE 00         [ 7]  714 	adc	a, #0x00
   2751 DD 77 F6      [19]  715 	ld	-10 (ix),a
   2754 DD 6E F5      [19]  716 	ld	l,-11 (ix)
   2757 DD 66 F6      [19]  717 	ld	h,-10 (ix)
   275A 5E            [ 7]  718 	ld	e,(hl)
   275B 4A            [ 4]  719 	ld	c,d
   275C 06 00         [ 7]  720 	ld	b,#0x00
   275E 69            [ 4]  721 	ld	l, c
   275F 60            [ 4]  722 	ld	h, b
   2760 29            [11]  723 	add	hl, hl
   2761 29            [11]  724 	add	hl, hl
   2762 29            [11]  725 	add	hl, hl
   2763 29            [11]  726 	add	hl, hl
   2764 29            [11]  727 	add	hl, hl
   2765 09            [11]  728 	add	hl, bc
   2766 01 A0 2F      [10]  729 	ld	bc,#_movements
   2769 09            [11]  730 	add	hl,bc
   276A 23            [ 6]  731 	inc	hl
   276B 45            [ 4]  732 	ld	b,l
   276C 54            [ 4]  733 	ld	d,h
   276D DD 7E F8      [19]  734 	ld	a,-8 (ix)
   2770 C6 1E         [ 7]  735 	add	a, #0x1E
   2772 DD 77 F3      [19]  736 	ld	-13 (ix),a
   2775 DD 7E F9      [19]  737 	ld	a,-7 (ix)
   2778 CE 00         [ 7]  738 	adc	a, #0x00
   277A DD 77 F4      [19]  739 	ld	-12 (ix),a
   277D DD 6E F3      [19]  740 	ld	l,-13 (ix)
   2780 DD 66 F4      [19]  741 	ld	h,-12 (ix)
   2783 7E            [ 7]  742 	ld	a,(hl)
   2784 DD 77 F7      [19]  743 	ld	-9 (ix), a
   2787 87            [ 4]  744 	add	a, a
   2788 87            [ 4]  745 	add	a, a
   2789 80            [ 4]  746 	add	a,b
   278A DD 77 F1      [19]  747 	ld	-15 (ix),a
   278D 7A            [ 4]  748 	ld	a,d
   278E CE 00         [ 7]  749 	adc	a, #0x00
   2790 DD 77 F2      [19]  750 	ld	-14 (ix),a
   2793 DD 6E F1      [19]  751 	ld	l,-15 (ix)
   2796 DD 66 F2      [19]  752 	ld	h,-14 (ix)
   2799 23            [ 6]  753 	inc	hl
   279A 23            [ 6]  754 	inc	hl
   279B 23            [ 6]  755 	inc	hl
   279C 66            [ 7]  756 	ld	h,(hl)
   279D 7B            [ 4]  757 	ld	a,e
   279E 94            [ 4]  758 	sub	a, h
   279F D2 0F 29      [10]  759 	jp	NC,00104$
                            760 ;src/entities/enemies.c:138: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   27A2 DD 7E F8      [19]  761 	ld	a,-8 (ix)
   27A5 C6 16         [ 7]  762 	add	a, #0x16
   27A7 DD 77 EF      [19]  763 	ld	-17 (ix),a
   27AA DD 7E F9      [19]  764 	ld	a,-7 (ix)
   27AD CE 00         [ 7]  765 	adc	a, #0x00
   27AF DD 77 F0      [19]  766 	ld	-16 (ix),a
   27B2 DD 6E F1      [19]  767 	ld	l,-15 (ix)
   27B5 DD 66 F2      [19]  768 	ld	h,-14 (ix)
   27B8 7E            [ 7]  769 	ld	a,(hl)
   27B9 DD 77 F1      [19]  770 	ld	-15 (ix),a
   27BC DD 6E EF      [19]  771 	ld	l,-17 (ix)
   27BF DD 66 F0      [19]  772 	ld	h,-16 (ix)
   27C2 DD 7E F1      [19]  773 	ld	a,-15 (ix)
   27C5 77            [ 7]  774 	ld	(hl),a
                            775 ;src/entities/enemies.c:139: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   27C6 DD 7E F8      [19]  776 	ld	a,-8 (ix)
   27C9 C6 10         [ 7]  777 	add	a, #0x10
   27CB DD 77 EF      [19]  778 	ld	-17 (ix),a
   27CE DD 7E F9      [19]  779 	ld	a,-7 (ix)
   27D1 CE 00         [ 7]  780 	adc	a, #0x00
   27D3 DD 77 F0      [19]  781 	ld	-16 (ix),a
   27D6 DD 6E EF      [19]  782 	ld	l,-17 (ix)
   27D9 DD 66 F0      [19]  783 	ld	h,-16 (ix)
   27DC 7E            [ 7]  784 	ld	a,(hl)
   27DD DD 77 F1      [19]  785 	ld	-15 (ix),a
   27E0 23            [ 6]  786 	inc	hl
   27E1 7E            [ 7]  787 	ld	a,(hl)
   27E2 DD 77 F2      [19]  788 	ld	-14 (ix),a
   27E5 DD 6E FA      [19]  789 	ld	l,-6 (ix)
   27E8 DD 66 FB      [19]  790 	ld	h,-5 (ix)
   27EB 4E            [ 7]  791 	ld	c, (hl)
   27EC 06 00         [ 7]  792 	ld	b,#0x00
   27EE 69            [ 4]  793 	ld	l, c
   27EF 60            [ 4]  794 	ld	h, b
   27F0 29            [11]  795 	add	hl, hl
   27F1 29            [11]  796 	add	hl, hl
   27F2 29            [11]  797 	add	hl, hl
   27F3 29            [11]  798 	add	hl, hl
   27F4 29            [11]  799 	add	hl, hl
   27F5 09            [11]  800 	add	hl, bc
   27F6 3E A0         [ 7]  801 	ld	a,#<(_movements)
   27F8 85            [ 4]  802 	add	a, l
   27F9 DD 77 ED      [19]  803 	ld	-19 (ix),a
   27FC 3E 2F         [ 7]  804 	ld	a,#>(_movements)
   27FE 8C            [ 4]  805 	adc	a, h
   27FF DD 77 EE      [19]  806 	ld	-18 (ix),a
   2802 DD 34 ED      [23]  807 	inc	-19 (ix)
   2805 20 03         [12]  808 	jr	NZ,00176$
   2807 DD 34 EE      [23]  809 	inc	-18 (ix)
   280A                     810 00176$:
   280A DD 6E F3      [19]  811 	ld	l,-13 (ix)
   280D DD 66 F4      [19]  812 	ld	h,-12 (ix)
   2810 7E            [ 7]  813 	ld	a,(hl)
   2811 DD 77 EC      [19]  814 	ld	-20 (ix), a
   2814 87            [ 4]  815 	add	a, a
   2815 87            [ 4]  816 	add	a, a
   2816 67            [ 4]  817 	ld	h,a
   2817 DD 7E ED      [19]  818 	ld	a,-19 (ix)
   281A 84            [ 4]  819 	add	a, h
   281B DD 77 ED      [19]  820 	ld	-19 (ix),a
   281E DD 7E EE      [19]  821 	ld	a,-18 (ix)
   2821 CE 00         [ 7]  822 	adc	a, #0x00
   2823 DD 77 EE      [19]  823 	ld	-18 (ix),a
   2826 DD 6E ED      [19]  824 	ld	l,-19 (ix)
   2829 DD 66 EE      [19]  825 	ld	h,-18 (ix)
   282C 23            [ 6]  826 	inc	hl
   282D 7E            [ 7]  827 	ld	a,(hl)
   282E DD 77 EC      [19]  828 	ld	-20 (ix), a
   2831 DD 77 ED      [19]  829 	ld	-19 (ix),a
   2834 DD 7E EC      [19]  830 	ld	a,-20 (ix)
   2837 17            [ 4]  831 	rla
   2838 9F            [ 4]  832 	sbc	a, a
   2839 DD 77 EE      [19]  833 	ld	-18 (ix),a
   283C DD 7E F1      [19]  834 	ld	a,-15 (ix)
   283F DD 86 ED      [19]  835 	add	a, -19 (ix)
   2842 DD 77 ED      [19]  836 	ld	-19 (ix),a
   2845 DD 7E F2      [19]  837 	ld	a,-14 (ix)
   2848 DD 8E EE      [19]  838 	adc	a, -18 (ix)
   284B DD 77 EE      [19]  839 	ld	-18 (ix),a
   284E DD 6E EF      [19]  840 	ld	l,-17 (ix)
   2851 DD 66 F0      [19]  841 	ld	h,-16 (ix)
   2854 DD 7E ED      [19]  842 	ld	a,-19 (ix)
   2857 77            [ 7]  843 	ld	(hl),a
   2858 23            [ 6]  844 	inc	hl
   2859 DD 7E EE      [19]  845 	ld	a,-18 (ix)
   285C 77            [ 7]  846 	ld	(hl),a
                            847 ;src/entities/enemies.c:140: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   285D DD 7E F8      [19]  848 	ld	a,-8 (ix)
   2860 C6 12         [ 7]  849 	add	a, #0x12
   2862 DD 77 ED      [19]  850 	ld	-19 (ix),a
   2865 DD 7E F9      [19]  851 	ld	a,-7 (ix)
   2868 CE 00         [ 7]  852 	adc	a, #0x00
   286A DD 77 EE      [19]  853 	ld	-18 (ix),a
   286D DD 6E ED      [19]  854 	ld	l,-19 (ix)
   2870 DD 66 EE      [19]  855 	ld	h,-18 (ix)
   2873 7E            [ 7]  856 	ld	a,(hl)
   2874 DD 77 EF      [19]  857 	ld	-17 (ix),a
   2877 23            [ 6]  858 	inc	hl
   2878 7E            [ 7]  859 	ld	a,(hl)
   2879 DD 77 F0      [19]  860 	ld	-16 (ix),a
   287C DD 6E FA      [19]  861 	ld	l,-6 (ix)
   287F DD 66 FB      [19]  862 	ld	h,-5 (ix)
   2882 4E            [ 7]  863 	ld	c, (hl)
   2883 06 00         [ 7]  864 	ld	b,#0x00
   2885 69            [ 4]  865 	ld	l, c
   2886 60            [ 4]  866 	ld	h, b
   2887 29            [11]  867 	add	hl, hl
   2888 29            [11]  868 	add	hl, hl
   2889 29            [11]  869 	add	hl, hl
   288A 29            [11]  870 	add	hl, hl
   288B 29            [11]  871 	add	hl, hl
   288C 09            [11]  872 	add	hl, bc
   288D 3E A0         [ 7]  873 	ld	a,#<(_movements)
   288F 85            [ 4]  874 	add	a, l
   2890 DD 77 F1      [19]  875 	ld	-15 (ix),a
   2893 3E 2F         [ 7]  876 	ld	a,#>(_movements)
   2895 8C            [ 4]  877 	adc	a, h
   2896 DD 77 F2      [19]  878 	ld	-14 (ix),a
   2899 DD 34 F1      [23]  879 	inc	-15 (ix)
   289C 20 03         [12]  880 	jr	NZ,00177$
   289E DD 34 F2      [23]  881 	inc	-14 (ix)
   28A1                     882 00177$:
   28A1 DD 6E F3      [19]  883 	ld	l,-13 (ix)
   28A4 DD 66 F4      [19]  884 	ld	h,-12 (ix)
   28A7 7E            [ 7]  885 	ld	a,(hl)
   28A8 DD 77 EC      [19]  886 	ld	-20 (ix), a
   28AB 87            [ 4]  887 	add	a, a
   28AC 87            [ 4]  888 	add	a, a
   28AD 67            [ 4]  889 	ld	h,a
   28AE DD 7E F1      [19]  890 	ld	a,-15 (ix)
   28B1 84            [ 4]  891 	add	a, h
   28B2 DD 77 F1      [19]  892 	ld	-15 (ix),a
   28B5 DD 7E F2      [19]  893 	ld	a,-14 (ix)
   28B8 CE 00         [ 7]  894 	adc	a, #0x00
   28BA DD 77 F2      [19]  895 	ld	-14 (ix),a
   28BD DD 6E F1      [19]  896 	ld	l,-15 (ix)
   28C0 DD 66 F2      [19]  897 	ld	h,-14 (ix)
   28C3 23            [ 6]  898 	inc	hl
   28C4 23            [ 6]  899 	inc	hl
   28C5 7E            [ 7]  900 	ld	a,(hl)
   28C6 DD 77 EC      [19]  901 	ld	-20 (ix), a
   28C9 DD 77 F1      [19]  902 	ld	-15 (ix),a
   28CC DD 7E EC      [19]  903 	ld	a,-20 (ix)
   28CF 17            [ 4]  904 	rla
   28D0 9F            [ 4]  905 	sbc	a, a
   28D1 DD 77 F2      [19]  906 	ld	-14 (ix),a
   28D4 DD 7E EF      [19]  907 	ld	a,-17 (ix)
   28D7 DD 86 F1      [19]  908 	add	a, -15 (ix)
   28DA DD 77 EF      [19]  909 	ld	-17 (ix),a
   28DD DD 7E F0      [19]  910 	ld	a,-16 (ix)
   28E0 DD 8E F2      [19]  911 	adc	a, -14 (ix)
   28E3 DD 77 F0      [19]  912 	ld	-16 (ix),a
   28E6 DD 6E ED      [19]  913 	ld	l,-19 (ix)
   28E9 DD 66 EE      [19]  914 	ld	h,-18 (ix)
   28EC DD 7E EF      [19]  915 	ld	a,-17 (ix)
   28EF 77            [ 7]  916 	ld	(hl),a
   28F0 23            [ 6]  917 	inc	hl
   28F1 DD 7E F0      [19]  918 	ld	a,-16 (ix)
   28F4 77            [ 7]  919 	ld	(hl),a
                            920 ;src/entities/enemies.c:141: enemies[i].stage_step++;
   28F5 DD 6E F5      [19]  921 	ld	l,-11 (ix)
   28F8 DD 66 F6      [19]  922 	ld	h,-10 (ix)
   28FB 7E            [ 7]  923 	ld	a,(hl)
   28FC DD 77 EC      [19]  924 	ld	-20 (ix),a
   28FF DD 34 EC      [23]  925 	inc	-20 (ix)
   2902 DD 6E F5      [19]  926 	ld	l,-11 (ix)
   2905 DD 66 F6      [19]  927 	ld	h,-10 (ix)
   2908 DD 7E EC      [19]  928 	ld	a,-20 (ix)
   290B 77            [ 7]  929 	ld	(hl),a
   290C C3 79 2B      [10]  930 	jp	00125$
   290F                     931 00104$:
                            932 ;src/entities/enemies.c:143: enemies[i].stage++;
   290F DD 7E F7      [19]  933 	ld	a,-9 (ix)
   2912 3C            [ 4]  934 	inc	a
   2913 DD 77 EC      [19]  935 	ld	-20 (ix),a
   2916 DD 6E F3      [19]  936 	ld	l,-13 (ix)
   2919 DD 66 F4      [19]  937 	ld	h,-12 (ix)
   291C DD 7E EC      [19]  938 	ld	a,-20 (ix)
   291F 77            [ 7]  939 	ld	(hl),a
                            940 ;src/entities/enemies.c:144: enemies[i].stage_step=0;
   2920 DD 6E F5      [19]  941 	ld	l,-11 (ix)
   2923 DD 66 F6      [19]  942 	ld	h,-10 (ix)
   2926 36 00         [10]  943 	ld	(hl),#0x00
                            944 ;src/entities/enemies.c:145: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   2928 DD 6E FA      [19]  945 	ld	l,-6 (ix)
   292B DD 66 FB      [19]  946 	ld	h,-5 (ix)
   292E 7E            [ 7]  947 	ld	a,(hl)
   292F DD 77 ED      [19]  948 	ld	-19 (ix), a
   2932 4F            [ 4]  949 	ld	c, a
   2933 06 00         [ 7]  950 	ld	b,#0x00
   2935 69            [ 4]  951 	ld	l, c
   2936 60            [ 4]  952 	ld	h, b
   2937 29            [11]  953 	add	hl, hl
   2938 29            [11]  954 	add	hl, hl
   2939 29            [11]  955 	add	hl, hl
   293A 29            [11]  956 	add	hl, hl
   293B 29            [11]  957 	add	hl, hl
   293C 09            [11]  958 	add	hl, bc
   293D DD 75 ED      [19]  959 	ld	-19 (ix),l
   2940 DD 74 EE      [19]  960 	ld	-18 (ix),h
   2943 3E A0         [ 7]  961 	ld	a,#<(_movements)
   2945 DD 86 ED      [19]  962 	add	a, -19 (ix)
   2948 DD 77 ED      [19]  963 	ld	-19 (ix),a
   294B 3E 2F         [ 7]  964 	ld	a,#>(_movements)
   294D DD 8E EE      [19]  965 	adc	a, -18 (ix)
   2950 DD 77 EE      [19]  966 	ld	-18 (ix),a
   2953 DD 6E ED      [19]  967 	ld	l,-19 (ix)
   2956 DD 66 EE      [19]  968 	ld	h,-18 (ix)
   2959 7E            [ 7]  969 	ld	a,(hl)
   295A DD 77 ED      [19]  970 	ld	-19 (ix),a
   295D DD 7E EC      [19]  971 	ld	a,-20 (ix)
   2960 DD 96 ED      [19]  972 	sub	a, -19 (ix)
   2963 38 08         [12]  973 	jr	C,00102$
                            974 ;src/entities/enemies.c:146: enemies[i].stage=0;
   2965 DD 6E F3      [19]  975 	ld	l,-13 (ix)
   2968 DD 66 F4      [19]  976 	ld	h,-12 (ix)
   296B 36 00         [10]  977 	ld	(hl),#0x00
   296D                     978 00102$:
                            979 ;src/entities/enemies.c:148: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   296D 3E AF         [ 7]  980 	ld	a,#<(_enemies)
   296F DD 86 FC      [19]  981 	add	a, -4 (ix)
   2972 DD 77 ED      [19]  982 	ld	-19 (ix),a
   2975 3E 4E         [ 7]  983 	ld	a,#>(_enemies)
   2977 DD 8E FD      [19]  984 	adc	a, -3 (ix)
   297A DD 77 EE      [19]  985 	ld	-18 (ix),a
   297D DD 7E ED      [19]  986 	ld	a,-19 (ix)
   2980 C6 16         [ 7]  987 	add	a, #0x16
   2982 DD 77 EF      [19]  988 	ld	-17 (ix),a
   2985 DD 7E EE      [19]  989 	ld	a,-18 (ix)
   2988 CE 00         [ 7]  990 	adc	a, #0x00
   298A DD 77 F0      [19]  991 	ld	-16 (ix),a
   298D DD 7E ED      [19]  992 	ld	a,-19 (ix)
   2990 C6 1D         [ 7]  993 	add	a, #0x1D
   2992 DD 77 F1      [19]  994 	ld	-15 (ix),a
   2995 DD 7E EE      [19]  995 	ld	a,-18 (ix)
   2998 CE 00         [ 7]  996 	adc	a, #0x00
   299A DD 77 F2      [19]  997 	ld	-14 (ix),a
   299D DD 6E F1      [19]  998 	ld	l,-15 (ix)
   29A0 DD 66 F2      [19]  999 	ld	h,-14 (ix)
   29A3 4E            [ 7] 1000 	ld	c, (hl)
   29A4 06 00         [ 7] 1001 	ld	b,#0x00
   29A6 69            [ 4] 1002 	ld	l, c
   29A7 60            [ 4] 1003 	ld	h, b
   29A8 29            [11] 1004 	add	hl, hl
   29A9 29            [11] 1005 	add	hl, hl
   29AA 29            [11] 1006 	add	hl, hl
   29AB 29            [11] 1007 	add	hl, hl
   29AC 29            [11] 1008 	add	hl, hl
   29AD 09            [11] 1009 	add	hl, bc
   29AE DD 75 F3      [19] 1010 	ld	-13 (ix),l
   29B1 DD 74 F4      [19] 1011 	ld	-12 (ix),h
   29B4 3E A0         [ 7] 1012 	ld	a,#<(_movements)
   29B6 DD 86 F3      [19] 1013 	add	a, -13 (ix)
   29B9 DD 77 F3      [19] 1014 	ld	-13 (ix),a
   29BC 3E 2F         [ 7] 1015 	ld	a,#>(_movements)
   29BE DD 8E F4      [19] 1016 	adc	a, -12 (ix)
   29C1 DD 77 F4      [19] 1017 	ld	-12 (ix),a
   29C4 DD 34 F3      [23] 1018 	inc	-13 (ix)
   29C7 20 03         [12] 1019 	jr	NZ,00178$
   29C9 DD 34 F4      [23] 1020 	inc	-12 (ix)
   29CC                    1021 00178$:
   29CC DD 7E ED      [19] 1022 	ld	a,-19 (ix)
   29CF C6 1E         [ 7] 1023 	add	a, #0x1E
   29D1 DD 77 F5      [19] 1024 	ld	-11 (ix),a
   29D4 DD 7E EE      [19] 1025 	ld	a,-18 (ix)
   29D7 CE 00         [ 7] 1026 	adc	a, #0x00
   29D9 DD 77 F6      [19] 1027 	ld	-10 (ix),a
   29DC DD 6E F5      [19] 1028 	ld	l,-11 (ix)
   29DF DD 66 F6      [19] 1029 	ld	h,-10 (ix)
   29E2 7E            [ 7] 1030 	ld	a,(hl)
   29E3 87            [ 4] 1031 	add	a, a
   29E4 87            [ 4] 1032 	add	a, a
   29E5 67            [ 4] 1033 	ld	h,a
   29E6 DD 7E F3      [19] 1034 	ld	a,-13 (ix)
   29E9 84            [ 4] 1035 	add	a, h
   29EA DD 77 F3      [19] 1036 	ld	-13 (ix),a
   29ED DD 7E F4      [19] 1037 	ld	a,-12 (ix)
   29F0 CE 00         [ 7] 1038 	adc	a, #0x00
   29F2 DD 77 F4      [19] 1039 	ld	-12 (ix),a
   29F5 DD 6E F3      [19] 1040 	ld	l,-13 (ix)
   29F8 DD 66 F4      [19] 1041 	ld	h,-12 (ix)
   29FB 7E            [ 7] 1042 	ld	a,(hl)
   29FC DD 77 EC      [19] 1043 	ld	-20 (ix),a
   29FF DD 6E EF      [19] 1044 	ld	l,-17 (ix)
   2A02 DD 66 F0      [19] 1045 	ld	h,-16 (ix)
   2A05 DD 7E EC      [19] 1046 	ld	a,-20 (ix)
   2A08 77            [ 7] 1047 	ld	(hl),a
                           1048 ;src/entities/enemies.c:149: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2A09 DD 7E ED      [19] 1049 	ld	a,-19 (ix)
   2A0C C6 10         [ 7] 1050 	add	a, #0x10
   2A0E DD 77 EF      [19] 1051 	ld	-17 (ix),a
   2A11 DD 7E EE      [19] 1052 	ld	a,-18 (ix)
   2A14 CE 00         [ 7] 1053 	adc	a, #0x00
   2A16 DD 77 F0      [19] 1054 	ld	-16 (ix),a
   2A19 DD 6E EF      [19] 1055 	ld	l,-17 (ix)
   2A1C DD 66 F0      [19] 1056 	ld	h,-16 (ix)
   2A1F 7E            [ 7] 1057 	ld	a,(hl)
   2A20 DD 77 F3      [19] 1058 	ld	-13 (ix),a
   2A23 23            [ 6] 1059 	inc	hl
   2A24 7E            [ 7] 1060 	ld	a,(hl)
   2A25 DD 77 F4      [19] 1061 	ld	-12 (ix),a
   2A28 DD 6E F1      [19] 1062 	ld	l,-15 (ix)
   2A2B DD 66 F2      [19] 1063 	ld	h,-14 (ix)
   2A2E 4E            [ 7] 1064 	ld	c, (hl)
   2A2F 06 00         [ 7] 1065 	ld	b,#0x00
   2A31 69            [ 4] 1066 	ld	l, c
   2A32 60            [ 4] 1067 	ld	h, b
   2A33 29            [11] 1068 	add	hl, hl
   2A34 29            [11] 1069 	add	hl, hl
   2A35 29            [11] 1070 	add	hl, hl
   2A36 29            [11] 1071 	add	hl, hl
   2A37 29            [11] 1072 	add	hl, hl
   2A38 09            [11] 1073 	add	hl, bc
   2A39 DD 75 FA      [19] 1074 	ld	-6 (ix),l
   2A3C DD 74 FB      [19] 1075 	ld	-5 (ix),h
   2A3F 3E A0         [ 7] 1076 	ld	a,#<(_movements)
   2A41 DD 86 FA      [19] 1077 	add	a, -6 (ix)
   2A44 DD 77 FA      [19] 1078 	ld	-6 (ix),a
   2A47 3E 2F         [ 7] 1079 	ld	a,#>(_movements)
   2A49 DD 8E FB      [19] 1080 	adc	a, -5 (ix)
   2A4C DD 77 FB      [19] 1081 	ld	-5 (ix),a
   2A4F DD 34 FA      [23] 1082 	inc	-6 (ix)
   2A52 20 03         [12] 1083 	jr	NZ,00179$
   2A54 DD 34 FB      [23] 1084 	inc	-5 (ix)
   2A57                    1085 00179$:
   2A57 DD 6E F5      [19] 1086 	ld	l,-11 (ix)
   2A5A DD 66 F6      [19] 1087 	ld	h,-10 (ix)
   2A5D 7E            [ 7] 1088 	ld	a,(hl)
   2A5E DD 77 EC      [19] 1089 	ld	-20 (ix), a
   2A61 87            [ 4] 1090 	add	a, a
   2A62 87            [ 4] 1091 	add	a, a
   2A63 67            [ 4] 1092 	ld	h,a
   2A64 DD 7E FA      [19] 1093 	ld	a,-6 (ix)
   2A67 84            [ 4] 1094 	add	a, h
   2A68 DD 77 FA      [19] 1095 	ld	-6 (ix),a
   2A6B DD 7E FB      [19] 1096 	ld	a,-5 (ix)
   2A6E CE 00         [ 7] 1097 	adc	a, #0x00
   2A70 DD 77 FB      [19] 1098 	ld	-5 (ix),a
   2A73 DD 6E FA      [19] 1099 	ld	l,-6 (ix)
   2A76 DD 66 FB      [19] 1100 	ld	h,-5 (ix)
   2A79 23            [ 6] 1101 	inc	hl
   2A7A 7E            [ 7] 1102 	ld	a,(hl)
   2A7B DD 77 EC      [19] 1103 	ld	-20 (ix), a
   2A7E DD 77 FA      [19] 1104 	ld	-6 (ix),a
   2A81 DD 7E EC      [19] 1105 	ld	a,-20 (ix)
   2A84 17            [ 4] 1106 	rla
   2A85 9F            [ 4] 1107 	sbc	a, a
   2A86 DD 77 FB      [19] 1108 	ld	-5 (ix),a
   2A89 DD 7E F3      [19] 1109 	ld	a,-13 (ix)
   2A8C DD 86 FA      [19] 1110 	add	a, -6 (ix)
   2A8F DD 77 F3      [19] 1111 	ld	-13 (ix),a
   2A92 DD 7E F4      [19] 1112 	ld	a,-12 (ix)
   2A95 DD 8E FB      [19] 1113 	adc	a, -5 (ix)
   2A98 DD 77 F4      [19] 1114 	ld	-12 (ix),a
   2A9B DD 6E EF      [19] 1115 	ld	l,-17 (ix)
   2A9E DD 66 F0      [19] 1116 	ld	h,-16 (ix)
   2AA1 DD 7E F3      [19] 1117 	ld	a,-13 (ix)
   2AA4 77            [ 7] 1118 	ld	(hl),a
   2AA5 23            [ 6] 1119 	inc	hl
   2AA6 DD 7E F4      [19] 1120 	ld	a,-12 (ix)
   2AA9 77            [ 7] 1121 	ld	(hl),a
                           1122 ;src/entities/enemies.c:150: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2AAA DD 7E ED      [19] 1123 	ld	a,-19 (ix)
   2AAD C6 12         [ 7] 1124 	add	a, #0x12
   2AAF DD 77 EF      [19] 1125 	ld	-17 (ix),a
   2AB2 DD 7E EE      [19] 1126 	ld	a,-18 (ix)
   2AB5 CE 00         [ 7] 1127 	adc	a, #0x00
   2AB7 DD 77 F0      [19] 1128 	ld	-16 (ix),a
   2ABA DD 6E EF      [19] 1129 	ld	l,-17 (ix)
   2ABD DD 66 F0      [19] 1130 	ld	h,-16 (ix)
   2AC0 7E            [ 7] 1131 	ld	a,(hl)
   2AC1 DD 77 F3      [19] 1132 	ld	-13 (ix),a
   2AC4 23            [ 6] 1133 	inc	hl
   2AC5 7E            [ 7] 1134 	ld	a,(hl)
   2AC6 DD 77 F4      [19] 1135 	ld	-12 (ix),a
   2AC9 DD 6E F1      [19] 1136 	ld	l,-15 (ix)
   2ACC DD 66 F2      [19] 1137 	ld	h,-14 (ix)
   2ACF 7E            [ 7] 1138 	ld	a,(hl)
   2AD0 DD 77 EC      [19] 1139 	ld	-20 (ix), a
   2AD3 4F            [ 4] 1140 	ld	c, a
   2AD4 06 00         [ 7] 1141 	ld	b,#0x00
   2AD6 69            [ 4] 1142 	ld	l, c
   2AD7 60            [ 4] 1143 	ld	h, b
   2AD8 29            [11] 1144 	add	hl, hl
   2AD9 29            [11] 1145 	add	hl, hl
   2ADA 29            [11] 1146 	add	hl, hl
   2ADB 29            [11] 1147 	add	hl, hl
   2ADC 29            [11] 1148 	add	hl, hl
   2ADD 09            [11] 1149 	add	hl, bc
   2ADE DD 75 F1      [19] 1150 	ld	-15 (ix),l
   2AE1 DD 74 F2      [19] 1151 	ld	-14 (ix),h
   2AE4 3E A0         [ 7] 1152 	ld	a,#<(_movements)
   2AE6 DD 86 F1      [19] 1153 	add	a, -15 (ix)
   2AE9 DD 77 F1      [19] 1154 	ld	-15 (ix),a
   2AEC 3E 2F         [ 7] 1155 	ld	a,#>(_movements)
   2AEE DD 8E F2      [19] 1156 	adc	a, -14 (ix)
   2AF1 DD 77 F2      [19] 1157 	ld	-14 (ix),a
   2AF4 DD 34 F1      [23] 1158 	inc	-15 (ix)
   2AF7 20 03         [12] 1159 	jr	NZ,00180$
   2AF9 DD 34 F2      [23] 1160 	inc	-14 (ix)
   2AFC                    1161 00180$:
   2AFC DD 6E F5      [19] 1162 	ld	l,-11 (ix)
   2AFF DD 66 F6      [19] 1163 	ld	h,-10 (ix)
   2B02 7E            [ 7] 1164 	ld	a,(hl)
   2B03 DD 77 EC      [19] 1165 	ld	-20 (ix),a
   2B06 DD CB EC 26   [23] 1166 	sla	-20 (ix)
   2B0A DD CB EC 26   [23] 1167 	sla	-20 (ix)
   2B0E DD 7E F1      [19] 1168 	ld	a,-15 (ix)
   2B11 DD 86 EC      [19] 1169 	add	a, -20 (ix)
   2B14 DD 77 F1      [19] 1170 	ld	-15 (ix),a
   2B17 DD 7E F2      [19] 1171 	ld	a,-14 (ix)
   2B1A CE 00         [ 7] 1172 	adc	a, #0x00
   2B1C DD 77 F2      [19] 1173 	ld	-14 (ix),a
   2B1F DD 6E F1      [19] 1174 	ld	l,-15 (ix)
   2B22 DD 66 F2      [19] 1175 	ld	h,-14 (ix)
   2B25 23            [ 6] 1176 	inc	hl
   2B26 23            [ 6] 1177 	inc	hl
   2B27 7E            [ 7] 1178 	ld	a,(hl)
   2B28 DD 77 EC      [19] 1179 	ld	-20 (ix), a
   2B2B DD 77 F1      [19] 1180 	ld	-15 (ix),a
   2B2E DD 7E EC      [19] 1181 	ld	a,-20 (ix)
   2B31 17            [ 4] 1182 	rla
   2B32 9F            [ 4] 1183 	sbc	a, a
   2B33 DD 77 F2      [19] 1184 	ld	-14 (ix),a
   2B36 DD 7E F3      [19] 1185 	ld	a,-13 (ix)
   2B39 DD 86 F1      [19] 1186 	add	a, -15 (ix)
   2B3C DD 77 F1      [19] 1187 	ld	-15 (ix),a
   2B3F DD 7E F4      [19] 1188 	ld	a,-12 (ix)
   2B42 DD 8E F2      [19] 1189 	adc	a, -14 (ix)
   2B45 DD 77 F2      [19] 1190 	ld	-14 (ix),a
   2B48 DD 6E EF      [19] 1191 	ld	l,-17 (ix)
   2B4B DD 66 F0      [19] 1192 	ld	h,-16 (ix)
   2B4E DD 7E F1      [19] 1193 	ld	a,-15 (ix)
   2B51 77            [ 7] 1194 	ld	(hl),a
   2B52 23            [ 6] 1195 	inc	hl
   2B53 DD 7E F2      [19] 1196 	ld	a,-14 (ix)
   2B56 77            [ 7] 1197 	ld	(hl),a
                           1198 ;src/entities/enemies.c:151: enemies[i].stage_step++;
   2B57 DD 7E ED      [19] 1199 	ld	a,-19 (ix)
   2B5A C6 1F         [ 7] 1200 	add	a, #0x1F
   2B5C DD 77 ED      [19] 1201 	ld	-19 (ix),a
   2B5F DD 7E EE      [19] 1202 	ld	a,-18 (ix)
   2B62 CE 00         [ 7] 1203 	adc	a, #0x00
   2B64 DD 77 EE      [19] 1204 	ld	-18 (ix),a
   2B67 DD 6E ED      [19] 1205 	ld	l,-19 (ix)
   2B6A DD 66 EE      [19] 1206 	ld	h,-18 (ix)
   2B6D 7E            [ 7] 1207 	ld	a,(hl)
   2B6E DD 77 EC      [19] 1208 	ld	-20 (ix), a
   2B71 3C            [ 4] 1209 	inc	a
   2B72 DD 6E ED      [19] 1210 	ld	l,-19 (ix)
   2B75 DD 66 EE      [19] 1211 	ld	h,-18 (ix)
   2B78 77            [ 7] 1212 	ld	(hl),a
   2B79                    1213 00125$:
                           1214 ;src/entities/enemies.c:134: for (i=0;i<MAX_ENEMIES;i++){
   2B79 DD 7E FC      [19] 1215 	ld	a,-4 (ix)
   2B7C C6 24         [ 7] 1216 	add	a, #0x24
   2B7E DD 77 FC      [19] 1217 	ld	-4 (ix),a
   2B81 DD 7E FD      [19] 1218 	ld	a,-3 (ix)
   2B84 CE 00         [ 7] 1219 	adc	a, #0x00
   2B86 DD 77 FD      [19] 1220 	ld	-3 (ix),a
   2B89 DD 7E FE      [19] 1221 	ld	a,-2 (ix)
   2B8C C6 24         [ 7] 1222 	add	a, #0x24
   2B8E DD 77 FE      [19] 1223 	ld	-2 (ix),a
   2B91 DD 7E FF      [19] 1224 	ld	a,-1 (ix)
   2B94 CE 00         [ 7] 1225 	adc	a, #0x00
   2B96 DD 77 FF      [19] 1226 	ld	-1 (ix),a
   2B99 DD 34 EB      [23] 1227 	inc	-21 (ix)
   2B9C DD 7E EB      [19] 1228 	ld	a,-21 (ix)
   2B9F D6 1E         [ 7] 1229 	sub	a, #0x1E
   2BA1 DA 04 27      [10] 1230 	jp	C,00124$
   2BA4                    1231 00112$:
                           1232 ;src/entities/enemies.c:159: if (active_groups>0){
   2BA4 3A 08 53      [13] 1233 	ld	a,(#_active_groups + 0)
   2BA7 B7            [ 4] 1234 	or	a, a
   2BA8 CA 25 2C      [10] 1235 	jp	Z,00128$
                           1236 ;src/entities/enemies.c:161: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2BAB DD 36 EB 00   [19] 1237 	ld	-21 (ix),#0x00
   2BAF                    1238 00126$:
                           1239 ;src/entities/enemies.c:162: if (groups[i].active){
   2BAF DD 6E EB      [19] 1240 	ld	l,-21 (ix)
   2BB2 26 00         [ 7] 1241 	ld	h,#0x00
   2BB4 29            [11] 1242 	add	hl, hl
   2BB5 29            [11] 1243 	add	hl, hl
   2BB6 29            [11] 1244 	add	hl, hl
   2BB7 3E E8         [ 7] 1245 	ld	a,#<(_groups)
   2BB9 85            [ 4] 1246 	add	a, l
   2BBA 5F            [ 4] 1247 	ld	e,a
   2BBB 3E 52         [ 7] 1248 	ld	a,#>(_groups)
   2BBD 8C            [ 4] 1249 	adc	a, h
   2BBE 57            [ 4] 1250 	ld	d,a
   2BBF 1A            [ 7] 1251 	ld	a,(de)
   2BC0 B7            [ 4] 1252 	or	a, a
   2BC1 28 58         [12] 1253 	jr	Z,00127$
                           1254 ;src/entities/enemies.c:163: if (groups[i].sleep==0){
   2BC3 21 07 00      [10] 1255 	ld	hl,#0x0007
   2BC6 19            [11] 1256 	add	hl,de
   2BC7 7E            [ 7] 1257 	ld	a,(hl)
   2BC8 B7            [ 4] 1258 	or	a, a
   2BC9 20 4D         [12] 1259 	jr	NZ,00117$
                           1260 ;src/entities/enemies.c:164: groups[i].sleep=ENEMY_GAP;
   2BCB 36 03         [10] 1261 	ld	(hl),#0x03
                           1262 ;src/entities/enemies.c:165: if (groups[i].num_enemies==0){
   2BCD 21 06 00      [10] 1263 	ld	hl,#0x0006
   2BD0 19            [11] 1264 	add	hl,de
   2BD1 4D            [ 4] 1265 	ld	c,l
   2BD2 44            [ 4] 1266 	ld	b,h
   2BD3 0A            [ 7] 1267 	ld	a,(bc)
   2BD4 B7            [ 4] 1268 	or	a, a
   2BD5 20 08         [12] 1269 	jr	NZ,00114$
                           1270 ;src/entities/enemies.c:166: groups[i].active=0;
   2BD7 AF            [ 4] 1271 	xor	a, a
   2BD8 12            [ 7] 1272 	ld	(de),a
                           1273 ;src/entities/enemies.c:167: active_groups--;
   2BD9 21 08 53      [10] 1274 	ld	hl, #_active_groups+0
   2BDC 35            [11] 1275 	dec	(hl)
   2BDD 18 3C         [12] 1276 	jr	00127$
   2BDF                    1277 00114$:
                           1278 ;src/entities/enemies.c:169: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2BDF 6B            [ 4] 1279 	ld	l, e
   2BE0 62            [ 4] 1280 	ld	h, d
   2BE1 23            [ 6] 1281 	inc	hl
   2BE2 23            [ 6] 1282 	inc	hl
   2BE3 23            [ 6] 1283 	inc	hl
   2BE4 23            [ 6] 1284 	inc	hl
   2BE5 23            [ 6] 1285 	inc	hl
   2BE6 7E            [ 7] 1286 	ld	a,(hl)
   2BE7 DD 77 EC      [19] 1287 	ld	-20 (ix),a
   2BEA 6B            [ 4] 1288 	ld	l, e
   2BEB 62            [ 4] 1289 	ld	h, d
   2BEC 23            [ 6] 1290 	inc	hl
   2BED 23            [ 6] 1291 	inc	hl
   2BEE 23            [ 6] 1292 	inc	hl
   2BEF 7E            [ 7] 1293 	ld	a,(hl)
   2BF0 DD 77 ED      [19] 1294 	ld	-19 (ix),a
   2BF3 23            [ 6] 1295 	inc	hl
   2BF4 7E            [ 7] 1296 	ld	a,(hl)
   2BF5 DD 77 EE      [19] 1297 	ld	-18 (ix),a
   2BF8 EB            [ 4] 1298 	ex	de,hl
   2BF9 23            [ 6] 1299 	inc	hl
   2BFA 5E            [ 7] 1300 	ld	e,(hl)
   2BFB 23            [ 6] 1301 	inc	hl
   2BFC 56            [ 7] 1302 	ld	d,(hl)
   2BFD C5            [11] 1303 	push	bc
   2BFE DD 7E EC      [19] 1304 	ld	a,-20 (ix)
   2C01 F5            [11] 1305 	push	af
   2C02 33            [ 6] 1306 	inc	sp
   2C03 DD 6E ED      [19] 1307 	ld	l,-19 (ix)
   2C06 DD 66 EE      [19] 1308 	ld	h,-18 (ix)
   2C09 E5            [11] 1309 	push	hl
   2C0A D5            [11] 1310 	push	de
   2C0B CD 3D 23      [17] 1311 	call	_create_enemy
   2C0E F1            [10] 1312 	pop	af
   2C0F F1            [10] 1313 	pop	af
   2C10 33            [ 6] 1314 	inc	sp
   2C11 C1            [10] 1315 	pop	bc
                           1316 ;src/entities/enemies.c:170: groups[i].num_enemies--;
   2C12 0A            [ 7] 1317 	ld	a,(bc)
   2C13 C6 FF         [ 7] 1318 	add	a,#0xFF
   2C15 02            [ 7] 1319 	ld	(bc),a
   2C16 18 03         [12] 1320 	jr	00127$
   2C18                    1321 00117$:
                           1322 ;src/entities/enemies.c:173: groups[i].sleep--;
   2C18 C6 FF         [ 7] 1323 	add	a,#0xFF
   2C1A 77            [ 7] 1324 	ld	(hl),a
   2C1B                    1325 00127$:
                           1326 ;src/entities/enemies.c:161: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2C1B DD 34 EB      [23] 1327 	inc	-21 (ix)
   2C1E DD 7E EB      [19] 1328 	ld	a,-21 (ix)
   2C21 D6 04         [ 7] 1329 	sub	a, #0x04
   2C23 38 8A         [12] 1330 	jr	C,00126$
   2C25                    1331 00128$:
   2C25 DD F9         [10] 1332 	ld	sp, ix
   2C27 DD E1         [14] 1333 	pop	ix
   2C29 C9            [10] 1334 	ret
                           1335 ;src/entities/enemies.c:181: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                           1336 ;	---------------------------------
                           1337 ; Function inside_screen
                           1338 ; ---------------------------------
   2C2A                    1339 _inside_screen::
   2C2A DD E5         [15] 1340 	push	ix
   2C2C DD 21 00 00   [14] 1341 	ld	ix,#0
   2C30 DD 39         [15] 1342 	add	ix,sp
   2C32 3B            [ 6] 1343 	dec	sp
                           1344 ;src/entities/enemies.c:183: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   2C33 DD CB 05 7E   [20] 1345 	bit	7, 5 (ix)
   2C37 20 38         [12] 1346 	jr	NZ,00103$
   2C39 DD 5E 08      [19] 1347 	ld	e,8 (ix)
   2C3C 16 00         [ 7] 1348 	ld	d,#0x00
   2C3E DD 6E 04      [19] 1349 	ld	l,4 (ix)
   2C41 DD 66 05      [19] 1350 	ld	h,5 (ix)
   2C44 19            [11] 1351 	add	hl,de
   2C45 11 50 80      [10] 1352 	ld	de, #0x8050
   2C48 29            [11] 1353 	add	hl, hl
   2C49 3F            [ 4] 1354 	ccf
   2C4A CB 1C         [ 8] 1355 	rr	h
   2C4C CB 1D         [ 8] 1356 	rr	l
   2C4E ED 52         [15] 1357 	sbc	hl, de
   2C50 30 1F         [12] 1358 	jr	NC,00103$
   2C52 DD CB 07 7E   [20] 1359 	bit	7, 7 (ix)
   2C56 20 19         [12] 1360 	jr	NZ,00103$
   2C58 DD 5E 09      [19] 1361 	ld	e,9 (ix)
   2C5B 16 00         [ 7] 1362 	ld	d,#0x00
   2C5D DD 6E 06      [19] 1363 	ld	l,6 (ix)
   2C60 DD 66 07      [19] 1364 	ld	h,7 (ix)
   2C63 19            [11] 1365 	add	hl,de
   2C64 11 C8 80      [10] 1366 	ld	de, #0x80C8
   2C67 29            [11] 1367 	add	hl, hl
   2C68 3F            [ 4] 1368 	ccf
   2C69 CB 1C         [ 8] 1369 	rr	h
   2C6B CB 1D         [ 8] 1370 	rr	l
   2C6D ED 52         [15] 1371 	sbc	hl, de
   2C6F 38 04         [12] 1372 	jr	C,00104$
   2C71                    1373 00103$:
   2C71 2E 00         [ 7] 1374 	ld	l,#0x00
   2C73 18 02         [12] 1375 	jr	00105$
   2C75                    1376 00104$:
   2C75 2E 01         [ 7] 1377 	ld	l,#0x01
   2C77                    1378 00105$:
   2C77 33            [ 6] 1379 	inc	sp
   2C78 DD E1         [14] 1380 	pop	ix
   2C7A C9            [10] 1381 	ret
                           1382 ;src/entities/enemies.c:190: void draw_enemies(u8* screen){
                           1383 ;	---------------------------------
                           1384 ; Function draw_enemies
                           1385 ; ---------------------------------
   2C7B                    1386 _draw_enemies::
   2C7B DD E5         [15] 1387 	push	ix
   2C7D DD 21 00 00   [14] 1388 	ld	ix,#0
   2C81 DD 39         [15] 1389 	add	ix,sp
   2C83 21 F1 FF      [10] 1390 	ld	hl,#-15
   2C86 39            [11] 1391 	add	hl,sp
   2C87 F9            [ 6] 1392 	ld	sp,hl
                           1393 ;src/entities/enemies.c:195: if (active_enemies>0){
   2C88 3A E7 52      [13] 1394 	ld	a,(#_active_enemies + 0)
   2C8B B7            [ 4] 1395 	or	a, a
   2C8C CA BC 2D      [10] 1396 	jp	Z,00109$
                           1397 ;src/entities/enemies.c:196: for (k=0;k<MAX_ENEMIES;k++){
   2C8F DD 36 F1 00   [19] 1398 	ld	-15 (ix),#0x00
   2C93 11 00 00      [10] 1399 	ld	de,#0x0000
   2C96                    1400 00107$:
                           1401 ;src/entities/enemies.c:197: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2C96 21 AF 4E      [10] 1402 	ld	hl,#_enemies
   2C99 19            [11] 1403 	add	hl,de
   2C9A DD 75 FE      [19] 1404 	ld	-2 (ix),l
   2C9D DD 74 FF      [19] 1405 	ld	-1 (ix),h
   2CA0 DD 6E FE      [19] 1406 	ld	l,-2 (ix)
   2CA3 DD 66 FF      [19] 1407 	ld	h,-1 (ix)
   2CA6 01 17 00      [10] 1408 	ld	bc, #0x0017
   2CA9 09            [11] 1409 	add	hl, bc
   2CAA 7E            [ 7] 1410 	ld	a,(hl)
   2CAB B7            [ 4] 1411 	or	a, a
   2CAC CA AC 2D      [10] 1412 	jp	Z,00108$
   2CAF DD 7E FE      [19] 1413 	ld	a,-2 (ix)
   2CB2 C6 15         [ 7] 1414 	add	a, #0x15
   2CB4 DD 77 FC      [19] 1415 	ld	-4 (ix),a
   2CB7 DD 7E FF      [19] 1416 	ld	a,-1 (ix)
   2CBA CE 00         [ 7] 1417 	adc	a, #0x00
   2CBC DD 77 FD      [19] 1418 	ld	-3 (ix),a
   2CBF DD 6E FC      [19] 1419 	ld	l,-4 (ix)
   2CC2 DD 66 FD      [19] 1420 	ld	h,-3 (ix)
   2CC5 46            [ 7] 1421 	ld	b,(hl)
   2CC6 DD 7E FE      [19] 1422 	ld	a,-2 (ix)
   2CC9 C6 14         [ 7] 1423 	add	a, #0x14
   2CCB DD 77 FA      [19] 1424 	ld	-6 (ix),a
   2CCE DD 7E FF      [19] 1425 	ld	a,-1 (ix)
   2CD1 CE 00         [ 7] 1426 	adc	a, #0x00
   2CD3 DD 77 FB      [19] 1427 	ld	-5 (ix),a
   2CD6 DD 6E FA      [19] 1428 	ld	l,-6 (ix)
   2CD9 DD 66 FB      [19] 1429 	ld	h,-5 (ix)
   2CDC 4E            [ 7] 1430 	ld	c,(hl)
   2CDD DD 7E FE      [19] 1431 	ld	a,-2 (ix)
   2CE0 C6 12         [ 7] 1432 	add	a, #0x12
   2CE2 DD 77 F8      [19] 1433 	ld	-8 (ix),a
   2CE5 DD 7E FF      [19] 1434 	ld	a,-1 (ix)
   2CE8 CE 00         [ 7] 1435 	adc	a, #0x00
   2CEA DD 77 F9      [19] 1436 	ld	-7 (ix),a
   2CED DD 6E F8      [19] 1437 	ld	l,-8 (ix)
   2CF0 DD 66 F9      [19] 1438 	ld	h,-7 (ix)
   2CF3 7E            [ 7] 1439 	ld	a,(hl)
   2CF4 DD 77 F6      [19] 1440 	ld	-10 (ix),a
   2CF7 23            [ 6] 1441 	inc	hl
   2CF8 7E            [ 7] 1442 	ld	a,(hl)
   2CF9 DD 77 F7      [19] 1443 	ld	-9 (ix),a
   2CFC DD 7E FE      [19] 1444 	ld	a,-2 (ix)
   2CFF C6 10         [ 7] 1445 	add	a, #0x10
   2D01 DD 77 F4      [19] 1446 	ld	-12 (ix),a
   2D04 DD 7E FF      [19] 1447 	ld	a,-1 (ix)
   2D07 CE 00         [ 7] 1448 	adc	a, #0x00
   2D09 DD 77 F5      [19] 1449 	ld	-11 (ix),a
   2D0C DD 6E F4      [19] 1450 	ld	l,-12 (ix)
   2D0F DD 66 F5      [19] 1451 	ld	h,-11 (ix)
   2D12 7E            [ 7] 1452 	ld	a,(hl)
   2D13 DD 77 F2      [19] 1453 	ld	-14 (ix),a
   2D16 23            [ 6] 1454 	inc	hl
   2D17 7E            [ 7] 1455 	ld	a,(hl)
   2D18 DD 77 F3      [19] 1456 	ld	-13 (ix),a
   2D1B D5            [11] 1457 	push	de
   2D1C C5            [11] 1458 	push	bc
   2D1D DD 6E F6      [19] 1459 	ld	l,-10 (ix)
   2D20 DD 66 F7      [19] 1460 	ld	h,-9 (ix)
   2D23 E5            [11] 1461 	push	hl
   2D24 DD 6E F2      [19] 1462 	ld	l,-14 (ix)
   2D27 DD 66 F3      [19] 1463 	ld	h,-13 (ix)
   2D2A E5            [11] 1464 	push	hl
   2D2B CD 2A 2C      [17] 1465 	call	_inside_screen
   2D2E F1            [10] 1466 	pop	af
   2D2F F1            [10] 1467 	pop	af
   2D30 F1            [10] 1468 	pop	af
   2D31 7D            [ 4] 1469 	ld	a,l
   2D32 D1            [10] 1470 	pop	de
   2D33 B7            [ 4] 1471 	or	a, a
   2D34 28 76         [12] 1472 	jr	Z,00108$
                           1473 ;src/entities/enemies.c:198: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   2D36 DD 6E F8      [19] 1474 	ld	l,-8 (ix)
   2D39 DD 66 F9      [19] 1475 	ld	h,-7 (ix)
   2D3C 4E            [ 7] 1476 	ld	c,(hl)
   2D3D 23            [ 6] 1477 	inc	hl
   2D3E 46            [ 7] 1478 	ld	b,(hl)
   2D3F DD 6E F4      [19] 1479 	ld	l,-12 (ix)
   2D42 DD 66 F5      [19] 1480 	ld	h,-11 (ix)
   2D45 7E            [ 7] 1481 	ld	a, (hl)
   2D46 23            [ 6] 1482 	inc	hl
   2D47 66            [ 7] 1483 	ld	h,(hl)
   2D48 6F            [ 4] 1484 	ld	l,a
   2D49 65            [ 4] 1485 	ld	h,l
   2D4A E5            [11] 1486 	push	hl
   2D4B DD 6E 04      [19] 1487 	ld	l,4 (ix)
   2D4E DD 66 05      [19] 1488 	ld	h,5 (ix)
   2D51 E5            [11] 1489 	push	hl
   2D52 FD E1         [14] 1490 	pop	iy
   2D54 E1            [10] 1491 	pop	hl
   2D55 D5            [11] 1492 	push	de
   2D56 79            [ 4] 1493 	ld	a,c
   2D57 F5            [11] 1494 	push	af
   2D58 33            [ 6] 1495 	inc	sp
   2D59 E5            [11] 1496 	push	hl
   2D5A 33            [ 6] 1497 	inc	sp
   2D5B FD E5         [15] 1498 	push	iy
   2D5D CD 11 4D      [17] 1499 	call	_cpct_getScreenPtr
   2D60 F1            [10] 1500 	pop	af
   2D61 F1            [10] 1501 	pop	af
   2D62 D1            [10] 1502 	pop	de
   2D63 4D            [ 4] 1503 	ld	c, l
   2D64 44            [ 4] 1504 	ld	b, h
                           1505 ;src/entities/enemies.c:199: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   2D65 DD 6E FC      [19] 1506 	ld	l,-4 (ix)
   2D68 DD 66 FD      [19] 1507 	ld	h,-3 (ix)
   2D6B 7E            [ 7] 1508 	ld	a,(hl)
   2D6C DD 77 F2      [19] 1509 	ld	-14 (ix),a
   2D6F DD 6E FA      [19] 1510 	ld	l,-6 (ix)
   2D72 DD 66 FB      [19] 1511 	ld	h,-5 (ix)
   2D75 7E            [ 7] 1512 	ld	a,(hl)
   2D76 DD 77 F4      [19] 1513 	ld	-12 (ix),a
   2D79 DD 71 F6      [19] 1514 	ld	-10 (ix),c
   2D7C DD 70 F7      [19] 1515 	ld	-9 (ix),b
   2D7F DD 6E FE      [19] 1516 	ld	l,-2 (ix)
   2D82 DD 66 FF      [19] 1517 	ld	h,-1 (ix)
   2D85 01 16 00      [10] 1518 	ld	bc, #0x0016
   2D88 09            [11] 1519 	add	hl, bc
   2D89 7E            [ 7] 1520 	ld	a,(hl)
   2D8A 87            [ 4] 1521 	add	a, a
   2D8B 4F            [ 4] 1522 	ld	c,a
   2D8C DD 6E FE      [19] 1523 	ld	l,-2 (ix)
   2D8F DD 66 FF      [19] 1524 	ld	h,-1 (ix)
   2D92 06 00         [ 7] 1525 	ld	b,#0x00
   2D94 09            [11] 1526 	add	hl, bc
   2D95 4E            [ 7] 1527 	ld	c,(hl)
   2D96 23            [ 6] 1528 	inc	hl
   2D97 46            [ 7] 1529 	ld	b,(hl)
   2D98 D5            [11] 1530 	push	de
   2D99 DD 66 F2      [19] 1531 	ld	h,-14 (ix)
   2D9C DD 6E F4      [19] 1532 	ld	l,-12 (ix)
   2D9F E5            [11] 1533 	push	hl
   2DA0 DD 6E F6      [19] 1534 	ld	l,-10 (ix)
   2DA3 DD 66 F7      [19] 1535 	ld	h,-9 (ix)
   2DA6 E5            [11] 1536 	push	hl
   2DA7 C5            [11] 1537 	push	bc
   2DA8 CD E8 4A      [17] 1538 	call	_cpct_drawSprite
   2DAB D1            [10] 1539 	pop	de
   2DAC                    1540 00108$:
                           1541 ;src/entities/enemies.c:196: for (k=0;k<MAX_ENEMIES;k++){
   2DAC 21 24 00      [10] 1542 	ld	hl,#0x0024
   2DAF 19            [11] 1543 	add	hl,de
   2DB0 EB            [ 4] 1544 	ex	de,hl
   2DB1 DD 34 F1      [23] 1545 	inc	-15 (ix)
   2DB4 DD 7E F1      [19] 1546 	ld	a,-15 (ix)
   2DB7 D6 1E         [ 7] 1547 	sub	a, #0x1E
   2DB9 DA 96 2C      [10] 1548 	jp	C,00107$
   2DBC                    1549 00109$:
   2DBC DD F9         [10] 1550 	ld	sp, ix
   2DBE DD E1         [14] 1551 	pop	ix
   2DC0 C9            [10] 1552 	ret
                           1553 	.area _CODE
                           1554 	.area _INITIALIZER
                           1555 	.area _CABS (ABS)
