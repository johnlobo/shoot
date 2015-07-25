                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:49 2015
                              5 ;--------------------------------------------------------
                              6 	.module enemies
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _inside_screen
                             13 	.globl _detectColision
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_drawSprite
                             16 	.globl _active_groups
                             17 	.globl _groups
                             18 	.globl _active_enemies
                             19 	.globl _enemies
                             20 	.globl _check_collision_enemies
                             21 	.globl _init_enemies
                             22 	.globl _create_enemy
                             23 	.globl _create_enemy_group
                             24 	.globl _update_enemies
                             25 	.globl _draw_enemies
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   51FA                      33 _enemies::
   51FA                      34 	.ds 1080
   5632                      35 _active_enemies::
   5632                      36 	.ds 1
   5633                      37 _groups::
   5633                      38 	.ds 32
   5653                      39 _active_groups::
   5653                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/entities/enemies.c:14: u8 detectColision(u8 x1,u8 y1,u8 w1,u8 h1,u8 x2,u8 y2,u8 w2,u8 h2){
                             66 ;	---------------------------------
                             67 ; Function detectColision
                             68 ; ---------------------------------
   22D1                      69 _detectColision::
   22D1 DD E5         [15]   70 	push	ix
   22D3 DD 21 00 00   [14]   71 	ld	ix,#0
   22D7 DD 39         [15]   72 	add	ix,sp
                             73 ;src/entities/enemies.c:15: return ((x1 < x2 + w2) && (x1 + w1 > x2) && (y1 < y2 + h2) && (h1 + y1 > y2));
   22D9 DD 5E 08      [19]   74 	ld	e,8 (ix)
   22DC 16 00         [ 7]   75 	ld	d,#0x00
   22DE DD 6E 0A      [19]   76 	ld	l,10 (ix)
   22E1 26 00         [ 7]   77 	ld	h,#0x00
   22E3 19            [11]   78 	add	hl,de
   22E4 DD 4E 04      [19]   79 	ld	c,4 (ix)
   22E7 06 00         [ 7]   80 	ld	b,#0x00
   22E9 79            [ 4]   81 	ld	a,c
   22EA 95            [ 4]   82 	sub	a, l
   22EB 78            [ 4]   83 	ld	a,b
   22EC 9C            [ 4]   84 	sbc	a, h
   22ED E2 F2 22      [10]   85 	jp	PO, 00122$
   22F0 EE 80         [ 7]   86 	xor	a, #0x80
   22F2                      87 00122$:
   22F2 F2 35 23      [10]   88 	jp	P,00103$
   22F5 DD 6E 06      [19]   89 	ld	l,6 (ix)
   22F8 26 00         [ 7]   90 	ld	h,#0x00
   22FA 09            [11]   91 	add	hl,bc
   22FB 7B            [ 4]   92 	ld	a,e
   22FC 95            [ 4]   93 	sub	a, l
   22FD 7A            [ 4]   94 	ld	a,d
   22FE 9C            [ 4]   95 	sbc	a, h
   22FF E2 04 23      [10]   96 	jp	PO, 00123$
   2302 EE 80         [ 7]   97 	xor	a, #0x80
   2304                      98 00123$:
   2304 F2 35 23      [10]   99 	jp	P,00103$
   2307 DD 5E 09      [19]  100 	ld	e,9 (ix)
   230A 16 00         [ 7]  101 	ld	d,#0x00
   230C DD 6E 0B      [19]  102 	ld	l,11 (ix)
   230F 26 00         [ 7]  103 	ld	h,#0x00
   2311 19            [11]  104 	add	hl,de
   2312 DD 4E 05      [19]  105 	ld	c,5 (ix)
   2315 06 00         [ 7]  106 	ld	b,#0x00
   2317 79            [ 4]  107 	ld	a,c
   2318 95            [ 4]  108 	sub	a, l
   2319 78            [ 4]  109 	ld	a,b
   231A 9C            [ 4]  110 	sbc	a, h
   231B E2 20 23      [10]  111 	jp	PO, 00124$
   231E EE 80         [ 7]  112 	xor	a, #0x80
   2320                     113 00124$:
   2320 F2 35 23      [10]  114 	jp	P,00103$
   2323 DD 6E 07      [19]  115 	ld	l,7 (ix)
   2326 26 00         [ 7]  116 	ld	h,#0x00
   2328 09            [11]  117 	add	hl,bc
   2329 7B            [ 4]  118 	ld	a,e
   232A 95            [ 4]  119 	sub	a, l
   232B 7A            [ 4]  120 	ld	a,d
   232C 9C            [ 4]  121 	sbc	a, h
   232D E2 32 23      [10]  122 	jp	PO, 00125$
   2330 EE 80         [ 7]  123 	xor	a, #0x80
   2332                     124 00125$:
   2332 FA 39 23      [10]  125 	jp	M,00104$
   2335                     126 00103$:
   2335 2E 00         [ 7]  127 	ld	l,#0x00
   2337 18 02         [12]  128 	jr	00105$
   2339                     129 00104$:
   2339 2E 01         [ 7]  130 	ld	l,#0x01
   233B                     131 00105$:
   233B DD E1         [14]  132 	pop	ix
   233D C9            [10]  133 	ret
                            134 ;src/entities/enemies.c:22: u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
                            135 ;	---------------------------------
                            136 ; Function check_collision_enemies
                            137 ; ---------------------------------
   233E                     138 _check_collision_enemies::
   233E DD E5         [15]  139 	push	ix
   2340 DD 21 00 00   [14]  140 	ld	ix,#0
   2344 DD 39         [15]  141 	add	ix,sp
   2346 21 F6 FF      [10]  142 	ld	hl,#-10
   2349 39            [11]  143 	add	hl,sp
   234A F9            [ 6]  144 	ld	sp,hl
                            145 ;src/entities/enemies.c:27: collision = 0;
   234B DD 36 F6 00   [19]  146 	ld	-10 (ix),#0x00
                            147 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   234F DD 36 F7 00   [19]  148 	ld	-9 (ix),#0x00
   2353 01 00 00      [10]  149 	ld	bc,#0x0000
   2356                     150 00108$:
                            151 ;src/entities/enemies.c:30: if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
   2356 21 FA 51      [10]  152 	ld	hl,#_enemies
   2359 09            [11]  153 	add	hl,bc
   235A EB            [ 4]  154 	ex	de,hl
   235B 21 17 00      [10]  155 	ld	hl,#0x0017
   235E 19            [11]  156 	add	hl,de
   235F DD 75 F8      [19]  157 	ld	-8 (ix),l
   2362 DD 74 F9      [19]  158 	ld	-7 (ix),h
   2365 DD 6E F8      [19]  159 	ld	l,-8 (ix)
   2368 DD 66 F9      [19]  160 	ld	h,-7 (ix)
   236B 7E            [ 7]  161 	ld	a,(hl)
   236C B7            [ 4]  162 	or	a, a
   236D CA F7 23      [10]  163 	jp	Z,00109$
   2370 D5            [11]  164 	push	de
   2371 FD E1         [14]  165 	pop	iy
   2373 FD 7E 10      [19]  166 	ld	a,16 (iy)
   2376 DD 77 FB      [19]  167 	ld	-5 (ix),a
   2379 FD 7E 11      [19]  168 	ld	a,17 (iy)
   237C DD 77 FC      [19]  169 	ld	-4 (ix),a
   237F AF            [ 4]  170 	xor	a, a
   2380 DD BE FB      [19]  171 	cp	a, -5 (ix)
   2383 DD 9E FC      [19]  172 	sbc	a, -4 (ix)
   2386 E2 8B 23      [10]  173 	jp	PO, 00137$
   2389 EE 80         [ 7]  174 	xor	a, #0x80
   238B                     175 00137$:
   238B F2 F7 23      [10]  176 	jp	P,00109$
   238E D5            [11]  177 	push	de
   238F FD E1         [14]  178 	pop	iy
   2391 FD 7E 12      [19]  179 	ld	a,18 (iy)
   2394 DD 77 FE      [19]  180 	ld	-2 (ix),a
   2397 FD 7E 13      [19]  181 	ld	a,19 (iy)
   239A DD 77 FF      [19]  182 	ld	-1 (ix),a
   239D AF            [ 4]  183 	xor	a, a
   239E DD BE FE      [19]  184 	cp	a, -2 (ix)
   23A1 DD 9E FF      [19]  185 	sbc	a, -1 (ix)
   23A4 E2 A9 23      [10]  186 	jp	PO, 00138$
   23A7 EE 80         [ 7]  187 	xor	a, #0x80
   23A9                     188 00138$:
   23A9 F2 F7 23      [10]  189 	jp	P,00109$
                            190 ;src/entities/enemies.c:31: if (detectColision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
   23AC D5            [11]  191 	push	de
   23AD FD E1         [14]  192 	pop	iy
   23AF FD 7E 15      [19]  193 	ld	a,21 (iy)
   23B2 DD 77 FA      [19]  194 	ld	-6 (ix),a
   23B5 D5            [11]  195 	push	de
   23B6 FD E1         [14]  196 	pop	iy
   23B8 FD 7E 14      [19]  197 	ld	a,20 (iy)
   23BB DD 77 FD      [19]  198 	ld	-3 (ix),a
   23BE DD 56 FE      [19]  199 	ld	d,-2 (ix)
   23C1 DD 5E FB      [19]  200 	ld	e,-5 (ix)
   23C4 C5            [11]  201 	push	bc
   23C5 DD 66 FA      [19]  202 	ld	h,-6 (ix)
   23C8 DD 6E FD      [19]  203 	ld	l,-3 (ix)
   23CB E5            [11]  204 	push	hl
   23CC D5            [11]  205 	push	de
   23CD DD 66 07      [19]  206 	ld	h,7 (ix)
   23D0 DD 6E 06      [19]  207 	ld	l,6 (ix)
   23D3 E5            [11]  208 	push	hl
   23D4 DD 66 05      [19]  209 	ld	h,5 (ix)
   23D7 DD 6E 04      [19]  210 	ld	l,4 (ix)
   23DA E5            [11]  211 	push	hl
   23DB CD D1 22      [17]  212 	call	_detectColision
   23DE F1            [10]  213 	pop	af
   23DF F1            [10]  214 	pop	af
   23E0 F1            [10]  215 	pop	af
   23E1 F1            [10]  216 	pop	af
   23E2 7D            [ 4]  217 	ld	a,l
   23E3 C1            [10]  218 	pop	bc
   23E4 B7            [ 4]  219 	or	a, a
   23E5 28 10         [12]  220 	jr	Z,00109$
                            221 ;src/entities/enemies.c:32: collision = 1;
   23E7 DD 36 F6 01   [19]  222 	ld	-10 (ix),#0x01
                            223 ;src/entities/enemies.c:33: enemies[i].active = 0;
   23EB DD 6E F8      [19]  224 	ld	l,-8 (ix)
   23EE DD 66 F9      [19]  225 	ld	h,-7 (ix)
   23F1 36 00         [10]  226 	ld	(hl),#0x00
                            227 ;src/entities/enemies.c:34: active_enemies--;
   23F3 21 32 56      [10]  228 	ld	hl, #_active_enemies+0
   23F6 35            [11]  229 	dec	(hl)
   23F7                     230 00109$:
                            231 ;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
   23F7 21 24 00      [10]  232 	ld	hl,#0x0024
   23FA 09            [11]  233 	add	hl,bc
   23FB 4D            [ 4]  234 	ld	c,l
   23FC 44            [ 4]  235 	ld	b,h
   23FD DD 34 F7      [23]  236 	inc	-9 (ix)
   2400 DD 7E F7      [19]  237 	ld	a,-9 (ix)
   2403 D6 1E         [ 7]  238 	sub	a, #0x1E
   2405 DA 56 23      [10]  239 	jp	C,00108$
                            240 ;src/entities/enemies.c:38: return collision;
   2408 DD 6E F6      [19]  241 	ld	l,-10 (ix)
   240B DD F9         [10]  242 	ld	sp, ix
   240D DD E1         [14]  243 	pop	ix
   240F C9            [10]  244 	ret
                            245 ;src/entities/enemies.c:45: void init_enemies(){
                            246 ;	---------------------------------
                            247 ; Function init_enemies
                            248 ; ---------------------------------
   2410                     249 _init_enemies::
   2410 DD E5         [15]  250 	push	ix
   2412 DD 21 00 00   [14]  251 	ld	ix,#0
   2416 DD 39         [15]  252 	add	ix,sp
   2418 3B            [ 6]  253 	dec	sp
                            254 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   2419 DD 36 FF 00   [19]  255 	ld	-1 (ix),#0x00
   241D 11 00 00      [10]  256 	ld	de,#0x0000
   2420                     257 00102$:
                            258 ;src/entities/enemies.c:48: enemies[k].active=0;
   2420 21 FA 51      [10]  259 	ld	hl,#_enemies
   2423 19            [11]  260 	add	hl,de
   2424 4D            [ 4]  261 	ld	c,l
   2425 44            [ 4]  262 	ld	b,h
   2426 21 17 00      [10]  263 	ld	hl,#0x0017
   2429 09            [11]  264 	add	hl,bc
   242A 36 00         [10]  265 	ld	(hl),#0x00
                            266 ;src/entities/enemies.c:49: enemies[k].x=0;
   242C 21 10 00      [10]  267 	ld	hl,#0x0010
   242F 09            [11]  268 	add	hl,bc
   2430 AF            [ 4]  269 	xor	a, a
   2431 77            [ 7]  270 	ld	(hl), a
   2432 23            [ 6]  271 	inc	hl
   2433 77            [ 7]  272 	ld	(hl), a
                            273 ;src/entities/enemies.c:50: enemies[k].y=0;
   2434 21 12 00      [10]  274 	ld	hl,#0x0012
   2437 09            [11]  275 	add	hl,bc
   2438 AF            [ 4]  276 	xor	a, a
   2439 77            [ 7]  277 	ld	(hl), a
   243A 23            [ 6]  278 	inc	hl
   243B 77            [ 7]  279 	ld	(hl), a
                            280 ;src/entities/enemies.c:51: enemies[k].w=0;
   243C 21 14 00      [10]  281 	ld	hl,#0x0014
   243F 09            [11]  282 	add	hl,bc
   2440 36 00         [10]  283 	ld	(hl),#0x00
                            284 ;src/entities/enemies.c:52: enemies[k].h=0;
   2442 21 15 00      [10]  285 	ld	hl,#0x0015
   2445 09            [11]  286 	add	hl,bc
   2446 36 00         [10]  287 	ld	(hl),#0x00
                            288 ;src/entities/enemies.c:53: enemies[k].dir=0;
   2448 21 16 00      [10]  289 	ld	hl,#0x0016
   244B 09            [11]  290 	add	hl,bc
   244C 36 00         [10]  291 	ld	(hl),#0x00
                            292 ;src/entities/enemies.c:54: enemies[k].frame=0;
   244E 21 19 00      [10]  293 	ld	hl,#0x0019
   2451 09            [11]  294 	add	hl,bc
   2452 36 00         [10]  295 	ld	(hl),#0x00
                            296 ;src/entities/enemies.c:55: enemies[k].lastmoved=0;
   2454 21 20 00      [10]  297 	ld	hl,#0x0020
   2457 09            [11]  298 	add	hl,bc
   2458 AF            [ 4]  299 	xor	a, a
   2459 77            [ 7]  300 	ld	(hl), a
   245A 23            [ 6]  301 	inc	hl
   245B 77            [ 7]  302 	ld	(hl), a
   245C 23            [ 6]  303 	inc	hl
   245D AF            [ 4]  304 	xor	a, a
   245E 77            [ 7]  305 	ld	(hl), a
   245F 23            [ 6]  306 	inc	hl
   2460 77            [ 7]  307 	ld	(hl), a
                            308 ;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
   2461 21 24 00      [10]  309 	ld	hl,#0x0024
   2464 19            [11]  310 	add	hl,de
   2465 EB            [ 4]  311 	ex	de,hl
   2466 DD 34 FF      [23]  312 	inc	-1 (ix)
   2469 DD 7E FF      [19]  313 	ld	a,-1 (ix)
   246C D6 1E         [ 7]  314 	sub	a, #0x1E
   246E 38 B0         [12]  315 	jr	C,00102$
                            316 ;src/entities/enemies.c:57: active_enemies=0;
   2470 21 32 56      [10]  317 	ld	hl,#_active_enemies + 0
   2473 36 00         [10]  318 	ld	(hl), #0x00
   2475 33            [ 6]  319 	inc	sp
   2476 DD E1         [14]  320 	pop	ix
   2478 C9            [10]  321 	ret
                            322 ;src/entities/enemies.c:65: void create_enemy(i16 x, i16 y, u8 type){
                            323 ;	---------------------------------
                            324 ; Function create_enemy
                            325 ; ---------------------------------
   2479                     326 _create_enemy::
   2479 DD E5         [15]  327 	push	ix
   247B DD 21 00 00   [14]  328 	ld	ix,#0
   247F DD 39         [15]  329 	add	ix,sp
   2481 21 E0 FF      [10]  330 	ld	hl,#-32
   2484 39            [11]  331 	add	hl,sp
   2485 F9            [ 6]  332 	ld	sp,hl
                            333 ;src/entities/enemies.c:67: if (active_enemies < MAX_ENEMIES){
   2486 3A 32 56      [13]  334 	ld	a,(#_active_enemies + 0)
   2489 D6 1E         [ 7]  335 	sub	a, #0x1E
   248B D2 B3 27      [10]  336 	jp	NC,00110$
                            337 ;src/entities/enemies.c:69: while (enemies[k].active){
   248E 11 00 00      [10]  338 	ld	de,#0x0000
   2491                     339 00101$:
   2491 21 FA 51      [10]  340 	ld	hl,#_enemies
   2494 19            [11]  341 	add	hl,de
   2495 DD 75 FE      [19]  342 	ld	-2 (ix),l
   2498 DD 74 FF      [19]  343 	ld	-1 (ix),h
   249B DD 7E FE      [19]  344 	ld	a,-2 (ix)
   249E C6 17         [ 7]  345 	add	a, #0x17
   24A0 6F            [ 4]  346 	ld	l,a
   24A1 DD 7E FF      [19]  347 	ld	a,-1 (ix)
   24A4 CE 00         [ 7]  348 	adc	a, #0x00
   24A6 67            [ 4]  349 	ld	h,a
   24A7 7E            [ 7]  350 	ld	a,(hl)
   24A8 B7            [ 4]  351 	or	a, a
   24A9 28 07         [12]  352 	jr	Z,00103$
                            353 ;src/entities/enemies.c:70: k++;
   24AB 21 24 00      [10]  354 	ld	hl,#0x0024
   24AE 19            [11]  355 	add	hl,de
   24AF EB            [ 4]  356 	ex	de,hl
   24B0 18 DF         [12]  357 	jr	00101$
   24B2                     358 00103$:
                            359 ;src/entities/enemies.c:72: enemies[k].active=1;
   24B2 36 01         [10]  360 	ld	(hl),#0x01
                            361 ;src/entities/enemies.c:73: enemies[k].frame=0;
   24B4 DD 7E FE      [19]  362 	ld	a,-2 (ix)
   24B7 C6 19         [ 7]  363 	add	a, #0x19
   24B9 6F            [ 4]  364 	ld	l,a
   24BA DD 7E FF      [19]  365 	ld	a,-1 (ix)
   24BD CE 00         [ 7]  366 	adc	a, #0x00
   24BF 67            [ 4]  367 	ld	h,a
   24C0 36 00         [10]  368 	ld	(hl),#0x00
                            369 ;src/entities/enemies.c:77: enemies[k].x=x;
   24C2 DD 7E FE      [19]  370 	ld	a,-2 (ix)
   24C5 C6 10         [ 7]  371 	add	a, #0x10
   24C7 DD 77 FC      [19]  372 	ld	-4 (ix),a
   24CA DD 7E FF      [19]  373 	ld	a,-1 (ix)
   24CD CE 00         [ 7]  374 	adc	a, #0x00
   24CF DD 77 FD      [19]  375 	ld	-3 (ix),a
                            376 ;src/entities/enemies.c:78: enemies[k].y=y;
   24D2 DD 7E FE      [19]  377 	ld	a,-2 (ix)
   24D5 C6 12         [ 7]  378 	add	a, #0x12
   24D7 DD 77 FA      [19]  379 	ld	-6 (ix),a
   24DA DD 7E FF      [19]  380 	ld	a,-1 (ix)
   24DD CE 00         [ 7]  381 	adc	a, #0x00
   24DF DD 77 FB      [19]  382 	ld	-5 (ix),a
                            383 ;src/entities/enemies.c:79: enemies[k].w=6;
   24E2 DD 7E FE      [19]  384 	ld	a,-2 (ix)
   24E5 C6 14         [ 7]  385 	add	a, #0x14
   24E7 DD 77 F8      [19]  386 	ld	-8 (ix),a
   24EA DD 7E FF      [19]  387 	ld	a,-1 (ix)
   24ED CE 00         [ 7]  388 	adc	a, #0x00
   24EF DD 77 F9      [19]  389 	ld	-7 (ix),a
                            390 ;src/entities/enemies.c:80: enemies[k].h=12;
   24F2 DD 7E FE      [19]  391 	ld	a,-2 (ix)
   24F5 C6 15         [ 7]  392 	add	a, #0x15
   24F7 DD 77 F6      [19]  393 	ld	-10 (ix),a
   24FA DD 7E FF      [19]  394 	ld	a,-1 (ix)
   24FD CE 00         [ 7]  395 	adc	a, #0x00
   24FF DD 77 F7      [19]  396 	ld	-9 (ix),a
                            397 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   2502 DD 7E FE      [19]  398 	ld	a,-2 (ix)
   2505 C6 18         [ 7]  399 	add	a, #0x18
   2507 DD 77 F4      [19]  400 	ld	-12 (ix),a
   250A DD 7E FF      [19]  401 	ld	a,-1 (ix)
   250D CE 00         [ 7]  402 	adc	a, #0x00
   250F DD 77 F5      [19]  403 	ld	-11 (ix),a
                            404 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   2512 DD 7E FE      [19]  405 	ld	a,-2 (ix)
   2515 C6 02         [ 7]  406 	add	a, #0x02
   2517 DD 77 F2      [19]  407 	ld	-14 (ix),a
   251A DD 7E FF      [19]  408 	ld	a,-1 (ix)
   251D CE 00         [ 7]  409 	adc	a, #0x00
   251F DD 77 F3      [19]  410 	ld	-13 (ix),a
                            411 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   2522 DD 7E FE      [19]  412 	ld	a,-2 (ix)
   2525 C6 04         [ 7]  413 	add	a, #0x04
   2527 DD 77 F0      [19]  414 	ld	-16 (ix),a
   252A DD 7E FF      [19]  415 	ld	a,-1 (ix)
   252D CE 00         [ 7]  416 	adc	a, #0x00
   252F DD 77 F1      [19]  417 	ld	-15 (ix),a
                            418 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   2532 DD 7E FE      [19]  419 	ld	a,-2 (ix)
   2535 C6 06         [ 7]  420 	add	a, #0x06
   2537 DD 77 EE      [19]  421 	ld	-18 (ix),a
   253A DD 7E FF      [19]  422 	ld	a,-1 (ix)
   253D CE 00         [ 7]  423 	adc	a, #0x00
   253F DD 77 EF      [19]  424 	ld	-17 (ix),a
                            425 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2542 DD 7E FE      [19]  426 	ld	a,-2 (ix)
   2545 C6 08         [ 7]  427 	add	a, #0x08
   2547 DD 77 EC      [19]  428 	ld	-20 (ix),a
   254A DD 7E FF      [19]  429 	ld	a,-1 (ix)
   254D CE 00         [ 7]  430 	adc	a, #0x00
   254F DD 77 ED      [19]  431 	ld	-19 (ix),a
                            432 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2552 DD 7E FE      [19]  433 	ld	a,-2 (ix)
   2555 C6 0A         [ 7]  434 	add	a, #0x0A
   2557 DD 77 EA      [19]  435 	ld	-22 (ix),a
   255A DD 7E FF      [19]  436 	ld	a,-1 (ix)
   255D CE 00         [ 7]  437 	adc	a, #0x00
   255F DD 77 EB      [19]  438 	ld	-21 (ix),a
                            439 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   2562 DD 7E FE      [19]  440 	ld	a,-2 (ix)
   2565 C6 0C         [ 7]  441 	add	a, #0x0C
   2567 DD 77 E8      [19]  442 	ld	-24 (ix),a
   256A DD 7E FF      [19]  443 	ld	a,-1 (ix)
   256D CE 00         [ 7]  444 	adc	a, #0x00
   256F DD 77 E9      [19]  445 	ld	-23 (ix),a
                            446 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2572 DD 7E FE      [19]  447 	ld	a,-2 (ix)
   2575 C6 0E         [ 7]  448 	add	a, #0x0E
   2577 DD 77 E6      [19]  449 	ld	-26 (ix),a
   257A DD 7E FF      [19]  450 	ld	a,-1 (ix)
   257D CE 00         [ 7]  451 	adc	a, #0x00
   257F DD 77 E7      [19]  452 	ld	-25 (ix),a
                            453 ;src/entities/enemies.c:90: enemies[k].movement=0;
   2582 DD 7E FE      [19]  454 	ld	a,-2 (ix)
   2585 C6 1D         [ 7]  455 	add	a, #0x1D
   2587 DD 77 E4      [19]  456 	ld	-28 (ix),a
   258A DD 7E FF      [19]  457 	ld	a,-1 (ix)
   258D CE 00         [ 7]  458 	adc	a, #0x00
   258F DD 77 E5      [19]  459 	ld	-27 (ix),a
                            460 ;src/entities/enemies.c:91: enemies[k].stage=0;
   2592 DD 7E FE      [19]  461 	ld	a,-2 (ix)
   2595 C6 1E         [ 7]  462 	add	a, #0x1E
   2597 DD 77 E2      [19]  463 	ld	-30 (ix),a
   259A DD 7E FF      [19]  464 	ld	a,-1 (ix)
   259D CE 00         [ 7]  465 	adc	a, #0x00
   259F DD 77 E3      [19]  466 	ld	-29 (ix),a
                            467 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   25A2 DD 7E FE      [19]  468 	ld	a,-2 (ix)
   25A5 C6 1F         [ 7]  469 	add	a, #0x1F
   25A7 DD 77 E0      [19]  470 	ld	-32 (ix),a
   25AA DD 7E FF      [19]  471 	ld	a,-1 (ix)
   25AD CE 00         [ 7]  472 	adc	a, #0x00
   25AF DD 77 E1      [19]  473 	ld	-31 (ix),a
                            474 ;src/entities/enemies.c:74: switch (type){
   25B2 DD 7E 08      [19]  475 	ld	a,8 (ix)
   25B5 3D            [ 4]  476 	dec	a
   25B6 28 0B         [12]  477 	jr	Z,00104$
   25B8 DD 7E 08      [19]  478 	ld	a,8 (ix)
   25BB D6 02         [ 7]  479 	sub	a, #0x02
   25BD CA 68 26      [10]  480 	jp	Z,00105$
   25C0 C3 0D 27      [10]  481 	jp	00106$
                            482 ;src/entities/enemies.c:76: case 1:
   25C3                     483 00104$:
                            484 ;src/entities/enemies.c:77: enemies[k].x=x;
   25C3 DD 6E FC      [19]  485 	ld	l,-4 (ix)
   25C6 DD 66 FD      [19]  486 	ld	h,-3 (ix)
   25C9 DD 7E 04      [19]  487 	ld	a,4 (ix)
   25CC 77            [ 7]  488 	ld	(hl),a
   25CD 23            [ 6]  489 	inc	hl
   25CE DD 7E 05      [19]  490 	ld	a,5 (ix)
   25D1 77            [ 7]  491 	ld	(hl),a
                            492 ;src/entities/enemies.c:78: enemies[k].y=y;
   25D2 DD 6E FA      [19]  493 	ld	l,-6 (ix)
   25D5 DD 66 FB      [19]  494 	ld	h,-5 (ix)
   25D8 DD 7E 06      [19]  495 	ld	a,6 (ix)
   25DB 77            [ 7]  496 	ld	(hl),a
   25DC 23            [ 6]  497 	inc	hl
   25DD DD 7E 07      [19]  498 	ld	a,7 (ix)
   25E0 77            [ 7]  499 	ld	(hl),a
                            500 ;src/entities/enemies.c:79: enemies[k].w=6;
   25E1 DD 6E F8      [19]  501 	ld	l,-8 (ix)
   25E4 DD 66 F9      [19]  502 	ld	h,-7 (ix)
   25E7 36 06         [10]  503 	ld	(hl),#0x06
                            504 ;src/entities/enemies.c:80: enemies[k].h=12;
   25E9 DD 6E F6      [19]  505 	ld	l,-10 (ix)
   25EC DD 66 F7      [19]  506 	ld	h,-9 (ix)
   25EF 36 0C         [10]  507 	ld	(hl),#0x0C
                            508 ;src/entities/enemies.c:81: enemies[k].num_frames=0;
   25F1 DD 6E F4      [19]  509 	ld	l,-12 (ix)
   25F4 DD 66 F5      [19]  510 	ld	h,-11 (ix)
   25F7 36 00         [10]  511 	ld	(hl),#0x00
                            512 ;src/entities/enemies.c:82: enemies[k].sprite[0]= (u8*) G_baddie02_00;
   25F9 DD 6E FE      [19]  513 	ld	l,-2 (ix)
   25FC DD 66 FF      [19]  514 	ld	h,-1 (ix)
   25FF 36 3F         [10]  515 	ld	(hl),#<(_G_baddie02_00)
   2601 23            [ 6]  516 	inc	hl
   2602 36 3C         [10]  517 	ld	(hl),#>(_G_baddie02_00)
                            518 ;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie02_01;
   2604 DD 6E F2      [19]  519 	ld	l,-14 (ix)
   2607 DD 66 F3      [19]  520 	ld	h,-13 (ix)
   260A 36 87         [10]  521 	ld	(hl),#<(_G_baddie02_01)
   260C 23            [ 6]  522 	inc	hl
   260D 36 3C         [10]  523 	ld	(hl),#>(_G_baddie02_01)
                            524 ;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie02_02;
   260F DD 6E F0      [19]  525 	ld	l,-16 (ix)
   2612 DD 66 F1      [19]  526 	ld	h,-15 (ix)
   2615 36 CF         [10]  527 	ld	(hl),#<(_G_baddie02_02)
   2617 23            [ 6]  528 	inc	hl
   2618 36 3C         [10]  529 	ld	(hl),#>(_G_baddie02_02)
                            530 ;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie02_03;
   261A DD 6E EE      [19]  531 	ld	l,-18 (ix)
   261D DD 66 EF      [19]  532 	ld	h,-17 (ix)
   2620 36 17         [10]  533 	ld	(hl),#<(_G_baddie02_03)
   2622 23            [ 6]  534 	inc	hl
   2623 36 3D         [10]  535 	ld	(hl),#>(_G_baddie02_03)
                            536 ;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie02_04;
   2625 DD 6E EC      [19]  537 	ld	l,-20 (ix)
   2628 DD 66 ED      [19]  538 	ld	h,-19 (ix)
   262B 36 5F         [10]  539 	ld	(hl),#<(_G_baddie02_04)
   262D 23            [ 6]  540 	inc	hl
   262E 36 3D         [10]  541 	ld	(hl),#>(_G_baddie02_04)
                            542 ;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie02_05;
   2630 DD 6E EA      [19]  543 	ld	l,-22 (ix)
   2633 DD 66 EB      [19]  544 	ld	h,-21 (ix)
   2636 36 A7         [10]  545 	ld	(hl),#<(_G_baddie02_05)
   2638 23            [ 6]  546 	inc	hl
   2639 36 3D         [10]  547 	ld	(hl),#>(_G_baddie02_05)
                            548 ;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie02_06;
   263B DD 6E E8      [19]  549 	ld	l,-24 (ix)
   263E DD 66 E9      [19]  550 	ld	h,-23 (ix)
   2641 36 EF         [10]  551 	ld	(hl),#<(_G_baddie02_06)
   2643 23            [ 6]  552 	inc	hl
   2644 36 3D         [10]  553 	ld	(hl),#>(_G_baddie02_06)
                            554 ;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie02_07;
   2646 DD 6E E6      [19]  555 	ld	l,-26 (ix)
   2649 DD 66 E7      [19]  556 	ld	h,-25 (ix)
   264C 36 37         [10]  557 	ld	(hl),#<(_G_baddie02_07)
   264E 23            [ 6]  558 	inc	hl
   264F 36 3E         [10]  559 	ld	(hl),#>(_G_baddie02_07)
                            560 ;src/entities/enemies.c:90: enemies[k].movement=0;
   2651 DD 6E E4      [19]  561 	ld	l,-28 (ix)
   2654 DD 66 E5      [19]  562 	ld	h,-27 (ix)
   2657 36 00         [10]  563 	ld	(hl),#0x00
                            564 ;src/entities/enemies.c:91: enemies[k].stage=0;
   2659 DD 6E E2      [19]  565 	ld	l,-30 (ix)
   265C DD 66 E3      [19]  566 	ld	h,-29 (ix)
   265F 36 00         [10]  567 	ld	(hl),#0x00
                            568 ;src/entities/enemies.c:92: enemies[k].stage_step=0;
   2661 E1            [10]  569 	pop	hl
   2662 E5            [11]  570 	push	hl
   2663 36 00         [10]  571 	ld	(hl),#0x00
                            572 ;src/entities/enemies.c:93: break;
   2665 C3 AF 27      [10]  573 	jp	00107$
                            574 ;src/entities/enemies.c:94: case 2:
   2668                     575 00105$:
                            576 ;src/entities/enemies.c:95: enemies[k].x=x;
   2668 DD 6E FC      [19]  577 	ld	l,-4 (ix)
   266B DD 66 FD      [19]  578 	ld	h,-3 (ix)
   266E DD 7E 04      [19]  579 	ld	a,4 (ix)
   2671 77            [ 7]  580 	ld	(hl),a
   2672 23            [ 6]  581 	inc	hl
   2673 DD 7E 05      [19]  582 	ld	a,5 (ix)
   2676 77            [ 7]  583 	ld	(hl),a
                            584 ;src/entities/enemies.c:96: enemies[k].y=y;
   2677 DD 6E FA      [19]  585 	ld	l,-6 (ix)
   267A DD 66 FB      [19]  586 	ld	h,-5 (ix)
   267D DD 7E 06      [19]  587 	ld	a,6 (ix)
   2680 77            [ 7]  588 	ld	(hl),a
   2681 23            [ 6]  589 	inc	hl
   2682 DD 7E 07      [19]  590 	ld	a,7 (ix)
   2685 77            [ 7]  591 	ld	(hl),a
                            592 ;src/entities/enemies.c:97: enemies[k].w=4;
   2686 DD 6E F8      [19]  593 	ld	l,-8 (ix)
   2689 DD 66 F9      [19]  594 	ld	h,-7 (ix)
   268C 36 04         [10]  595 	ld	(hl),#0x04
                            596 ;src/entities/enemies.c:98: enemies[k].h=8;
   268E DD 6E F6      [19]  597 	ld	l,-10 (ix)
   2691 DD 66 F7      [19]  598 	ld	h,-9 (ix)
   2694 36 08         [10]  599 	ld	(hl),#0x08
                            600 ;src/entities/enemies.c:99: enemies[k].num_frames=0;
   2696 DD 6E F4      [19]  601 	ld	l,-12 (ix)
   2699 DD 66 F5      [19]  602 	ld	h,-11 (ix)
   269C 36 00         [10]  603 	ld	(hl),#0x00
                            604 ;src/entities/enemies.c:100: enemies[k].sprite[0]= (u8*) G_baddie03_00;
   269E DD 6E FE      [19]  605 	ld	l,-2 (ix)
   26A1 DD 66 FF      [19]  606 	ld	h,-1 (ix)
   26A4 36 37         [10]  607 	ld	(hl),#<(_G_baddie03_00)
   26A6 23            [ 6]  608 	inc	hl
   26A7 36 41         [10]  609 	ld	(hl),#>(_G_baddie03_00)
                            610 ;src/entities/enemies.c:101: enemies[k].sprite[1]= (u8*) G_baddie03_01;
   26A9 DD 6E F2      [19]  611 	ld	l,-14 (ix)
   26AC DD 66 F3      [19]  612 	ld	h,-13 (ix)
   26AF 36 57         [10]  613 	ld	(hl),#<(_G_baddie03_01)
   26B1 23            [ 6]  614 	inc	hl
   26B2 36 41         [10]  615 	ld	(hl),#>(_G_baddie03_01)
                            616 ;src/entities/enemies.c:102: enemies[k].sprite[2]= (u8*) G_baddie03_02;
   26B4 DD 6E F0      [19]  617 	ld	l,-16 (ix)
   26B7 DD 66 F1      [19]  618 	ld	h,-15 (ix)
   26BA 36 77         [10]  619 	ld	(hl),#<(_G_baddie03_02)
   26BC 23            [ 6]  620 	inc	hl
   26BD 36 41         [10]  621 	ld	(hl),#>(_G_baddie03_02)
                            622 ;src/entities/enemies.c:103: enemies[k].sprite[3]= (u8*) G_baddie03_03;
   26BF DD 6E EE      [19]  623 	ld	l,-18 (ix)
   26C2 DD 66 EF      [19]  624 	ld	h,-17 (ix)
   26C5 36 97         [10]  625 	ld	(hl),#<(_G_baddie03_03)
   26C7 23            [ 6]  626 	inc	hl
   26C8 36 41         [10]  627 	ld	(hl),#>(_G_baddie03_03)
                            628 ;src/entities/enemies.c:104: enemies[k].sprite[4]= (u8*) G_baddie03_04;
   26CA DD 6E EC      [19]  629 	ld	l,-20 (ix)
   26CD DD 66 ED      [19]  630 	ld	h,-19 (ix)
   26D0 36 B7         [10]  631 	ld	(hl),#<(_G_baddie03_04)
   26D2 23            [ 6]  632 	inc	hl
   26D3 36 41         [10]  633 	ld	(hl),#>(_G_baddie03_04)
                            634 ;src/entities/enemies.c:105: enemies[k].sprite[5]= (u8*) G_baddie03_05;
   26D5 DD 6E EA      [19]  635 	ld	l,-22 (ix)
   26D8 DD 66 EB      [19]  636 	ld	h,-21 (ix)
   26DB 36 D7         [10]  637 	ld	(hl),#<(_G_baddie03_05)
   26DD 23            [ 6]  638 	inc	hl
   26DE 36 41         [10]  639 	ld	(hl),#>(_G_baddie03_05)
                            640 ;src/entities/enemies.c:106: enemies[k].sprite[6]= (u8*) G_baddie03_06;
   26E0 DD 6E E8      [19]  641 	ld	l,-24 (ix)
   26E3 DD 66 E9      [19]  642 	ld	h,-23 (ix)
   26E6 36 F7         [10]  643 	ld	(hl),#<(_G_baddie03_06)
   26E8 23            [ 6]  644 	inc	hl
   26E9 36 41         [10]  645 	ld	(hl),#>(_G_baddie03_06)
                            646 ;src/entities/enemies.c:107: enemies[k].sprite[7]= (u8*) G_baddie03_07;
   26EB DD 6E E6      [19]  647 	ld	l,-26 (ix)
   26EE DD 66 E7      [19]  648 	ld	h,-25 (ix)
   26F1 36 17         [10]  649 	ld	(hl),#<(_G_baddie03_07)
   26F3 23            [ 6]  650 	inc	hl
   26F4 36 42         [10]  651 	ld	(hl),#>(_G_baddie03_07)
                            652 ;src/entities/enemies.c:108: enemies[k].movement=0;
   26F6 DD 6E E4      [19]  653 	ld	l,-28 (ix)
   26F9 DD 66 E5      [19]  654 	ld	h,-27 (ix)
   26FC 36 00         [10]  655 	ld	(hl),#0x00
                            656 ;src/entities/enemies.c:109: enemies[k].stage=0;
   26FE DD 6E E2      [19]  657 	ld	l,-30 (ix)
   2701 DD 66 E3      [19]  658 	ld	h,-29 (ix)
   2704 36 00         [10]  659 	ld	(hl),#0x00
                            660 ;src/entities/enemies.c:110: enemies[k].stage_step=0;
   2706 E1            [10]  661 	pop	hl
   2707 E5            [11]  662 	push	hl
   2708 36 00         [10]  663 	ld	(hl),#0x00
                            664 ;src/entities/enemies.c:111: break;
   270A C3 AF 27      [10]  665 	jp	00107$
                            666 ;src/entities/enemies.c:112: default:
   270D                     667 00106$:
                            668 ;src/entities/enemies.c:113: enemies[k].x=x;
   270D DD 6E FC      [19]  669 	ld	l,-4 (ix)
   2710 DD 66 FD      [19]  670 	ld	h,-3 (ix)
   2713 DD 7E 04      [19]  671 	ld	a,4 (ix)
   2716 77            [ 7]  672 	ld	(hl),a
   2717 23            [ 6]  673 	inc	hl
   2718 DD 7E 05      [19]  674 	ld	a,5 (ix)
   271B 77            [ 7]  675 	ld	(hl),a
                            676 ;src/entities/enemies.c:114: enemies[k].y=y;
   271C DD 6E FA      [19]  677 	ld	l,-6 (ix)
   271F DD 66 FB      [19]  678 	ld	h,-5 (ix)
   2722 DD 7E 06      [19]  679 	ld	a,6 (ix)
   2725 77            [ 7]  680 	ld	(hl),a
   2726 23            [ 6]  681 	inc	hl
   2727 DD 7E 07      [19]  682 	ld	a,7 (ix)
   272A 77            [ 7]  683 	ld	(hl),a
                            684 ;src/entities/enemies.c:115: enemies[k].w=5;
   272B DD 6E F8      [19]  685 	ld	l,-8 (ix)
   272E DD 66 F9      [19]  686 	ld	h,-7 (ix)
   2731 36 05         [10]  687 	ld	(hl),#0x05
                            688 ;src/entities/enemies.c:116: enemies[k].h=16;
   2733 DD 6E F6      [19]  689 	ld	l,-10 (ix)
   2736 DD 66 F7      [19]  690 	ld	h,-9 (ix)
   2739 36 10         [10]  691 	ld	(hl),#0x10
                            692 ;src/entities/enemies.c:117: enemies[k].num_frames=0;
   273B DD 6E F4      [19]  693 	ld	l,-12 (ix)
   273E DD 66 F5      [19]  694 	ld	h,-11 (ix)
   2741 36 00         [10]  695 	ld	(hl),#0x00
                            696 ;src/entities/enemies.c:118: enemies[k].sprite[0]= (u8*) G_baddie01_00;
   2743 DD 6E FE      [19]  697 	ld	l,-2 (ix)
   2746 DD 66 FF      [19]  698 	ld	h,-1 (ix)
   2749 36 BF         [10]  699 	ld	(hl),#<(_G_baddie01_00)
   274B 23            [ 6]  700 	inc	hl
   274C 36 39         [10]  701 	ld	(hl),#>(_G_baddie01_00)
                            702 ;src/entities/enemies.c:119: enemies[k].sprite[1]= (u8*) G_baddie01_01;
   274E DD 6E F2      [19]  703 	ld	l,-14 (ix)
   2751 DD 66 F3      [19]  704 	ld	h,-13 (ix)
   2754 36 0F         [10]  705 	ld	(hl),#<(_G_baddie01_01)
   2756 23            [ 6]  706 	inc	hl
   2757 36 3A         [10]  707 	ld	(hl),#>(_G_baddie01_01)
                            708 ;src/entities/enemies.c:120: enemies[k].sprite[2]= (u8*) G_baddie01_02;
   2759 DD 6E F0      [19]  709 	ld	l,-16 (ix)
   275C DD 66 F1      [19]  710 	ld	h,-15 (ix)
   275F 36 5F         [10]  711 	ld	(hl),#<(_G_baddie01_02)
   2761 23            [ 6]  712 	inc	hl
   2762 36 3A         [10]  713 	ld	(hl),#>(_G_baddie01_02)
                            714 ;src/entities/enemies.c:121: enemies[k].sprite[3]= (u8*) G_baddie01_03;
   2764 DD 6E EE      [19]  715 	ld	l,-18 (ix)
   2767 DD 66 EF      [19]  716 	ld	h,-17 (ix)
   276A 36 AF         [10]  717 	ld	(hl),#<(_G_baddie01_03)
   276C 23            [ 6]  718 	inc	hl
   276D 36 3A         [10]  719 	ld	(hl),#>(_G_baddie01_03)
                            720 ;src/entities/enemies.c:122: enemies[k].sprite[4]= (u8*) G_baddie01_04;
   276F DD 6E EC      [19]  721 	ld	l,-20 (ix)
   2772 DD 66 ED      [19]  722 	ld	h,-19 (ix)
   2775 36 FF         [10]  723 	ld	(hl),#<(_G_baddie01_04)
   2777 23            [ 6]  724 	inc	hl
   2778 36 3A         [10]  725 	ld	(hl),#>(_G_baddie01_04)
                            726 ;src/entities/enemies.c:123: enemies[k].sprite[5]= (u8*) G_baddie01_05;
   277A DD 6E EA      [19]  727 	ld	l,-22 (ix)
   277D DD 66 EB      [19]  728 	ld	h,-21 (ix)
   2780 36 4F         [10]  729 	ld	(hl),#<(_G_baddie01_05)
   2782 23            [ 6]  730 	inc	hl
   2783 36 3B         [10]  731 	ld	(hl),#>(_G_baddie01_05)
                            732 ;src/entities/enemies.c:124: enemies[k].sprite[6]= (u8*) G_baddie01_06;
   2785 DD 6E E8      [19]  733 	ld	l,-24 (ix)
   2788 DD 66 E9      [19]  734 	ld	h,-23 (ix)
   278B 36 9F         [10]  735 	ld	(hl),#<(_G_baddie01_06)
   278D 23            [ 6]  736 	inc	hl
   278E 36 3B         [10]  737 	ld	(hl),#>(_G_baddie01_06)
                            738 ;src/entities/enemies.c:125: enemies[k].sprite[7]= (u8*) G_baddie01_07;
   2790 DD 6E E6      [19]  739 	ld	l,-26 (ix)
   2793 DD 66 E7      [19]  740 	ld	h,-25 (ix)
   2796 36 EF         [10]  741 	ld	(hl),#<(_G_baddie01_07)
   2798 23            [ 6]  742 	inc	hl
   2799 36 3B         [10]  743 	ld	(hl),#>(_G_baddie01_07)
                            744 ;src/entities/enemies.c:126: enemies[k].movement=1;
   279B DD 6E E4      [19]  745 	ld	l,-28 (ix)
   279E DD 66 E5      [19]  746 	ld	h,-27 (ix)
   27A1 36 01         [10]  747 	ld	(hl),#0x01
                            748 ;src/entities/enemies.c:127: enemies[k].stage=0;
   27A3 DD 6E E2      [19]  749 	ld	l,-30 (ix)
   27A6 DD 66 E3      [19]  750 	ld	h,-29 (ix)
   27A9 36 00         [10]  751 	ld	(hl),#0x00
                            752 ;src/entities/enemies.c:128: enemies[k].stage_step=0;
   27AB E1            [10]  753 	pop	hl
   27AC E5            [11]  754 	push	hl
   27AD 36 00         [10]  755 	ld	(hl),#0x00
                            756 ;src/entities/enemies.c:130: }
   27AF                     757 00107$:
                            758 ;src/entities/enemies.c:131: active_enemies++;
   27AF 21 32 56      [10]  759 	ld	hl, #_active_enemies+0
   27B2 34            [11]  760 	inc	(hl)
   27B3                     761 00110$:
   27B3 DD F9         [10]  762 	ld	sp, ix
   27B5 DD E1         [14]  763 	pop	ix
   27B7 C9            [10]  764 	ret
                            765 ;src/entities/enemies.c:137: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
                            766 ;	---------------------------------
                            767 ; Function create_enemy_group
                            768 ; ---------------------------------
   27B8                     769 _create_enemy_group::
   27B8 DD E5         [15]  770 	push	ix
   27BA DD 21 00 00   [14]  771 	ld	ix,#0
   27BE DD 39         [15]  772 	add	ix,sp
                            773 ;src/entities/enemies.c:139: if (active_groups < MAX_ENEMY_GROUPS){
   27C0 3A 53 56      [13]  774 	ld	a,(#_active_groups + 0)
   27C3 D6 04         [ 7]  775 	sub	a, #0x04
   27C5 30 4E         [12]  776 	jr	NC,00106$
                            777 ;src/entities/enemies.c:141: while (groups[k].active){
   27C7 16 00         [ 7]  778 	ld	d,#0x00
   27C9                     779 00101$:
   27C9 6A            [ 4]  780 	ld	l,d
   27CA 26 00         [ 7]  781 	ld	h,#0x00
   27CC 29            [11]  782 	add	hl, hl
   27CD 29            [11]  783 	add	hl, hl
   27CE 29            [11]  784 	add	hl, hl
   27CF 3E 33         [ 7]  785 	ld	a,#<(_groups)
   27D1 85            [ 4]  786 	add	a, l
   27D2 4F            [ 4]  787 	ld	c,a
   27D3 3E 56         [ 7]  788 	ld	a,#>(_groups)
   27D5 8C            [ 4]  789 	adc	a, h
   27D6 47            [ 4]  790 	ld	b,a
   27D7 0A            [ 7]  791 	ld	a,(bc)
   27D8 B7            [ 4]  792 	or	a, a
   27D9 28 03         [12]  793 	jr	Z,00103$
                            794 ;src/entities/enemies.c:142: k++;
   27DB 14            [ 4]  795 	inc	d
   27DC 18 EB         [12]  796 	jr	00101$
   27DE                     797 00103$:
                            798 ;src/entities/enemies.c:144: groups[k].active=1;
   27DE 3E 01         [ 7]  799 	ld	a,#0x01
   27E0 02            [ 7]  800 	ld	(bc),a
                            801 ;src/entities/enemies.c:145: groups[k].x=x;
   27E1 69            [ 4]  802 	ld	l, c
   27E2 60            [ 4]  803 	ld	h, b
   27E3 23            [ 6]  804 	inc	hl
   27E4 DD 7E 04      [19]  805 	ld	a,4 (ix)
   27E7 77            [ 7]  806 	ld	(hl),a
   27E8 23            [ 6]  807 	inc	hl
   27E9 DD 7E 05      [19]  808 	ld	a,5 (ix)
   27EC 77            [ 7]  809 	ld	(hl),a
                            810 ;src/entities/enemies.c:146: groups[k].y=y;
   27ED 69            [ 4]  811 	ld	l, c
   27EE 60            [ 4]  812 	ld	h, b
   27EF 23            [ 6]  813 	inc	hl
   27F0 23            [ 6]  814 	inc	hl
   27F1 23            [ 6]  815 	inc	hl
   27F2 DD 7E 06      [19]  816 	ld	a,6 (ix)
   27F5 77            [ 7]  817 	ld	(hl),a
   27F6 23            [ 6]  818 	inc	hl
   27F7 DD 7E 07      [19]  819 	ld	a,7 (ix)
   27FA 77            [ 7]  820 	ld	(hl),a
                            821 ;src/entities/enemies.c:147: groups[k].enemy_type=type;
   27FB 21 05 00      [10]  822 	ld	hl,#0x0005
   27FE 09            [11]  823 	add	hl,bc
   27FF DD 7E 08      [19]  824 	ld	a,8 (ix)
   2802 77            [ 7]  825 	ld	(hl),a
                            826 ;src/entities/enemies.c:148: groups[k].num_enemies=num_enemies;
   2803 21 06 00      [10]  827 	ld	hl,#0x0006
   2806 09            [11]  828 	add	hl,bc
   2807 DD 7E 09      [19]  829 	ld	a,9 (ix)
   280A 77            [ 7]  830 	ld	(hl),a
                            831 ;src/entities/enemies.c:149: groups[k].sleep=ENEMY_GAP;
   280B 21 07 00      [10]  832 	ld	hl,#0x0007
   280E 09            [11]  833 	add	hl,bc
   280F 36 03         [10]  834 	ld	(hl),#0x03
                            835 ;src/entities/enemies.c:150: active_groups++;
   2811 21 53 56      [10]  836 	ld	hl, #_active_groups+0
   2814 34            [11]  837 	inc	(hl)
   2815                     838 00106$:
   2815 DD E1         [14]  839 	pop	ix
   2817 C9            [10]  840 	ret
                            841 ;src/entities/enemies.c:158: void update_enemies(){
                            842 ;	---------------------------------
                            843 ; Function update_enemies
                            844 ; ---------------------------------
   2818                     845 _update_enemies::
   2818 DD E5         [15]  846 	push	ix
   281A DD 21 00 00   [14]  847 	ld	ix,#0
   281E DD 39         [15]  848 	add	ix,sp
   2820 21 EB FF      [10]  849 	ld	hl,#-21
   2823 39            [11]  850 	add	hl,sp
   2824 F9            [ 6]  851 	ld	sp,hl
                            852 ;src/entities/enemies.c:162: if (active_enemies>0){
   2825 3A 32 56      [13]  853 	ld	a,(#_active_enemies + 0)
   2828 B7            [ 4]  854 	or	a, a
   2829 CA E0 2C      [10]  855 	jp	Z,00112$
                            856 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   282C DD 36 EB 00   [19]  857 	ld	-21 (ix),#0x00
   2830 DD 36 FB 00   [19]  858 	ld	-5 (ix),#0x00
   2834 DD 36 FC 00   [19]  859 	ld	-4 (ix),#0x00
   2838 DD 36 FD 00   [19]  860 	ld	-3 (ix),#0x00
   283C DD 36 FE 00   [19]  861 	ld	-2 (ix),#0x00
   2840                     862 00124$:
                            863 ;src/entities/enemies.c:164: if (enemies[i].active){
   2840 3E FA         [ 7]  864 	ld	a,#<(_enemies)
   2842 DD 86 FD      [19]  865 	add	a, -3 (ix)
   2845 DD 77 EC      [19]  866 	ld	-20 (ix),a
   2848 3E 51         [ 7]  867 	ld	a,#>(_enemies)
   284A DD 8E FE      [19]  868 	adc	a, -2 (ix)
   284D DD 77 ED      [19]  869 	ld	-19 (ix),a
   2850 DD 4E EC      [19]  870 	ld	c,-20 (ix)
   2853 DD 46 ED      [19]  871 	ld	b,-19 (ix)
   2856 C5            [11]  872 	push	bc
   2857 FD E1         [14]  873 	pop	iy
   2859 FD 7E 17      [19]  874 	ld	a,23 (iy)
   285C DD 77 FF      [19]  875 	ld	-1 (ix), a
   285F B7            [ 4]  876 	or	a, a
   2860 CA B5 2C      [10]  877 	jp	Z,00125$
                            878 ;src/entities/enemies.c:165: if (enemies[i].movement<99){
   2863 DD 7E EC      [19]  879 	ld	a,-20 (ix)
   2866 C6 1D         [ 7]  880 	add	a, #0x1D
   2868 DD 77 F9      [19]  881 	ld	-7 (ix),a
   286B DD 7E ED      [19]  882 	ld	a,-19 (ix)
   286E CE 00         [ 7]  883 	adc	a, #0x00
   2870 DD 77 FA      [19]  884 	ld	-6 (ix),a
   2873 DD 6E F9      [19]  885 	ld	l,-7 (ix)
   2876 DD 66 FA      [19]  886 	ld	h,-6 (ix)
   2879 56            [ 7]  887 	ld	d,(hl)
   287A 7A            [ 4]  888 	ld	a,d
   287B D6 63         [ 7]  889 	sub	a, #0x63
   287D D2 B5 2C      [10]  890 	jp	NC,00125$
                            891 ;src/entities/enemies.c:166: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
   2880 DD 7E EC      [19]  892 	ld	a,-20 (ix)
   2883 C6 1F         [ 7]  893 	add	a, #0x1F
   2885 DD 77 F7      [19]  894 	ld	-9 (ix),a
   2888 DD 7E ED      [19]  895 	ld	a,-19 (ix)
   288B CE 00         [ 7]  896 	adc	a, #0x00
   288D DD 77 F8      [19]  897 	ld	-8 (ix),a
   2890 DD 6E F7      [19]  898 	ld	l,-9 (ix)
   2893 DD 66 F8      [19]  899 	ld	h,-8 (ix)
   2896 5E            [ 7]  900 	ld	e,(hl)
   2897 4A            [ 4]  901 	ld	c,d
   2898 06 00         [ 7]  902 	ld	b,#0x00
   289A 69            [ 4]  903 	ld	l, c
   289B 60            [ 4]  904 	ld	h, b
   289C 29            [11]  905 	add	hl, hl
   289D 29            [11]  906 	add	hl, hl
   289E 29            [11]  907 	add	hl, hl
   289F 29            [11]  908 	add	hl, hl
   28A0 29            [11]  909 	add	hl, hl
   28A1 09            [11]  910 	add	hl, bc
   28A2 01 F8 30      [10]  911 	ld	bc,#_movements
   28A5 09            [11]  912 	add	hl,bc
   28A6 23            [ 6]  913 	inc	hl
   28A7 45            [ 4]  914 	ld	b,l
   28A8 54            [ 4]  915 	ld	d,h
   28A9 DD 7E EC      [19]  916 	ld	a,-20 (ix)
   28AC C6 1E         [ 7]  917 	add	a, #0x1E
   28AE DD 77 F5      [19]  918 	ld	-11 (ix),a
   28B1 DD 7E ED      [19]  919 	ld	a,-19 (ix)
   28B4 CE 00         [ 7]  920 	adc	a, #0x00
   28B6 DD 77 F6      [19]  921 	ld	-10 (ix),a
   28B9 DD 6E F5      [19]  922 	ld	l,-11 (ix)
   28BC DD 66 F6      [19]  923 	ld	h,-10 (ix)
   28BF 7E            [ 7]  924 	ld	a,(hl)
   28C0 DD 77 FF      [19]  925 	ld	-1 (ix), a
   28C3 87            [ 4]  926 	add	a, a
   28C4 87            [ 4]  927 	add	a, a
   28C5 80            [ 4]  928 	add	a,b
   28C6 DD 77 F3      [19]  929 	ld	-13 (ix),a
   28C9 7A            [ 4]  930 	ld	a,d
   28CA CE 00         [ 7]  931 	adc	a, #0x00
   28CC DD 77 F4      [19]  932 	ld	-12 (ix),a
   28CF DD 6E F3      [19]  933 	ld	l,-13 (ix)
   28D2 DD 66 F4      [19]  934 	ld	h,-12 (ix)
   28D5 23            [ 6]  935 	inc	hl
   28D6 23            [ 6]  936 	inc	hl
   28D7 23            [ 6]  937 	inc	hl
   28D8 66            [ 7]  938 	ld	h,(hl)
   28D9 7B            [ 4]  939 	ld	a,e
   28DA 94            [ 4]  940 	sub	a, h
   28DB D2 4B 2A      [10]  941 	jp	NC,00104$
                            942 ;src/entities/enemies.c:167: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   28DE DD 7E EC      [19]  943 	ld	a,-20 (ix)
   28E1 C6 16         [ 7]  944 	add	a, #0x16
   28E3 DD 77 F1      [19]  945 	ld	-15 (ix),a
   28E6 DD 7E ED      [19]  946 	ld	a,-19 (ix)
   28E9 CE 00         [ 7]  947 	adc	a, #0x00
   28EB DD 77 F2      [19]  948 	ld	-14 (ix),a
   28EE DD 6E F3      [19]  949 	ld	l,-13 (ix)
   28F1 DD 66 F4      [19]  950 	ld	h,-12 (ix)
   28F4 7E            [ 7]  951 	ld	a,(hl)
   28F5 DD 77 F3      [19]  952 	ld	-13 (ix),a
   28F8 DD 6E F1      [19]  953 	ld	l,-15 (ix)
   28FB DD 66 F2      [19]  954 	ld	h,-14 (ix)
   28FE DD 7E F3      [19]  955 	ld	a,-13 (ix)
   2901 77            [ 7]  956 	ld	(hl),a
                            957 ;src/entities/enemies.c:168: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2902 DD 7E EC      [19]  958 	ld	a,-20 (ix)
   2905 C6 10         [ 7]  959 	add	a, #0x10
   2907 DD 77 F1      [19]  960 	ld	-15 (ix),a
   290A DD 7E ED      [19]  961 	ld	a,-19 (ix)
   290D CE 00         [ 7]  962 	adc	a, #0x00
   290F DD 77 F2      [19]  963 	ld	-14 (ix),a
   2912 DD 6E F1      [19]  964 	ld	l,-15 (ix)
   2915 DD 66 F2      [19]  965 	ld	h,-14 (ix)
   2918 7E            [ 7]  966 	ld	a,(hl)
   2919 DD 77 F3      [19]  967 	ld	-13 (ix),a
   291C 23            [ 6]  968 	inc	hl
   291D 7E            [ 7]  969 	ld	a,(hl)
   291E DD 77 F4      [19]  970 	ld	-12 (ix),a
   2921 DD 6E F9      [19]  971 	ld	l,-7 (ix)
   2924 DD 66 FA      [19]  972 	ld	h,-6 (ix)
   2927 4E            [ 7]  973 	ld	c, (hl)
   2928 06 00         [ 7]  974 	ld	b,#0x00
   292A 69            [ 4]  975 	ld	l, c
   292B 60            [ 4]  976 	ld	h, b
   292C 29            [11]  977 	add	hl, hl
   292D 29            [11]  978 	add	hl, hl
   292E 29            [11]  979 	add	hl, hl
   292F 29            [11]  980 	add	hl, hl
   2930 29            [11]  981 	add	hl, hl
   2931 09            [11]  982 	add	hl, bc
   2932 3E F8         [ 7]  983 	ld	a,#<(_movements)
   2934 85            [ 4]  984 	add	a, l
   2935 DD 77 EF      [19]  985 	ld	-17 (ix),a
   2938 3E 30         [ 7]  986 	ld	a,#>(_movements)
   293A 8C            [ 4]  987 	adc	a, h
   293B DD 77 F0      [19]  988 	ld	-16 (ix),a
   293E DD 34 EF      [23]  989 	inc	-17 (ix)
   2941 20 03         [12]  990 	jr	NZ,00176$
   2943 DD 34 F0      [23]  991 	inc	-16 (ix)
   2946                     992 00176$:
   2946 DD 6E F5      [19]  993 	ld	l,-11 (ix)
   2949 DD 66 F6      [19]  994 	ld	h,-10 (ix)
   294C 7E            [ 7]  995 	ld	a,(hl)
   294D DD 77 EE      [19]  996 	ld	-18 (ix), a
   2950 87            [ 4]  997 	add	a, a
   2951 87            [ 4]  998 	add	a, a
   2952 67            [ 4]  999 	ld	h,a
   2953 DD 7E EF      [19] 1000 	ld	a,-17 (ix)
   2956 84            [ 4] 1001 	add	a, h
   2957 DD 77 EF      [19] 1002 	ld	-17 (ix),a
   295A DD 7E F0      [19] 1003 	ld	a,-16 (ix)
   295D CE 00         [ 7] 1004 	adc	a, #0x00
   295F DD 77 F0      [19] 1005 	ld	-16 (ix),a
   2962 DD 6E EF      [19] 1006 	ld	l,-17 (ix)
   2965 DD 66 F0      [19] 1007 	ld	h,-16 (ix)
   2968 23            [ 6] 1008 	inc	hl
   2969 7E            [ 7] 1009 	ld	a,(hl)
   296A DD 77 EE      [19] 1010 	ld	-18 (ix), a
   296D DD 77 EF      [19] 1011 	ld	-17 (ix),a
   2970 DD 7E EE      [19] 1012 	ld	a,-18 (ix)
   2973 17            [ 4] 1013 	rla
   2974 9F            [ 4] 1014 	sbc	a, a
   2975 DD 77 F0      [19] 1015 	ld	-16 (ix),a
   2978 DD 7E F3      [19] 1016 	ld	a,-13 (ix)
   297B DD 86 EF      [19] 1017 	add	a, -17 (ix)
   297E DD 77 EF      [19] 1018 	ld	-17 (ix),a
   2981 DD 7E F4      [19] 1019 	ld	a,-12 (ix)
   2984 DD 8E F0      [19] 1020 	adc	a, -16 (ix)
   2987 DD 77 F0      [19] 1021 	ld	-16 (ix),a
   298A DD 6E F1      [19] 1022 	ld	l,-15 (ix)
   298D DD 66 F2      [19] 1023 	ld	h,-14 (ix)
   2990 DD 7E EF      [19] 1024 	ld	a,-17 (ix)
   2993 77            [ 7] 1025 	ld	(hl),a
   2994 23            [ 6] 1026 	inc	hl
   2995 DD 7E F0      [19] 1027 	ld	a,-16 (ix)
   2998 77            [ 7] 1028 	ld	(hl),a
                           1029 ;src/entities/enemies.c:169: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2999 DD 7E EC      [19] 1030 	ld	a,-20 (ix)
   299C C6 12         [ 7] 1031 	add	a, #0x12
   299E DD 77 EF      [19] 1032 	ld	-17 (ix),a
   29A1 DD 7E ED      [19] 1033 	ld	a,-19 (ix)
   29A4 CE 00         [ 7] 1034 	adc	a, #0x00
   29A6 DD 77 F0      [19] 1035 	ld	-16 (ix),a
   29A9 DD 6E EF      [19] 1036 	ld	l,-17 (ix)
   29AC DD 66 F0      [19] 1037 	ld	h,-16 (ix)
   29AF 7E            [ 7] 1038 	ld	a,(hl)
   29B0 DD 77 F1      [19] 1039 	ld	-15 (ix),a
   29B3 23            [ 6] 1040 	inc	hl
   29B4 7E            [ 7] 1041 	ld	a,(hl)
   29B5 DD 77 F2      [19] 1042 	ld	-14 (ix),a
   29B8 DD 6E F9      [19] 1043 	ld	l,-7 (ix)
   29BB DD 66 FA      [19] 1044 	ld	h,-6 (ix)
   29BE 4E            [ 7] 1045 	ld	c, (hl)
   29BF 06 00         [ 7] 1046 	ld	b,#0x00
   29C1 69            [ 4] 1047 	ld	l, c
   29C2 60            [ 4] 1048 	ld	h, b
   29C3 29            [11] 1049 	add	hl, hl
   29C4 29            [11] 1050 	add	hl, hl
   29C5 29            [11] 1051 	add	hl, hl
   29C6 29            [11] 1052 	add	hl, hl
   29C7 29            [11] 1053 	add	hl, hl
   29C8 09            [11] 1054 	add	hl, bc
   29C9 3E F8         [ 7] 1055 	ld	a,#<(_movements)
   29CB 85            [ 4] 1056 	add	a, l
   29CC DD 77 F3      [19] 1057 	ld	-13 (ix),a
   29CF 3E 30         [ 7] 1058 	ld	a,#>(_movements)
   29D1 8C            [ 4] 1059 	adc	a, h
   29D2 DD 77 F4      [19] 1060 	ld	-12 (ix),a
   29D5 DD 34 F3      [23] 1061 	inc	-13 (ix)
   29D8 20 03         [12] 1062 	jr	NZ,00177$
   29DA DD 34 F4      [23] 1063 	inc	-12 (ix)
   29DD                    1064 00177$:
   29DD DD 6E F5      [19] 1065 	ld	l,-11 (ix)
   29E0 DD 66 F6      [19] 1066 	ld	h,-10 (ix)
   29E3 7E            [ 7] 1067 	ld	a,(hl)
   29E4 DD 77 EE      [19] 1068 	ld	-18 (ix), a
   29E7 87            [ 4] 1069 	add	a, a
   29E8 87            [ 4] 1070 	add	a, a
   29E9 67            [ 4] 1071 	ld	h,a
   29EA DD 7E F3      [19] 1072 	ld	a,-13 (ix)
   29ED 84            [ 4] 1073 	add	a, h
   29EE DD 77 F3      [19] 1074 	ld	-13 (ix),a
   29F1 DD 7E F4      [19] 1075 	ld	a,-12 (ix)
   29F4 CE 00         [ 7] 1076 	adc	a, #0x00
   29F6 DD 77 F4      [19] 1077 	ld	-12 (ix),a
   29F9 DD 6E F3      [19] 1078 	ld	l,-13 (ix)
   29FC DD 66 F4      [19] 1079 	ld	h,-12 (ix)
   29FF 23            [ 6] 1080 	inc	hl
   2A00 23            [ 6] 1081 	inc	hl
   2A01 7E            [ 7] 1082 	ld	a,(hl)
   2A02 DD 77 EE      [19] 1083 	ld	-18 (ix), a
   2A05 DD 77 F3      [19] 1084 	ld	-13 (ix),a
   2A08 DD 7E EE      [19] 1085 	ld	a,-18 (ix)
   2A0B 17            [ 4] 1086 	rla
   2A0C 9F            [ 4] 1087 	sbc	a, a
   2A0D DD 77 F4      [19] 1088 	ld	-12 (ix),a
   2A10 DD 7E F1      [19] 1089 	ld	a,-15 (ix)
   2A13 DD 86 F3      [19] 1090 	add	a, -13 (ix)
   2A16 DD 77 F1      [19] 1091 	ld	-15 (ix),a
   2A19 DD 7E F2      [19] 1092 	ld	a,-14 (ix)
   2A1C DD 8E F4      [19] 1093 	adc	a, -12 (ix)
   2A1F DD 77 F2      [19] 1094 	ld	-14 (ix),a
   2A22 DD 6E EF      [19] 1095 	ld	l,-17 (ix)
   2A25 DD 66 F0      [19] 1096 	ld	h,-16 (ix)
   2A28 DD 7E F1      [19] 1097 	ld	a,-15 (ix)
   2A2B 77            [ 7] 1098 	ld	(hl),a
   2A2C 23            [ 6] 1099 	inc	hl
   2A2D DD 7E F2      [19] 1100 	ld	a,-14 (ix)
   2A30 77            [ 7] 1101 	ld	(hl),a
                           1102 ;src/entities/enemies.c:170: enemies[i].stage_step++;
   2A31 DD 6E F7      [19] 1103 	ld	l,-9 (ix)
   2A34 DD 66 F8      [19] 1104 	ld	h,-8 (ix)
   2A37 7E            [ 7] 1105 	ld	a,(hl)
   2A38 DD 77 EE      [19] 1106 	ld	-18 (ix),a
   2A3B DD 34 EE      [23] 1107 	inc	-18 (ix)
   2A3E DD 6E F7      [19] 1108 	ld	l,-9 (ix)
   2A41 DD 66 F8      [19] 1109 	ld	h,-8 (ix)
   2A44 DD 7E EE      [19] 1110 	ld	a,-18 (ix)
   2A47 77            [ 7] 1111 	ld	(hl),a
   2A48 C3 B5 2C      [10] 1112 	jp	00125$
   2A4B                    1113 00104$:
                           1114 ;src/entities/enemies.c:172: enemies[i].stage++;
   2A4B DD 7E FF      [19] 1115 	ld	a,-1 (ix)
   2A4E 3C            [ 4] 1116 	inc	a
   2A4F DD 77 EE      [19] 1117 	ld	-18 (ix),a
   2A52 DD 6E F5      [19] 1118 	ld	l,-11 (ix)
   2A55 DD 66 F6      [19] 1119 	ld	h,-10 (ix)
   2A58 DD 7E EE      [19] 1120 	ld	a,-18 (ix)
   2A5B 77            [ 7] 1121 	ld	(hl),a
                           1122 ;src/entities/enemies.c:173: enemies[i].stage_step=0;
   2A5C DD 6E F7      [19] 1123 	ld	l,-9 (ix)
   2A5F DD 66 F8      [19] 1124 	ld	h,-8 (ix)
   2A62 36 00         [10] 1125 	ld	(hl),#0x00
                           1126 ;src/entities/enemies.c:174: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
   2A64 DD 6E F9      [19] 1127 	ld	l,-7 (ix)
   2A67 DD 66 FA      [19] 1128 	ld	h,-6 (ix)
   2A6A 7E            [ 7] 1129 	ld	a,(hl)
   2A6B DD 77 EF      [19] 1130 	ld	-17 (ix), a
   2A6E 4F            [ 4] 1131 	ld	c, a
   2A6F 06 00         [ 7] 1132 	ld	b,#0x00
   2A71 69            [ 4] 1133 	ld	l, c
   2A72 60            [ 4] 1134 	ld	h, b
   2A73 29            [11] 1135 	add	hl, hl
   2A74 29            [11] 1136 	add	hl, hl
   2A75 29            [11] 1137 	add	hl, hl
   2A76 29            [11] 1138 	add	hl, hl
   2A77 29            [11] 1139 	add	hl, hl
   2A78 09            [11] 1140 	add	hl, bc
   2A79 DD 75 EF      [19] 1141 	ld	-17 (ix),l
   2A7C DD 74 F0      [19] 1142 	ld	-16 (ix),h
   2A7F 3E F8         [ 7] 1143 	ld	a,#<(_movements)
   2A81 DD 86 EF      [19] 1144 	add	a, -17 (ix)
   2A84 DD 77 EF      [19] 1145 	ld	-17 (ix),a
   2A87 3E 30         [ 7] 1146 	ld	a,#>(_movements)
   2A89 DD 8E F0      [19] 1147 	adc	a, -16 (ix)
   2A8C DD 77 F0      [19] 1148 	ld	-16 (ix),a
   2A8F DD 6E EF      [19] 1149 	ld	l,-17 (ix)
   2A92 DD 66 F0      [19] 1150 	ld	h,-16 (ix)
   2A95 7E            [ 7] 1151 	ld	a,(hl)
   2A96 DD 77 EF      [19] 1152 	ld	-17 (ix),a
   2A99 DD 7E EE      [19] 1153 	ld	a,-18 (ix)
   2A9C DD 96 EF      [19] 1154 	sub	a, -17 (ix)
   2A9F 38 08         [12] 1155 	jr	C,00102$
                           1156 ;src/entities/enemies.c:175: enemies[i].stage=0;
   2AA1 DD 6E F5      [19] 1157 	ld	l,-11 (ix)
   2AA4 DD 66 F6      [19] 1158 	ld	h,-10 (ix)
   2AA7 36 00         [10] 1159 	ld	(hl),#0x00
   2AA9                    1160 00102$:
                           1161 ;src/entities/enemies.c:177: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
   2AA9 3E FA         [ 7] 1162 	ld	a,#<(_enemies)
   2AAB DD 86 FB      [19] 1163 	add	a, -5 (ix)
   2AAE DD 77 EF      [19] 1164 	ld	-17 (ix),a
   2AB1 3E 51         [ 7] 1165 	ld	a,#>(_enemies)
   2AB3 DD 8E FC      [19] 1166 	adc	a, -4 (ix)
   2AB6 DD 77 F0      [19] 1167 	ld	-16 (ix),a
   2AB9 DD 7E EF      [19] 1168 	ld	a,-17 (ix)
   2ABC C6 16         [ 7] 1169 	add	a, #0x16
   2ABE DD 77 F1      [19] 1170 	ld	-15 (ix),a
   2AC1 DD 7E F0      [19] 1171 	ld	a,-16 (ix)
   2AC4 CE 00         [ 7] 1172 	adc	a, #0x00
   2AC6 DD 77 F2      [19] 1173 	ld	-14 (ix),a
   2AC9 DD 7E EF      [19] 1174 	ld	a,-17 (ix)
   2ACC C6 1D         [ 7] 1175 	add	a, #0x1D
   2ACE DD 77 F3      [19] 1176 	ld	-13 (ix),a
   2AD1 DD 7E F0      [19] 1177 	ld	a,-16 (ix)
   2AD4 CE 00         [ 7] 1178 	adc	a, #0x00
   2AD6 DD 77 F4      [19] 1179 	ld	-12 (ix),a
   2AD9 DD 6E F3      [19] 1180 	ld	l,-13 (ix)
   2ADC DD 66 F4      [19] 1181 	ld	h,-12 (ix)
   2ADF 4E            [ 7] 1182 	ld	c, (hl)
   2AE0 06 00         [ 7] 1183 	ld	b,#0x00
   2AE2 69            [ 4] 1184 	ld	l, c
   2AE3 60            [ 4] 1185 	ld	h, b
   2AE4 29            [11] 1186 	add	hl, hl
   2AE5 29            [11] 1187 	add	hl, hl
   2AE6 29            [11] 1188 	add	hl, hl
   2AE7 29            [11] 1189 	add	hl, hl
   2AE8 29            [11] 1190 	add	hl, hl
   2AE9 09            [11] 1191 	add	hl, bc
   2AEA DD 75 F5      [19] 1192 	ld	-11 (ix),l
   2AED DD 74 F6      [19] 1193 	ld	-10 (ix),h
   2AF0 3E F8         [ 7] 1194 	ld	a,#<(_movements)
   2AF2 DD 86 F5      [19] 1195 	add	a, -11 (ix)
   2AF5 DD 77 F5      [19] 1196 	ld	-11 (ix),a
   2AF8 3E 30         [ 7] 1197 	ld	a,#>(_movements)
   2AFA DD 8E F6      [19] 1198 	adc	a, -10 (ix)
   2AFD DD 77 F6      [19] 1199 	ld	-10 (ix),a
   2B00 DD 34 F5      [23] 1200 	inc	-11 (ix)
   2B03 20 03         [12] 1201 	jr	NZ,00178$
   2B05 DD 34 F6      [23] 1202 	inc	-10 (ix)
   2B08                    1203 00178$:
   2B08 DD 7E EF      [19] 1204 	ld	a,-17 (ix)
   2B0B C6 1E         [ 7] 1205 	add	a, #0x1E
   2B0D DD 77 F7      [19] 1206 	ld	-9 (ix),a
   2B10 DD 7E F0      [19] 1207 	ld	a,-16 (ix)
   2B13 CE 00         [ 7] 1208 	adc	a, #0x00
   2B15 DD 77 F8      [19] 1209 	ld	-8 (ix),a
   2B18 DD 6E F7      [19] 1210 	ld	l,-9 (ix)
   2B1B DD 66 F8      [19] 1211 	ld	h,-8 (ix)
   2B1E 7E            [ 7] 1212 	ld	a,(hl)
   2B1F 87            [ 4] 1213 	add	a, a
   2B20 87            [ 4] 1214 	add	a, a
   2B21 67            [ 4] 1215 	ld	h,a
   2B22 DD 7E F5      [19] 1216 	ld	a,-11 (ix)
   2B25 84            [ 4] 1217 	add	a, h
   2B26 DD 77 F5      [19] 1218 	ld	-11 (ix),a
   2B29 DD 7E F6      [19] 1219 	ld	a,-10 (ix)
   2B2C CE 00         [ 7] 1220 	adc	a, #0x00
   2B2E DD 77 F6      [19] 1221 	ld	-10 (ix),a
   2B31 DD 6E F5      [19] 1222 	ld	l,-11 (ix)
   2B34 DD 66 F6      [19] 1223 	ld	h,-10 (ix)
   2B37 7E            [ 7] 1224 	ld	a,(hl)
   2B38 DD 77 EE      [19] 1225 	ld	-18 (ix),a
   2B3B DD 6E F1      [19] 1226 	ld	l,-15 (ix)
   2B3E DD 66 F2      [19] 1227 	ld	h,-14 (ix)
   2B41 DD 7E EE      [19] 1228 	ld	a,-18 (ix)
   2B44 77            [ 7] 1229 	ld	(hl),a
                           1230 ;src/entities/enemies.c:178: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
   2B45 DD 7E EF      [19] 1231 	ld	a,-17 (ix)
   2B48 C6 10         [ 7] 1232 	add	a, #0x10
   2B4A DD 77 F1      [19] 1233 	ld	-15 (ix),a
   2B4D DD 7E F0      [19] 1234 	ld	a,-16 (ix)
   2B50 CE 00         [ 7] 1235 	adc	a, #0x00
   2B52 DD 77 F2      [19] 1236 	ld	-14 (ix),a
   2B55 DD 6E F1      [19] 1237 	ld	l,-15 (ix)
   2B58 DD 66 F2      [19] 1238 	ld	h,-14 (ix)
   2B5B 7E            [ 7] 1239 	ld	a,(hl)
   2B5C DD 77 F5      [19] 1240 	ld	-11 (ix),a
   2B5F 23            [ 6] 1241 	inc	hl
   2B60 7E            [ 7] 1242 	ld	a,(hl)
   2B61 DD 77 F6      [19] 1243 	ld	-10 (ix),a
   2B64 DD 6E F3      [19] 1244 	ld	l,-13 (ix)
   2B67 DD 66 F4      [19] 1245 	ld	h,-12 (ix)
   2B6A 4E            [ 7] 1246 	ld	c, (hl)
   2B6B 06 00         [ 7] 1247 	ld	b,#0x00
   2B6D 69            [ 4] 1248 	ld	l, c
   2B6E 60            [ 4] 1249 	ld	h, b
   2B6F 29            [11] 1250 	add	hl, hl
   2B70 29            [11] 1251 	add	hl, hl
   2B71 29            [11] 1252 	add	hl, hl
   2B72 29            [11] 1253 	add	hl, hl
   2B73 29            [11] 1254 	add	hl, hl
   2B74 09            [11] 1255 	add	hl, bc
   2B75 DD 75 F9      [19] 1256 	ld	-7 (ix),l
   2B78 DD 74 FA      [19] 1257 	ld	-6 (ix),h
   2B7B 3E F8         [ 7] 1258 	ld	a,#<(_movements)
   2B7D DD 86 F9      [19] 1259 	add	a, -7 (ix)
   2B80 DD 77 F9      [19] 1260 	ld	-7 (ix),a
   2B83 3E 30         [ 7] 1261 	ld	a,#>(_movements)
   2B85 DD 8E FA      [19] 1262 	adc	a, -6 (ix)
   2B88 DD 77 FA      [19] 1263 	ld	-6 (ix),a
   2B8B DD 34 F9      [23] 1264 	inc	-7 (ix)
   2B8E 20 03         [12] 1265 	jr	NZ,00179$
   2B90 DD 34 FA      [23] 1266 	inc	-6 (ix)
   2B93                    1267 00179$:
   2B93 DD 6E F7      [19] 1268 	ld	l,-9 (ix)
   2B96 DD 66 F8      [19] 1269 	ld	h,-8 (ix)
   2B99 7E            [ 7] 1270 	ld	a,(hl)
   2B9A DD 77 EE      [19] 1271 	ld	-18 (ix), a
   2B9D 87            [ 4] 1272 	add	a, a
   2B9E 87            [ 4] 1273 	add	a, a
   2B9F 67            [ 4] 1274 	ld	h,a
   2BA0 DD 7E F9      [19] 1275 	ld	a,-7 (ix)
   2BA3 84            [ 4] 1276 	add	a, h
   2BA4 DD 77 F9      [19] 1277 	ld	-7 (ix),a
   2BA7 DD 7E FA      [19] 1278 	ld	a,-6 (ix)
   2BAA CE 00         [ 7] 1279 	adc	a, #0x00
   2BAC DD 77 FA      [19] 1280 	ld	-6 (ix),a
   2BAF DD 6E F9      [19] 1281 	ld	l,-7 (ix)
   2BB2 DD 66 FA      [19] 1282 	ld	h,-6 (ix)
   2BB5 23            [ 6] 1283 	inc	hl
   2BB6 7E            [ 7] 1284 	ld	a,(hl)
   2BB7 DD 77 EE      [19] 1285 	ld	-18 (ix), a
   2BBA DD 77 F9      [19] 1286 	ld	-7 (ix),a
   2BBD DD 7E EE      [19] 1287 	ld	a,-18 (ix)
   2BC0 17            [ 4] 1288 	rla
   2BC1 9F            [ 4] 1289 	sbc	a, a
   2BC2 DD 77 FA      [19] 1290 	ld	-6 (ix),a
   2BC5 DD 7E F5      [19] 1291 	ld	a,-11 (ix)
   2BC8 DD 86 F9      [19] 1292 	add	a, -7 (ix)
   2BCB DD 77 F5      [19] 1293 	ld	-11 (ix),a
   2BCE DD 7E F6      [19] 1294 	ld	a,-10 (ix)
   2BD1 DD 8E FA      [19] 1295 	adc	a, -6 (ix)
   2BD4 DD 77 F6      [19] 1296 	ld	-10 (ix),a
   2BD7 DD 6E F1      [19] 1297 	ld	l,-15 (ix)
   2BDA DD 66 F2      [19] 1298 	ld	h,-14 (ix)
   2BDD DD 7E F5      [19] 1299 	ld	a,-11 (ix)
   2BE0 77            [ 7] 1300 	ld	(hl),a
   2BE1 23            [ 6] 1301 	inc	hl
   2BE2 DD 7E F6      [19] 1302 	ld	a,-10 (ix)
   2BE5 77            [ 7] 1303 	ld	(hl),a
                           1304 ;src/entities/enemies.c:179: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
   2BE6 DD 7E EF      [19] 1305 	ld	a,-17 (ix)
   2BE9 C6 12         [ 7] 1306 	add	a, #0x12
   2BEB DD 77 F1      [19] 1307 	ld	-15 (ix),a
   2BEE DD 7E F0      [19] 1308 	ld	a,-16 (ix)
   2BF1 CE 00         [ 7] 1309 	adc	a, #0x00
   2BF3 DD 77 F2      [19] 1310 	ld	-14 (ix),a
   2BF6 DD 6E F1      [19] 1311 	ld	l,-15 (ix)
   2BF9 DD 66 F2      [19] 1312 	ld	h,-14 (ix)
   2BFC 7E            [ 7] 1313 	ld	a,(hl)
   2BFD DD 77 F5      [19] 1314 	ld	-11 (ix),a
   2C00 23            [ 6] 1315 	inc	hl
   2C01 7E            [ 7] 1316 	ld	a,(hl)
   2C02 DD 77 F6      [19] 1317 	ld	-10 (ix),a
   2C05 DD 6E F3      [19] 1318 	ld	l,-13 (ix)
   2C08 DD 66 F4      [19] 1319 	ld	h,-12 (ix)
   2C0B 7E            [ 7] 1320 	ld	a,(hl)
   2C0C DD 77 EE      [19] 1321 	ld	-18 (ix), a
   2C0F 4F            [ 4] 1322 	ld	c, a
   2C10 06 00         [ 7] 1323 	ld	b,#0x00
   2C12 69            [ 4] 1324 	ld	l, c
   2C13 60            [ 4] 1325 	ld	h, b
   2C14 29            [11] 1326 	add	hl, hl
   2C15 29            [11] 1327 	add	hl, hl
   2C16 29            [11] 1328 	add	hl, hl
   2C17 29            [11] 1329 	add	hl, hl
   2C18 29            [11] 1330 	add	hl, hl
   2C19 09            [11] 1331 	add	hl, bc
   2C1A DD 75 F3      [19] 1332 	ld	-13 (ix),l
   2C1D DD 74 F4      [19] 1333 	ld	-12 (ix),h
   2C20 3E F8         [ 7] 1334 	ld	a,#<(_movements)
   2C22 DD 86 F3      [19] 1335 	add	a, -13 (ix)
   2C25 DD 77 F3      [19] 1336 	ld	-13 (ix),a
   2C28 3E 30         [ 7] 1337 	ld	a,#>(_movements)
   2C2A DD 8E F4      [19] 1338 	adc	a, -12 (ix)
   2C2D DD 77 F4      [19] 1339 	ld	-12 (ix),a
   2C30 DD 34 F3      [23] 1340 	inc	-13 (ix)
   2C33 20 03         [12] 1341 	jr	NZ,00180$
   2C35 DD 34 F4      [23] 1342 	inc	-12 (ix)
   2C38                    1343 00180$:
   2C38 DD 6E F7      [19] 1344 	ld	l,-9 (ix)
   2C3B DD 66 F8      [19] 1345 	ld	h,-8 (ix)
   2C3E 7E            [ 7] 1346 	ld	a,(hl)
   2C3F DD 77 EE      [19] 1347 	ld	-18 (ix),a
   2C42 DD CB EE 26   [23] 1348 	sla	-18 (ix)
   2C46 DD CB EE 26   [23] 1349 	sla	-18 (ix)
   2C4A DD 7E F3      [19] 1350 	ld	a,-13 (ix)
   2C4D DD 86 EE      [19] 1351 	add	a, -18 (ix)
   2C50 DD 77 F3      [19] 1352 	ld	-13 (ix),a
   2C53 DD 7E F4      [19] 1353 	ld	a,-12 (ix)
   2C56 CE 00         [ 7] 1354 	adc	a, #0x00
   2C58 DD 77 F4      [19] 1355 	ld	-12 (ix),a
   2C5B DD 6E F3      [19] 1356 	ld	l,-13 (ix)
   2C5E DD 66 F4      [19] 1357 	ld	h,-12 (ix)
   2C61 23            [ 6] 1358 	inc	hl
   2C62 23            [ 6] 1359 	inc	hl
   2C63 7E            [ 7] 1360 	ld	a,(hl)
   2C64 DD 77 EE      [19] 1361 	ld	-18 (ix), a
   2C67 DD 77 F3      [19] 1362 	ld	-13 (ix),a
   2C6A DD 7E EE      [19] 1363 	ld	a,-18 (ix)
   2C6D 17            [ 4] 1364 	rla
   2C6E 9F            [ 4] 1365 	sbc	a, a
   2C6F DD 77 F4      [19] 1366 	ld	-12 (ix),a
   2C72 DD 7E F5      [19] 1367 	ld	a,-11 (ix)
   2C75 DD 86 F3      [19] 1368 	add	a, -13 (ix)
   2C78 DD 77 F3      [19] 1369 	ld	-13 (ix),a
   2C7B DD 7E F6      [19] 1370 	ld	a,-10 (ix)
   2C7E DD 8E F4      [19] 1371 	adc	a, -12 (ix)
   2C81 DD 77 F4      [19] 1372 	ld	-12 (ix),a
   2C84 DD 6E F1      [19] 1373 	ld	l,-15 (ix)
   2C87 DD 66 F2      [19] 1374 	ld	h,-14 (ix)
   2C8A DD 7E F3      [19] 1375 	ld	a,-13 (ix)
   2C8D 77            [ 7] 1376 	ld	(hl),a
   2C8E 23            [ 6] 1377 	inc	hl
   2C8F DD 7E F4      [19] 1378 	ld	a,-12 (ix)
   2C92 77            [ 7] 1379 	ld	(hl),a
                           1380 ;src/entities/enemies.c:180: enemies[i].stage_step++;
   2C93 DD 7E EF      [19] 1381 	ld	a,-17 (ix)
   2C96 C6 1F         [ 7] 1382 	add	a, #0x1F
   2C98 DD 77 EF      [19] 1383 	ld	-17 (ix),a
   2C9B DD 7E F0      [19] 1384 	ld	a,-16 (ix)
   2C9E CE 00         [ 7] 1385 	adc	a, #0x00
   2CA0 DD 77 F0      [19] 1386 	ld	-16 (ix),a
   2CA3 DD 6E EF      [19] 1387 	ld	l,-17 (ix)
   2CA6 DD 66 F0      [19] 1388 	ld	h,-16 (ix)
   2CA9 7E            [ 7] 1389 	ld	a,(hl)
   2CAA DD 77 EE      [19] 1390 	ld	-18 (ix), a
   2CAD 3C            [ 4] 1391 	inc	a
   2CAE DD 6E EF      [19] 1392 	ld	l,-17 (ix)
   2CB1 DD 66 F0      [19] 1393 	ld	h,-16 (ix)
   2CB4 77            [ 7] 1394 	ld	(hl),a
   2CB5                    1395 00125$:
                           1396 ;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
   2CB5 DD 7E FB      [19] 1397 	ld	a,-5 (ix)
   2CB8 C6 24         [ 7] 1398 	add	a, #0x24
   2CBA DD 77 FB      [19] 1399 	ld	-5 (ix),a
   2CBD DD 7E FC      [19] 1400 	ld	a,-4 (ix)
   2CC0 CE 00         [ 7] 1401 	adc	a, #0x00
   2CC2 DD 77 FC      [19] 1402 	ld	-4 (ix),a
   2CC5 DD 7E FD      [19] 1403 	ld	a,-3 (ix)
   2CC8 C6 24         [ 7] 1404 	add	a, #0x24
   2CCA DD 77 FD      [19] 1405 	ld	-3 (ix),a
   2CCD DD 7E FE      [19] 1406 	ld	a,-2 (ix)
   2CD0 CE 00         [ 7] 1407 	adc	a, #0x00
   2CD2 DD 77 FE      [19] 1408 	ld	-2 (ix),a
   2CD5 DD 34 EB      [23] 1409 	inc	-21 (ix)
   2CD8 DD 7E EB      [19] 1410 	ld	a,-21 (ix)
   2CDB D6 1E         [ 7] 1411 	sub	a, #0x1E
   2CDD DA 40 28      [10] 1412 	jp	C,00124$
   2CE0                    1413 00112$:
                           1414 ;src/entities/enemies.c:188: if (active_groups>0){
   2CE0 3A 53 56      [13] 1415 	ld	a,(#_active_groups + 0)
   2CE3 B7            [ 4] 1416 	or	a, a
   2CE4 CA 61 2D      [10] 1417 	jp	Z,00128$
                           1418 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2CE7 DD 36 EB 00   [19] 1419 	ld	-21 (ix),#0x00
   2CEB                    1420 00126$:
                           1421 ;src/entities/enemies.c:191: if (groups[i].active){
   2CEB DD 6E EB      [19] 1422 	ld	l,-21 (ix)
   2CEE 26 00         [ 7] 1423 	ld	h,#0x00
   2CF0 29            [11] 1424 	add	hl, hl
   2CF1 29            [11] 1425 	add	hl, hl
   2CF2 29            [11] 1426 	add	hl, hl
   2CF3 3E 33         [ 7] 1427 	ld	a,#<(_groups)
   2CF5 85            [ 4] 1428 	add	a, l
   2CF6 5F            [ 4] 1429 	ld	e,a
   2CF7 3E 56         [ 7] 1430 	ld	a,#>(_groups)
   2CF9 8C            [ 4] 1431 	adc	a, h
   2CFA 57            [ 4] 1432 	ld	d,a
   2CFB 1A            [ 7] 1433 	ld	a,(de)
   2CFC B7            [ 4] 1434 	or	a, a
   2CFD 28 58         [12] 1435 	jr	Z,00127$
                           1436 ;src/entities/enemies.c:192: if (groups[i].sleep==0){
   2CFF 21 07 00      [10] 1437 	ld	hl,#0x0007
   2D02 19            [11] 1438 	add	hl,de
   2D03 7E            [ 7] 1439 	ld	a,(hl)
   2D04 B7            [ 4] 1440 	or	a, a
   2D05 20 4D         [12] 1441 	jr	NZ,00117$
                           1442 ;src/entities/enemies.c:193: groups[i].sleep=ENEMY_GAP;
   2D07 36 03         [10] 1443 	ld	(hl),#0x03
                           1444 ;src/entities/enemies.c:194: if (groups[i].num_enemies==0){
   2D09 21 06 00      [10] 1445 	ld	hl,#0x0006
   2D0C 19            [11] 1446 	add	hl,de
   2D0D 4D            [ 4] 1447 	ld	c,l
   2D0E 44            [ 4] 1448 	ld	b,h
   2D0F 0A            [ 7] 1449 	ld	a,(bc)
   2D10 B7            [ 4] 1450 	or	a, a
   2D11 20 08         [12] 1451 	jr	NZ,00114$
                           1452 ;src/entities/enemies.c:195: groups[i].active=0;
   2D13 AF            [ 4] 1453 	xor	a, a
   2D14 12            [ 7] 1454 	ld	(de),a
                           1455 ;src/entities/enemies.c:196: active_groups--;
   2D15 21 53 56      [10] 1456 	ld	hl, #_active_groups+0
   2D18 35            [11] 1457 	dec	(hl)
   2D19 18 3C         [12] 1458 	jr	00127$
   2D1B                    1459 00114$:
                           1460 ;src/entities/enemies.c:198: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
   2D1B 6B            [ 4] 1461 	ld	l, e
   2D1C 62            [ 4] 1462 	ld	h, d
   2D1D 23            [ 6] 1463 	inc	hl
   2D1E 23            [ 6] 1464 	inc	hl
   2D1F 23            [ 6] 1465 	inc	hl
   2D20 23            [ 6] 1466 	inc	hl
   2D21 23            [ 6] 1467 	inc	hl
   2D22 7E            [ 7] 1468 	ld	a,(hl)
   2D23 DD 77 EE      [19] 1469 	ld	-18 (ix),a
   2D26 6B            [ 4] 1470 	ld	l, e
   2D27 62            [ 4] 1471 	ld	h, d
   2D28 23            [ 6] 1472 	inc	hl
   2D29 23            [ 6] 1473 	inc	hl
   2D2A 23            [ 6] 1474 	inc	hl
   2D2B 7E            [ 7] 1475 	ld	a,(hl)
   2D2C DD 77 EF      [19] 1476 	ld	-17 (ix),a
   2D2F 23            [ 6] 1477 	inc	hl
   2D30 7E            [ 7] 1478 	ld	a,(hl)
   2D31 DD 77 F0      [19] 1479 	ld	-16 (ix),a
   2D34 EB            [ 4] 1480 	ex	de,hl
   2D35 23            [ 6] 1481 	inc	hl
   2D36 5E            [ 7] 1482 	ld	e,(hl)
   2D37 23            [ 6] 1483 	inc	hl
   2D38 56            [ 7] 1484 	ld	d,(hl)
   2D39 C5            [11] 1485 	push	bc
   2D3A DD 7E EE      [19] 1486 	ld	a,-18 (ix)
   2D3D F5            [11] 1487 	push	af
   2D3E 33            [ 6] 1488 	inc	sp
   2D3F DD 6E EF      [19] 1489 	ld	l,-17 (ix)
   2D42 DD 66 F0      [19] 1490 	ld	h,-16 (ix)
   2D45 E5            [11] 1491 	push	hl
   2D46 D5            [11] 1492 	push	de
   2D47 CD 79 24      [17] 1493 	call	_create_enemy
   2D4A F1            [10] 1494 	pop	af
   2D4B F1            [10] 1495 	pop	af
   2D4C 33            [ 6] 1496 	inc	sp
   2D4D C1            [10] 1497 	pop	bc
                           1498 ;src/entities/enemies.c:199: groups[i].num_enemies--;
   2D4E 0A            [ 7] 1499 	ld	a,(bc)
   2D4F C6 FF         [ 7] 1500 	add	a,#0xFF
   2D51 02            [ 7] 1501 	ld	(bc),a
   2D52 18 03         [12] 1502 	jr	00127$
   2D54                    1503 00117$:
                           1504 ;src/entities/enemies.c:202: groups[i].sleep--;
   2D54 C6 FF         [ 7] 1505 	add	a,#0xFF
   2D56 77            [ 7] 1506 	ld	(hl),a
   2D57                    1507 00127$:
                           1508 ;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
   2D57 DD 34 EB      [23] 1509 	inc	-21 (ix)
   2D5A DD 7E EB      [19] 1510 	ld	a,-21 (ix)
   2D5D D6 04         [ 7] 1511 	sub	a, #0x04
   2D5F 38 8A         [12] 1512 	jr	C,00126$
   2D61                    1513 00128$:
   2D61 DD F9         [10] 1514 	ld	sp, ix
   2D63 DD E1         [14] 1515 	pop	ix
   2D65 C9            [10] 1516 	ret
                           1517 ;src/entities/enemies.c:210: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
                           1518 ;	---------------------------------
                           1519 ; Function inside_screen
                           1520 ; ---------------------------------
   2D66                    1521 _inside_screen::
   2D66 DD E5         [15] 1522 	push	ix
   2D68 DD 21 00 00   [14] 1523 	ld	ix,#0
   2D6C DD 39         [15] 1524 	add	ix,sp
   2D6E 3B            [ 6] 1525 	dec	sp
                           1526 ;src/entities/enemies.c:212: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
   2D6F DD CB 05 7E   [20] 1527 	bit	7, 5 (ix)
   2D73 20 38         [12] 1528 	jr	NZ,00103$
   2D75 DD 5E 08      [19] 1529 	ld	e,8 (ix)
   2D78 16 00         [ 7] 1530 	ld	d,#0x00
   2D7A DD 6E 04      [19] 1531 	ld	l,4 (ix)
   2D7D DD 66 05      [19] 1532 	ld	h,5 (ix)
   2D80 19            [11] 1533 	add	hl,de
   2D81 11 50 80      [10] 1534 	ld	de, #0x8050
   2D84 29            [11] 1535 	add	hl, hl
   2D85 3F            [ 4] 1536 	ccf
   2D86 CB 1C         [ 8] 1537 	rr	h
   2D88 CB 1D         [ 8] 1538 	rr	l
   2D8A ED 52         [15] 1539 	sbc	hl, de
   2D8C 30 1F         [12] 1540 	jr	NC,00103$
   2D8E DD CB 07 7E   [20] 1541 	bit	7, 7 (ix)
   2D92 20 19         [12] 1542 	jr	NZ,00103$
   2D94 DD 5E 09      [19] 1543 	ld	e,9 (ix)
   2D97 16 00         [ 7] 1544 	ld	d,#0x00
   2D99 DD 6E 06      [19] 1545 	ld	l,6 (ix)
   2D9C DD 66 07      [19] 1546 	ld	h,7 (ix)
   2D9F 19            [11] 1547 	add	hl,de
   2DA0 11 C8 80      [10] 1548 	ld	de, #0x80C8
   2DA3 29            [11] 1549 	add	hl, hl
   2DA4 3F            [ 4] 1550 	ccf
   2DA5 CB 1C         [ 8] 1551 	rr	h
   2DA7 CB 1D         [ 8] 1552 	rr	l
   2DA9 ED 52         [15] 1553 	sbc	hl, de
   2DAB 38 04         [12] 1554 	jr	C,00104$
   2DAD                    1555 00103$:
   2DAD 2E 00         [ 7] 1556 	ld	l,#0x00
   2DAF 18 02         [12] 1557 	jr	00105$
   2DB1                    1558 00104$:
   2DB1 2E 01         [ 7] 1559 	ld	l,#0x01
   2DB3                    1560 00105$:
   2DB3 33            [ 6] 1561 	inc	sp
   2DB4 DD E1         [14] 1562 	pop	ix
   2DB6 C9            [10] 1563 	ret
                           1564 ;src/entities/enemies.c:219: void draw_enemies(u8* screen){
                           1565 ;	---------------------------------
                           1566 ; Function draw_enemies
                           1567 ; ---------------------------------
   2DB7                    1568 _draw_enemies::
   2DB7 DD E5         [15] 1569 	push	ix
   2DB9 DD 21 00 00   [14] 1570 	ld	ix,#0
   2DBD DD 39         [15] 1571 	add	ix,sp
   2DBF 21 F1 FF      [10] 1572 	ld	hl,#-15
   2DC2 39            [11] 1573 	add	hl,sp
   2DC3 F9            [ 6] 1574 	ld	sp,hl
                           1575 ;src/entities/enemies.c:224: if (active_enemies>0){
   2DC4 3A 32 56      [13] 1576 	ld	a,(#_active_enemies + 0)
   2DC7 B7            [ 4] 1577 	or	a, a
   2DC8 CA F8 2E      [10] 1578 	jp	Z,00109$
                           1579 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2DCB DD 36 F1 00   [19] 1580 	ld	-15 (ix),#0x00
   2DCF 11 00 00      [10] 1581 	ld	de,#0x0000
   2DD2                    1582 00107$:
                           1583 ;src/entities/enemies.c:226: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
   2DD2 21 FA 51      [10] 1584 	ld	hl,#_enemies
   2DD5 19            [11] 1585 	add	hl,de
   2DD6 DD 75 FC      [19] 1586 	ld	-4 (ix),l
   2DD9 DD 74 FD      [19] 1587 	ld	-3 (ix),h
   2DDC DD 6E FC      [19] 1588 	ld	l,-4 (ix)
   2DDF DD 66 FD      [19] 1589 	ld	h,-3 (ix)
   2DE2 01 17 00      [10] 1590 	ld	bc, #0x0017
   2DE5 09            [11] 1591 	add	hl, bc
   2DE6 7E            [ 7] 1592 	ld	a,(hl)
   2DE7 B7            [ 4] 1593 	or	a, a
   2DE8 CA E8 2E      [10] 1594 	jp	Z,00108$
   2DEB DD 7E FC      [19] 1595 	ld	a,-4 (ix)
   2DEE C6 15         [ 7] 1596 	add	a, #0x15
   2DF0 DD 77 F2      [19] 1597 	ld	-14 (ix),a
   2DF3 DD 7E FD      [19] 1598 	ld	a,-3 (ix)
   2DF6 CE 00         [ 7] 1599 	adc	a, #0x00
   2DF8 DD 77 F3      [19] 1600 	ld	-13 (ix),a
   2DFB DD 6E F2      [19] 1601 	ld	l,-14 (ix)
   2DFE DD 66 F3      [19] 1602 	ld	h,-13 (ix)
   2E01 46            [ 7] 1603 	ld	b,(hl)
   2E02 DD 7E FC      [19] 1604 	ld	a,-4 (ix)
   2E05 C6 14         [ 7] 1605 	add	a, #0x14
   2E07 DD 77 FE      [19] 1606 	ld	-2 (ix),a
   2E0A DD 7E FD      [19] 1607 	ld	a,-3 (ix)
   2E0D CE 00         [ 7] 1608 	adc	a, #0x00
   2E0F DD 77 FF      [19] 1609 	ld	-1 (ix),a
   2E12 DD 6E FE      [19] 1610 	ld	l,-2 (ix)
   2E15 DD 66 FF      [19] 1611 	ld	h,-1 (ix)
   2E18 4E            [ 7] 1612 	ld	c,(hl)
   2E19 DD 7E FC      [19] 1613 	ld	a,-4 (ix)
   2E1C C6 12         [ 7] 1614 	add	a, #0x12
   2E1E DD 77 FA      [19] 1615 	ld	-6 (ix),a
   2E21 DD 7E FD      [19] 1616 	ld	a,-3 (ix)
   2E24 CE 00         [ 7] 1617 	adc	a, #0x00
   2E26 DD 77 FB      [19] 1618 	ld	-5 (ix),a
   2E29 DD 6E FA      [19] 1619 	ld	l,-6 (ix)
   2E2C DD 66 FB      [19] 1620 	ld	h,-5 (ix)
   2E2F 7E            [ 7] 1621 	ld	a,(hl)
   2E30 DD 77 F8      [19] 1622 	ld	-8 (ix),a
   2E33 23            [ 6] 1623 	inc	hl
   2E34 7E            [ 7] 1624 	ld	a,(hl)
   2E35 DD 77 F9      [19] 1625 	ld	-7 (ix),a
   2E38 DD 7E FC      [19] 1626 	ld	a,-4 (ix)
   2E3B C6 10         [ 7] 1627 	add	a, #0x10
   2E3D DD 77 F6      [19] 1628 	ld	-10 (ix),a
   2E40 DD 7E FD      [19] 1629 	ld	a,-3 (ix)
   2E43 CE 00         [ 7] 1630 	adc	a, #0x00
   2E45 DD 77 F7      [19] 1631 	ld	-9 (ix),a
   2E48 DD 6E F6      [19] 1632 	ld	l,-10 (ix)
   2E4B DD 66 F7      [19] 1633 	ld	h,-9 (ix)
   2E4E 7E            [ 7] 1634 	ld	a,(hl)
   2E4F DD 77 F4      [19] 1635 	ld	-12 (ix),a
   2E52 23            [ 6] 1636 	inc	hl
   2E53 7E            [ 7] 1637 	ld	a,(hl)
   2E54 DD 77 F5      [19] 1638 	ld	-11 (ix),a
   2E57 D5            [11] 1639 	push	de
   2E58 C5            [11] 1640 	push	bc
   2E59 DD 6E F8      [19] 1641 	ld	l,-8 (ix)
   2E5C DD 66 F9      [19] 1642 	ld	h,-7 (ix)
   2E5F E5            [11] 1643 	push	hl
   2E60 DD 6E F4      [19] 1644 	ld	l,-12 (ix)
   2E63 DD 66 F5      [19] 1645 	ld	h,-11 (ix)
   2E66 E5            [11] 1646 	push	hl
   2E67 CD 66 2D      [17] 1647 	call	_inside_screen
   2E6A F1            [10] 1648 	pop	af
   2E6B F1            [10] 1649 	pop	af
   2E6C F1            [10] 1650 	pop	af
   2E6D 7D            [ 4] 1651 	ld	a,l
   2E6E D1            [10] 1652 	pop	de
   2E6F B7            [ 4] 1653 	or	a, a
   2E70 28 76         [12] 1654 	jr	Z,00108$
                           1655 ;src/entities/enemies.c:227: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
   2E72 DD 6E FA      [19] 1656 	ld	l,-6 (ix)
   2E75 DD 66 FB      [19] 1657 	ld	h,-5 (ix)
   2E78 4E            [ 7] 1658 	ld	c,(hl)
   2E79 23            [ 6] 1659 	inc	hl
   2E7A 46            [ 7] 1660 	ld	b,(hl)
   2E7B DD 6E F6      [19] 1661 	ld	l,-10 (ix)
   2E7E DD 66 F7      [19] 1662 	ld	h,-9 (ix)
   2E81 7E            [ 7] 1663 	ld	a, (hl)
   2E82 23            [ 6] 1664 	inc	hl
   2E83 66            [ 7] 1665 	ld	h,(hl)
   2E84 6F            [ 4] 1666 	ld	l,a
   2E85 65            [ 4] 1667 	ld	h,l
   2E86 E5            [11] 1668 	push	hl
   2E87 DD 6E 04      [19] 1669 	ld	l,4 (ix)
   2E8A DD 66 05      [19] 1670 	ld	h,5 (ix)
   2E8D E5            [11] 1671 	push	hl
   2E8E FD E1         [14] 1672 	pop	iy
   2E90 E1            [10] 1673 	pop	hl
   2E91 D5            [11] 1674 	push	de
   2E92 79            [ 4] 1675 	ld	a,c
   2E93 F5            [11] 1676 	push	af
   2E94 33            [ 6] 1677 	inc	sp
   2E95 E5            [11] 1678 	push	hl
   2E96 33            [ 6] 1679 	inc	sp
   2E97 FD E5         [15] 1680 	push	iy
   2E99 CD 5C 50      [17] 1681 	call	_cpct_getScreenPtr
   2E9C F1            [10] 1682 	pop	af
   2E9D F1            [10] 1683 	pop	af
   2E9E D1            [10] 1684 	pop	de
   2E9F 4D            [ 4] 1685 	ld	c, l
   2EA0 44            [ 4] 1686 	ld	b, h
                           1687 ;src/entities/enemies.c:228: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
   2EA1 DD 6E F2      [19] 1688 	ld	l,-14 (ix)
   2EA4 DD 66 F3      [19] 1689 	ld	h,-13 (ix)
   2EA7 7E            [ 7] 1690 	ld	a,(hl)
   2EA8 DD 77 F4      [19] 1691 	ld	-12 (ix),a
   2EAB DD 6E FE      [19] 1692 	ld	l,-2 (ix)
   2EAE DD 66 FF      [19] 1693 	ld	h,-1 (ix)
   2EB1 7E            [ 7] 1694 	ld	a,(hl)
   2EB2 DD 77 F6      [19] 1695 	ld	-10 (ix),a
   2EB5 DD 71 F8      [19] 1696 	ld	-8 (ix),c
   2EB8 DD 70 F9      [19] 1697 	ld	-7 (ix),b
   2EBB DD 6E FC      [19] 1698 	ld	l,-4 (ix)
   2EBE DD 66 FD      [19] 1699 	ld	h,-3 (ix)
   2EC1 01 16 00      [10] 1700 	ld	bc, #0x0016
   2EC4 09            [11] 1701 	add	hl, bc
   2EC5 7E            [ 7] 1702 	ld	a,(hl)
   2EC6 87            [ 4] 1703 	add	a, a
   2EC7 4F            [ 4] 1704 	ld	c,a
   2EC8 DD 6E FC      [19] 1705 	ld	l,-4 (ix)
   2ECB DD 66 FD      [19] 1706 	ld	h,-3 (ix)
   2ECE 06 00         [ 7] 1707 	ld	b,#0x00
   2ED0 09            [11] 1708 	add	hl, bc
   2ED1 4E            [ 7] 1709 	ld	c,(hl)
   2ED2 23            [ 6] 1710 	inc	hl
   2ED3 46            [ 7] 1711 	ld	b,(hl)
   2ED4 D5            [11] 1712 	push	de
   2ED5 DD 66 F4      [19] 1713 	ld	h,-12 (ix)
   2ED8 DD 6E F6      [19] 1714 	ld	l,-10 (ix)
   2EDB E5            [11] 1715 	push	hl
   2EDC DD 6E F8      [19] 1716 	ld	l,-8 (ix)
   2EDF DD 66 F9      [19] 1717 	ld	h,-7 (ix)
   2EE2 E5            [11] 1718 	push	hl
   2EE3 C5            [11] 1719 	push	bc
   2EE4 CD 46 4E      [17] 1720 	call	_cpct_drawSprite
   2EE7 D1            [10] 1721 	pop	de
   2EE8                    1722 00108$:
                           1723 ;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
   2EE8 21 24 00      [10] 1724 	ld	hl,#0x0024
   2EEB 19            [11] 1725 	add	hl,de
   2EEC EB            [ 4] 1726 	ex	de,hl
   2EED DD 34 F1      [23] 1727 	inc	-15 (ix)
   2EF0 DD 7E F1      [19] 1728 	ld	a,-15 (ix)
   2EF3 D6 1E         [ 7] 1729 	sub	a, #0x1E
   2EF5 DA D2 2D      [10] 1730 	jp	C,00107$
   2EF8                    1731 00109$:
   2EF8 DD F9         [10] 1732 	ld	sp, ix
   2EFA DD E1         [14] 1733 	pop	ix
   2EFC C9            [10] 1734 	ret
                           1735 	.area _CODE
                           1736 	.area _INITIALIZER
                           1737 	.area _CABS (ABS)
