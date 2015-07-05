                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jul  5 10:03:46 2015
                              5 ;--------------------------------------------------------
                              6 	.module enemies
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _draw_enemies
                             13 	.globl _update_enemies
                             14 	.globl _create_enemy
                             15 	.globl _init_enemies
                             16 	.globl _get_user_max_shoots
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_drawSprite
                             19 	.globl _active_enemies
                             20 	.globl _enemies
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   4084                      28 _enemies::
   4084                      29 	.ds 310
   41BA                      30 _active_enemies::
   41BA                      31 	.ds 1
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
                             56 ;src/entities/enemies.c:12: void init_enemies(){
                             57 ;	---------------------------------
                             58 ; Function init_enemies
                             59 ; ---------------------------------
   22C1                      60 _init_enemies::
   22C1 DD E5         [15]   61 	push	ix
   22C3 DD 21 00 00   [14]   62 	ld	ix,#0
   22C7 DD 39         [15]   63 	add	ix,sp
   22C9 3B            [ 6]   64 	dec	sp
                             65 ;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
   22CA DD 36 FF 00   [19]   66 	ld	-1 (ix),#0x00
   22CE 11 00 00      [10]   67 	ld	de,#0x0000
   22D1                      68 00102$:
                             69 ;src/entities/enemies.c:15: enemies[k].active=0;
   22D1 21 84 40      [10]   70 	ld	hl,#_enemies
   22D4 19            [11]   71 	add	hl,de
   22D5 4D            [ 4]   72 	ld	c,l
   22D6 44            [ 4]   73 	ld	b,h
   22D7 21 15 00      [10]   74 	ld	hl,#0x0015
   22DA 09            [11]   75 	add	hl,bc
   22DB 36 00         [10]   76 	ld	(hl),#0x00
                             77 ;src/entities/enemies.c:16: enemies[k].x=0;
   22DD 21 10 00      [10]   78 	ld	hl,#0x0010
   22E0 09            [11]   79 	add	hl,bc
   22E1 36 00         [10]   80 	ld	(hl),#0x00
                             81 ;src/entities/enemies.c:17: enemies[k].y=0;
   22E3 21 11 00      [10]   82 	ld	hl,#0x0011
   22E6 09            [11]   83 	add	hl,bc
   22E7 36 00         [10]   84 	ld	(hl),#0x00
                             85 ;src/entities/enemies.c:18: enemies[k].w=0;
   22E9 21 12 00      [10]   86 	ld	hl,#0x0012
   22EC 09            [11]   87 	add	hl,bc
   22ED 36 00         [10]   88 	ld	(hl),#0x00
                             89 ;src/entities/enemies.c:19: enemies[k].h=0;
   22EF 21 13 00      [10]   90 	ld	hl,#0x0013
   22F2 09            [11]   91 	add	hl,bc
   22F3 36 00         [10]   92 	ld	(hl),#0x00
                             93 ;src/entities/enemies.c:20: enemies[k].dir=0;
   22F5 21 14 00      [10]   94 	ld	hl,#0x0014
   22F8 09            [11]   95 	add	hl,bc
   22F9 36 00         [10]   96 	ld	(hl),#0x00
                             97 ;src/entities/enemies.c:21: enemies[k].frame=0;
   22FB 21 17 00      [10]   98 	ld	hl,#0x0017
   22FE 09            [11]   99 	add	hl,bc
   22FF 36 00         [10]  100 	ld	(hl),#0x00
                            101 ;src/entities/enemies.c:22: enemies[k].lastmoved=0;
   2301 21 1B 00      [10]  102 	ld	hl,#0x001B
   2304 09            [11]  103 	add	hl,bc
   2305 AF            [ 4]  104 	xor	a, a
   2306 77            [ 7]  105 	ld	(hl), a
   2307 23            [ 6]  106 	inc	hl
   2308 77            [ 7]  107 	ld	(hl), a
   2309 23            [ 6]  108 	inc	hl
   230A AF            [ 4]  109 	xor	a, a
   230B 77            [ 7]  110 	ld	(hl), a
   230C 23            [ 6]  111 	inc	hl
   230D 77            [ 7]  112 	ld	(hl), a
                            113 ;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
   230E 21 1F 00      [10]  114 	ld	hl,#0x001F
   2311 19            [11]  115 	add	hl,de
   2312 EB            [ 4]  116 	ex	de,hl
   2313 DD 34 FF      [23]  117 	inc	-1 (ix)
   2316 DD 7E FF      [19]  118 	ld	a,-1 (ix)
   2319 D6 0A         [ 7]  119 	sub	a, #0x0A
   231B 38 B4         [12]  120 	jr	C,00102$
                            121 ;src/entities/enemies.c:24: active_enemies=0;
   231D 21 BA 41      [10]  122 	ld	hl,#_active_enemies + 0
   2320 36 00         [10]  123 	ld	(hl), #0x00
   2322 33            [ 6]  124 	inc	sp
   2323 DD E1         [14]  125 	pop	ix
   2325 C9            [10]  126 	ret
                            127 ;src/entities/enemies.c:30: void create_enemy(u8 x, u8 y, u8 type){
                            128 ;	---------------------------------
                            129 ; Function create_enemy
                            130 ; ---------------------------------
   2326                     131 _create_enemy::
   2326 DD E5         [15]  132 	push	ix
   2328 DD 21 00 00   [14]  133 	ld	ix,#0
   232C DD 39         [15]  134 	add	ix,sp
   232E 21 E2 FF      [10]  135 	ld	hl,#-30
   2331 39            [11]  136 	add	hl,sp
   2332 F9            [ 6]  137 	ld	sp,hl
                            138 ;src/entities/enemies.c:32: if (active_enemies < get_user_max_shoots()){
   2333 CD 6F 2A      [17]  139 	call	_get_user_max_shoots
   2336 55            [ 4]  140 	ld	d,l
   2337 3A BA 41      [13]  141 	ld	a,(#_active_enemies + 0)
   233A 92            [ 4]  142 	sub	a, d
   233B D2 80 25      [10]  143 	jp	NC,00109$
                            144 ;src/entities/enemies.c:34: while (enemies[k].active){
   233E 11 00 00      [10]  145 	ld	de,#0x0000
   2341                     146 00101$:
   2341 21 84 40      [10]  147 	ld	hl,#_enemies
   2344 19            [11]  148 	add	hl,de
   2345 DD 75 FE      [19]  149 	ld	-2 (ix),l
   2348 DD 74 FF      [19]  150 	ld	-1 (ix),h
   234B DD 7E FE      [19]  151 	ld	a,-2 (ix)
   234E C6 15         [ 7]  152 	add	a, #0x15
   2350 6F            [ 4]  153 	ld	l,a
   2351 DD 7E FF      [19]  154 	ld	a,-1 (ix)
   2354 CE 00         [ 7]  155 	adc	a, #0x00
   2356 67            [ 4]  156 	ld	h,a
   2357 7E            [ 7]  157 	ld	a,(hl)
   2358 B7            [ 4]  158 	or	a, a
   2359 28 07         [12]  159 	jr	Z,00103$
                            160 ;src/entities/enemies.c:35: k++;
   235B 21 1F 00      [10]  161 	ld	hl,#0x001F
   235E 19            [11]  162 	add	hl,de
   235F EB            [ 4]  163 	ex	de,hl
   2360 18 DF         [12]  164 	jr	00101$
   2362                     165 00103$:
                            166 ;src/entities/enemies.c:37: enemies[k].active=1;
   2362 36 01         [10]  167 	ld	(hl),#0x01
                            168 ;src/entities/enemies.c:38: enemies[k].frame=0;
   2364 DD 7E FE      [19]  169 	ld	a,-2 (ix)
   2367 C6 17         [ 7]  170 	add	a, #0x17
   2369 6F            [ 4]  171 	ld	l,a
   236A DD 7E FF      [19]  172 	ld	a,-1 (ix)
   236D CE 00         [ 7]  173 	adc	a, #0x00
   236F 67            [ 4]  174 	ld	h,a
   2370 36 00         [10]  175 	ld	(hl),#0x00
                            176 ;src/entities/enemies.c:42: enemies[k].x=x;
   2372 DD 7E FE      [19]  177 	ld	a,-2 (ix)
   2375 C6 10         [ 7]  178 	add	a, #0x10
   2377 DD 77 FC      [19]  179 	ld	-4 (ix),a
   237A DD 7E FF      [19]  180 	ld	a,-1 (ix)
   237D CE 00         [ 7]  181 	adc	a, #0x00
   237F DD 77 FD      [19]  182 	ld	-3 (ix),a
                            183 ;src/entities/enemies.c:43: enemies[k].y=y;
   2382 DD 7E FE      [19]  184 	ld	a,-2 (ix)
   2385 C6 11         [ 7]  185 	add	a, #0x11
   2387 DD 77 FA      [19]  186 	ld	-6 (ix),a
   238A DD 7E FF      [19]  187 	ld	a,-1 (ix)
   238D CE 00         [ 7]  188 	adc	a, #0x00
   238F DD 77 FB      [19]  189 	ld	-5 (ix),a
                            190 ;src/entities/enemies.c:44: enemies[k].w=6;
   2392 DD 7E FE      [19]  191 	ld	a,-2 (ix)
   2395 C6 12         [ 7]  192 	add	a, #0x12
   2397 DD 77 F8      [19]  193 	ld	-8 (ix),a
   239A DD 7E FF      [19]  194 	ld	a,-1 (ix)
   239D CE 00         [ 7]  195 	adc	a, #0x00
   239F DD 77 F9      [19]  196 	ld	-7 (ix),a
                            197 ;src/entities/enemies.c:45: enemies[k].h=12;
   23A2 DD 7E FE      [19]  198 	ld	a,-2 (ix)
   23A5 C6 13         [ 7]  199 	add	a, #0x13
   23A7 DD 77 F6      [19]  200 	ld	-10 (ix),a
   23AA DD 7E FF      [19]  201 	ld	a,-1 (ix)
   23AD CE 00         [ 7]  202 	adc	a, #0x00
   23AF DD 77 F7      [19]  203 	ld	-9 (ix),a
                            204 ;src/entities/enemies.c:46: enemies[k].num_frames=0;
   23B2 DD 7E FE      [19]  205 	ld	a,-2 (ix)
   23B5 C6 16         [ 7]  206 	add	a, #0x16
   23B7 DD 77 F4      [19]  207 	ld	-12 (ix),a
   23BA DD 7E FF      [19]  208 	ld	a,-1 (ix)
   23BD CE 00         [ 7]  209 	adc	a, #0x00
   23BF DD 77 F5      [19]  210 	ld	-11 (ix),a
                            211 ;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   23C2 DD 7E FE      [19]  212 	ld	a,-2 (ix)
   23C5 C6 02         [ 7]  213 	add	a, #0x02
   23C7 DD 77 F2      [19]  214 	ld	-14 (ix),a
   23CA DD 7E FF      [19]  215 	ld	a,-1 (ix)
   23CD CE 00         [ 7]  216 	adc	a, #0x00
   23CF DD 77 F3      [19]  217 	ld	-13 (ix),a
                            218 ;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   23D2 DD 7E FE      [19]  219 	ld	a,-2 (ix)
   23D5 C6 04         [ 7]  220 	add	a, #0x04
   23D7 DD 77 F0      [19]  221 	ld	-16 (ix),a
   23DA DD 7E FF      [19]  222 	ld	a,-1 (ix)
   23DD CE 00         [ 7]  223 	adc	a, #0x00
   23DF DD 77 F1      [19]  224 	ld	-15 (ix),a
                            225 ;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   23E2 DD 7E FE      [19]  226 	ld	a,-2 (ix)
   23E5 C6 06         [ 7]  227 	add	a, #0x06
   23E7 DD 77 EE      [19]  228 	ld	-18 (ix),a
   23EA DD 7E FF      [19]  229 	ld	a,-1 (ix)
   23ED CE 00         [ 7]  230 	adc	a, #0x00
   23EF DD 77 EF      [19]  231 	ld	-17 (ix),a
                            232 ;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   23F2 DD 7E FE      [19]  233 	ld	a,-2 (ix)
   23F5 C6 08         [ 7]  234 	add	a, #0x08
   23F7 DD 77 EC      [19]  235 	ld	-20 (ix),a
   23FA DD 7E FF      [19]  236 	ld	a,-1 (ix)
   23FD CE 00         [ 7]  237 	adc	a, #0x00
   23FF DD 77 ED      [19]  238 	ld	-19 (ix),a
                            239 ;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2402 DD 7E FE      [19]  240 	ld	a,-2 (ix)
   2405 C6 0A         [ 7]  241 	add	a, #0x0A
   2407 DD 77 EA      [19]  242 	ld	-22 (ix),a
   240A DD 7E FF      [19]  243 	ld	a,-1 (ix)
   240D CE 00         [ 7]  244 	adc	a, #0x00
   240F DD 77 EB      [19]  245 	ld	-21 (ix),a
                            246 ;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2412 DD 7E FE      [19]  247 	ld	a,-2 (ix)
   2415 C6 0C         [ 7]  248 	add	a, #0x0C
   2417 DD 77 E8      [19]  249 	ld	-24 (ix),a
   241A DD 7E FF      [19]  250 	ld	a,-1 (ix)
   241D CE 00         [ 7]  251 	adc	a, #0x00
   241F DD 77 E9      [19]  252 	ld	-23 (ix),a
                            253 ;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2422 DD 7E FE      [19]  254 	ld	a,-2 (ix)
   2425 C6 0E         [ 7]  255 	add	a, #0x0E
   2427 DD 77 E6      [19]  256 	ld	-26 (ix),a
   242A DD 7E FF      [19]  257 	ld	a,-1 (ix)
   242D CE 00         [ 7]  258 	adc	a, #0x00
   242F DD 77 E7      [19]  259 	ld	-25 (ix),a
                            260 ;src/entities/enemies.c:55: enemies[k].trajectory=0;
   2432 DD 7E FE      [19]  261 	ld	a,-2 (ix)
   2435 C6 19         [ 7]  262 	add	a, #0x19
   2437 DD 77 E4      [19]  263 	ld	-28 (ix),a
   243A DD 7E FF      [19]  264 	ld	a,-1 (ix)
   243D CE 00         [ 7]  265 	adc	a, #0x00
   243F DD 77 E5      [19]  266 	ld	-27 (ix),a
                            267 ;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
   2442 DD 7E FE      [19]  268 	ld	a,-2 (ix)
   2445 C6 1A         [ 7]  269 	add	a, #0x1A
   2447 DD 77 E2      [19]  270 	ld	-30 (ix),a
   244A DD 7E FF      [19]  271 	ld	a,-1 (ix)
   244D CE 00         [ 7]  272 	adc	a, #0x00
   244F DD 77 E3      [19]  273 	ld	-29 (ix),a
                            274 ;src/entities/enemies.c:39: switch (type){
   2452 DD 7E 06      [19]  275 	ld	a,6 (ix)
   2455 3D            [ 4]  276 	dec	a
   2456 C2 EC 24      [10]  277 	jp	NZ,00105$
                            278 ;src/entities/enemies.c:42: enemies[k].x=x;
   2459 DD 6E FC      [19]  279 	ld	l,-4 (ix)
   245C DD 66 FD      [19]  280 	ld	h,-3 (ix)
   245F DD 7E 04      [19]  281 	ld	a,4 (ix)
   2462 77            [ 7]  282 	ld	(hl),a
                            283 ;src/entities/enemies.c:43: enemies[k].y=y;
   2463 DD 6E FA      [19]  284 	ld	l,-6 (ix)
   2466 DD 66 FB      [19]  285 	ld	h,-5 (ix)
   2469 DD 7E 05      [19]  286 	ld	a,5 (ix)
   246C 77            [ 7]  287 	ld	(hl),a
                            288 ;src/entities/enemies.c:44: enemies[k].w=6;
   246D DD 6E F8      [19]  289 	ld	l,-8 (ix)
   2470 DD 66 F9      [19]  290 	ld	h,-7 (ix)
   2473 36 06         [10]  291 	ld	(hl),#0x06
                            292 ;src/entities/enemies.c:45: enemies[k].h=12;
   2475 DD 6E F6      [19]  293 	ld	l,-10 (ix)
   2478 DD 66 F7      [19]  294 	ld	h,-9 (ix)
   247B 36 0C         [10]  295 	ld	(hl),#0x0C
                            296 ;src/entities/enemies.c:46: enemies[k].num_frames=0;
   247D DD 6E F4      [19]  297 	ld	l,-12 (ix)
   2480 DD 66 F5      [19]  298 	ld	h,-11 (ix)
   2483 36 00         [10]  299 	ld	(hl),#0x00
                            300 ;src/entities/enemies.c:47: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   2485 DD 6E FE      [19]  301 	ld	l,-2 (ix)
   2488 DD 66 FF      [19]  302 	ld	h,-1 (ix)
   248B 36 C0         [10]  303 	ld	(hl),#<(_G_baddie02_00)
   248D 23            [ 6]  304 	inc	hl
   248E 36 2F         [10]  305 	ld	(hl),#>(_G_baddie02_00)
                            306 ;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   2490 DD 6E F2      [19]  307 	ld	l,-14 (ix)
   2493 DD 66 F3      [19]  308 	ld	h,-13 (ix)
   2496 36 08         [10]  309 	ld	(hl),#<(_G_baddie02_01)
   2498 23            [ 6]  310 	inc	hl
   2499 36 30         [10]  311 	ld	(hl),#>(_G_baddie02_01)
                            312 ;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   249B DD 6E F0      [19]  313 	ld	l,-16 (ix)
   249E DD 66 F1      [19]  314 	ld	h,-15 (ix)
   24A1 36 50         [10]  315 	ld	(hl),#<(_G_baddie02_02)
   24A3 23            [ 6]  316 	inc	hl
   24A4 36 30         [10]  317 	ld	(hl),#>(_G_baddie02_02)
                            318 ;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24A6 DD 6E EE      [19]  319 	ld	l,-18 (ix)
   24A9 DD 66 EF      [19]  320 	ld	h,-17 (ix)
   24AC 36 98         [10]  321 	ld	(hl),#<(_G_baddie02_03)
   24AE 23            [ 6]  322 	inc	hl
   24AF 36 30         [10]  323 	ld	(hl),#>(_G_baddie02_03)
                            324 ;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   24B1 DD 6E EC      [19]  325 	ld	l,-20 (ix)
   24B4 DD 66 ED      [19]  326 	ld	h,-19 (ix)
   24B7 36 E0         [10]  327 	ld	(hl),#<(_G_baddie02_04)
   24B9 23            [ 6]  328 	inc	hl
   24BA 36 30         [10]  329 	ld	(hl),#>(_G_baddie02_04)
                            330 ;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   24BC DD 6E EA      [19]  331 	ld	l,-22 (ix)
   24BF DD 66 EB      [19]  332 	ld	h,-21 (ix)
   24C2 36 28         [10]  333 	ld	(hl),#<(_G_baddie02_05)
   24C4 23            [ 6]  334 	inc	hl
   24C5 36 31         [10]  335 	ld	(hl),#>(_G_baddie02_05)
                            336 ;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   24C7 DD 6E E8      [19]  337 	ld	l,-24 (ix)
   24CA DD 66 E9      [19]  338 	ld	h,-23 (ix)
   24CD 36 70         [10]  339 	ld	(hl),#<(_G_baddie02_06)
   24CF 23            [ 6]  340 	inc	hl
   24D0 36 31         [10]  341 	ld	(hl),#>(_G_baddie02_06)
                            342 ;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   24D2 DD 6E E6      [19]  343 	ld	l,-26 (ix)
   24D5 DD 66 E7      [19]  344 	ld	h,-25 (ix)
   24D8 36 B8         [10]  345 	ld	(hl),#<(_G_baddie02_07)
   24DA 23            [ 6]  346 	inc	hl
   24DB 36 31         [10]  347 	ld	(hl),#>(_G_baddie02_07)
                            348 ;src/entities/enemies.c:55: enemies[k].trajectory=0;
   24DD DD 6E E4      [19]  349 	ld	l,-28 (ix)
   24E0 DD 66 E5      [19]  350 	ld	h,-27 (ix)
   24E3 36 00         [10]  351 	ld	(hl),#0x00
                            352 ;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
   24E5 E1            [10]  353 	pop	hl
   24E6 E5            [11]  354 	push	hl
   24E7 36 00         [10]  355 	ld	(hl),#0x00
                            356 ;src/entities/enemies.c:57: break;
   24E9 C3 7C 25      [10]  357 	jp	00106$
                            358 ;src/entities/enemies.c:58: default:
   24EC                     359 00105$:
                            360 ;src/entities/enemies.c:59: enemies[k].x=x;
   24EC DD 6E FC      [19]  361 	ld	l,-4 (ix)
   24EF DD 66 FD      [19]  362 	ld	h,-3 (ix)
   24F2 DD 7E 04      [19]  363 	ld	a,4 (ix)
   24F5 77            [ 7]  364 	ld	(hl),a
                            365 ;src/entities/enemies.c:60: enemies[k].y=y;
   24F6 DD 6E FA      [19]  366 	ld	l,-6 (ix)
   24F9 DD 66 FB      [19]  367 	ld	h,-5 (ix)
   24FC DD 7E 05      [19]  368 	ld	a,5 (ix)
   24FF 77            [ 7]  369 	ld	(hl),a
                            370 ;src/entities/enemies.c:61: enemies[k].w=5;
   2500 DD 6E F8      [19]  371 	ld	l,-8 (ix)
   2503 DD 66 F9      [19]  372 	ld	h,-7 (ix)
   2506 36 05         [10]  373 	ld	(hl),#0x05
                            374 ;src/entities/enemies.c:62: enemies[k].h=16;
   2508 DD 6E F6      [19]  375 	ld	l,-10 (ix)
   250B DD 66 F7      [19]  376 	ld	h,-9 (ix)
   250E 36 10         [10]  377 	ld	(hl),#0x10
                            378 ;src/entities/enemies.c:63: enemies[k].num_frames=0;
   2510 DD 6E F4      [19]  379 	ld	l,-12 (ix)
   2513 DD 66 F5      [19]  380 	ld	h,-11 (ix)
   2516 36 00         [10]  381 	ld	(hl),#0x00
                            382 ;src/entities/enemies.c:64: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2518 DD 6E FE      [19]  383 	ld	l,-2 (ix)
   251B DD 66 FF      [19]  384 	ld	h,-1 (ix)
   251E 36 40         [10]  385 	ld	(hl),#<(_G_baddie01_00)
   2520 23            [ 6]  386 	inc	hl
   2521 36 2D         [10]  387 	ld	(hl),#>(_G_baddie01_00)
                            388 ;src/entities/enemies.c:65: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   2523 DD 6E F2      [19]  389 	ld	l,-14 (ix)
   2526 DD 66 F3      [19]  390 	ld	h,-13 (ix)
   2529 36 90         [10]  391 	ld	(hl),#<(_G_baddie01_01)
   252B 23            [ 6]  392 	inc	hl
   252C 36 2D         [10]  393 	ld	(hl),#>(_G_baddie01_01)
                            394 ;src/entities/enemies.c:66: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   252E DD 6E F0      [19]  395 	ld	l,-16 (ix)
   2531 DD 66 F1      [19]  396 	ld	h,-15 (ix)
   2534 36 E0         [10]  397 	ld	(hl),#<(_G_baddie01_02)
   2536 23            [ 6]  398 	inc	hl
   2537 36 2D         [10]  399 	ld	(hl),#>(_G_baddie01_02)
                            400 ;src/entities/enemies.c:67: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2539 DD 6E EE      [19]  401 	ld	l,-18 (ix)
   253C DD 66 EF      [19]  402 	ld	h,-17 (ix)
   253F 36 30         [10]  403 	ld	(hl),#<(_G_baddie01_03)
   2541 23            [ 6]  404 	inc	hl
   2542 36 2E         [10]  405 	ld	(hl),#>(_G_baddie01_03)
                            406 ;src/entities/enemies.c:68: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   2544 DD 6E EC      [19]  407 	ld	l,-20 (ix)
   2547 DD 66 ED      [19]  408 	ld	h,-19 (ix)
   254A 36 80         [10]  409 	ld	(hl),#<(_G_baddie01_04)
   254C 23            [ 6]  410 	inc	hl
   254D 36 2E         [10]  411 	ld	(hl),#>(_G_baddie01_04)
                            412 ;src/entities/enemies.c:69: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   254F DD 6E EA      [19]  413 	ld	l,-22 (ix)
   2552 DD 66 EB      [19]  414 	ld	h,-21 (ix)
   2555 36 D0         [10]  415 	ld	(hl),#<(_G_baddie01_05)
   2557 23            [ 6]  416 	inc	hl
   2558 36 2E         [10]  417 	ld	(hl),#>(_G_baddie01_05)
                            418 ;src/entities/enemies.c:70: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   255A DD 6E E8      [19]  419 	ld	l,-24 (ix)
   255D DD 66 E9      [19]  420 	ld	h,-23 (ix)
   2560 36 20         [10]  421 	ld	(hl),#<(_G_baddie01_06)
   2562 23            [ 6]  422 	inc	hl
   2563 36 2F         [10]  423 	ld	(hl),#>(_G_baddie01_06)
                            424 ;src/entities/enemies.c:71: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2565 DD 6E E6      [19]  425 	ld	l,-26 (ix)
   2568 DD 66 E7      [19]  426 	ld	h,-25 (ix)
   256B 36 70         [10]  427 	ld	(hl),#<(_G_baddie01_07)
   256D 23            [ 6]  428 	inc	hl
   256E 36 2F         [10]  429 	ld	(hl),#>(_G_baddie01_07)
                            430 ;src/entities/enemies.c:72: enemies[k].trajectory=0;
   2570 DD 6E E4      [19]  431 	ld	l,-28 (ix)
   2573 DD 66 E5      [19]  432 	ld	h,-27 (ix)
   2576 36 00         [10]  433 	ld	(hl),#0x00
                            434 ;src/entities/enemies.c:73: enemies[k].trajectory_step=0;
   2578 E1            [10]  435 	pop	hl
   2579 E5            [11]  436 	push	hl
   257A 36 00         [10]  437 	ld	(hl),#0x00
                            438 ;src/entities/enemies.c:75: }
   257C                     439 00106$:
                            440 ;src/entities/enemies.c:76: active_enemies++;
   257C 21 BA 41      [10]  441 	ld	hl, #_active_enemies+0
   257F 34            [11]  442 	inc	(hl)
   2580                     443 00109$:
   2580 DD F9         [10]  444 	ld	sp, ix
   2582 DD E1         [14]  445 	pop	ix
   2584 C9            [10]  446 	ret
                            447 ;src/entities/enemies.c:85: void update_enemies(){
                            448 ;	---------------------------------
                            449 ; Function update_enemies
                            450 ; ---------------------------------
   2585                     451 _update_enemies::
   2585 DD E5         [15]  452 	push	ix
   2587 DD 21 00 00   [14]  453 	ld	ix,#0
   258B DD 39         [15]  454 	add	ix,sp
   258D F5            [11]  455 	push	af
   258E 3B            [ 6]  456 	dec	sp
                            457 ;src/entities/enemies.c:88: if (active_enemies>0){
   258F 3A BA 41      [13]  458 	ld	a,(#_active_enemies + 0)
   2592 B7            [ 4]  459 	or	a, a
   2593 CA 16 26      [10]  460 	jp	Z,00113$
                            461 ;src/entities/enemies.c:89: for (i=0;i<MAX_SHOOTS;i++){
   2596 DD 36 FD 00   [19]  462 	ld	-3 (ix),#0x00
   259A 11 00 00      [10]  463 	ld	de,#0x0000
   259D                     464 00111$:
                            465 ;src/entities/enemies.c:90: if (enemies[i].active){
   259D 21 84 40      [10]  466 	ld	hl,#_enemies
   25A0 19            [11]  467 	add	hl,de
   25A1 DD 75 FE      [19]  468 	ld	-2 (ix),l
   25A4 DD 74 FF      [19]  469 	ld	-1 (ix),h
   25A7 DD 7E FE      [19]  470 	ld	a,-2 (ix)
   25AA C6 15         [ 7]  471 	add	a, #0x15
   25AC 4F            [ 4]  472 	ld	c,a
   25AD DD 7E FF      [19]  473 	ld	a,-1 (ix)
   25B0 CE 00         [ 7]  474 	adc	a, #0x00
   25B2 47            [ 4]  475 	ld	b,a
   25B3 0A            [ 7]  476 	ld	a,(bc)
   25B4 B7            [ 4]  477 	or	a, a
   25B5 28 50         [12]  478 	jr	Z,00112$
                            479 ;src/entities/enemies.c:91: enemies[i].y-=SHOOT_JUMP;
   25B7 FD 21 11 00   [14]  480 	ld	iy,#0x0011
   25BB C5            [11]  481 	push	bc
   25BC DD 4E FE      [19]  482 	ld	c,-2 (ix)
   25BF DD 46 FF      [19]  483 	ld	b,-1 (ix)
   25C2 FD 09         [15]  484 	add	iy, bc
   25C4 C1            [10]  485 	pop	bc
   25C5 FD 7E 00      [19]  486 	ld	a, 0 (iy)
   25C8 C6 F6         [ 7]  487 	add	a,#0xF6
   25CA 67            [ 4]  488 	ld	h,a
   25CB FD 74 00      [19]  489 	ld	0 (iy), h
                            490 ;src/entities/enemies.c:92: if (enemies[i].y<200){
   25CE 7C            [ 4]  491 	ld	a,h
   25CF D6 C8         [ 7]  492 	sub	a, #0xC8
   25D1 30 2E         [12]  493 	jr	NC,00104$
                            494 ;src/entities/enemies.c:93: enemies[i].frame++;
   25D3 FD 21 17 00   [14]  495 	ld	iy,#0x0017
   25D7 DD 4E FE      [19]  496 	ld	c,-2 (ix)
   25DA DD 46 FF      [19]  497 	ld	b,-1 (ix)
   25DD FD 09         [15]  498 	add	iy, bc
   25DF FD 34 00      [23]  499 	inc	0 (iy)
   25E2 FD 4E 00      [19]  500 	ld	c, 0 (iy)
                            501 ;src/entities/enemies.c:94: if (enemies[i].frame==enemies[i].num_frames)
   25E5 DD 6E FE      [19]  502 	ld	l,-2 (ix)
   25E8 DD 66 FF      [19]  503 	ld	h,-1 (ix)
   25EB C5            [11]  504 	push	bc
   25EC 01 16 00      [10]  505 	ld	bc, #0x0016
   25EF 09            [11]  506 	add	hl, bc
   25F0 C1            [10]  507 	pop	bc
   25F1 7E            [ 7]  508 	ld	a,(hl)
   25F2 DD 77 FE      [19]  509 	ld	-2 (ix),a
   25F5 79            [ 4]  510 	ld	a,c
   25F6 DD 96 FE      [19]  511 	sub	a, -2 (ix)
   25F9 20 0C         [12]  512 	jr	NZ,00112$
                            513 ;src/entities/enemies.c:95: enemies[i].frame=0;
   25FB FD 36 00 00   [19]  514 	ld	0 (iy), #0x00
   25FF 18 06         [12]  515 	jr	00112$
   2601                     516 00104$:
                            517 ;src/entities/enemies.c:98: enemies[i].active=0;
   2601 AF            [ 4]  518 	xor	a, a
   2602 02            [ 7]  519 	ld	(bc),a
                            520 ;src/entities/enemies.c:99: active_enemies--;
   2603 21 BA 41      [10]  521 	ld	hl, #_active_enemies+0
   2606 35            [11]  522 	dec	(hl)
   2607                     523 00112$:
                            524 ;src/entities/enemies.c:89: for (i=0;i<MAX_SHOOTS;i++){
   2607 21 1F 00      [10]  525 	ld	hl,#0x001F
   260A 19            [11]  526 	add	hl,de
   260B EB            [ 4]  527 	ex	de,hl
   260C DD 34 FD      [23]  528 	inc	-3 (ix)
   260F DD 7E FD      [19]  529 	ld	a,-3 (ix)
   2612 D6 0A         [ 7]  530 	sub	a, #0x0A
   2614 38 87         [12]  531 	jr	C,00111$
   2616                     532 00113$:
   2616 DD F9         [10]  533 	ld	sp, ix
   2618 DD E1         [14]  534 	pop	ix
   261A C9            [10]  535 	ret
                            536 ;src/entities/enemies.c:111: void draw_enemies(u8* screen){
                            537 ;	---------------------------------
                            538 ; Function draw_enemies
                            539 ; ---------------------------------
   261B                     540 _draw_enemies::
   261B DD E5         [15]  541 	push	ix
   261D DD 21 00 00   [14]  542 	ld	ix,#0
   2621 DD 39         [15]  543 	add	ix,sp
   2623 21 F9 FF      [10]  544 	ld	hl,#-7
   2626 39            [11]  545 	add	hl,sp
   2627 F9            [ 6]  546 	ld	sp,hl
                            547 ;src/entities/enemies.c:116: if (active_enemies>0){
   2628 3A BA 41      [13]  548 	ld	a,(#_active_enemies + 0)
   262B B7            [ 4]  549 	or	a, a
   262C CA E6 26      [10]  550 	jp	Z,00108$
                            551 ;src/entities/enemies.c:117: for (k=0;k<MAX_SHOOTS;k++){
   262F DD 36 F9 00   [19]  552 	ld	-7 (ix),#0x00
   2633 11 00 00      [10]  553 	ld	de,#0x0000
   2636                     554 00106$:
                            555 ;src/entities/enemies.c:118: if (enemies[k].active){
   2636 21 84 40      [10]  556 	ld	hl,#_enemies
   2639 19            [11]  557 	add	hl,de
   263A DD 75 FC      [19]  558 	ld	-4 (ix),l
   263D DD 74 FD      [19]  559 	ld	-3 (ix),h
   2640 DD 6E FC      [19]  560 	ld	l,-4 (ix)
   2643 DD 66 FD      [19]  561 	ld	h,-3 (ix)
   2646 01 15 00      [10]  562 	ld	bc, #0x0015
   2649 09            [11]  563 	add	hl, bc
   264A 7E            [ 7]  564 	ld	a,(hl)
   264B B7            [ 4]  565 	or	a, a
   264C CA D6 26      [10]  566 	jp	Z,00107$
                            567 ;src/entities/enemies.c:119: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   264F DD 6E FC      [19]  568 	ld	l,-4 (ix)
   2652 DD 66 FD      [19]  569 	ld	h,-3 (ix)
   2655 01 11 00      [10]  570 	ld	bc, #0x0011
   2658 09            [11]  571 	add	hl, bc
   2659 46            [ 7]  572 	ld	b,(hl)
   265A DD 6E FC      [19]  573 	ld	l,-4 (ix)
   265D DD 66 FD      [19]  574 	ld	h,-3 (ix)
   2660 C5            [11]  575 	push	bc
   2661 01 10 00      [10]  576 	ld	bc, #0x0010
   2664 09            [11]  577 	add	hl, bc
   2665 C1            [10]  578 	pop	bc
   2666 4E            [ 7]  579 	ld	c,(hl)
   2667 E5            [11]  580 	push	hl
   2668 DD 6E 04      [19]  581 	ld	l,4 (ix)
   266B DD 66 05      [19]  582 	ld	h,5 (ix)
   266E E5            [11]  583 	push	hl
   266F FD E1         [14]  584 	pop	iy
   2671 E1            [10]  585 	pop	hl
   2672 D5            [11]  586 	push	de
   2673 C5            [11]  587 	push	bc
   2674 FD E5         [15]  588 	push	iy
   2676 CD E6 3E      [17]  589 	call	_cpct_getScreenPtr
   2679 F1            [10]  590 	pop	af
   267A F1            [10]  591 	pop	af
   267B D1            [10]  592 	pop	de
   267C 45            [ 4]  593 	ld	b,l
   267D 4C            [ 4]  594 	ld	c,h
                            595 ;src/entities/enemies.c:120: cpct_drawSprite(enemies[k].sprite[enemies[k].dirº],pscreen,enemies[k].w,enemies[k].h);
   267E DD 6E FC      [19]  596 	ld	l,-4 (ix)
   2681 DD 66 FD      [19]  597 	ld	h,-3 (ix)
   2684 C5            [11]  598 	push	bc
   2685 01 13 00      [10]  599 	ld	bc, #0x0013
   2688 09            [11]  600 	add	hl, bc
   2689 C1            [10]  601 	pop	bc
   268A 7E            [ 7]  602 	ld	a,(hl)
   268B DD 77 FA      [19]  603 	ld	-6 (ix),a
   268E DD 6E FC      [19]  604 	ld	l,-4 (ix)
   2691 DD 66 FD      [19]  605 	ld	h,-3 (ix)
   2694 C5            [11]  606 	push	bc
   2695 01 12 00      [10]  607 	ld	bc, #0x0012
   2698 09            [11]  608 	add	hl, bc
   2699 C1            [10]  609 	pop	bc
   269A 7E            [ 7]  610 	ld	a,(hl)
   269B DD 77 FB      [19]  611 	ld	-5 (ix),a
   269E DD 70 FE      [19]  612 	ld	-2 (ix),b
   26A1 DD 71 FF      [19]  613 	ld	-1 (ix),c
   26A4 DD 6E FC      [19]  614 	ld	l,-4 (ix)
   26A7 DD 66 FD      [19]  615 	ld	h,-3 (ix)
   26AA 01 14 00      [10]  616 	ld	bc, #0x0014
   26AD 09            [11]  617 	add	hl, bc
   26AE 7E            [ 7]  618 	ld	a,(hl)
   26AF 87            [ 4]  619 	add	a, a
   26B0 4F            [ 4]  620 	ld	c,a
   26B1 DD 6E FC      [19]  621 	ld	l,-4 (ix)
   26B4 DD 66 FD      [19]  622 	ld	h,-3 (ix)
   26B7 06 00         [ 7]  623 	ld	b,#0x00
   26B9 09            [11]  624 	add	hl, bc
   26BA 4E            [ 7]  625 	ld	c,(hl)
   26BB 23            [ 6]  626 	inc	hl
   26BC 46            [ 7]  627 	ld	b,(hl)
   26BD D5            [11]  628 	push	de
   26BE DD 66 FA      [19]  629 	ld	h,-6 (ix)
   26C1 DD 6E FB      [19]  630 	ld	l,-5 (ix)
   26C4 E5            [11]  631 	push	hl
   26C5 DD 6E FE      [19]  632 	ld	l,-2 (ix)
   26C8 DD 66 FF      [19]  633 	ld	h,-1 (ix)
   26CB E5            [11]  634 	push	hl
   26CC C5            [11]  635 	push	bc
   26CD CD B7 3C      [17]  636 	call	_cpct_drawSprite
   26D0 21 06 00      [10]  637 	ld	hl,#6
   26D3 39            [11]  638 	add	hl,sp
   26D4 F9            [ 6]  639 	ld	sp,hl
   26D5 D1            [10]  640 	pop	de
   26D6                     641 00107$:
                            642 ;src/entities/enemies.c:117: for (k=0;k<MAX_SHOOTS;k++){
   26D6 21 1F 00      [10]  643 	ld	hl,#0x001F
   26D9 19            [11]  644 	add	hl,de
   26DA EB            [ 4]  645 	ex	de,hl
   26DB DD 34 F9      [23]  646 	inc	-7 (ix)
   26DE DD 7E F9      [19]  647 	ld	a,-7 (ix)
   26E1 D6 0A         [ 7]  648 	sub	a, #0x0A
   26E3 DA 36 26      [10]  649 	jp	C,00106$
   26E6                     650 00108$:
   26E6 DD F9         [10]  651 	ld	sp, ix
   26E8 DD E1         [14]  652 	pop	ix
   26EA C9            [10]  653 	ret
                            654 	.area _CODE
                            655 	.area _INITIALIZER
                            656 	.area _CABS (ABS)
