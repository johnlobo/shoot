                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 01:34:09 2015
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
   62A6                      34 _enemies::
   62A6                      35 	.ds 1080
   66DE                      36 _active_enemies::
   66DE                      37 	.ds 1
   66DF                      38 _groups::
   66DF                      39 	.ds 32
   66FF                      40 _active_groups::
   66FF                      41 	.ds 1
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
   2465                      70 _detectColision::
   2465 DD E5         [15]   71 	push	ix
   2467 DD 21 00 00   [14]   72 	ld	ix,#0
   246B DD 39         [15]   73 	add	ix,sp
                             74 ;src/entities/enemies.c:15: return ((x1 < x2 + w2) && (x1 + w1 > x2) && (y1 < y2 + h2) && (h1 + y1 > y2));
   246D DD 5E 08      [19]   75 	ld	e,8 (ix)
   2470 16 00         [ 7]   76 	ld	d,#0x00
   2472 DD 6E 0A      [19]   77 	ld	l,10 (ix)
   2475 26 00         [ 7]   78 	ld	h,#0x00
   2477 19            [11]   79 	add	hl,de
   2478 DD 4E 04      [19]   80 	ld	c,4 (ix)
   247B 06 00         [ 7]   81 	ld	b,#0x00
   247D 79            [ 4]   82 	ld	a,c
   247E 95            [ 4]   83 	sub	a, l
   247F 78            [ 4]   84 	ld	a,b
   2480 9C            [ 4]   85 	sbc	a, h
   2481 E2 86 24      [10]   86 	jp	PO, 00122$
   2484 EE 80         [ 7]   87 	xor	a, #0x80
   2486                      88 00122$:
   2486 F2 C9 24      [10]   89 	jp	P,00103$
   2489 DD 6E 06      [19]   90 	ld	l,6 (ix)
   248C 26 00         [ 7]   91 	ld	h,#0x00
   248E 09            [11]   92 	add	hl,bc
   248F 7B            [ 4]   93 	ld	a,e
   2490 95            [ 4]   94 	sub	a, l
   2491 7A            [ 4]   95 	ld	a,d
   2492 9C            [ 4]   96 	sbc	a, h
   2493 E2 98 24      [10]   97 	jp	PO, 00123$
   2496 EE 80         [ 7]   98 	xor	a, #0x80
   2498                      99 00123$:
   2498 F2 C9 24      [10]  100 	jp	P,00103$
   249B DD 5E 09      [19]  101 	ld	e,9 (ix)
   249E 16 00         [ 7]  102 	ld	d,#0x00
   24A0 DD 6E 0B      [19]  103 	ld	l,11 (ix)
   24A3 26 00         [ 7]  104 	ld	h,#0x00
   24A5 19            [11]  105 	add	hl,de
   24A6 DD 4E 05      [19]  106 	ld	c,5 (ix)
   24A9 06 00         [ 7]  107 	ld	b,#0x00
   24AB 79            [ 4]  108 	ld	a,c
   24AC 95            [ 4]  109 	sub	a, l
   24AD 78            [ 4]  110 	ld	a,b
   24AE 9C            [ 4]  111 	sbc	a, h
   24AF E2 B4 24      [10]  112 	jp	PO, 00124$
   24B2 EE 80         [ 7]  113 	xor	a, #0x80
   24B4                     114 00124$:
   24B4 F2 C9 24      [10]  115 	jp	P,00103$
   24B7 DD 6E 07      [19]  116 	ld	l,7 (ix)
   24BA 26 00         [ 7]  117 	ld	h,#0x00
   24BC 09            [11]  118 	add	hl,bc
   24BD 7B            [ 4]  119 	ld	a,e
   24BE 95            [ 4]  120 	sub	a, l
   24BF 7A            [ 4]  121 	ld	a,d
   24C0 9C            [ 4]  122 	sbc	a, h
   24C1 E2 C6 24      [10]  123 	jp	PO, 00125$
   24C4 EE 80         [ 7]  124 	xor	a, #0x80
   24C6                     125 00125$:
   24C6 FA CD 24      [10]  126 	jp	M,00104$
   24C9                     127 00103$:
   24C9 2E 00         [ 7]  128 	ld	l,#0x00
   24CB 18 02         [12]  129 	jr	00105$
   24CD                     130 00104$:
   24CD 2E 01         [ 7]  131 	ld	l,#0x01
   24CF                     132 00105$:
   24CF DD E1         [14]  133 	pop	ix
   24D1 C9            [10]  134 	ret
                            135 ;src/entities/enemies.c:22: u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
                            136 ;	---------------------------------
                            137 ; Function check_collision_enemies
                            138 ; ---------------------------------
   24D2                     139 _check_collision_enemies::
   24D2 DD E5         [15]  140 	push	ix
   24D4 DD 21 00 00   [14]  141 	ld	ix,#0
   24D8 DD 39         [15]  142 	add	ix,sp
   24DA 21 F6 FF      [10]  143 	ld	hl,#-10
   24DD 39            [11]  144 	add	hl,sp
   24DE F9            [ 6]  145 	ld	sp,hl
                            146 ;src/entities/enemies.c:27: collision = 0;
   24DF DD 36 F7 00   [19]  147 	ld	-9 (ix),#0x00
                            148 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   24E3 DD 36 F6 00   [19]  149 	ld	-10 (ix),#0x00
   24E7 01 00 00      [10]  150 	ld	bc,#0x0000
   24EA                     151 00108$:
                            152 ;src/entities/enemies.c:30: if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
   24EA 21 A6 62      [10]  153 	ld	hl,#_enemies
   24ED 09            [11]  154 	add	hl,bc
   24EE EB            [ 4]  155 	ex	de,hl
   24EF 21 17 00      [10]  156 	ld	hl,#0x0017
   24F2 19            [11]  157 	add	hl,de
   24F3 DD 75 FE      [19]  158 	ld	-2 (ix),l
   24F6 DD 74 FF      [19]  159 	ld	-1 (ix),h
   24F9 DD 6E FE      [19]  160 	ld	l,-2 (ix)
   24FC DD 66 FF      [19]  161 	ld	h,-1 (ix)
   24FF 7E            [ 7]  162 	ld	a,(hl)
   2500 B7            [ 4]  163 	or	a, a
   2501 CA 8B 25      [10]  164 	jp	Z,00109$
   2504 D5            [11]  165 	push	de
   2505 FD E1         [14]  166 	pop	iy
   2507 FD 7E 10      [19]  167 	ld	a,16 (iy)
   250A DD 77 FC      [19]  168 	ld	-4 (ix),a
   250D FD 7E 11      [19]  169 	ld	a,17 (iy)
   2510 DD 77 FD      [19]  170 	ld	-3 (ix),a
   2513 AF            [ 4]  171 	xor	a, a
   2514 DD BE FC      [19]  172 	cp	a, -4 (ix)
   2517 DD 9E FD      [19]  173 	sbc	a, -3 (ix)
   251A E2 1F 25      [10]  174 	jp	PO, 00137$
   251D EE 80         [ 7]  175 	xor	a, #0x80
   251F                     176 00137$:
   251F F2 8B 25      [10]  177 	jp	P,00109$
   2522 D5            [11]  178 	push	de
   2523 FD E1         [14]  179 	pop	iy
   2525 FD 7E 12      [19]  180 	ld	a,18 (iy)
   2528 DD 77 FA      [19]  181 	ld	-6 (ix),a
   252B FD 7E 13      [19]  182 	ld	a,19 (iy)
   252E DD 77 FB      [19]  183 	ld	-5 (ix),a
   2531 AF            [ 4]  184 	xor	a, a
   2532 DD BE FA      [19]  185 	cp	a, -6 (ix)
   2535 DD 9E FB      [19]  186 	sbc	a, -5 (ix)
   2538 E2 3D 25      [10]  187 	jp	PO, 00138$
   253B EE 80         [ 7]  188 	xor	a, #0x80
   253D                     189 00138$:
   253D F2 8B 25      [10]  190 	jp	P,00109$
                            191 ;src/entities/enemies.c:31: if (fast_collision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
   2540 D5            [11]  192 	push	de
   2541 FD E1         [14]  193 	pop	iy
   2543 FD 7E 15      [19]  194 	ld	a,21 (iy)
   2546 DD 77 F9      [19]  195 	ld	-7 (ix),a
   2549 D5            [11]  196 	push	de
   254A FD E1         [14]  197 	pop	iy
   254C FD 7E 14      [19]  198 	ld	a,20 (iy)
   254F DD 77 F8      [19]  199 	ld	-8 (ix),a
   2552 DD 56 FA      [19]  200 	ld	d,-6 (ix)
   2555 DD 5E FC      [19]  201 	ld	e,-4 (ix)
   2558 C5            [11]  202 	push	bc
   2559 DD 66 F9      [19]  203 	ld	h,-7 (ix)
   255C DD 6E F8      [19]  204 	ld	l,-8 (ix)
   255F E5            [11]  205 	push	hl
   2560 D5            [11]  206 	push	de
   2561 DD 66 07      [19]  207 	ld	h,7 (ix)
   2564 DD 6E 06      [19]  208 	ld	l,6 (ix)
   2567 E5            [11]  209 	push	hl
   2568 DD 66 05      [19]  210 	ld	h,5 (ix)
   256B DD 6E 04      [19]  211 	ld	l,4 (ix)
   256E E5            [11]  212 	push	hl
   256F CD 69 51      [17]  213 	call	_fast_collision
   2572 F1            [10]  214 	pop	af
   2573 F1            [10]  215 	pop	af
   2574 F1            [10]  216 	pop	af
   2575 F1            [10]  217 	pop	af
   2576 7D            [ 4]  218 	ld	a,l
   2577 C1            [10]  219 	pop	bc
   2578 B7            [ 4]  220 	or	a, a
   2579 28 10         [12]  221 	jr	Z,00109$
                            222 ;src/entities/enemies.c:32: collision = 1;
   257B DD 36 F7 01   [19]  223 	ld	-9 (ix),#0x01
                            224 ;src/entities/enemies.c:33: enemies[i].active = 0;
   257F DD 6E FE      [19]  225 	ld	l,-2 (ix)
   2582 DD 66 FF      [19]  226 	ld	h,-1 (ix)
   2585 36 00         [10]  227 	ld	(hl),#0x00
                            228 ;src/entities/enemies.c:34: active_enemies--;
   2587 21 DE 66      [10]  229 	ld	hl, #_active_enemies+0
   258A 35            [11]  230 	dec	(hl)
   258B                     231 00109$:
                            232 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   258B 21 24 00      [10]  233 	ld	hl,#0x0024
   258E 09            [11]  234 	add	hl,bc
   258F 4D            [ 4]  235 	ld	c,l
   2590 44            [ 4]  236 	ld	b,h
   2591 DD 34 F6      [23]  237 	inc	-10 (ix)
   2594 DD 7E F6      [19]  238 	ld	a,-10 (ix)
   2597 D6 1E         [ 7]  239 	sub	a, #0x1E
   2599 DA EA 24      [10]  240 	jp	C,00108$
                            241 ;src/entities/enemies.c:38: return collision;
   259C DD 6E F7      [19]  242 	ld	l,-9 (ix)
   259F DD F9         [10]  243 	ld	sp, ix
   25A1 DD E1         [14]  244 	pop	ix
   25A3 C9            [10]  245 	ret
                            246 ;src/entities/enemies.c:45: void init_enemies(){
                            247 ;	---------------------------------
                            248 ; Function init_enemies
                            249 ; ---------------------------------
   25A4                     250 _init_enemies::
   25A4 DD E5         [15]  251 	push	ix
   25A6 DD 21 00 00   [14]  252 	ld	ix,#0
   25AA DD 39         [15]  253 	add	ix,sp
   25AC 3B            [ 6]  254 	dec	sp
                            255 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   25AD DD 36 FF 00   [19]  256 	ld	-1 (ix),#0x00
   25B1 11 00 00      [10]  257 	ld	de,#0x0000
   25B4                     258 00102$:
                            259 ;src/entities/enemies.c:48: enemies[k].active=0;
   25B4 21 A6 62      [10]  260 	ld	hl,#_enemies
   25B7 19            [11]  261 	add	hl,de
   25B8 4D            [ 4]  262 	ld	c,l
   25B9 44            [ 4]  263 	ld	b,h
   25BA 21 17 00      [10]  264 	ld	hl,#0x0017
   25BD 09            [11]  265 	add	hl,bc
   25BE 36 00         [10]  266 	ld	(hl),#0x00
                            267 ;src/entities/enemies.c:49: enemies[k].x=0;
   25C0 21 10 00      [10]  268 	ld	hl,#0x0010
   25C3 09            [11]  269 	add	hl,bc
   25C4 AF            [ 4]  270 	xor	a, a
   25C5 77            [ 7]  271 	ld	(hl), a
   25C6 23            [ 6]  272 	inc	hl
   25C7 77            [ 7]  273 	ld	(hl), a
                            274 ;src/entities/enemies.c:50: enemies[k].y=0;
   25C8 21 12 00      [10]  275 	ld	hl,#0x0012
   25CB 09            [11]  276 	add	hl,bc
   25CC AF            [ 4]  277 	xor	a, a
   25CD 77            [ 7]  278 	ld	(hl), a
   25CE 23            [ 6]  279 	inc	hl
   25CF 77            [ 7]  280 	ld	(hl), a
                            281 ;src/entities/enemies.c:51: enemies[k].w=0;
   25D0 21 14 00      [10]  282 	ld	hl,#0x0014
   25D3 09            [11]  283 	add	hl,bc
   25D4 36 00         [10]  284 	ld	(hl),#0x00
                            285 ;src/entities/enemies.c:52: enemies[k].h=0;
   25D6 21 15 00      [10]  286 	ld	hl,#0x0015
   25D9 09            [11]  287 	add	hl,bc
   25DA 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/entities/enemies.c:53: enemies[k].dir=0;
   25DC 21 16 00      [10]  290 	ld	hl,#0x0016
   25DF 09            [11]  291 	add	hl,bc
   25E0 36 00         [10]  292 	ld	(hl),#0x00
                            293 ;src/entities/enemies.c:54: enemies[k].frame=0;
   25E2 21 19 00      [10]  294 	ld	hl,#0x0019
   25E5 09            [11]  295 	add	hl,bc
   25E6 36 00         [10]  296 	ld	(hl),#0x00
                            297 ;src/entities/enemies.c:55: enemies[k].last_moved=0;
   25E8 21 20 00      [10]  298 	ld	hl,#0x0020
   25EB 09            [11]  299 	add	hl,bc
   25EC AF            [ 4]  300 	xor	a, a
   25ED 77            [ 7]  301 	ld	(hl), a
   25EE 23            [ 6]  302 	inc	hl
   25EF 77            [ 7]  303 	ld	(hl), a
   25F0 23            [ 6]  304 	inc	hl
   25F1 AF            [ 4]  305 	xor	a, a
   25F2 77            [ 7]  306 	ld	(hl), a
   25F3 23            [ 6]  307 	inc	hl
   25F4 77            [ 7]  308 	ld	(hl), a
                            309 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   25F5 21 24 00      [10]  310 	ld	hl,#0x0024
   25F8 19            [11]  311 	add	hl,de
   25F9 EB            [ 4]  312 	ex	de,hl
   25FA DD 34 FF      [23]  313 	inc	-1 (ix)
   25FD DD 7E FF      [19]  314 	ld	a,-1 (ix)
   2600 D6 1E         [ 7]  315 	sub	a, #0x1E
   2602 38 B0         [12]  316 	jr	C,00102$
                            317 ;src/entities/enemies.c:57: active_enemies=0;
   2604 21 DE 66      [10]  318 	ld	hl,#_active_enemies + 0
   2607 36 00         [10]  319 	ld	(hl), #0x00
   2609 33            [ 6]  320 	inc	sp
   260A DD E1         [14]  321 	pop	ix
   260C C9            [10]  322 	ret
                            323 ;src/entities/enemies.c:65: void create_enemy(i16 x, i16 y, u8 type){
                            324 ;	---------------------------------
                            325 ; Function create_enemy
                            326 ; ---------------------------------
   260D                     327 _create_enemy::
   260D DD E5         [15]  328 	push	ix
   260F DD 21 00 00   [14]  329 	ld	ix,#0
   2613 DD 39         [15]  330 	add	ix,sp
   2615 21 E0 FF      [10]  331 	ld	hl,#-32
   2618 39            [11]  332 	add	hl,sp
   2619 F9            [ 6]  333 	ld	sp,hl
                            334 ;src/entities/enemies.c:67: if (active_enemies < MAX_ENEMIES){
   261A 3A DE 66      [13]  335 	ld	a,(#_active_enemies + 0)
   261D D6 1E         [ 7]  336 	sub	a, #0x1E
   261F D2 47 29      [10]  337 	jp	NC,00110$
                            338 ;src/entities/enemies.c:69: while (enemies[k].active){
   2622 11 00 00      [10]  339 	ld	de,#0x0000
   2625                     340 00101$:
   2625 21 A6 62      [10]  341 	ld	hl,#_enemies
   2628 19            [11]  342 	add	hl,de
   2629 DD 75 F8      [19]  343 	ld	-8 (ix),l
   262C DD 74 F9      [19]  344 	ld	-7 (ix),h
   262F DD 7E F8      [19]  345 	ld	a,-8 (ix)
   2632 C6 17         [ 7]  346 	add	a, #0x17
   2634 6F            [ 4]  347 	ld	l,a
   2635 DD 7E F9      [19]  348 	ld	a,-7 (ix)
   2638 CE 00         [ 7]  349 	adc	a, #0x00
   263A 67            [ 4]  350 	ld	h,a
   263B 7E            [ 7]  351 	ld	a,(hl)
   263C B7            [ 4]  352 	or	a, a
   263D 28 07         [12]  353 	jr	Z,00103$
                            354 ;src/entities/enemies.c:70: k++;
   263F 21 24 00      [10]  355 	ld	hl,#0x0024
   2642 19            [11]  356 	add	hl,de
   2643 EB            [ 4]  357 	ex	de,hl
   2644 18 DF         [12]  358 	jr	00101$
   2646                     359 00103$:
                            360 ;src/entities/enemies.c:72: enemies[k].active=1;
   2646 36 01         [10]  361 	ld	(hl),#0x01
                            362 ;src/entities/enemies.c:73: enemies[k].frame=0;
   2648 DD 7E F8      [19]  363 	ld	a,-8 (ix)
   264B C6 19         [ 7]  364 	add	a, #0x19
   264D 6F            [ 4]  365 	ld	l,a
   264E DD 7E F9      [19]  366 	ld	a,-7 (ix)
   2651 CE 00         [ 7]  367 	adc	a, #0x00
   2653 67            [ 4]  368 	ld	h,a
   2654 36 00         [10]  369 	ld	(hl),#0x00
                            370 ;src/entities/enemies.c:77: enemies[k].x=x;
   2656 DD 7E F8      [19]  371 	ld	a,-8 (ix)
   2659 C6 10         [ 7]  372 	add	a, #0x10
   265B DD 77 F6      [19]  373 	ld	-10 (ix),a
   265E DD 7E F9      [19]  374 	ld	a,-7 (ix)
   2661 CE 00         [ 7]  375 	adc	a, #0x00
   2663 DD 77 F7      [19]  376 	ld	-9 (ix),a
                            377 ;src/entities/enemies.c:78: enemies[k].y=y;
   2666 DD 7E F8      [19]  378 	ld	a,-8 (ix)
   2669 C6 12         [ 7]  379 	add	a, #0x12
   266B DD 77 F4      [19]  380 	ld	-12 (ix),a
   266E DD 7E F9      [19]  381 	ld	a,-7 (ix)
   2671 CE 00         [ 7]  382 	adc	a, #0x00
   2673 DD 77 F5      [19]  383 	ld	-11 (ix),a
                            384 ;src/entities/enemies.c:79: enemies[k].w=4;
   2676 DD 7E F8      [19]  385 	ld	a,-8 (ix)
   2679 C6 14         [ 7]  386 	add	a, #0x14
   267B DD 77 F2      [19]  387 	ld	-14 (ix),a
   267E DD 7E F9      [19]  388 	ld	a,-7 (ix)
   2681 CE 00         [ 7]  389 	adc	a, #0x00
   2683 DD 77 F3      [19]  390 	ld	-13 (ix),a
                            391 ;src/entities/enemies.c:80: enemies[k].h=8;
   2686 DD 7E F8      [19]  392 	ld	a,-8 (ix)
   2689 C6 15         [ 7]  393 	add	a, #0x15
   268B DD 77 F0      [19]  394 	ld	-16 (ix),a
   268E DD 7E F9      [19]  395 	ld	a,-7 (ix)
   2691 CE 00         [ 7]  396 	adc	a, #0x00
   2693 DD 77 F1      [19]  397 	ld	-15 (ix),a
                            398 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   2696 DD 7E F8      [19]  399 	ld	a,-8 (ix)
   2699 C6 18         [ 7]  400 	add	a, #0x18
   269B DD 77 EE      [19]  401 	ld	-18 (ix),a
   269E DD 7E F9      [19]  402 	ld	a,-7 (ix)
   26A1 CE 00         [ 7]  403 	adc	a, #0x00
   26A3 DD 77 EF      [19]  404 	ld	-17 (ix),a
                            405 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
   26A6 DD 7E F8      [19]  406 	ld	a,-8 (ix)
   26A9 C6 02         [ 7]  407 	add	a, #0x02
   26AB DD 77 FE      [19]  408 	ld	-2 (ix),a
   26AE DD 7E F9      [19]  409 	ld	a,-7 (ix)
   26B1 CE 00         [ 7]  410 	adc	a, #0x00
   26B3 DD 77 FF      [19]  411 	ld	-1 (ix),a
                            412 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
   26B6 DD 7E F8      [19]  413 	ld	a,-8 (ix)
   26B9 C6 04         [ 7]  414 	add	a, #0x04
   26BB DD 77 FC      [19]  415 	ld	-4 (ix),a
   26BE DD 7E F9      [19]  416 	ld	a,-7 (ix)
   26C1 CE 00         [ 7]  417 	adc	a, #0x00
   26C3 DD 77 FD      [19]  418 	ld	-3 (ix),a
                            419 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
   26C6 DD 7E F8      [19]  420 	ld	a,-8 (ix)
   26C9 C6 06         [ 7]  421 	add	a, #0x06
   26CB DD 77 FA      [19]  422 	ld	-6 (ix),a
   26CE DD 7E F9      [19]  423 	ld	a,-7 (ix)
   26D1 CE 00         [ 7]  424 	adc	a, #0x00
   26D3 DD 77 FB      [19]  425 	ld	-5 (ix),a
                            426 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
   26D6 DD 7E F8      [19]  427 	ld	a,-8 (ix)
   26D9 C6 08         [ 7]  428 	add	a, #0x08
   26DB DD 77 EC      [19]  429 	ld	-20 (ix),a
   26DE DD 7E F9      [19]  430 	ld	a,-7 (ix)
   26E1 CE 00         [ 7]  431 	adc	a, #0x00
   26E3 DD 77 ED      [19]  432 	ld	-19 (ix),a
                            433 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
   26E6 DD 7E F8      [19]  434 	ld	a,-8 (ix)
   26E9 C6 0A         [ 7]  435 	add	a, #0x0A
   26EB DD 77 EA      [19]  436 	ld	-22 (ix),a
   26EE DD 7E F9      [19]  437 	ld	a,-7 (ix)
   26F1 CE 00         [ 7]  438 	adc	a, #0x00
   26F3 DD 77 EB      [19]  439 	ld	-21 (ix),a
                            440 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
   26F6 DD 7E F8      [19]  441 	ld	a,-8 (ix)
   26F9 C6 0C         [ 7]  442 	add	a, #0x0C
   26FB DD 77 E8      [19]  443 	ld	-24 (ix),a
   26FE DD 7E F9      [19]  444 	ld	a,-7 (ix)
   2701 CE 00         [ 7]  445 	adc	a, #0x00
   2703 DD 77 E9      [19]  446 	ld	-23 (ix),a
                            447 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
   2706 DD 7E F8      [19]  448 	ld	a,-8 (ix)
   2709 C6 0E         [ 7]  449 	add	a, #0x0E
   270B DD 77 E6      [19]  450 	ld	-26 (ix),a
   270E DD 7E F9      [19]  451 	ld	a,-7 (ix)
   2711 CE 00         [ 7]  452 	adc	a, #0x00
   2713 DD 77 E7      [19]  453 	ld	-25 (ix),a
                            454 ;src/entities/enemies.c:90: enemies[k].movement=0;
   2716 DD 7E F8      [19]  455 	ld	a,-8 (ix)
   2719 C6 1D         [ 7]  456 	add	a, #0x1D
   271B DD 77 E4      [19]  457 	ld	-28 (ix),a
   271E DD 7E F9      [19]  458 	ld	a,-7 (ix)
   2721 CE 00         [ 7]  459 	adc	a, #0x00
   2723 DD 77 E5      [19]  460 	ld	-27 (ix),a
                            461 ;src/entities/enemies.c:91: enemies[k].stage=0;
   2726 DD 7E F8      [19]  462 	ld	a,-8 (ix)
   2729 C6 1E         [ 7]  463 	add	a, #0x1E
   272B DD 77 E2      [19]  464 	ld	-30 (ix),a
   272E DD 7E F9      [19]  465 	ld	a,-7 (ix)
   2731 CE 00         [ 7]  466 	adc	a, #0x00
   2733 DD 77 E3      [19]  467 	ld	-29 (ix),a
                            468 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   2736 DD 7E F8      [19]  469 	ld	a,-8 (ix)
   2739 C6 1F         [ 7]  470 	add	a, #0x1F
   273B DD 77 E0      [19]  471 	ld	-32 (ix),a
   273E DD 7E F9      [19]  472 	ld	a,-7 (ix)
   2741 CE 00         [ 7]  473 	adc	a, #0x00
   2743 DD 77 E1      [19]  474 	ld	-31 (ix),a
                            475 ;src/entities/enemies.c:74: switch (type){
   2746 DD 7E 08      [19]  476 	ld	a,8 (ix)
   2749 3D            [ 4]  477 	dec	a
   274A 28 0B         [12]  478 	jr	Z,00104$
   274C DD 7E 08      [19]  479 	ld	a,8 (ix)
   274F D6 02         [ 7]  480 	sub	a, #0x02
   2751 CA FC 27      [10]  481 	jp	Z,00105$
   2754 C3 A1 28      [10]  482 	jp	00106$
                            483 ;src/entities/enemies.c:76: case 1:
   2757                     484 00104$:
                            485 ;src/entities/enemies.c:77: enemies[k].x=x;
   2757 DD 6E F6      [19]  486 	ld	l,-10 (ix)
   275A DD 66 F7      [19]  487 	ld	h,-9 (ix)
   275D DD 7E 04      [19]  488 	ld	a,4 (ix)
   2760 77            [ 7]  489 	ld	(hl),a
   2761 23            [ 6]  490 	inc	hl
   2762 DD 7E 05      [19]  491 	ld	a,5 (ix)
   2765 77            [ 7]  492 	ld	(hl),a
                            493 ;src/entities/enemies.c:78: enemies[k].y=y;
   2766 DD 6E F4      [19]  494 	ld	l,-12 (ix)
   2769 DD 66 F5      [19]  495 	ld	h,-11 (ix)
   276C DD 7E 06      [19]  496 	ld	a,6 (ix)
   276F 77            [ 7]  497 	ld	(hl),a
   2770 23            [ 6]  498 	inc	hl
   2771 DD 7E 07      [19]  499 	ld	a,7 (ix)
   2774 77            [ 7]  500 	ld	(hl),a
                            501 ;src/entities/enemies.c:79: enemies[k].w=4;
   2775 DD 6E F2      [19]  502 	ld	l,-14 (ix)
   2778 DD 66 F3      [19]  503 	ld	h,-13 (ix)
   277B 36 04         [10]  504 	ld	(hl),#0x04
                            505 ;src/entities/enemies.c:80: enemies[k].h=8;
   277D DD 6E F0      [19]  506 	ld	l,-16 (ix)
   2780 DD 66 F1      [19]  507 	ld	h,-15 (ix)
   2783 36 08         [10]  508 	ld	(hl),#0x08
                            509 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   2785 DD 6E EE      [19]  510 	ld	l,-18 (ix)
   2788 DD 66 EF      [19]  511 	ld	h,-17 (ix)
   278B 36 00         [10]  512 	ld	(hl),#0x00
                            513 ;src/entities/enemies.c:82: enemies[k].sprite[0]= (u8*) G_baddie04_00;
   278D DD 6E F8      [19]  514 	ld	l,-8 (ix)
   2790 DD 66 F9      [19]  515 	ld	h,-7 (ix)
   2793 36 68         [10]  516 	ld	(hl),#<(_G_baddie04_00)
   2795 23            [ 6]  517 	inc	hl
   2796 36 4A         [10]  518 	ld	(hl),#>(_G_baddie04_00)
                            519 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
   2798 DD 6E FE      [19]  520 	ld	l,-2 (ix)
   279B DD 66 FF      [19]  521 	ld	h,-1 (ix)
   279E 36 88         [10]  522 	ld	(hl),#<(_G_baddie04_01)
   27A0 23            [ 6]  523 	inc	hl
   27A1 36 4A         [10]  524 	ld	(hl),#>(_G_baddie04_01)
                            525 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
   27A3 DD 6E FC      [19]  526 	ld	l,-4 (ix)
   27A6 DD 66 FD      [19]  527 	ld	h,-3 (ix)
   27A9 36 A8         [10]  528 	ld	(hl),#<(_G_baddie04_02)
   27AB 23            [ 6]  529 	inc	hl
   27AC 36 4A         [10]  530 	ld	(hl),#>(_G_baddie04_02)
                            531 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
   27AE DD 6E FA      [19]  532 	ld	l,-6 (ix)
   27B1 DD 66 FB      [19]  533 	ld	h,-5 (ix)
   27B4 36 C8         [10]  534 	ld	(hl),#<(_G_baddie04_03)
   27B6 23            [ 6]  535 	inc	hl
   27B7 36 4A         [10]  536 	ld	(hl),#>(_G_baddie04_03)
                            537 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
   27B9 DD 6E EC      [19]  538 	ld	l,-20 (ix)
   27BC DD 66 ED      [19]  539 	ld	h,-19 (ix)
   27BF 36 E8         [10]  540 	ld	(hl),#<(_G_baddie04_04)
   27C1 23            [ 6]  541 	inc	hl
   27C2 36 4A         [10]  542 	ld	(hl),#>(_G_baddie04_04)
                            543 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
   27C4 DD 6E EA      [19]  544 	ld	l,-22 (ix)
   27C7 DD 66 EB      [19]  545 	ld	h,-21 (ix)
   27CA 36 08         [10]  546 	ld	(hl),#<(_G_baddie04_05)
   27CC 23            [ 6]  547 	inc	hl
   27CD 36 4B         [10]  548 	ld	(hl),#>(_G_baddie04_05)
                            549 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
   27CF DD 6E E8      [19]  550 	ld	l,-24 (ix)
   27D2 DD 66 E9      [19]  551 	ld	h,-23 (ix)
   27D5 36 28         [10]  552 	ld	(hl),#<(_G_baddie04_06)
   27D7 23            [ 6]  553 	inc	hl
   27D8 36 4B         [10]  554 	ld	(hl),#>(_G_baddie04_06)
                            555 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
   27DA DD 6E E6      [19]  556 	ld	l,-26 (ix)
   27DD DD 66 E7      [19]  557 	ld	h,-25 (ix)
   27E0 36 48         [10]  558 	ld	(hl),#<(_G_baddie04_07)
   27E2 23            [ 6]  559 	inc	hl
   27E3 36 4B         [10]  560 	ld	(hl),#>(_G_baddie04_07)
                            561 ;src/entities/enemies.c:90: enemies[k].movement=0;
   27E5 DD 6E E4      [19]  562 	ld	l,-28 (ix)
   27E8 DD 66 E5      [19]  563 	ld	h,-27 (ix)
   27EB 36 00         [10]  564 	ld	(hl),#0x00
                            565 ;src/entities/enemies.c:91: enemies[k].stage=0;
   27ED DD 6E E2      [19]  566 	ld	l,-30 (ix)
   27F0 DD 66 E3      [19]  567 	ld	h,-29 (ix)
   27F3 36 00         [10]  568 	ld	(hl),#0x00
                            569 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   27F5 E1            [10]  570 	pop	hl
   27F6 E5            [11]  571 	push	hl
   27F7 36 00         [10]  572 	ld	(hl),#0x00
                            573 ;src/entities/enemies.c:93: break;
   27F9 C3 43 29      [10]  574 	jp	00107$
                            575 ;src/entities/enemies.c:94: case 2:
   27FC                     576 00105$:
                            577 ;src/entities/enemies.c:95: enemies[k].x=x;
   27FC DD 6E F6      [19]  578 	ld	l,-10 (ix)
   27FF DD 66 F7      [19]  579 	ld	h,-9 (ix)
   2802 DD 7E 04      [19]  580 	ld	a,4 (ix)
   2805 77            [ 7]  581 	ld	(hl),a
   2806 23            [ 6]  582 	inc	hl
   2807 DD 7E 05      [19]  583 	ld	a,5 (ix)
   280A 77            [ 7]  584 	ld	(hl),a
                            585 ;src/entities/enemies.c:96: enemies[k].y=y;
   280B DD 6E F4      [19]  586 	ld	l,-12 (ix)
   280E DD 66 F5      [19]  587 	ld	h,-11 (ix)
   2811 DD 7E 06      [19]  588 	ld	a,6 (ix)
   2814 77            [ 7]  589 	ld	(hl),a
   2815 23            [ 6]  590 	inc	hl
   2816 DD 7E 07      [19]  591 	ld	a,7 (ix)
   2819 77            [ 7]  592 	ld	(hl),a
                            593 ;src/entities/enemies.c:97: enemies[k].w=4;
   281A DD 6E F2      [19]  594 	ld	l,-14 (ix)
   281D DD 66 F3      [19]  595 	ld	h,-13 (ix)
   2820 36 04         [10]  596 	ld	(hl),#0x04
                            597 ;src/entities/enemies.c:98: enemies[k].h=8;
   2822 DD 6E F0      [19]  598 	ld	l,-16 (ix)
   2825 DD 66 F1      [19]  599 	ld	h,-15 (ix)
   2828 36 08         [10]  600 	ld	(hl),#0x08
                            601 ;src/entities/enemies.c:99: enemies[k].num_frames=0;
   282A DD 6E EE      [19]  602 	ld	l,-18 (ix)
   282D DD 66 EF      [19]  603 	ld	h,-17 (ix)
   2830 36 00         [10]  604 	ld	(hl),#0x00
                            605 ;src/entities/enemies.c:100: enemies[k].sprite[0]= (u8*) G_baddie03_00;
   2832 DD 6E F8      [19]  606 	ld	l,-8 (ix)
   2835 DD 66 F9      [19]  607 	ld	h,-7 (ix)
   2838 36 E5         [10]  608 	ld	(hl),#<(_G_baddie03_00)
   283A 23            [ 6]  609 	inc	hl
   283B 36 44         [10]  610 	ld	(hl),#>(_G_baddie03_00)
                            611 ;src/entities/enemies.c:101: enemies[k].sprite[1]= (u8*) G_baddie03_01;
   283D DD 6E FE      [19]  612 	ld	l,-2 (ix)
   2840 DD 66 FF      [19]  613 	ld	h,-1 (ix)
   2843 36 05         [10]  614 	ld	(hl),#<(_G_baddie03_01)
   2845 23            [ 6]  615 	inc	hl
   2846 36 45         [10]  616 	ld	(hl),#>(_G_baddie03_01)
                            617 ;src/entities/enemies.c:102: enemies[k].sprite[2]= (u8*) G_baddie03_02;
   2848 DD 6E FC      [19]  618 	ld	l,-4 (ix)
   284B DD 66 FD      [19]  619 	ld	h,-3 (ix)
   284E 36 25         [10]  620 	ld	(hl),#<(_G_baddie03_02)
   2850 23            [ 6]  621 	inc	hl
   2851 36 45         [10]  622 	ld	(hl),#>(_G_baddie03_02)
                            623 ;src/entities/enemies.c:103: enemies[k].sprite[3]= (u8*) G_baddie03_03;
   2853 DD 6E FA      [19]  624 	ld	l,-6 (ix)
   2856 DD 66 FB      [19]  625 	ld	h,-5 (ix)
   2859 36 45         [10]  626 	ld	(hl),#<(_G_baddie03_03)
   285B 23            [ 6]  627 	inc	hl
   285C 36 45         [10]  628 	ld	(hl),#>(_G_baddie03_03)
                            629 ;src/entities/enemies.c:104: enemies[k].sprite[4]= (u8*) G_baddie03_04;
   285E DD 6E EC      [19]  630 	ld	l,-20 (ix)
   2861 DD 66 ED      [19]  631 	ld	h,-19 (ix)
   2864 36 65         [10]  632 	ld	(hl),#<(_G_baddie03_04)
   2866 23            [ 6]  633 	inc	hl
   2867 36 45         [10]  634 	ld	(hl),#>(_G_baddie03_04)
                            635 ;src/entities/enemies.c:105: enemies[k].sprite[5]= (u8*) G_baddie03_05;
   2869 DD 6E EA      [19]  636 	ld	l,-22 (ix)
   286C DD 66 EB      [19]  637 	ld	h,-21 (ix)
   286F 36 85         [10]  638 	ld	(hl),#<(_G_baddie03_05)
   2871 23            [ 6]  639 	inc	hl
   2872 36 45         [10]  640 	ld	(hl),#>(_G_baddie03_05)
                            641 ;src/entities/enemies.c:106: enemies[k].sprite[6]= (u8*) G_baddie03_06;
   2874 DD 6E E8      [19]  642 	ld	l,-24 (ix)
   2877 DD 66 E9      [19]  643 	ld	h,-23 (ix)
   287A 36 A5         [10]  644 	ld	(hl),#<(_G_baddie03_06)
   287C 23            [ 6]  645 	inc	hl
   287D 36 45         [10]  646 	ld	(hl),#>(_G_baddie03_06)
                            647 ;src/entities/enemies.c:107: enemies[k].sprite[7]= (u8*) G_baddie03_07;
   287F DD 6E E6      [19]  648 	ld	l,-26 (ix)
   2882 DD 66 E7      [19]  649 	ld	h,-25 (ix)
   2885 36 C5         [10]  650 	ld	(hl),#<(_G_baddie03_07)
   2887 23            [ 6]  651 	inc	hl
   2888 36 45         [10]  652 	ld	(hl),#>(_G_baddie03_07)
                            653 ;src/entities/enemies.c:108: enemies[k].movement=0;
   288A DD 6E E4      [19]  654 	ld	l,-28 (ix)
   288D DD 66 E5      [19]  655 	ld	h,-27 (ix)
   2890 36 00         [10]  656 	ld	(hl),#0x00
                            657 ;src/entities/enemies.c:109: enemies[k].stage=0;
   2892 DD 6E E2      [19]  658 	ld	l,-30 (ix)
   2895 DD 66 E3      [19]  659 	ld	h,-29 (ix)
   2898 36 00         [10]  660 	ld	(hl),#0x00
                            661 ;src/entities/enemies.c:110: enemies[k].stage_step=0;
   289A E1            [10]  662 	pop	hl
   289B E5            [11]  663 	push	hl
   289C 36 00         [10]  664 	ld	(hl),#0x00
                            665 ;src/entities/enemies.c:111: break;
   289E C3 43 29      [10]  666 	jp	00107$
                            667 ;src/entities/enemies.c:112: default:
   28A1                     668 00106$:
                            669 ;src/entities/enemies.c:113: enemies[k].x=x;
   28A1 DD 6E F6      [19]  670 	ld	l,-10 (ix)
   28A4 DD 66 F7      [19]  671 	ld	h,-9 (ix)
   28A7 DD 7E 04      [19]  672 	ld	a,4 (ix)
   28AA 77            [ 7]  673 	ld	(hl),a
   28AB 23            [ 6]  674 	inc	hl
   28AC DD 7E 05      [19]  675 	ld	a,5 (ix)
   28AF 77            [ 7]  676 	ld	(hl),a
                            677 ;src/entities/enemies.c:114: enemies[k].y=y;
   28B0 DD 6E F4      [19]  678 	ld	l,-12 (ix)
   28B3 DD 66 F5      [19]  679 	ld	h,-11 (ix)
   28B6 DD 7E 06      [19]  680 	ld	a,6 (ix)
   28B9 77            [ 7]  681 	ld	(hl),a
   28BA 23            [ 6]  682 	inc	hl
   28BB DD 7E 07      [19]  683 	ld	a,7 (ix)
   28BE 77            [ 7]  684 	ld	(hl),a
                            685 ;src/entities/enemies.c:115: enemies[k].w=5;
   28BF DD 6E F2      [19]  686 	ld	l,-14 (ix)
   28C2 DD 66 F3      [19]  687 	ld	h,-13 (ix)
   28C5 36 05         [10]  688 	ld	(hl),#0x05
                            689 ;src/entities/enemies.c:116: enemies[k].h=16;
   28C7 DD 6E F0      [19]  690 	ld	l,-16 (ix)
   28CA DD 66 F1      [19]  691 	ld	h,-15 (ix)
   28CD 36 10         [10]  692 	ld	(hl),#0x10
                            693 ;src/entities/enemies.c:117: enemies[k].num_frames=0;
   28CF DD 6E EE      [19]  694 	ld	l,-18 (ix)
   28D2 DD 66 EF      [19]  695 	ld	h,-17 (ix)
   28D5 36 00         [10]  696 	ld	(hl),#0x00
                            697 ;src/entities/enemies.c:118: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   28D7 DD 6E F8      [19]  698 	ld	l,-8 (ix)
   28DA DD 66 F9      [19]  699 	ld	h,-7 (ix)
   28DD 36 6E         [10]  700 	ld	(hl),#<(_G_baddie01_00)
   28DF 23            [ 6]  701 	inc	hl
   28E0 36 3D         [10]  702 	ld	(hl),#>(_G_baddie01_00)
                            703 ;src/entities/enemies.c:119: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   28E2 DD 6E FE      [19]  704 	ld	l,-2 (ix)
   28E5 DD 66 FF      [19]  705 	ld	h,-1 (ix)
   28E8 36 BE         [10]  706 	ld	(hl),#<(_G_baddie01_01)
   28EA 23            [ 6]  707 	inc	hl
   28EB 36 3D         [10]  708 	ld	(hl),#>(_G_baddie01_01)
                            709 ;src/entities/enemies.c:120: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   28ED DD 6E FC      [19]  710 	ld	l,-4 (ix)
   28F0 DD 66 FD      [19]  711 	ld	h,-3 (ix)
   28F3 36 0E         [10]  712 	ld	(hl),#<(_G_baddie01_02)
   28F5 23            [ 6]  713 	inc	hl
   28F6 36 3E         [10]  714 	ld	(hl),#>(_G_baddie01_02)
                            715 ;src/entities/enemies.c:121: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   28F8 DD 6E FA      [19]  716 	ld	l,-6 (ix)
   28FB DD 66 FB      [19]  717 	ld	h,-5 (ix)
   28FE 36 5E         [10]  718 	ld	(hl),#<(_G_baddie01_03)
   2900 23            [ 6]  719 	inc	hl
   2901 36 3E         [10]  720 	ld	(hl),#>(_G_baddie01_03)
                            721 ;src/entities/enemies.c:122: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   2903 DD 6E EC      [19]  722 	ld	l,-20 (ix)
   2906 DD 66 ED      [19]  723 	ld	h,-19 (ix)
   2909 36 AE         [10]  724 	ld	(hl),#<(_G_baddie01_04)
   290B 23            [ 6]  725 	inc	hl
   290C 36 3E         [10]  726 	ld	(hl),#>(_G_baddie01_04)
                            727 ;src/entities/enemies.c:123: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   290E DD 6E EA      [19]  728 	ld	l,-22 (ix)
   2911 DD 66 EB      [19]  729 	ld	h,-21 (ix)
   2914 36 FE         [10]  730 	ld	(hl),#<(_G_baddie01_05)
   2916 23            [ 6]  731 	inc	hl
   2917 36 3E         [10]  732 	ld	(hl),#>(_G_baddie01_05)
                            733 ;src/entities/enemies.c:124: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2919 DD 6E E8      [19]  734 	ld	l,-24 (ix)
   291C DD 66 E9      [19]  735 	ld	h,-23 (ix)
   291F 36 4E         [10]  736 	ld	(hl),#<(_G_baddie01_06)
   2921 23            [ 6]  737 	inc	hl
   2922 36 3F         [10]  738 	ld	(hl),#>(_G_baddie01_06)
                            739 ;src/entities/enemies.c:125: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2924 DD 6E E6      [19]  740 	ld	l,-26 (ix)
   2927 DD 66 E7      [19]  741 	ld	h,-25 (ix)
   292A 36 9E         [10]  742 	ld	(hl),#<(_G_baddie01_07)
   292C 23            [ 6]  743 	inc	hl
   292D 36 3F         [10]  744 	ld	(hl),#>(_G_baddie01_07)
                            745 ;src/entities/enemies.c:126: enemies[k].movement=1;
   292F DD 6E E4      [19]  746 	ld	l,-28 (ix)
   2932 DD 66 E5      [19]  747 	ld	h,-27 (ix)
   2935 36 01         [10]  748 	ld	(hl),#0x01
                            749 ;src/entities/enemies.c:127: enemies[k].stage=0;
   2937 DD 6E E2      [19]  750 	ld	l,-30 (ix)
   293A DD 66 E3      [19]  751 	ld	h,-29 (ix)
   293D 36 00         [10]  752 	ld	(hl),#0x00
                            753 ;src/entities/enemies.c:128: enemies[k].stage_step=0;
   293F E1            [10]  754 	pop	hl
   2940 E5            [11]  755 	push	hl
   2941 36 00         [10]  756 	ld	(hl),#0x00
                            757 ;src/entities/enemies.c:130: }
   2943                     758 00107$:
                            759 ;src/entities/enemies.c:131: active_enemies++;
   2943 21 DE 66      [10]  760 	ld	hl, #_active_enemies+0
   2946 34            [11]  761 	inc	(hl)
   2947                     762 00110$:
   2947 DD F9         [10]  763 	ld	sp, ix
   2949 DD E1         [14]  764 	pop	ix
   294B C9            [10]  765 	ret
                            766 ;src/entities/enemies.c:137: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            767 ;	---------------------------------
                            768 ; Function create_enemy_group
                            769 ; ---------------------------------
   294C                     770 _create_enemy_group::
   294C DD E5         [15]  771 	push	ix
   294E DD 21 00 00   [14]  772 	ld	ix,#0
   2952 DD 39         [15]  773 	add	ix,sp
                            774 ;src/entities/enemies.c:139: if (active_groups < MAX_ENEMY_GROUPS){
   2954 3A FF 66      [13]  775 	ld	a,(#_active_groups + 0)
   2957 D6 04         [ 7]  776 	sub	a, #0x04
   2959 30 4E         [12]  777 	jr	NC,00106$
                            778 ;src/entities/enemies.c:141: while (groups[k].active){
   295B 16 00         [ 7]  779 	ld	d,#0x00
   295D                     780 00101$:
   295D 6A            [ 4]  781 	ld	l,d
   295E 26 00         [ 7]  782 	ld	h,#0x00
   2960 29            [11]  783 	add	hl, hl
   2961 29            [11]  784 	add	hl, hl
   2962 29            [11]  785 	add	hl, hl
   2963 3E DF         [ 7]  786 	ld	a,#<(_groups)
   2965 85            [ 4]  787 	add	a, l
   2966 4F            [ 4]  788 	ld	c,a
   2967 3E 66         [ 7]  789 	ld	a,#>(_groups)
   2969 8C            [ 4]  790 	adc	a, h
   296A 47            [ 4]  791 	ld	b,a
   296B 0A            [ 7]  792 	ld	a,(bc)
   296C B7            [ 4]  793 	or	a, a
   296D 28 03         [12]  794 	jr	Z,00103$
                            795 ;src/entities/enemies.c:142: k++;
   296F 14            [ 4]  796 	inc	d
   2970 18 EB         [12]  797 	jr	00101$
   2972                     798 00103$:
                            799 ;src/entities/enemies.c:144: groups[k].active=1;
   2972 3E 01         [ 7]  800 	ld	a,#0x01
   2974 02            [ 7]  801 	ld	(bc),a
                            802 ;src/entities/enemies.c:145: groups[k].x=x;
   2975 69            [ 4]  803 	ld	l, c
   2976 60            [ 4]  804 	ld	h, b
   2977 23            [ 6]  805 	inc	hl
   2978 DD 7E 04      [19]  806 	ld	a,4 (ix)
   297B 77            [ 7]  807 	ld	(hl),a
   297C 23            [ 6]  808 	inc	hl
   297D DD 7E 05      [19]  809 	ld	a,5 (ix)
   2980 77            [ 7]  810 	ld	(hl),a
                            811 ;src/entities/enemies.c:146: groups[k].y=y;
   2981 69            [ 4]  812 	ld	l, c
   2982 60            [ 4]  813 	ld	h, b
   2983 23            [ 6]  814 	inc	hl
   2984 23            [ 6]  815 	inc	hl
   2985 23            [ 6]  816 	inc	hl
   2986 DD 7E 06      [19]  817 	ld	a,6 (ix)
   2989 77            [ 7]  818 	ld	(hl),a
   298A 23            [ 6]  819 	inc	hl
   298B DD 7E 07      [19]  820 	ld	a,7 (ix)
   298E 77            [ 7]  821 	ld	(hl),a
                            822 ;src/entities/enemies.c:147: groups[k].enemy_type=type;
   298F 21 05 00      [10]  823 	ld	hl,#0x0005
   2992 09            [11]  824 	add	hl,bc
   2993 DD 7E 08      [19]  825 	ld	a,8 (ix)
   2996 77            [ 7]  826 	ld	(hl),a
                            827 ;src/entities/enemies.c:148: groups[k].num_enemies=num_enemies;
   2997 21 06 00      [10]  828 	ld	hl,#0x0006
   299A 09            [11]  829 	add	hl,bc
   299B DD 7E 09      [19]  830 	ld	a,9 (ix)
   299E 77            [ 7]  831 	ld	(hl),a
                            832 ;src/entities/enemies.c:149: groups[k].sleep=ENEMY_GAP;
   299F 21 07 00      [10]  833 	ld	hl,#0x0007
   29A2 09            [11]  834 	add	hl,bc
   29A3 36 03         [10]  835 	ld	(hl),#0x03
                            836 ;src/entities/enemies.c:150: active_groups++;
   29A5 21 FF 66      [10]  837 	ld	hl, #_active_groups+0
   29A8 34            [11]  838 	inc	(hl)
   29A9                     839 00106$:
   29A9 DD E1         [14]  840 	pop	ix
   29AB C9            [10]  841 	ret
                            842 ;src/entities/enemies.c:158: void update_enemies(){
                            843 ;	---------------------------------
                            844 ; Function update_enemies
                            845 ; ---------------------------------
   29AC                     846 _update_enemies::
   29AC DD E5         [15]  847 	push	ix
   29AE DD 21 00 00   [14]  848 	ld	ix,#0
   29B2 DD 39         [15]  849 	add	ix,sp
   29B4 21 EB FF      [10]  850 	ld	hl,#-21
   29B7 39            [11]  851 	add	hl,sp
   29B8 F9            [ 6]  852 	ld	sp,hl
                            853 ;src/entities/enemies.c:162: if (active_enemies>0){
   29B9 3A DE 66      [13]  854 	ld	a,(#_active_enemies + 0)
   29BC B7            [ 4]  855 	or	a, a
   29BD CA 74 2E      [10]  856 	jp	Z,00112$
                            857 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   29C0 DD 36 EB 00   [19]  858 	ld	-21 (ix),#0x00
   29C4 DD 36 FE 00   [19]  859 	ld	-2 (ix),#0x00
   29C8 DD 36 FF 00   [19]  860 	ld	-1 (ix),#0x00
   29CC DD 36 FC 00   [19]  861 	ld	-4 (ix),#0x00
   29D0 DD 36 FD 00   [19]  862 	ld	-3 (ix),#0x00
   29D4                     863 00124$:
                            864 ;src/entities/enemies.c:164: if (enemies[i].active){
   29D4 3E A6         [ 7]  865 	ld	a,#<(_enemies)
   29D6 DD 86 FC      [19]  866 	add	a, -4 (ix)
   29D9 DD 77 FA      [19]  867 	ld	-6 (ix),a
   29DC 3E 62         [ 7]  868 	ld	a,#>(_enemies)
   29DE DD 8E FD      [19]  869 	adc	a, -3 (ix)
   29E1 DD 77 FB      [19]  870 	ld	-5 (ix),a
   29E4 DD 4E FA      [19]  871 	ld	c,-6 (ix)
   29E7 DD 46 FB      [19]  872 	ld	b,-5 (ix)
   29EA C5            [11]  873 	push	bc
   29EB FD E1         [14]  874 	pop	iy
   29ED FD 7E 17      [19]  875 	ld	a,23 (iy)
   29F0 DD 77 F9      [19]  876 	ld	-7 (ix), a
   29F3 B7            [ 4]  877 	or	a, a
   29F4 CA 49 2E      [10]  878 	jp	Z,00125$
                            879 ;src/entities/enemies.c:165: if (enemies[i].movement<99){
   29F7 DD 7E FA      [19]  880 	ld	a,-6 (ix)
   29FA C6 1D         [ 7]  881 	add	a, #0x1D
   29FC DD 77 F7      [19]  882 	ld	-9 (ix),a
   29FF DD 7E FB      [19]  883 	ld	a,-5 (ix)
   2A02 CE 00         [ 7]  884 	adc	a, #0x00
   2A04 DD 77 F8      [19]  885 	ld	-8 (ix),a
   2A07 DD 6E F7      [19]  886 	ld	l,-9 (ix)
   2A0A DD 66 F8      [19]  887 	ld	h,-8 (ix)
   2A0D 56            [ 7]  888 	ld	d,(hl)
   2A0E 7A            [ 4]  889 	ld	a,d
   2A0F D6 63         [ 7]  890 	sub	a, #0x63
   2A11 D2 49 2E      [10]  891 	jp	NC,00125$
                            892 ;src/entities/enemies.c:166: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   2A14 DD 7E FA      [19]  893 	ld	a,-6 (ix)
   2A17 C6 1F         [ 7]  894 	add	a, #0x1F
   2A19 DD 77 F5      [19]  895 	ld	-11 (ix),a
   2A1C DD 7E FB      [19]  896 	ld	a,-5 (ix)
   2A1F CE 00         [ 7]  897 	adc	a, #0x00
   2A21 DD 77 F6      [19]  898 	ld	-10 (ix),a
   2A24 DD 6E F5      [19]  899 	ld	l,-11 (ix)
   2A27 DD 66 F6      [19]  900 	ld	h,-10 (ix)
   2A2A 5E            [ 7]  901 	ld	e,(hl)
   2A2B 4A            [ 4]  902 	ld	c,d
   2A2C 06 00         [ 7]  903 	ld	b,#0x00
   2A2E 69            [ 4]  904 	ld	l, c
   2A2F 60            [ 4]  905 	ld	h, b
   2A30 29            [11]  906 	add	hl, hl
   2A31 29            [11]  907 	add	hl, hl
   2A32 29            [11]  908 	add	hl, hl
   2A33 29            [11]  909 	add	hl, hl
   2A34 29            [11]  910 	add	hl, hl
   2A35 09            [11]  911 	add	hl, bc
   2A36 01 3C 35      [10]  912 	ld	bc,#_movements
   2A39 09            [11]  913 	add	hl,bc
   2A3A 23            [ 6]  914 	inc	hl
   2A3B 45            [ 4]  915 	ld	b,l
   2A3C 54            [ 4]  916 	ld	d,h
   2A3D DD 7E FA      [19]  917 	ld	a,-6 (ix)
   2A40 C6 1E         [ 7]  918 	add	a, #0x1E
   2A42 DD 77 F3      [19]  919 	ld	-13 (ix),a
   2A45 DD 7E FB      [19]  920 	ld	a,-5 (ix)
   2A48 CE 00         [ 7]  921 	adc	a, #0x00
   2A4A DD 77 F4      [19]  922 	ld	-12 (ix),a
   2A4D DD 6E F3      [19]  923 	ld	l,-13 (ix)
   2A50 DD 66 F4      [19]  924 	ld	h,-12 (ix)
   2A53 7E            [ 7]  925 	ld	a,(hl)
   2A54 DD 77 F9      [19]  926 	ld	-7 (ix), a
   2A57 87            [ 4]  927 	add	a, a
   2A58 87            [ 4]  928 	add	a, a
   2A59 80            [ 4]  929 	add	a,b
   2A5A DD 77 F1      [19]  930 	ld	-15 (ix),a
   2A5D 7A            [ 4]  931 	ld	a,d
   2A5E CE 00         [ 7]  932 	adc	a, #0x00
   2A60 DD 77 F2      [19]  933 	ld	-14 (ix),a
   2A63 DD 6E F1      [19]  934 	ld	l,-15 (ix)
   2A66 DD 66 F2      [19]  935 	ld	h,-14 (ix)
   2A69 23            [ 6]  936 	inc	hl
   2A6A 23            [ 6]  937 	inc	hl
   2A6B 23            [ 6]  938 	inc	hl
   2A6C 66            [ 7]  939 	ld	h,(hl)
   2A6D 7B            [ 4]  940 	ld	a,e
   2A6E 94            [ 4]  941 	sub	a, h
   2A6F D2 DF 2B      [10]  942 	jp	NC,00104$
                            943 ;src/entities/enemies.c:167: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2A72 DD 7E FA      [19]  944 	ld	a,-6 (ix)
   2A75 C6 16         [ 7]  945 	add	a, #0x16
   2A77 DD 77 EF      [19]  946 	ld	-17 (ix),a
   2A7A DD 7E FB      [19]  947 	ld	a,-5 (ix)
   2A7D CE 00         [ 7]  948 	adc	a, #0x00
   2A7F DD 77 F0      [19]  949 	ld	-16 (ix),a
   2A82 DD 6E F1      [19]  950 	ld	l,-15 (ix)
   2A85 DD 66 F2      [19]  951 	ld	h,-14 (ix)
   2A88 7E            [ 7]  952 	ld	a,(hl)
   2A89 DD 77 F1      [19]  953 	ld	-15 (ix),a
   2A8C DD 6E EF      [19]  954 	ld	l,-17 (ix)
   2A8F DD 66 F0      [19]  955 	ld	h,-16 (ix)
   2A92 DD 7E F1      [19]  956 	ld	a,-15 (ix)
   2A95 77            [ 7]  957 	ld	(hl),a
                            958 ;src/entities/enemies.c:168: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2A96 DD 7E FA      [19]  959 	ld	a,-6 (ix)
   2A99 C6 10         [ 7]  960 	add	a, #0x10
   2A9B DD 77 EF      [19]  961 	ld	-17 (ix),a
   2A9E DD 7E FB      [19]  962 	ld	a,-5 (ix)
   2AA1 CE 00         [ 7]  963 	adc	a, #0x00
   2AA3 DD 77 F0      [19]  964 	ld	-16 (ix),a
   2AA6 DD 6E EF      [19]  965 	ld	l,-17 (ix)
   2AA9 DD 66 F0      [19]  966 	ld	h,-16 (ix)
   2AAC 7E            [ 7]  967 	ld	a,(hl)
   2AAD DD 77 F1      [19]  968 	ld	-15 (ix),a
   2AB0 23            [ 6]  969 	inc	hl
   2AB1 7E            [ 7]  970 	ld	a,(hl)
   2AB2 DD 77 F2      [19]  971 	ld	-14 (ix),a
   2AB5 DD 6E F7      [19]  972 	ld	l,-9 (ix)
   2AB8 DD 66 F8      [19]  973 	ld	h,-8 (ix)
   2ABB 4E            [ 7]  974 	ld	c, (hl)
   2ABC 06 00         [ 7]  975 	ld	b,#0x00
   2ABE 69            [ 4]  976 	ld	l, c
   2ABF 60            [ 4]  977 	ld	h, b
   2AC0 29            [11]  978 	add	hl, hl
   2AC1 29            [11]  979 	add	hl, hl
   2AC2 29            [11]  980 	add	hl, hl
   2AC3 29            [11]  981 	add	hl, hl
   2AC4 29            [11]  982 	add	hl, hl
   2AC5 09            [11]  983 	add	hl, bc
   2AC6 3E 3C         [ 7]  984 	ld	a,#<(_movements)
   2AC8 85            [ 4]  985 	add	a, l
   2AC9 DD 77 ED      [19]  986 	ld	-19 (ix),a
   2ACC 3E 35         [ 7]  987 	ld	a,#>(_movements)
   2ACE 8C            [ 4]  988 	adc	a, h
   2ACF DD 77 EE      [19]  989 	ld	-18 (ix),a
   2AD2 DD 34 ED      [23]  990 	inc	-19 (ix)
   2AD5 20 03         [12]  991 	jr	NZ,00176$
   2AD7 DD 34 EE      [23]  992 	inc	-18 (ix)
   2ADA                     993 00176$:
   2ADA DD 6E F3      [19]  994 	ld	l,-13 (ix)
   2ADD DD 66 F4      [19]  995 	ld	h,-12 (ix)
   2AE0 7E            [ 7]  996 	ld	a,(hl)
   2AE1 DD 77 EC      [19]  997 	ld	-20 (ix), a
   2AE4 87            [ 4]  998 	add	a, a
   2AE5 87            [ 4]  999 	add	a, a
   2AE6 67            [ 4] 1000 	ld	h,a
   2AE7 DD 7E ED      [19] 1001 	ld	a,-19 (ix)
   2AEA 84            [ 4] 1002 	add	a, h
   2AEB DD 77 ED      [19] 1003 	ld	-19 (ix),a
   2AEE DD 7E EE      [19] 1004 	ld	a,-18 (ix)
   2AF1 CE 00         [ 7] 1005 	adc	a, #0x00
   2AF3 DD 77 EE      [19] 1006 	ld	-18 (ix),a
   2AF6 DD 6E ED      [19] 1007 	ld	l,-19 (ix)
   2AF9 DD 66 EE      [19] 1008 	ld	h,-18 (ix)
   2AFC 23            [ 6] 1009 	inc	hl
   2AFD 7E            [ 7] 1010 	ld	a,(hl)
   2AFE DD 77 EC      [19] 1011 	ld	-20 (ix), a
   2B01 DD 77 ED      [19] 1012 	ld	-19 (ix),a
   2B04 DD 7E EC      [19] 1013 	ld	a,-20 (ix)
   2B07 17            [ 4] 1014 	rla
   2B08 9F            [ 4] 1015 	sbc	a, a
   2B09 DD 77 EE      [19] 1016 	ld	-18 (ix),a
   2B0C DD 7E F1      [19] 1017 	ld	a,-15 (ix)
   2B0F DD 86 ED      [19] 1018 	add	a, -19 (ix)
   2B12 DD 77 ED      [19] 1019 	ld	-19 (ix),a
   2B15 DD 7E F2      [19] 1020 	ld	a,-14 (ix)
   2B18 DD 8E EE      [19] 1021 	adc	a, -18 (ix)
   2B1B DD 77 EE      [19] 1022 	ld	-18 (ix),a
   2B1E DD 6E EF      [19] 1023 	ld	l,-17 (ix)
   2B21 DD 66 F0      [19] 1024 	ld	h,-16 (ix)
   2B24 DD 7E ED      [19] 1025 	ld	a,-19 (ix)
   2B27 77            [ 7] 1026 	ld	(hl),a
   2B28 23            [ 6] 1027 	inc	hl
   2B29 DD 7E EE      [19] 1028 	ld	a,-18 (ix)
   2B2C 77            [ 7] 1029 	ld	(hl),a
                           1030 ;src/entities/enemies.c:169: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2B2D DD 7E FA      [19] 1031 	ld	a,-6 (ix)
   2B30 C6 12         [ 7] 1032 	add	a, #0x12
   2B32 DD 77 ED      [19] 1033 	ld	-19 (ix),a
   2B35 DD 7E FB      [19] 1034 	ld	a,-5 (ix)
   2B38 CE 00         [ 7] 1035 	adc	a, #0x00
   2B3A DD 77 EE      [19] 1036 	ld	-18 (ix),a
   2B3D DD 6E ED      [19] 1037 	ld	l,-19 (ix)
   2B40 DD 66 EE      [19] 1038 	ld	h,-18 (ix)
   2B43 7E            [ 7] 1039 	ld	a,(hl)
   2B44 DD 77 EF      [19] 1040 	ld	-17 (ix),a
   2B47 23            [ 6] 1041 	inc	hl
   2B48 7E            [ 7] 1042 	ld	a,(hl)
   2B49 DD 77 F0      [19] 1043 	ld	-16 (ix),a
   2B4C DD 6E F7      [19] 1044 	ld	l,-9 (ix)
   2B4F DD 66 F8      [19] 1045 	ld	h,-8 (ix)
   2B52 4E            [ 7] 1046 	ld	c, (hl)
   2B53 06 00         [ 7] 1047 	ld	b,#0x00
   2B55 69            [ 4] 1048 	ld	l, c
   2B56 60            [ 4] 1049 	ld	h, b
   2B57 29            [11] 1050 	add	hl, hl
   2B58 29            [11] 1051 	add	hl, hl
   2B59 29            [11] 1052 	add	hl, hl
   2B5A 29            [11] 1053 	add	hl, hl
   2B5B 29            [11] 1054 	add	hl, hl
   2B5C 09            [11] 1055 	add	hl, bc
   2B5D 3E 3C         [ 7] 1056 	ld	a,#<(_movements)
   2B5F 85            [ 4] 1057 	add	a, l
   2B60 DD 77 F1      [19] 1058 	ld	-15 (ix),a
   2B63 3E 35         [ 7] 1059 	ld	a,#>(_movements)
   2B65 8C            [ 4] 1060 	adc	a, h
   2B66 DD 77 F2      [19] 1061 	ld	-14 (ix),a
   2B69 DD 34 F1      [23] 1062 	inc	-15 (ix)
   2B6C 20 03         [12] 1063 	jr	NZ,00177$
   2B6E DD 34 F2      [23] 1064 	inc	-14 (ix)
   2B71                    1065 00177$:
   2B71 DD 6E F3      [19] 1066 	ld	l,-13 (ix)
   2B74 DD 66 F4      [19] 1067 	ld	h,-12 (ix)
   2B77 7E            [ 7] 1068 	ld	a,(hl)
   2B78 DD 77 EC      [19] 1069 	ld	-20 (ix), a
   2B7B 87            [ 4] 1070 	add	a, a
   2B7C 87            [ 4] 1071 	add	a, a
   2B7D 67            [ 4] 1072 	ld	h,a
   2B7E DD 7E F1      [19] 1073 	ld	a,-15 (ix)
   2B81 84            [ 4] 1074 	add	a, h
   2B82 DD 77 F1      [19] 1075 	ld	-15 (ix),a
   2B85 DD 7E F2      [19] 1076 	ld	a,-14 (ix)
   2B88 CE 00         [ 7] 1077 	adc	a, #0x00
   2B8A DD 77 F2      [19] 1078 	ld	-14 (ix),a
   2B8D DD 6E F1      [19] 1079 	ld	l,-15 (ix)
   2B90 DD 66 F2      [19] 1080 	ld	h,-14 (ix)
   2B93 23            [ 6] 1081 	inc	hl
   2B94 23            [ 6] 1082 	inc	hl
   2B95 7E            [ 7] 1083 	ld	a,(hl)
   2B96 DD 77 EC      [19] 1084 	ld	-20 (ix), a
   2B99 DD 77 F1      [19] 1085 	ld	-15 (ix),a
   2B9C DD 7E EC      [19] 1086 	ld	a,-20 (ix)
   2B9F 17            [ 4] 1087 	rla
   2BA0 9F            [ 4] 1088 	sbc	a, a
   2BA1 DD 77 F2      [19] 1089 	ld	-14 (ix),a
   2BA4 DD 7E EF      [19] 1090 	ld	a,-17 (ix)
   2BA7 DD 86 F1      [19] 1091 	add	a, -15 (ix)
   2BAA DD 77 EF      [19] 1092 	ld	-17 (ix),a
   2BAD DD 7E F0      [19] 1093 	ld	a,-16 (ix)
   2BB0 DD 8E F2      [19] 1094 	adc	a, -14 (ix)
   2BB3 DD 77 F0      [19] 1095 	ld	-16 (ix),a
   2BB6 DD 6E ED      [19] 1096 	ld	l,-19 (ix)
   2BB9 DD 66 EE      [19] 1097 	ld	h,-18 (ix)
   2BBC DD 7E EF      [19] 1098 	ld	a,-17 (ix)
   2BBF 77            [ 7] 1099 	ld	(hl),a
   2BC0 23            [ 6] 1100 	inc	hl
   2BC1 DD 7E F0      [19] 1101 	ld	a,-16 (ix)
   2BC4 77            [ 7] 1102 	ld	(hl),a
                           1103 ;src/entities/enemies.c:170: enemies[i].stage_step++;
   2BC5 DD 6E F5      [19] 1104 	ld	l,-11 (ix)
   2BC8 DD 66 F6      [19] 1105 	ld	h,-10 (ix)
   2BCB 7E            [ 7] 1106 	ld	a,(hl)
   2BCC DD 77 EC      [19] 1107 	ld	-20 (ix),a
   2BCF DD 34 EC      [23] 1108 	inc	-20 (ix)
   2BD2 DD 6E F5      [19] 1109 	ld	l,-11 (ix)
   2BD5 DD 66 F6      [19] 1110 	ld	h,-10 (ix)
   2BD8 DD 7E EC      [19] 1111 	ld	a,-20 (ix)
   2BDB 77            [ 7] 1112 	ld	(hl),a
   2BDC C3 49 2E      [10] 1113 	jp	00125$
   2BDF                    1114 00104$:
                           1115 ;src/entities/enemies.c:172: enemies[i].stage++;
   2BDF DD 7E F9      [19] 1116 	ld	a,-7 (ix)
   2BE2 3C            [ 4] 1117 	inc	a
   2BE3 DD 77 EC      [19] 1118 	ld	-20 (ix),a
   2BE6 DD 6E F3      [19] 1119 	ld	l,-13 (ix)
   2BE9 DD 66 F4      [19] 1120 	ld	h,-12 (ix)
   2BEC DD 7E EC      [19] 1121 	ld	a,-20 (ix)
   2BEF 77            [ 7] 1122 	ld	(hl),a
                           1123 ;src/entities/enemies.c:173: enemies[i].stage_step=0;
   2BF0 DD 6E F5      [19] 1124 	ld	l,-11 (ix)
   2BF3 DD 66 F6      [19] 1125 	ld	h,-10 (ix)
   2BF6 36 00         [10] 1126 	ld	(hl),#0x00
                           1127 ;src/entities/enemies.c:174: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   2BF8 DD 6E F7      [19] 1128 	ld	l,-9 (ix)
   2BFB DD 66 F8      [19] 1129 	ld	h,-8 (ix)
   2BFE 7E            [ 7] 1130 	ld	a,(hl)
   2BFF DD 77 ED      [19] 1131 	ld	-19 (ix), a
   2C02 4F            [ 4] 1132 	ld	c, a
   2C03 06 00         [ 7] 1133 	ld	b,#0x00
   2C05 69            [ 4] 1134 	ld	l, c
   2C06 60            [ 4] 1135 	ld	h, b
   2C07 29            [11] 1136 	add	hl, hl
   2C08 29            [11] 1137 	add	hl, hl
   2C09 29            [11] 1138 	add	hl, hl
   2C0A 29            [11] 1139 	add	hl, hl
   2C0B 29            [11] 1140 	add	hl, hl
   2C0C 09            [11] 1141 	add	hl, bc
   2C0D DD 75 ED      [19] 1142 	ld	-19 (ix),l
   2C10 DD 74 EE      [19] 1143 	ld	-18 (ix),h
   2C13 3E 3C         [ 7] 1144 	ld	a,#<(_movements)
   2C15 DD 86 ED      [19] 1145 	add	a, -19 (ix)
   2C18 DD 77 ED      [19] 1146 	ld	-19 (ix),a
   2C1B 3E 35         [ 7] 1147 	ld	a,#>(_movements)
   2C1D DD 8E EE      [19] 1148 	adc	a, -18 (ix)
   2C20 DD 77 EE      [19] 1149 	ld	-18 (ix),a
   2C23 DD 6E ED      [19] 1150 	ld	l,-19 (ix)
   2C26 DD 66 EE      [19] 1151 	ld	h,-18 (ix)
   2C29 7E            [ 7] 1152 	ld	a,(hl)
   2C2A DD 77 ED      [19] 1153 	ld	-19 (ix),a
   2C2D DD 7E EC      [19] 1154 	ld	a,-20 (ix)
   2C30 DD 96 ED      [19] 1155 	sub	a, -19 (ix)
   2C33 38 08         [12] 1156 	jr	C,00102$
                           1157 ;src/entities/enemies.c:175: enemies[i].stage=0;
   2C35 DD 6E F3      [19] 1158 	ld	l,-13 (ix)
   2C38 DD 66 F4      [19] 1159 	ld	h,-12 (ix)
   2C3B 36 00         [10] 1160 	ld	(hl),#0x00
   2C3D                    1161 00102$:
                           1162 ;src/entities/enemies.c:177: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2C3D 3E A6         [ 7] 1163 	ld	a,#<(_enemies)
   2C3F DD 86 FE      [19] 1164 	add	a, -2 (ix)
   2C42 DD 77 ED      [19] 1165 	ld	-19 (ix),a
   2C45 3E 62         [ 7] 1166 	ld	a,#>(_enemies)
   2C47 DD 8E FF      [19] 1167 	adc	a, -1 (ix)
   2C4A DD 77 EE      [19] 1168 	ld	-18 (ix),a
   2C4D DD 7E ED      [19] 1169 	ld	a,-19 (ix)
   2C50 C6 16         [ 7] 1170 	add	a, #0x16
   2C52 DD 77 EF      [19] 1171 	ld	-17 (ix),a
   2C55 DD 7E EE      [19] 1172 	ld	a,-18 (ix)
   2C58 CE 00         [ 7] 1173 	adc	a, #0x00
   2C5A DD 77 F0      [19] 1174 	ld	-16 (ix),a
   2C5D DD 7E ED      [19] 1175 	ld	a,-19 (ix)
   2C60 C6 1D         [ 7] 1176 	add	a, #0x1D
   2C62 DD 77 F1      [19] 1177 	ld	-15 (ix),a
   2C65 DD 7E EE      [19] 1178 	ld	a,-18 (ix)
   2C68 CE 00         [ 7] 1179 	adc	a, #0x00
   2C6A DD 77 F2      [19] 1180 	ld	-14 (ix),a
   2C6D DD 6E F1      [19] 1181 	ld	l,-15 (ix)
   2C70 DD 66 F2      [19] 1182 	ld	h,-14 (ix)
   2C73 4E            [ 7] 1183 	ld	c, (hl)
   2C74 06 00         [ 7] 1184 	ld	b,#0x00
   2C76 69            [ 4] 1185 	ld	l, c
   2C77 60            [ 4] 1186 	ld	h, b
   2C78 29            [11] 1187 	add	hl, hl
   2C79 29            [11] 1188 	add	hl, hl
   2C7A 29            [11] 1189 	add	hl, hl
   2C7B 29            [11] 1190 	add	hl, hl
   2C7C 29            [11] 1191 	add	hl, hl
   2C7D 09            [11] 1192 	add	hl, bc
   2C7E DD 75 F3      [19] 1193 	ld	-13 (ix),l
   2C81 DD 74 F4      [19] 1194 	ld	-12 (ix),h
   2C84 3E 3C         [ 7] 1195 	ld	a,#<(_movements)
   2C86 DD 86 F3      [19] 1196 	add	a, -13 (ix)
   2C89 DD 77 F3      [19] 1197 	ld	-13 (ix),a
   2C8C 3E 35         [ 7] 1198 	ld	a,#>(_movements)
   2C8E DD 8E F4      [19] 1199 	adc	a, -12 (ix)
   2C91 DD 77 F4      [19] 1200 	ld	-12 (ix),a
   2C94 DD 34 F3      [23] 1201 	inc	-13 (ix)
   2C97 20 03         [12] 1202 	jr	NZ,00178$
   2C99 DD 34 F4      [23] 1203 	inc	-12 (ix)
   2C9C                    1204 00178$:
   2C9C DD 7E ED      [19] 1205 	ld	a,-19 (ix)
   2C9F C6 1E         [ 7] 1206 	add	a, #0x1E
   2CA1 DD 77 F5      [19] 1207 	ld	-11 (ix),a
   2CA4 DD 7E EE      [19] 1208 	ld	a,-18 (ix)
   2CA7 CE 00         [ 7] 1209 	adc	a, #0x00
   2CA9 DD 77 F6      [19] 1210 	ld	-10 (ix),a
   2CAC DD 6E F5      [19] 1211 	ld	l,-11 (ix)
   2CAF DD 66 F6      [19] 1212 	ld	h,-10 (ix)
   2CB2 7E            [ 7] 1213 	ld	a,(hl)
   2CB3 87            [ 4] 1214 	add	a, a
   2CB4 87            [ 4] 1215 	add	a, a
   2CB5 67            [ 4] 1216 	ld	h,a
   2CB6 DD 7E F3      [19] 1217 	ld	a,-13 (ix)
   2CB9 84            [ 4] 1218 	add	a, h
   2CBA DD 77 F3      [19] 1219 	ld	-13 (ix),a
   2CBD DD 7E F4      [19] 1220 	ld	a,-12 (ix)
   2CC0 CE 00         [ 7] 1221 	adc	a, #0x00
   2CC2 DD 77 F4      [19] 1222 	ld	-12 (ix),a
   2CC5 DD 6E F3      [19] 1223 	ld	l,-13 (ix)
   2CC8 DD 66 F4      [19] 1224 	ld	h,-12 (ix)
   2CCB 7E            [ 7] 1225 	ld	a,(hl)
   2CCC DD 77 EC      [19] 1226 	ld	-20 (ix),a
   2CCF DD 6E EF      [19] 1227 	ld	l,-17 (ix)
   2CD2 DD 66 F0      [19] 1228 	ld	h,-16 (ix)
   2CD5 DD 7E EC      [19] 1229 	ld	a,-20 (ix)
   2CD8 77            [ 7] 1230 	ld	(hl),a
                           1231 ;src/entities/enemies.c:178: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2CD9 DD 7E ED      [19] 1232 	ld	a,-19 (ix)
   2CDC C6 10         [ 7] 1233 	add	a, #0x10
   2CDE DD 77 EF      [19] 1234 	ld	-17 (ix),a
   2CE1 DD 7E EE      [19] 1235 	ld	a,-18 (ix)
   2CE4 CE 00         [ 7] 1236 	adc	a, #0x00
   2CE6 DD 77 F0      [19] 1237 	ld	-16 (ix),a
   2CE9 DD 6E EF      [19] 1238 	ld	l,-17 (ix)
   2CEC DD 66 F0      [19] 1239 	ld	h,-16 (ix)
   2CEF 7E            [ 7] 1240 	ld	a,(hl)
   2CF0 DD 77 F3      [19] 1241 	ld	-13 (ix),a
   2CF3 23            [ 6] 1242 	inc	hl
   2CF4 7E            [ 7] 1243 	ld	a,(hl)
   2CF5 DD 77 F4      [19] 1244 	ld	-12 (ix),a
   2CF8 DD 6E F1      [19] 1245 	ld	l,-15 (ix)
   2CFB DD 66 F2      [19] 1246 	ld	h,-14 (ix)
   2CFE 4E            [ 7] 1247 	ld	c, (hl)
   2CFF 06 00         [ 7] 1248 	ld	b,#0x00
   2D01 69            [ 4] 1249 	ld	l, c
   2D02 60            [ 4] 1250 	ld	h, b
   2D03 29            [11] 1251 	add	hl, hl
   2D04 29            [11] 1252 	add	hl, hl
   2D05 29            [11] 1253 	add	hl, hl
   2D06 29            [11] 1254 	add	hl, hl
   2D07 29            [11] 1255 	add	hl, hl
   2D08 09            [11] 1256 	add	hl, bc
   2D09 DD 75 F7      [19] 1257 	ld	-9 (ix),l
   2D0C DD 74 F8      [19] 1258 	ld	-8 (ix),h
   2D0F 3E 3C         [ 7] 1259 	ld	a,#<(_movements)
   2D11 DD 86 F7      [19] 1260 	add	a, -9 (ix)
   2D14 DD 77 F7      [19] 1261 	ld	-9 (ix),a
   2D17 3E 35         [ 7] 1262 	ld	a,#>(_movements)
   2D19 DD 8E F8      [19] 1263 	adc	a, -8 (ix)
   2D1C DD 77 F8      [19] 1264 	ld	-8 (ix),a
   2D1F DD 34 F7      [23] 1265 	inc	-9 (ix)
   2D22 20 03         [12] 1266 	jr	NZ,00179$
   2D24 DD 34 F8      [23] 1267 	inc	-8 (ix)
   2D27                    1268 00179$:
   2D27 DD 6E F5      [19] 1269 	ld	l,-11 (ix)
   2D2A DD 66 F6      [19] 1270 	ld	h,-10 (ix)
   2D2D 7E            [ 7] 1271 	ld	a,(hl)
   2D2E DD 77 EC      [19] 1272 	ld	-20 (ix), a
   2D31 87            [ 4] 1273 	add	a, a
   2D32 87            [ 4] 1274 	add	a, a
   2D33 67            [ 4] 1275 	ld	h,a
   2D34 DD 7E F7      [19] 1276 	ld	a,-9 (ix)
   2D37 84            [ 4] 1277 	add	a, h
   2D38 DD 77 F7      [19] 1278 	ld	-9 (ix),a
   2D3B DD 7E F8      [19] 1279 	ld	a,-8 (ix)
   2D3E CE 00         [ 7] 1280 	adc	a, #0x00
   2D40 DD 77 F8      [19] 1281 	ld	-8 (ix),a
   2D43 DD 6E F7      [19] 1282 	ld	l,-9 (ix)
   2D46 DD 66 F8      [19] 1283 	ld	h,-8 (ix)
   2D49 23            [ 6] 1284 	inc	hl
   2D4A 7E            [ 7] 1285 	ld	a,(hl)
   2D4B DD 77 EC      [19] 1286 	ld	-20 (ix), a
   2D4E DD 77 F7      [19] 1287 	ld	-9 (ix),a
   2D51 DD 7E EC      [19] 1288 	ld	a,-20 (ix)
   2D54 17            [ 4] 1289 	rla
   2D55 9F            [ 4] 1290 	sbc	a, a
   2D56 DD 77 F8      [19] 1291 	ld	-8 (ix),a
   2D59 DD 7E F3      [19] 1292 	ld	a,-13 (ix)
   2D5C DD 86 F7      [19] 1293 	add	a, -9 (ix)
   2D5F DD 77 F3      [19] 1294 	ld	-13 (ix),a
   2D62 DD 7E F4      [19] 1295 	ld	a,-12 (ix)
   2D65 DD 8E F8      [19] 1296 	adc	a, -8 (ix)
   2D68 DD 77 F4      [19] 1297 	ld	-12 (ix),a
   2D6B DD 6E EF      [19] 1298 	ld	l,-17 (ix)
   2D6E DD 66 F0      [19] 1299 	ld	h,-16 (ix)
   2D71 DD 7E F3      [19] 1300 	ld	a,-13 (ix)
   2D74 77            [ 7] 1301 	ld	(hl),a
   2D75 23            [ 6] 1302 	inc	hl
   2D76 DD 7E F4      [19] 1303 	ld	a,-12 (ix)
   2D79 77            [ 7] 1304 	ld	(hl),a
                           1305 ;src/entities/enemies.c:179: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2D7A DD 7E ED      [19] 1306 	ld	a,-19 (ix)
   2D7D C6 12         [ 7] 1307 	add	a, #0x12
   2D7F DD 77 EF      [19] 1308 	ld	-17 (ix),a
   2D82 DD 7E EE      [19] 1309 	ld	a,-18 (ix)
   2D85 CE 00         [ 7] 1310 	adc	a, #0x00
   2D87 DD 77 F0      [19] 1311 	ld	-16 (ix),a
   2D8A DD 6E EF      [19] 1312 	ld	l,-17 (ix)
   2D8D DD 66 F0      [19] 1313 	ld	h,-16 (ix)
   2D90 7E            [ 7] 1314 	ld	a,(hl)
   2D91 DD 77 F3      [19] 1315 	ld	-13 (ix),a
   2D94 23            [ 6] 1316 	inc	hl
   2D95 7E            [ 7] 1317 	ld	a,(hl)
   2D96 DD 77 F4      [19] 1318 	ld	-12 (ix),a
   2D99 DD 6E F1      [19] 1319 	ld	l,-15 (ix)
   2D9C DD 66 F2      [19] 1320 	ld	h,-14 (ix)
   2D9F 7E            [ 7] 1321 	ld	a,(hl)
   2DA0 DD 77 EC      [19] 1322 	ld	-20 (ix), a
   2DA3 4F            [ 4] 1323 	ld	c, a
   2DA4 06 00         [ 7] 1324 	ld	b,#0x00
   2DA6 69            [ 4] 1325 	ld	l, c
   2DA7 60            [ 4] 1326 	ld	h, b
   2DA8 29            [11] 1327 	add	hl, hl
   2DA9 29            [11] 1328 	add	hl, hl
   2DAA 29            [11] 1329 	add	hl, hl
   2DAB 29            [11] 1330 	add	hl, hl
   2DAC 29            [11] 1331 	add	hl, hl
   2DAD 09            [11] 1332 	add	hl, bc
   2DAE DD 75 F1      [19] 1333 	ld	-15 (ix),l
   2DB1 DD 74 F2      [19] 1334 	ld	-14 (ix),h
   2DB4 3E 3C         [ 7] 1335 	ld	a,#<(_movements)
   2DB6 DD 86 F1      [19] 1336 	add	a, -15 (ix)
   2DB9 DD 77 F1      [19] 1337 	ld	-15 (ix),a
   2DBC 3E 35         [ 7] 1338 	ld	a,#>(_movements)
   2DBE DD 8E F2      [19] 1339 	adc	a, -14 (ix)
   2DC1 DD 77 F2      [19] 1340 	ld	-14 (ix),a
   2DC4 DD 34 F1      [23] 1341 	inc	-15 (ix)
   2DC7 20 03         [12] 1342 	jr	NZ,00180$
   2DC9 DD 34 F2      [23] 1343 	inc	-14 (ix)
   2DCC                    1344 00180$:
   2DCC DD 6E F5      [19] 1345 	ld	l,-11 (ix)
   2DCF DD 66 F6      [19] 1346 	ld	h,-10 (ix)
   2DD2 7E            [ 7] 1347 	ld	a,(hl)
   2DD3 DD 77 EC      [19] 1348 	ld	-20 (ix),a
   2DD6 DD CB EC 26   [23] 1349 	sla	-20 (ix)
   2DDA DD CB EC 26   [23] 1350 	sla	-20 (ix)
   2DDE DD 7E F1      [19] 1351 	ld	a,-15 (ix)
   2DE1 DD 86 EC      [19] 1352 	add	a, -20 (ix)
   2DE4 DD 77 F1      [19] 1353 	ld	-15 (ix),a
   2DE7 DD 7E F2      [19] 1354 	ld	a,-14 (ix)
   2DEA CE 00         [ 7] 1355 	adc	a, #0x00
   2DEC DD 77 F2      [19] 1356 	ld	-14 (ix),a
   2DEF DD 6E F1      [19] 1357 	ld	l,-15 (ix)
   2DF2 DD 66 F2      [19] 1358 	ld	h,-14 (ix)
   2DF5 23            [ 6] 1359 	inc	hl
   2DF6 23            [ 6] 1360 	inc	hl
   2DF7 7E            [ 7] 1361 	ld	a,(hl)
   2DF8 DD 77 EC      [19] 1362 	ld	-20 (ix), a
   2DFB DD 77 F1      [19] 1363 	ld	-15 (ix),a
   2DFE DD 7E EC      [19] 1364 	ld	a,-20 (ix)
   2E01 17            [ 4] 1365 	rla
   2E02 9F            [ 4] 1366 	sbc	a, a
   2E03 DD 77 F2      [19] 1367 	ld	-14 (ix),a
   2E06 DD 7E F3      [19] 1368 	ld	a,-13 (ix)
   2E09 DD 86 F1      [19] 1369 	add	a, -15 (ix)
   2E0C DD 77 F1      [19] 1370 	ld	-15 (ix),a
   2E0F DD 7E F4      [19] 1371 	ld	a,-12 (ix)
   2E12 DD 8E F2      [19] 1372 	adc	a, -14 (ix)
   2E15 DD 77 F2      [19] 1373 	ld	-14 (ix),a
   2E18 DD 6E EF      [19] 1374 	ld	l,-17 (ix)
   2E1B DD 66 F0      [19] 1375 	ld	h,-16 (ix)
   2E1E DD 7E F1      [19] 1376 	ld	a,-15 (ix)
   2E21 77            [ 7] 1377 	ld	(hl),a
   2E22 23            [ 6] 1378 	inc	hl
   2E23 DD 7E F2      [19] 1379 	ld	a,-14 (ix)
   2E26 77            [ 7] 1380 	ld	(hl),a
                           1381 ;src/entities/enemies.c:180: enemies[i].stage_step++;
   2E27 DD 7E ED      [19] 1382 	ld	a,-19 (ix)
   2E2A C6 1F         [ 7] 1383 	add	a, #0x1F
   2E2C DD 77 ED      [19] 1384 	ld	-19 (ix),a
   2E2F DD 7E EE      [19] 1385 	ld	a,-18 (ix)
   2E32 CE 00         [ 7] 1386 	adc	a, #0x00
   2E34 DD 77 EE      [19] 1387 	ld	-18 (ix),a
   2E37 DD 6E ED      [19] 1388 	ld	l,-19 (ix)
   2E3A DD 66 EE      [19] 1389 	ld	h,-18 (ix)
   2E3D 7E            [ 7] 1390 	ld	a,(hl)
   2E3E DD 77 EC      [19] 1391 	ld	-20 (ix), a
   2E41 3C            [ 4] 1392 	inc	a
   2E42 DD 6E ED      [19] 1393 	ld	l,-19 (ix)
   2E45 DD 66 EE      [19] 1394 	ld	h,-18 (ix)
   2E48 77            [ 7] 1395 	ld	(hl),a
   2E49                    1396 00125$:
                           1397 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   2E49 DD 7E FE      [19] 1398 	ld	a,-2 (ix)
   2E4C C6 24         [ 7] 1399 	add	a, #0x24
   2E4E DD 77 FE      [19] 1400 	ld	-2 (ix),a
   2E51 DD 7E FF      [19] 1401 	ld	a,-1 (ix)
   2E54 CE 00         [ 7] 1402 	adc	a, #0x00
   2E56 DD 77 FF      [19] 1403 	ld	-1 (ix),a
   2E59 DD 7E FC      [19] 1404 	ld	a,-4 (ix)
   2E5C C6 24         [ 7] 1405 	add	a, #0x24
   2E5E DD 77 FC      [19] 1406 	ld	-4 (ix),a
   2E61 DD 7E FD      [19] 1407 	ld	a,-3 (ix)
   2E64 CE 00         [ 7] 1408 	adc	a, #0x00
   2E66 DD 77 FD      [19] 1409 	ld	-3 (ix),a
   2E69 DD 34 EB      [23] 1410 	inc	-21 (ix)
   2E6C DD 7E EB      [19] 1411 	ld	a,-21 (ix)
   2E6F D6 1E         [ 7] 1412 	sub	a, #0x1E
   2E71 DA D4 29      [10] 1413 	jp	C,00124$
   2E74                    1414 00112$:
                           1415 ;src/entities/enemies.c:188: if (active_groups>0){
   2E74 3A FF 66      [13] 1416 	ld	a,(#_active_groups + 0)
   2E77 B7            [ 4] 1417 	or	a, a
   2E78 CA F5 2E      [10] 1418 	jp	Z,00128$
                           1419 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2E7B DD 36 EB 00   [19] 1420 	ld	-21 (ix),#0x00
   2E7F                    1421 00126$:
                           1422 ;src/entities/enemies.c:191: if (groups[i].active){
   2E7F DD 6E EB      [19] 1423 	ld	l,-21 (ix)
   2E82 26 00         [ 7] 1424 	ld	h,#0x00
   2E84 29            [11] 1425 	add	hl, hl
   2E85 29            [11] 1426 	add	hl, hl
   2E86 29            [11] 1427 	add	hl, hl
   2E87 3E DF         [ 7] 1428 	ld	a,#<(_groups)
   2E89 85            [ 4] 1429 	add	a, l
   2E8A 5F            [ 4] 1430 	ld	e,a
   2E8B 3E 66         [ 7] 1431 	ld	a,#>(_groups)
   2E8D 8C            [ 4] 1432 	adc	a, h
   2E8E 57            [ 4] 1433 	ld	d,a
   2E8F 1A            [ 7] 1434 	ld	a,(de)
   2E90 B7            [ 4] 1435 	or	a, a
   2E91 28 58         [12] 1436 	jr	Z,00127$
                           1437 ;src/entities/enemies.c:192: if (groups[i].sleep==0){
   2E93 21 07 00      [10] 1438 	ld	hl,#0x0007
   2E96 19            [11] 1439 	add	hl,de
   2E97 7E            [ 7] 1440 	ld	a,(hl)
   2E98 B7            [ 4] 1441 	or	a, a
   2E99 20 4D         [12] 1442 	jr	NZ,00117$
                           1443 ;src/entities/enemies.c:193: groups[i].sleep=ENEMY_GAP;
   2E9B 36 03         [10] 1444 	ld	(hl),#0x03
                           1445 ;src/entities/enemies.c:194: if (groups[i].num_enemies==0){
   2E9D 21 06 00      [10] 1446 	ld	hl,#0x0006
   2EA0 19            [11] 1447 	add	hl,de
   2EA1 4D            [ 4] 1448 	ld	c,l
   2EA2 44            [ 4] 1449 	ld	b,h
   2EA3 0A            [ 7] 1450 	ld	a,(bc)
   2EA4 B7            [ 4] 1451 	or	a, a
   2EA5 20 08         [12] 1452 	jr	NZ,00114$
                           1453 ;src/entities/enemies.c:195: groups[i].active=0;
   2EA7 AF            [ 4] 1454 	xor	a, a
   2EA8 12            [ 7] 1455 	ld	(de),a
                           1456 ;src/entities/enemies.c:196: active_groups--;
   2EA9 21 FF 66      [10] 1457 	ld	hl, #_active_groups+0
   2EAC 35            [11] 1458 	dec	(hl)
   2EAD 18 3C         [12] 1459 	jr	00127$
   2EAF                    1460 00114$:
                           1461 ;src/entities/enemies.c:198: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2EAF 6B            [ 4] 1462 	ld	l, e
   2EB0 62            [ 4] 1463 	ld	h, d
   2EB1 23            [ 6] 1464 	inc	hl
   2EB2 23            [ 6] 1465 	inc	hl
   2EB3 23            [ 6] 1466 	inc	hl
   2EB4 23            [ 6] 1467 	inc	hl
   2EB5 23            [ 6] 1468 	inc	hl
   2EB6 7E            [ 7] 1469 	ld	a,(hl)
   2EB7 DD 77 EC      [19] 1470 	ld	-20 (ix),a
   2EBA 6B            [ 4] 1471 	ld	l, e
   2EBB 62            [ 4] 1472 	ld	h, d
   2EBC 23            [ 6] 1473 	inc	hl
   2EBD 23            [ 6] 1474 	inc	hl
   2EBE 23            [ 6] 1475 	inc	hl
   2EBF 7E            [ 7] 1476 	ld	a,(hl)
   2EC0 DD 77 ED      [19] 1477 	ld	-19 (ix),a
   2EC3 23            [ 6] 1478 	inc	hl
   2EC4 7E            [ 7] 1479 	ld	a,(hl)
   2EC5 DD 77 EE      [19] 1480 	ld	-18 (ix),a
   2EC8 EB            [ 4] 1481 	ex	de,hl
   2EC9 23            [ 6] 1482 	inc	hl
   2ECA 5E            [ 7] 1483 	ld	e,(hl)
   2ECB 23            [ 6] 1484 	inc	hl
   2ECC 56            [ 7] 1485 	ld	d,(hl)
   2ECD C5            [11] 1486 	push	bc
   2ECE DD 7E EC      [19] 1487 	ld	a,-20 (ix)
   2ED1 F5            [11] 1488 	push	af
   2ED2 33            [ 6] 1489 	inc	sp
   2ED3 DD 6E ED      [19] 1490 	ld	l,-19 (ix)
   2ED6 DD 66 EE      [19] 1491 	ld	h,-18 (ix)
   2ED9 E5            [11] 1492 	push	hl
   2EDA D5            [11] 1493 	push	de
   2EDB CD 0D 26      [17] 1494 	call	_create_enemy
   2EDE F1            [10] 1495 	pop	af
   2EDF F1            [10] 1496 	pop	af
   2EE0 33            [ 6] 1497 	inc	sp
   2EE1 C1            [10] 1498 	pop	bc
                           1499 ;src/entities/enemies.c:199: groups[i].num_enemies--;
   2EE2 0A            [ 7] 1500 	ld	a,(bc)
   2EE3 C6 FF         [ 7] 1501 	add	a,#0xFF
   2EE5 02            [ 7] 1502 	ld	(bc),a
   2EE6 18 03         [12] 1503 	jr	00127$
   2EE8                    1504 00117$:
                           1505 ;src/entities/enemies.c:202: groups[i].sleep--;
   2EE8 C6 FF         [ 7] 1506 	add	a,#0xFF
   2EEA 77            [ 7] 1507 	ld	(hl),a
   2EEB                    1508 00127$:
                           1509 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2EEB DD 34 EB      [23] 1510 	inc	-21 (ix)
   2EEE DD 7E EB      [19] 1511 	ld	a,-21 (ix)
   2EF1 D6 04         [ 7] 1512 	sub	a, #0x04
   2EF3 38 8A         [12] 1513 	jr	C,00126$
   2EF5                    1514 00128$:
   2EF5 DD F9         [10] 1515 	ld	sp, ix
   2EF7 DD E1         [14] 1516 	pop	ix
   2EF9 C9            [10] 1517 	ret
                           1518 ;src/entities/enemies.c:210: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                           1519 ;	---------------------------------
                           1520 ; Function inside_screen
                           1521 ; ---------------------------------
   2EFA                    1522 _inside_screen::
   2EFA DD E5         [15] 1523 	push	ix
   2EFC DD 21 00 00   [14] 1524 	ld	ix,#0
   2F00 DD 39         [15] 1525 	add	ix,sp
   2F02 3B            [ 6] 1526 	dec	sp
                           1527 ;src/entities/enemies.c:212: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   2F03 DD CB 05 7E   [20] 1528 	bit	7, 5 (ix)
   2F07 20 38         [12] 1529 	jr	NZ,00103$
   2F09 DD 5E 08      [19] 1530 	ld	e,8 (ix)
   2F0C 16 00         [ 7] 1531 	ld	d,#0x00
   2F0E DD 6E 04      [19] 1532 	ld	l,4 (ix)
   2F11 DD 66 05      [19] 1533 	ld	h,5 (ix)
   2F14 19            [11] 1534 	add	hl,de
   2F15 11 50 80      [10] 1535 	ld	de, #0x8050
   2F18 29            [11] 1536 	add	hl, hl
   2F19 3F            [ 4] 1537 	ccf
   2F1A CB 1C         [ 8] 1538 	rr	h
   2F1C CB 1D         [ 8] 1539 	rr	l
   2F1E ED 52         [15] 1540 	sbc	hl, de
   2F20 30 1F         [12] 1541 	jr	NC,00103$
   2F22 DD CB 07 7E   [20] 1542 	bit	7, 7 (ix)
   2F26 20 19         [12] 1543 	jr	NZ,00103$
   2F28 DD 5E 09      [19] 1544 	ld	e,9 (ix)
   2F2B 16 00         [ 7] 1545 	ld	d,#0x00
   2F2D DD 6E 06      [19] 1546 	ld	l,6 (ix)
   2F30 DD 66 07      [19] 1547 	ld	h,7 (ix)
   2F33 19            [11] 1548 	add	hl,de
   2F34 11 C8 80      [10] 1549 	ld	de, #0x80C8
   2F37 29            [11] 1550 	add	hl, hl
   2F38 3F            [ 4] 1551 	ccf
   2F39 CB 1C         [ 8] 1552 	rr	h
   2F3B CB 1D         [ 8] 1553 	rr	l
   2F3D ED 52         [15] 1554 	sbc	hl, de
   2F3F 38 04         [12] 1555 	jr	C,00104$
   2F41                    1556 00103$:
   2F41 2E 00         [ 7] 1557 	ld	l,#0x00
   2F43 18 02         [12] 1558 	jr	00105$
   2F45                    1559 00104$:
   2F45 2E 01         [ 7] 1560 	ld	l,#0x01
   2F47                    1561 00105$:
   2F47 33            [ 6] 1562 	inc	sp
   2F48 DD E1         [14] 1563 	pop	ix
   2F4A C9            [10] 1564 	ret
                           1565 ;src/entities/enemies.c:219: void draw_enemies(u8* screen){
                           1566 ;	---------------------------------
                           1567 ; Function draw_enemies
                           1568 ; ---------------------------------
   2F4B                    1569 _draw_enemies::
   2F4B DD E5         [15] 1570 	push	ix
   2F4D DD 21 00 00   [14] 1571 	ld	ix,#0
   2F51 DD 39         [15] 1572 	add	ix,sp
   2F53 21 F1 FF      [10] 1573 	ld	hl,#-15
   2F56 39            [11] 1574 	add	hl,sp
   2F57 F9            [ 6] 1575 	ld	sp,hl
                           1576 ;src/entities/enemies.c:224: if (active_enemies>0){
   2F58 3A DE 66      [13] 1577 	ld	a,(#_active_enemies + 0)
   2F5B B7            [ 4] 1578 	or	a, a
   2F5C CA 8A 30      [10] 1579 	jp	Z,00109$
                           1580 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2F5F DD 36 F1 00   [19] 1581 	ld	-15 (ix),#0x00
   2F63 11 00 00      [10] 1582 	ld	de,#0x0000
   2F66                    1583 00107$:
                           1584 ;src/entities/enemies.c:226: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2F66 21 A6 62      [10] 1585 	ld	hl,#_enemies
   2F69 19            [11] 1586 	add	hl,de
   2F6A DD 75 FC      [19] 1587 	ld	-4 (ix),l
   2F6D DD 74 FD      [19] 1588 	ld	-3 (ix),h
   2F70 DD 6E FC      [19] 1589 	ld	l,-4 (ix)
   2F73 DD 66 FD      [19] 1590 	ld	h,-3 (ix)
   2F76 01 17 00      [10] 1591 	ld	bc, #0x0017
   2F79 09            [11] 1592 	add	hl, bc
   2F7A 7E            [ 7] 1593 	ld	a,(hl)
   2F7B B7            [ 4] 1594 	or	a, a
   2F7C CA 7A 30      [10] 1595 	jp	Z,00108$
   2F7F DD 7E FC      [19] 1596 	ld	a,-4 (ix)
   2F82 C6 15         [ 7] 1597 	add	a, #0x15
   2F84 DD 77 F2      [19] 1598 	ld	-14 (ix),a
   2F87 DD 7E FD      [19] 1599 	ld	a,-3 (ix)
   2F8A CE 00         [ 7] 1600 	adc	a, #0x00
   2F8C DD 77 F3      [19] 1601 	ld	-13 (ix),a
   2F8F DD 6E F2      [19] 1602 	ld	l,-14 (ix)
   2F92 DD 66 F3      [19] 1603 	ld	h,-13 (ix)
   2F95 46            [ 7] 1604 	ld	b,(hl)
   2F96 DD 7E FC      [19] 1605 	ld	a,-4 (ix)
   2F99 C6 14         [ 7] 1606 	add	a, #0x14
   2F9B DD 77 FE      [19] 1607 	ld	-2 (ix),a
   2F9E DD 7E FD      [19] 1608 	ld	a,-3 (ix)
   2FA1 CE 00         [ 7] 1609 	adc	a, #0x00
   2FA3 DD 77 FF      [19] 1610 	ld	-1 (ix),a
   2FA6 DD 6E FE      [19] 1611 	ld	l,-2 (ix)
   2FA9 DD 66 FF      [19] 1612 	ld	h,-1 (ix)
   2FAC 4E            [ 7] 1613 	ld	c,(hl)
   2FAD DD 7E FC      [19] 1614 	ld	a,-4 (ix)
   2FB0 C6 12         [ 7] 1615 	add	a, #0x12
   2FB2 DD 77 FA      [19] 1616 	ld	-6 (ix),a
   2FB5 DD 7E FD      [19] 1617 	ld	a,-3 (ix)
   2FB8 CE 00         [ 7] 1618 	adc	a, #0x00
   2FBA DD 77 FB      [19] 1619 	ld	-5 (ix),a
   2FBD DD 6E FA      [19] 1620 	ld	l,-6 (ix)
   2FC0 DD 66 FB      [19] 1621 	ld	h,-5 (ix)
   2FC3 7E            [ 7] 1622 	ld	a,(hl)
   2FC4 DD 77 F8      [19] 1623 	ld	-8 (ix),a
   2FC7 23            [ 6] 1624 	inc	hl
   2FC8 7E            [ 7] 1625 	ld	a,(hl)
   2FC9 DD 77 F9      [19] 1626 	ld	-7 (ix),a
   2FCC DD 7E FC      [19] 1627 	ld	a,-4 (ix)
   2FCF C6 10         [ 7] 1628 	add	a, #0x10
   2FD1 DD 77 F6      [19] 1629 	ld	-10 (ix),a
   2FD4 DD 7E FD      [19] 1630 	ld	a,-3 (ix)
   2FD7 CE 00         [ 7] 1631 	adc	a, #0x00
   2FD9 DD 77 F7      [19] 1632 	ld	-9 (ix),a
   2FDC DD 6E F6      [19] 1633 	ld	l,-10 (ix)
   2FDF DD 66 F7      [19] 1634 	ld	h,-9 (ix)
   2FE2 7E            [ 7] 1635 	ld	a,(hl)
   2FE3 DD 77 F4      [19] 1636 	ld	-12 (ix),a
   2FE6 23            [ 6] 1637 	inc	hl
   2FE7 7E            [ 7] 1638 	ld	a,(hl)
   2FE8 DD 77 F5      [19] 1639 	ld	-11 (ix),a
   2FEB D5            [11] 1640 	push	de
   2FEC C5            [11] 1641 	push	bc
   2FED DD 6E F8      [19] 1642 	ld	l,-8 (ix)
   2FF0 DD 66 F9      [19] 1643 	ld	h,-7 (ix)
   2FF3 E5            [11] 1644 	push	hl
   2FF4 DD 6E F4      [19] 1645 	ld	l,-12 (ix)
   2FF7 DD 66 F5      [19] 1646 	ld	h,-11 (ix)
   2FFA E5            [11] 1647 	push	hl
   2FFB CD FA 2E      [17] 1648 	call	_inside_screen
   2FFE F1            [10] 1649 	pop	af
   2FFF F1            [10] 1650 	pop	af
   3000 F1            [10] 1651 	pop	af
   3001 7D            [ 4] 1652 	ld	a,l
   3002 D1            [10] 1653 	pop	de
   3003 B7            [ 4] 1654 	or	a, a
   3004 28 74         [12] 1655 	jr	Z,00108$
                           1656 ;src/entities/enemies.c:227: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   3006 DD 6E FA      [19] 1657 	ld	l,-6 (ix)
   3009 DD 66 FB      [19] 1658 	ld	h,-5 (ix)
   300C 4E            [ 7] 1659 	ld	c,(hl)
   300D 23            [ 6] 1660 	inc	hl
   300E 46            [ 7] 1661 	ld	b,(hl)
   300F DD 6E F6      [19] 1662 	ld	l,-10 (ix)
   3012 DD 66 F7      [19] 1663 	ld	h,-9 (ix)
   3015 7E            [ 7] 1664 	ld	a, (hl)
   3016 23            [ 6] 1665 	inc	hl
   3017 66            [ 7] 1666 	ld	h,(hl)
   3018 6F            [ 4] 1667 	ld	l,a
   3019 65            [ 4] 1668 	ld	h,l
   301A E5            [11] 1669 	push	hl
   301B DD 6E 04      [19] 1670 	ld	l,4 (ix)
   301E DD 66 05      [19] 1671 	ld	h,5 (ix)
   3021 E5            [11] 1672 	push	hl
   3022 FD E1         [14] 1673 	pop	iy
   3024 E1            [10] 1674 	pop	hl
   3025 D5            [11] 1675 	push	de
   3026 79            [ 4] 1676 	ld	a,c
   3027 F5            [11] 1677 	push	af
   3028 33            [ 6] 1678 	inc	sp
   3029 E5            [11] 1679 	push	hl
   302A 33            [ 6] 1680 	inc	sp
   302B FD E5         [15] 1681 	push	iy
   302D CD 25 56      [17] 1682 	call	_cpct_getScreenPtr
   3030 D1            [10] 1683 	pop	de
   3031 4D            [ 4] 1684 	ld	c, l
   3032 44            [ 4] 1685 	ld	b, h
                           1686 ;src/entities/enemies.c:228: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   3033 DD 6E F2      [19] 1687 	ld	l,-14 (ix)
   3036 DD 66 F3      [19] 1688 	ld	h,-13 (ix)
   3039 7E            [ 7] 1689 	ld	a,(hl)
   303A DD 77 F4      [19] 1690 	ld	-12 (ix),a
   303D DD 6E FE      [19] 1691 	ld	l,-2 (ix)
   3040 DD 66 FF      [19] 1692 	ld	h,-1 (ix)
   3043 7E            [ 7] 1693 	ld	a,(hl)
   3044 DD 77 F6      [19] 1694 	ld	-10 (ix),a
   3047 DD 71 F8      [19] 1695 	ld	-8 (ix),c
   304A DD 70 F9      [19] 1696 	ld	-7 (ix),b
   304D DD 6E FC      [19] 1697 	ld	l,-4 (ix)
   3050 DD 66 FD      [19] 1698 	ld	h,-3 (ix)
   3053 01 16 00      [10] 1699 	ld	bc, #0x0016
   3056 09            [11] 1700 	add	hl, bc
   3057 7E            [ 7] 1701 	ld	a,(hl)
   3058 87            [ 4] 1702 	add	a, a
   3059 4F            [ 4] 1703 	ld	c,a
   305A DD 6E FC      [19] 1704 	ld	l,-4 (ix)
   305D DD 66 FD      [19] 1705 	ld	h,-3 (ix)
   3060 06 00         [ 7] 1706 	ld	b,#0x00
   3062 09            [11] 1707 	add	hl, bc
   3063 4E            [ 7] 1708 	ld	c,(hl)
   3064 23            [ 6] 1709 	inc	hl
   3065 46            [ 7] 1710 	ld	b,(hl)
   3066 D5            [11] 1711 	push	de
   3067 DD 66 F4      [19] 1712 	ld	h,-12 (ix)
   306A DD 6E F6      [19] 1713 	ld	l,-10 (ix)
   306D E5            [11] 1714 	push	hl
   306E DD 6E F8      [19] 1715 	ld	l,-8 (ix)
   3071 DD 66 F9      [19] 1716 	ld	h,-7 (ix)
   3074 E5            [11] 1717 	push	hl
   3075 C5            [11] 1718 	push	bc
   3076 CD E0 52      [17] 1719 	call	_cpct_drawSprite
   3079 D1            [10] 1720 	pop	de
   307A                    1721 00108$:
                           1722 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   307A 21 24 00      [10] 1723 	ld	hl,#0x0024
   307D 19            [11] 1724 	add	hl,de
   307E EB            [ 4] 1725 	ex	de,hl
   307F DD 34 F1      [23] 1726 	inc	-15 (ix)
   3082 DD 7E F1      [19] 1727 	ld	a,-15 (ix)
   3085 D6 1E         [ 7] 1728 	sub	a, #0x1E
   3087 DA 66 2F      [10] 1729 	jp	C,00107$
   308A                    1730 00109$:
   308A DD F9         [10] 1731 	ld	sp, ix
   308C DD E1         [14] 1732 	pop	ix
   308E C9            [10] 1733 	ret
                           1734 	.area _CODE
                           1735 	.area _INITIALIZER
                           1736 	.area _CABS (ABS)
