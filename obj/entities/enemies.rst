                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jul  5 16:12:44 2015
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
   428A                      28 _enemies::
   428A                      29 	.ds 310
   43C0                      30 _active_enemies::
   43C0                      31 	.ds 1
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
   22CF                      60 _init_enemies::
   22CF DD E5         [15]   61 	push	ix
   22D1 DD 21 00 00   [14]   62 	ld	ix,#0
   22D5 DD 39         [15]   63 	add	ix,sp
   22D7 3B            [ 6]   64 	dec	sp
                             65 ;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
   22D8 DD 36 FF 00   [19]   66 	ld	-1 (ix),#0x00
   22DC 11 00 00      [10]   67 	ld	de,#0x0000
   22DF                      68 00102$:
                             69 ;src/entities/enemies.c:15: enemies[k].active=0;
   22DF 21 8A 42      [10]   70 	ld	hl,#_enemies
   22E2 19            [11]   71 	add	hl,de
   22E3 4D            [ 4]   72 	ld	c,l
   22E4 44            [ 4]   73 	ld	b,h
   22E5 21 15 00      [10]   74 	ld	hl,#0x0015
   22E8 09            [11]   75 	add	hl,bc
   22E9 36 00         [10]   76 	ld	(hl),#0x00
                             77 ;src/entities/enemies.c:16: enemies[k].x=0;
   22EB 21 10 00      [10]   78 	ld	hl,#0x0010
   22EE 09            [11]   79 	add	hl,bc
   22EF 36 00         [10]   80 	ld	(hl),#0x00
                             81 ;src/entities/enemies.c:17: enemies[k].y=0;
   22F1 21 11 00      [10]   82 	ld	hl,#0x0011
   22F4 09            [11]   83 	add	hl,bc
   22F5 36 00         [10]   84 	ld	(hl),#0x00
                             85 ;src/entities/enemies.c:18: enemies[k].w=0;
   22F7 21 12 00      [10]   86 	ld	hl,#0x0012
   22FA 09            [11]   87 	add	hl,bc
   22FB 36 00         [10]   88 	ld	(hl),#0x00
                             89 ;src/entities/enemies.c:19: enemies[k].h=0;
   22FD 21 13 00      [10]   90 	ld	hl,#0x0013
   2300 09            [11]   91 	add	hl,bc
   2301 36 00         [10]   92 	ld	(hl),#0x00
                             93 ;src/entities/enemies.c:20: enemies[k].dir=0;
   2303 21 14 00      [10]   94 	ld	hl,#0x0014
   2306 09            [11]   95 	add	hl,bc
   2307 36 00         [10]   96 	ld	(hl),#0x00
                             97 ;src/entities/enemies.c:21: enemies[k].frame=0;
   2309 21 17 00      [10]   98 	ld	hl,#0x0017
   230C 09            [11]   99 	add	hl,bc
   230D 36 00         [10]  100 	ld	(hl),#0x00
                            101 ;src/entities/enemies.c:22: enemies[k].lastmoved=0;
   230F 21 1B 00      [10]  102 	ld	hl,#0x001B
   2312 09            [11]  103 	add	hl,bc
   2313 AF            [ 4]  104 	xor	a, a
   2314 77            [ 7]  105 	ld	(hl), a
   2315 23            [ 6]  106 	inc	hl
   2316 77            [ 7]  107 	ld	(hl), a
   2317 23            [ 6]  108 	inc	hl
   2318 AF            [ 4]  109 	xor	a, a
   2319 77            [ 7]  110 	ld	(hl), a
   231A 23            [ 6]  111 	inc	hl
   231B 77            [ 7]  112 	ld	(hl), a
                            113 ;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
   231C 21 1F 00      [10]  114 	ld	hl,#0x001F
   231F 19            [11]  115 	add	hl,de
   2320 EB            [ 4]  116 	ex	de,hl
   2321 DD 34 FF      [23]  117 	inc	-1 (ix)
   2324 DD 7E FF      [19]  118 	ld	a,-1 (ix)
   2327 D6 0A         [ 7]  119 	sub	a, #0x0A
   2329 38 B4         [12]  120 	jr	C,00102$
                            121 ;src/entities/enemies.c:24: active_enemies=0;
   232B 21 C0 43      [10]  122 	ld	hl,#_active_enemies + 0
   232E 36 00         [10]  123 	ld	(hl), #0x00
   2330 33            [ 6]  124 	inc	sp
   2331 DD E1         [14]  125 	pop	ix
   2333 C9            [10]  126 	ret
                            127 ;src/entities/enemies.c:30: void create_enemy(u8 x, u8 y, u8 type){
                            128 ;	---------------------------------
                            129 ; Function create_enemy
                            130 ; ---------------------------------
   2334                     131 _create_enemy::
   2334 DD E5         [15]  132 	push	ix
   2336 DD 21 00 00   [14]  133 	ld	ix,#0
   233A DD 39         [15]  134 	add	ix,sp
   233C 21 E2 FF      [10]  135 	ld	hl,#-30
   233F 39            [11]  136 	add	hl,sp
   2340 F9            [ 6]  137 	ld	sp,hl
                            138 ;src/entities/enemies.c:32: if (active_enemies < get_user_max_shoots()){
   2341 CD 2C 2C      [17]  139 	call	_get_user_max_shoots
   2344 55            [ 4]  140 	ld	d,l
   2345 3A C0 43      [13]  141 	ld	a,(#_active_enemies + 0)
   2348 92            [ 4]  142 	sub	a, d
   2349 D2 8E 25      [10]  143 	jp	NC,00109$
                            144 ;src/entities/enemies.c:34: while (enemies[k].active){
   234C 11 00 00      [10]  145 	ld	de,#0x0000
   234F                     146 00101$:
   234F 21 8A 42      [10]  147 	ld	hl,#_enemies
   2352 19            [11]  148 	add	hl,de
   2353 DD 75 FE      [19]  149 	ld	-2 (ix),l
   2356 DD 74 FF      [19]  150 	ld	-1 (ix),h
   2359 DD 7E FE      [19]  151 	ld	a,-2 (ix)
   235C C6 15         [ 7]  152 	add	a, #0x15
   235E 6F            [ 4]  153 	ld	l,a
   235F DD 7E FF      [19]  154 	ld	a,-1 (ix)
   2362 CE 00         [ 7]  155 	adc	a, #0x00
   2364 67            [ 4]  156 	ld	h,a
   2365 7E            [ 7]  157 	ld	a,(hl)
   2366 B7            [ 4]  158 	or	a, a
   2367 28 07         [12]  159 	jr	Z,00103$
                            160 ;src/entities/enemies.c:35: k++;
   2369 21 1F 00      [10]  161 	ld	hl,#0x001F
   236C 19            [11]  162 	add	hl,de
   236D EB            [ 4]  163 	ex	de,hl
   236E 18 DF         [12]  164 	jr	00101$
   2370                     165 00103$:
                            166 ;src/entities/enemies.c:37: enemies[k].active=1;
   2370 36 01         [10]  167 	ld	(hl),#0x01
                            168 ;src/entities/enemies.c:38: enemies[k].frame=0;
   2372 DD 7E FE      [19]  169 	ld	a,-2 (ix)
   2375 C6 17         [ 7]  170 	add	a, #0x17
   2377 6F            [ 4]  171 	ld	l,a
   2378 DD 7E FF      [19]  172 	ld	a,-1 (ix)
   237B CE 00         [ 7]  173 	adc	a, #0x00
   237D 67            [ 4]  174 	ld	h,a
   237E 36 00         [10]  175 	ld	(hl),#0x00
                            176 ;src/entities/enemies.c:42: enemies[k].x=x;
   2380 DD 7E FE      [19]  177 	ld	a,-2 (ix)
   2383 C6 10         [ 7]  178 	add	a, #0x10
   2385 DD 77 FC      [19]  179 	ld	-4 (ix),a
   2388 DD 7E FF      [19]  180 	ld	a,-1 (ix)
   238B CE 00         [ 7]  181 	adc	a, #0x00
   238D DD 77 FD      [19]  182 	ld	-3 (ix),a
                            183 ;src/entities/enemies.c:43: enemies[k].y=y;
   2390 DD 7E FE      [19]  184 	ld	a,-2 (ix)
   2393 C6 11         [ 7]  185 	add	a, #0x11
   2395 DD 77 FA      [19]  186 	ld	-6 (ix),a
   2398 DD 7E FF      [19]  187 	ld	a,-1 (ix)
   239B CE 00         [ 7]  188 	adc	a, #0x00
   239D DD 77 FB      [19]  189 	ld	-5 (ix),a
                            190 ;src/entities/enemies.c:44: enemies[k].w=6;
   23A0 DD 7E FE      [19]  191 	ld	a,-2 (ix)
   23A3 C6 12         [ 7]  192 	add	a, #0x12
   23A5 DD 77 F8      [19]  193 	ld	-8 (ix),a
   23A8 DD 7E FF      [19]  194 	ld	a,-1 (ix)
   23AB CE 00         [ 7]  195 	adc	a, #0x00
   23AD DD 77 F9      [19]  196 	ld	-7 (ix),a
                            197 ;src/entities/enemies.c:45: enemies[k].h=12;
   23B0 DD 7E FE      [19]  198 	ld	a,-2 (ix)
   23B3 C6 13         [ 7]  199 	add	a, #0x13
   23B5 DD 77 F6      [19]  200 	ld	-10 (ix),a
   23B8 DD 7E FF      [19]  201 	ld	a,-1 (ix)
   23BB CE 00         [ 7]  202 	adc	a, #0x00
   23BD DD 77 F7      [19]  203 	ld	-9 (ix),a
                            204 ;src/entities/enemies.c:46: enemies[k].num_frames=0;
   23C0 DD 7E FE      [19]  205 	ld	a,-2 (ix)
   23C3 C6 16         [ 7]  206 	add	a, #0x16
   23C5 DD 77 F4      [19]  207 	ld	-12 (ix),a
   23C8 DD 7E FF      [19]  208 	ld	a,-1 (ix)
   23CB CE 00         [ 7]  209 	adc	a, #0x00
   23CD DD 77 F5      [19]  210 	ld	-11 (ix),a
                            211 ;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   23D0 DD 7E FE      [19]  212 	ld	a,-2 (ix)
   23D3 C6 02         [ 7]  213 	add	a, #0x02
   23D5 DD 77 F2      [19]  214 	ld	-14 (ix),a
   23D8 DD 7E FF      [19]  215 	ld	a,-1 (ix)
   23DB CE 00         [ 7]  216 	adc	a, #0x00
   23DD DD 77 F3      [19]  217 	ld	-13 (ix),a
                            218 ;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   23E0 DD 7E FE      [19]  219 	ld	a,-2 (ix)
   23E3 C6 04         [ 7]  220 	add	a, #0x04
   23E5 DD 77 F0      [19]  221 	ld	-16 (ix),a
   23E8 DD 7E FF      [19]  222 	ld	a,-1 (ix)
   23EB CE 00         [ 7]  223 	adc	a, #0x00
   23ED DD 77 F1      [19]  224 	ld	-15 (ix),a
                            225 ;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   23F0 DD 7E FE      [19]  226 	ld	a,-2 (ix)
   23F3 C6 06         [ 7]  227 	add	a, #0x06
   23F5 DD 77 EE      [19]  228 	ld	-18 (ix),a
   23F8 DD 7E FF      [19]  229 	ld	a,-1 (ix)
   23FB CE 00         [ 7]  230 	adc	a, #0x00
   23FD DD 77 EF      [19]  231 	ld	-17 (ix),a
                            232 ;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2400 DD 7E FE      [19]  233 	ld	a,-2 (ix)
   2403 C6 08         [ 7]  234 	add	a, #0x08
   2405 DD 77 EC      [19]  235 	ld	-20 (ix),a
   2408 DD 7E FF      [19]  236 	ld	a,-1 (ix)
   240B CE 00         [ 7]  237 	adc	a, #0x00
   240D DD 77 ED      [19]  238 	ld	-19 (ix),a
                            239 ;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2410 DD 7E FE      [19]  240 	ld	a,-2 (ix)
   2413 C6 0A         [ 7]  241 	add	a, #0x0A
   2415 DD 77 EA      [19]  242 	ld	-22 (ix),a
   2418 DD 7E FF      [19]  243 	ld	a,-1 (ix)
   241B CE 00         [ 7]  244 	adc	a, #0x00
   241D DD 77 EB      [19]  245 	ld	-21 (ix),a
                            246 ;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2420 DD 7E FE      [19]  247 	ld	a,-2 (ix)
   2423 C6 0C         [ 7]  248 	add	a, #0x0C
   2425 DD 77 E8      [19]  249 	ld	-24 (ix),a
   2428 DD 7E FF      [19]  250 	ld	a,-1 (ix)
   242B CE 00         [ 7]  251 	adc	a, #0x00
   242D DD 77 E9      [19]  252 	ld	-23 (ix),a
                            253 ;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2430 DD 7E FE      [19]  254 	ld	a,-2 (ix)
   2433 C6 0E         [ 7]  255 	add	a, #0x0E
   2435 DD 77 E6      [19]  256 	ld	-26 (ix),a
   2438 DD 7E FF      [19]  257 	ld	a,-1 (ix)
   243B CE 00         [ 7]  258 	adc	a, #0x00
   243D DD 77 E7      [19]  259 	ld	-25 (ix),a
                            260 ;src/entities/enemies.c:55: enemies[k].trajectory=1;
   2440 DD 7E FE      [19]  261 	ld	a,-2 (ix)
   2443 C6 19         [ 7]  262 	add	a, #0x19
   2445 DD 77 E4      [19]  263 	ld	-28 (ix),a
   2448 DD 7E FF      [19]  264 	ld	a,-1 (ix)
   244B CE 00         [ 7]  265 	adc	a, #0x00
   244D DD 77 E5      [19]  266 	ld	-27 (ix),a
                            267 ;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
   2450 DD 7E FE      [19]  268 	ld	a,-2 (ix)
   2453 C6 1A         [ 7]  269 	add	a, #0x1A
   2455 DD 77 E2      [19]  270 	ld	-30 (ix),a
   2458 DD 7E FF      [19]  271 	ld	a,-1 (ix)
   245B CE 00         [ 7]  272 	adc	a, #0x00
   245D DD 77 E3      [19]  273 	ld	-29 (ix),a
                            274 ;src/entities/enemies.c:39: switch (type){
   2460 DD 7E 06      [19]  275 	ld	a,6 (ix)
   2463 3D            [ 4]  276 	dec	a
   2464 C2 FA 24      [10]  277 	jp	NZ,00105$
                            278 ;src/entities/enemies.c:42: enemies[k].x=x;
   2467 DD 6E FC      [19]  279 	ld	l,-4 (ix)
   246A DD 66 FD      [19]  280 	ld	h,-3 (ix)
   246D DD 7E 04      [19]  281 	ld	a,4 (ix)
   2470 77            [ 7]  282 	ld	(hl),a
                            283 ;src/entities/enemies.c:43: enemies[k].y=y;
   2471 DD 6E FA      [19]  284 	ld	l,-6 (ix)
   2474 DD 66 FB      [19]  285 	ld	h,-5 (ix)
   2477 DD 7E 05      [19]  286 	ld	a,5 (ix)
   247A 77            [ 7]  287 	ld	(hl),a
                            288 ;src/entities/enemies.c:44: enemies[k].w=6;
   247B DD 6E F8      [19]  289 	ld	l,-8 (ix)
   247E DD 66 F9      [19]  290 	ld	h,-7 (ix)
   2481 36 06         [10]  291 	ld	(hl),#0x06
                            292 ;src/entities/enemies.c:45: enemies[k].h=12;
   2483 DD 6E F6      [19]  293 	ld	l,-10 (ix)
   2486 DD 66 F7      [19]  294 	ld	h,-9 (ix)
   2489 36 0C         [10]  295 	ld	(hl),#0x0C
                            296 ;src/entities/enemies.c:46: enemies[k].num_frames=0;
   248B DD 6E F4      [19]  297 	ld	l,-12 (ix)
   248E DD 66 F5      [19]  298 	ld	h,-11 (ix)
   2491 36 00         [10]  299 	ld	(hl),#0x00
                            300 ;src/entities/enemies.c:47: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   2493 DD 6E FE      [19]  301 	ld	l,-2 (ix)
   2496 DD 66 FF      [19]  302 	ld	h,-1 (ix)
   2499 36 C6         [10]  303 	ld	(hl),#<(_G_baddie02_00)
   249B 23            [ 6]  304 	inc	hl
   249C 36 31         [10]  305 	ld	(hl),#>(_G_baddie02_00)
                            306 ;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   249E DD 6E F2      [19]  307 	ld	l,-14 (ix)
   24A1 DD 66 F3      [19]  308 	ld	h,-13 (ix)
   24A4 36 0E         [10]  309 	ld	(hl),#<(_G_baddie02_01)
   24A6 23            [ 6]  310 	inc	hl
   24A7 36 32         [10]  311 	ld	(hl),#>(_G_baddie02_01)
                            312 ;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   24A9 DD 6E F0      [19]  313 	ld	l,-16 (ix)
   24AC DD 66 F1      [19]  314 	ld	h,-15 (ix)
   24AF 36 56         [10]  315 	ld	(hl),#<(_G_baddie02_02)
   24B1 23            [ 6]  316 	inc	hl
   24B2 36 32         [10]  317 	ld	(hl),#>(_G_baddie02_02)
                            318 ;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24B4 DD 6E EE      [19]  319 	ld	l,-18 (ix)
   24B7 DD 66 EF      [19]  320 	ld	h,-17 (ix)
   24BA 36 9E         [10]  321 	ld	(hl),#<(_G_baddie02_03)
   24BC 23            [ 6]  322 	inc	hl
   24BD 36 32         [10]  323 	ld	(hl),#>(_G_baddie02_03)
                            324 ;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   24BF DD 6E EC      [19]  325 	ld	l,-20 (ix)
   24C2 DD 66 ED      [19]  326 	ld	h,-19 (ix)
   24C5 36 E6         [10]  327 	ld	(hl),#<(_G_baddie02_04)
   24C7 23            [ 6]  328 	inc	hl
   24C8 36 32         [10]  329 	ld	(hl),#>(_G_baddie02_04)
                            330 ;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   24CA DD 6E EA      [19]  331 	ld	l,-22 (ix)
   24CD DD 66 EB      [19]  332 	ld	h,-21 (ix)
   24D0 36 2E         [10]  333 	ld	(hl),#<(_G_baddie02_05)
   24D2 23            [ 6]  334 	inc	hl
   24D3 36 33         [10]  335 	ld	(hl),#>(_G_baddie02_05)
                            336 ;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   24D5 DD 6E E8      [19]  337 	ld	l,-24 (ix)
   24D8 DD 66 E9      [19]  338 	ld	h,-23 (ix)
   24DB 36 76         [10]  339 	ld	(hl),#<(_G_baddie02_06)
   24DD 23            [ 6]  340 	inc	hl
   24DE 36 33         [10]  341 	ld	(hl),#>(_G_baddie02_06)
                            342 ;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   24E0 DD 6E E6      [19]  343 	ld	l,-26 (ix)
   24E3 DD 66 E7      [19]  344 	ld	h,-25 (ix)
   24E6 36 BE         [10]  345 	ld	(hl),#<(_G_baddie02_07)
   24E8 23            [ 6]  346 	inc	hl
   24E9 36 33         [10]  347 	ld	(hl),#>(_G_baddie02_07)
                            348 ;src/entities/enemies.c:55: enemies[k].trajectory=1;
   24EB DD 6E E4      [19]  349 	ld	l,-28 (ix)
   24EE DD 66 E5      [19]  350 	ld	h,-27 (ix)
   24F1 36 01         [10]  351 	ld	(hl),#0x01
                            352 ;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
   24F3 E1            [10]  353 	pop	hl
   24F4 E5            [11]  354 	push	hl
   24F5 36 00         [10]  355 	ld	(hl),#0x00
                            356 ;src/entities/enemies.c:57: break;
   24F7 C3 8A 25      [10]  357 	jp	00106$
                            358 ;src/entities/enemies.c:58: default:
   24FA                     359 00105$:
                            360 ;src/entities/enemies.c:59: enemies[k].x=x;
   24FA DD 6E FC      [19]  361 	ld	l,-4 (ix)
   24FD DD 66 FD      [19]  362 	ld	h,-3 (ix)
   2500 DD 7E 04      [19]  363 	ld	a,4 (ix)
   2503 77            [ 7]  364 	ld	(hl),a
                            365 ;src/entities/enemies.c:60: enemies[k].y=y;
   2504 DD 6E FA      [19]  366 	ld	l,-6 (ix)
   2507 DD 66 FB      [19]  367 	ld	h,-5 (ix)
   250A DD 7E 05      [19]  368 	ld	a,5 (ix)
   250D 77            [ 7]  369 	ld	(hl),a
                            370 ;src/entities/enemies.c:61: enemies[k].w=5;
   250E DD 6E F8      [19]  371 	ld	l,-8 (ix)
   2511 DD 66 F9      [19]  372 	ld	h,-7 (ix)
   2514 36 05         [10]  373 	ld	(hl),#0x05
                            374 ;src/entities/enemies.c:62: enemies[k].h=16;
   2516 DD 6E F6      [19]  375 	ld	l,-10 (ix)
   2519 DD 66 F7      [19]  376 	ld	h,-9 (ix)
   251C 36 10         [10]  377 	ld	(hl),#0x10
                            378 ;src/entities/enemies.c:63: enemies[k].num_frames=0;
   251E DD 6E F4      [19]  379 	ld	l,-12 (ix)
   2521 DD 66 F5      [19]  380 	ld	h,-11 (ix)
   2524 36 00         [10]  381 	ld	(hl),#0x00
                            382 ;src/entities/enemies.c:64: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2526 DD 6E FE      [19]  383 	ld	l,-2 (ix)
   2529 DD 66 FF      [19]  384 	ld	h,-1 (ix)
   252C 36 46         [10]  385 	ld	(hl),#<(_G_baddie01_00)
   252E 23            [ 6]  386 	inc	hl
   252F 36 2F         [10]  387 	ld	(hl),#>(_G_baddie01_00)
                            388 ;src/entities/enemies.c:65: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   2531 DD 6E F2      [19]  389 	ld	l,-14 (ix)
   2534 DD 66 F3      [19]  390 	ld	h,-13 (ix)
   2537 36 96         [10]  391 	ld	(hl),#<(_G_baddie01_01)
   2539 23            [ 6]  392 	inc	hl
   253A 36 2F         [10]  393 	ld	(hl),#>(_G_baddie01_01)
                            394 ;src/entities/enemies.c:66: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   253C DD 6E F0      [19]  395 	ld	l,-16 (ix)
   253F DD 66 F1      [19]  396 	ld	h,-15 (ix)
   2542 36 E6         [10]  397 	ld	(hl),#<(_G_baddie01_02)
   2544 23            [ 6]  398 	inc	hl
   2545 36 2F         [10]  399 	ld	(hl),#>(_G_baddie01_02)
                            400 ;src/entities/enemies.c:67: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2547 DD 6E EE      [19]  401 	ld	l,-18 (ix)
   254A DD 66 EF      [19]  402 	ld	h,-17 (ix)
   254D 36 36         [10]  403 	ld	(hl),#<(_G_baddie01_03)
   254F 23            [ 6]  404 	inc	hl
   2550 36 30         [10]  405 	ld	(hl),#>(_G_baddie01_03)
                            406 ;src/entities/enemies.c:68: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   2552 DD 6E EC      [19]  407 	ld	l,-20 (ix)
   2555 DD 66 ED      [19]  408 	ld	h,-19 (ix)
   2558 36 86         [10]  409 	ld	(hl),#<(_G_baddie01_04)
   255A 23            [ 6]  410 	inc	hl
   255B 36 30         [10]  411 	ld	(hl),#>(_G_baddie01_04)
                            412 ;src/entities/enemies.c:69: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   255D DD 6E EA      [19]  413 	ld	l,-22 (ix)
   2560 DD 66 EB      [19]  414 	ld	h,-21 (ix)
   2563 36 D6         [10]  415 	ld	(hl),#<(_G_baddie01_05)
   2565 23            [ 6]  416 	inc	hl
   2566 36 30         [10]  417 	ld	(hl),#>(_G_baddie01_05)
                            418 ;src/entities/enemies.c:70: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2568 DD 6E E8      [19]  419 	ld	l,-24 (ix)
   256B DD 66 E9      [19]  420 	ld	h,-23 (ix)
   256E 36 26         [10]  421 	ld	(hl),#<(_G_baddie01_06)
   2570 23            [ 6]  422 	inc	hl
   2571 36 31         [10]  423 	ld	(hl),#>(_G_baddie01_06)
                            424 ;src/entities/enemies.c:71: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2573 DD 6E E6      [19]  425 	ld	l,-26 (ix)
   2576 DD 66 E7      [19]  426 	ld	h,-25 (ix)
   2579 36 76         [10]  427 	ld	(hl),#<(_G_baddie01_07)
   257B 23            [ 6]  428 	inc	hl
   257C 36 31         [10]  429 	ld	(hl),#>(_G_baddie01_07)
                            430 ;src/entities/enemies.c:72: enemies[k].trajectory=1;
   257E DD 6E E4      [19]  431 	ld	l,-28 (ix)
   2581 DD 66 E5      [19]  432 	ld	h,-27 (ix)
   2584 36 01         [10]  433 	ld	(hl),#0x01
                            434 ;src/entities/enemies.c:73: enemies[k].trajectory_step=0;
   2586 E1            [10]  435 	pop	hl
   2587 E5            [11]  436 	push	hl
   2588 36 00         [10]  437 	ld	(hl),#0x00
                            438 ;src/entities/enemies.c:75: }
   258A                     439 00106$:
                            440 ;src/entities/enemies.c:76: active_enemies++;
   258A 21 C0 43      [10]  441 	ld	hl, #_active_enemies+0
   258D 34            [11]  442 	inc	(hl)
   258E                     443 00109$:
   258E DD F9         [10]  444 	ld	sp, ix
   2590 DD E1         [14]  445 	pop	ix
   2592 C9            [10]  446 	ret
                            447 ;src/entities/enemies.c:85: void update_enemies(){
                            448 ;	---------------------------------
                            449 ; Function update_enemies
                            450 ; ---------------------------------
   2593                     451 _update_enemies::
   2593 DD E5         [15]  452 	push	ix
   2595 DD 21 00 00   [14]  453 	ld	ix,#0
   2599 DD 39         [15]  454 	add	ix,sp
   259B 21 F2 FF      [10]  455 	ld	hl,#-14
   259E 39            [11]  456 	add	hl,sp
   259F F9            [ 6]  457 	ld	sp,hl
                            458 ;src/entities/enemies.c:91: if (active_enemies>0){
   25A0 3A C0 43      [13]  459 	ld	a,(#_active_enemies + 0)
   25A3 B7            [ 4]  460 	or	a, a
   25A4 CA D9 27      [10]  461 	jp	Z,00126$
                            462 ;src/entities/enemies.c:92: for (i=0;i<MAX_SHOOTS;i++){
   25A7 DD 36 F2 00   [19]  463 	ld	-14 (ix),#0x00
   25AB DD 36 FE 00   [19]  464 	ld	-2 (ix),#0x00
   25AF DD 36 FF 00   [19]  465 	ld	-1 (ix),#0x00
   25B3 11 00 00      [10]  466 	ld	de,#0x0000
   25B6 DD 36 FC 00   [19]  467 	ld	-4 (ix),#0x00
   25BA DD 36 FD 00   [19]  468 	ld	-3 (ix),#0x00
   25BE                     469 00124$:
                            470 ;src/entities/enemies.c:93: if (enemies[i].active){
   25BE 3E 8A         [ 7]  471 	ld	a,#<(_enemies)
   25C0 DD 86 FC      [19]  472 	add	a, -4 (ix)
   25C3 DD 77 FA      [19]  473 	ld	-6 (ix),a
   25C6 3E 42         [ 7]  474 	ld	a,#>(_enemies)
   25C8 DD 8E FD      [19]  475 	adc	a, -3 (ix)
   25CB DD 77 FB      [19]  476 	ld	-5 (ix),a
   25CE DD 6E FA      [19]  477 	ld	l,-6 (ix)
   25D1 DD 66 FB      [19]  478 	ld	h,-5 (ix)
   25D4 01 15 00      [10]  479 	ld	bc, #0x0015
   25D7 09            [11]  480 	add	hl, bc
   25D8 7E            [ 7]  481 	ld	a,(hl)
   25D9 B7            [ 4]  482 	or	a, a
   25DA CA A9 27      [10]  483 	jp	Z,00125$
                            484 ;src/entities/enemies.c:94: if (enemies[i].trajectory>0){
   25DD DD 7E FA      [19]  485 	ld	a,-6 (ix)
   25E0 C6 19         [ 7]  486 	add	a, #0x19
   25E2 DD 77 F8      [19]  487 	ld	-8 (ix),a
   25E5 DD 7E FB      [19]  488 	ld	a,-5 (ix)
   25E8 CE 00         [ 7]  489 	adc	a, #0x00
   25EA DD 77 F9      [19]  490 	ld	-7 (ix),a
   25ED DD 6E F8      [19]  491 	ld	l,-8 (ix)
   25F0 DD 66 F9      [19]  492 	ld	h,-7 (ix)
   25F3 46            [ 7]  493 	ld	b,(hl)
   25F4 78            [ 4]  494 	ld	a,b
   25F5 B7            [ 4]  495 	or	a, a
   25F6 CA A9 27      [10]  496 	jp	Z,00125$
                            497 ;src/entities/enemies.c:95: dx = enemies[i].x-trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
   25F9 E5            [11]  498 	push	hl
   25FA DD 6E FA      [19]  499 	ld	l,-6 (ix)
   25FD DD 66 FB      [19]  500 	ld	h,-5 (ix)
   2600 E5            [11]  501 	push	hl
   2601 FD E1         [14]  502 	pop	iy
   2603 E1            [10]  503 	pop	hl
   2604 FD 7E 10      [19]  504 	ld	a,16 (iy)
   2607 DD 77 F7      [19]  505 	ld	-9 (ix),a
   260A 48            [ 4]  506 	ld	c,b
   260B 06 00         [ 7]  507 	ld	b,#0x00
   260D 69            [ 4]  508 	ld	l, c
   260E 60            [ 4]  509 	ld	h, b
   260F 29            [11]  510 	add	hl, hl
   2610 29            [11]  511 	add	hl, hl
   2611 09            [11]  512 	add	hl, bc
   2612 29            [11]  513 	add	hl, hl
   2613 29            [11]  514 	add	hl, hl
   2614 29            [11]  515 	add	hl, hl
   2615 29            [11]  516 	add	hl, hl
   2616 09            [11]  517 	add	hl, bc
   2617 3E A1         [ 7]  518 	ld	a,#<(_trajectories)
   2619 85            [ 4]  519 	add	a, l
   261A DD 77 F5      [19]  520 	ld	-11 (ix),a
   261D 3E 2B         [ 7]  521 	ld	a,#>(_trajectories)
   261F 8C            [ 4]  522 	adc	a, h
   2620 DD 77 F6      [19]  523 	ld	-10 (ix),a
   2623 DD 7E F5      [19]  524 	ld	a,-11 (ix)
   2626 C6 01         [ 7]  525 	add	a, #0x01
   2628 DD 77 F3      [19]  526 	ld	-13 (ix),a
   262B DD 7E F6      [19]  527 	ld	a,-10 (ix)
   262E CE 00         [ 7]  528 	adc	a, #0x00
   2630 DD 77 F4      [19]  529 	ld	-12 (ix),a
   2633 DD 7E FA      [19]  530 	ld	a,-6 (ix)
   2636 C6 1A         [ 7]  531 	add	a, #0x1A
   2638 4F            [ 4]  532 	ld	c,a
   2639 DD 7E FB      [19]  533 	ld	a,-5 (ix)
   263C CE 00         [ 7]  534 	adc	a, #0x00
   263E 47            [ 4]  535 	ld	b,a
   263F 0A            [ 7]  536 	ld	a,(bc)
   2640 DD 77 FA      [19]  537 	ld	-6 (ix), a
   2643 87            [ 4]  538 	add	a, a
   2644 67            [ 4]  539 	ld	h,a
   2645 DD 7E F3      [19]  540 	ld	a,-13 (ix)
   2648 84            [ 4]  541 	add	a, h
   2649 6F            [ 4]  542 	ld	l,a
   264A DD 7E F4      [19]  543 	ld	a,-12 (ix)
   264D CE 00         [ 7]  544 	adc	a, #0x00
   264F 67            [ 4]  545 	ld	h,a
   2650 DD 7E F7      [19]  546 	ld	a,-9 (ix)
   2653 96            [ 7]  547 	sub	a,(hl)
   2654 67            [ 4]  548 	ld	h,a
   2655 6C            [ 4]  549 	ld	l,h
                            550 ;src/entities/enemies.c:97: if ((dx==0) && (dy==0)){
   2656 7D            [ 4]  551 	ld	a,l
   2657 B7            [ 4]  552 	or	a,a
   2658 20 24         [12]  553 	jr	NZ,00114$
   265A B4            [ 4]  554 	or	a,h
   265B 20 21         [12]  555 	jr	NZ,00114$
                            556 ;src/entities/enemies.c:98: if (enemies[i].trajectory_step<trajectories[enemies[i].trajectory].waypoints){
   265D DD 6E F5      [19]  557 	ld	l,-11 (ix)
   2660 DD 66 F6      [19]  558 	ld	h,-10 (ix)
   2663 DD 7E FA      [19]  559 	ld	a,-6 (ix)
   2666 96            [ 7]  560 	sub	a,(hl)
   2667 30 08         [12]  561 	jr	NC,00102$
                            562 ;src/entities/enemies.c:99: enemies[i].trajectory_step++;
   2669 DD 7E FA      [19]  563 	ld	a,-6 (ix)
   266C 3C            [ 4]  564 	inc	a
   266D 02            [ 7]  565 	ld	(bc),a
   266E C3 A9 27      [10]  566 	jp	00125$
   2671                     567 00102$:
                            568 ;src/entities/enemies.c:102: enemies[i].trajectory_step=0;
   2671 AF            [ 4]  569 	xor	a, a
   2672 02            [ 7]  570 	ld	(bc),a
                            571 ;src/entities/enemies.c:103: enemies[i].trajectory=0;
   2673 DD 6E F8      [19]  572 	ld	l,-8 (ix)
   2676 DD 66 F9      [19]  573 	ld	h,-7 (ix)
   2679 36 00         [10]  574 	ld	(hl),#0x00
   267B C3 A9 27      [10]  575 	jp	00125$
   267E                     576 00114$:
                            577 ;src/entities/enemies.c:107: if (dx>0){
   267E AF            [ 4]  578 	xor	a, a
   267F 95            [ 4]  579 	sub	a, l
   2680 E2 85 26      [10]  580 	jp	PO, 00169$
   2683 EE 80         [ 7]  581 	xor	a, #0x80
   2685                     582 00169$:
   2685 F2 11 27      [10]  583 	jp	P,00111$
                            584 ;src/entities/enemies.c:108: if ((u8) dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step]){
   2688 DD 75 F3      [19]  585 	ld	-13 (ix),l
   268B 3E 8A         [ 7]  586 	ld	a,#<(_enemies)
   268D DD 86 FE      [19]  587 	add	a, -2 (ix)
   2690 4F            [ 4]  588 	ld	c,a
   2691 3E 42         [ 7]  589 	ld	a,#>(_enemies)
   2693 DD 8E FF      [19]  590 	adc	a, -1 (ix)
   2696 47            [ 4]  591 	ld	b,a
   2697 C5            [11]  592 	push	bc
   2698 FD E1         [14]  593 	pop	iy
   269A FD 7E 19      [19]  594 	ld	a,25 (iy)
   269D D5            [11]  595 	push	de
   269E 5F            [ 4]  596 	ld	e,a
   269F 16 00         [ 7]  597 	ld	d,#0x00
   26A1 6B            [ 4]  598 	ld	l, e
   26A2 62            [ 4]  599 	ld	h, d
   26A3 29            [11]  600 	add	hl, hl
   26A4 29            [11]  601 	add	hl, hl
   26A5 19            [11]  602 	add	hl, de
   26A6 29            [11]  603 	add	hl, hl
   26A7 29            [11]  604 	add	hl, hl
   26A8 29            [11]  605 	add	hl, hl
   26A9 29            [11]  606 	add	hl, hl
   26AA 19            [11]  607 	add	hl, de
   26AB D1            [10]  608 	pop	de
   26AC 3E A1         [ 7]  609 	ld	a,#<(_trajectories)
   26AE 85            [ 4]  610 	add	a, l
   26AF DD 77 F5      [19]  611 	ld	-11 (ix),a
   26B2 3E 2B         [ 7]  612 	ld	a,#>(_trajectories)
   26B4 8C            [ 4]  613 	adc	a, h
   26B5 DD 77 F6      [19]  614 	ld	-10 (ix),a
   26B8 DD 7E F5      [19]  615 	ld	a,-11 (ix)
   26BB C6 29         [ 7]  616 	add	a, #0x29
   26BD DD 77 F8      [19]  617 	ld	-8 (ix),a
   26C0 DD 7E F6      [19]  618 	ld	a,-10 (ix)
   26C3 CE 00         [ 7]  619 	adc	a, #0x00
   26C5 DD 77 F9      [19]  620 	ld	-7 (ix),a
   26C8 C5            [11]  621 	push	bc
   26C9 FD E1         [14]  622 	pop	iy
   26CB FD 7E 1A      [19]  623 	ld	a,26 (iy)
   26CE DD 77 F7      [19]  624 	ld	-9 (ix), a
   26D1 DD 86 F8      [19]  625 	add	a, -8 (ix)
   26D4 6F            [ 4]  626 	ld	l,a
   26D5 3E 00         [ 7]  627 	ld	a,#0x00
   26D7 DD 8E F9      [19]  628 	adc	a, -7 (ix)
   26DA 67            [ 4]  629 	ld	h,a
   26DB 7E            [ 7]  630 	ld	a,(hl)
   26DC DD 77 F8      [19]  631 	ld	-8 (ix),a
                            632 ;src/entities/enemies.c:109: enemies[i].x+=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
   26DF 21 10 00      [10]  633 	ld	hl,#0x0010
   26E2 09            [11]  634 	add	hl,bc
   26E3 4D            [ 4]  635 	ld	c,l
   26E4 44            [ 4]  636 	ld	b,h
                            637 ;src/entities/enemies.c:108: if ((u8) dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step]){
   26E5 DD 7E F8      [19]  638 	ld	a,-8 (ix)
   26E8 DD 96 F3      [19]  639 	sub	a, -13 (ix)
   26EB 30 08         [12]  640 	jr	NC,00105$
                            641 ;src/entities/enemies.c:109: enemies[i].x+=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
   26ED 0A            [ 7]  642 	ld	a,(bc)
   26EE DD 86 F8      [19]  643 	add	a, -8 (ix)
   26F1 02            [ 7]  644 	ld	(bc),a
   26F2 C3 A9 27      [10]  645 	jp	00125$
   26F5                     646 00105$:
                            647 ;src/entities/enemies.c:112: enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
   26F5 DD 6E F5      [19]  648 	ld	l,-11 (ix)
   26F8 DD 66 F6      [19]  649 	ld	h,-10 (ix)
   26FB 23            [ 6]  650 	inc	hl
   26FC DD 7E F7      [19]  651 	ld	a,-9 (ix)
   26FF 87            [ 4]  652 	add	a, a
   2700 DD 77 F3      [19]  653 	ld	-13 (ix),a
   2703 7D            [ 4]  654 	ld	a,l
   2704 DD 86 F3      [19]  655 	add	a, -13 (ix)
   2707 6F            [ 4]  656 	ld	l,a
   2708 7C            [ 4]  657 	ld	a,h
   2709 CE 00         [ 7]  658 	adc	a, #0x00
   270B 67            [ 4]  659 	ld	h,a
   270C 7E            [ 7]  660 	ld	a,(hl)
   270D 02            [ 7]  661 	ld	(bc),a
   270E C3 A9 27      [10]  662 	jp	00125$
   2711                     663 00111$:
                            664 ;src/entities/enemies.c:115: if (-dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step])
   2711 7D            [ 4]  665 	ld	a,l
   2712 17            [ 4]  666 	rla
   2713 9F            [ 4]  667 	sbc	a, a
   2714 67            [ 4]  668 	ld	h,a
   2715 AF            [ 4]  669 	xor	a, a
   2716 95            [ 4]  670 	sub	a, l
   2717 DD 77 F3      [19]  671 	ld	-13 (ix),a
   271A 3E 00         [ 7]  672 	ld	a, #0x00
   271C 9C            [ 4]  673 	sbc	a, h
   271D DD 77 F4      [19]  674 	ld	-12 (ix),a
   2720 21 8A 42      [10]  675 	ld	hl,#_enemies
   2723 19            [11]  676 	add	hl,de
   2724 4D            [ 4]  677 	ld	c,l
   2725 44            [ 4]  678 	ld	b,h
   2726 C5            [11]  679 	push	bc
   2727 FD E1         [14]  680 	pop	iy
   2729 FD 7E 19      [19]  681 	ld	a,25 (iy)
   272C D5            [11]  682 	push	de
   272D 5F            [ 4]  683 	ld	e,a
   272E 16 00         [ 7]  684 	ld	d,#0x00
   2730 6B            [ 4]  685 	ld	l, e
   2731 62            [ 4]  686 	ld	h, d
   2732 29            [11]  687 	add	hl, hl
   2733 29            [11]  688 	add	hl, hl
   2734 19            [11]  689 	add	hl, de
   2735 29            [11]  690 	add	hl, hl
   2736 29            [11]  691 	add	hl, hl
   2737 29            [11]  692 	add	hl, hl
   2738 29            [11]  693 	add	hl, hl
   2739 19            [11]  694 	add	hl, de
   273A D1            [10]  695 	pop	de
   273B 3E A1         [ 7]  696 	ld	a,#<(_trajectories)
   273D 85            [ 4]  697 	add	a, l
   273E DD 77 F5      [19]  698 	ld	-11 (ix),a
   2741 3E 2B         [ 7]  699 	ld	a,#>(_trajectories)
   2743 8C            [ 4]  700 	adc	a, h
   2744 DD 77 F6      [19]  701 	ld	-10 (ix),a
   2747 DD 7E F5      [19]  702 	ld	a,-11 (ix)
   274A C6 29         [ 7]  703 	add	a, #0x29
   274C DD 77 F8      [19]  704 	ld	-8 (ix),a
   274F DD 7E F6      [19]  705 	ld	a,-10 (ix)
   2752 CE 00         [ 7]  706 	adc	a, #0x00
   2754 DD 77 F9      [19]  707 	ld	-7 (ix),a
   2757 C5            [11]  708 	push	bc
   2758 FD E1         [14]  709 	pop	iy
   275A FD 7E 1A      [19]  710 	ld	a,26 (iy)
   275D DD 77 F7      [19]  711 	ld	-9 (ix), a
   2760 DD 86 F8      [19]  712 	add	a, -8 (ix)
   2763 6F            [ 4]  713 	ld	l,a
   2764 3E 00         [ 7]  714 	ld	a,#0x00
   2766 DD 8E F9      [19]  715 	adc	a, -7 (ix)
   2769 67            [ 4]  716 	ld	h,a
   276A 7E            [ 7]  717 	ld	a,(hl)
   276B DD 77 F8      [19]  718 	ld	-8 (ix), a
   276E 6F            [ 4]  719 	ld	l, a
   276F 26 00         [ 7]  720 	ld	h,#0x00
                            721 ;src/entities/enemies.c:116: enemies[i].x-=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
   2771 79            [ 4]  722 	ld	a,c
   2772 C6 10         [ 7]  723 	add	a, #0x10
   2774 4F            [ 4]  724 	ld	c,a
   2775 78            [ 4]  725 	ld	a,b
   2776 CE 00         [ 7]  726 	adc	a, #0x00
   2778 47            [ 4]  727 	ld	b,a
                            728 ;src/entities/enemies.c:115: if (-dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step])
   2779 7D            [ 4]  729 	ld	a,l
   277A DD 96 F3      [19]  730 	sub	a, -13 (ix)
   277D 7C            [ 4]  731 	ld	a,h
   277E DD 9E F4      [19]  732 	sbc	a, -12 (ix)
   2781 E2 86 27      [10]  733 	jp	PO, 00170$
   2784 EE 80         [ 7]  734 	xor	a, #0x80
   2786                     735 00170$:
   2786 F2 90 27      [10]  736 	jp	P,00108$
                            737 ;src/entities/enemies.c:116: enemies[i].x-=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
   2789 0A            [ 7]  738 	ld	a,(bc)
   278A DD 96 F8      [19]  739 	sub	a, -8 (ix)
   278D 02            [ 7]  740 	ld	(bc),a
   278E 18 19         [12]  741 	jr	00125$
   2790                     742 00108$:
                            743 ;src/entities/enemies.c:118: enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
   2790 DD 6E F5      [19]  744 	ld	l,-11 (ix)
   2793 DD 66 F6      [19]  745 	ld	h,-10 (ix)
   2796 23            [ 6]  746 	inc	hl
   2797 DD 7E F7      [19]  747 	ld	a,-9 (ix)
   279A 87            [ 4]  748 	add	a, a
   279B DD 77 F3      [19]  749 	ld	-13 (ix),a
   279E 7D            [ 4]  750 	ld	a,l
   279F DD 86 F3      [19]  751 	add	a, -13 (ix)
   27A2 6F            [ 4]  752 	ld	l,a
   27A3 7C            [ 4]  753 	ld	a,h
   27A4 CE 00         [ 7]  754 	adc	a, #0x00
   27A6 67            [ 4]  755 	ld	h,a
   27A7 7E            [ 7]  756 	ld	a,(hl)
   27A8 02            [ 7]  757 	ld	(bc),a
   27A9                     758 00125$:
                            759 ;src/entities/enemies.c:92: for (i=0;i<MAX_SHOOTS;i++){
   27A9 DD 7E FE      [19]  760 	ld	a,-2 (ix)
   27AC C6 1F         [ 7]  761 	add	a, #0x1F
   27AE DD 77 FE      [19]  762 	ld	-2 (ix),a
   27B1 DD 7E FF      [19]  763 	ld	a,-1 (ix)
   27B4 CE 00         [ 7]  764 	adc	a, #0x00
   27B6 DD 77 FF      [19]  765 	ld	-1 (ix),a
   27B9 21 1F 00      [10]  766 	ld	hl,#0x001F
   27BC 19            [11]  767 	add	hl,de
   27BD EB            [ 4]  768 	ex	de,hl
   27BE DD 7E FC      [19]  769 	ld	a,-4 (ix)
   27C1 C6 1F         [ 7]  770 	add	a, #0x1F
   27C3 DD 77 FC      [19]  771 	ld	-4 (ix),a
   27C6 DD 7E FD      [19]  772 	ld	a,-3 (ix)
   27C9 CE 00         [ 7]  773 	adc	a, #0x00
   27CB DD 77 FD      [19]  774 	ld	-3 (ix),a
   27CE DD 34 F2      [23]  775 	inc	-14 (ix)
   27D1 DD 7E F2      [19]  776 	ld	a,-14 (ix)
   27D4 D6 0A         [ 7]  777 	sub	a, #0x0A
   27D6 DA BE 25      [10]  778 	jp	C,00124$
   27D9                     779 00126$:
   27D9 DD F9         [10]  780 	ld	sp, ix
   27DB DD E1         [14]  781 	pop	ix
   27DD C9            [10]  782 	ret
                            783 ;src/entities/enemies.c:132: void draw_enemies(u8* screen){
                            784 ;	---------------------------------
                            785 ; Function draw_enemies
                            786 ; ---------------------------------
   27DE                     787 _draw_enemies::
   27DE DD E5         [15]  788 	push	ix
   27E0 DD 21 00 00   [14]  789 	ld	ix,#0
   27E4 DD 39         [15]  790 	add	ix,sp
   27E6 21 F9 FF      [10]  791 	ld	hl,#-7
   27E9 39            [11]  792 	add	hl,sp
   27EA F9            [ 6]  793 	ld	sp,hl
                            794 ;src/entities/enemies.c:137: if (active_enemies>0){
   27EB 3A C0 43      [13]  795 	ld	a,(#_active_enemies + 0)
   27EE B7            [ 4]  796 	or	a, a
   27EF CA A3 28      [10]  797 	jp	Z,00108$
                            798 ;src/entities/enemies.c:138: for (k=0;k<MAX_SHOOTS;k++){
   27F2 DD 36 F9 00   [19]  799 	ld	-7 (ix),#0x00
   27F6 11 00 00      [10]  800 	ld	de,#0x0000
   27F9                     801 00106$:
                            802 ;src/entities/enemies.c:139: if (enemies[k].active){
   27F9 21 8A 42      [10]  803 	ld	hl,#_enemies
   27FC 19            [11]  804 	add	hl,de
   27FD DD 75 FB      [19]  805 	ld	-5 (ix),l
   2800 DD 74 FC      [19]  806 	ld	-4 (ix),h
   2803 C1            [10]  807 	pop	bc
   2804 E1            [10]  808 	pop	hl
   2805 E5            [11]  809 	push	hl
   2806 C5            [11]  810 	push	bc
   2807 01 15 00      [10]  811 	ld	bc, #0x0015
   280A 09            [11]  812 	add	hl, bc
   280B 7E            [ 7]  813 	ld	a,(hl)
   280C B7            [ 4]  814 	or	a, a
   280D CA 93 28      [10]  815 	jp	Z,00107$
                            816 ;src/entities/enemies.c:140: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   2810 C1            [10]  817 	pop	bc
   2811 E1            [10]  818 	pop	hl
   2812 E5            [11]  819 	push	hl
   2813 C5            [11]  820 	push	bc
   2814 01 11 00      [10]  821 	ld	bc, #0x0011
   2817 09            [11]  822 	add	hl, bc
   2818 46            [ 7]  823 	ld	b,(hl)
   2819 DD 6E FB      [19]  824 	ld	l,-5 (ix)
   281C DD 66 FC      [19]  825 	ld	h,-4 (ix)
   281F C5            [11]  826 	push	bc
   2820 01 10 00      [10]  827 	ld	bc, #0x0010
   2823 09            [11]  828 	add	hl, bc
   2824 C1            [10]  829 	pop	bc
   2825 4E            [ 7]  830 	ld	c,(hl)
   2826 E5            [11]  831 	push	hl
   2827 DD 6E 04      [19]  832 	ld	l,4 (ix)
   282A DD 66 05      [19]  833 	ld	h,5 (ix)
   282D E5            [11]  834 	push	hl
   282E FD E1         [14]  835 	pop	iy
   2830 E1            [10]  836 	pop	hl
   2831 D5            [11]  837 	push	de
   2832 C5            [11]  838 	push	bc
   2833 FD E5         [15]  839 	push	iy
   2835 CD EC 40      [17]  840 	call	_cpct_getScreenPtr
   2838 F1            [10]  841 	pop	af
   2839 F1            [10]  842 	pop	af
   283A D1            [10]  843 	pop	de
   283B 45            [ 4]  844 	ld	b,l
   283C 4C            [ 4]  845 	ld	c,h
                            846 ;src/entities/enemies.c:141: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   283D DD 6E FB      [19]  847 	ld	l,-5 (ix)
   2840 DD 66 FC      [19]  848 	ld	h,-4 (ix)
   2843 C5            [11]  849 	push	bc
   2844 01 13 00      [10]  850 	ld	bc, #0x0013
   2847 09            [11]  851 	add	hl, bc
   2848 C1            [10]  852 	pop	bc
   2849 7E            [ 7]  853 	ld	a,(hl)
   284A DD 77 FF      [19]  854 	ld	-1 (ix),a
   284D DD 6E FB      [19]  855 	ld	l,-5 (ix)
   2850 DD 66 FC      [19]  856 	ld	h,-4 (ix)
   2853 C5            [11]  857 	push	bc
   2854 01 12 00      [10]  858 	ld	bc, #0x0012
   2857 09            [11]  859 	add	hl, bc
   2858 C1            [10]  860 	pop	bc
   2859 7E            [ 7]  861 	ld	a,(hl)
   285A DD 77 FA      [19]  862 	ld	-6 (ix),a
   285D DD 70 FD      [19]  863 	ld	-3 (ix),b
   2860 DD 71 FE      [19]  864 	ld	-2 (ix),c
   2863 C1            [10]  865 	pop	bc
   2864 E1            [10]  866 	pop	hl
   2865 E5            [11]  867 	push	hl
   2866 C5            [11]  868 	push	bc
   2867 01 14 00      [10]  869 	ld	bc, #0x0014
   286A 09            [11]  870 	add	hl, bc
   286B 7E            [ 7]  871 	ld	a,(hl)
   286C 87            [ 4]  872 	add	a, a
   286D 4F            [ 4]  873 	ld	c,a
   286E DD 6E FB      [19]  874 	ld	l,-5 (ix)
   2871 DD 66 FC      [19]  875 	ld	h,-4 (ix)
   2874 06 00         [ 7]  876 	ld	b,#0x00
   2876 09            [11]  877 	add	hl, bc
   2877 4E            [ 7]  878 	ld	c,(hl)
   2878 23            [ 6]  879 	inc	hl
   2879 46            [ 7]  880 	ld	b,(hl)
   287A D5            [11]  881 	push	de
   287B DD 66 FF      [19]  882 	ld	h,-1 (ix)
   287E DD 6E FA      [19]  883 	ld	l,-6 (ix)
   2881 E5            [11]  884 	push	hl
   2882 DD 6E FD      [19]  885 	ld	l,-3 (ix)
   2885 DD 66 FE      [19]  886 	ld	h,-2 (ix)
   2888 E5            [11]  887 	push	hl
   2889 C5            [11]  888 	push	bc
   288A CD BD 3E      [17]  889 	call	_cpct_drawSprite
   288D 21 06 00      [10]  890 	ld	hl,#6
   2890 39            [11]  891 	add	hl,sp
   2891 F9            [ 6]  892 	ld	sp,hl
   2892 D1            [10]  893 	pop	de
   2893                     894 00107$:
                            895 ;src/entities/enemies.c:138: for (k=0;k<MAX_SHOOTS;k++){
   2893 21 1F 00      [10]  896 	ld	hl,#0x001F
   2896 19            [11]  897 	add	hl,de
   2897 EB            [ 4]  898 	ex	de,hl
   2898 DD 34 F9      [23]  899 	inc	-7 (ix)
   289B DD 7E F9      [19]  900 	ld	a,-7 (ix)
   289E D6 0A         [ 7]  901 	sub	a, #0x0A
   28A0 DA F9 27      [10]  902 	jp	C,00106$
   28A3                     903 00108$:
   28A3 DD F9         [10]  904 	ld	sp, ix
   28A5 DD E1         [14]  905 	pop	ix
   28A7 C9            [10]  906 	ret
                            907 	.area _CODE
                            908 	.area _INITIALIZER
                            909 	.area _CABS (ABS)
