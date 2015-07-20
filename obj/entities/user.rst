                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 03:16:36 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_enemy_group
                             13 	.globl _create_enemy
                             14 	.globl _create_shoot
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSprite
                             17 	.globl _cpct_isKeyPressed
                             18 	.globl _cpct_scanKeyboard_f
                             19 	.globl _rand
                             20 	.globl _shoot_type
                             21 	.globl _user
                             22 	.globl _init_user
                             23 	.globl _get_user_max_shoots
                             24 	.globl _update_user
                             25 	.globl _draw_user
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   559F                      33 _user::
   559F                      34 	.ds 22
   55B5                      35 _shoot_type::
   55B5                      36 	.ds 1
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/entities/user.c:9: void init_user(){
                             62 ;	---------------------------------
                             63 ; Function init_user
                             64 ; ---------------------------------
   32CF                      65 _init_user::
                             66 ;src/entities/user.c:11: user.w = 4;
   32CF 21 AD 55      [10]   67 	ld	hl,#_user + 14
   32D2 36 04         [10]   68 	ld	(hl),#0x04
                             69 ;src/entities/user.c:12: user.h = 8;
   32D4 FD 21 AE 55   [14]   70 	ld	iy,#_user + 15
   32D8 FD 36 00 08   [19]   71 	ld	0 (iy), #0x08
                             72 ;src/entities/user.c:13: user.x = 39-(user.w/2);
   32DC 6E            [ 7]   73 	ld	l,(hl)
   32DD CB 3D         [ 8]   74 	srl	l
   32DF 3E 27         [ 7]   75 	ld	a,#0x27
   32E1 95            [ 4]   76 	sub	a, l
   32E2 32 A5 55      [13]   77 	ld	(#(_user + 0x0006)),a
                             78 ;src/entities/user.c:14: user.y = 199-(user.h);
   32E5 FD 66 00      [19]   79 	ld	h, 0 (iy)
   32E8 3E C7         [ 7]   80 	ld	a,#0xC7
   32EA 94            [ 4]   81 	sub	a, h
   32EB 32 A6 55      [13]   82 	ld	(#(_user + 0x0007)),a
                             83 ;src/entities/user.c:15: user.vx = 0;
   32EE 21 A7 55      [10]   84 	ld	hl,#_user + 8
   32F1 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/user.c:16: user.vy = 0;
   32F3 21 A8 55      [10]   87 	ld	hl,#_user + 9
   32F6 36 00         [10]   88 	ld	(hl),#0x00
                             89 ;src/entities/user.c:17: user.topvx = 4;
   32F8 21 A9 55      [10]   90 	ld	hl,#_user + 10
   32FB 36 04         [10]   91 	ld	(hl),#0x04
                             92 ;src/entities/user.c:18: user.topvy = 5;
   32FD 21 AA 55      [10]   93 	ld	hl,#_user + 11
   3300 36 05         [10]   94 	ld	(hl),#0x05
                             95 ;src/entities/user.c:19: user.ax=0;
   3302 21 AB 55      [10]   96 	ld	hl,#_user + 12
   3305 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/user.c:20: user.ay=0;
   3307 21 AC 55      [10]   99 	ld	hl,#_user + 13
   330A 36 00         [10]  100 	ld	(hl),#0x00
                            101 ;src/entities/user.c:21: user.sprite = (u8*) G_ship_00;
   330C 21 89 3E      [10]  102 	ld	hl,#_G_ship_00
   330F 22 A3 55      [16]  103 	ld	((_user + 0x0004)), hl
                            104 ;src/entities/user.c:23: user.max_shoots = 10;
   3312 21 B4 55      [10]  105 	ld	hl,#_user + 21
   3315 36 0A         [10]  106 	ld	(hl),#0x0A
                            107 ;src/entities/user.c:24: shoot_type = 1;
   3317 21 B5 55      [10]  108 	ld	hl,#_shoot_type + 0
   331A 36 01         [10]  109 	ld	(hl), #0x01
   331C C9            [10]  110 	ret
                            111 ;src/entities/user.c:27: u8 get_user_max_shoots(){
                            112 ;	---------------------------------
                            113 ; Function get_user_max_shoots
                            114 ; ---------------------------------
   331D                     115 _get_user_max_shoots::
                            116 ;src/entities/user.c:28: return user.max_shoots;
   331D 21 B4 55      [10]  117 	ld	hl,#_user+21
   3320 6E            [ 7]  118 	ld	l,(hl)
   3321 C9            [10]  119 	ret
                            120 ;src/entities/user.c:31: void update_user() {
                            121 ;	---------------------------------
                            122 ; Function update_user
                            123 ; ---------------------------------
   3322                     124 _update_user::
   3322 DD E5         [15]  125 	push	ix
   3324 DD 21 00 00   [14]  126 	ld	ix,#0
   3328 DD 39         [15]  127 	add	ix,sp
   332A 21 F9 FF      [10]  128 	ld	hl,#-7
   332D 39            [11]  129 	add	hl,sp
   332E F9            [ 6]  130 	ld	sp,hl
                            131 ;src/entities/user.c:34: user.ax=0;
   332F 01 9F 55      [10]  132 	ld	bc,#_user+0
   3332 21 AB 55      [10]  133 	ld	hl,#(_user + 0x000c)
   3335 36 00         [10]  134 	ld	(hl),#0x00
                            135 ;src/entities/user.c:37: cpct_scanKeyboard_f();
   3337 C5            [11]  136 	push	bc
   3338 CD D3 49      [17]  137 	call	_cpct_scanKeyboard_f
   333B 21 08 08      [10]  138 	ld	hl,#0x0808
   333E E5            [11]  139 	push	hl
   333F CD C2 49      [17]  140 	call	_cpct_isKeyPressed
   3342 F1            [10]  141 	pop	af
   3343 C1            [10]  142 	pop	bc
                            143 ;src/entities/user.c:45: user.ay = -2;
                            144 ;src/entities/user.c:44: if ((cpct_isKeyPressed(Key_Q))){ 
   3344 7D            [ 4]  145 	ld	a,l
   3345 B7            [ 4]  146 	or	a, a
   3346 28 05         [12]  147 	jr	Z,00102$
                            148 ;src/entities/user.c:45: user.ay = -2;
   3348 21 AC 55      [10]  149 	ld	hl,#(_user + 0x000d)
   334B 36 FE         [10]  150 	ld	(hl),#0xFE
   334D                     151 00102$:
                            152 ;src/entities/user.c:48: if ((cpct_isKeyPressed(Key_P))){ 
   334D C5            [11]  153 	push	bc
   334E 21 03 08      [10]  154 	ld	hl,#0x0803
   3351 E5            [11]  155 	push	hl
   3352 CD C2 49      [17]  156 	call	_cpct_isKeyPressed
   3355 F1            [10]  157 	pop	af
   3356 7D            [ 4]  158 	ld	a,l
   3357 C1            [10]  159 	pop	bc
   3358 B7            [ 4]  160 	or	a, a
   3359 28 05         [12]  161 	jr	Z,00104$
                            162 ;src/entities/user.c:49: user.ax = 2;
   335B 21 AB 55      [10]  163 	ld	hl,#(_user + 0x000c)
   335E 36 02         [10]  164 	ld	(hl),#0x02
   3360                     165 00104$:
                            166 ;src/entities/user.c:52: if (cpct_isKeyPressed(Key_O)){
   3360 C5            [11]  167 	push	bc
   3361 21 04 04      [10]  168 	ld	hl,#0x0404
   3364 E5            [11]  169 	push	hl
   3365 CD C2 49      [17]  170 	call	_cpct_isKeyPressed
   3368 F1            [10]  171 	pop	af
   3369 7D            [ 4]  172 	ld	a,l
   336A C1            [10]  173 	pop	bc
   336B B7            [ 4]  174 	or	a, a
   336C 28 05         [12]  175 	jr	Z,00106$
                            176 ;src/entities/user.c:53: user.ax=-2;    
   336E 21 AB 55      [10]  177 	ld	hl,#(_user + 0x000c)
   3371 36 FE         [10]  178 	ld	(hl),#0xFE
   3373                     179 00106$:
                            180 ;src/entities/user.c:56: if (cpct_isKeyPressed(Key_A)){
   3373 C5            [11]  181 	push	bc
   3374 21 08 20      [10]  182 	ld	hl,#0x2008
   3377 E5            [11]  183 	push	hl
   3378 CD C2 49      [17]  184 	call	_cpct_isKeyPressed
   337B F1            [10]  185 	pop	af
   337C 7D            [ 4]  186 	ld	a,l
   337D C1            [10]  187 	pop	bc
   337E B7            [ 4]  188 	or	a, a
   337F 28 05         [12]  189 	jr	Z,00108$
                            190 ;src/entities/user.c:57: user.ay=2;    
   3381 21 AC 55      [10]  191 	ld	hl,#(_user + 0x000d)
   3384 36 02         [10]  192 	ld	(hl),#0x02
   3386                     193 00108$:
                            194 ;src/entities/user.c:60: if (cpct_isKeyPressed(Key_D)){
   3386 C5            [11]  195 	push	bc
   3387 21 07 20      [10]  196 	ld	hl,#0x2007
   338A E5            [11]  197 	push	hl
   338B CD C2 49      [17]  198 	call	_cpct_isKeyPressed
   338E F1            [10]  199 	pop	af
   338F 7D            [ 4]  200 	ld	a,l
   3390 C1            [10]  201 	pop	bc
   3391 B7            [ 4]  202 	or	a, a
   3392 28 1D         [12]  203 	jr	Z,00110$
                            204 ;src/entities/user.c:61: shoot_type=(shoot_type+1)%2;
   3394 FD 21 B5 55   [14]  205 	ld	iy,#_shoot_type
   3398 FD 6E 00      [19]  206 	ld	l,0 (iy)
   339B 26 00         [ 7]  207 	ld	h,#0x00
   339D 23            [ 6]  208 	inc	hl
   339E C5            [11]  209 	push	bc
   339F 11 02 00      [10]  210 	ld	de,#0x0002
   33A2 D5            [11]  211 	push	de
   33A3 E5            [11]  212 	push	hl
   33A4 CD F1 4C      [17]  213 	call	__modsint
   33A7 F1            [10]  214 	pop	af
   33A8 F1            [10]  215 	pop	af
   33A9 C1            [10]  216 	pop	bc
   33AA FD 21 B5 55   [14]  217 	ld	iy,#_shoot_type
   33AE FD 75 00      [19]  218 	ld	0 (iy),l
   33B1                     219 00110$:
                            220 ;src/entities/user.c:64: if (cpct_isKeyPressed(Key_H)){
   33B1 C5            [11]  221 	push	bc
   33B2 21 05 10      [10]  222 	ld	hl,#0x1005
   33B5 E5            [11]  223 	push	hl
   33B6 CD C2 49      [17]  224 	call	_cpct_isKeyPressed
   33B9 F1            [10]  225 	pop	af
   33BA 7D            [ 4]  226 	ld	a,l
   33BB C1            [10]  227 	pop	bc
   33BC B7            [ 4]  228 	or	a, a
   33BD 28 48         [12]  229 	jr	Z,00112$
                            230 ;src/entities/user.c:65: create_enemy((rand()%80),(rand()%199),(rand()%3));
   33BF C5            [11]  231 	push	bc
   33C0 CD 61 4A      [17]  232 	call	_rand
   33C3 11 03 00      [10]  233 	ld	de,#0x0003
   33C6 D5            [11]  234 	push	de
   33C7 E5            [11]  235 	push	hl
   33C8 CD F1 4C      [17]  236 	call	__modsint
   33CB F1            [10]  237 	pop	af
   33CC F1            [10]  238 	pop	af
   33CD C1            [10]  239 	pop	bc
   33CE DD 75 FF      [19]  240 	ld	-1 (ix),l
   33D1 C5            [11]  241 	push	bc
   33D2 CD 61 4A      [17]  242 	call	_rand
   33D5 11 C7 00      [10]  243 	ld	de,#0x00C7
   33D8 D5            [11]  244 	push	de
   33D9 E5            [11]  245 	push	hl
   33DA CD F1 4C      [17]  246 	call	__modsint
   33DD F1            [10]  247 	pop	af
   33DE F1            [10]  248 	pop	af
   33DF DD 74 FE      [19]  249 	ld	-2 (ix),h
   33E2 DD 75 FD      [19]  250 	ld	-3 (ix),l
   33E5 CD 61 4A      [17]  251 	call	_rand
   33E8 11 50 00      [10]  252 	ld	de,#0x0050
   33EB D5            [11]  253 	push	de
   33EC E5            [11]  254 	push	hl
   33ED CD F1 4C      [17]  255 	call	__modsint
   33F0 F1            [10]  256 	pop	af
   33F1 F1            [10]  257 	pop	af
   33F2 EB            [ 4]  258 	ex	de,hl
   33F3 DD 7E FF      [19]  259 	ld	a,-1 (ix)
   33F6 F5            [11]  260 	push	af
   33F7 33            [ 6]  261 	inc	sp
   33F8 DD 6E FD      [19]  262 	ld	l,-3 (ix)
   33FB DD 66 FE      [19]  263 	ld	h,-2 (ix)
   33FE E5            [11]  264 	push	hl
   33FF D5            [11]  265 	push	de
   3400 CD 3D 23      [17]  266 	call	_create_enemy
   3403 F1            [10]  267 	pop	af
   3404 F1            [10]  268 	pop	af
   3405 33            [ 6]  269 	inc	sp
   3406 C1            [10]  270 	pop	bc
   3407                     271 00112$:
                            272 ;src/entities/user.c:68: if (cpct_isKeyPressed(Key_J)){
   3407 C5            [11]  273 	push	bc
   3408 21 05 20      [10]  274 	ld	hl,#0x2005
   340B E5            [11]  275 	push	hl
   340C CD C2 49      [17]  276 	call	_cpct_isKeyPressed
   340F F1            [10]  277 	pop	af
   3410 7D            [ 4]  278 	ld	a,l
   3411 C1            [10]  279 	pop	bc
   3412 B7            [ 4]  280 	or	a, a
   3413 CA CE 34      [10]  281 	jp	Z,00114$
                            282 ;src/entities/user.c:69: x=rand()%80;
   3416 C5            [11]  283 	push	bc
   3417 CD 61 4A      [17]  284 	call	_rand
   341A 11 50 00      [10]  285 	ld	de,#0x0050
   341D D5            [11]  286 	push	de
   341E E5            [11]  287 	push	hl
   341F CD F1 4C      [17]  288 	call	__modsint
   3422 F1            [10]  289 	pop	af
   3423 F1            [10]  290 	pop	af
   3424 C1            [10]  291 	pop	bc
   3425 DD 75 FA      [19]  292 	ld	-6 (ix),l
                            293 ;src/entities/user.c:70: y=rand()%199;
   3428 C5            [11]  294 	push	bc
   3429 CD 61 4A      [17]  295 	call	_rand
   342C 11 C7 00      [10]  296 	ld	de,#0x00C7
   342F D5            [11]  297 	push	de
   3430 E5            [11]  298 	push	hl
   3431 CD F1 4C      [17]  299 	call	__modsint
   3434 F1            [10]  300 	pop	af
   3435 F1            [10]  301 	pop	af
   3436 C1            [10]  302 	pop	bc
   3437 DD 75 F9      [19]  303 	ld	-7 (ix),l
                            304 ;src/entities/user.c:71: create_enemy(x,y,(rand()%3));
   343A C5            [11]  305 	push	bc
   343B CD 61 4A      [17]  306 	call	_rand
   343E 11 03 00      [10]  307 	ld	de,#0x0003
   3441 D5            [11]  308 	push	de
   3442 E5            [11]  309 	push	hl
   3443 CD F1 4C      [17]  310 	call	__modsint
   3446 F1            [10]  311 	pop	af
   3447 F1            [10]  312 	pop	af
   3448 C1            [10]  313 	pop	bc
   3449 65            [ 4]  314 	ld	h,l
   344A DD 7E F9      [19]  315 	ld	a,-7 (ix)
   344D DD 77 FD      [19]  316 	ld	-3 (ix),a
   3450 DD 36 FE 00   [19]  317 	ld	-2 (ix),#0x00
   3454 DD 7E FA      [19]  318 	ld	a,-6 (ix)
   3457 DD 77 FB      [19]  319 	ld	-5 (ix),a
   345A DD 36 FC 00   [19]  320 	ld	-4 (ix),#0x00
   345E C5            [11]  321 	push	bc
   345F E5            [11]  322 	push	hl
   3460 33            [ 6]  323 	inc	sp
   3461 DD 6E FD      [19]  324 	ld	l,-3 (ix)
   3464 DD 66 FE      [19]  325 	ld	h,-2 (ix)
   3467 E5            [11]  326 	push	hl
   3468 DD 6E FB      [19]  327 	ld	l,-5 (ix)
   346B DD 66 FC      [19]  328 	ld	h,-4 (ix)
   346E E5            [11]  329 	push	hl
   346F CD 3D 23      [17]  330 	call	_create_enemy
   3472 F1            [10]  331 	pop	af
   3473 F1            [10]  332 	pop	af
   3474 33            [ 6]  333 	inc	sp
   3475 CD 61 4A      [17]  334 	call	_rand
   3478 11 03 00      [10]  335 	ld	de,#0x0003
   347B D5            [11]  336 	push	de
   347C E5            [11]  337 	push	hl
   347D CD F1 4C      [17]  338 	call	__modsint
   3480 F1            [10]  339 	pop	af
   3481 F1            [10]  340 	pop	af
   3482 C1            [10]  341 	pop	bc
   3483 65            [ 4]  342 	ld	h,l
   3484 DD 7E FB      [19]  343 	ld	a,-5 (ix)
   3487 C6 08         [ 7]  344 	add	a, #0x08
   3489 5F            [ 4]  345 	ld	e,a
   348A DD 7E FC      [19]  346 	ld	a,-4 (ix)
   348D CE 00         [ 7]  347 	adc	a, #0x00
   348F 57            [ 4]  348 	ld	d,a
   3490 C5            [11]  349 	push	bc
   3491 E5            [11]  350 	push	hl
   3492 33            [ 6]  351 	inc	sp
   3493 DD 6E FD      [19]  352 	ld	l,-3 (ix)
   3496 DD 66 FE      [19]  353 	ld	h,-2 (ix)
   3499 E5            [11]  354 	push	hl
   349A D5            [11]  355 	push	de
   349B CD 3D 23      [17]  356 	call	_create_enemy
   349E F1            [10]  357 	pop	af
   349F F1            [10]  358 	pop	af
   34A0 33            [ 6]  359 	inc	sp
   34A1 CD 61 4A      [17]  360 	call	_rand
   34A4 11 03 00      [10]  361 	ld	de,#0x0003
   34A7 D5            [11]  362 	push	de
   34A8 E5            [11]  363 	push	hl
   34A9 CD F1 4C      [17]  364 	call	__modsint
   34AC F1            [10]  365 	pop	af
   34AD F1            [10]  366 	pop	af
   34AE C1            [10]  367 	pop	bc
   34AF 65            [ 4]  368 	ld	h,l
   34B0 DD 7E FB      [19]  369 	ld	a,-5 (ix)
   34B3 C6 10         [ 7]  370 	add	a, #0x10
   34B5 5F            [ 4]  371 	ld	e,a
   34B6 DD 7E FC      [19]  372 	ld	a,-4 (ix)
   34B9 CE 00         [ 7]  373 	adc	a, #0x00
   34BB 57            [ 4]  374 	ld	d,a
   34BC C5            [11]  375 	push	bc
   34BD E5            [11]  376 	push	hl
   34BE 33            [ 6]  377 	inc	sp
   34BF DD 6E FD      [19]  378 	ld	l,-3 (ix)
   34C2 DD 66 FE      [19]  379 	ld	h,-2 (ix)
   34C5 E5            [11]  380 	push	hl
   34C6 D5            [11]  381 	push	de
   34C7 CD 3D 23      [17]  382 	call	_create_enemy
   34CA F1            [10]  383 	pop	af
   34CB F1            [10]  384 	pop	af
   34CC 33            [ 6]  385 	inc	sp
   34CD C1            [10]  386 	pop	bc
   34CE                     387 00114$:
                            388 ;src/entities/user.c:76: if (cpct_isKeyPressed(Key_K)){
   34CE C5            [11]  389 	push	bc
   34CF 21 04 20      [10]  390 	ld	hl,#0x2004
   34D2 E5            [11]  391 	push	hl
   34D3 CD C2 49      [17]  392 	call	_cpct_isKeyPressed
   34D6 F1            [10]  393 	pop	af
   34D7 7D            [ 4]  394 	ld	a,l
   34D8 C1            [10]  395 	pop	bc
   34D9 B7            [ 4]  396 	or	a, a
   34DA 28 55         [12]  397 	jr	Z,00116$
                            398 ;src/entities/user.c:77: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
   34DC C5            [11]  399 	push	bc
   34DD CD 61 4A      [17]  400 	call	_rand
   34E0 11 03 00      [10]  401 	ld	de,#0x0003
   34E3 D5            [11]  402 	push	de
   34E4 E5            [11]  403 	push	hl
   34E5 CD F1 4C      [17]  404 	call	__modsint
   34E8 F1            [10]  405 	pop	af
   34E9 F1            [10]  406 	pop	af
   34EA C1            [10]  407 	pop	bc
   34EB DD 75 FB      [19]  408 	ld	-5 (ix),l
   34EE C5            [11]  409 	push	bc
   34EF CD 61 4A      [17]  410 	call	_rand
   34F2 11 28 00      [10]  411 	ld	de,#0x0028
   34F5 D5            [11]  412 	push	de
   34F6 E5            [11]  413 	push	hl
   34F7 CD F1 4C      [17]  414 	call	__modsint
   34FA F1            [10]  415 	pop	af
   34FB F1            [10]  416 	pop	af
   34FC DD 74 FE      [19]  417 	ld	-2 (ix),h
   34FF DD 75 FD      [19]  418 	ld	-3 (ix),l
   3502 CD 61 4A      [17]  419 	call	_rand
   3505 11 0A 00      [10]  420 	ld	de,#0x000A
   3508 D5            [11]  421 	push	de
   3509 E5            [11]  422 	push	hl
   350A CD F1 4C      [17]  423 	call	__modsint
   350D F1            [10]  424 	pop	af
   350E F1            [10]  425 	pop	af
   350F EB            [ 4]  426 	ex	de,hl
   3510 C1            [10]  427 	pop	bc
   3511 13            [ 6]  428 	inc	de
   3512 13            [ 6]  429 	inc	de
   3513 13            [ 6]  430 	inc	de
   3514 13            [ 6]  431 	inc	de
   3515 13            [ 6]  432 	inc	de
   3516 C5            [11]  433 	push	bc
   3517 3E 0C         [ 7]  434 	ld	a,#0x0C
   3519 F5            [11]  435 	push	af
   351A 33            [ 6]  436 	inc	sp
   351B DD 7E FB      [19]  437 	ld	a,-5 (ix)
   351E F5            [11]  438 	push	af
   351F 33            [ 6]  439 	inc	sp
   3520 DD 6E FD      [19]  440 	ld	l,-3 (ix)
   3523 DD 66 FE      [19]  441 	ld	h,-2 (ix)
   3526 E5            [11]  442 	push	hl
   3527 D5            [11]  443 	push	de
   3528 CD 7C 26      [17]  444 	call	_create_enemy_group
   352B 21 06 00      [10]  445 	ld	hl,#6
   352E 39            [11]  446 	add	hl,sp
   352F F9            [ 6]  447 	ld	sp,hl
   3530 C1            [10]  448 	pop	bc
   3531                     449 00116$:
                            450 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
   3531 C5            [11]  451 	push	bc
   3532 21 05 80      [10]  452 	ld	hl,#0x8005
   3535 E5            [11]  453 	push	hl
   3536 CD C2 49      [17]  454 	call	_cpct_isKeyPressed
   3539 F1            [10]  455 	pop	af
   353A C1            [10]  456 	pop	bc
                            457 ;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
                            458 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
   353B 7D            [ 4]  459 	ld	a,l
   353C B7            [ 4]  460 	or	a, a
   353D 28 1B         [12]  461 	jr	Z,00118$
                            462 ;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
   353F 21 A6 55      [10]  463 	ld	hl, #_user + 7
   3542 5E            [ 7]  464 	ld	e,(hl)
   3543 3A A5 55      [13]  465 	ld	a, (#(_user + 0x0006) + 0)
   3546 57            [ 4]  466 	ld	d,a
   3547 14            [ 4]  467 	inc	d
   3548 14            [ 4]  468 	inc	d
   3549 C5            [11]  469 	push	bc
   354A 3A B5 55      [13]  470 	ld	a,(_shoot_type)
   354D F5            [11]  471 	push	af
   354E 33            [ 6]  472 	inc	sp
   354F 7B            [ 4]  473 	ld	a,e
   3550 F5            [11]  474 	push	af
   3551 33            [ 6]  475 	inc	sp
   3552 D5            [11]  476 	push	de
   3553 33            [ 6]  477 	inc	sp
   3554 CD 30 30      [17]  478 	call	_create_shoot
   3557 F1            [10]  479 	pop	af
   3558 33            [ 6]  480 	inc	sp
   3559 C1            [10]  481 	pop	bc
   355A                     482 00118$:
                            483 ;src/entities/user.c:84: if (user.ax!=0){
   355A 21 AB 55      [10]  484 	ld	hl, #(_user + 0x000c) + 0
   355D 56            [ 7]  485 	ld	d,(hl)
                            486 ;src/entities/user.c:85: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
                            487 ;src/entities/user.c:84: if (user.ax!=0){
   355E 7A            [ 4]  488 	ld	a,d
   355F B7            [ 4]  489 	or	a, a
   3560 28 4C         [12]  490 	jr	Z,00125$
                            491 ;src/entities/user.c:85: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
   3562 21 A7 55      [10]  492 	ld	hl, #(_user + 0x0008) + 0
   3565 5E            [ 7]  493 	ld	e,(hl)
   3566 CB 7B         [ 8]  494 	bit	7, e
   3568 20 0E         [12]  495 	jr	NZ,00123$
   356A 21 A9 55      [10]  496 	ld	hl, #(_user + 0x000a) + 0
   356D 66            [ 7]  497 	ld	h,(hl)
   356E 7B            [ 4]  498 	ld	a,e
   356F 94            [ 4]  499 	sub	a, h
   3570 E2 75 35      [10]  500 	jp	PO, 00202$
   3573 EE 80         [ 7]  501 	xor	a, #0x80
   3575                     502 00202$:
   3575 FA A9 35      [10]  503 	jp	M,00119$
   3578                     504 00123$:
   3578 AF            [ 4]  505 	xor	a, a
   3579 93            [ 4]  506 	sub	a, e
   357A E2 7F 35      [10]  507 	jp	PO, 00203$
   357D EE 80         [ 7]  508 	xor	a, #0x80
   357F                     509 00203$:
   357F FA AE 35      [10]  510 	jp	M,00125$
   3582 3A A9 55      [13]  511 	ld	a, (#(_user + 0x000a) + 0)
   3585 6F            [ 4]  512 	ld	l,a
   3586 17            [ 4]  513 	rla
   3587 9F            [ 4]  514 	sbc	a, a
   3588 67            [ 4]  515 	ld	h,a
   3589 AF            [ 4]  516 	xor	a, a
   358A 95            [ 4]  517 	sub	a, l
   358B DD 77 FB      [19]  518 	ld	-5 (ix),a
   358E 3E 00         [ 7]  519 	ld	a, #0x00
   3590 9C            [ 4]  520 	sbc	a, h
   3591 DD 77 FC      [19]  521 	ld	-4 (ix),a
   3594 7B            [ 4]  522 	ld	a,e
   3595 67            [ 4]  523 	ld	h,a
   3596 17            [ 4]  524 	rla
   3597 9F            [ 4]  525 	sbc	a, a
   3598 6F            [ 4]  526 	ld	l,a
   3599 DD 7E FB      [19]  527 	ld	a,-5 (ix)
   359C 94            [ 4]  528 	sub	a, h
   359D DD 7E FC      [19]  529 	ld	a,-4 (ix)
   35A0 9D            [ 4]  530 	sbc	a, l
   35A1 E2 A6 35      [10]  531 	jp	PO, 00204$
   35A4 EE 80         [ 7]  532 	xor	a, #0x80
   35A6                     533 00204$:
   35A6 F2 AE 35      [10]  534 	jp	P,00125$
   35A9                     535 00119$:
                            536 ;src/entities/user.c:86: user.vx+=user.ax;
   35A9 7B            [ 4]  537 	ld	a,e
   35AA 82            [ 4]  538 	add	a, d
   35AB 32 A7 55      [13]  539 	ld	(#(_user + 0x0008)),a
   35AE                     540 00125$:
                            541 ;src/entities/user.c:90: if (user.vx>0){
   35AE 21 A7 55      [10]  542 	ld	hl, #(_user + 0x0008) + 0
   35B1 56            [ 7]  543 	ld	d,(hl)
   35B2 AF            [ 4]  544 	xor	a, a
   35B3 92            [ 4]  545 	sub	a, d
   35B4 E2 B9 35      [10]  546 	jp	PO, 00205$
   35B7 EE 80         [ 7]  547 	xor	a, #0x80
   35B9                     548 00205$:
   35B9 F2 C3 35      [10]  549 	jp	P,00129$
                            550 ;src/entities/user.c:91: user.vx--;
   35BC 15            [ 4]  551 	dec	d
   35BD 21 A7 55      [10]  552 	ld	hl,#(_user + 0x0008)
   35C0 72            [ 7]  553 	ld	(hl),d
   35C1 18 09         [12]  554 	jr	00130$
   35C3                     555 00129$:
                            556 ;src/entities/user.c:92: } else if (user.vx<0){
   35C3 CB 7A         [ 8]  557 	bit	7, d
   35C5 28 05         [12]  558 	jr	Z,00130$
                            559 ;src/entities/user.c:93: user.vx++;
   35C7 14            [ 4]  560 	inc	d
   35C8 21 A7 55      [10]  561 	ld	hl,#(_user + 0x0008)
   35CB 72            [ 7]  562 	ld	(hl),d
   35CC                     563 00130$:
                            564 ;src/entities/user.c:96: user.x+=user.vx;
   35CC 21 A5 55      [10]  565 	ld	hl, #(_user + 0x0006) + 0
   35CF 56            [ 7]  566 	ld	d,(hl)
   35D0 21 A7 55      [10]  567 	ld	hl, #(_user + 0x0008) + 0
   35D3 66            [ 7]  568 	ld	h,(hl)
   35D4 7A            [ 4]  569 	ld	a,d
   35D5 84            [ 4]  570 	add	a, h
   35D6 57            [ 4]  571 	ld	d,a
   35D7 21 A5 55      [10]  572 	ld	hl,#(_user + 0x0006)
   35DA 72            [ 7]  573 	ld	(hl),d
                            574 ;src/entities/user.c:98: if (user.x<0)
   35DB 21 A5 55      [10]  575 	ld	hl, #(_user + 0x0006) + 0
   35DE 5E            [ 7]  576 	ld	e,(hl)
   35DF CB 7A         [ 8]  577 	bit	7, d
   35E1 28 07         [12]  578 	jr	Z,00134$
                            579 ;src/entities/user.c:99: user.x=0;
   35E3 21 A5 55      [10]  580 	ld	hl,#(_user + 0x0006)
   35E6 36 00         [10]  581 	ld	(hl),#0x00
   35E8 18 25         [12]  582 	jr	00136$
   35EA                     583 00134$:
                            584 ;src/entities/user.c:100: else if (user.x> 79-user.w){
   35EA 21 AD 55      [10]  585 	ld	hl, #_user + 14
   35ED 66            [ 7]  586 	ld	h,(hl)
   35EE 4C            [ 4]  587 	ld	c,h
   35EF 06 00         [ 7]  588 	ld	b,#0x00
   35F1 3E 4F         [ 7]  589 	ld	a,#0x4F
   35F3 91            [ 4]  590 	sub	a, c
   35F4 4F            [ 4]  591 	ld	c,a
   35F5 3E 00         [ 7]  592 	ld	a,#0x00
   35F7 98            [ 4]  593 	sbc	a, b
   35F8 47            [ 4]  594 	ld	b,a
   35F9 7B            [ 4]  595 	ld	a,e
   35FA 17            [ 4]  596 	rla
   35FB 9F            [ 4]  597 	sbc	a, a
   35FC 57            [ 4]  598 	ld	d,a
   35FD 79            [ 4]  599 	ld	a,c
   35FE 93            [ 4]  600 	sub	a, e
   35FF 78            [ 4]  601 	ld	a,b
   3600 9A            [ 4]  602 	sbc	a, d
   3601 E2 06 36      [10]  603 	jp	PO, 00206$
   3604 EE 80         [ 7]  604 	xor	a, #0x80
   3606                     605 00206$:
   3606 F2 0F 36      [10]  606 	jp	P,00136$
                            607 ;src/entities/user.c:101: user.x = 79-user.w;
   3609 3E 4F         [ 7]  608 	ld	a,#0x4F
   360B 94            [ 4]  609 	sub	a, h
   360C 32 A5 55      [13]  610 	ld	(#(_user + 0x0006)),a
   360F                     611 00136$:
   360F DD F9         [10]  612 	ld	sp, ix
   3611 DD E1         [14]  613 	pop	ix
   3613 C9            [10]  614 	ret
                            615 ;src/entities/user.c:105: void draw_user(u8* screen){
                            616 ;	---------------------------------
                            617 ; Function draw_user
                            618 ; ---------------------------------
   3614                     619 _draw_user::
   3614 DD E5         [15]  620 	push	ix
   3616 DD 21 00 00   [14]  621 	ld	ix,#0
   361A DD 39         [15]  622 	add	ix,sp
                            623 ;src/entities/user.c:107: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   361C 21 A6 55      [10]  624 	ld	hl, #_user + 7
   361F 4E            [ 7]  625 	ld	c,(hl)
   3620 21 A5 55      [10]  626 	ld	hl, #_user + 6
   3623 66            [ 7]  627 	ld	h,(hl)
   3624 DD 5E 04      [19]  628 	ld	e,4 (ix)
   3627 DD 56 05      [19]  629 	ld	d,5 (ix)
   362A 79            [ 4]  630 	ld	a,c
   362B F5            [11]  631 	push	af
   362C 33            [ 6]  632 	inc	sp
   362D E5            [11]  633 	push	hl
   362E 33            [ 6]  634 	inc	sp
   362F D5            [11]  635 	push	de
   3630 CD 11 4D      [17]  636 	call	_cpct_getScreenPtr
   3633 F1            [10]  637 	pop	af
   3634 F1            [10]  638 	pop	af
   3635 EB            [ 4]  639 	ex	de,hl
                            640 ;src/entities/user.c:108: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   3636 21 AE 55      [10]  641 	ld	hl, #_user + 15
   3639 4E            [ 7]  642 	ld	c,(hl)
   363A 21 AD 55      [10]  643 	ld	hl, #_user + 14
   363D 46            [ 7]  644 	ld	b,(hl)
   363E 2A A3 55      [16]  645 	ld	hl, (#_user + 4)
   3641 E5            [11]  646 	push	hl
   3642 FD E1         [14]  647 	pop	iy
   3644 79            [ 4]  648 	ld	a,c
   3645 F5            [11]  649 	push	af
   3646 33            [ 6]  650 	inc	sp
   3647 C5            [11]  651 	push	bc
   3648 33            [ 6]  652 	inc	sp
   3649 D5            [11]  653 	push	de
   364A FD E5         [15]  654 	push	iy
   364C CD E8 4A      [17]  655 	call	_cpct_drawSprite
   364F DD E1         [14]  656 	pop	ix
   3651 C9            [10]  657 	ret
                            658 	.area _CODE
                            659 	.area _INITIALIZER
                            660 	.area _CABS (ABS)
