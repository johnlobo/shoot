                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 00:46:09 2015
                              5 ;--------------------------------------------------------
                              6 	.module enemies
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _inside_screen
                             13 	.globl _detectColision
                             14 	.globl _fast_collision
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSprite
                             17 	.globl _active_groups
                             18 	.globl _groups
                             19 	.globl _active_enemies
                             20 	.globl _enemies
                             21 	.globl _check_collision_enemies
                             22 	.globl _init_enemies
                             23 	.globl _create_enemy
                             24 	.globl _create_enemy_group
                             25 	.globl _update_enemies
                             26 	.globl _draw_enemies
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   630A                      34 _enemies::
   630A                      35 	.ds 1080
   6742                      36 _active_enemies::
   6742                      37 	.ds 1
   6743                      38 _groups::
   6743                      39 	.ds 32
   6763                      40 _active_groups::
   6763                      41 	.ds 1
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _INITIALIZED
                             46 ;--------------------------------------------------------
                             47 ; absolute external ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DABS (ABS)
                             50 ;--------------------------------------------------------
                             51 ; global & static initialisations
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _GSINIT
                             55 	.area _GSFINAL
                             56 	.area _GSINIT
                             57 ;--------------------------------------------------------
                             58 ; Home
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _HOME
                             62 ;--------------------------------------------------------
                             63 ; code
                             64 ;--------------------------------------------------------
                             65 	.area _CODE
                             66 ;src/entities/enemies.c:14: u8 detectColision(u8 x1,u8 y1,u8 w1,u8 h1,u8 x2,u8 y2,u8 w2,u8 h2){
                             67 ;	---------------------------------
                             68 ; Function detectColision
                             69 ; ---------------------------------
   2458                      70 _detectColision::
   2458 DD E5         [15]   71 	push	ix
   245A DD 21 00 00   [14]   72 	ld	ix,#0
   245E DD 39         [15]   73 	add	ix,sp
                             74 ;src/entities/enemies.c:15: return ((x1 < x2 + w2) && (x1 + w1 > x2) && (y1 < y2 + h2) && (h1 + y1 > y2));
   2460 DD 5E 08      [19]   75 	ld	e,8 (ix)
   2463 16 00         [ 7]   76 	ld	d,#0x00
   2465 DD 6E 0A      [19]   77 	ld	l,10 (ix)
   2468 26 00         [ 7]   78 	ld	h,#0x00
   246A 19            [11]   79 	add	hl,de
   246B DD 4E 04      [19]   80 	ld	c,4 (ix)
   246E 06 00         [ 7]   81 	ld	b,#0x00
   2470 79            [ 4]   82 	ld	a,c
   2471 95            [ 4]   83 	sub	a, l
   2472 78            [ 4]   84 	ld	a,b
   2473 9C            [ 4]   85 	sbc	a, h
   2474 E2 79 24      [10]   86 	jp	PO, 00122$
   2477 EE 80         [ 7]   87 	xor	a, #0x80
   2479                      88 00122$:
   2479 F2 BC 24      [10]   89 	jp	P,00103$
   247C DD 6E 06      [19]   90 	ld	l,6 (ix)
   247F 26 00         [ 7]   91 	ld	h,#0x00
   2481 09            [11]   92 	add	hl,bc
   2482 7B            [ 4]   93 	ld	a,e
   2483 95            [ 4]   94 	sub	a, l
   2484 7A            [ 4]   95 	ld	a,d
   2485 9C            [ 4]   96 	sbc	a, h
   2486 E2 8B 24      [10]   97 	jp	PO, 00123$
   2489 EE 80         [ 7]   98 	xor	a, #0x80
   248B                      99 00123$:
   248B F2 BC 24      [10]  100 	jp	P,00103$
   248E DD 5E 09      [19]  101 	ld	e,9 (ix)
   2491 16 00         [ 7]  102 	ld	d,#0x00
   2493 DD 6E 0B      [19]  103 	ld	l,11 (ix)
   2496 26 00         [ 7]  104 	ld	h,#0x00
   2498 19            [11]  105 	add	hl,de
   2499 DD 4E 05      [19]  106 	ld	c,5 (ix)
   249C 06 00         [ 7]  107 	ld	b,#0x00
   249E 79            [ 4]  108 	ld	a,c
   249F 95            [ 4]  109 	sub	a, l
   24A0 78            [ 4]  110 	ld	a,b
   24A1 9C            [ 4]  111 	sbc	a, h
   24A2 E2 A7 24      [10]  112 	jp	PO, 00124$
   24A5 EE 80         [ 7]  113 	xor	a, #0x80
   24A7                     114 00124$:
   24A7 F2 BC 24      [10]  115 	jp	P,00103$
   24AA DD 6E 07      [19]  116 	ld	l,7 (ix)
   24AD 26 00         [ 7]  117 	ld	h,#0x00
   24AF 09            [11]  118 	add	hl,bc
   24B0 7B            [ 4]  119 	ld	a,e
   24B1 95            [ 4]  120 	sub	a, l
   24B2 7A            [ 4]  121 	ld	a,d
   24B3 9C            [ 4]  122 	sbc	a, h
   24B4 E2 B9 24      [10]  123 	jp	PO, 00125$
   24B7 EE 80         [ 7]  124 	xor	a, #0x80
   24B9                     125 00125$:
   24B9 FA C0 24      [10]  126 	jp	M,00104$
   24BC                     127 00103$:
   24BC 2E 00         [ 7]  128 	ld	l,#0x00
   24BE 18 02         [12]  129 	jr	00105$
   24C0                     130 00104$:
   24C0 2E 01         [ 7]  131 	ld	l,#0x01
   24C2                     132 00105$:
   24C2 DD E1         [14]  133 	pop	ix
   24C4 C9            [10]  134 	ret
                            135 ;src/entities/enemies.c:22: u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
                            136 ;	---------------------------------
                            137 ; Function check_collision_enemies
                            138 ; ---------------------------------
   24C5                     139 _check_collision_enemies::
   24C5 DD E5         [15]  140 	push	ix
   24C7 DD 21 00 00   [14]  141 	ld	ix,#0
   24CB DD 39         [15]  142 	add	ix,sp
   24CD 21 F6 FF      [10]  143 	ld	hl,#-10
   24D0 39            [11]  144 	add	hl,sp
   24D1 F9            [ 6]  145 	ld	sp,hl
                            146 ;src/entities/enemies.c:27: collision = 0;
   24D2 DD 36 F6 00   [19]  147 	ld	-10 (ix),#0x00
                            148 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   24D6 DD 36 F7 00   [19]  149 	ld	-9 (ix),#0x00
   24DA 01 00 00      [10]  150 	ld	bc,#0x0000
   24DD                     151 00108$:
                            152 ;src/entities/enemies.c:30: if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
   24DD 21 0A 63      [10]  153 	ld	hl,#_enemies
   24E0 09            [11]  154 	add	hl,bc
   24E1 EB            [ 4]  155 	ex	de,hl
   24E2 21 17 00      [10]  156 	ld	hl,#0x0017
   24E5 19            [11]  157 	add	hl,de
   24E6 DD 75 F8      [19]  158 	ld	-8 (ix),l
   24E9 DD 74 F9      [19]  159 	ld	-7 (ix),h
   24EC DD 6E F8      [19]  160 	ld	l,-8 (ix)
   24EF DD 66 F9      [19]  161 	ld	h,-7 (ix)
   24F2 7E            [ 7]  162 	ld	a,(hl)
   24F3 B7            [ 4]  163 	or	a, a
   24F4 CA 7E 25      [10]  164 	jp	Z,00109$
   24F7 D5            [11]  165 	push	de
   24F8 FD E1         [14]  166 	pop	iy
   24FA FD 7E 10      [19]  167 	ld	a,16 (iy)
   24FD DD 77 FA      [19]  168 	ld	-6 (ix),a
   2500 FD 7E 11      [19]  169 	ld	a,17 (iy)
   2503 DD 77 FB      [19]  170 	ld	-5 (ix),a
   2506 AF            [ 4]  171 	xor	a, a
   2507 DD BE FA      [19]  172 	cp	a, -6 (ix)
   250A DD 9E FB      [19]  173 	sbc	a, -5 (ix)
   250D E2 12 25      [10]  174 	jp	PO, 00137$
   2510 EE 80         [ 7]  175 	xor	a, #0x80
   2512                     176 00137$:
   2512 F2 7E 25      [10]  177 	jp	P,00109$
   2515 D5            [11]  178 	push	de
   2516 FD E1         [14]  179 	pop	iy
   2518 FD 7E 12      [19]  180 	ld	a,18 (iy)
   251B DD 77 FC      [19]  181 	ld	-4 (ix),a
   251E FD 7E 13      [19]  182 	ld	a,19 (iy)
   2521 DD 77 FD      [19]  183 	ld	-3 (ix),a
   2524 AF            [ 4]  184 	xor	a, a
   2525 DD BE FC      [19]  185 	cp	a, -4 (ix)
   2528 DD 9E FD      [19]  186 	sbc	a, -3 (ix)
   252B E2 30 25      [10]  187 	jp	PO, 00138$
   252E EE 80         [ 7]  188 	xor	a, #0x80
   2530                     189 00138$:
   2530 F2 7E 25      [10]  190 	jp	P,00109$
                            191 ;src/entities/enemies.c:31: if (fast_collision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
   2533 D5            [11]  192 	push	de
   2534 FD E1         [14]  193 	pop	iy
   2536 FD 7E 15      [19]  194 	ld	a,21 (iy)
   2539 DD 77 FE      [19]  195 	ld	-2 (ix),a
   253C D5            [11]  196 	push	de
   253D FD E1         [14]  197 	pop	iy
   253F FD 7E 14      [19]  198 	ld	a,20 (iy)
   2542 DD 77 FF      [19]  199 	ld	-1 (ix),a
   2545 DD 56 FC      [19]  200 	ld	d,-4 (ix)
   2548 DD 5E FA      [19]  201 	ld	e,-6 (ix)
   254B C5            [11]  202 	push	bc
   254C DD 66 FE      [19]  203 	ld	h,-2 (ix)
   254F DD 6E FF      [19]  204 	ld	l,-1 (ix)
   2552 E5            [11]  205 	push	hl
   2553 D5            [11]  206 	push	de
   2554 DD 66 07      [19]  207 	ld	h,7 (ix)
   2557 DD 6E 06      [19]  208 	ld	l,6 (ix)
   255A E5            [11]  209 	push	hl
   255B DD 66 05      [19]  210 	ld	h,5 (ix)
   255E DD 6E 04      [19]  211 	ld	l,4 (ix)
   2561 E5            [11]  212 	push	hl
   2562 CD DB 51      [17]  213 	call	_fast_collision
   2565 F1            [10]  214 	pop	af
   2566 F1            [10]  215 	pop	af
   2567 F1            [10]  216 	pop	af
   2568 F1            [10]  217 	pop	af
   2569 7D            [ 4]  218 	ld	a,l
   256A C1            [10]  219 	pop	bc
   256B B7            [ 4]  220 	or	a, a
   256C 28 10         [12]  221 	jr	Z,00109$
                            222 ;src/entities/enemies.c:32: collision = 1;
   256E DD 36 F6 01   [19]  223 	ld	-10 (ix),#0x01
                            224 ;src/entities/enemies.c:33: enemies[i].active = 0;
   2572 DD 6E F8      [19]  225 	ld	l,-8 (ix)
   2575 DD 66 F9      [19]  226 	ld	h,-7 (ix)
   2578 36 00         [10]  227 	ld	(hl),#0x00
                            228 ;src/entities/enemies.c:34: active_enemies--;
   257A 21 42 67      [10]  229 	ld	hl, #_active_enemies+0
   257D 35            [11]  230 	dec	(hl)
   257E                     231 00109$:
                            232 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   257E 21 24 00      [10]  233 	ld	hl,#0x0024
   2581 09            [11]  234 	add	hl,bc
   2582 4D            [ 4]  235 	ld	c,l
   2583 44            [ 4]  236 	ld	b,h
   2584 DD 34 F7      [23]  237 	inc	-9 (ix)
   2587 DD 7E F7      [19]  238 	ld	a,-9 (ix)
   258A D6 1E         [ 7]  239 	sub	a, #0x1E
   258C DA DD 24      [10]  240 	jp	C,00108$
                            241 ;src/entities/enemies.c:38: return collision;
   258F DD 6E F6      [19]  242 	ld	l,-10 (ix)
   2592 DD F9         [10]  243 	ld	sp, ix
   2594 DD E1         [14]  244 	pop	ix
   2596 C9            [10]  245 	ret
                            246 ;src/entities/enemies.c:45: void init_enemies(){
                            247 ;	---------------------------------
                            248 ; Function init_enemies
                            249 ; ---------------------------------
   2597                     250 _init_enemies::
   2597 DD E5         [15]  251 	push	ix
   2599 DD 21 00 00   [14]  252 	ld	ix,#0
   259D DD 39         [15]  253 	add	ix,sp
   259F 3B            [ 6]  254 	dec	sp
                            255 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   25A0 DD 36 FF 00   [19]  256 	ld	-1 (ix),#0x00
   25A4 11 00 00      [10]  257 	ld	de,#0x0000
   25A7                     258 00102$:
                            259 ;src/entities/enemies.c:48: enemies[k].active=0;
   25A7 21 0A 63      [10]  260 	ld	hl,#_enemies
   25AA 19            [11]  261 	add	hl,de
   25AB 4D            [ 4]  262 	ld	c,l
   25AC 44            [ 4]  263 	ld	b,h
   25AD 21 17 00      [10]  264 	ld	hl,#0x0017
   25B0 09            [11]  265 	add	hl,bc
   25B1 36 00         [10]  266 	ld	(hl),#0x00
                            267 ;src/entities/enemies.c:49: enemies[k].x=0;
   25B3 21 10 00      [10]  268 	ld	hl,#0x0010
   25B6 09            [11]  269 	add	hl,bc
   25B7 AF            [ 4]  270 	xor	a, a
   25B8 77            [ 7]  271 	ld	(hl), a
   25B9 23            [ 6]  272 	inc	hl
   25BA 77            [ 7]  273 	ld	(hl), a
                            274 ;src/entities/enemies.c:50: enemies[k].y=0;
   25BB 21 12 00      [10]  275 	ld	hl,#0x0012
   25BE 09            [11]  276 	add	hl,bc
   25BF AF            [ 4]  277 	xor	a, a
   25C0 77            [ 7]  278 	ld	(hl), a
   25C1 23            [ 6]  279 	inc	hl
   25C2 77            [ 7]  280 	ld	(hl), a
                            281 ;src/entities/enemies.c:51: enemies[k].w=0;
   25C3 21 14 00      [10]  282 	ld	hl,#0x0014
   25C6 09            [11]  283 	add	hl,bc
   25C7 36 00         [10]  284 	ld	(hl),#0x00
                            285 ;src/entities/enemies.c:52: enemies[k].h=0;
   25C9 21 15 00      [10]  286 	ld	hl,#0x0015
   25CC 09            [11]  287 	add	hl,bc
   25CD 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/entities/enemies.c:53: enemies[k].dir=0;
   25CF 21 16 00      [10]  290 	ld	hl,#0x0016
   25D2 09            [11]  291 	add	hl,bc
   25D3 36 00         [10]  292 	ld	(hl),#0x00
                            293 ;src/entities/enemies.c:54: enemies[k].frame=0;
   25D5 21 19 00      [10]  294 	ld	hl,#0x0019
   25D8 09            [11]  295 	add	hl,bc
   25D9 36 00         [10]  296 	ld	(hl),#0x00
                            297 ;src/entities/enemies.c:55: enemies[k].last_moved=0;
   25DB 21 20 00      [10]  298 	ld	hl,#0x0020
   25DE 09            [11]  299 	add	hl,bc
   25DF AF            [ 4]  300 	xor	a, a
   25E0 77            [ 7]  301 	ld	(hl), a
   25E1 23            [ 6]  302 	inc	hl
   25E2 77            [ 7]  303 	ld	(hl), a
   25E3 23            [ 6]  304 	inc	hl
   25E4 AF            [ 4]  305 	xor	a, a
   25E5 77            [ 7]  306 	ld	(hl), a
   25E6 23            [ 6]  307 	inc	hl
   25E7 77            [ 7]  308 	ld	(hl), a
                            309 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   25E8 21 24 00      [10]  310 	ld	hl,#0x0024
   25EB 19            [11]  311 	add	hl,de
   25EC EB            [ 4]  312 	ex	de,hl
   25ED DD 34 FF      [23]  313 	inc	-1 (ix)
   25F0 DD 7E FF      [19]  314 	ld	a,-1 (ix)
   25F3 D6 1E         [ 7]  315 	sub	a, #0x1E
   25F5 38 B0         [12]  316 	jr	C,00102$
                            317 ;src/entities/enemies.c:57: active_enemies=0;
   25F7 21 42 67      [10]  318 	ld	hl,#_active_enemies + 0
   25FA 36 00         [10]  319 	ld	(hl), #0x00
   25FC 33            [ 6]  320 	inc	sp
   25FD DD E1         [14]  321 	pop	ix
   25FF C9            [10]  322 	ret
                            323 ;src/entities/enemies.c:65: void create_enemy(i16 x, i16 y, u8 type){
                            324 ;	---------------------------------
                            325 ; Function create_enemy
                            326 ; ---------------------------------
   2600                     327 _create_enemy::
   2600 DD E5         [15]  328 	push	ix
   2602 DD 21 00 00   [14]  329 	ld	ix,#0
   2606 DD 39         [15]  330 	add	ix,sp
   2608 21 E0 FF      [10]  331 	ld	hl,#-32
   260B 39            [11]  332 	add	hl,sp
   260C F9            [ 6]  333 	ld	sp,hl
                            334 ;src/entities/enemies.c:67: if (active_enemies < MAX_ENEMIES){
   260D 3A 42 67      [13]  335 	ld	a,(#_active_enemies + 0)
   2610 D6 1E         [ 7]  336 	sub	a, #0x1E
   2612 D2 3A 29      [10]  337 	jp	NC,00110$
                            338 ;src/entities/enemies.c:69: while (enemies[k].active){
   2615 11 00 00      [10]  339 	ld	de,#0x0000
   2618                     340 00101$:
   2618 21 0A 63      [10]  341 	ld	hl,#_enemies
   261B 19            [11]  342 	add	hl,de
   261C DD 75 FE      [19]  343 	ld	-2 (ix),l
   261F DD 74 FF      [19]  344 	ld	-1 (ix),h
   2622 DD 7E FE      [19]  345 	ld	a,-2 (ix)
   2625 C6 17         [ 7]  346 	add	a, #0x17
   2627 6F            [ 4]  347 	ld	l,a
   2628 DD 7E FF      [19]  348 	ld	a,-1 (ix)
   262B CE 00         [ 7]  349 	adc	a, #0x00
   262D 67            [ 4]  350 	ld	h,a
   262E 7E            [ 7]  351 	ld	a,(hl)
   262F B7            [ 4]  352 	or	a, a
   2630 28 07         [12]  353 	jr	Z,00103$
                            354 ;src/entities/enemies.c:70: k++;
   2632 21 24 00      [10]  355 	ld	hl,#0x0024
   2635 19            [11]  356 	add	hl,de
   2636 EB            [ 4]  357 	ex	de,hl
   2637 18 DF         [12]  358 	jr	00101$
   2639                     359 00103$:
                            360 ;src/entities/enemies.c:72: enemies[k].active=1;
   2639 36 01         [10]  361 	ld	(hl),#0x01
                            362 ;src/entities/enemies.c:73: enemies[k].frame=0;
   263B DD 7E FE      [19]  363 	ld	a,-2 (ix)
   263E C6 19         [ 7]  364 	add	a, #0x19
   2640 6F            [ 4]  365 	ld	l,a
   2641 DD 7E FF      [19]  366 	ld	a,-1 (ix)
   2644 CE 00         [ 7]  367 	adc	a, #0x00
   2646 67            [ 4]  368 	ld	h,a
   2647 36 00         [10]  369 	ld	(hl),#0x00
                            370 ;src/entities/enemies.c:77: enemies[k].x=x;
   2649 DD 7E FE      [19]  371 	ld	a,-2 (ix)
   264C C6 10         [ 7]  372 	add	a, #0x10
   264E DD 77 FC      [19]  373 	ld	-4 (ix),a
   2651 DD 7E FF      [19]  374 	ld	a,-1 (ix)
   2654 CE 00         [ 7]  375 	adc	a, #0x00
   2656 DD 77 FD      [19]  376 	ld	-3 (ix),a
                            377 ;src/entities/enemies.c:78: enemies[k].y=y;
   2659 DD 7E FE      [19]  378 	ld	a,-2 (ix)
   265C C6 12         [ 7]  379 	add	a, #0x12
   265E DD 77 FA      [19]  380 	ld	-6 (ix),a
   2661 DD 7E FF      [19]  381 	ld	a,-1 (ix)
   2664 CE 00         [ 7]  382 	adc	a, #0x00
   2666 DD 77 FB      [19]  383 	ld	-5 (ix),a
                            384 ;src/entities/enemies.c:79: enemies[k].w=4;
   2669 DD 7E FE      [19]  385 	ld	a,-2 (ix)
   266C C6 14         [ 7]  386 	add	a, #0x14
   266E DD 77 F8      [19]  387 	ld	-8 (ix),a
   2671 DD 7E FF      [19]  388 	ld	a,-1 (ix)
   2674 CE 00         [ 7]  389 	adc	a, #0x00
   2676 DD 77 F9      [19]  390 	ld	-7 (ix),a
                            391 ;src/entities/enemies.c:80: enemies[k].h=8;
   2679 DD 7E FE      [19]  392 	ld	a,-2 (ix)
   267C C6 15         [ 7]  393 	add	a, #0x15
   267E DD 77 F6      [19]  394 	ld	-10 (ix),a
   2681 DD 7E FF      [19]  395 	ld	a,-1 (ix)
   2684 CE 00         [ 7]  396 	adc	a, #0x00
   2686 DD 77 F7      [19]  397 	ld	-9 (ix),a
                            398 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   2689 DD 7E FE      [19]  399 	ld	a,-2 (ix)
   268C C6 18         [ 7]  400 	add	a, #0x18
   268E DD 77 F4      [19]  401 	ld	-12 (ix),a
   2691 DD 7E FF      [19]  402 	ld	a,-1 (ix)
   2694 CE 00         [ 7]  403 	adc	a, #0x00
   2696 DD 77 F5      [19]  404 	ld	-11 (ix),a
                            405 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
   2699 DD 7E FE      [19]  406 	ld	a,-2 (ix)
   269C C6 02         [ 7]  407 	add	a, #0x02
   269E DD 77 F2      [19]  408 	ld	-14 (ix),a
   26A1 DD 7E FF      [19]  409 	ld	a,-1 (ix)
   26A4 CE 00         [ 7]  410 	adc	a, #0x00
   26A6 DD 77 F3      [19]  411 	ld	-13 (ix),a
                            412 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
   26A9 DD 7E FE      [19]  413 	ld	a,-2 (ix)
   26AC C6 04         [ 7]  414 	add	a, #0x04
   26AE DD 77 F0      [19]  415 	ld	-16 (ix),a
   26B1 DD 7E FF      [19]  416 	ld	a,-1 (ix)
   26B4 CE 00         [ 7]  417 	adc	a, #0x00
   26B6 DD 77 F1      [19]  418 	ld	-15 (ix),a
                            419 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
   26B9 DD 7E FE      [19]  420 	ld	a,-2 (ix)
   26BC C6 06         [ 7]  421 	add	a, #0x06
   26BE DD 77 EE      [19]  422 	ld	-18 (ix),a
   26C1 DD 7E FF      [19]  423 	ld	a,-1 (ix)
   26C4 CE 00         [ 7]  424 	adc	a, #0x00
   26C6 DD 77 EF      [19]  425 	ld	-17 (ix),a
                            426 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
   26C9 DD 7E FE      [19]  427 	ld	a,-2 (ix)
   26CC C6 08         [ 7]  428 	add	a, #0x08
   26CE DD 77 EC      [19]  429 	ld	-20 (ix),a
   26D1 DD 7E FF      [19]  430 	ld	a,-1 (ix)
   26D4 CE 00         [ 7]  431 	adc	a, #0x00
   26D6 DD 77 ED      [19]  432 	ld	-19 (ix),a
                            433 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
   26D9 DD 7E FE      [19]  434 	ld	a,-2 (ix)
   26DC C6 0A         [ 7]  435 	add	a, #0x0A
   26DE DD 77 EA      [19]  436 	ld	-22 (ix),a
   26E1 DD 7E FF      [19]  437 	ld	a,-1 (ix)
   26E4 CE 00         [ 7]  438 	adc	a, #0x00
   26E6 DD 77 EB      [19]  439 	ld	-21 (ix),a
                            440 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
   26E9 DD 7E FE      [19]  441 	ld	a,-2 (ix)
   26EC C6 0C         [ 7]  442 	add	a, #0x0C
   26EE DD 77 E8      [19]  443 	ld	-24 (ix),a
   26F1 DD 7E FF      [19]  444 	ld	a,-1 (ix)
   26F4 CE 00         [ 7]  445 	adc	a, #0x00
   26F6 DD 77 E9      [19]  446 	ld	-23 (ix),a
                            447 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
   26F9 DD 7E FE      [19]  448 	ld	a,-2 (ix)
   26FC C6 0E         [ 7]  449 	add	a, #0x0E
   26FE DD 77 E6      [19]  450 	ld	-26 (ix),a
   2701 DD 7E FF      [19]  451 	ld	a,-1 (ix)
   2704 CE 00         [ 7]  452 	adc	a, #0x00
   2706 DD 77 E7      [19]  453 	ld	-25 (ix),a
                            454 ;src/entities/enemies.c:90: enemies[k].movement=0;
   2709 DD 7E FE      [19]  455 	ld	a,-2 (ix)
   270C C6 1D         [ 7]  456 	add	a, #0x1D
   270E DD 77 E4      [19]  457 	ld	-28 (ix),a
   2711 DD 7E FF      [19]  458 	ld	a,-1 (ix)
   2714 CE 00         [ 7]  459 	adc	a, #0x00
   2716 DD 77 E5      [19]  460 	ld	-27 (ix),a
                            461 ;src/entities/enemies.c:91: enemies[k].stage=0;
   2719 DD 7E FE      [19]  462 	ld	a,-2 (ix)
   271C C6 1E         [ 7]  463 	add	a, #0x1E
   271E DD 77 E2      [19]  464 	ld	-30 (ix),a
   2721 DD 7E FF      [19]  465 	ld	a,-1 (ix)
   2724 CE 00         [ 7]  466 	adc	a, #0x00
   2726 DD 77 E3      [19]  467 	ld	-29 (ix),a
                            468 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   2729 DD 7E FE      [19]  469 	ld	a,-2 (ix)
   272C C6 1F         [ 7]  470 	add	a, #0x1F
   272E DD 77 E0      [19]  471 	ld	-32 (ix),a
   2731 DD 7E FF      [19]  472 	ld	a,-1 (ix)
   2734 CE 00         [ 7]  473 	adc	a, #0x00
   2736 DD 77 E1      [19]  474 	ld	-31 (ix),a
                            475 ;src/entities/enemies.c:74: switch (type){
   2739 DD 7E 08      [19]  476 	ld	a,8 (ix)
   273C 3D            [ 4]  477 	dec	a
   273D 28 0B         [12]  478 	jr	Z,00104$
   273F DD 7E 08      [19]  479 	ld	a,8 (ix)
   2742 D6 02         [ 7]  480 	sub	a, #0x02
   2744 CA EF 27      [10]  481 	jp	Z,00105$
   2747 C3 94 28      [10]  482 	jp	00106$
                            483 ;src/entities/enemies.c:76: case 1:
   274A                     484 00104$:
                            485 ;src/entities/enemies.c:77: enemies[k].x=x;
   274A DD 6E FC      [19]  486 	ld	l,-4 (ix)
   274D DD 66 FD      [19]  487 	ld	h,-3 (ix)
   2750 DD 7E 04      [19]  488 	ld	a,4 (ix)
   2753 77            [ 7]  489 	ld	(hl),a
   2754 23            [ 6]  490 	inc	hl
   2755 DD 7E 05      [19]  491 	ld	a,5 (ix)
   2758 77            [ 7]  492 	ld	(hl),a
                            493 ;src/entities/enemies.c:78: enemies[k].y=y;
   2759 DD 6E FA      [19]  494 	ld	l,-6 (ix)
   275C DD 66 FB      [19]  495 	ld	h,-5 (ix)
   275F DD 7E 06      [19]  496 	ld	a,6 (ix)
   2762 77            [ 7]  497 	ld	(hl),a
   2763 23            [ 6]  498 	inc	hl
   2764 DD 7E 07      [19]  499 	ld	a,7 (ix)
   2767 77            [ 7]  500 	ld	(hl),a
                            501 ;src/entities/enemies.c:79: enemies[k].w=4;
   2768 DD 6E F8      [19]  502 	ld	l,-8 (ix)
   276B DD 66 F9      [19]  503 	ld	h,-7 (ix)
   276E 36 04         [10]  504 	ld	(hl),#0x04
                            505 ;src/entities/enemies.c:80: enemies[k].h=8;
   2770 DD 6E F6      [19]  506 	ld	l,-10 (ix)
   2773 DD 66 F7      [19]  507 	ld	h,-9 (ix)
   2776 36 08         [10]  508 	ld	(hl),#0x08
                            509 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   2778 DD 6E F4      [19]  510 	ld	l,-12 (ix)
   277B DD 66 F5      [19]  511 	ld	h,-11 (ix)
   277E 36 00         [10]  512 	ld	(hl),#0x00
                            513 ;src/entities/enemies.c:82: enemies[k].sprite[0]= (u8*) G_baddie04_00;
   2780 DD 6E FE      [19]  514 	ld	l,-2 (ix)
   2783 DD 66 FF      [19]  515 	ld	h,-1 (ix)
   2786 36 DA         [10]  516 	ld	(hl),#<(_G_baddie04_00)
   2788 23            [ 6]  517 	inc	hl
   2789 36 4A         [10]  518 	ld	(hl),#>(_G_baddie04_00)
                            519 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
   278B DD 6E F2      [19]  520 	ld	l,-14 (ix)
   278E DD 66 F3      [19]  521 	ld	h,-13 (ix)
   2791 36 FA         [10]  522 	ld	(hl),#<(_G_baddie04_01)
   2793 23            [ 6]  523 	inc	hl
   2794 36 4A         [10]  524 	ld	(hl),#>(_G_baddie04_01)
                            525 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
   2796 DD 6E F0      [19]  526 	ld	l,-16 (ix)
   2799 DD 66 F1      [19]  527 	ld	h,-15 (ix)
   279C 36 1A         [10]  528 	ld	(hl),#<(_G_baddie04_02)
   279E 23            [ 6]  529 	inc	hl
   279F 36 4B         [10]  530 	ld	(hl),#>(_G_baddie04_02)
                            531 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
   27A1 DD 6E EE      [19]  532 	ld	l,-18 (ix)
   27A4 DD 66 EF      [19]  533 	ld	h,-17 (ix)
   27A7 36 3A         [10]  534 	ld	(hl),#<(_G_baddie04_03)
   27A9 23            [ 6]  535 	inc	hl
   27AA 36 4B         [10]  536 	ld	(hl),#>(_G_baddie04_03)
                            537 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
   27AC DD 6E EC      [19]  538 	ld	l,-20 (ix)
   27AF DD 66 ED      [19]  539 	ld	h,-19 (ix)
   27B2 36 5A         [10]  540 	ld	(hl),#<(_G_baddie04_04)
   27B4 23            [ 6]  541 	inc	hl
   27B5 36 4B         [10]  542 	ld	(hl),#>(_G_baddie04_04)
                            543 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
   27B7 DD 6E EA      [19]  544 	ld	l,-22 (ix)
   27BA DD 66 EB      [19]  545 	ld	h,-21 (ix)
   27BD 36 7A         [10]  546 	ld	(hl),#<(_G_baddie04_05)
   27BF 23            [ 6]  547 	inc	hl
   27C0 36 4B         [10]  548 	ld	(hl),#>(_G_baddie04_05)
                            549 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
   27C2 DD 6E E8      [19]  550 	ld	l,-24 (ix)
   27C5 DD 66 E9      [19]  551 	ld	h,-23 (ix)
   27C8 36 9A         [10]  552 	ld	(hl),#<(_G_baddie04_06)
   27CA 23            [ 6]  553 	inc	hl
   27CB 36 4B         [10]  554 	ld	(hl),#>(_G_baddie04_06)
                            555 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
   27CD DD 6E E6      [19]  556 	ld	l,-26 (ix)
   27D0 DD 66 E7      [19]  557 	ld	h,-25 (ix)
   27D3 36 BA         [10]  558 	ld	(hl),#<(_G_baddie04_07)
   27D5 23            [ 6]  559 	inc	hl
   27D6 36 4B         [10]  560 	ld	(hl),#>(_G_baddie04_07)
                            561 ;src/entities/enemies.c:90: enemies[k].movement=0;
   27D8 DD 6E E4      [19]  562 	ld	l,-28 (ix)
   27DB DD 66 E5      [19]  563 	ld	h,-27 (ix)
   27DE 36 00         [10]  564 	ld	(hl),#0x00
                            565 ;src/entities/enemies.c:91: enemies[k].stage=0;
   27E0 DD 6E E2      [19]  566 	ld	l,-30 (ix)
   27E3 DD 66 E3      [19]  567 	ld	h,-29 (ix)
   27E6 36 00         [10]  568 	ld	(hl),#0x00
                            569 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   27E8 E1            [10]  570 	pop	hl
   27E9 E5            [11]  571 	push	hl
   27EA 36 00         [10]  572 	ld	(hl),#0x00
                            573 ;src/entities/enemies.c:93: break;
   27EC C3 36 29      [10]  574 	jp	00107$
                            575 ;src/entities/enemies.c:94: case 2:
   27EF                     576 00105$:
                            577 ;src/entities/enemies.c:95: enemies[k].x=x;
   27EF DD 6E FC      [19]  578 	ld	l,-4 (ix)
   27F2 DD 66 FD      [19]  579 	ld	h,-3 (ix)
   27F5 DD 7E 04      [19]  580 	ld	a,4 (ix)
   27F8 77            [ 7]  581 	ld	(hl),a
   27F9 23            [ 6]  582 	inc	hl
   27FA DD 7E 05      [19]  583 	ld	a,5 (ix)
   27FD 77            [ 7]  584 	ld	(hl),a
                            585 ;src/entities/enemies.c:96: enemies[k].y=y;
   27FE DD 6E FA      [19]  586 	ld	l,-6 (ix)
   2801 DD 66 FB      [19]  587 	ld	h,-5 (ix)
   2804 DD 7E 06      [19]  588 	ld	a,6 (ix)
   2807 77            [ 7]  589 	ld	(hl),a
   2808 23            [ 6]  590 	inc	hl
   2809 DD 7E 07      [19]  591 	ld	a,7 (ix)
   280C 77            [ 7]  592 	ld	(hl),a
                            593 ;src/entities/enemies.c:97: enemies[k].w=4;
   280D DD 6E F8      [19]  594 	ld	l,-8 (ix)
   2810 DD 66 F9      [19]  595 	ld	h,-7 (ix)
   2813 36 04         [10]  596 	ld	(hl),#0x04
                            597 ;src/entities/enemies.c:98: enemies[k].h=8;
   2815 DD 6E F6      [19]  598 	ld	l,-10 (ix)
   2818 DD 66 F7      [19]  599 	ld	h,-9 (ix)
   281B 36 08         [10]  600 	ld	(hl),#0x08
                            601 ;src/entities/enemies.c:99: enemies[k].num_frames=0;
   281D DD 6E F4      [19]  602 	ld	l,-12 (ix)
   2820 DD 66 F5      [19]  603 	ld	h,-11 (ix)
   2823 36 00         [10]  604 	ld	(hl),#0x00
                            605 ;src/entities/enemies.c:100: enemies[k].sprite[0]= (u8*) G_baddie03_00;
   2825 DD 6E FE      [19]  606 	ld	l,-2 (ix)
   2828 DD 66 FF      [19]  607 	ld	h,-1 (ix)
   282B 36 57         [10]  608 	ld	(hl),#<(_G_baddie03_00)
   282D 23            [ 6]  609 	inc	hl
   282E 36 45         [10]  610 	ld	(hl),#>(_G_baddie03_00)
                            611 ;src/entities/enemies.c:101: enemies[k].sprite[1]= (u8*) G_baddie03_01;
   2830 DD 6E F2      [19]  612 	ld	l,-14 (ix)
   2833 DD 66 F3      [19]  613 	ld	h,-13 (ix)
   2836 36 77         [10]  614 	ld	(hl),#<(_G_baddie03_01)
   2838 23            [ 6]  615 	inc	hl
   2839 36 45         [10]  616 	ld	(hl),#>(_G_baddie03_01)
                            617 ;src/entities/enemies.c:102: enemies[k].sprite[2]= (u8*) G_baddie03_02;
   283B DD 6E F0      [19]  618 	ld	l,-16 (ix)
   283E DD 66 F1      [19]  619 	ld	h,-15 (ix)
   2841 36 97         [10]  620 	ld	(hl),#<(_G_baddie03_02)
   2843 23            [ 6]  621 	inc	hl
   2844 36 45         [10]  622 	ld	(hl),#>(_G_baddie03_02)
                            623 ;src/entities/enemies.c:103: enemies[k].sprite[3]= (u8*) G_baddie03_03;
   2846 DD 6E EE      [19]  624 	ld	l,-18 (ix)
   2849 DD 66 EF      [19]  625 	ld	h,-17 (ix)
   284C 36 B7         [10]  626 	ld	(hl),#<(_G_baddie03_03)
   284E 23            [ 6]  627 	inc	hl
   284F 36 45         [10]  628 	ld	(hl),#>(_G_baddie03_03)
                            629 ;src/entities/enemies.c:104: enemies[k].sprite[4]= (u8*) G_baddie03_04;
   2851 DD 6E EC      [19]  630 	ld	l,-20 (ix)
   2854 DD 66 ED      [19]  631 	ld	h,-19 (ix)
   2857 36 D7         [10]  632 	ld	(hl),#<(_G_baddie03_04)
   2859 23            [ 6]  633 	inc	hl
   285A 36 45         [10]  634 	ld	(hl),#>(_G_baddie03_04)
                            635 ;src/entities/enemies.c:105: enemies[k].sprite[5]= (u8*) G_baddie03_05;
   285C DD 6E EA      [19]  636 	ld	l,-22 (ix)
   285F DD 66 EB      [19]  637 	ld	h,-21 (ix)
   2862 36 F7         [10]  638 	ld	(hl),#<(_G_baddie03_05)
   2864 23            [ 6]  639 	inc	hl
   2865 36 45         [10]  640 	ld	(hl),#>(_G_baddie03_05)
                            641 ;src/entities/enemies.c:106: enemies[k].sprite[6]= (u8*) G_baddie03_06;
   2867 DD 6E E8      [19]  642 	ld	l,-24 (ix)
   286A DD 66 E9      [19]  643 	ld	h,-23 (ix)
   286D 36 17         [10]  644 	ld	(hl),#<(_G_baddie03_06)
   286F 23            [ 6]  645 	inc	hl
   2870 36 46         [10]  646 	ld	(hl),#>(_G_baddie03_06)
                            647 ;src/entities/enemies.c:107: enemies[k].sprite[7]= (u8*) G_baddie03_07;
   2872 DD 6E E6      [19]  648 	ld	l,-26 (ix)
   2875 DD 66 E7      [19]  649 	ld	h,-25 (ix)
   2878 36 37         [10]  650 	ld	(hl),#<(_G_baddie03_07)
   287A 23            [ 6]  651 	inc	hl
   287B 36 46         [10]  652 	ld	(hl),#>(_G_baddie03_07)
                            653 ;src/entities/enemies.c:108: enemies[k].movement=0;
   287D DD 6E E4      [19]  654 	ld	l,-28 (ix)
   2880 DD 66 E5      [19]  655 	ld	h,-27 (ix)
   2883 36 00         [10]  656 	ld	(hl),#0x00
                            657 ;src/entities/enemies.c:109: enemies[k].stage=0;
   2885 DD 6E E2      [19]  658 	ld	l,-30 (ix)
   2888 DD 66 E3      [19]  659 	ld	h,-29 (ix)
   288B 36 00         [10]  660 	ld	(hl),#0x00
                            661 ;src/entities/enemies.c:110: enemies[k].stage_step=0;
   288D E1            [10]  662 	pop	hl
   288E E5            [11]  663 	push	hl
   288F 36 00         [10]  664 	ld	(hl),#0x00
                            665 ;src/entities/enemies.c:111: break;
   2891 C3 36 29      [10]  666 	jp	00107$
                            667 ;src/entities/enemies.c:112: default:
   2894                     668 00106$:
                            669 ;src/entities/enemies.c:113: enemies[k].x=x;
   2894 DD 6E FC      [19]  670 	ld	l,-4 (ix)
   2897 DD 66 FD      [19]  671 	ld	h,-3 (ix)
   289A DD 7E 04      [19]  672 	ld	a,4 (ix)
   289D 77            [ 7]  673 	ld	(hl),a
   289E 23            [ 6]  674 	inc	hl
   289F DD 7E 05      [19]  675 	ld	a,5 (ix)
   28A2 77            [ 7]  676 	ld	(hl),a
                            677 ;src/entities/enemies.c:114: enemies[k].y=y;
   28A3 DD 6E FA      [19]  678 	ld	l,-6 (ix)
   28A6 DD 66 FB      [19]  679 	ld	h,-5 (ix)
   28A9 DD 7E 06      [19]  680 	ld	a,6 (ix)
   28AC 77            [ 7]  681 	ld	(hl),a
   28AD 23            [ 6]  682 	inc	hl
   28AE DD 7E 07      [19]  683 	ld	a,7 (ix)
   28B1 77            [ 7]  684 	ld	(hl),a
                            685 ;src/entities/enemies.c:115: enemies[k].w=5;
   28B2 DD 6E F8      [19]  686 	ld	l,-8 (ix)
   28B5 DD 66 F9      [19]  687 	ld	h,-7 (ix)
   28B8 36 05         [10]  688 	ld	(hl),#0x05
                            689 ;src/entities/enemies.c:116: enemies[k].h=16;
   28BA DD 6E F6      [19]  690 	ld	l,-10 (ix)
   28BD DD 66 F7      [19]  691 	ld	h,-9 (ix)
   28C0 36 10         [10]  692 	ld	(hl),#0x10
                            693 ;src/entities/enemies.c:117: enemies[k].num_frames=0;
   28C2 DD 6E F4      [19]  694 	ld	l,-12 (ix)
   28C5 DD 66 F5      [19]  695 	ld	h,-11 (ix)
   28C8 36 00         [10]  696 	ld	(hl),#0x00
                            697 ;src/entities/enemies.c:118: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   28CA DD 6E FE      [19]  698 	ld	l,-2 (ix)
   28CD DD 66 FF      [19]  699 	ld	h,-1 (ix)
   28D0 36 E0         [10]  700 	ld	(hl),#<(_G_baddie01_00)
   28D2 23            [ 6]  701 	inc	hl
   28D3 36 3D         [10]  702 	ld	(hl),#>(_G_baddie01_00)
                            703 ;src/entities/enemies.c:119: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   28D5 DD 6E F2      [19]  704 	ld	l,-14 (ix)
   28D8 DD 66 F3      [19]  705 	ld	h,-13 (ix)
   28DB 36 30         [10]  706 	ld	(hl),#<(_G_baddie01_01)
   28DD 23            [ 6]  707 	inc	hl
   28DE 36 3E         [10]  708 	ld	(hl),#>(_G_baddie01_01)
                            709 ;src/entities/enemies.c:120: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   28E0 DD 6E F0      [19]  710 	ld	l,-16 (ix)
   28E3 DD 66 F1      [19]  711 	ld	h,-15 (ix)
   28E6 36 80         [10]  712 	ld	(hl),#<(_G_baddie01_02)
   28E8 23            [ 6]  713 	inc	hl
   28E9 36 3E         [10]  714 	ld	(hl),#>(_G_baddie01_02)
                            715 ;src/entities/enemies.c:121: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   28EB DD 6E EE      [19]  716 	ld	l,-18 (ix)
   28EE DD 66 EF      [19]  717 	ld	h,-17 (ix)
   28F1 36 D0         [10]  718 	ld	(hl),#<(_G_baddie01_03)
   28F3 23            [ 6]  719 	inc	hl
   28F4 36 3E         [10]  720 	ld	(hl),#>(_G_baddie01_03)
                            721 ;src/entities/enemies.c:122: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   28F6 DD 6E EC      [19]  722 	ld	l,-20 (ix)
   28F9 DD 66 ED      [19]  723 	ld	h,-19 (ix)
   28FC 36 20         [10]  724 	ld	(hl),#<(_G_baddie01_04)
   28FE 23            [ 6]  725 	inc	hl
   28FF 36 3F         [10]  726 	ld	(hl),#>(_G_baddie01_04)
                            727 ;src/entities/enemies.c:123: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   2901 DD 6E EA      [19]  728 	ld	l,-22 (ix)
   2904 DD 66 EB      [19]  729 	ld	h,-21 (ix)
   2907 36 70         [10]  730 	ld	(hl),#<(_G_baddie01_05)
   2909 23            [ 6]  731 	inc	hl
   290A 36 3F         [10]  732 	ld	(hl),#>(_G_baddie01_05)
                            733 ;src/entities/enemies.c:124: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   290C DD 6E E8      [19]  734 	ld	l,-24 (ix)
   290F DD 66 E9      [19]  735 	ld	h,-23 (ix)
   2912 36 C0         [10]  736 	ld	(hl),#<(_G_baddie01_06)
   2914 23            [ 6]  737 	inc	hl
   2915 36 3F         [10]  738 	ld	(hl),#>(_G_baddie01_06)
                            739 ;src/entities/enemies.c:125: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2917 DD 6E E6      [19]  740 	ld	l,-26 (ix)
   291A DD 66 E7      [19]  741 	ld	h,-25 (ix)
   291D 36 10         [10]  742 	ld	(hl),#<(_G_baddie01_07)
   291F 23            [ 6]  743 	inc	hl
   2920 36 40         [10]  744 	ld	(hl),#>(_G_baddie01_07)
                            745 ;src/entities/enemies.c:126: enemies[k].movement=1;
   2922 DD 6E E4      [19]  746 	ld	l,-28 (ix)
   2925 DD 66 E5      [19]  747 	ld	h,-27 (ix)
   2928 36 01         [10]  748 	ld	(hl),#0x01
                            749 ;src/entities/enemies.c:127: enemies[k].stage=0;
   292A DD 6E E2      [19]  750 	ld	l,-30 (ix)
   292D DD 66 E3      [19]  751 	ld	h,-29 (ix)
   2930 36 00         [10]  752 	ld	(hl),#0x00
                            753 ;src/entities/enemies.c:128: enemies[k].stage_step=0;
   2932 E1            [10]  754 	pop	hl
   2933 E5            [11]  755 	push	hl
   2934 36 00         [10]  756 	ld	(hl),#0x00
                            757 ;src/entities/enemies.c:130: }
   2936                     758 00107$:
                            759 ;src/entities/enemies.c:131: active_enemies++;
   2936 21 42 67      [10]  760 	ld	hl, #_active_enemies+0
   2939 34            [11]  761 	inc	(hl)
   293A                     762 00110$:
   293A DD F9         [10]  763 	ld	sp, ix
   293C DD E1         [14]  764 	pop	ix
   293E C9            [10]  765 	ret
                            766 ;src/entities/enemies.c:137: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            767 ;	---------------------------------
                            768 ; Function create_enemy_group
                            769 ; ---------------------------------
   293F                     770 _create_enemy_group::
   293F DD E5         [15]  771 	push	ix
   2941 DD 21 00 00   [14]  772 	ld	ix,#0
   2945 DD 39         [15]  773 	add	ix,sp
                            774 ;src/entities/enemies.c:139: if (active_groups < MAX_ENEMY_GROUPS){
   2947 3A 63 67      [13]  775 	ld	a,(#_active_groups + 0)
   294A D6 04         [ 7]  776 	sub	a, #0x04
   294C 30 4E         [12]  777 	jr	NC,00106$
                            778 ;src/entities/enemies.c:141: while (groups[k].active){
   294E 16 00         [ 7]  779 	ld	d,#0x00
   2950                     780 00101$:
   2950 6A            [ 4]  781 	ld	l,d
   2951 26 00         [ 7]  782 	ld	h,#0x00
   2953 29            [11]  783 	add	hl, hl
   2954 29            [11]  784 	add	hl, hl
   2955 29            [11]  785 	add	hl, hl
   2956 3E 43         [ 7]  786 	ld	a,#<(_groups)
   2958 85            [ 4]  787 	add	a, l
   2959 4F            [ 4]  788 	ld	c,a
   295A 3E 67         [ 7]  789 	ld	a,#>(_groups)
   295C 8C            [ 4]  790 	adc	a, h
   295D 47            [ 4]  791 	ld	b,a
   295E 0A            [ 7]  792 	ld	a,(bc)
   295F B7            [ 4]  793 	or	a, a
   2960 28 03         [12]  794 	jr	Z,00103$
                            795 ;src/entities/enemies.c:142: k++;
   2962 14            [ 4]  796 	inc	d
   2963 18 EB         [12]  797 	jr	00101$
   2965                     798 00103$:
                            799 ;src/entities/enemies.c:144: groups[k].active=1;
   2965 3E 01         [ 7]  800 	ld	a,#0x01
   2967 02            [ 7]  801 	ld	(bc),a
                            802 ;src/entities/enemies.c:145: groups[k].x=x;
   2968 69            [ 4]  803 	ld	l, c
   2969 60            [ 4]  804 	ld	h, b
   296A 23            [ 6]  805 	inc	hl
   296B DD 7E 04      [19]  806 	ld	a,4 (ix)
   296E 77            [ 7]  807 	ld	(hl),a
   296F 23            [ 6]  808 	inc	hl
   2970 DD 7E 05      [19]  809 	ld	a,5 (ix)
   2973 77            [ 7]  810 	ld	(hl),a
                            811 ;src/entities/enemies.c:146: groups[k].y=y;
   2974 69            [ 4]  812 	ld	l, c
   2975 60            [ 4]  813 	ld	h, b
   2976 23            [ 6]  814 	inc	hl
   2977 23            [ 6]  815 	inc	hl
   2978 23            [ 6]  816 	inc	hl
   2979 DD 7E 06      [19]  817 	ld	a,6 (ix)
   297C 77            [ 7]  818 	ld	(hl),a
   297D 23            [ 6]  819 	inc	hl
   297E DD 7E 07      [19]  820 	ld	a,7 (ix)
   2981 77            [ 7]  821 	ld	(hl),a
                            822 ;src/entities/enemies.c:147: groups[k].enemy_type=type;
   2982 21 05 00      [10]  823 	ld	hl,#0x0005
   2985 09            [11]  824 	add	hl,bc
   2986 DD 7E 08      [19]  825 	ld	a,8 (ix)
   2989 77            [ 7]  826 	ld	(hl),a
                            827 ;src/entities/enemies.c:148: groups[k].num_enemies=num_enemies;
   298A 21 06 00      [10]  828 	ld	hl,#0x0006
   298D 09            [11]  829 	add	hl,bc
   298E DD 7E 09      [19]  830 	ld	a,9 (ix)
   2991 77            [ 7]  831 	ld	(hl),a
                            832 ;src/entities/enemies.c:149: groups[k].sleep=ENEMY_GAP;
   2992 21 07 00      [10]  833 	ld	hl,#0x0007
   2995 09            [11]  834 	add	hl,bc
   2996 36 03         [10]  835 	ld	(hl),#0x03
                            836 ;src/entities/enemies.c:150: active_groups++;
   2998 21 63 67      [10]  837 	ld	hl, #_active_groups+0
   299B 34            [11]  838 	inc	(hl)
   299C                     839 00106$:
   299C DD E1         [14]  840 	pop	ix
   299E C9            [10]  841 	ret
                            842 ;src/entities/enemies.c:158: void update_enemies(){
                            843 ;	---------------------------------
                            844 ; Function update_enemies
                            845 ; ---------------------------------
   299F                     846 _update_enemies::
   299F DD E5         [15]  847 	push	ix
   29A1 DD 21 00 00   [14]  848 	ld	ix,#0
   29A5 DD 39         [15]  849 	add	ix,sp
   29A7 21 EB FF      [10]  850 	ld	hl,#-21
   29AA 39            [11]  851 	add	hl,sp
   29AB F9            [ 6]  852 	ld	sp,hl
                            853 ;src/entities/enemies.c:162: if (active_enemies>0){
   29AC 3A 42 67      [13]  854 	ld	a,(#_active_enemies + 0)
   29AF B7            [ 4]  855 	or	a, a
   29B0 CA 67 2E      [10]  856 	jp	Z,00112$
                            857 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   29B3 DD 36 EB 00   [19]  858 	ld	-21 (ix),#0x00
   29B7 DD 36 FB 00   [19]  859 	ld	-5 (ix),#0x00
   29BB DD 36 FC 00   [19]  860 	ld	-4 (ix),#0x00
   29BF DD 36 FD 00   [19]  861 	ld	-3 (ix),#0x00
   29C3 DD 36 FE 00   [19]  862 	ld	-2 (ix),#0x00
   29C7                     863 00124$:
                            864 ;src/entities/enemies.c:164: if (enemies[i].active){
   29C7 3E 0A         [ 7]  865 	ld	a,#<(_enemies)
   29C9 DD 86 FD      [19]  866 	add	a, -3 (ix)
   29CC DD 77 EC      [19]  867 	ld	-20 (ix),a
   29CF 3E 63         [ 7]  868 	ld	a,#>(_enemies)
   29D1 DD 8E FE      [19]  869 	adc	a, -2 (ix)
   29D4 DD 77 ED      [19]  870 	ld	-19 (ix),a
   29D7 DD 4E EC      [19]  871 	ld	c,-20 (ix)
   29DA DD 46 ED      [19]  872 	ld	b,-19 (ix)
   29DD C5            [11]  873 	push	bc
   29DE FD E1         [14]  874 	pop	iy
   29E0 FD 7E 17      [19]  875 	ld	a,23 (iy)
   29E3 DD 77 FF      [19]  876 	ld	-1 (ix), a
   29E6 B7            [ 4]  877 	or	a, a
   29E7 CA 3C 2E      [10]  878 	jp	Z,00125$
                            879 ;src/entities/enemies.c:165: if (enemies[i].movement<99){
   29EA DD 7E EC      [19]  880 	ld	a,-20 (ix)
   29ED C6 1D         [ 7]  881 	add	a, #0x1D
   29EF DD 77 F9      [19]  882 	ld	-7 (ix),a
   29F2 DD 7E ED      [19]  883 	ld	a,-19 (ix)
   29F5 CE 00         [ 7]  884 	adc	a, #0x00
   29F7 DD 77 FA      [19]  885 	ld	-6 (ix),a
   29FA DD 6E F9      [19]  886 	ld	l,-7 (ix)
   29FD DD 66 FA      [19]  887 	ld	h,-6 (ix)
   2A00 56            [ 7]  888 	ld	d,(hl)
   2A01 7A            [ 4]  889 	ld	a,d
   2A02 D6 63         [ 7]  890 	sub	a, #0x63
   2A04 D2 3C 2E      [10]  891 	jp	NC,00125$
                            892 ;src/entities/enemies.c:166: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   2A07 DD 7E EC      [19]  893 	ld	a,-20 (ix)
   2A0A C6 1F         [ 7]  894 	add	a, #0x1F
   2A0C DD 77 F7      [19]  895 	ld	-9 (ix),a
   2A0F DD 7E ED      [19]  896 	ld	a,-19 (ix)
   2A12 CE 00         [ 7]  897 	adc	a, #0x00
   2A14 DD 77 F8      [19]  898 	ld	-8 (ix),a
   2A17 DD 6E F7      [19]  899 	ld	l,-9 (ix)
   2A1A DD 66 F8      [19]  900 	ld	h,-8 (ix)
   2A1D 5E            [ 7]  901 	ld	e,(hl)
   2A1E 4A            [ 4]  902 	ld	c,d
   2A1F 06 00         [ 7]  903 	ld	b,#0x00
   2A21 69            [ 4]  904 	ld	l, c
   2A22 60            [ 4]  905 	ld	h, b
   2A23 29            [11]  906 	add	hl, hl
   2A24 29            [11]  907 	add	hl, hl
   2A25 29            [11]  908 	add	hl, hl
   2A26 29            [11]  909 	add	hl, hl
   2A27 29            [11]  910 	add	hl, hl
   2A28 09            [11]  911 	add	hl, bc
   2A29 01 37 35      [10]  912 	ld	bc,#_movements
   2A2C 09            [11]  913 	add	hl,bc
   2A2D 23            [ 6]  914 	inc	hl
   2A2E 45            [ 4]  915 	ld	b,l
   2A2F 54            [ 4]  916 	ld	d,h
   2A30 DD 7E EC      [19]  917 	ld	a,-20 (ix)
   2A33 C6 1E         [ 7]  918 	add	a, #0x1E
   2A35 DD 77 F5      [19]  919 	ld	-11 (ix),a
   2A38 DD 7E ED      [19]  920 	ld	a,-19 (ix)
   2A3B CE 00         [ 7]  921 	adc	a, #0x00
   2A3D DD 77 F6      [19]  922 	ld	-10 (ix),a
   2A40 DD 6E F5      [19]  923 	ld	l,-11 (ix)
   2A43 DD 66 F6      [19]  924 	ld	h,-10 (ix)
   2A46 7E            [ 7]  925 	ld	a,(hl)
   2A47 DD 77 FF      [19]  926 	ld	-1 (ix), a
   2A4A 87            [ 4]  927 	add	a, a
   2A4B 87            [ 4]  928 	add	a, a
   2A4C 80            [ 4]  929 	add	a,b
   2A4D DD 77 F3      [19]  930 	ld	-13 (ix),a
   2A50 7A            [ 4]  931 	ld	a,d
   2A51 CE 00         [ 7]  932 	adc	a, #0x00
   2A53 DD 77 F4      [19]  933 	ld	-12 (ix),a
   2A56 DD 6E F3      [19]  934 	ld	l,-13 (ix)
   2A59 DD 66 F4      [19]  935 	ld	h,-12 (ix)
   2A5C 23            [ 6]  936 	inc	hl
   2A5D 23            [ 6]  937 	inc	hl
   2A5E 23            [ 6]  938 	inc	hl
   2A5F 66            [ 7]  939 	ld	h,(hl)
   2A60 7B            [ 4]  940 	ld	a,e
   2A61 94            [ 4]  941 	sub	a, h
   2A62 D2 D2 2B      [10]  942 	jp	NC,00104$
                            943 ;src/entities/enemies.c:167: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2A65 DD 7E EC      [19]  944 	ld	a,-20 (ix)
   2A68 C6 16         [ 7]  945 	add	a, #0x16
   2A6A DD 77 F1      [19]  946 	ld	-15 (ix),a
   2A6D DD 7E ED      [19]  947 	ld	a,-19 (ix)
   2A70 CE 00         [ 7]  948 	adc	a, #0x00
   2A72 DD 77 F2      [19]  949 	ld	-14 (ix),a
   2A75 DD 6E F3      [19]  950 	ld	l,-13 (ix)
   2A78 DD 66 F4      [19]  951 	ld	h,-12 (ix)
   2A7B 7E            [ 7]  952 	ld	a,(hl)
   2A7C DD 77 F3      [19]  953 	ld	-13 (ix),a
   2A7F DD 6E F1      [19]  954 	ld	l,-15 (ix)
   2A82 DD 66 F2      [19]  955 	ld	h,-14 (ix)
   2A85 DD 7E F3      [19]  956 	ld	a,-13 (ix)
   2A88 77            [ 7]  957 	ld	(hl),a
                            958 ;src/entities/enemies.c:168: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2A89 DD 7E EC      [19]  959 	ld	a,-20 (ix)
   2A8C C6 10         [ 7]  960 	add	a, #0x10
   2A8E DD 77 F1      [19]  961 	ld	-15 (ix),a
   2A91 DD 7E ED      [19]  962 	ld	a,-19 (ix)
   2A94 CE 00         [ 7]  963 	adc	a, #0x00
   2A96 DD 77 F2      [19]  964 	ld	-14 (ix),a
   2A99 DD 6E F1      [19]  965 	ld	l,-15 (ix)
   2A9C DD 66 F2      [19]  966 	ld	h,-14 (ix)
   2A9F 7E            [ 7]  967 	ld	a,(hl)
   2AA0 DD 77 F3      [19]  968 	ld	-13 (ix),a
   2AA3 23            [ 6]  969 	inc	hl
   2AA4 7E            [ 7]  970 	ld	a,(hl)
   2AA5 DD 77 F4      [19]  971 	ld	-12 (ix),a
   2AA8 DD 6E F9      [19]  972 	ld	l,-7 (ix)
   2AAB DD 66 FA      [19]  973 	ld	h,-6 (ix)
   2AAE 4E            [ 7]  974 	ld	c, (hl)
   2AAF 06 00         [ 7]  975 	ld	b,#0x00
   2AB1 69            [ 4]  976 	ld	l, c
   2AB2 60            [ 4]  977 	ld	h, b
   2AB3 29            [11]  978 	add	hl, hl
   2AB4 29            [11]  979 	add	hl, hl
   2AB5 29            [11]  980 	add	hl, hl
   2AB6 29            [11]  981 	add	hl, hl
   2AB7 29            [11]  982 	add	hl, hl
   2AB8 09            [11]  983 	add	hl, bc
   2AB9 3E 37         [ 7]  984 	ld	a,#<(_movements)
   2ABB 85            [ 4]  985 	add	a, l
   2ABC DD 77 EF      [19]  986 	ld	-17 (ix),a
   2ABF 3E 35         [ 7]  987 	ld	a,#>(_movements)
   2AC1 8C            [ 4]  988 	adc	a, h
   2AC2 DD 77 F0      [19]  989 	ld	-16 (ix),a
   2AC5 DD 34 EF      [23]  990 	inc	-17 (ix)
   2AC8 20 03         [12]  991 	jr	NZ,00176$
   2ACA DD 34 F0      [23]  992 	inc	-16 (ix)
   2ACD                     993 00176$:
   2ACD DD 6E F5      [19]  994 	ld	l,-11 (ix)
   2AD0 DD 66 F6      [19]  995 	ld	h,-10 (ix)
   2AD3 7E            [ 7]  996 	ld	a,(hl)
   2AD4 DD 77 EE      [19]  997 	ld	-18 (ix), a
   2AD7 87            [ 4]  998 	add	a, a
   2AD8 87            [ 4]  999 	add	a, a
   2AD9 67            [ 4] 1000 	ld	h,a
   2ADA DD 7E EF      [19] 1001 	ld	a,-17 (ix)
   2ADD 84            [ 4] 1002 	add	a, h
   2ADE DD 77 EF      [19] 1003 	ld	-17 (ix),a
   2AE1 DD 7E F0      [19] 1004 	ld	a,-16 (ix)
   2AE4 CE 00         [ 7] 1005 	adc	a, #0x00
   2AE6 DD 77 F0      [19] 1006 	ld	-16 (ix),a
   2AE9 DD 6E EF      [19] 1007 	ld	l,-17 (ix)
   2AEC DD 66 F0      [19] 1008 	ld	h,-16 (ix)
   2AEF 23            [ 6] 1009 	inc	hl
   2AF0 7E            [ 7] 1010 	ld	a,(hl)
   2AF1 DD 77 EE      [19] 1011 	ld	-18 (ix), a
   2AF4 DD 77 EF      [19] 1012 	ld	-17 (ix),a
   2AF7 DD 7E EE      [19] 1013 	ld	a,-18 (ix)
   2AFA 17            [ 4] 1014 	rla
   2AFB 9F            [ 4] 1015 	sbc	a, a
   2AFC DD 77 F0      [19] 1016 	ld	-16 (ix),a
   2AFF DD 7E F3      [19] 1017 	ld	a,-13 (ix)
   2B02 DD 86 EF      [19] 1018 	add	a, -17 (ix)
   2B05 DD 77 EF      [19] 1019 	ld	-17 (ix),a
   2B08 DD 7E F4      [19] 1020 	ld	a,-12 (ix)
   2B0B DD 8E F0      [19] 1021 	adc	a, -16 (ix)
   2B0E DD 77 F0      [19] 1022 	ld	-16 (ix),a
   2B11 DD 6E F1      [19] 1023 	ld	l,-15 (ix)
   2B14 DD 66 F2      [19] 1024 	ld	h,-14 (ix)
   2B17 DD 7E EF      [19] 1025 	ld	a,-17 (ix)
   2B1A 77            [ 7] 1026 	ld	(hl),a
   2B1B 23            [ 6] 1027 	inc	hl
   2B1C DD 7E F0      [19] 1028 	ld	a,-16 (ix)
   2B1F 77            [ 7] 1029 	ld	(hl),a
                           1030 ;src/entities/enemies.c:169: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2B20 DD 7E EC      [19] 1031 	ld	a,-20 (ix)
   2B23 C6 12         [ 7] 1032 	add	a, #0x12
   2B25 DD 77 EF      [19] 1033 	ld	-17 (ix),a
   2B28 DD 7E ED      [19] 1034 	ld	a,-19 (ix)
   2B2B CE 00         [ 7] 1035 	adc	a, #0x00
   2B2D DD 77 F0      [19] 1036 	ld	-16 (ix),a
   2B30 DD 6E EF      [19] 1037 	ld	l,-17 (ix)
   2B33 DD 66 F0      [19] 1038 	ld	h,-16 (ix)
   2B36 7E            [ 7] 1039 	ld	a,(hl)
   2B37 DD 77 F1      [19] 1040 	ld	-15 (ix),a
   2B3A 23            [ 6] 1041 	inc	hl
   2B3B 7E            [ 7] 1042 	ld	a,(hl)
   2B3C DD 77 F2      [19] 1043 	ld	-14 (ix),a
   2B3F DD 6E F9      [19] 1044 	ld	l,-7 (ix)
   2B42 DD 66 FA      [19] 1045 	ld	h,-6 (ix)
   2B45 4E            [ 7] 1046 	ld	c, (hl)
   2B46 06 00         [ 7] 1047 	ld	b,#0x00
   2B48 69            [ 4] 1048 	ld	l, c
   2B49 60            [ 4] 1049 	ld	h, b
   2B4A 29            [11] 1050 	add	hl, hl
   2B4B 29            [11] 1051 	add	hl, hl
   2B4C 29            [11] 1052 	add	hl, hl
   2B4D 29            [11] 1053 	add	hl, hl
   2B4E 29            [11] 1054 	add	hl, hl
   2B4F 09            [11] 1055 	add	hl, bc
   2B50 3E 37         [ 7] 1056 	ld	a,#<(_movements)
   2B52 85            [ 4] 1057 	add	a, l
   2B53 DD 77 F3      [19] 1058 	ld	-13 (ix),a
   2B56 3E 35         [ 7] 1059 	ld	a,#>(_movements)
   2B58 8C            [ 4] 1060 	adc	a, h
   2B59 DD 77 F4      [19] 1061 	ld	-12 (ix),a
   2B5C DD 34 F3      [23] 1062 	inc	-13 (ix)
   2B5F 20 03         [12] 1063 	jr	NZ,00177$
   2B61 DD 34 F4      [23] 1064 	inc	-12 (ix)
   2B64                    1065 00177$:
   2B64 DD 6E F5      [19] 1066 	ld	l,-11 (ix)
   2B67 DD 66 F6      [19] 1067 	ld	h,-10 (ix)
   2B6A 7E            [ 7] 1068 	ld	a,(hl)
   2B6B DD 77 EE      [19] 1069 	ld	-18 (ix), a
   2B6E 87            [ 4] 1070 	add	a, a
   2B6F 87            [ 4] 1071 	add	a, a
   2B70 67            [ 4] 1072 	ld	h,a
   2B71 DD 7E F3      [19] 1073 	ld	a,-13 (ix)
   2B74 84            [ 4] 1074 	add	a, h
   2B75 DD 77 F3      [19] 1075 	ld	-13 (ix),a
   2B78 DD 7E F4      [19] 1076 	ld	a,-12 (ix)
   2B7B CE 00         [ 7] 1077 	adc	a, #0x00
   2B7D DD 77 F4      [19] 1078 	ld	-12 (ix),a
   2B80 DD 6E F3      [19] 1079 	ld	l,-13 (ix)
   2B83 DD 66 F4      [19] 1080 	ld	h,-12 (ix)
   2B86 23            [ 6] 1081 	inc	hl
   2B87 23            [ 6] 1082 	inc	hl
   2B88 7E            [ 7] 1083 	ld	a,(hl)
   2B89 DD 77 EE      [19] 1084 	ld	-18 (ix), a
   2B8C DD 77 F3      [19] 1085 	ld	-13 (ix),a
   2B8F DD 7E EE      [19] 1086 	ld	a,-18 (ix)
   2B92 17            [ 4] 1087 	rla
   2B93 9F            [ 4] 1088 	sbc	a, a
   2B94 DD 77 F4      [19] 1089 	ld	-12 (ix),a
   2B97 DD 7E F1      [19] 1090 	ld	a,-15 (ix)
   2B9A DD 86 F3      [19] 1091 	add	a, -13 (ix)
   2B9D DD 77 F1      [19] 1092 	ld	-15 (ix),a
   2BA0 DD 7E F2      [19] 1093 	ld	a,-14 (ix)
   2BA3 DD 8E F4      [19] 1094 	adc	a, -12 (ix)
   2BA6 DD 77 F2      [19] 1095 	ld	-14 (ix),a
   2BA9 DD 6E EF      [19] 1096 	ld	l,-17 (ix)
   2BAC DD 66 F0      [19] 1097 	ld	h,-16 (ix)
   2BAF DD 7E F1      [19] 1098 	ld	a,-15 (ix)
   2BB2 77            [ 7] 1099 	ld	(hl),a
   2BB3 23            [ 6] 1100 	inc	hl
   2BB4 DD 7E F2      [19] 1101 	ld	a,-14 (ix)
   2BB7 77            [ 7] 1102 	ld	(hl),a
                           1103 ;src/entities/enemies.c:170: enemies[i].stage_step++;
   2BB8 DD 6E F7      [19] 1104 	ld	l,-9 (ix)
   2BBB DD 66 F8      [19] 1105 	ld	h,-8 (ix)
   2BBE 7E            [ 7] 1106 	ld	a,(hl)
   2BBF DD 77 EE      [19] 1107 	ld	-18 (ix),a
   2BC2 DD 34 EE      [23] 1108 	inc	-18 (ix)
   2BC5 DD 6E F7      [19] 1109 	ld	l,-9 (ix)
   2BC8 DD 66 F8      [19] 1110 	ld	h,-8 (ix)
   2BCB DD 7E EE      [19] 1111 	ld	a,-18 (ix)
   2BCE 77            [ 7] 1112 	ld	(hl),a
   2BCF C3 3C 2E      [10] 1113 	jp	00125$
   2BD2                    1114 00104$:
                           1115 ;src/entities/enemies.c:172: enemies[i].stage++;
   2BD2 DD 7E FF      [19] 1116 	ld	a,-1 (ix)
   2BD5 3C            [ 4] 1117 	inc	a
   2BD6 DD 77 EE      [19] 1118 	ld	-18 (ix),a
   2BD9 DD 6E F5      [19] 1119 	ld	l,-11 (ix)
   2BDC DD 66 F6      [19] 1120 	ld	h,-10 (ix)
   2BDF DD 7E EE      [19] 1121 	ld	a,-18 (ix)
   2BE2 77            [ 7] 1122 	ld	(hl),a
                           1123 ;src/entities/enemies.c:173: enemies[i].stage_step=0;
   2BE3 DD 6E F7      [19] 1124 	ld	l,-9 (ix)
   2BE6 DD 66 F8      [19] 1125 	ld	h,-8 (ix)
   2BE9 36 00         [10] 1126 	ld	(hl),#0x00
                           1127 ;src/entities/enemies.c:174: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   2BEB DD 6E F9      [19] 1128 	ld	l,-7 (ix)
   2BEE DD 66 FA      [19] 1129 	ld	h,-6 (ix)
   2BF1 7E            [ 7] 1130 	ld	a,(hl)
   2BF2 DD 77 EF      [19] 1131 	ld	-17 (ix), a
   2BF5 4F            [ 4] 1132 	ld	c, a
   2BF6 06 00         [ 7] 1133 	ld	b,#0x00
   2BF8 69            [ 4] 1134 	ld	l, c
   2BF9 60            [ 4] 1135 	ld	h, b
   2BFA 29            [11] 1136 	add	hl, hl
   2BFB 29            [11] 1137 	add	hl, hl
   2BFC 29            [11] 1138 	add	hl, hl
   2BFD 29            [11] 1139 	add	hl, hl
   2BFE 29            [11] 1140 	add	hl, hl
   2BFF 09            [11] 1141 	add	hl, bc
   2C00 DD 75 EF      [19] 1142 	ld	-17 (ix),l
   2C03 DD 74 F0      [19] 1143 	ld	-16 (ix),h
   2C06 3E 37         [ 7] 1144 	ld	a,#<(_movements)
   2C08 DD 86 EF      [19] 1145 	add	a, -17 (ix)
   2C0B DD 77 EF      [19] 1146 	ld	-17 (ix),a
   2C0E 3E 35         [ 7] 1147 	ld	a,#>(_movements)
   2C10 DD 8E F0      [19] 1148 	adc	a, -16 (ix)
   2C13 DD 77 F0      [19] 1149 	ld	-16 (ix),a
   2C16 DD 6E EF      [19] 1150 	ld	l,-17 (ix)
   2C19 DD 66 F0      [19] 1151 	ld	h,-16 (ix)
   2C1C 7E            [ 7] 1152 	ld	a,(hl)
   2C1D DD 77 EF      [19] 1153 	ld	-17 (ix),a
   2C20 DD 7E EE      [19] 1154 	ld	a,-18 (ix)
   2C23 DD 96 EF      [19] 1155 	sub	a, -17 (ix)
   2C26 38 08         [12] 1156 	jr	C,00102$
                           1157 ;src/entities/enemies.c:175: enemies[i].stage=0;
   2C28 DD 6E F5      [19] 1158 	ld	l,-11 (ix)
   2C2B DD 66 F6      [19] 1159 	ld	h,-10 (ix)
   2C2E 36 00         [10] 1160 	ld	(hl),#0x00
   2C30                    1161 00102$:
                           1162 ;src/entities/enemies.c:177: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2C30 3E 0A         [ 7] 1163 	ld	a,#<(_enemies)
   2C32 DD 86 FB      [19] 1164 	add	a, -5 (ix)
   2C35 DD 77 EF      [19] 1165 	ld	-17 (ix),a
   2C38 3E 63         [ 7] 1166 	ld	a,#>(_enemies)
   2C3A DD 8E FC      [19] 1167 	adc	a, -4 (ix)
   2C3D DD 77 F0      [19] 1168 	ld	-16 (ix),a
   2C40 DD 7E EF      [19] 1169 	ld	a,-17 (ix)
   2C43 C6 16         [ 7] 1170 	add	a, #0x16
   2C45 DD 77 F1      [19] 1171 	ld	-15 (ix),a
   2C48 DD 7E F0      [19] 1172 	ld	a,-16 (ix)
   2C4B CE 00         [ 7] 1173 	adc	a, #0x00
   2C4D DD 77 F2      [19] 1174 	ld	-14 (ix),a
   2C50 DD 7E EF      [19] 1175 	ld	a,-17 (ix)
   2C53 C6 1D         [ 7] 1176 	add	a, #0x1D
   2C55 DD 77 F3      [19] 1177 	ld	-13 (ix),a
   2C58 DD 7E F0      [19] 1178 	ld	a,-16 (ix)
   2C5B CE 00         [ 7] 1179 	adc	a, #0x00
   2C5D DD 77 F4      [19] 1180 	ld	-12 (ix),a
   2C60 DD 6E F3      [19] 1181 	ld	l,-13 (ix)
   2C63 DD 66 F4      [19] 1182 	ld	h,-12 (ix)
   2C66 4E            [ 7] 1183 	ld	c, (hl)
   2C67 06 00         [ 7] 1184 	ld	b,#0x00
   2C69 69            [ 4] 1185 	ld	l, c
   2C6A 60            [ 4] 1186 	ld	h, b
   2C6B 29            [11] 1187 	add	hl, hl
   2C6C 29            [11] 1188 	add	hl, hl
   2C6D 29            [11] 1189 	add	hl, hl
   2C6E 29            [11] 1190 	add	hl, hl
   2C6F 29            [11] 1191 	add	hl, hl
   2C70 09            [11] 1192 	add	hl, bc
   2C71 DD 75 F5      [19] 1193 	ld	-11 (ix),l
   2C74 DD 74 F6      [19] 1194 	ld	-10 (ix),h
   2C77 3E 37         [ 7] 1195 	ld	a,#<(_movements)
   2C79 DD 86 F5      [19] 1196 	add	a, -11 (ix)
   2C7C DD 77 F5      [19] 1197 	ld	-11 (ix),a
   2C7F 3E 35         [ 7] 1198 	ld	a,#>(_movements)
   2C81 DD 8E F6      [19] 1199 	adc	a, -10 (ix)
   2C84 DD 77 F6      [19] 1200 	ld	-10 (ix),a
   2C87 DD 34 F5      [23] 1201 	inc	-11 (ix)
   2C8A 20 03         [12] 1202 	jr	NZ,00178$
   2C8C DD 34 F6      [23] 1203 	inc	-10 (ix)
   2C8F                    1204 00178$:
   2C8F DD 7E EF      [19] 1205 	ld	a,-17 (ix)
   2C92 C6 1E         [ 7] 1206 	add	a, #0x1E
   2C94 DD 77 F7      [19] 1207 	ld	-9 (ix),a
   2C97 DD 7E F0      [19] 1208 	ld	a,-16 (ix)
   2C9A CE 00         [ 7] 1209 	adc	a, #0x00
   2C9C DD 77 F8      [19] 1210 	ld	-8 (ix),a
   2C9F DD 6E F7      [19] 1211 	ld	l,-9 (ix)
   2CA2 DD 66 F8      [19] 1212 	ld	h,-8 (ix)
   2CA5 7E            [ 7] 1213 	ld	a,(hl)
   2CA6 87            [ 4] 1214 	add	a, a
   2CA7 87            [ 4] 1215 	add	a, a
   2CA8 67            [ 4] 1216 	ld	h,a
   2CA9 DD 7E F5      [19] 1217 	ld	a,-11 (ix)
   2CAC 84            [ 4] 1218 	add	a, h
   2CAD DD 77 F5      [19] 1219 	ld	-11 (ix),a
   2CB0 DD 7E F6      [19] 1220 	ld	a,-10 (ix)
   2CB3 CE 00         [ 7] 1221 	adc	a, #0x00
   2CB5 DD 77 F6      [19] 1222 	ld	-10 (ix),a
   2CB8 DD 6E F5      [19] 1223 	ld	l,-11 (ix)
   2CBB DD 66 F6      [19] 1224 	ld	h,-10 (ix)
   2CBE 7E            [ 7] 1225 	ld	a,(hl)
   2CBF DD 77 EE      [19] 1226 	ld	-18 (ix),a
   2CC2 DD 6E F1      [19] 1227 	ld	l,-15 (ix)
   2CC5 DD 66 F2      [19] 1228 	ld	h,-14 (ix)
   2CC8 DD 7E EE      [19] 1229 	ld	a,-18 (ix)
   2CCB 77            [ 7] 1230 	ld	(hl),a
                           1231 ;src/entities/enemies.c:178: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2CCC DD 7E EF      [19] 1232 	ld	a,-17 (ix)
   2CCF C6 10         [ 7] 1233 	add	a, #0x10
   2CD1 DD 77 F1      [19] 1234 	ld	-15 (ix),a
   2CD4 DD 7E F0      [19] 1235 	ld	a,-16 (ix)
   2CD7 CE 00         [ 7] 1236 	adc	a, #0x00
   2CD9 DD 77 F2      [19] 1237 	ld	-14 (ix),a
   2CDC DD 6E F1      [19] 1238 	ld	l,-15 (ix)
   2CDF DD 66 F2      [19] 1239 	ld	h,-14 (ix)
   2CE2 7E            [ 7] 1240 	ld	a,(hl)
   2CE3 DD 77 F5      [19] 1241 	ld	-11 (ix),a
   2CE6 23            [ 6] 1242 	inc	hl
   2CE7 7E            [ 7] 1243 	ld	a,(hl)
   2CE8 DD 77 F6      [19] 1244 	ld	-10 (ix),a
   2CEB DD 6E F3      [19] 1245 	ld	l,-13 (ix)
   2CEE DD 66 F4      [19] 1246 	ld	h,-12 (ix)
   2CF1 4E            [ 7] 1247 	ld	c, (hl)
   2CF2 06 00         [ 7] 1248 	ld	b,#0x00
   2CF4 69            [ 4] 1249 	ld	l, c
   2CF5 60            [ 4] 1250 	ld	h, b
   2CF6 29            [11] 1251 	add	hl, hl
   2CF7 29            [11] 1252 	add	hl, hl
   2CF8 29            [11] 1253 	add	hl, hl
   2CF9 29            [11] 1254 	add	hl, hl
   2CFA 29            [11] 1255 	add	hl, hl
   2CFB 09            [11] 1256 	add	hl, bc
   2CFC DD 75 F9      [19] 1257 	ld	-7 (ix),l
   2CFF DD 74 FA      [19] 1258 	ld	-6 (ix),h
   2D02 3E 37         [ 7] 1259 	ld	a,#<(_movements)
   2D04 DD 86 F9      [19] 1260 	add	a, -7 (ix)
   2D07 DD 77 F9      [19] 1261 	ld	-7 (ix),a
   2D0A 3E 35         [ 7] 1262 	ld	a,#>(_movements)
   2D0C DD 8E FA      [19] 1263 	adc	a, -6 (ix)
   2D0F DD 77 FA      [19] 1264 	ld	-6 (ix),a
   2D12 DD 34 F9      [23] 1265 	inc	-7 (ix)
   2D15 20 03         [12] 1266 	jr	NZ,00179$
   2D17 DD 34 FA      [23] 1267 	inc	-6 (ix)
   2D1A                    1268 00179$:
   2D1A DD 6E F7      [19] 1269 	ld	l,-9 (ix)
   2D1D DD 66 F8      [19] 1270 	ld	h,-8 (ix)
   2D20 7E            [ 7] 1271 	ld	a,(hl)
   2D21 DD 77 EE      [19] 1272 	ld	-18 (ix), a
   2D24 87            [ 4] 1273 	add	a, a
   2D25 87            [ 4] 1274 	add	a, a
   2D26 67            [ 4] 1275 	ld	h,a
   2D27 DD 7E F9      [19] 1276 	ld	a,-7 (ix)
   2D2A 84            [ 4] 1277 	add	a, h
   2D2B DD 77 F9      [19] 1278 	ld	-7 (ix),a
   2D2E DD 7E FA      [19] 1279 	ld	a,-6 (ix)
   2D31 CE 00         [ 7] 1280 	adc	a, #0x00
   2D33 DD 77 FA      [19] 1281 	ld	-6 (ix),a
   2D36 DD 6E F9      [19] 1282 	ld	l,-7 (ix)
   2D39 DD 66 FA      [19] 1283 	ld	h,-6 (ix)
   2D3C 23            [ 6] 1284 	inc	hl
   2D3D 7E            [ 7] 1285 	ld	a,(hl)
   2D3E DD 77 EE      [19] 1286 	ld	-18 (ix), a
   2D41 DD 77 F9      [19] 1287 	ld	-7 (ix),a
   2D44 DD 7E EE      [19] 1288 	ld	a,-18 (ix)
   2D47 17            [ 4] 1289 	rla
   2D48 9F            [ 4] 1290 	sbc	a, a
   2D49 DD 77 FA      [19] 1291 	ld	-6 (ix),a
   2D4C DD 7E F5      [19] 1292 	ld	a,-11 (ix)
   2D4F DD 86 F9      [19] 1293 	add	a, -7 (ix)
   2D52 DD 77 F5      [19] 1294 	ld	-11 (ix),a
   2D55 DD 7E F6      [19] 1295 	ld	a,-10 (ix)
   2D58 DD 8E FA      [19] 1296 	adc	a, -6 (ix)
   2D5B DD 77 F6      [19] 1297 	ld	-10 (ix),a
   2D5E DD 6E F1      [19] 1298 	ld	l,-15 (ix)
   2D61 DD 66 F2      [19] 1299 	ld	h,-14 (ix)
   2D64 DD 7E F5      [19] 1300 	ld	a,-11 (ix)
   2D67 77            [ 7] 1301 	ld	(hl),a
   2D68 23            [ 6] 1302 	inc	hl
   2D69 DD 7E F6      [19] 1303 	ld	a,-10 (ix)
   2D6C 77            [ 7] 1304 	ld	(hl),a
                           1305 ;src/entities/enemies.c:179: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2D6D DD 7E EF      [19] 1306 	ld	a,-17 (ix)
   2D70 C6 12         [ 7] 1307 	add	a, #0x12
   2D72 DD 77 F1      [19] 1308 	ld	-15 (ix),a
   2D75 DD 7E F0      [19] 1309 	ld	a,-16 (ix)
   2D78 CE 00         [ 7] 1310 	adc	a, #0x00
   2D7A DD 77 F2      [19] 1311 	ld	-14 (ix),a
   2D7D DD 6E F1      [19] 1312 	ld	l,-15 (ix)
   2D80 DD 66 F2      [19] 1313 	ld	h,-14 (ix)
   2D83 7E            [ 7] 1314 	ld	a,(hl)
   2D84 DD 77 F5      [19] 1315 	ld	-11 (ix),a
   2D87 23            [ 6] 1316 	inc	hl
   2D88 7E            [ 7] 1317 	ld	a,(hl)
   2D89 DD 77 F6      [19] 1318 	ld	-10 (ix),a
   2D8C DD 6E F3      [19] 1319 	ld	l,-13 (ix)
   2D8F DD 66 F4      [19] 1320 	ld	h,-12 (ix)
   2D92 7E            [ 7] 1321 	ld	a,(hl)
   2D93 DD 77 EE      [19] 1322 	ld	-18 (ix), a
   2D96 4F            [ 4] 1323 	ld	c, a
   2D97 06 00         [ 7] 1324 	ld	b,#0x00
   2D99 69            [ 4] 1325 	ld	l, c
   2D9A 60            [ 4] 1326 	ld	h, b
   2D9B 29            [11] 1327 	add	hl, hl
   2D9C 29            [11] 1328 	add	hl, hl
   2D9D 29            [11] 1329 	add	hl, hl
   2D9E 29            [11] 1330 	add	hl, hl
   2D9F 29            [11] 1331 	add	hl, hl
   2DA0 09            [11] 1332 	add	hl, bc
   2DA1 DD 75 F3      [19] 1333 	ld	-13 (ix),l
   2DA4 DD 74 F4      [19] 1334 	ld	-12 (ix),h
   2DA7 3E 37         [ 7] 1335 	ld	a,#<(_movements)
   2DA9 DD 86 F3      [19] 1336 	add	a, -13 (ix)
   2DAC DD 77 F3      [19] 1337 	ld	-13 (ix),a
   2DAF 3E 35         [ 7] 1338 	ld	a,#>(_movements)
   2DB1 DD 8E F4      [19] 1339 	adc	a, -12 (ix)
   2DB4 DD 77 F4      [19] 1340 	ld	-12 (ix),a
   2DB7 DD 34 F3      [23] 1341 	inc	-13 (ix)
   2DBA 20 03         [12] 1342 	jr	NZ,00180$
   2DBC DD 34 F4      [23] 1343 	inc	-12 (ix)
   2DBF                    1344 00180$:
   2DBF DD 6E F7      [19] 1345 	ld	l,-9 (ix)
   2DC2 DD 66 F8      [19] 1346 	ld	h,-8 (ix)
   2DC5 7E            [ 7] 1347 	ld	a,(hl)
   2DC6 DD 77 EE      [19] 1348 	ld	-18 (ix),a
   2DC9 DD CB EE 26   [23] 1349 	sla	-18 (ix)
   2DCD DD CB EE 26   [23] 1350 	sla	-18 (ix)
   2DD1 DD 7E F3      [19] 1351 	ld	a,-13 (ix)
   2DD4 DD 86 EE      [19] 1352 	add	a, -18 (ix)
   2DD7 DD 77 F3      [19] 1353 	ld	-13 (ix),a
   2DDA DD 7E F4      [19] 1354 	ld	a,-12 (ix)
   2DDD CE 00         [ 7] 1355 	adc	a, #0x00
   2DDF DD 77 F4      [19] 1356 	ld	-12 (ix),a
   2DE2 DD 6E F3      [19] 1357 	ld	l,-13 (ix)
   2DE5 DD 66 F4      [19] 1358 	ld	h,-12 (ix)
   2DE8 23            [ 6] 1359 	inc	hl
   2DE9 23            [ 6] 1360 	inc	hl
   2DEA 7E            [ 7] 1361 	ld	a,(hl)
   2DEB DD 77 EE      [19] 1362 	ld	-18 (ix), a
   2DEE DD 77 F3      [19] 1363 	ld	-13 (ix),a
   2DF1 DD 7E EE      [19] 1364 	ld	a,-18 (ix)
   2DF4 17            [ 4] 1365 	rla
   2DF5 9F            [ 4] 1366 	sbc	a, a
   2DF6 DD 77 F4      [19] 1367 	ld	-12 (ix),a
   2DF9 DD 7E F5      [19] 1368 	ld	a,-11 (ix)
   2DFC DD 86 F3      [19] 1369 	add	a, -13 (ix)
   2DFF DD 77 F3      [19] 1370 	ld	-13 (ix),a
   2E02 DD 7E F6      [19] 1371 	ld	a,-10 (ix)
   2E05 DD 8E F4      [19] 1372 	adc	a, -12 (ix)
   2E08 DD 77 F4      [19] 1373 	ld	-12 (ix),a
   2E0B DD 6E F1      [19] 1374 	ld	l,-15 (ix)
   2E0E DD 66 F2      [19] 1375 	ld	h,-14 (ix)
   2E11 DD 7E F3      [19] 1376 	ld	a,-13 (ix)
   2E14 77            [ 7] 1377 	ld	(hl),a
   2E15 23            [ 6] 1378 	inc	hl
   2E16 DD 7E F4      [19] 1379 	ld	a,-12 (ix)
   2E19 77            [ 7] 1380 	ld	(hl),a
                           1381 ;src/entities/enemies.c:180: enemies[i].stage_step++;
   2E1A DD 7E EF      [19] 1382 	ld	a,-17 (ix)
   2E1D C6 1F         [ 7] 1383 	add	a, #0x1F
   2E1F DD 77 EF      [19] 1384 	ld	-17 (ix),a
   2E22 DD 7E F0      [19] 1385 	ld	a,-16 (ix)
   2E25 CE 00         [ 7] 1386 	adc	a, #0x00
   2E27 DD 77 F0      [19] 1387 	ld	-16 (ix),a
   2E2A DD 6E EF      [19] 1388 	ld	l,-17 (ix)
   2E2D DD 66 F0      [19] 1389 	ld	h,-16 (ix)
   2E30 7E            [ 7] 1390 	ld	a,(hl)
   2E31 DD 77 EE      [19] 1391 	ld	-18 (ix), a
   2E34 3C            [ 4] 1392 	inc	a
   2E35 DD 6E EF      [19] 1393 	ld	l,-17 (ix)
   2E38 DD 66 F0      [19] 1394 	ld	h,-16 (ix)
   2E3B 77            [ 7] 1395 	ld	(hl),a
   2E3C                    1396 00125$:
                           1397 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   2E3C DD 7E FB      [19] 1398 	ld	a,-5 (ix)
   2E3F C6 24         [ 7] 1399 	add	a, #0x24
   2E41 DD 77 FB      [19] 1400 	ld	-5 (ix),a
   2E44 DD 7E FC      [19] 1401 	ld	a,-4 (ix)
   2E47 CE 00         [ 7] 1402 	adc	a, #0x00
   2E49 DD 77 FC      [19] 1403 	ld	-4 (ix),a
   2E4C DD 7E FD      [19] 1404 	ld	a,-3 (ix)
   2E4F C6 24         [ 7] 1405 	add	a, #0x24
   2E51 DD 77 FD      [19] 1406 	ld	-3 (ix),a
   2E54 DD 7E FE      [19] 1407 	ld	a,-2 (ix)
   2E57 CE 00         [ 7] 1408 	adc	a, #0x00
   2E59 DD 77 FE      [19] 1409 	ld	-2 (ix),a
   2E5C DD 34 EB      [23] 1410 	inc	-21 (ix)
   2E5F DD 7E EB      [19] 1411 	ld	a,-21 (ix)
   2E62 D6 1E         [ 7] 1412 	sub	a, #0x1E
   2E64 DA C7 29      [10] 1413 	jp	C,00124$
   2E67                    1414 00112$:
                           1415 ;src/entities/enemies.c:188: if (active_groups>0){
   2E67 3A 63 67      [13] 1416 	ld	a,(#_active_groups + 0)
   2E6A B7            [ 4] 1417 	or	a, a
   2E6B CA E8 2E      [10] 1418 	jp	Z,00128$
                           1419 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2E6E DD 36 EB 00   [19] 1420 	ld	-21 (ix),#0x00
   2E72                    1421 00126$:
                           1422 ;src/entities/enemies.c:191: if (groups[i].active){
   2E72 DD 6E EB      [19] 1423 	ld	l,-21 (ix)
   2E75 26 00         [ 7] 1424 	ld	h,#0x00
   2E77 29            [11] 1425 	add	hl, hl
   2E78 29            [11] 1426 	add	hl, hl
   2E79 29            [11] 1427 	add	hl, hl
   2E7A 3E 43         [ 7] 1428 	ld	a,#<(_groups)
   2E7C 85            [ 4] 1429 	add	a, l
   2E7D 5F            [ 4] 1430 	ld	e,a
   2E7E 3E 67         [ 7] 1431 	ld	a,#>(_groups)
   2E80 8C            [ 4] 1432 	adc	a, h
   2E81 57            [ 4] 1433 	ld	d,a
   2E82 1A            [ 7] 1434 	ld	a,(de)
   2E83 B7            [ 4] 1435 	or	a, a
   2E84 28 58         [12] 1436 	jr	Z,00127$
                           1437 ;src/entities/enemies.c:192: if (groups[i].sleep==0){
   2E86 21 07 00      [10] 1438 	ld	hl,#0x0007
   2E89 19            [11] 1439 	add	hl,de
   2E8A 7E            [ 7] 1440 	ld	a,(hl)
   2E8B B7            [ 4] 1441 	or	a, a
   2E8C 20 4D         [12] 1442 	jr	NZ,00117$
                           1443 ;src/entities/enemies.c:193: groups[i].sleep=ENEMY_GAP;
   2E8E 36 03         [10] 1444 	ld	(hl),#0x03
                           1445 ;src/entities/enemies.c:194: if (groups[i].num_enemies==0){
   2E90 21 06 00      [10] 1446 	ld	hl,#0x0006
   2E93 19            [11] 1447 	add	hl,de
   2E94 4D            [ 4] 1448 	ld	c,l
   2E95 44            [ 4] 1449 	ld	b,h
   2E96 0A            [ 7] 1450 	ld	a,(bc)
   2E97 B7            [ 4] 1451 	or	a, a
   2E98 20 08         [12] 1452 	jr	NZ,00114$
                           1453 ;src/entities/enemies.c:195: groups[i].active=0;
   2E9A AF            [ 4] 1454 	xor	a, a
   2E9B 12            [ 7] 1455 	ld	(de),a
                           1456 ;src/entities/enemies.c:196: active_groups--;
   2E9C 21 63 67      [10] 1457 	ld	hl, #_active_groups+0
   2E9F 35            [11] 1458 	dec	(hl)
   2EA0 18 3C         [12] 1459 	jr	00127$
   2EA2                    1460 00114$:
                           1461 ;src/entities/enemies.c:198: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2EA2 6B            [ 4] 1462 	ld	l, e
   2EA3 62            [ 4] 1463 	ld	h, d
   2EA4 23            [ 6] 1464 	inc	hl
   2EA5 23            [ 6] 1465 	inc	hl
   2EA6 23            [ 6] 1466 	inc	hl
   2EA7 23            [ 6] 1467 	inc	hl
   2EA8 23            [ 6] 1468 	inc	hl
   2EA9 7E            [ 7] 1469 	ld	a,(hl)
   2EAA DD 77 EE      [19] 1470 	ld	-18 (ix),a
   2EAD 6B            [ 4] 1471 	ld	l, e
   2EAE 62            [ 4] 1472 	ld	h, d
   2EAF 23            [ 6] 1473 	inc	hl
   2EB0 23            [ 6] 1474 	inc	hl
   2EB1 23            [ 6] 1475 	inc	hl
   2EB2 7E            [ 7] 1476 	ld	a,(hl)
   2EB3 DD 77 EF      [19] 1477 	ld	-17 (ix),a
   2EB6 23            [ 6] 1478 	inc	hl
   2EB7 7E            [ 7] 1479 	ld	a,(hl)
   2EB8 DD 77 F0      [19] 1480 	ld	-16 (ix),a
   2EBB EB            [ 4] 1481 	ex	de,hl
   2EBC 23            [ 6] 1482 	inc	hl
   2EBD 5E            [ 7] 1483 	ld	e,(hl)
   2EBE 23            [ 6] 1484 	inc	hl
   2EBF 56            [ 7] 1485 	ld	d,(hl)
   2EC0 C5            [11] 1486 	push	bc
   2EC1 DD 7E EE      [19] 1487 	ld	a,-18 (ix)
   2EC4 F5            [11] 1488 	push	af
   2EC5 33            [ 6] 1489 	inc	sp
   2EC6 DD 6E EF      [19] 1490 	ld	l,-17 (ix)
   2EC9 DD 66 F0      [19] 1491 	ld	h,-16 (ix)
   2ECC E5            [11] 1492 	push	hl
   2ECD D5            [11] 1493 	push	de
   2ECE CD 00 26      [17] 1494 	call	_create_enemy
   2ED1 F1            [10] 1495 	pop	af
   2ED2 F1            [10] 1496 	pop	af
   2ED3 33            [ 6] 1497 	inc	sp
   2ED4 C1            [10] 1498 	pop	bc
                           1499 ;src/entities/enemies.c:199: groups[i].num_enemies--;
   2ED5 0A            [ 7] 1500 	ld	a,(bc)
   2ED6 C6 FF         [ 7] 1501 	add	a,#0xFF
   2ED8 02            [ 7] 1502 	ld	(bc),a
   2ED9 18 03         [12] 1503 	jr	00127$
   2EDB                    1504 00117$:
                           1505 ;src/entities/enemies.c:202: groups[i].sleep--;
   2EDB C6 FF         [ 7] 1506 	add	a,#0xFF
   2EDD 77            [ 7] 1507 	ld	(hl),a
   2EDE                    1508 00127$:
                           1509 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2EDE DD 34 EB      [23] 1510 	inc	-21 (ix)
   2EE1 DD 7E EB      [19] 1511 	ld	a,-21 (ix)
   2EE4 D6 04         [ 7] 1512 	sub	a, #0x04
   2EE6 38 8A         [12] 1513 	jr	C,00126$
   2EE8                    1514 00128$:
   2EE8 DD F9         [10] 1515 	ld	sp, ix
   2EEA DD E1         [14] 1516 	pop	ix
   2EEC C9            [10] 1517 	ret
                           1518 ;src/entities/enemies.c:210: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                           1519 ;	---------------------------------
                           1520 ; Function inside_screen
                           1521 ; ---------------------------------
   2EED                    1522 _inside_screen::
   2EED DD E5         [15] 1523 	push	ix
   2EEF DD 21 00 00   [14] 1524 	ld	ix,#0
   2EF3 DD 39         [15] 1525 	add	ix,sp
   2EF5 3B            [ 6] 1526 	dec	sp
                           1527 ;src/entities/enemies.c:212: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   2EF6 DD CB 05 7E   [20] 1528 	bit	7, 5 (ix)
   2EFA 20 38         [12] 1529 	jr	NZ,00103$
   2EFC DD 5E 08      [19] 1530 	ld	e,8 (ix)
   2EFF 16 00         [ 7] 1531 	ld	d,#0x00
   2F01 DD 6E 04      [19] 1532 	ld	l,4 (ix)
   2F04 DD 66 05      [19] 1533 	ld	h,5 (ix)
   2F07 19            [11] 1534 	add	hl,de
   2F08 11 50 80      [10] 1535 	ld	de, #0x8050
   2F0B 29            [11] 1536 	add	hl, hl
   2F0C 3F            [ 4] 1537 	ccf
   2F0D CB 1C         [ 8] 1538 	rr	h
   2F0F CB 1D         [ 8] 1539 	rr	l
   2F11 ED 52         [15] 1540 	sbc	hl, de
   2F13 30 1F         [12] 1541 	jr	NC,00103$
   2F15 DD CB 07 7E   [20] 1542 	bit	7, 7 (ix)
   2F19 20 19         [12] 1543 	jr	NZ,00103$
   2F1B DD 5E 09      [19] 1544 	ld	e,9 (ix)
   2F1E 16 00         [ 7] 1545 	ld	d,#0x00
   2F20 DD 6E 06      [19] 1546 	ld	l,6 (ix)
   2F23 DD 66 07      [19] 1547 	ld	h,7 (ix)
   2F26 19            [11] 1548 	add	hl,de
   2F27 11 C8 80      [10] 1549 	ld	de, #0x80C8
   2F2A 29            [11] 1550 	add	hl, hl
   2F2B 3F            [ 4] 1551 	ccf
   2F2C CB 1C         [ 8] 1552 	rr	h
   2F2E CB 1D         [ 8] 1553 	rr	l
   2F30 ED 52         [15] 1554 	sbc	hl, de
   2F32 38 04         [12] 1555 	jr	C,00104$
   2F34                    1556 00103$:
   2F34 2E 00         [ 7] 1557 	ld	l,#0x00
   2F36 18 02         [12] 1558 	jr	00105$
   2F38                    1559 00104$:
   2F38 2E 01         [ 7] 1560 	ld	l,#0x01
   2F3A                    1561 00105$:
   2F3A 33            [ 6] 1562 	inc	sp
   2F3B DD E1         [14] 1563 	pop	ix
   2F3D C9            [10] 1564 	ret
                           1565 ;src/entities/enemies.c:219: void draw_enemies(u8* screen){
                           1566 ;	---------------------------------
                           1567 ; Function draw_enemies
                           1568 ; ---------------------------------
   2F3E                    1569 _draw_enemies::
   2F3E DD E5         [15] 1570 	push	ix
   2F40 DD 21 00 00   [14] 1571 	ld	ix,#0
   2F44 DD 39         [15] 1572 	add	ix,sp
   2F46 21 F1 FF      [10] 1573 	ld	hl,#-15
   2F49 39            [11] 1574 	add	hl,sp
   2F4A F9            [ 6] 1575 	ld	sp,hl
                           1576 ;src/entities/enemies.c:224: if (active_enemies>0){
   2F4B 3A 42 67      [13] 1577 	ld	a,(#_active_enemies + 0)
   2F4E B7            [ 4] 1578 	or	a, a
   2F4F CA 7D 30      [10] 1579 	jp	Z,00109$
                           1580 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2F52 DD 36 F1 00   [19] 1581 	ld	-15 (ix),#0x00
   2F56 11 00 00      [10] 1582 	ld	de,#0x0000
   2F59                    1583 00107$:
                           1584 ;src/entities/enemies.c:226: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2F59 21 0A 63      [10] 1585 	ld	hl,#_enemies
   2F5C 19            [11] 1586 	add	hl,de
   2F5D DD 75 FC      [19] 1587 	ld	-4 (ix),l
   2F60 DD 74 FD      [19] 1588 	ld	-3 (ix),h
   2F63 DD 6E FC      [19] 1589 	ld	l,-4 (ix)
   2F66 DD 66 FD      [19] 1590 	ld	h,-3 (ix)
   2F69 01 17 00      [10] 1591 	ld	bc, #0x0017
   2F6C 09            [11] 1592 	add	hl, bc
   2F6D 7E            [ 7] 1593 	ld	a,(hl)
   2F6E B7            [ 4] 1594 	or	a, a
   2F6F CA 6D 30      [10] 1595 	jp	Z,00108$
   2F72 DD 7E FC      [19] 1596 	ld	a,-4 (ix)
   2F75 C6 15         [ 7] 1597 	add	a, #0x15
   2F77 DD 77 F2      [19] 1598 	ld	-14 (ix),a
   2F7A DD 7E FD      [19] 1599 	ld	a,-3 (ix)
   2F7D CE 00         [ 7] 1600 	adc	a, #0x00
   2F7F DD 77 F3      [19] 1601 	ld	-13 (ix),a
   2F82 DD 6E F2      [19] 1602 	ld	l,-14 (ix)
   2F85 DD 66 F3      [19] 1603 	ld	h,-13 (ix)
   2F88 46            [ 7] 1604 	ld	b,(hl)
   2F89 DD 7E FC      [19] 1605 	ld	a,-4 (ix)
   2F8C C6 14         [ 7] 1606 	add	a, #0x14
   2F8E DD 77 FE      [19] 1607 	ld	-2 (ix),a
   2F91 DD 7E FD      [19] 1608 	ld	a,-3 (ix)
   2F94 CE 00         [ 7] 1609 	adc	a, #0x00
   2F96 DD 77 FF      [19] 1610 	ld	-1 (ix),a
   2F99 DD 6E FE      [19] 1611 	ld	l,-2 (ix)
   2F9C DD 66 FF      [19] 1612 	ld	h,-1 (ix)
   2F9F 4E            [ 7] 1613 	ld	c,(hl)
   2FA0 DD 7E FC      [19] 1614 	ld	a,-4 (ix)
   2FA3 C6 12         [ 7] 1615 	add	a, #0x12
   2FA5 DD 77 FA      [19] 1616 	ld	-6 (ix),a
   2FA8 DD 7E FD      [19] 1617 	ld	a,-3 (ix)
   2FAB CE 00         [ 7] 1618 	adc	a, #0x00
   2FAD DD 77 FB      [19] 1619 	ld	-5 (ix),a
   2FB0 DD 6E FA      [19] 1620 	ld	l,-6 (ix)
   2FB3 DD 66 FB      [19] 1621 	ld	h,-5 (ix)
   2FB6 7E            [ 7] 1622 	ld	a,(hl)
   2FB7 DD 77 F8      [19] 1623 	ld	-8 (ix),a
   2FBA 23            [ 6] 1624 	inc	hl
   2FBB 7E            [ 7] 1625 	ld	a,(hl)
   2FBC DD 77 F9      [19] 1626 	ld	-7 (ix),a
   2FBF DD 7E FC      [19] 1627 	ld	a,-4 (ix)
   2FC2 C6 10         [ 7] 1628 	add	a, #0x10
   2FC4 DD 77 F6      [19] 1629 	ld	-10 (ix),a
   2FC7 DD 7E FD      [19] 1630 	ld	a,-3 (ix)
   2FCA CE 00         [ 7] 1631 	adc	a, #0x00
   2FCC DD 77 F7      [19] 1632 	ld	-9 (ix),a
   2FCF DD 6E F6      [19] 1633 	ld	l,-10 (ix)
   2FD2 DD 66 F7      [19] 1634 	ld	h,-9 (ix)
   2FD5 7E            [ 7] 1635 	ld	a,(hl)
   2FD6 DD 77 F4      [19] 1636 	ld	-12 (ix),a
   2FD9 23            [ 6] 1637 	inc	hl
   2FDA 7E            [ 7] 1638 	ld	a,(hl)
   2FDB DD 77 F5      [19] 1639 	ld	-11 (ix),a
   2FDE D5            [11] 1640 	push	de
   2FDF C5            [11] 1641 	push	bc
   2FE0 DD 6E F8      [19] 1642 	ld	l,-8 (ix)
   2FE3 DD 66 F9      [19] 1643 	ld	h,-7 (ix)
   2FE6 E5            [11] 1644 	push	hl
   2FE7 DD 6E F4      [19] 1645 	ld	l,-12 (ix)
   2FEA DD 66 F5      [19] 1646 	ld	h,-11 (ix)
   2FED E5            [11] 1647 	push	hl
   2FEE CD ED 2E      [17] 1648 	call	_inside_screen
   2FF1 F1            [10] 1649 	pop	af
   2FF2 F1            [10] 1650 	pop	af
   2FF3 F1            [10] 1651 	pop	af
   2FF4 7D            [ 4] 1652 	ld	a,l
   2FF5 D1            [10] 1653 	pop	de
   2FF6 B7            [ 4] 1654 	or	a, a
   2FF7 28 74         [12] 1655 	jr	Z,00108$
                           1656 ;src/entities/enemies.c:227: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   2FF9 DD 6E FA      [19] 1657 	ld	l,-6 (ix)
   2FFC DD 66 FB      [19] 1658 	ld	h,-5 (ix)
   2FFF 4E            [ 7] 1659 	ld	c,(hl)
   3000 23            [ 6] 1660 	inc	hl
   3001 46            [ 7] 1661 	ld	b,(hl)
   3002 DD 6E F6      [19] 1662 	ld	l,-10 (ix)
   3005 DD 66 F7      [19] 1663 	ld	h,-9 (ix)
   3008 7E            [ 7] 1664 	ld	a, (hl)
   3009 23            [ 6] 1665 	inc	hl
   300A 66            [ 7] 1666 	ld	h,(hl)
   300B 6F            [ 4] 1667 	ld	l,a
   300C 65            [ 4] 1668 	ld	h,l
   300D E5            [11] 1669 	push	hl
   300E DD 6E 04      [19] 1670 	ld	l,4 (ix)
   3011 DD 66 05      [19] 1671 	ld	h,5 (ix)
   3014 E5            [11] 1672 	push	hl
   3015 FD E1         [14] 1673 	pop	iy
   3017 E1            [10] 1674 	pop	hl
   3018 D5            [11] 1675 	push	de
   3019 79            [ 4] 1676 	ld	a,c
   301A F5            [11] 1677 	push	af
   301B 33            [ 6] 1678 	inc	sp
   301C E5            [11] 1679 	push	hl
   301D 33            [ 6] 1680 	inc	sp
   301E FD E5         [15] 1681 	push	iy
   3020 CD 89 56      [17] 1682 	call	_cpct_getScreenPtr
   3023 D1            [10] 1683 	pop	de
   3024 4D            [ 4] 1684 	ld	c, l
   3025 44            [ 4] 1685 	ld	b, h
                           1686 ;src/entities/enemies.c:228: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   3026 DD 6E F2      [19] 1687 	ld	l,-14 (ix)
   3029 DD 66 F3      [19] 1688 	ld	h,-13 (ix)
   302C 7E            [ 7] 1689 	ld	a,(hl)
   302D DD 77 F4      [19] 1690 	ld	-12 (ix),a
   3030 DD 6E FE      [19] 1691 	ld	l,-2 (ix)
   3033 DD 66 FF      [19] 1692 	ld	h,-1 (ix)
   3036 7E            [ 7] 1693 	ld	a,(hl)
   3037 DD 77 F6      [19] 1694 	ld	-10 (ix),a
   303A DD 71 F8      [19] 1695 	ld	-8 (ix),c
   303D DD 70 F9      [19] 1696 	ld	-7 (ix),b
   3040 DD 6E FC      [19] 1697 	ld	l,-4 (ix)
   3043 DD 66 FD      [19] 1698 	ld	h,-3 (ix)
   3046 01 16 00      [10] 1699 	ld	bc, #0x0016
   3049 09            [11] 1700 	add	hl, bc
   304A 7E            [ 7] 1701 	ld	a,(hl)
   304B 87            [ 4] 1702 	add	a, a
   304C 4F            [ 4] 1703 	ld	c,a
   304D DD 6E FC      [19] 1704 	ld	l,-4 (ix)
   3050 DD 66 FD      [19] 1705 	ld	h,-3 (ix)
   3053 06 00         [ 7] 1706 	ld	b,#0x00
   3055 09            [11] 1707 	add	hl, bc
   3056 4E            [ 7] 1708 	ld	c,(hl)
   3057 23            [ 6] 1709 	inc	hl
   3058 46            [ 7] 1710 	ld	b,(hl)
   3059 D5            [11] 1711 	push	de
   305A DD 66 F4      [19] 1712 	ld	h,-12 (ix)
   305D DD 6E F6      [19] 1713 	ld	l,-10 (ix)
   3060 E5            [11] 1714 	push	hl
   3061 DD 6E F8      [19] 1715 	ld	l,-8 (ix)
   3064 DD 66 F9      [19] 1716 	ld	h,-7 (ix)
   3067 E5            [11] 1717 	push	hl
   3068 C5            [11] 1718 	push	bc
   3069 CD 49 53      [17] 1719 	call	_cpct_drawSprite
   306C D1            [10] 1720 	pop	de
   306D                    1721 00108$:
                           1722 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   306D 21 24 00      [10] 1723 	ld	hl,#0x0024
   3070 19            [11] 1724 	add	hl,de
   3071 EB            [ 4] 1725 	ex	de,hl
   3072 DD 34 F1      [23] 1726 	inc	-15 (ix)
   3075 DD 7E F1      [19] 1727 	ld	a,-15 (ix)
   3078 D6 1E         [ 7] 1728 	sub	a, #0x1E
   307A DA 59 2F      [10] 1729 	jp	C,00107$
   307D                    1730 00109$:
   307D DD F9         [10] 1731 	ld	sp, ix
   307F DD E1         [14] 1732 	pop	ix
   3081 C9            [10] 1733 	ret
                           1734 	.area _CODE
                           1735 	.area _INITIALIZER
                           1736 	.area _CABS (ABS)
