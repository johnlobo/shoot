                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:51 2015
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
   5C2D                      34 _enemies::
   5C2D                      35 	.ds 1080
   6065                      36 _active_enemies::
   6065                      37 	.ds 1
   6066                      38 _groups::
   6066                      39 	.ds 32
   6086                      40 _active_groups::
   6086                      41 	.ds 1
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
   229D                      70 _detectColision::
   229D DD E5         [15]   71 	push	ix
   229F DD 21 00 00   [14]   72 	ld	ix,#0
   22A3 DD 39         [15]   73 	add	ix,sp
                             74 ;src/entities/enemies.c:15: return ((x1 < x2 + w2) && (x1 + w1 > x2) && (y1 < y2 + h2) && (h1 + y1 > y2));
   22A5 DD 5E 08      [19]   75 	ld	e,8 (ix)
   22A8 16 00         [ 7]   76 	ld	d,#0x00
   22AA DD 6E 0A      [19]   77 	ld	l,10 (ix)
   22AD 26 00         [ 7]   78 	ld	h,#0x00
   22AF 19            [11]   79 	add	hl,de
   22B0 DD 4E 04      [19]   80 	ld	c,4 (ix)
   22B3 06 00         [ 7]   81 	ld	b,#0x00
   22B5 79            [ 4]   82 	ld	a,c
   22B6 95            [ 4]   83 	sub	a, l
   22B7 78            [ 4]   84 	ld	a,b
   22B8 9C            [ 4]   85 	sbc	a, h
   22B9 E2 BE 22      [10]   86 	jp	PO, 00122$
   22BC EE 80         [ 7]   87 	xor	a, #0x80
   22BE                      88 00122$:
   22BE F2 01 23      [10]   89 	jp	P,00103$
   22C1 DD 6E 06      [19]   90 	ld	l,6 (ix)
   22C4 26 00         [ 7]   91 	ld	h,#0x00
   22C6 09            [11]   92 	add	hl,bc
   22C7 7B            [ 4]   93 	ld	a,e
   22C8 95            [ 4]   94 	sub	a, l
   22C9 7A            [ 4]   95 	ld	a,d
   22CA 9C            [ 4]   96 	sbc	a, h
   22CB E2 D0 22      [10]   97 	jp	PO, 00123$
   22CE EE 80         [ 7]   98 	xor	a, #0x80
   22D0                      99 00123$:
   22D0 F2 01 23      [10]  100 	jp	P,00103$
   22D3 DD 5E 09      [19]  101 	ld	e,9 (ix)
   22D6 16 00         [ 7]  102 	ld	d,#0x00
   22D8 DD 6E 0B      [19]  103 	ld	l,11 (ix)
   22DB 26 00         [ 7]  104 	ld	h,#0x00
   22DD 19            [11]  105 	add	hl,de
   22DE DD 4E 05      [19]  106 	ld	c,5 (ix)
   22E1 06 00         [ 7]  107 	ld	b,#0x00
   22E3 79            [ 4]  108 	ld	a,c
   22E4 95            [ 4]  109 	sub	a, l
   22E5 78            [ 4]  110 	ld	a,b
   22E6 9C            [ 4]  111 	sbc	a, h
   22E7 E2 EC 22      [10]  112 	jp	PO, 00124$
   22EA EE 80         [ 7]  113 	xor	a, #0x80
   22EC                     114 00124$:
   22EC F2 01 23      [10]  115 	jp	P,00103$
   22EF DD 6E 07      [19]  116 	ld	l,7 (ix)
   22F2 26 00         [ 7]  117 	ld	h,#0x00
   22F4 09            [11]  118 	add	hl,bc
   22F5 7B            [ 4]  119 	ld	a,e
   22F6 95            [ 4]  120 	sub	a, l
   22F7 7A            [ 4]  121 	ld	a,d
   22F8 9C            [ 4]  122 	sbc	a, h
   22F9 E2 FE 22      [10]  123 	jp	PO, 00125$
   22FC EE 80         [ 7]  124 	xor	a, #0x80
   22FE                     125 00125$:
   22FE FA 05 23      [10]  126 	jp	M,00104$
   2301                     127 00103$:
   2301 2E 00         [ 7]  128 	ld	l,#0x00
   2303 18 02         [12]  129 	jr	00105$
   2305                     130 00104$:
   2305 2E 01         [ 7]  131 	ld	l,#0x01
   2307                     132 00105$:
   2307 DD E1         [14]  133 	pop	ix
   2309 C9            [10]  134 	ret
                            135 ;src/entities/enemies.c:22: u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
                            136 ;	---------------------------------
                            137 ; Function check_collision_enemies
                            138 ; ---------------------------------
   230A                     139 _check_collision_enemies::
   230A DD E5         [15]  140 	push	ix
   230C DD 21 00 00   [14]  141 	ld	ix,#0
   2310 DD 39         [15]  142 	add	ix,sp
   2312 21 F6 FF      [10]  143 	ld	hl,#-10
   2315 39            [11]  144 	add	hl,sp
   2316 F9            [ 6]  145 	ld	sp,hl
                            146 ;src/entities/enemies.c:27: collision = 0;
   2317 DD 36 F6 00   [19]  147 	ld	-10 (ix),#0x00
                            148 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   231B DD 36 F7 00   [19]  149 	ld	-9 (ix),#0x00
   231F 01 00 00      [10]  150 	ld	bc,#0x0000
   2322                     151 00108$:
                            152 ;src/entities/enemies.c:30: if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
   2322 21 2D 5C      [10]  153 	ld	hl,#_enemies
   2325 09            [11]  154 	add	hl,bc
   2326 EB            [ 4]  155 	ex	de,hl
   2327 21 17 00      [10]  156 	ld	hl,#0x0017
   232A 19            [11]  157 	add	hl,de
   232B DD 75 F8      [19]  158 	ld	-8 (ix),l
   232E DD 74 F9      [19]  159 	ld	-7 (ix),h
   2331 DD 6E F8      [19]  160 	ld	l,-8 (ix)
   2334 DD 66 F9      [19]  161 	ld	h,-7 (ix)
   2337 7E            [ 7]  162 	ld	a,(hl)
   2338 B7            [ 4]  163 	or	a, a
   2339 CA C3 23      [10]  164 	jp	Z,00109$
   233C D5            [11]  165 	push	de
   233D FD E1         [14]  166 	pop	iy
   233F FD 7E 10      [19]  167 	ld	a,16 (iy)
   2342 DD 77 FE      [19]  168 	ld	-2 (ix),a
   2345 FD 7E 11      [19]  169 	ld	a,17 (iy)
   2348 DD 77 FF      [19]  170 	ld	-1 (ix),a
   234B AF            [ 4]  171 	xor	a, a
   234C DD BE FE      [19]  172 	cp	a, -2 (ix)
   234F DD 9E FF      [19]  173 	sbc	a, -1 (ix)
   2352 E2 57 23      [10]  174 	jp	PO, 00137$
   2355 EE 80         [ 7]  175 	xor	a, #0x80
   2357                     176 00137$:
   2357 F2 C3 23      [10]  177 	jp	P,00109$
   235A D5            [11]  178 	push	de
   235B FD E1         [14]  179 	pop	iy
   235D FD 7E 12      [19]  180 	ld	a,18 (iy)
   2360 DD 77 FC      [19]  181 	ld	-4 (ix),a
   2363 FD 7E 13      [19]  182 	ld	a,19 (iy)
   2366 DD 77 FD      [19]  183 	ld	-3 (ix),a
   2369 AF            [ 4]  184 	xor	a, a
   236A DD BE FC      [19]  185 	cp	a, -4 (ix)
   236D DD 9E FD      [19]  186 	sbc	a, -3 (ix)
   2370 E2 75 23      [10]  187 	jp	PO, 00138$
   2373 EE 80         [ 7]  188 	xor	a, #0x80
   2375                     189 00138$:
   2375 F2 C3 23      [10]  190 	jp	P,00109$
                            191 ;src/entities/enemies.c:31: if (fast_collision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
   2378 D5            [11]  192 	push	de
   2379 FD E1         [14]  193 	pop	iy
   237B FD 7E 15      [19]  194 	ld	a,21 (iy)
   237E DD 77 FB      [19]  195 	ld	-5 (ix),a
   2381 D5            [11]  196 	push	de
   2382 FD E1         [14]  197 	pop	iy
   2384 FD 7E 14      [19]  198 	ld	a,20 (iy)
   2387 DD 77 FA      [19]  199 	ld	-6 (ix),a
   238A DD 56 FC      [19]  200 	ld	d,-4 (ix)
   238D DD 5E FE      [19]  201 	ld	e,-2 (ix)
   2390 C5            [11]  202 	push	bc
   2391 DD 66 FB      [19]  203 	ld	h,-5 (ix)
   2394 DD 6E FA      [19]  204 	ld	l,-6 (ix)
   2397 E5            [11]  205 	push	hl
   2398 D5            [11]  206 	push	de
   2399 DD 66 07      [19]  207 	ld	h,7 (ix)
   239C DD 6E 06      [19]  208 	ld	l,6 (ix)
   239F E5            [11]  209 	push	hl
   23A0 DD 66 05      [19]  210 	ld	h,5 (ix)
   23A3 DD 6E 04      [19]  211 	ld	l,4 (ix)
   23A6 E5            [11]  212 	push	hl
   23A7 CD E4 4A      [17]  213 	call	_fast_collision
   23AA F1            [10]  214 	pop	af
   23AB F1            [10]  215 	pop	af
   23AC F1            [10]  216 	pop	af
   23AD F1            [10]  217 	pop	af
   23AE 7D            [ 4]  218 	ld	a,l
   23AF C1            [10]  219 	pop	bc
   23B0 B7            [ 4]  220 	or	a, a
   23B1 28 10         [12]  221 	jr	Z,00109$
                            222 ;src/entities/enemies.c:32: collision = 1;
   23B3 DD 36 F6 01   [19]  223 	ld	-10 (ix),#0x01
                            224 ;src/entities/enemies.c:33: enemies[i].active = 0;
   23B7 DD 6E F8      [19]  225 	ld	l,-8 (ix)
   23BA DD 66 F9      [19]  226 	ld	h,-7 (ix)
   23BD 36 00         [10]  227 	ld	(hl),#0x00
                            228 ;src/entities/enemies.c:34: active_enemies--;
   23BF 21 65 60      [10]  229 	ld	hl, #_active_enemies+0
   23C2 35            [11]  230 	dec	(hl)
   23C3                     231 00109$:
                            232 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   23C3 21 24 00      [10]  233 	ld	hl,#0x0024
   23C6 09            [11]  234 	add	hl,bc
   23C7 4D            [ 4]  235 	ld	c,l
   23C8 44            [ 4]  236 	ld	b,h
   23C9 DD 34 F7      [23]  237 	inc	-9 (ix)
   23CC DD 7E F7      [19]  238 	ld	a,-9 (ix)
   23CF D6 1E         [ 7]  239 	sub	a, #0x1E
   23D1 DA 22 23      [10]  240 	jp	C,00108$
                            241 ;src/entities/enemies.c:38: return collision;
   23D4 DD 6E F6      [19]  242 	ld	l,-10 (ix)
   23D7 DD F9         [10]  243 	ld	sp, ix
   23D9 DD E1         [14]  244 	pop	ix
   23DB C9            [10]  245 	ret
                            246 ;src/entities/enemies.c:45: void init_enemies(){
                            247 ;	---------------------------------
                            248 ; Function init_enemies
                            249 ; ---------------------------------
   23DC                     250 _init_enemies::
   23DC DD E5         [15]  251 	push	ix
   23DE DD 21 00 00   [14]  252 	ld	ix,#0
   23E2 DD 39         [15]  253 	add	ix,sp
   23E4 3B            [ 6]  254 	dec	sp
                            255 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   23E5 DD 36 FF 00   [19]  256 	ld	-1 (ix),#0x00
   23E9 11 00 00      [10]  257 	ld	de,#0x0000
   23EC                     258 00102$:
                            259 ;src/entities/enemies.c:48: enemies[k].active=0;
   23EC 21 2D 5C      [10]  260 	ld	hl,#_enemies
   23EF 19            [11]  261 	add	hl,de
   23F0 4D            [ 4]  262 	ld	c,l
   23F1 44            [ 4]  263 	ld	b,h
   23F2 21 17 00      [10]  264 	ld	hl,#0x0017
   23F5 09            [11]  265 	add	hl,bc
   23F6 36 00         [10]  266 	ld	(hl),#0x00
                            267 ;src/entities/enemies.c:49: enemies[k].x=0;
   23F8 21 10 00      [10]  268 	ld	hl,#0x0010
   23FB 09            [11]  269 	add	hl,bc
   23FC AF            [ 4]  270 	xor	a, a
   23FD 77            [ 7]  271 	ld	(hl), a
   23FE 23            [ 6]  272 	inc	hl
   23FF 77            [ 7]  273 	ld	(hl), a
                            274 ;src/entities/enemies.c:50: enemies[k].y=0;
   2400 21 12 00      [10]  275 	ld	hl,#0x0012
   2403 09            [11]  276 	add	hl,bc
   2404 AF            [ 4]  277 	xor	a, a
   2405 77            [ 7]  278 	ld	(hl), a
   2406 23            [ 6]  279 	inc	hl
   2407 77            [ 7]  280 	ld	(hl), a
                            281 ;src/entities/enemies.c:51: enemies[k].w=0;
   2408 21 14 00      [10]  282 	ld	hl,#0x0014
   240B 09            [11]  283 	add	hl,bc
   240C 36 00         [10]  284 	ld	(hl),#0x00
                            285 ;src/entities/enemies.c:52: enemies[k].h=0;
   240E 21 15 00      [10]  286 	ld	hl,#0x0015
   2411 09            [11]  287 	add	hl,bc
   2412 36 00         [10]  288 	ld	(hl),#0x00
                            289 ;src/entities/enemies.c:53: enemies[k].dir=0;
   2414 21 16 00      [10]  290 	ld	hl,#0x0016
   2417 09            [11]  291 	add	hl,bc
   2418 36 00         [10]  292 	ld	(hl),#0x00
                            293 ;src/entities/enemies.c:54: enemies[k].frame=0;
   241A 21 19 00      [10]  294 	ld	hl,#0x0019
   241D 09            [11]  295 	add	hl,bc
   241E 36 00         [10]  296 	ld	(hl),#0x00
                            297 ;src/entities/enemies.c:55: enemies[k].lastmoved=0;
   2420 21 20 00      [10]  298 	ld	hl,#0x0020
   2423 09            [11]  299 	add	hl,bc
   2424 AF            [ 4]  300 	xor	a, a
   2425 77            [ 7]  301 	ld	(hl), a
   2426 23            [ 6]  302 	inc	hl
   2427 77            [ 7]  303 	ld	(hl), a
   2428 23            [ 6]  304 	inc	hl
   2429 AF            [ 4]  305 	xor	a, a
   242A 77            [ 7]  306 	ld	(hl), a
   242B 23            [ 6]  307 	inc	hl
   242C 77            [ 7]  308 	ld	(hl), a
                            309 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   242D 21 24 00      [10]  310 	ld	hl,#0x0024
   2430 19            [11]  311 	add	hl,de
   2431 EB            [ 4]  312 	ex	de,hl
   2432 DD 34 FF      [23]  313 	inc	-1 (ix)
   2435 DD 7E FF      [19]  314 	ld	a,-1 (ix)
   2438 D6 1E         [ 7]  315 	sub	a, #0x1E
   243A 38 B0         [12]  316 	jr	C,00102$
                            317 ;src/entities/enemies.c:57: active_enemies=0;
   243C 21 65 60      [10]  318 	ld	hl,#_active_enemies + 0
   243F 36 00         [10]  319 	ld	(hl), #0x00
   2441 33            [ 6]  320 	inc	sp
   2442 DD E1         [14]  321 	pop	ix
   2444 C9            [10]  322 	ret
                            323 ;src/entities/enemies.c:65: void create_enemy(i16 x, i16 y, u8 type){
                            324 ;	---------------------------------
                            325 ; Function create_enemy
                            326 ; ---------------------------------
   2445                     327 _create_enemy::
   2445 DD E5         [15]  328 	push	ix
   2447 DD 21 00 00   [14]  329 	ld	ix,#0
   244B DD 39         [15]  330 	add	ix,sp
   244D 21 E0 FF      [10]  331 	ld	hl,#-32
   2450 39            [11]  332 	add	hl,sp
   2451 F9            [ 6]  333 	ld	sp,hl
                            334 ;src/entities/enemies.c:67: if (active_enemies < MAX_ENEMIES){
   2452 3A 65 60      [13]  335 	ld	a,(#_active_enemies + 0)
   2455 D6 1E         [ 7]  336 	sub	a, #0x1E
   2457 D2 7F 27      [10]  337 	jp	NC,00110$
                            338 ;src/entities/enemies.c:69: while (enemies[k].active){
   245A 11 00 00      [10]  339 	ld	de,#0x0000
   245D                     340 00101$:
   245D 21 2D 5C      [10]  341 	ld	hl,#_enemies
   2460 19            [11]  342 	add	hl,de
   2461 DD 75 FE      [19]  343 	ld	-2 (ix),l
   2464 DD 74 FF      [19]  344 	ld	-1 (ix),h
   2467 DD 7E FE      [19]  345 	ld	a,-2 (ix)
   246A C6 17         [ 7]  346 	add	a, #0x17
   246C 6F            [ 4]  347 	ld	l,a
   246D DD 7E FF      [19]  348 	ld	a,-1 (ix)
   2470 CE 00         [ 7]  349 	adc	a, #0x00
   2472 67            [ 4]  350 	ld	h,a
   2473 7E            [ 7]  351 	ld	a,(hl)
   2474 B7            [ 4]  352 	or	a, a
   2475 28 07         [12]  353 	jr	Z,00103$
                            354 ;src/entities/enemies.c:70: k++;
   2477 21 24 00      [10]  355 	ld	hl,#0x0024
   247A 19            [11]  356 	add	hl,de
   247B EB            [ 4]  357 	ex	de,hl
   247C 18 DF         [12]  358 	jr	00101$
   247E                     359 00103$:
                            360 ;src/entities/enemies.c:72: enemies[k].active=1;
   247E 36 01         [10]  361 	ld	(hl),#0x01
                            362 ;src/entities/enemies.c:73: enemies[k].frame=0;
   2480 DD 7E FE      [19]  363 	ld	a,-2 (ix)
   2483 C6 19         [ 7]  364 	add	a, #0x19
   2485 6F            [ 4]  365 	ld	l,a
   2486 DD 7E FF      [19]  366 	ld	a,-1 (ix)
   2489 CE 00         [ 7]  367 	adc	a, #0x00
   248B 67            [ 4]  368 	ld	h,a
   248C 36 00         [10]  369 	ld	(hl),#0x00
                            370 ;src/entities/enemies.c:77: enemies[k].x=x;
   248E DD 7E FE      [19]  371 	ld	a,-2 (ix)
   2491 C6 10         [ 7]  372 	add	a, #0x10
   2493 DD 77 FC      [19]  373 	ld	-4 (ix),a
   2496 DD 7E FF      [19]  374 	ld	a,-1 (ix)
   2499 CE 00         [ 7]  375 	adc	a, #0x00
   249B DD 77 FD      [19]  376 	ld	-3 (ix),a
                            377 ;src/entities/enemies.c:78: enemies[k].y=y;
   249E DD 7E FE      [19]  378 	ld	a,-2 (ix)
   24A1 C6 12         [ 7]  379 	add	a, #0x12
   24A3 DD 77 FA      [19]  380 	ld	-6 (ix),a
   24A6 DD 7E FF      [19]  381 	ld	a,-1 (ix)
   24A9 CE 00         [ 7]  382 	adc	a, #0x00
   24AB DD 77 FB      [19]  383 	ld	-5 (ix),a
                            384 ;src/entities/enemies.c:79: enemies[k].w=6;
   24AE DD 7E FE      [19]  385 	ld	a,-2 (ix)
   24B1 C6 14         [ 7]  386 	add	a, #0x14
   24B3 DD 77 F8      [19]  387 	ld	-8 (ix),a
   24B6 DD 7E FF      [19]  388 	ld	a,-1 (ix)
   24B9 CE 00         [ 7]  389 	adc	a, #0x00
   24BB DD 77 F9      [19]  390 	ld	-7 (ix),a
                            391 ;src/entities/enemies.c:80: enemies[k].h=12;
   24BE DD 7E FE      [19]  392 	ld	a,-2 (ix)
   24C1 C6 15         [ 7]  393 	add	a, #0x15
   24C3 DD 77 F6      [19]  394 	ld	-10 (ix),a
   24C6 DD 7E FF      [19]  395 	ld	a,-1 (ix)
   24C9 CE 00         [ 7]  396 	adc	a, #0x00
   24CB DD 77 F7      [19]  397 	ld	-9 (ix),a
                            398 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   24CE DD 7E FE      [19]  399 	ld	a,-2 (ix)
   24D1 C6 18         [ 7]  400 	add	a, #0x18
   24D3 DD 77 F4      [19]  401 	ld	-12 (ix),a
   24D6 DD 7E FF      [19]  402 	ld	a,-1 (ix)
   24D9 CE 00         [ 7]  403 	adc	a, #0x00
   24DB DD 77 F5      [19]  404 	ld	-11 (ix),a
                            405 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   24DE DD 7E FE      [19]  406 	ld	a,-2 (ix)
   24E1 C6 02         [ 7]  407 	add	a, #0x02
   24E3 DD 77 F2      [19]  408 	ld	-14 (ix),a
   24E6 DD 7E FF      [19]  409 	ld	a,-1 (ix)
   24E9 CE 00         [ 7]  410 	adc	a, #0x00
   24EB DD 77 F3      [19]  411 	ld	-13 (ix),a
                            412 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   24EE DD 7E FE      [19]  413 	ld	a,-2 (ix)
   24F1 C6 04         [ 7]  414 	add	a, #0x04
   24F3 DD 77 F0      [19]  415 	ld	-16 (ix),a
   24F6 DD 7E FF      [19]  416 	ld	a,-1 (ix)
   24F9 CE 00         [ 7]  417 	adc	a, #0x00
   24FB DD 77 F1      [19]  418 	ld	-15 (ix),a
                            419 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   24FE DD 7E FE      [19]  420 	ld	a,-2 (ix)
   2501 C6 06         [ 7]  421 	add	a, #0x06
   2503 DD 77 EE      [19]  422 	ld	-18 (ix),a
   2506 DD 7E FF      [19]  423 	ld	a,-1 (ix)
   2509 CE 00         [ 7]  424 	adc	a, #0x00
   250B DD 77 EF      [19]  425 	ld	-17 (ix),a
                            426 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   250E DD 7E FE      [19]  427 	ld	a,-2 (ix)
   2511 C6 08         [ 7]  428 	add	a, #0x08
   2513 DD 77 EC      [19]  429 	ld	-20 (ix),a
   2516 DD 7E FF      [19]  430 	ld	a,-1 (ix)
   2519 CE 00         [ 7]  431 	adc	a, #0x00
   251B DD 77 ED      [19]  432 	ld	-19 (ix),a
                            433 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   251E DD 7E FE      [19]  434 	ld	a,-2 (ix)
   2521 C6 0A         [ 7]  435 	add	a, #0x0A
   2523 DD 77 EA      [19]  436 	ld	-22 (ix),a
   2526 DD 7E FF      [19]  437 	ld	a,-1 (ix)
   2529 CE 00         [ 7]  438 	adc	a, #0x00
   252B DD 77 EB      [19]  439 	ld	-21 (ix),a
                            440 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   252E DD 7E FE      [19]  441 	ld	a,-2 (ix)
   2531 C6 0C         [ 7]  442 	add	a, #0x0C
   2533 DD 77 E8      [19]  443 	ld	-24 (ix),a
   2536 DD 7E FF      [19]  444 	ld	a,-1 (ix)
   2539 CE 00         [ 7]  445 	adc	a, #0x00
   253B DD 77 E9      [19]  446 	ld	-23 (ix),a
                            447 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   253E DD 7E FE      [19]  448 	ld	a,-2 (ix)
   2541 C6 0E         [ 7]  449 	add	a, #0x0E
   2543 DD 77 E6      [19]  450 	ld	-26 (ix),a
   2546 DD 7E FF      [19]  451 	ld	a,-1 (ix)
   2549 CE 00         [ 7]  452 	adc	a, #0x00
   254B DD 77 E7      [19]  453 	ld	-25 (ix),a
                            454 ;src/entities/enemies.c:90: enemies[k].movement=0;
   254E DD 7E FE      [19]  455 	ld	a,-2 (ix)
   2551 C6 1D         [ 7]  456 	add	a, #0x1D
   2553 DD 77 E4      [19]  457 	ld	-28 (ix),a
   2556 DD 7E FF      [19]  458 	ld	a,-1 (ix)
   2559 CE 00         [ 7]  459 	adc	a, #0x00
   255B DD 77 E5      [19]  460 	ld	-27 (ix),a
                            461 ;src/entities/enemies.c:91: enemies[k].stage=0;
   255E DD 7E FE      [19]  462 	ld	a,-2 (ix)
   2561 C6 1E         [ 7]  463 	add	a, #0x1E
   2563 DD 77 E2      [19]  464 	ld	-30 (ix),a
   2566 DD 7E FF      [19]  465 	ld	a,-1 (ix)
   2569 CE 00         [ 7]  466 	adc	a, #0x00
   256B DD 77 E3      [19]  467 	ld	-29 (ix),a
                            468 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   256E DD 7E FE      [19]  469 	ld	a,-2 (ix)
   2571 C6 1F         [ 7]  470 	add	a, #0x1F
   2573 DD 77 E0      [19]  471 	ld	-32 (ix),a
   2576 DD 7E FF      [19]  472 	ld	a,-1 (ix)
   2579 CE 00         [ 7]  473 	adc	a, #0x00
   257B DD 77 E1      [19]  474 	ld	-31 (ix),a
                            475 ;src/entities/enemies.c:74: switch (type){
   257E DD 7E 08      [19]  476 	ld	a,8 (ix)
   2581 3D            [ 4]  477 	dec	a
   2582 28 0B         [12]  478 	jr	Z,00104$
   2584 DD 7E 08      [19]  479 	ld	a,8 (ix)
   2587 D6 02         [ 7]  480 	sub	a, #0x02
   2589 CA 34 26      [10]  481 	jp	Z,00105$
   258C C3 D9 26      [10]  482 	jp	00106$
                            483 ;src/entities/enemies.c:76: case 1:
   258F                     484 00104$:
                            485 ;src/entities/enemies.c:77: enemies[k].x=x;
   258F DD 6E FC      [19]  486 	ld	l,-4 (ix)
   2592 DD 66 FD      [19]  487 	ld	h,-3 (ix)
   2595 DD 7E 04      [19]  488 	ld	a,4 (ix)
   2598 77            [ 7]  489 	ld	(hl),a
   2599 23            [ 6]  490 	inc	hl
   259A DD 7E 05      [19]  491 	ld	a,5 (ix)
   259D 77            [ 7]  492 	ld	(hl),a
                            493 ;src/entities/enemies.c:78: enemies[k].y=y;
   259E DD 6E FA      [19]  494 	ld	l,-6 (ix)
   25A1 DD 66 FB      [19]  495 	ld	h,-5 (ix)
   25A4 DD 7E 06      [19]  496 	ld	a,6 (ix)
   25A7 77            [ 7]  497 	ld	(hl),a
   25A8 23            [ 6]  498 	inc	hl
   25A9 DD 7E 07      [19]  499 	ld	a,7 (ix)
   25AC 77            [ 7]  500 	ld	(hl),a
                            501 ;src/entities/enemies.c:79: enemies[k].w=6;
   25AD DD 6E F8      [19]  502 	ld	l,-8 (ix)
   25B0 DD 66 F9      [19]  503 	ld	h,-7 (ix)
   25B3 36 06         [10]  504 	ld	(hl),#0x06
                            505 ;src/entities/enemies.c:80: enemies[k].h=12;
   25B5 DD 6E F6      [19]  506 	ld	l,-10 (ix)
   25B8 DD 66 F7      [19]  507 	ld	h,-9 (ix)
   25BB 36 0C         [10]  508 	ld	(hl),#0x0C
                            509 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   25BD DD 6E F4      [19]  510 	ld	l,-12 (ix)
   25C0 DD 66 F5      [19]  511 	ld	h,-11 (ix)
   25C3 36 00         [10]  512 	ld	(hl),#0x00
                            513 ;src/entities/enemies.c:82: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   25C5 DD 6E FE      [19]  514 	ld	l,-2 (ix)
   25C8 DD 66 FF      [19]  515 	ld	h,-1 (ix)
   25CB 36 51         [10]  516 	ld	(hl),#<(_G_baddie02_00)
   25CD 23            [ 6]  517 	inc	hl
   25CE 36 3D         [10]  518 	ld	(hl),#>(_G_baddie02_00)
                            519 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   25D0 DD 6E F2      [19]  520 	ld	l,-14 (ix)
   25D3 DD 66 F3      [19]  521 	ld	h,-13 (ix)
   25D6 36 99         [10]  522 	ld	(hl),#<(_G_baddie02_01)
   25D8 23            [ 6]  523 	inc	hl
   25D9 36 3D         [10]  524 	ld	(hl),#>(_G_baddie02_01)
                            525 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   25DB DD 6E F0      [19]  526 	ld	l,-16 (ix)
   25DE DD 66 F1      [19]  527 	ld	h,-15 (ix)
   25E1 36 E1         [10]  528 	ld	(hl),#<(_G_baddie02_02)
   25E3 23            [ 6]  529 	inc	hl
   25E4 36 3D         [10]  530 	ld	(hl),#>(_G_baddie02_02)
                            531 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   25E6 DD 6E EE      [19]  532 	ld	l,-18 (ix)
   25E9 DD 66 EF      [19]  533 	ld	h,-17 (ix)
   25EC 36 29         [10]  534 	ld	(hl),#<(_G_baddie02_03)
   25EE 23            [ 6]  535 	inc	hl
   25EF 36 3E         [10]  536 	ld	(hl),#>(_G_baddie02_03)
                            537 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   25F1 DD 6E EC      [19]  538 	ld	l,-20 (ix)
   25F4 DD 66 ED      [19]  539 	ld	h,-19 (ix)
   25F7 36 71         [10]  540 	ld	(hl),#<(_G_baddie02_04)
   25F9 23            [ 6]  541 	inc	hl
   25FA 36 3E         [10]  542 	ld	(hl),#>(_G_baddie02_04)
                            543 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   25FC DD 6E EA      [19]  544 	ld	l,-22 (ix)
   25FF DD 66 EB      [19]  545 	ld	h,-21 (ix)
   2602 36 B9         [10]  546 	ld	(hl),#<(_G_baddie02_05)
   2604 23            [ 6]  547 	inc	hl
   2605 36 3E         [10]  548 	ld	(hl),#>(_G_baddie02_05)
                            549 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2607 DD 6E E8      [19]  550 	ld	l,-24 (ix)
   260A DD 66 E9      [19]  551 	ld	h,-23 (ix)
   260D 36 01         [10]  552 	ld	(hl),#<(_G_baddie02_06)
   260F 23            [ 6]  553 	inc	hl
   2610 36 3F         [10]  554 	ld	(hl),#>(_G_baddie02_06)
                            555 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2612 DD 6E E6      [19]  556 	ld	l,-26 (ix)
   2615 DD 66 E7      [19]  557 	ld	h,-25 (ix)
   2618 36 49         [10]  558 	ld	(hl),#<(_G_baddie02_07)
   261A 23            [ 6]  559 	inc	hl
   261B 36 3F         [10]  560 	ld	(hl),#>(_G_baddie02_07)
                            561 ;src/entities/enemies.c:90: enemies[k].movement=0;
   261D DD 6E E4      [19]  562 	ld	l,-28 (ix)
   2620 DD 66 E5      [19]  563 	ld	h,-27 (ix)
   2623 36 00         [10]  564 	ld	(hl),#0x00
                            565 ;src/entities/enemies.c:91: enemies[k].stage=0;
   2625 DD 6E E2      [19]  566 	ld	l,-30 (ix)
   2628 DD 66 E3      [19]  567 	ld	h,-29 (ix)
   262B 36 00         [10]  568 	ld	(hl),#0x00
                            569 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   262D E1            [10]  570 	pop	hl
   262E E5            [11]  571 	push	hl
   262F 36 00         [10]  572 	ld	(hl),#0x00
                            573 ;src/entities/enemies.c:93: break;
   2631 C3 7B 27      [10]  574 	jp	00107$
                            575 ;src/entities/enemies.c:94: case 2:
   2634                     576 00105$:
                            577 ;src/entities/enemies.c:95: enemies[k].x=x;
   2634 DD 6E FC      [19]  578 	ld	l,-4 (ix)
   2637 DD 66 FD      [19]  579 	ld	h,-3 (ix)
   263A DD 7E 04      [19]  580 	ld	a,4 (ix)
   263D 77            [ 7]  581 	ld	(hl),a
   263E 23            [ 6]  582 	inc	hl
   263F DD 7E 05      [19]  583 	ld	a,5 (ix)
   2642 77            [ 7]  584 	ld	(hl),a
                            585 ;src/entities/enemies.c:96: enemies[k].y=y;
   2643 DD 6E FA      [19]  586 	ld	l,-6 (ix)
   2646 DD 66 FB      [19]  587 	ld	h,-5 (ix)
   2649 DD 7E 06      [19]  588 	ld	a,6 (ix)
   264C 77            [ 7]  589 	ld	(hl),a
   264D 23            [ 6]  590 	inc	hl
   264E DD 7E 07      [19]  591 	ld	a,7 (ix)
   2651 77            [ 7]  592 	ld	(hl),a
                            593 ;src/entities/enemies.c:97: enemies[k].w=4;
   2652 DD 6E F8      [19]  594 	ld	l,-8 (ix)
   2655 DD 66 F9      [19]  595 	ld	h,-7 (ix)
   2658 36 04         [10]  596 	ld	(hl),#0x04
                            597 ;src/entities/enemies.c:98: enemies[k].h=8;
   265A DD 6E F6      [19]  598 	ld	l,-10 (ix)
   265D DD 66 F7      [19]  599 	ld	h,-9 (ix)
   2660 36 08         [10]  600 	ld	(hl),#0x08
                            601 ;src/entities/enemies.c:99: enemies[k].num_frames=0;
   2662 DD 6E F4      [19]  602 	ld	l,-12 (ix)
   2665 DD 66 F5      [19]  603 	ld	h,-11 (ix)
   2668 36 00         [10]  604 	ld	(hl),#0x00
                            605 ;src/entities/enemies.c:100: enemies[k].sprite[0]= (u8*) G_baddie03_00;
   266A DD 6E FE      [19]  606 	ld	l,-2 (ix)
   266D DD 66 FF      [19]  607 	ld	h,-1 (ix)
   2670 36 48         [10]  608 	ld	(hl),#<(_G_baddie03_00)
   2672 23            [ 6]  609 	inc	hl
   2673 36 42         [10]  610 	ld	(hl),#>(_G_baddie03_00)
                            611 ;src/entities/enemies.c:101: enemies[k].sprite[1]= (u8*) G_baddie03_01;
   2675 DD 6E F2      [19]  612 	ld	l,-14 (ix)
   2678 DD 66 F3      [19]  613 	ld	h,-13 (ix)
   267B 36 68         [10]  614 	ld	(hl),#<(_G_baddie03_01)
   267D 23            [ 6]  615 	inc	hl
   267E 36 42         [10]  616 	ld	(hl),#>(_G_baddie03_01)
                            617 ;src/entities/enemies.c:102: enemies[k].sprite[2]= (u8*) G_baddie03_02;
   2680 DD 6E F0      [19]  618 	ld	l,-16 (ix)
   2683 DD 66 F1      [19]  619 	ld	h,-15 (ix)
   2686 36 88         [10]  620 	ld	(hl),#<(_G_baddie03_02)
   2688 23            [ 6]  621 	inc	hl
   2689 36 42         [10]  622 	ld	(hl),#>(_G_baddie03_02)
                            623 ;src/entities/enemies.c:103: enemies[k].sprite[3]= (u8*) G_baddie03_03;
   268B DD 6E EE      [19]  624 	ld	l,-18 (ix)
   268E DD 66 EF      [19]  625 	ld	h,-17 (ix)
   2691 36 A8         [10]  626 	ld	(hl),#<(_G_baddie03_03)
   2693 23            [ 6]  627 	inc	hl
   2694 36 42         [10]  628 	ld	(hl),#>(_G_baddie03_03)
                            629 ;src/entities/enemies.c:104: enemies[k].sprite[4]= (u8*) G_baddie03_04;
   2696 DD 6E EC      [19]  630 	ld	l,-20 (ix)
   2699 DD 66 ED      [19]  631 	ld	h,-19 (ix)
   269C 36 C8         [10]  632 	ld	(hl),#<(_G_baddie03_04)
   269E 23            [ 6]  633 	inc	hl
   269F 36 42         [10]  634 	ld	(hl),#>(_G_baddie03_04)
                            635 ;src/entities/enemies.c:105: enemies[k].sprite[5]= (u8*) G_baddie03_05;
   26A1 DD 6E EA      [19]  636 	ld	l,-22 (ix)
   26A4 DD 66 EB      [19]  637 	ld	h,-21 (ix)
   26A7 36 E8         [10]  638 	ld	(hl),#<(_G_baddie03_05)
   26A9 23            [ 6]  639 	inc	hl
   26AA 36 42         [10]  640 	ld	(hl),#>(_G_baddie03_05)
                            641 ;src/entities/enemies.c:106: enemies[k].sprite[6]= (u8*) G_baddie03_06;
   26AC DD 6E E8      [19]  642 	ld	l,-24 (ix)
   26AF DD 66 E9      [19]  643 	ld	h,-23 (ix)
   26B2 36 08         [10]  644 	ld	(hl),#<(_G_baddie03_06)
   26B4 23            [ 6]  645 	inc	hl
   26B5 36 43         [10]  646 	ld	(hl),#>(_G_baddie03_06)
                            647 ;src/entities/enemies.c:107: enemies[k].sprite[7]= (u8*) G_baddie03_07;
   26B7 DD 6E E6      [19]  648 	ld	l,-26 (ix)
   26BA DD 66 E7      [19]  649 	ld	h,-25 (ix)
   26BD 36 28         [10]  650 	ld	(hl),#<(_G_baddie03_07)
   26BF 23            [ 6]  651 	inc	hl
   26C0 36 43         [10]  652 	ld	(hl),#>(_G_baddie03_07)
                            653 ;src/entities/enemies.c:108: enemies[k].movement=0;
   26C2 DD 6E E4      [19]  654 	ld	l,-28 (ix)
   26C5 DD 66 E5      [19]  655 	ld	h,-27 (ix)
   26C8 36 00         [10]  656 	ld	(hl),#0x00
                            657 ;src/entities/enemies.c:109: enemies[k].stage=0;
   26CA DD 6E E2      [19]  658 	ld	l,-30 (ix)
   26CD DD 66 E3      [19]  659 	ld	h,-29 (ix)
   26D0 36 00         [10]  660 	ld	(hl),#0x00
                            661 ;src/entities/enemies.c:110: enemies[k].stage_step=0;
   26D2 E1            [10]  662 	pop	hl
   26D3 E5            [11]  663 	push	hl
   26D4 36 00         [10]  664 	ld	(hl),#0x00
                            665 ;src/entities/enemies.c:111: break;
   26D6 C3 7B 27      [10]  666 	jp	00107$
                            667 ;src/entities/enemies.c:112: default:
   26D9                     668 00106$:
                            669 ;src/entities/enemies.c:113: enemies[k].x=x;
   26D9 DD 6E FC      [19]  670 	ld	l,-4 (ix)
   26DC DD 66 FD      [19]  671 	ld	h,-3 (ix)
   26DF DD 7E 04      [19]  672 	ld	a,4 (ix)
   26E2 77            [ 7]  673 	ld	(hl),a
   26E3 23            [ 6]  674 	inc	hl
   26E4 DD 7E 05      [19]  675 	ld	a,5 (ix)
   26E7 77            [ 7]  676 	ld	(hl),a
                            677 ;src/entities/enemies.c:114: enemies[k].y=y;
   26E8 DD 6E FA      [19]  678 	ld	l,-6 (ix)
   26EB DD 66 FB      [19]  679 	ld	h,-5 (ix)
   26EE DD 7E 06      [19]  680 	ld	a,6 (ix)
   26F1 77            [ 7]  681 	ld	(hl),a
   26F2 23            [ 6]  682 	inc	hl
   26F3 DD 7E 07      [19]  683 	ld	a,7 (ix)
   26F6 77            [ 7]  684 	ld	(hl),a
                            685 ;src/entities/enemies.c:115: enemies[k].w=5;
   26F7 DD 6E F8      [19]  686 	ld	l,-8 (ix)
   26FA DD 66 F9      [19]  687 	ld	h,-7 (ix)
   26FD 36 05         [10]  688 	ld	(hl),#0x05
                            689 ;src/entities/enemies.c:116: enemies[k].h=16;
   26FF DD 6E F6      [19]  690 	ld	l,-10 (ix)
   2702 DD 66 F7      [19]  691 	ld	h,-9 (ix)
   2705 36 10         [10]  692 	ld	(hl),#0x10
                            693 ;src/entities/enemies.c:117: enemies[k].num_frames=0;
   2707 DD 6E F4      [19]  694 	ld	l,-12 (ix)
   270A DD 66 F5      [19]  695 	ld	h,-11 (ix)
   270D 36 00         [10]  696 	ld	(hl),#0x00
                            697 ;src/entities/enemies.c:118: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   270F DD 6E FE      [19]  698 	ld	l,-2 (ix)
   2712 DD 66 FF      [19]  699 	ld	h,-1 (ix)
   2715 36 D1         [10]  700 	ld	(hl),#<(_G_baddie01_00)
   2717 23            [ 6]  701 	inc	hl
   2718 36 3A         [10]  702 	ld	(hl),#>(_G_baddie01_00)
                            703 ;src/entities/enemies.c:119: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   271A DD 6E F2      [19]  704 	ld	l,-14 (ix)
   271D DD 66 F3      [19]  705 	ld	h,-13 (ix)
   2720 36 21         [10]  706 	ld	(hl),#<(_G_baddie01_01)
   2722 23            [ 6]  707 	inc	hl
   2723 36 3B         [10]  708 	ld	(hl),#>(_G_baddie01_01)
                            709 ;src/entities/enemies.c:120: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   2725 DD 6E F0      [19]  710 	ld	l,-16 (ix)
   2728 DD 66 F1      [19]  711 	ld	h,-15 (ix)
   272B 36 71         [10]  712 	ld	(hl),#<(_G_baddie01_02)
   272D 23            [ 6]  713 	inc	hl
   272E 36 3B         [10]  714 	ld	(hl),#>(_G_baddie01_02)
                            715 ;src/entities/enemies.c:121: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2730 DD 6E EE      [19]  716 	ld	l,-18 (ix)
   2733 DD 66 EF      [19]  717 	ld	h,-17 (ix)
   2736 36 C1         [10]  718 	ld	(hl),#<(_G_baddie01_03)
   2738 23            [ 6]  719 	inc	hl
   2739 36 3B         [10]  720 	ld	(hl),#>(_G_baddie01_03)
                            721 ;src/entities/enemies.c:122: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   273B DD 6E EC      [19]  722 	ld	l,-20 (ix)
   273E DD 66 ED      [19]  723 	ld	h,-19 (ix)
   2741 36 11         [10]  724 	ld	(hl),#<(_G_baddie01_04)
   2743 23            [ 6]  725 	inc	hl
   2744 36 3C         [10]  726 	ld	(hl),#>(_G_baddie01_04)
                            727 ;src/entities/enemies.c:123: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   2746 DD 6E EA      [19]  728 	ld	l,-22 (ix)
   2749 DD 66 EB      [19]  729 	ld	h,-21 (ix)
   274C 36 61         [10]  730 	ld	(hl),#<(_G_baddie01_05)
   274E 23            [ 6]  731 	inc	hl
   274F 36 3C         [10]  732 	ld	(hl),#>(_G_baddie01_05)
                            733 ;src/entities/enemies.c:124: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2751 DD 6E E8      [19]  734 	ld	l,-24 (ix)
   2754 DD 66 E9      [19]  735 	ld	h,-23 (ix)
   2757 36 B1         [10]  736 	ld	(hl),#<(_G_baddie01_06)
   2759 23            [ 6]  737 	inc	hl
   275A 36 3C         [10]  738 	ld	(hl),#>(_G_baddie01_06)
                            739 ;src/entities/enemies.c:125: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   275C DD 6E E6      [19]  740 	ld	l,-26 (ix)
   275F DD 66 E7      [19]  741 	ld	h,-25 (ix)
   2762 36 01         [10]  742 	ld	(hl),#<(_G_baddie01_07)
   2764 23            [ 6]  743 	inc	hl
   2765 36 3D         [10]  744 	ld	(hl),#>(_G_baddie01_07)
                            745 ;src/entities/enemies.c:126: enemies[k].movement=1;
   2767 DD 6E E4      [19]  746 	ld	l,-28 (ix)
   276A DD 66 E5      [19]  747 	ld	h,-27 (ix)
   276D 36 01         [10]  748 	ld	(hl),#0x01
                            749 ;src/entities/enemies.c:127: enemies[k].stage=0;
   276F DD 6E E2      [19]  750 	ld	l,-30 (ix)
   2772 DD 66 E3      [19]  751 	ld	h,-29 (ix)
   2775 36 00         [10]  752 	ld	(hl),#0x00
                            753 ;src/entities/enemies.c:128: enemies[k].stage_step=0;
   2777 E1            [10]  754 	pop	hl
   2778 E5            [11]  755 	push	hl
   2779 36 00         [10]  756 	ld	(hl),#0x00
                            757 ;src/entities/enemies.c:130: }
   277B                     758 00107$:
                            759 ;src/entities/enemies.c:131: active_enemies++;
   277B 21 65 60      [10]  760 	ld	hl, #_active_enemies+0
   277E 34            [11]  761 	inc	(hl)
   277F                     762 00110$:
   277F DD F9         [10]  763 	ld	sp, ix
   2781 DD E1         [14]  764 	pop	ix
   2783 C9            [10]  765 	ret
                            766 ;src/entities/enemies.c:137: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            767 ;	---------------------------------
                            768 ; Function create_enemy_group
                            769 ; ---------------------------------
   2784                     770 _create_enemy_group::
   2784 DD E5         [15]  771 	push	ix
   2786 DD 21 00 00   [14]  772 	ld	ix,#0
   278A DD 39         [15]  773 	add	ix,sp
                            774 ;src/entities/enemies.c:139: if (active_groups < MAX_ENEMY_GROUPS){
   278C 3A 86 60      [13]  775 	ld	a,(#_active_groups + 0)
   278F D6 04         [ 7]  776 	sub	a, #0x04
   2791 30 4E         [12]  777 	jr	NC,00106$
                            778 ;src/entities/enemies.c:141: while (groups[k].active){
   2793 16 00         [ 7]  779 	ld	d,#0x00
   2795                     780 00101$:
   2795 6A            [ 4]  781 	ld	l,d
   2796 26 00         [ 7]  782 	ld	h,#0x00
   2798 29            [11]  783 	add	hl, hl
   2799 29            [11]  784 	add	hl, hl
   279A 29            [11]  785 	add	hl, hl
   279B 3E 66         [ 7]  786 	ld	a,#<(_groups)
   279D 85            [ 4]  787 	add	a, l
   279E 4F            [ 4]  788 	ld	c,a
   279F 3E 60         [ 7]  789 	ld	a,#>(_groups)
   27A1 8C            [ 4]  790 	adc	a, h
   27A2 47            [ 4]  791 	ld	b,a
   27A3 0A            [ 7]  792 	ld	a,(bc)
   27A4 B7            [ 4]  793 	or	a, a
   27A5 28 03         [12]  794 	jr	Z,00103$
                            795 ;src/entities/enemies.c:142: k++;
   27A7 14            [ 4]  796 	inc	d
   27A8 18 EB         [12]  797 	jr	00101$
   27AA                     798 00103$:
                            799 ;src/entities/enemies.c:144: groups[k].active=1;
   27AA 3E 01         [ 7]  800 	ld	a,#0x01
   27AC 02            [ 7]  801 	ld	(bc),a
                            802 ;src/entities/enemies.c:145: groups[k].x=x;
   27AD 69            [ 4]  803 	ld	l, c
   27AE 60            [ 4]  804 	ld	h, b
   27AF 23            [ 6]  805 	inc	hl
   27B0 DD 7E 04      [19]  806 	ld	a,4 (ix)
   27B3 77            [ 7]  807 	ld	(hl),a
   27B4 23            [ 6]  808 	inc	hl
   27B5 DD 7E 05      [19]  809 	ld	a,5 (ix)
   27B8 77            [ 7]  810 	ld	(hl),a
                            811 ;src/entities/enemies.c:146: groups[k].y=y;
   27B9 69            [ 4]  812 	ld	l, c
   27BA 60            [ 4]  813 	ld	h, b
   27BB 23            [ 6]  814 	inc	hl
   27BC 23            [ 6]  815 	inc	hl
   27BD 23            [ 6]  816 	inc	hl
   27BE DD 7E 06      [19]  817 	ld	a,6 (ix)
   27C1 77            [ 7]  818 	ld	(hl),a
   27C2 23            [ 6]  819 	inc	hl
   27C3 DD 7E 07      [19]  820 	ld	a,7 (ix)
   27C6 77            [ 7]  821 	ld	(hl),a
                            822 ;src/entities/enemies.c:147: groups[k].enemy_type=type;
   27C7 21 05 00      [10]  823 	ld	hl,#0x0005
   27CA 09            [11]  824 	add	hl,bc
   27CB DD 7E 08      [19]  825 	ld	a,8 (ix)
   27CE 77            [ 7]  826 	ld	(hl),a
                            827 ;src/entities/enemies.c:148: groups[k].num_enemies=num_enemies;
   27CF 21 06 00      [10]  828 	ld	hl,#0x0006
   27D2 09            [11]  829 	add	hl,bc
   27D3 DD 7E 09      [19]  830 	ld	a,9 (ix)
   27D6 77            [ 7]  831 	ld	(hl),a
                            832 ;src/entities/enemies.c:149: groups[k].sleep=ENEMY_GAP;
   27D7 21 07 00      [10]  833 	ld	hl,#0x0007
   27DA 09            [11]  834 	add	hl,bc
   27DB 36 03         [10]  835 	ld	(hl),#0x03
                            836 ;src/entities/enemies.c:150: active_groups++;
   27DD 21 86 60      [10]  837 	ld	hl, #_active_groups+0
   27E0 34            [11]  838 	inc	(hl)
   27E1                     839 00106$:
   27E1 DD E1         [14]  840 	pop	ix
   27E3 C9            [10]  841 	ret
                            842 ;src/entities/enemies.c:158: void update_enemies(){
                            843 ;	---------------------------------
                            844 ; Function update_enemies
                            845 ; ---------------------------------
   27E4                     846 _update_enemies::
   27E4 DD E5         [15]  847 	push	ix
   27E6 DD 21 00 00   [14]  848 	ld	ix,#0
   27EA DD 39         [15]  849 	add	ix,sp
   27EC 21 EB FF      [10]  850 	ld	hl,#-21
   27EF 39            [11]  851 	add	hl,sp
   27F0 F9            [ 6]  852 	ld	sp,hl
                            853 ;src/entities/enemies.c:162: if (active_enemies>0){
   27F1 3A 65 60      [13]  854 	ld	a,(#_active_enemies + 0)
   27F4 B7            [ 4]  855 	or	a, a
   27F5 CA AC 2C      [10]  856 	jp	Z,00112$
                            857 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   27F8 DD 36 EB 00   [19]  858 	ld	-21 (ix),#0x00
   27FC DD 36 FE 00   [19]  859 	ld	-2 (ix),#0x00
   2800 DD 36 FF 00   [19]  860 	ld	-1 (ix),#0x00
   2804 DD 36 FC 00   [19]  861 	ld	-4 (ix),#0x00
   2808 DD 36 FD 00   [19]  862 	ld	-3 (ix),#0x00
   280C                     863 00124$:
                            864 ;src/entities/enemies.c:164: if (enemies[i].active){
   280C 3E 2D         [ 7]  865 	ld	a,#<(_enemies)
   280E DD 86 FC      [19]  866 	add	a, -4 (ix)
   2811 DD 77 FA      [19]  867 	ld	-6 (ix),a
   2814 3E 5C         [ 7]  868 	ld	a,#>(_enemies)
   2816 DD 8E FD      [19]  869 	adc	a, -3 (ix)
   2819 DD 77 FB      [19]  870 	ld	-5 (ix),a
   281C DD 4E FA      [19]  871 	ld	c,-6 (ix)
   281F DD 46 FB      [19]  872 	ld	b,-5 (ix)
   2822 C5            [11]  873 	push	bc
   2823 FD E1         [14]  874 	pop	iy
   2825 FD 7E 17      [19]  875 	ld	a,23 (iy)
   2828 DD 77 F9      [19]  876 	ld	-7 (ix), a
   282B B7            [ 4]  877 	or	a, a
   282C CA 81 2C      [10]  878 	jp	Z,00125$
                            879 ;src/entities/enemies.c:165: if (enemies[i].movement<99){
   282F DD 7E FA      [19]  880 	ld	a,-6 (ix)
   2832 C6 1D         [ 7]  881 	add	a, #0x1D
   2834 DD 77 F7      [19]  882 	ld	-9 (ix),a
   2837 DD 7E FB      [19]  883 	ld	a,-5 (ix)
   283A CE 00         [ 7]  884 	adc	a, #0x00
   283C DD 77 F8      [19]  885 	ld	-8 (ix),a
   283F DD 6E F7      [19]  886 	ld	l,-9 (ix)
   2842 DD 66 F8      [19]  887 	ld	h,-8 (ix)
   2845 56            [ 7]  888 	ld	d,(hl)
   2846 7A            [ 4]  889 	ld	a,d
   2847 D6 63         [ 7]  890 	sub	a, #0x63
   2849 D2 81 2C      [10]  891 	jp	NC,00125$
                            892 ;src/entities/enemies.c:166: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   284C DD 7E FA      [19]  893 	ld	a,-6 (ix)
   284F C6 1F         [ 7]  894 	add	a, #0x1F
   2851 DD 77 F5      [19]  895 	ld	-11 (ix),a
   2854 DD 7E FB      [19]  896 	ld	a,-5 (ix)
   2857 CE 00         [ 7]  897 	adc	a, #0x00
   2859 DD 77 F6      [19]  898 	ld	-10 (ix),a
   285C DD 6E F5      [19]  899 	ld	l,-11 (ix)
   285F DD 66 F6      [19]  900 	ld	h,-10 (ix)
   2862 5E            [ 7]  901 	ld	e,(hl)
   2863 4A            [ 4]  902 	ld	c,d
   2864 06 00         [ 7]  903 	ld	b,#0x00
   2866 69            [ 4]  904 	ld	l, c
   2867 60            [ 4]  905 	ld	h, b
   2868 29            [11]  906 	add	hl, hl
   2869 29            [11]  907 	add	hl, hl
   286A 29            [11]  908 	add	hl, hl
   286B 29            [11]  909 	add	hl, hl
   286C 29            [11]  910 	add	hl, hl
   286D 09            [11]  911 	add	hl, bc
   286E 01 29 33      [10]  912 	ld	bc,#_movements
   2871 09            [11]  913 	add	hl,bc
   2872 23            [ 6]  914 	inc	hl
   2873 45            [ 4]  915 	ld	b,l
   2874 54            [ 4]  916 	ld	d,h
   2875 DD 7E FA      [19]  917 	ld	a,-6 (ix)
   2878 C6 1E         [ 7]  918 	add	a, #0x1E
   287A DD 77 F3      [19]  919 	ld	-13 (ix),a
   287D DD 7E FB      [19]  920 	ld	a,-5 (ix)
   2880 CE 00         [ 7]  921 	adc	a, #0x00
   2882 DD 77 F4      [19]  922 	ld	-12 (ix),a
   2885 DD 6E F3      [19]  923 	ld	l,-13 (ix)
   2888 DD 66 F4      [19]  924 	ld	h,-12 (ix)
   288B 7E            [ 7]  925 	ld	a,(hl)
   288C DD 77 F9      [19]  926 	ld	-7 (ix), a
   288F 87            [ 4]  927 	add	a, a
   2890 87            [ 4]  928 	add	a, a
   2891 80            [ 4]  929 	add	a,b
   2892 DD 77 F1      [19]  930 	ld	-15 (ix),a
   2895 7A            [ 4]  931 	ld	a,d
   2896 CE 00         [ 7]  932 	adc	a, #0x00
   2898 DD 77 F2      [19]  933 	ld	-14 (ix),a
   289B DD 6E F1      [19]  934 	ld	l,-15 (ix)
   289E DD 66 F2      [19]  935 	ld	h,-14 (ix)
   28A1 23            [ 6]  936 	inc	hl
   28A2 23            [ 6]  937 	inc	hl
   28A3 23            [ 6]  938 	inc	hl
   28A4 66            [ 7]  939 	ld	h,(hl)
   28A5 7B            [ 4]  940 	ld	a,e
   28A6 94            [ 4]  941 	sub	a, h
   28A7 D2 17 2A      [10]  942 	jp	NC,00104$
                            943 ;src/entities/enemies.c:167: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   28AA DD 7E FA      [19]  944 	ld	a,-6 (ix)
   28AD C6 16         [ 7]  945 	add	a, #0x16
   28AF DD 77 EF      [19]  946 	ld	-17 (ix),a
   28B2 DD 7E FB      [19]  947 	ld	a,-5 (ix)
   28B5 CE 00         [ 7]  948 	adc	a, #0x00
   28B7 DD 77 F0      [19]  949 	ld	-16 (ix),a
   28BA DD 6E F1      [19]  950 	ld	l,-15 (ix)
   28BD DD 66 F2      [19]  951 	ld	h,-14 (ix)
   28C0 7E            [ 7]  952 	ld	a,(hl)
   28C1 DD 77 F1      [19]  953 	ld	-15 (ix),a
   28C4 DD 6E EF      [19]  954 	ld	l,-17 (ix)
   28C7 DD 66 F0      [19]  955 	ld	h,-16 (ix)
   28CA DD 7E F1      [19]  956 	ld	a,-15 (ix)
   28CD 77            [ 7]  957 	ld	(hl),a
                            958 ;src/entities/enemies.c:168: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   28CE DD 7E FA      [19]  959 	ld	a,-6 (ix)
   28D1 C6 10         [ 7]  960 	add	a, #0x10
   28D3 DD 77 EF      [19]  961 	ld	-17 (ix),a
   28D6 DD 7E FB      [19]  962 	ld	a,-5 (ix)
   28D9 CE 00         [ 7]  963 	adc	a, #0x00
   28DB DD 77 F0      [19]  964 	ld	-16 (ix),a
   28DE DD 6E EF      [19]  965 	ld	l,-17 (ix)
   28E1 DD 66 F0      [19]  966 	ld	h,-16 (ix)
   28E4 7E            [ 7]  967 	ld	a,(hl)
   28E5 DD 77 F1      [19]  968 	ld	-15 (ix),a
   28E8 23            [ 6]  969 	inc	hl
   28E9 7E            [ 7]  970 	ld	a,(hl)
   28EA DD 77 F2      [19]  971 	ld	-14 (ix),a
   28ED DD 6E F7      [19]  972 	ld	l,-9 (ix)
   28F0 DD 66 F8      [19]  973 	ld	h,-8 (ix)
   28F3 4E            [ 7]  974 	ld	c, (hl)
   28F4 06 00         [ 7]  975 	ld	b,#0x00
   28F6 69            [ 4]  976 	ld	l, c
   28F7 60            [ 4]  977 	ld	h, b
   28F8 29            [11]  978 	add	hl, hl
   28F9 29            [11]  979 	add	hl, hl
   28FA 29            [11]  980 	add	hl, hl
   28FB 29            [11]  981 	add	hl, hl
   28FC 29            [11]  982 	add	hl, hl
   28FD 09            [11]  983 	add	hl, bc
   28FE 3E 29         [ 7]  984 	ld	a,#<(_movements)
   2900 85            [ 4]  985 	add	a, l
   2901 DD 77 ED      [19]  986 	ld	-19 (ix),a
   2904 3E 33         [ 7]  987 	ld	a,#>(_movements)
   2906 8C            [ 4]  988 	adc	a, h
   2907 DD 77 EE      [19]  989 	ld	-18 (ix),a
   290A DD 34 ED      [23]  990 	inc	-19 (ix)
   290D 20 03         [12]  991 	jr	NZ,00176$
   290F DD 34 EE      [23]  992 	inc	-18 (ix)
   2912                     993 00176$:
   2912 DD 6E F3      [19]  994 	ld	l,-13 (ix)
   2915 DD 66 F4      [19]  995 	ld	h,-12 (ix)
   2918 7E            [ 7]  996 	ld	a,(hl)
   2919 DD 77 EC      [19]  997 	ld	-20 (ix), a
   291C 87            [ 4]  998 	add	a, a
   291D 87            [ 4]  999 	add	a, a
   291E 67            [ 4] 1000 	ld	h,a
   291F DD 7E ED      [19] 1001 	ld	a,-19 (ix)
   2922 84            [ 4] 1002 	add	a, h
   2923 DD 77 ED      [19] 1003 	ld	-19 (ix),a
   2926 DD 7E EE      [19] 1004 	ld	a,-18 (ix)
   2929 CE 00         [ 7] 1005 	adc	a, #0x00
   292B DD 77 EE      [19] 1006 	ld	-18 (ix),a
   292E DD 6E ED      [19] 1007 	ld	l,-19 (ix)
   2931 DD 66 EE      [19] 1008 	ld	h,-18 (ix)
   2934 23            [ 6] 1009 	inc	hl
   2935 7E            [ 7] 1010 	ld	a,(hl)
   2936 DD 77 EC      [19] 1011 	ld	-20 (ix), a
   2939 DD 77 ED      [19] 1012 	ld	-19 (ix),a
   293C DD 7E EC      [19] 1013 	ld	a,-20 (ix)
   293F 17            [ 4] 1014 	rla
   2940 9F            [ 4] 1015 	sbc	a, a
   2941 DD 77 EE      [19] 1016 	ld	-18 (ix),a
   2944 DD 7E F1      [19] 1017 	ld	a,-15 (ix)
   2947 DD 86 ED      [19] 1018 	add	a, -19 (ix)
   294A DD 77 ED      [19] 1019 	ld	-19 (ix),a
   294D DD 7E F2      [19] 1020 	ld	a,-14 (ix)
   2950 DD 8E EE      [19] 1021 	adc	a, -18 (ix)
   2953 DD 77 EE      [19] 1022 	ld	-18 (ix),a
   2956 DD 6E EF      [19] 1023 	ld	l,-17 (ix)
   2959 DD 66 F0      [19] 1024 	ld	h,-16 (ix)
   295C DD 7E ED      [19] 1025 	ld	a,-19 (ix)
   295F 77            [ 7] 1026 	ld	(hl),a
   2960 23            [ 6] 1027 	inc	hl
   2961 DD 7E EE      [19] 1028 	ld	a,-18 (ix)
   2964 77            [ 7] 1029 	ld	(hl),a
                           1030 ;src/entities/enemies.c:169: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2965 DD 7E FA      [19] 1031 	ld	a,-6 (ix)
   2968 C6 12         [ 7] 1032 	add	a, #0x12
   296A DD 77 ED      [19] 1033 	ld	-19 (ix),a
   296D DD 7E FB      [19] 1034 	ld	a,-5 (ix)
   2970 CE 00         [ 7] 1035 	adc	a, #0x00
   2972 DD 77 EE      [19] 1036 	ld	-18 (ix),a
   2975 DD 6E ED      [19] 1037 	ld	l,-19 (ix)
   2978 DD 66 EE      [19] 1038 	ld	h,-18 (ix)
   297B 7E            [ 7] 1039 	ld	a,(hl)
   297C DD 77 EF      [19] 1040 	ld	-17 (ix),a
   297F 23            [ 6] 1041 	inc	hl
   2980 7E            [ 7] 1042 	ld	a,(hl)
   2981 DD 77 F0      [19] 1043 	ld	-16 (ix),a
   2984 DD 6E F7      [19] 1044 	ld	l,-9 (ix)
   2987 DD 66 F8      [19] 1045 	ld	h,-8 (ix)
   298A 4E            [ 7] 1046 	ld	c, (hl)
   298B 06 00         [ 7] 1047 	ld	b,#0x00
   298D 69            [ 4] 1048 	ld	l, c
   298E 60            [ 4] 1049 	ld	h, b
   298F 29            [11] 1050 	add	hl, hl
   2990 29            [11] 1051 	add	hl, hl
   2991 29            [11] 1052 	add	hl, hl
   2992 29            [11] 1053 	add	hl, hl
   2993 29            [11] 1054 	add	hl, hl
   2994 09            [11] 1055 	add	hl, bc
   2995 3E 29         [ 7] 1056 	ld	a,#<(_movements)
   2997 85            [ 4] 1057 	add	a, l
   2998 DD 77 F1      [19] 1058 	ld	-15 (ix),a
   299B 3E 33         [ 7] 1059 	ld	a,#>(_movements)
   299D 8C            [ 4] 1060 	adc	a, h
   299E DD 77 F2      [19] 1061 	ld	-14 (ix),a
   29A1 DD 34 F1      [23] 1062 	inc	-15 (ix)
   29A4 20 03         [12] 1063 	jr	NZ,00177$
   29A6 DD 34 F2      [23] 1064 	inc	-14 (ix)
   29A9                    1065 00177$:
   29A9 DD 6E F3      [19] 1066 	ld	l,-13 (ix)
   29AC DD 66 F4      [19] 1067 	ld	h,-12 (ix)
   29AF 7E            [ 7] 1068 	ld	a,(hl)
   29B0 DD 77 EC      [19] 1069 	ld	-20 (ix), a
   29B3 87            [ 4] 1070 	add	a, a
   29B4 87            [ 4] 1071 	add	a, a
   29B5 67            [ 4] 1072 	ld	h,a
   29B6 DD 7E F1      [19] 1073 	ld	a,-15 (ix)
   29B9 84            [ 4] 1074 	add	a, h
   29BA DD 77 F1      [19] 1075 	ld	-15 (ix),a
   29BD DD 7E F2      [19] 1076 	ld	a,-14 (ix)
   29C0 CE 00         [ 7] 1077 	adc	a, #0x00
   29C2 DD 77 F2      [19] 1078 	ld	-14 (ix),a
   29C5 DD 6E F1      [19] 1079 	ld	l,-15 (ix)
   29C8 DD 66 F2      [19] 1080 	ld	h,-14 (ix)
   29CB 23            [ 6] 1081 	inc	hl
   29CC 23            [ 6] 1082 	inc	hl
   29CD 7E            [ 7] 1083 	ld	a,(hl)
   29CE DD 77 EC      [19] 1084 	ld	-20 (ix), a
   29D1 DD 77 F1      [19] 1085 	ld	-15 (ix),a
   29D4 DD 7E EC      [19] 1086 	ld	a,-20 (ix)
   29D7 17            [ 4] 1087 	rla
   29D8 9F            [ 4] 1088 	sbc	a, a
   29D9 DD 77 F2      [19] 1089 	ld	-14 (ix),a
   29DC DD 7E EF      [19] 1090 	ld	a,-17 (ix)
   29DF DD 86 F1      [19] 1091 	add	a, -15 (ix)
   29E2 DD 77 EF      [19] 1092 	ld	-17 (ix),a
   29E5 DD 7E F0      [19] 1093 	ld	a,-16 (ix)
   29E8 DD 8E F2      [19] 1094 	adc	a, -14 (ix)
   29EB DD 77 F0      [19] 1095 	ld	-16 (ix),a
   29EE DD 6E ED      [19] 1096 	ld	l,-19 (ix)
   29F1 DD 66 EE      [19] 1097 	ld	h,-18 (ix)
   29F4 DD 7E EF      [19] 1098 	ld	a,-17 (ix)
   29F7 77            [ 7] 1099 	ld	(hl),a
   29F8 23            [ 6] 1100 	inc	hl
   29F9 DD 7E F0      [19] 1101 	ld	a,-16 (ix)
   29FC 77            [ 7] 1102 	ld	(hl),a
                           1103 ;src/entities/enemies.c:170: enemies[i].stage_step++;
   29FD DD 6E F5      [19] 1104 	ld	l,-11 (ix)
   2A00 DD 66 F6      [19] 1105 	ld	h,-10 (ix)
   2A03 7E            [ 7] 1106 	ld	a,(hl)
   2A04 DD 77 EC      [19] 1107 	ld	-20 (ix),a
   2A07 DD 34 EC      [23] 1108 	inc	-20 (ix)
   2A0A DD 6E F5      [19] 1109 	ld	l,-11 (ix)
   2A0D DD 66 F6      [19] 1110 	ld	h,-10 (ix)
   2A10 DD 7E EC      [19] 1111 	ld	a,-20 (ix)
   2A13 77            [ 7] 1112 	ld	(hl),a
   2A14 C3 81 2C      [10] 1113 	jp	00125$
   2A17                    1114 00104$:
                           1115 ;src/entities/enemies.c:172: enemies[i].stage++;
   2A17 DD 7E F9      [19] 1116 	ld	a,-7 (ix)
   2A1A 3C            [ 4] 1117 	inc	a
   2A1B DD 77 EC      [19] 1118 	ld	-20 (ix),a
   2A1E DD 6E F3      [19] 1119 	ld	l,-13 (ix)
   2A21 DD 66 F4      [19] 1120 	ld	h,-12 (ix)
   2A24 DD 7E EC      [19] 1121 	ld	a,-20 (ix)
   2A27 77            [ 7] 1122 	ld	(hl),a
                           1123 ;src/entities/enemies.c:173: enemies[i].stage_step=0;
   2A28 DD 6E F5      [19] 1124 	ld	l,-11 (ix)
   2A2B DD 66 F6      [19] 1125 	ld	h,-10 (ix)
   2A2E 36 00         [10] 1126 	ld	(hl),#0x00
                           1127 ;src/entities/enemies.c:174: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   2A30 DD 6E F7      [19] 1128 	ld	l,-9 (ix)
   2A33 DD 66 F8      [19] 1129 	ld	h,-8 (ix)
   2A36 7E            [ 7] 1130 	ld	a,(hl)
   2A37 DD 77 ED      [19] 1131 	ld	-19 (ix), a
   2A3A 4F            [ 4] 1132 	ld	c, a
   2A3B 06 00         [ 7] 1133 	ld	b,#0x00
   2A3D 69            [ 4] 1134 	ld	l, c
   2A3E 60            [ 4] 1135 	ld	h, b
   2A3F 29            [11] 1136 	add	hl, hl
   2A40 29            [11] 1137 	add	hl, hl
   2A41 29            [11] 1138 	add	hl, hl
   2A42 29            [11] 1139 	add	hl, hl
   2A43 29            [11] 1140 	add	hl, hl
   2A44 09            [11] 1141 	add	hl, bc
   2A45 DD 75 ED      [19] 1142 	ld	-19 (ix),l
   2A48 DD 74 EE      [19] 1143 	ld	-18 (ix),h
   2A4B 3E 29         [ 7] 1144 	ld	a,#<(_movements)
   2A4D DD 86 ED      [19] 1145 	add	a, -19 (ix)
   2A50 DD 77 ED      [19] 1146 	ld	-19 (ix),a
   2A53 3E 33         [ 7] 1147 	ld	a,#>(_movements)
   2A55 DD 8E EE      [19] 1148 	adc	a, -18 (ix)
   2A58 DD 77 EE      [19] 1149 	ld	-18 (ix),a
   2A5B DD 6E ED      [19] 1150 	ld	l,-19 (ix)
   2A5E DD 66 EE      [19] 1151 	ld	h,-18 (ix)
   2A61 7E            [ 7] 1152 	ld	a,(hl)
   2A62 DD 77 ED      [19] 1153 	ld	-19 (ix),a
   2A65 DD 7E EC      [19] 1154 	ld	a,-20 (ix)
   2A68 DD 96 ED      [19] 1155 	sub	a, -19 (ix)
   2A6B 38 08         [12] 1156 	jr	C,00102$
                           1157 ;src/entities/enemies.c:175: enemies[i].stage=0;
   2A6D DD 6E F3      [19] 1158 	ld	l,-13 (ix)
   2A70 DD 66 F4      [19] 1159 	ld	h,-12 (ix)
   2A73 36 00         [10] 1160 	ld	(hl),#0x00
   2A75                    1161 00102$:
                           1162 ;src/entities/enemies.c:177: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2A75 3E 2D         [ 7] 1163 	ld	a,#<(_enemies)
   2A77 DD 86 FE      [19] 1164 	add	a, -2 (ix)
   2A7A DD 77 ED      [19] 1165 	ld	-19 (ix),a
   2A7D 3E 5C         [ 7] 1166 	ld	a,#>(_enemies)
   2A7F DD 8E FF      [19] 1167 	adc	a, -1 (ix)
   2A82 DD 77 EE      [19] 1168 	ld	-18 (ix),a
   2A85 DD 7E ED      [19] 1169 	ld	a,-19 (ix)
   2A88 C6 16         [ 7] 1170 	add	a, #0x16
   2A8A DD 77 EF      [19] 1171 	ld	-17 (ix),a
   2A8D DD 7E EE      [19] 1172 	ld	a,-18 (ix)
   2A90 CE 00         [ 7] 1173 	adc	a, #0x00
   2A92 DD 77 F0      [19] 1174 	ld	-16 (ix),a
   2A95 DD 7E ED      [19] 1175 	ld	a,-19 (ix)
   2A98 C6 1D         [ 7] 1176 	add	a, #0x1D
   2A9A DD 77 F1      [19] 1177 	ld	-15 (ix),a
   2A9D DD 7E EE      [19] 1178 	ld	a,-18 (ix)
   2AA0 CE 00         [ 7] 1179 	adc	a, #0x00
   2AA2 DD 77 F2      [19] 1180 	ld	-14 (ix),a
   2AA5 DD 6E F1      [19] 1181 	ld	l,-15 (ix)
   2AA8 DD 66 F2      [19] 1182 	ld	h,-14 (ix)
   2AAB 4E            [ 7] 1183 	ld	c, (hl)
   2AAC 06 00         [ 7] 1184 	ld	b,#0x00
   2AAE 69            [ 4] 1185 	ld	l, c
   2AAF 60            [ 4] 1186 	ld	h, b
   2AB0 29            [11] 1187 	add	hl, hl
   2AB1 29            [11] 1188 	add	hl, hl
   2AB2 29            [11] 1189 	add	hl, hl
   2AB3 29            [11] 1190 	add	hl, hl
   2AB4 29            [11] 1191 	add	hl, hl
   2AB5 09            [11] 1192 	add	hl, bc
   2AB6 DD 75 F3      [19] 1193 	ld	-13 (ix),l
   2AB9 DD 74 F4      [19] 1194 	ld	-12 (ix),h
   2ABC 3E 29         [ 7] 1195 	ld	a,#<(_movements)
   2ABE DD 86 F3      [19] 1196 	add	a, -13 (ix)
   2AC1 DD 77 F3      [19] 1197 	ld	-13 (ix),a
   2AC4 3E 33         [ 7] 1198 	ld	a,#>(_movements)
   2AC6 DD 8E F4      [19] 1199 	adc	a, -12 (ix)
   2AC9 DD 77 F4      [19] 1200 	ld	-12 (ix),a
   2ACC DD 34 F3      [23] 1201 	inc	-13 (ix)
   2ACF 20 03         [12] 1202 	jr	NZ,00178$
   2AD1 DD 34 F4      [23] 1203 	inc	-12 (ix)
   2AD4                    1204 00178$:
   2AD4 DD 7E ED      [19] 1205 	ld	a,-19 (ix)
   2AD7 C6 1E         [ 7] 1206 	add	a, #0x1E
   2AD9 DD 77 F5      [19] 1207 	ld	-11 (ix),a
   2ADC DD 7E EE      [19] 1208 	ld	a,-18 (ix)
   2ADF CE 00         [ 7] 1209 	adc	a, #0x00
   2AE1 DD 77 F6      [19] 1210 	ld	-10 (ix),a
   2AE4 DD 6E F5      [19] 1211 	ld	l,-11 (ix)
   2AE7 DD 66 F6      [19] 1212 	ld	h,-10 (ix)
   2AEA 7E            [ 7] 1213 	ld	a,(hl)
   2AEB 87            [ 4] 1214 	add	a, a
   2AEC 87            [ 4] 1215 	add	a, a
   2AED 67            [ 4] 1216 	ld	h,a
   2AEE DD 7E F3      [19] 1217 	ld	a,-13 (ix)
   2AF1 84            [ 4] 1218 	add	a, h
   2AF2 DD 77 F3      [19] 1219 	ld	-13 (ix),a
   2AF5 DD 7E F4      [19] 1220 	ld	a,-12 (ix)
   2AF8 CE 00         [ 7] 1221 	adc	a, #0x00
   2AFA DD 77 F4      [19] 1222 	ld	-12 (ix),a
   2AFD DD 6E F3      [19] 1223 	ld	l,-13 (ix)
   2B00 DD 66 F4      [19] 1224 	ld	h,-12 (ix)
   2B03 7E            [ 7] 1225 	ld	a,(hl)
   2B04 DD 77 EC      [19] 1226 	ld	-20 (ix),a
   2B07 DD 6E EF      [19] 1227 	ld	l,-17 (ix)
   2B0A DD 66 F0      [19] 1228 	ld	h,-16 (ix)
   2B0D DD 7E EC      [19] 1229 	ld	a,-20 (ix)
   2B10 77            [ 7] 1230 	ld	(hl),a
                           1231 ;src/entities/enemies.c:178: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2B11 DD 7E ED      [19] 1232 	ld	a,-19 (ix)
   2B14 C6 10         [ 7] 1233 	add	a, #0x10
   2B16 DD 77 EF      [19] 1234 	ld	-17 (ix),a
   2B19 DD 7E EE      [19] 1235 	ld	a,-18 (ix)
   2B1C CE 00         [ 7] 1236 	adc	a, #0x00
   2B1E DD 77 F0      [19] 1237 	ld	-16 (ix),a
   2B21 DD 6E EF      [19] 1238 	ld	l,-17 (ix)
   2B24 DD 66 F0      [19] 1239 	ld	h,-16 (ix)
   2B27 7E            [ 7] 1240 	ld	a,(hl)
   2B28 DD 77 F3      [19] 1241 	ld	-13 (ix),a
   2B2B 23            [ 6] 1242 	inc	hl
   2B2C 7E            [ 7] 1243 	ld	a,(hl)
   2B2D DD 77 F4      [19] 1244 	ld	-12 (ix),a
   2B30 DD 6E F1      [19] 1245 	ld	l,-15 (ix)
   2B33 DD 66 F2      [19] 1246 	ld	h,-14 (ix)
   2B36 4E            [ 7] 1247 	ld	c, (hl)
   2B37 06 00         [ 7] 1248 	ld	b,#0x00
   2B39 69            [ 4] 1249 	ld	l, c
   2B3A 60            [ 4] 1250 	ld	h, b
   2B3B 29            [11] 1251 	add	hl, hl
   2B3C 29            [11] 1252 	add	hl, hl
   2B3D 29            [11] 1253 	add	hl, hl
   2B3E 29            [11] 1254 	add	hl, hl
   2B3F 29            [11] 1255 	add	hl, hl
   2B40 09            [11] 1256 	add	hl, bc
   2B41 DD 75 F7      [19] 1257 	ld	-9 (ix),l
   2B44 DD 74 F8      [19] 1258 	ld	-8 (ix),h
   2B47 3E 29         [ 7] 1259 	ld	a,#<(_movements)
   2B49 DD 86 F7      [19] 1260 	add	a, -9 (ix)
   2B4C DD 77 F7      [19] 1261 	ld	-9 (ix),a
   2B4F 3E 33         [ 7] 1262 	ld	a,#>(_movements)
   2B51 DD 8E F8      [19] 1263 	adc	a, -8 (ix)
   2B54 DD 77 F8      [19] 1264 	ld	-8 (ix),a
   2B57 DD 34 F7      [23] 1265 	inc	-9 (ix)
   2B5A 20 03         [12] 1266 	jr	NZ,00179$
   2B5C DD 34 F8      [23] 1267 	inc	-8 (ix)
   2B5F                    1268 00179$:
   2B5F DD 6E F5      [19] 1269 	ld	l,-11 (ix)
   2B62 DD 66 F6      [19] 1270 	ld	h,-10 (ix)
   2B65 7E            [ 7] 1271 	ld	a,(hl)
   2B66 DD 77 EC      [19] 1272 	ld	-20 (ix), a
   2B69 87            [ 4] 1273 	add	a, a
   2B6A 87            [ 4] 1274 	add	a, a
   2B6B 67            [ 4] 1275 	ld	h,a
   2B6C DD 7E F7      [19] 1276 	ld	a,-9 (ix)
   2B6F 84            [ 4] 1277 	add	a, h
   2B70 DD 77 F7      [19] 1278 	ld	-9 (ix),a
   2B73 DD 7E F8      [19] 1279 	ld	a,-8 (ix)
   2B76 CE 00         [ 7] 1280 	adc	a, #0x00
   2B78 DD 77 F8      [19] 1281 	ld	-8 (ix),a
   2B7B DD 6E F7      [19] 1282 	ld	l,-9 (ix)
   2B7E DD 66 F8      [19] 1283 	ld	h,-8 (ix)
   2B81 23            [ 6] 1284 	inc	hl
   2B82 7E            [ 7] 1285 	ld	a,(hl)
   2B83 DD 77 EC      [19] 1286 	ld	-20 (ix), a
   2B86 DD 77 F7      [19] 1287 	ld	-9 (ix),a
   2B89 DD 7E EC      [19] 1288 	ld	a,-20 (ix)
   2B8C 17            [ 4] 1289 	rla
   2B8D 9F            [ 4] 1290 	sbc	a, a
   2B8E DD 77 F8      [19] 1291 	ld	-8 (ix),a
   2B91 DD 7E F3      [19] 1292 	ld	a,-13 (ix)
   2B94 DD 86 F7      [19] 1293 	add	a, -9 (ix)
   2B97 DD 77 F3      [19] 1294 	ld	-13 (ix),a
   2B9A DD 7E F4      [19] 1295 	ld	a,-12 (ix)
   2B9D DD 8E F8      [19] 1296 	adc	a, -8 (ix)
   2BA0 DD 77 F4      [19] 1297 	ld	-12 (ix),a
   2BA3 DD 6E EF      [19] 1298 	ld	l,-17 (ix)
   2BA6 DD 66 F0      [19] 1299 	ld	h,-16 (ix)
   2BA9 DD 7E F3      [19] 1300 	ld	a,-13 (ix)
   2BAC 77            [ 7] 1301 	ld	(hl),a
   2BAD 23            [ 6] 1302 	inc	hl
   2BAE DD 7E F4      [19] 1303 	ld	a,-12 (ix)
   2BB1 77            [ 7] 1304 	ld	(hl),a
                           1305 ;src/entities/enemies.c:179: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2BB2 DD 7E ED      [19] 1306 	ld	a,-19 (ix)
   2BB5 C6 12         [ 7] 1307 	add	a, #0x12
   2BB7 DD 77 EF      [19] 1308 	ld	-17 (ix),a
   2BBA DD 7E EE      [19] 1309 	ld	a,-18 (ix)
   2BBD CE 00         [ 7] 1310 	adc	a, #0x00
   2BBF DD 77 F0      [19] 1311 	ld	-16 (ix),a
   2BC2 DD 6E EF      [19] 1312 	ld	l,-17 (ix)
   2BC5 DD 66 F0      [19] 1313 	ld	h,-16 (ix)
   2BC8 7E            [ 7] 1314 	ld	a,(hl)
   2BC9 DD 77 F3      [19] 1315 	ld	-13 (ix),a
   2BCC 23            [ 6] 1316 	inc	hl
   2BCD 7E            [ 7] 1317 	ld	a,(hl)
   2BCE DD 77 F4      [19] 1318 	ld	-12 (ix),a
   2BD1 DD 6E F1      [19] 1319 	ld	l,-15 (ix)
   2BD4 DD 66 F2      [19] 1320 	ld	h,-14 (ix)
   2BD7 7E            [ 7] 1321 	ld	a,(hl)
   2BD8 DD 77 EC      [19] 1322 	ld	-20 (ix), a
   2BDB 4F            [ 4] 1323 	ld	c, a
   2BDC 06 00         [ 7] 1324 	ld	b,#0x00
   2BDE 69            [ 4] 1325 	ld	l, c
   2BDF 60            [ 4] 1326 	ld	h, b
   2BE0 29            [11] 1327 	add	hl, hl
   2BE1 29            [11] 1328 	add	hl, hl
   2BE2 29            [11] 1329 	add	hl, hl
   2BE3 29            [11] 1330 	add	hl, hl
   2BE4 29            [11] 1331 	add	hl, hl
   2BE5 09            [11] 1332 	add	hl, bc
   2BE6 DD 75 F1      [19] 1333 	ld	-15 (ix),l
   2BE9 DD 74 F2      [19] 1334 	ld	-14 (ix),h
   2BEC 3E 29         [ 7] 1335 	ld	a,#<(_movements)
   2BEE DD 86 F1      [19] 1336 	add	a, -15 (ix)
   2BF1 DD 77 F1      [19] 1337 	ld	-15 (ix),a
   2BF4 3E 33         [ 7] 1338 	ld	a,#>(_movements)
   2BF6 DD 8E F2      [19] 1339 	adc	a, -14 (ix)
   2BF9 DD 77 F2      [19] 1340 	ld	-14 (ix),a
   2BFC DD 34 F1      [23] 1341 	inc	-15 (ix)
   2BFF 20 03         [12] 1342 	jr	NZ,00180$
   2C01 DD 34 F2      [23] 1343 	inc	-14 (ix)
   2C04                    1344 00180$:
   2C04 DD 6E F5      [19] 1345 	ld	l,-11 (ix)
   2C07 DD 66 F6      [19] 1346 	ld	h,-10 (ix)
   2C0A 7E            [ 7] 1347 	ld	a,(hl)
   2C0B DD 77 EC      [19] 1348 	ld	-20 (ix),a
   2C0E DD CB EC 26   [23] 1349 	sla	-20 (ix)
   2C12 DD CB EC 26   [23] 1350 	sla	-20 (ix)
   2C16 DD 7E F1      [19] 1351 	ld	a,-15 (ix)
   2C19 DD 86 EC      [19] 1352 	add	a, -20 (ix)
   2C1C DD 77 F1      [19] 1353 	ld	-15 (ix),a
   2C1F DD 7E F2      [19] 1354 	ld	a,-14 (ix)
   2C22 CE 00         [ 7] 1355 	adc	a, #0x00
   2C24 DD 77 F2      [19] 1356 	ld	-14 (ix),a
   2C27 DD 6E F1      [19] 1357 	ld	l,-15 (ix)
   2C2A DD 66 F2      [19] 1358 	ld	h,-14 (ix)
   2C2D 23            [ 6] 1359 	inc	hl
   2C2E 23            [ 6] 1360 	inc	hl
   2C2F 7E            [ 7] 1361 	ld	a,(hl)
   2C30 DD 77 EC      [19] 1362 	ld	-20 (ix), a
   2C33 DD 77 F1      [19] 1363 	ld	-15 (ix),a
   2C36 DD 7E EC      [19] 1364 	ld	a,-20 (ix)
   2C39 17            [ 4] 1365 	rla
   2C3A 9F            [ 4] 1366 	sbc	a, a
   2C3B DD 77 F2      [19] 1367 	ld	-14 (ix),a
   2C3E DD 7E F3      [19] 1368 	ld	a,-13 (ix)
   2C41 DD 86 F1      [19] 1369 	add	a, -15 (ix)
   2C44 DD 77 F1      [19] 1370 	ld	-15 (ix),a
   2C47 DD 7E F4      [19] 1371 	ld	a,-12 (ix)
   2C4A DD 8E F2      [19] 1372 	adc	a, -14 (ix)
   2C4D DD 77 F2      [19] 1373 	ld	-14 (ix),a
   2C50 DD 6E EF      [19] 1374 	ld	l,-17 (ix)
   2C53 DD 66 F0      [19] 1375 	ld	h,-16 (ix)
   2C56 DD 7E F1      [19] 1376 	ld	a,-15 (ix)
   2C59 77            [ 7] 1377 	ld	(hl),a
   2C5A 23            [ 6] 1378 	inc	hl
   2C5B DD 7E F2      [19] 1379 	ld	a,-14 (ix)
   2C5E 77            [ 7] 1380 	ld	(hl),a
                           1381 ;src/entities/enemies.c:180: enemies[i].stage_step++;
   2C5F DD 7E ED      [19] 1382 	ld	a,-19 (ix)
   2C62 C6 1F         [ 7] 1383 	add	a, #0x1F
   2C64 DD 77 ED      [19] 1384 	ld	-19 (ix),a
   2C67 DD 7E EE      [19] 1385 	ld	a,-18 (ix)
   2C6A CE 00         [ 7] 1386 	adc	a, #0x00
   2C6C DD 77 EE      [19] 1387 	ld	-18 (ix),a
   2C6F DD 6E ED      [19] 1388 	ld	l,-19 (ix)
   2C72 DD 66 EE      [19] 1389 	ld	h,-18 (ix)
   2C75 7E            [ 7] 1390 	ld	a,(hl)
   2C76 DD 77 EC      [19] 1391 	ld	-20 (ix), a
   2C79 3C            [ 4] 1392 	inc	a
   2C7A DD 6E ED      [19] 1393 	ld	l,-19 (ix)
   2C7D DD 66 EE      [19] 1394 	ld	h,-18 (ix)
   2C80 77            [ 7] 1395 	ld	(hl),a
   2C81                    1396 00125$:
                           1397 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   2C81 DD 7E FE      [19] 1398 	ld	a,-2 (ix)
   2C84 C6 24         [ 7] 1399 	add	a, #0x24
   2C86 DD 77 FE      [19] 1400 	ld	-2 (ix),a
   2C89 DD 7E FF      [19] 1401 	ld	a,-1 (ix)
   2C8C CE 00         [ 7] 1402 	adc	a, #0x00
   2C8E DD 77 FF      [19] 1403 	ld	-1 (ix),a
   2C91 DD 7E FC      [19] 1404 	ld	a,-4 (ix)
   2C94 C6 24         [ 7] 1405 	add	a, #0x24
   2C96 DD 77 FC      [19] 1406 	ld	-4 (ix),a
   2C99 DD 7E FD      [19] 1407 	ld	a,-3 (ix)
   2C9C CE 00         [ 7] 1408 	adc	a, #0x00
   2C9E DD 77 FD      [19] 1409 	ld	-3 (ix),a
   2CA1 DD 34 EB      [23] 1410 	inc	-21 (ix)
   2CA4 DD 7E EB      [19] 1411 	ld	a,-21 (ix)
   2CA7 D6 1E         [ 7] 1412 	sub	a, #0x1E
   2CA9 DA 0C 28      [10] 1413 	jp	C,00124$
   2CAC                    1414 00112$:
                           1415 ;src/entities/enemies.c:188: if (active_groups>0){
   2CAC 3A 86 60      [13] 1416 	ld	a,(#_active_groups + 0)
   2CAF B7            [ 4] 1417 	or	a, a
   2CB0 CA 2D 2D      [10] 1418 	jp	Z,00128$
                           1419 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2CB3 DD 36 EB 00   [19] 1420 	ld	-21 (ix),#0x00
   2CB7                    1421 00126$:
                           1422 ;src/entities/enemies.c:191: if (groups[i].active){
   2CB7 DD 6E EB      [19] 1423 	ld	l,-21 (ix)
   2CBA 26 00         [ 7] 1424 	ld	h,#0x00
   2CBC 29            [11] 1425 	add	hl, hl
   2CBD 29            [11] 1426 	add	hl, hl
   2CBE 29            [11] 1427 	add	hl, hl
   2CBF 3E 66         [ 7] 1428 	ld	a,#<(_groups)
   2CC1 85            [ 4] 1429 	add	a, l
   2CC2 5F            [ 4] 1430 	ld	e,a
   2CC3 3E 60         [ 7] 1431 	ld	a,#>(_groups)
   2CC5 8C            [ 4] 1432 	adc	a, h
   2CC6 57            [ 4] 1433 	ld	d,a
   2CC7 1A            [ 7] 1434 	ld	a,(de)
   2CC8 B7            [ 4] 1435 	or	a, a
   2CC9 28 58         [12] 1436 	jr	Z,00127$
                           1437 ;src/entities/enemies.c:192: if (groups[i].sleep==0){
   2CCB 21 07 00      [10] 1438 	ld	hl,#0x0007
   2CCE 19            [11] 1439 	add	hl,de
   2CCF 7E            [ 7] 1440 	ld	a,(hl)
   2CD0 B7            [ 4] 1441 	or	a, a
   2CD1 20 4D         [12] 1442 	jr	NZ,00117$
                           1443 ;src/entities/enemies.c:193: groups[i].sleep=ENEMY_GAP;
   2CD3 36 03         [10] 1444 	ld	(hl),#0x03
                           1445 ;src/entities/enemies.c:194: if (groups[i].num_enemies==0){
   2CD5 21 06 00      [10] 1446 	ld	hl,#0x0006
   2CD8 19            [11] 1447 	add	hl,de
   2CD9 4D            [ 4] 1448 	ld	c,l
   2CDA 44            [ 4] 1449 	ld	b,h
   2CDB 0A            [ 7] 1450 	ld	a,(bc)
   2CDC B7            [ 4] 1451 	or	a, a
   2CDD 20 08         [12] 1452 	jr	NZ,00114$
                           1453 ;src/entities/enemies.c:195: groups[i].active=0;
   2CDF AF            [ 4] 1454 	xor	a, a
   2CE0 12            [ 7] 1455 	ld	(de),a
                           1456 ;src/entities/enemies.c:196: active_groups--;
   2CE1 21 86 60      [10] 1457 	ld	hl, #_active_groups+0
   2CE4 35            [11] 1458 	dec	(hl)
   2CE5 18 3C         [12] 1459 	jr	00127$
   2CE7                    1460 00114$:
                           1461 ;src/entities/enemies.c:198: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2CE7 6B            [ 4] 1462 	ld	l, e
   2CE8 62            [ 4] 1463 	ld	h, d
   2CE9 23            [ 6] 1464 	inc	hl
   2CEA 23            [ 6] 1465 	inc	hl
   2CEB 23            [ 6] 1466 	inc	hl
   2CEC 23            [ 6] 1467 	inc	hl
   2CED 23            [ 6] 1468 	inc	hl
   2CEE 7E            [ 7] 1469 	ld	a,(hl)
   2CEF DD 77 EC      [19] 1470 	ld	-20 (ix),a
   2CF2 6B            [ 4] 1471 	ld	l, e
   2CF3 62            [ 4] 1472 	ld	h, d
   2CF4 23            [ 6] 1473 	inc	hl
   2CF5 23            [ 6] 1474 	inc	hl
   2CF6 23            [ 6] 1475 	inc	hl
   2CF7 7E            [ 7] 1476 	ld	a,(hl)
   2CF8 DD 77 ED      [19] 1477 	ld	-19 (ix),a
   2CFB 23            [ 6] 1478 	inc	hl
   2CFC 7E            [ 7] 1479 	ld	a,(hl)
   2CFD DD 77 EE      [19] 1480 	ld	-18 (ix),a
   2D00 EB            [ 4] 1481 	ex	de,hl
   2D01 23            [ 6] 1482 	inc	hl
   2D02 5E            [ 7] 1483 	ld	e,(hl)
   2D03 23            [ 6] 1484 	inc	hl
   2D04 56            [ 7] 1485 	ld	d,(hl)
   2D05 C5            [11] 1486 	push	bc
   2D06 DD 7E EC      [19] 1487 	ld	a,-20 (ix)
   2D09 F5            [11] 1488 	push	af
   2D0A 33            [ 6] 1489 	inc	sp
   2D0B DD 6E ED      [19] 1490 	ld	l,-19 (ix)
   2D0E DD 66 EE      [19] 1491 	ld	h,-18 (ix)
   2D11 E5            [11] 1492 	push	hl
   2D12 D5            [11] 1493 	push	de
   2D13 CD 45 24      [17] 1494 	call	_create_enemy
   2D16 F1            [10] 1495 	pop	af
   2D17 F1            [10] 1496 	pop	af
   2D18 33            [ 6] 1497 	inc	sp
   2D19 C1            [10] 1498 	pop	bc
                           1499 ;src/entities/enemies.c:199: groups[i].num_enemies--;
   2D1A 0A            [ 7] 1500 	ld	a,(bc)
   2D1B C6 FF         [ 7] 1501 	add	a,#0xFF
   2D1D 02            [ 7] 1502 	ld	(bc),a
   2D1E 18 03         [12] 1503 	jr	00127$
   2D20                    1504 00117$:
                           1505 ;src/entities/enemies.c:202: groups[i].sleep--;
   2D20 C6 FF         [ 7] 1506 	add	a,#0xFF
   2D22 77            [ 7] 1507 	ld	(hl),a
   2D23                    1508 00127$:
                           1509 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2D23 DD 34 EB      [23] 1510 	inc	-21 (ix)
   2D26 DD 7E EB      [19] 1511 	ld	a,-21 (ix)
   2D29 D6 04         [ 7] 1512 	sub	a, #0x04
   2D2B 38 8A         [12] 1513 	jr	C,00126$
   2D2D                    1514 00128$:
   2D2D DD F9         [10] 1515 	ld	sp, ix
   2D2F DD E1         [14] 1516 	pop	ix
   2D31 C9            [10] 1517 	ret
                           1518 ;src/entities/enemies.c:210: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                           1519 ;	---------------------------------
                           1520 ; Function inside_screen
                           1521 ; ---------------------------------
   2D32                    1522 _inside_screen::
   2D32 DD E5         [15] 1523 	push	ix
   2D34 DD 21 00 00   [14] 1524 	ld	ix,#0
   2D38 DD 39         [15] 1525 	add	ix,sp
   2D3A 3B            [ 6] 1526 	dec	sp
                           1527 ;src/entities/enemies.c:212: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   2D3B DD CB 05 7E   [20] 1528 	bit	7, 5 (ix)
   2D3F 20 38         [12] 1529 	jr	NZ,00103$
   2D41 DD 5E 08      [19] 1530 	ld	e,8 (ix)
   2D44 16 00         [ 7] 1531 	ld	d,#0x00
   2D46 DD 6E 04      [19] 1532 	ld	l,4 (ix)
   2D49 DD 66 05      [19] 1533 	ld	h,5 (ix)
   2D4C 19            [11] 1534 	add	hl,de
   2D4D 11 50 80      [10] 1535 	ld	de, #0x8050
   2D50 29            [11] 1536 	add	hl, hl
   2D51 3F            [ 4] 1537 	ccf
   2D52 CB 1C         [ 8] 1538 	rr	h
   2D54 CB 1D         [ 8] 1539 	rr	l
   2D56 ED 52         [15] 1540 	sbc	hl, de
   2D58 30 1F         [12] 1541 	jr	NC,00103$
   2D5A DD CB 07 7E   [20] 1542 	bit	7, 7 (ix)
   2D5E 20 19         [12] 1543 	jr	NZ,00103$
   2D60 DD 5E 09      [19] 1544 	ld	e,9 (ix)
   2D63 16 00         [ 7] 1545 	ld	d,#0x00
   2D65 DD 6E 06      [19] 1546 	ld	l,6 (ix)
   2D68 DD 66 07      [19] 1547 	ld	h,7 (ix)
   2D6B 19            [11] 1548 	add	hl,de
   2D6C 11 C8 80      [10] 1549 	ld	de, #0x80C8
   2D6F 29            [11] 1550 	add	hl, hl
   2D70 3F            [ 4] 1551 	ccf
   2D71 CB 1C         [ 8] 1552 	rr	h
   2D73 CB 1D         [ 8] 1553 	rr	l
   2D75 ED 52         [15] 1554 	sbc	hl, de
   2D77 38 04         [12] 1555 	jr	C,00104$
   2D79                    1556 00103$:
   2D79 2E 00         [ 7] 1557 	ld	l,#0x00
   2D7B 18 02         [12] 1558 	jr	00105$
   2D7D                    1559 00104$:
   2D7D 2E 01         [ 7] 1560 	ld	l,#0x01
   2D7F                    1561 00105$:
   2D7F 33            [ 6] 1562 	inc	sp
   2D80 DD E1         [14] 1563 	pop	ix
   2D82 C9            [10] 1564 	ret
                           1565 ;src/entities/enemies.c:219: void draw_enemies(u8* screen){
                           1566 ;	---------------------------------
                           1567 ; Function draw_enemies
                           1568 ; ---------------------------------
   2D83                    1569 _draw_enemies::
   2D83 DD E5         [15] 1570 	push	ix
   2D85 DD 21 00 00   [14] 1571 	ld	ix,#0
   2D89 DD 39         [15] 1572 	add	ix,sp
   2D8B 21 F1 FF      [10] 1573 	ld	hl,#-15
   2D8E 39            [11] 1574 	add	hl,sp
   2D8F F9            [ 6] 1575 	ld	sp,hl
                           1576 ;src/entities/enemies.c:224: if (active_enemies>0){
   2D90 3A 65 60      [13] 1577 	ld	a,(#_active_enemies + 0)
   2D93 B7            [ 4] 1578 	or	a, a
   2D94 CA C2 2E      [10] 1579 	jp	Z,00109$
                           1580 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2D97 DD 36 F1 00   [19] 1581 	ld	-15 (ix),#0x00
   2D9B 11 00 00      [10] 1582 	ld	de,#0x0000
   2D9E                    1583 00107$:
                           1584 ;src/entities/enemies.c:226: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2D9E 21 2D 5C      [10] 1585 	ld	hl,#_enemies
   2DA1 19            [11] 1586 	add	hl,de
   2DA2 DD 75 F2      [19] 1587 	ld	-14 (ix),l
   2DA5 DD 74 F3      [19] 1588 	ld	-13 (ix),h
   2DA8 DD 6E F2      [19] 1589 	ld	l,-14 (ix)
   2DAB DD 66 F3      [19] 1590 	ld	h,-13 (ix)
   2DAE 01 17 00      [10] 1591 	ld	bc, #0x0017
   2DB1 09            [11] 1592 	add	hl, bc
   2DB2 7E            [ 7] 1593 	ld	a,(hl)
   2DB3 B7            [ 4] 1594 	or	a, a
   2DB4 CA B2 2E      [10] 1595 	jp	Z,00108$
   2DB7 DD 7E F2      [19] 1596 	ld	a,-14 (ix)
   2DBA C6 15         [ 7] 1597 	add	a, #0x15
   2DBC DD 77 F8      [19] 1598 	ld	-8 (ix),a
   2DBF DD 7E F3      [19] 1599 	ld	a,-13 (ix)
   2DC2 CE 00         [ 7] 1600 	adc	a, #0x00
   2DC4 DD 77 F9      [19] 1601 	ld	-7 (ix),a
   2DC7 DD 6E F8      [19] 1602 	ld	l,-8 (ix)
   2DCA DD 66 F9      [19] 1603 	ld	h,-7 (ix)
   2DCD 46            [ 7] 1604 	ld	b,(hl)
   2DCE DD 7E F2      [19] 1605 	ld	a,-14 (ix)
   2DD1 C6 14         [ 7] 1606 	add	a, #0x14
   2DD3 DD 77 FA      [19] 1607 	ld	-6 (ix),a
   2DD6 DD 7E F3      [19] 1608 	ld	a,-13 (ix)
   2DD9 CE 00         [ 7] 1609 	adc	a, #0x00
   2DDB DD 77 FB      [19] 1610 	ld	-5 (ix),a
   2DDE DD 6E FA      [19] 1611 	ld	l,-6 (ix)
   2DE1 DD 66 FB      [19] 1612 	ld	h,-5 (ix)
   2DE4 4E            [ 7] 1613 	ld	c,(hl)
   2DE5 DD 7E F2      [19] 1614 	ld	a,-14 (ix)
   2DE8 C6 12         [ 7] 1615 	add	a, #0x12
   2DEA DD 77 F4      [19] 1616 	ld	-12 (ix),a
   2DED DD 7E F3      [19] 1617 	ld	a,-13 (ix)
   2DF0 CE 00         [ 7] 1618 	adc	a, #0x00
   2DF2 DD 77 F5      [19] 1619 	ld	-11 (ix),a
   2DF5 DD 6E F4      [19] 1620 	ld	l,-12 (ix)
   2DF8 DD 66 F5      [19] 1621 	ld	h,-11 (ix)
   2DFB 7E            [ 7] 1622 	ld	a,(hl)
   2DFC DD 77 FC      [19] 1623 	ld	-4 (ix),a
   2DFF 23            [ 6] 1624 	inc	hl
   2E00 7E            [ 7] 1625 	ld	a,(hl)
   2E01 DD 77 FD      [19] 1626 	ld	-3 (ix),a
   2E04 DD 7E F2      [19] 1627 	ld	a,-14 (ix)
   2E07 C6 10         [ 7] 1628 	add	a, #0x10
   2E09 DD 77 F6      [19] 1629 	ld	-10 (ix),a
   2E0C DD 7E F3      [19] 1630 	ld	a,-13 (ix)
   2E0F CE 00         [ 7] 1631 	adc	a, #0x00
   2E11 DD 77 F7      [19] 1632 	ld	-9 (ix),a
   2E14 DD 6E F6      [19] 1633 	ld	l,-10 (ix)
   2E17 DD 66 F7      [19] 1634 	ld	h,-9 (ix)
   2E1A 7E            [ 7] 1635 	ld	a,(hl)
   2E1B DD 77 FE      [19] 1636 	ld	-2 (ix),a
   2E1E 23            [ 6] 1637 	inc	hl
   2E1F 7E            [ 7] 1638 	ld	a,(hl)
   2E20 DD 77 FF      [19] 1639 	ld	-1 (ix),a
   2E23 D5            [11] 1640 	push	de
   2E24 C5            [11] 1641 	push	bc
   2E25 DD 6E FC      [19] 1642 	ld	l,-4 (ix)
   2E28 DD 66 FD      [19] 1643 	ld	h,-3 (ix)
   2E2B E5            [11] 1644 	push	hl
   2E2C DD 6E FE      [19] 1645 	ld	l,-2 (ix)
   2E2F DD 66 FF      [19] 1646 	ld	h,-1 (ix)
   2E32 E5            [11] 1647 	push	hl
   2E33 CD 32 2D      [17] 1648 	call	_inside_screen
   2E36 F1            [10] 1649 	pop	af
   2E37 F1            [10] 1650 	pop	af
   2E38 F1            [10] 1651 	pop	af
   2E39 7D            [ 4] 1652 	ld	a,l
   2E3A D1            [10] 1653 	pop	de
   2E3B B7            [ 4] 1654 	or	a, a
   2E3C 28 74         [12] 1655 	jr	Z,00108$
                           1656 ;src/entities/enemies.c:227: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   2E3E DD 6E F4      [19] 1657 	ld	l,-12 (ix)
   2E41 DD 66 F5      [19] 1658 	ld	h,-11 (ix)
   2E44 4E            [ 7] 1659 	ld	c,(hl)
   2E45 23            [ 6] 1660 	inc	hl
   2E46 46            [ 7] 1661 	ld	b,(hl)
   2E47 DD 6E F6      [19] 1662 	ld	l,-10 (ix)
   2E4A DD 66 F7      [19] 1663 	ld	h,-9 (ix)
   2E4D 7E            [ 7] 1664 	ld	a, (hl)
   2E4E 23            [ 6] 1665 	inc	hl
   2E4F 66            [ 7] 1666 	ld	h,(hl)
   2E50 6F            [ 4] 1667 	ld	l,a
   2E51 65            [ 4] 1668 	ld	h,l
   2E52 E5            [11] 1669 	push	hl
   2E53 DD 6E 04      [19] 1670 	ld	l,4 (ix)
   2E56 DD 66 05      [19] 1671 	ld	h,5 (ix)
   2E59 E5            [11] 1672 	push	hl
   2E5A FD E1         [14] 1673 	pop	iy
   2E5C E1            [10] 1674 	pop	hl
   2E5D D5            [11] 1675 	push	de
   2E5E 79            [ 4] 1676 	ld	a,c
   2E5F F5            [11] 1677 	push	af
   2E60 33            [ 6] 1678 	inc	sp
   2E61 E5            [11] 1679 	push	hl
   2E62 33            [ 6] 1680 	inc	sp
   2E63 FD E5         [15] 1681 	push	iy
   2E65 CD A0 4F      [17] 1682 	call	_cpct_getScreenPtr
   2E68 D1            [10] 1683 	pop	de
   2E69 4D            [ 4] 1684 	ld	c, l
   2E6A 44            [ 4] 1685 	ld	b, h
                           1686 ;src/entities/enemies.c:228: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   2E6B DD 6E F8      [19] 1687 	ld	l,-8 (ix)
   2E6E DD 66 F9      [19] 1688 	ld	h,-7 (ix)
   2E71 7E            [ 7] 1689 	ld	a,(hl)
   2E72 DD 77 FE      [19] 1690 	ld	-2 (ix),a
   2E75 DD 6E FA      [19] 1691 	ld	l,-6 (ix)
   2E78 DD 66 FB      [19] 1692 	ld	h,-5 (ix)
   2E7B 7E            [ 7] 1693 	ld	a,(hl)
   2E7C DD 77 F6      [19] 1694 	ld	-10 (ix),a
   2E7F DD 71 FC      [19] 1695 	ld	-4 (ix),c
   2E82 DD 70 FD      [19] 1696 	ld	-3 (ix),b
   2E85 DD 6E F2      [19] 1697 	ld	l,-14 (ix)
   2E88 DD 66 F3      [19] 1698 	ld	h,-13 (ix)
   2E8B 01 16 00      [10] 1699 	ld	bc, #0x0016
   2E8E 09            [11] 1700 	add	hl, bc
   2E8F 7E            [ 7] 1701 	ld	a,(hl)
   2E90 87            [ 4] 1702 	add	a, a
   2E91 4F            [ 4] 1703 	ld	c,a
   2E92 DD 6E F2      [19] 1704 	ld	l,-14 (ix)
   2E95 DD 66 F3      [19] 1705 	ld	h,-13 (ix)
   2E98 06 00         [ 7] 1706 	ld	b,#0x00
   2E9A 09            [11] 1707 	add	hl, bc
   2E9B 4E            [ 7] 1708 	ld	c,(hl)
   2E9C 23            [ 6] 1709 	inc	hl
   2E9D 46            [ 7] 1710 	ld	b,(hl)
   2E9E D5            [11] 1711 	push	de
   2E9F DD 66 FE      [19] 1712 	ld	h,-2 (ix)
   2EA2 DD 6E F6      [19] 1713 	ld	l,-10 (ix)
   2EA5 E5            [11] 1714 	push	hl
   2EA6 DD 6E FC      [19] 1715 	ld	l,-4 (ix)
   2EA9 DD 66 FD      [19] 1716 	ld	h,-3 (ix)
   2EAC E5            [11] 1717 	push	hl
   2EAD C5            [11] 1718 	push	bc
   2EAE CD 5B 4C      [17] 1719 	call	_cpct_drawSprite
   2EB1 D1            [10] 1720 	pop	de
   2EB2                    1721 00108$:
                           1722 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2EB2 21 24 00      [10] 1723 	ld	hl,#0x0024
   2EB5 19            [11] 1724 	add	hl,de
   2EB6 EB            [ 4] 1725 	ex	de,hl
   2EB7 DD 34 F1      [23] 1726 	inc	-15 (ix)
   2EBA DD 7E F1      [19] 1727 	ld	a,-15 (ix)
   2EBD D6 1E         [ 7] 1728 	sub	a, #0x1E
   2EBF DA 9E 2D      [10] 1729 	jp	C,00107$
   2EC2                    1730 00109$:
   2EC2 DD F9         [10] 1731 	ld	sp, ix
   2EC4 DD E1         [14] 1732 	pop	ix
   2EC6 C9            [10] 1733 	ret
                           1734 	.area _CODE
                           1735 	.area _INITIALIZER
                           1736 	.area _CABS (ABS)
