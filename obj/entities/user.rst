                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:51 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_explosion
                             13 	.globl _create_enemy_group
                             14 	.globl _create_enemy
                             15 	.globl _create_shoot
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_drawSprite
                             18 	.globl _cpct_isKeyPressed
                             19 	.globl _cpct_scanKeyboard_f
                             20 	.globl _rand
                             21 	.globl _shoot_type
                             22 	.globl _user
                             23 	.globl _init_user
                             24 	.globl _get_user_max_shoots
                             25 	.globl _update_user
                             26 	.globl _draw_user
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   58EA                      34 _user::
   58EA                      35 	.ds 22
   5900                      36 _shoot_type::
   5900                      37 	.ds 1
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
                             42 ;--------------------------------------------------------
                             43 ; absolute external ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DABS (ABS)
                             46 ;--------------------------------------------------------
                             47 ; global & static initialisations
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _GSINIT
                             51 	.area _GSFINAL
                             52 	.area _GSINIT
                             53 ;--------------------------------------------------------
                             54 ; Home
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _HOME
                             58 ;--------------------------------------------------------
                             59 ; code
                             60 ;--------------------------------------------------------
                             61 	.area _CODE
                             62 ;src/entities/user.c:9: void init_user(){
                             63 ;	---------------------------------
                             64 ; Function init_user
                             65 ; ---------------------------------
   34B9                      66 _init_user::
                             67 ;src/entities/user.c:11: user.w = 4;
   34B9 21 F8 58      [10]   68 	ld	hl,#_user + 14
   34BC 36 04         [10]   69 	ld	(hl),#0x04
                             70 ;src/entities/user.c:12: user.h = 8;
   34BE FD 21 F9 58   [14]   71 	ld	iy,#_user + 15
   34C2 FD 36 00 08   [19]   72 	ld	0 (iy), #0x08
                             73 ;src/entities/user.c:13: user.x = 39-(user.w/2);
   34C6 6E            [ 7]   74 	ld	l,(hl)
   34C7 CB 3D         [ 8]   75 	srl	l
   34C9 3E 27         [ 7]   76 	ld	a,#0x27
   34CB 95            [ 4]   77 	sub	a, l
   34CC 32 F0 58      [13]   78 	ld	(#(_user + 0x0006)),a
                             79 ;src/entities/user.c:14: user.y = 199-(user.h);
   34CF FD 66 00      [19]   80 	ld	h, 0 (iy)
   34D2 3E C7         [ 7]   81 	ld	a,#0xC7
   34D4 94            [ 4]   82 	sub	a, h
   34D5 32 F1 58      [13]   83 	ld	(#(_user + 0x0007)),a
                             84 ;src/entities/user.c:15: user.vx = 0;
   34D8 21 F2 58      [10]   85 	ld	hl,#_user + 8
   34DB 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/user.c:16: user.vy = 0;
   34DD 21 F3 58      [10]   88 	ld	hl,#_user + 9
   34E0 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/user.c:17: user.topvx = 4;
   34E2 21 F4 58      [10]   91 	ld	hl,#_user + 10
   34E5 36 04         [10]   92 	ld	(hl),#0x04
                             93 ;src/entities/user.c:18: user.topvy = 5;
   34E7 21 F5 58      [10]   94 	ld	hl,#_user + 11
   34EA 36 05         [10]   95 	ld	(hl),#0x05
                             96 ;src/entities/user.c:19: user.ax=0;
   34EC 21 F6 58      [10]   97 	ld	hl,#_user + 12
   34EF 36 00         [10]   98 	ld	(hl),#0x00
                             99 ;src/entities/user.c:20: user.ay=0;
   34F1 21 F7 58      [10]  100 	ld	hl,#_user + 13
   34F4 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/user.c:21: user.sprite = (u8*) G_ship_00;
   34F6 21 CB 40      [10]  103 	ld	hl,#_G_ship_00
   34F9 22 EE 58      [16]  104 	ld	((_user + 0x0004)), hl
                            105 ;src/entities/user.c:23: user.max_shoots = 10;
   34FC 21 FF 58      [10]  106 	ld	hl,#_user + 21
   34FF 36 0A         [10]  107 	ld	(hl),#0x0A
                            108 ;src/entities/user.c:24: shoot_type = 1;
   3501 21 00 59      [10]  109 	ld	hl,#_shoot_type + 0
   3504 36 01         [10]  110 	ld	(hl), #0x01
   3506 C9            [10]  111 	ret
                            112 ;src/entities/user.c:27: u8 get_user_max_shoots(){
                            113 ;	---------------------------------
                            114 ; Function get_user_max_shoots
                            115 ; ---------------------------------
   3507                     116 _get_user_max_shoots::
                            117 ;src/entities/user.c:28: return user.max_shoots;
   3507 21 FF 58      [10]  118 	ld	hl,#_user+21
   350A 6E            [ 7]  119 	ld	l,(hl)
   350B C9            [10]  120 	ret
                            121 ;src/entities/user.c:31: void update_user() {
                            122 ;	---------------------------------
                            123 ; Function update_user
                            124 ; ---------------------------------
   350C                     125 _update_user::
   350C DD E5         [15]  126 	push	ix
   350E DD 21 00 00   [14]  127 	ld	ix,#0
   3512 DD 39         [15]  128 	add	ix,sp
   3514 21 F9 FF      [10]  129 	ld	hl,#-7
   3517 39            [11]  130 	add	hl,sp
   3518 F9            [ 6]  131 	ld	sp,hl
                            132 ;src/entities/user.c:34: user.ax=0;
   3519 01 EA 58      [10]  133 	ld	bc,#_user+0
   351C 21 F6 58      [10]  134 	ld	hl,#(_user + 0x000c)
   351F 36 00         [10]  135 	ld	(hl),#0x00
                            136 ;src/entities/user.c:37: cpct_scanKeyboard_f();
   3521 C5            [11]  137 	push	bc
   3522 CD 31 4D      [17]  138 	call	_cpct_scanKeyboard_f
   3525 21 08 08      [10]  139 	ld	hl,#0x0808
   3528 E5            [11]  140 	push	hl
   3529 CD 20 4D      [17]  141 	call	_cpct_isKeyPressed
   352C F1            [10]  142 	pop	af
   352D C1            [10]  143 	pop	bc
                            144 ;src/entities/user.c:45: user.ay = -2;
                            145 ;src/entities/user.c:44: if ((cpct_isKeyPressed(Key_Q))){ 
   352E 7D            [ 4]  146 	ld	a,l
   352F B7            [ 4]  147 	or	a, a
   3530 28 05         [12]  148 	jr	Z,00102$
                            149 ;src/entities/user.c:45: user.ay = -2;
   3532 21 F7 58      [10]  150 	ld	hl,#(_user + 0x000d)
   3535 36 FE         [10]  151 	ld	(hl),#0xFE
   3537                     152 00102$:
                            153 ;src/entities/user.c:48: if ((cpct_isKeyPressed(Key_P))){ 
   3537 C5            [11]  154 	push	bc
   3538 21 03 08      [10]  155 	ld	hl,#0x0803
   353B E5            [11]  156 	push	hl
   353C CD 20 4D      [17]  157 	call	_cpct_isKeyPressed
   353F F1            [10]  158 	pop	af
   3540 7D            [ 4]  159 	ld	a,l
   3541 C1            [10]  160 	pop	bc
   3542 B7            [ 4]  161 	or	a, a
   3543 28 05         [12]  162 	jr	Z,00104$
                            163 ;src/entities/user.c:49: user.ax = 2;
   3545 21 F6 58      [10]  164 	ld	hl,#(_user + 0x000c)
   3548 36 02         [10]  165 	ld	(hl),#0x02
   354A                     166 00104$:
                            167 ;src/entities/user.c:52: if (cpct_isKeyPressed(Key_O)){
   354A C5            [11]  168 	push	bc
   354B 21 04 04      [10]  169 	ld	hl,#0x0404
   354E E5            [11]  170 	push	hl
   354F CD 20 4D      [17]  171 	call	_cpct_isKeyPressed
   3552 F1            [10]  172 	pop	af
   3553 7D            [ 4]  173 	ld	a,l
   3554 C1            [10]  174 	pop	bc
   3555 B7            [ 4]  175 	or	a, a
   3556 28 05         [12]  176 	jr	Z,00106$
                            177 ;src/entities/user.c:53: user.ax=-2;    
   3558 21 F6 58      [10]  178 	ld	hl,#(_user + 0x000c)
   355B 36 FE         [10]  179 	ld	(hl),#0xFE
   355D                     180 00106$:
                            181 ;src/entities/user.c:56: if (cpct_isKeyPressed(Key_A)){
   355D C5            [11]  182 	push	bc
   355E 21 08 20      [10]  183 	ld	hl,#0x2008
   3561 E5            [11]  184 	push	hl
   3562 CD 20 4D      [17]  185 	call	_cpct_isKeyPressed
   3565 F1            [10]  186 	pop	af
   3566 7D            [ 4]  187 	ld	a,l
   3567 C1            [10]  188 	pop	bc
   3568 B7            [ 4]  189 	or	a, a
   3569 28 05         [12]  190 	jr	Z,00108$
                            191 ;src/entities/user.c:57: user.ay=2;    
   356B 21 F7 58      [10]  192 	ld	hl,#(_user + 0x000d)
   356E 36 02         [10]  193 	ld	(hl),#0x02
   3570                     194 00108$:
                            195 ;src/entities/user.c:60: if (cpct_isKeyPressed(Key_D)){
   3570 C5            [11]  196 	push	bc
   3571 21 07 20      [10]  197 	ld	hl,#0x2007
   3574 E5            [11]  198 	push	hl
   3575 CD 20 4D      [17]  199 	call	_cpct_isKeyPressed
   3578 F1            [10]  200 	pop	af
   3579 7D            [ 4]  201 	ld	a,l
   357A C1            [10]  202 	pop	bc
   357B B7            [ 4]  203 	or	a, a
   357C 28 1D         [12]  204 	jr	Z,00110$
                            205 ;src/entities/user.c:61: shoot_type=(shoot_type+1)%2;
   357E FD 21 00 59   [14]  206 	ld	iy,#_shoot_type
   3582 FD 6E 00      [19]  207 	ld	l,0 (iy)
   3585 26 00         [ 7]  208 	ld	h,#0x00
   3587 23            [ 6]  209 	inc	hl
   3588 C5            [11]  210 	push	bc
   3589 11 02 00      [10]  211 	ld	de,#0x0002
   358C D5            [11]  212 	push	de
   358D E5            [11]  213 	push	hl
   358E CD 3C 50      [17]  214 	call	__modsint
   3591 F1            [10]  215 	pop	af
   3592 F1            [10]  216 	pop	af
   3593 C1            [10]  217 	pop	bc
   3594 FD 21 00 59   [14]  218 	ld	iy,#_shoot_type
   3598 FD 75 00      [19]  219 	ld	0 (iy),l
   359B                     220 00110$:
                            221 ;src/entities/user.c:64: if (cpct_isKeyPressed(Key_H)){
   359B C5            [11]  222 	push	bc
   359C 21 05 10      [10]  223 	ld	hl,#0x1005
   359F E5            [11]  224 	push	hl
   35A0 CD 20 4D      [17]  225 	call	_cpct_isKeyPressed
   35A3 F1            [10]  226 	pop	af
   35A4 7D            [ 4]  227 	ld	a,l
   35A5 C1            [10]  228 	pop	bc
   35A6 B7            [ 4]  229 	or	a, a
   35A7 28 48         [12]  230 	jr	Z,00112$
                            231 ;src/entities/user.c:65: create_enemy((rand()%80),(rand()%199),(rand()%3));
   35A9 C5            [11]  232 	push	bc
   35AA CD BF 4D      [17]  233 	call	_rand
   35AD 11 03 00      [10]  234 	ld	de,#0x0003
   35B0 D5            [11]  235 	push	de
   35B1 E5            [11]  236 	push	hl
   35B2 CD 3C 50      [17]  237 	call	__modsint
   35B5 F1            [10]  238 	pop	af
   35B6 F1            [10]  239 	pop	af
   35B7 C1            [10]  240 	pop	bc
   35B8 DD 75 FF      [19]  241 	ld	-1 (ix),l
   35BB C5            [11]  242 	push	bc
   35BC CD BF 4D      [17]  243 	call	_rand
   35BF 11 C7 00      [10]  244 	ld	de,#0x00C7
   35C2 D5            [11]  245 	push	de
   35C3 E5            [11]  246 	push	hl
   35C4 CD 3C 50      [17]  247 	call	__modsint
   35C7 F1            [10]  248 	pop	af
   35C8 F1            [10]  249 	pop	af
   35C9 DD 74 FE      [19]  250 	ld	-2 (ix),h
   35CC DD 75 FD      [19]  251 	ld	-3 (ix),l
   35CF CD BF 4D      [17]  252 	call	_rand
   35D2 11 50 00      [10]  253 	ld	de,#0x0050
   35D5 D5            [11]  254 	push	de
   35D6 E5            [11]  255 	push	hl
   35D7 CD 3C 50      [17]  256 	call	__modsint
   35DA F1            [10]  257 	pop	af
   35DB F1            [10]  258 	pop	af
   35DC EB            [ 4]  259 	ex	de,hl
   35DD DD 7E FF      [19]  260 	ld	a,-1 (ix)
   35E0 F5            [11]  261 	push	af
   35E1 33            [ 6]  262 	inc	sp
   35E2 DD 6E FD      [19]  263 	ld	l,-3 (ix)
   35E5 DD 66 FE      [19]  264 	ld	h,-2 (ix)
   35E8 E5            [11]  265 	push	hl
   35E9 D5            [11]  266 	push	de
   35EA CD 79 24      [17]  267 	call	_create_enemy
   35ED F1            [10]  268 	pop	af
   35EE F1            [10]  269 	pop	af
   35EF 33            [ 6]  270 	inc	sp
   35F0 C1            [10]  271 	pop	bc
   35F1                     272 00112$:
                            273 ;src/entities/user.c:68: if (cpct_isKeyPressed(Key_J)){
   35F1 C5            [11]  274 	push	bc
   35F2 21 05 20      [10]  275 	ld	hl,#0x2005
   35F5 E5            [11]  276 	push	hl
   35F6 CD 20 4D      [17]  277 	call	_cpct_isKeyPressed
   35F9 F1            [10]  278 	pop	af
   35FA 7D            [ 4]  279 	ld	a,l
   35FB C1            [10]  280 	pop	bc
   35FC B7            [ 4]  281 	or	a, a
   35FD CA B8 36      [10]  282 	jp	Z,00114$
                            283 ;src/entities/user.c:69: x=rand()%80;
   3600 C5            [11]  284 	push	bc
   3601 CD BF 4D      [17]  285 	call	_rand
   3604 11 50 00      [10]  286 	ld	de,#0x0050
   3607 D5            [11]  287 	push	de
   3608 E5            [11]  288 	push	hl
   3609 CD 3C 50      [17]  289 	call	__modsint
   360C F1            [10]  290 	pop	af
   360D F1            [10]  291 	pop	af
   360E C1            [10]  292 	pop	bc
   360F DD 75 FA      [19]  293 	ld	-6 (ix),l
                            294 ;src/entities/user.c:70: y=rand()%199;
   3612 C5            [11]  295 	push	bc
   3613 CD BF 4D      [17]  296 	call	_rand
   3616 11 C7 00      [10]  297 	ld	de,#0x00C7
   3619 D5            [11]  298 	push	de
   361A E5            [11]  299 	push	hl
   361B CD 3C 50      [17]  300 	call	__modsint
   361E F1            [10]  301 	pop	af
   361F F1            [10]  302 	pop	af
   3620 C1            [10]  303 	pop	bc
   3621 DD 75 F9      [19]  304 	ld	-7 (ix),l
                            305 ;src/entities/user.c:71: create_enemy(x,y,(rand()%3));
   3624 C5            [11]  306 	push	bc
   3625 CD BF 4D      [17]  307 	call	_rand
   3628 11 03 00      [10]  308 	ld	de,#0x0003
   362B D5            [11]  309 	push	de
   362C E5            [11]  310 	push	hl
   362D CD 3C 50      [17]  311 	call	__modsint
   3630 F1            [10]  312 	pop	af
   3631 F1            [10]  313 	pop	af
   3632 C1            [10]  314 	pop	bc
   3633 65            [ 4]  315 	ld	h,l
   3634 DD 7E F9      [19]  316 	ld	a,-7 (ix)
   3637 DD 77 FD      [19]  317 	ld	-3 (ix),a
   363A DD 36 FE 00   [19]  318 	ld	-2 (ix),#0x00
   363E DD 7E FA      [19]  319 	ld	a,-6 (ix)
   3641 DD 77 FB      [19]  320 	ld	-5 (ix),a
   3644 DD 36 FC 00   [19]  321 	ld	-4 (ix),#0x00
   3648 C5            [11]  322 	push	bc
   3649 E5            [11]  323 	push	hl
   364A 33            [ 6]  324 	inc	sp
   364B DD 6E FD      [19]  325 	ld	l,-3 (ix)
   364E DD 66 FE      [19]  326 	ld	h,-2 (ix)
   3651 E5            [11]  327 	push	hl
   3652 DD 6E FB      [19]  328 	ld	l,-5 (ix)
   3655 DD 66 FC      [19]  329 	ld	h,-4 (ix)
   3658 E5            [11]  330 	push	hl
   3659 CD 79 24      [17]  331 	call	_create_enemy
   365C F1            [10]  332 	pop	af
   365D F1            [10]  333 	pop	af
   365E 33            [ 6]  334 	inc	sp
   365F CD BF 4D      [17]  335 	call	_rand
   3662 11 03 00      [10]  336 	ld	de,#0x0003
   3665 D5            [11]  337 	push	de
   3666 E5            [11]  338 	push	hl
   3667 CD 3C 50      [17]  339 	call	__modsint
   366A F1            [10]  340 	pop	af
   366B F1            [10]  341 	pop	af
   366C C1            [10]  342 	pop	bc
   366D 65            [ 4]  343 	ld	h,l
   366E DD 7E FB      [19]  344 	ld	a,-5 (ix)
   3671 C6 08         [ 7]  345 	add	a, #0x08
   3673 5F            [ 4]  346 	ld	e,a
   3674 DD 7E FC      [19]  347 	ld	a,-4 (ix)
   3677 CE 00         [ 7]  348 	adc	a, #0x00
   3679 57            [ 4]  349 	ld	d,a
   367A C5            [11]  350 	push	bc
   367B E5            [11]  351 	push	hl
   367C 33            [ 6]  352 	inc	sp
   367D DD 6E FD      [19]  353 	ld	l,-3 (ix)
   3680 DD 66 FE      [19]  354 	ld	h,-2 (ix)
   3683 E5            [11]  355 	push	hl
   3684 D5            [11]  356 	push	de
   3685 CD 79 24      [17]  357 	call	_create_enemy
   3688 F1            [10]  358 	pop	af
   3689 F1            [10]  359 	pop	af
   368A 33            [ 6]  360 	inc	sp
   368B CD BF 4D      [17]  361 	call	_rand
   368E 11 03 00      [10]  362 	ld	de,#0x0003
   3691 D5            [11]  363 	push	de
   3692 E5            [11]  364 	push	hl
   3693 CD 3C 50      [17]  365 	call	__modsint
   3696 F1            [10]  366 	pop	af
   3697 F1            [10]  367 	pop	af
   3698 C1            [10]  368 	pop	bc
   3699 65            [ 4]  369 	ld	h,l
   369A DD 7E FB      [19]  370 	ld	a,-5 (ix)
   369D C6 10         [ 7]  371 	add	a, #0x10
   369F 5F            [ 4]  372 	ld	e,a
   36A0 DD 7E FC      [19]  373 	ld	a,-4 (ix)
   36A3 CE 00         [ 7]  374 	adc	a, #0x00
   36A5 57            [ 4]  375 	ld	d,a
   36A6 C5            [11]  376 	push	bc
   36A7 E5            [11]  377 	push	hl
   36A8 33            [ 6]  378 	inc	sp
   36A9 DD 6E FD      [19]  379 	ld	l,-3 (ix)
   36AC DD 66 FE      [19]  380 	ld	h,-2 (ix)
   36AF E5            [11]  381 	push	hl
   36B0 D5            [11]  382 	push	de
   36B1 CD 79 24      [17]  383 	call	_create_enemy
   36B4 F1            [10]  384 	pop	af
   36B5 F1            [10]  385 	pop	af
   36B6 33            [ 6]  386 	inc	sp
   36B7 C1            [10]  387 	pop	bc
   36B8                     388 00114$:
                            389 ;src/entities/user.c:76: if (cpct_isKeyPressed(Key_K)){
   36B8 C5            [11]  390 	push	bc
   36B9 21 04 20      [10]  391 	ld	hl,#0x2004
   36BC E5            [11]  392 	push	hl
   36BD CD 20 4D      [17]  393 	call	_cpct_isKeyPressed
   36C0 F1            [10]  394 	pop	af
   36C1 7D            [ 4]  395 	ld	a,l
   36C2 C1            [10]  396 	pop	bc
   36C3 B7            [ 4]  397 	or	a, a
   36C4 28 55         [12]  398 	jr	Z,00116$
                            399 ;src/entities/user.c:77: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
   36C6 C5            [11]  400 	push	bc
   36C7 CD BF 4D      [17]  401 	call	_rand
   36CA 11 03 00      [10]  402 	ld	de,#0x0003
   36CD D5            [11]  403 	push	de
   36CE E5            [11]  404 	push	hl
   36CF CD 3C 50      [17]  405 	call	__modsint
   36D2 F1            [10]  406 	pop	af
   36D3 F1            [10]  407 	pop	af
   36D4 C1            [10]  408 	pop	bc
   36D5 DD 75 FB      [19]  409 	ld	-5 (ix),l
   36D8 C5            [11]  410 	push	bc
   36D9 CD BF 4D      [17]  411 	call	_rand
   36DC 11 28 00      [10]  412 	ld	de,#0x0028
   36DF D5            [11]  413 	push	de
   36E0 E5            [11]  414 	push	hl
   36E1 CD 3C 50      [17]  415 	call	__modsint
   36E4 F1            [10]  416 	pop	af
   36E5 F1            [10]  417 	pop	af
   36E6 DD 74 FE      [19]  418 	ld	-2 (ix),h
   36E9 DD 75 FD      [19]  419 	ld	-3 (ix),l
   36EC CD BF 4D      [17]  420 	call	_rand
   36EF 11 0A 00      [10]  421 	ld	de,#0x000A
   36F2 D5            [11]  422 	push	de
   36F3 E5            [11]  423 	push	hl
   36F4 CD 3C 50      [17]  424 	call	__modsint
   36F7 F1            [10]  425 	pop	af
   36F8 F1            [10]  426 	pop	af
   36F9 EB            [ 4]  427 	ex	de,hl
   36FA C1            [10]  428 	pop	bc
   36FB 13            [ 6]  429 	inc	de
   36FC 13            [ 6]  430 	inc	de
   36FD 13            [ 6]  431 	inc	de
   36FE 13            [ 6]  432 	inc	de
   36FF 13            [ 6]  433 	inc	de
   3700 C5            [11]  434 	push	bc
   3701 3E 0C         [ 7]  435 	ld	a,#0x0C
   3703 F5            [11]  436 	push	af
   3704 33            [ 6]  437 	inc	sp
   3705 DD 7E FB      [19]  438 	ld	a,-5 (ix)
   3708 F5            [11]  439 	push	af
   3709 33            [ 6]  440 	inc	sp
   370A DD 6E FD      [19]  441 	ld	l,-3 (ix)
   370D DD 66 FE      [19]  442 	ld	h,-2 (ix)
   3710 E5            [11]  443 	push	hl
   3711 D5            [11]  444 	push	de
   3712 CD B8 27      [17]  445 	call	_create_enemy_group
   3715 21 06 00      [10]  446 	ld	hl,#6
   3718 39            [11]  447 	add	hl,sp
   3719 F9            [ 6]  448 	ld	sp,hl
   371A C1            [10]  449 	pop	bc
   371B                     450 00116$:
                            451 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
   371B C5            [11]  452 	push	bc
   371C 21 05 80      [10]  453 	ld	hl,#0x8005
   371F E5            [11]  454 	push	hl
   3720 CD 20 4D      [17]  455 	call	_cpct_isKeyPressed
   3723 F1            [10]  456 	pop	af
   3724 C1            [10]  457 	pop	bc
                            458 ;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
                            459 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
   3725 7D            [ 4]  460 	ld	a,l
   3726 B7            [ 4]  461 	or	a, a
   3727 28 1B         [12]  462 	jr	Z,00118$
                            463 ;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
   3729 21 F1 58      [10]  464 	ld	hl, #_user + 7
   372C 5E            [ 7]  465 	ld	e,(hl)
   372D 3A F0 58      [13]  466 	ld	a, (#(_user + 0x0006) + 0)
   3730 57            [ 4]  467 	ld	d,a
   3731 14            [ 4]  468 	inc	d
   3732 14            [ 4]  469 	inc	d
   3733 C5            [11]  470 	push	bc
   3734 3A 00 59      [13]  471 	ld	a,(_shoot_type)
   3737 F5            [11]  472 	push	af
   3738 33            [ 6]  473 	inc	sp
   3739 7B            [ 4]  474 	ld	a,e
   373A F5            [11]  475 	push	af
   373B 33            [ 6]  476 	inc	sp
   373C D5            [11]  477 	push	de
   373D 33            [ 6]  478 	inc	sp
   373E CD 88 31      [17]  479 	call	_create_shoot
   3741 F1            [10]  480 	pop	af
   3742 33            [ 6]  481 	inc	sp
   3743 C1            [10]  482 	pop	bc
   3744                     483 00118$:
                            484 ;src/entities/user.c:85: if (cpct_isKeyPressed(Key_L)){
   3744 C5            [11]  485 	push	bc
   3745 21 04 10      [10]  486 	ld	hl,#0x1004
   3748 E5            [11]  487 	push	hl
   3749 CD 20 4D      [17]  488 	call	_cpct_isKeyPressed
   374C F1            [10]  489 	pop	af
   374D 7D            [ 4]  490 	ld	a,l
   374E C1            [10]  491 	pop	bc
   374F B7            [ 4]  492 	or	a, a
   3750 28 4A         [12]  493 	jr	Z,00120$
                            494 ;src/entities/user.c:86: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
   3752 C5            [11]  495 	push	bc
   3753 CD BF 4D      [17]  496 	call	_rand
   3756 11 02 00      [10]  497 	ld	de,#0x0002
   3759 D5            [11]  498 	push	de
   375A E5            [11]  499 	push	hl
   375B CD 3C 50      [17]  500 	call	__modsint
   375E F1            [10]  501 	pop	af
   375F F1            [10]  502 	pop	af
   3760 C1            [10]  503 	pop	bc
   3761 DD 75 FB      [19]  504 	ld	-5 (ix),l
   3764 C5            [11]  505 	push	bc
   3765 CD BF 4D      [17]  506 	call	_rand
   3768 11 50 00      [10]  507 	ld	de,#0x0050
   376B D5            [11]  508 	push	de
   376C E5            [11]  509 	push	hl
   376D CD 3C 50      [17]  510 	call	__modsint
   3770 F1            [10]  511 	pop	af
   3771 F1            [10]  512 	pop	af
   3772 C1            [10]  513 	pop	bc
   3773 7D            [ 4]  514 	ld	a,l
   3774 C6 14         [ 7]  515 	add	a, #0x14
   3776 DD 77 FD      [19]  516 	ld	-3 (ix),a
   3779 C5            [11]  517 	push	bc
   377A CD BF 4D      [17]  518 	call	_rand
   377D 11 14 00      [10]  519 	ld	de,#0x0014
   3780 D5            [11]  520 	push	de
   3781 E5            [11]  521 	push	hl
   3782 CD 3C 50      [17]  522 	call	__modsint
   3785 F1            [10]  523 	pop	af
   3786 F1            [10]  524 	pop	af
   3787 C1            [10]  525 	pop	bc
   3788 7D            [ 4]  526 	ld	a,l
   3789 C6 05         [ 7]  527 	add	a, #0x05
   378B 57            [ 4]  528 	ld	d,a
   378C C5            [11]  529 	push	bc
   378D DD 66 FB      [19]  530 	ld	h,-5 (ix)
   3790 DD 6E FD      [19]  531 	ld	l,-3 (ix)
   3793 E5            [11]  532 	push	hl
   3794 D5            [11]  533 	push	de
   3795 33            [ 6]  534 	inc	sp
   3796 CD 7D 2F      [17]  535 	call	_create_explosion
   3799 F1            [10]  536 	pop	af
   379A 33            [ 6]  537 	inc	sp
   379B C1            [10]  538 	pop	bc
   379C                     539 00120$:
                            540 ;src/entities/user.c:89: if (user.ax!=0){
   379C 21 F6 58      [10]  541 	ld	hl, #(_user + 0x000c) + 0
   379F 56            [ 7]  542 	ld	d,(hl)
                            543 ;src/entities/user.c:90: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
                            544 ;src/entities/user.c:89: if (user.ax!=0){
   37A0 7A            [ 4]  545 	ld	a,d
   37A1 B7            [ 4]  546 	or	a, a
   37A2 28 4C         [12]  547 	jr	Z,00127$
                            548 ;src/entities/user.c:90: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
   37A4 21 F2 58      [10]  549 	ld	hl, #(_user + 0x0008) + 0
   37A7 5E            [ 7]  550 	ld	e,(hl)
   37A8 CB 7B         [ 8]  551 	bit	7, e
   37AA 20 0E         [12]  552 	jr	NZ,00125$
   37AC 21 F4 58      [10]  553 	ld	hl, #(_user + 0x000a) + 0
   37AF 66            [ 7]  554 	ld	h,(hl)
   37B0 7B            [ 4]  555 	ld	a,e
   37B1 94            [ 4]  556 	sub	a, h
   37B2 E2 B7 37      [10]  557 	jp	PO, 00208$
   37B5 EE 80         [ 7]  558 	xor	a, #0x80
   37B7                     559 00208$:
   37B7 FA EB 37      [10]  560 	jp	M,00121$
   37BA                     561 00125$:
   37BA AF            [ 4]  562 	xor	a, a
   37BB 93            [ 4]  563 	sub	a, e
   37BC E2 C1 37      [10]  564 	jp	PO, 00209$
   37BF EE 80         [ 7]  565 	xor	a, #0x80
   37C1                     566 00209$:
   37C1 FA F0 37      [10]  567 	jp	M,00127$
   37C4 3A F4 58      [13]  568 	ld	a, (#(_user + 0x000a) + 0)
   37C7 6F            [ 4]  569 	ld	l,a
   37C8 17            [ 4]  570 	rla
   37C9 9F            [ 4]  571 	sbc	a, a
   37CA 67            [ 4]  572 	ld	h,a
   37CB AF            [ 4]  573 	xor	a, a
   37CC 95            [ 4]  574 	sub	a, l
   37CD DD 77 FB      [19]  575 	ld	-5 (ix),a
   37D0 3E 00         [ 7]  576 	ld	a, #0x00
   37D2 9C            [ 4]  577 	sbc	a, h
   37D3 DD 77 FC      [19]  578 	ld	-4 (ix),a
   37D6 7B            [ 4]  579 	ld	a,e
   37D7 67            [ 4]  580 	ld	h,a
   37D8 17            [ 4]  581 	rla
   37D9 9F            [ 4]  582 	sbc	a, a
   37DA 6F            [ 4]  583 	ld	l,a
   37DB DD 7E FB      [19]  584 	ld	a,-5 (ix)
   37DE 94            [ 4]  585 	sub	a, h
   37DF DD 7E FC      [19]  586 	ld	a,-4 (ix)
   37E2 9D            [ 4]  587 	sbc	a, l
   37E3 E2 E8 37      [10]  588 	jp	PO, 00210$
   37E6 EE 80         [ 7]  589 	xor	a, #0x80
   37E8                     590 00210$:
   37E8 F2 F0 37      [10]  591 	jp	P,00127$
   37EB                     592 00121$:
                            593 ;src/entities/user.c:91: user.vx+=user.ax;
   37EB 7B            [ 4]  594 	ld	a,e
   37EC 82            [ 4]  595 	add	a, d
   37ED 32 F2 58      [13]  596 	ld	(#(_user + 0x0008)),a
   37F0                     597 00127$:
                            598 ;src/entities/user.c:95: if (user.vx>0){
   37F0 21 F2 58      [10]  599 	ld	hl, #(_user + 0x0008) + 0
   37F3 56            [ 7]  600 	ld	d,(hl)
   37F4 AF            [ 4]  601 	xor	a, a
   37F5 92            [ 4]  602 	sub	a, d
   37F6 E2 FB 37      [10]  603 	jp	PO, 00211$
   37F9 EE 80         [ 7]  604 	xor	a, #0x80
   37FB                     605 00211$:
   37FB F2 05 38      [10]  606 	jp	P,00131$
                            607 ;src/entities/user.c:96: user.vx--;
   37FE 15            [ 4]  608 	dec	d
   37FF 21 F2 58      [10]  609 	ld	hl,#(_user + 0x0008)
   3802 72            [ 7]  610 	ld	(hl),d
   3803 18 09         [12]  611 	jr	00132$
   3805                     612 00131$:
                            613 ;src/entities/user.c:97: } else if (user.vx<0){
   3805 CB 7A         [ 8]  614 	bit	7, d
   3807 28 05         [12]  615 	jr	Z,00132$
                            616 ;src/entities/user.c:98: user.vx++;
   3809 14            [ 4]  617 	inc	d
   380A 21 F2 58      [10]  618 	ld	hl,#(_user + 0x0008)
   380D 72            [ 7]  619 	ld	(hl),d
   380E                     620 00132$:
                            621 ;src/entities/user.c:101: user.x+=user.vx;
   380E 21 F0 58      [10]  622 	ld	hl, #(_user + 0x0006) + 0
   3811 56            [ 7]  623 	ld	d,(hl)
   3812 21 F2 58      [10]  624 	ld	hl, #(_user + 0x0008) + 0
   3815 66            [ 7]  625 	ld	h,(hl)
   3816 7A            [ 4]  626 	ld	a,d
   3817 84            [ 4]  627 	add	a, h
   3818 57            [ 4]  628 	ld	d,a
   3819 21 F0 58      [10]  629 	ld	hl,#(_user + 0x0006)
   381C 72            [ 7]  630 	ld	(hl),d
                            631 ;src/entities/user.c:103: if (user.x<0)
   381D 21 F0 58      [10]  632 	ld	hl, #(_user + 0x0006) + 0
   3820 5E            [ 7]  633 	ld	e,(hl)
   3821 CB 7A         [ 8]  634 	bit	7, d
   3823 28 07         [12]  635 	jr	Z,00136$
                            636 ;src/entities/user.c:104: user.x=0;
   3825 21 F0 58      [10]  637 	ld	hl,#(_user + 0x0006)
   3828 36 00         [10]  638 	ld	(hl),#0x00
   382A 18 25         [12]  639 	jr	00138$
   382C                     640 00136$:
                            641 ;src/entities/user.c:105: else if (user.x> 79-user.w){
   382C 21 F8 58      [10]  642 	ld	hl, #_user + 14
   382F 66            [ 7]  643 	ld	h,(hl)
   3830 4C            [ 4]  644 	ld	c,h
   3831 06 00         [ 7]  645 	ld	b,#0x00
   3833 3E 4F         [ 7]  646 	ld	a,#0x4F
   3835 91            [ 4]  647 	sub	a, c
   3836 4F            [ 4]  648 	ld	c,a
   3837 3E 00         [ 7]  649 	ld	a,#0x00
   3839 98            [ 4]  650 	sbc	a, b
   383A 47            [ 4]  651 	ld	b,a
   383B 7B            [ 4]  652 	ld	a,e
   383C 17            [ 4]  653 	rla
   383D 9F            [ 4]  654 	sbc	a, a
   383E 57            [ 4]  655 	ld	d,a
   383F 79            [ 4]  656 	ld	a,c
   3840 93            [ 4]  657 	sub	a, e
   3841 78            [ 4]  658 	ld	a,b
   3842 9A            [ 4]  659 	sbc	a, d
   3843 E2 48 38      [10]  660 	jp	PO, 00212$
   3846 EE 80         [ 7]  661 	xor	a, #0x80
   3848                     662 00212$:
   3848 F2 51 38      [10]  663 	jp	P,00138$
                            664 ;src/entities/user.c:106: user.x = 79-user.w;
   384B 3E 4F         [ 7]  665 	ld	a,#0x4F
   384D 94            [ 4]  666 	sub	a, h
   384E 32 F0 58      [13]  667 	ld	(#(_user + 0x0006)),a
   3851                     668 00138$:
   3851 DD F9         [10]  669 	ld	sp, ix
   3853 DD E1         [14]  670 	pop	ix
   3855 C9            [10]  671 	ret
                            672 ;src/entities/user.c:110: void draw_user(u8* screen){
                            673 ;	---------------------------------
                            674 ; Function draw_user
                            675 ; ---------------------------------
   3856                     676 _draw_user::
   3856 DD E5         [15]  677 	push	ix
   3858 DD 21 00 00   [14]  678 	ld	ix,#0
   385C DD 39         [15]  679 	add	ix,sp
                            680 ;src/entities/user.c:112: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   385E 21 F1 58      [10]  681 	ld	hl, #_user + 7
   3861 4E            [ 7]  682 	ld	c,(hl)
   3862 21 F0 58      [10]  683 	ld	hl, #_user + 6
   3865 66            [ 7]  684 	ld	h,(hl)
   3866 DD 5E 04      [19]  685 	ld	e,4 (ix)
   3869 DD 56 05      [19]  686 	ld	d,5 (ix)
   386C 79            [ 4]  687 	ld	a,c
   386D F5            [11]  688 	push	af
   386E 33            [ 6]  689 	inc	sp
   386F E5            [11]  690 	push	hl
   3870 33            [ 6]  691 	inc	sp
   3871 D5            [11]  692 	push	de
   3872 CD 5C 50      [17]  693 	call	_cpct_getScreenPtr
   3875 F1            [10]  694 	pop	af
   3876 F1            [10]  695 	pop	af
   3877 EB            [ 4]  696 	ex	de,hl
                            697 ;src/entities/user.c:113: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   3878 21 F9 58      [10]  698 	ld	hl, #_user + 15
   387B 4E            [ 7]  699 	ld	c,(hl)
   387C 21 F8 58      [10]  700 	ld	hl, #_user + 14
   387F 46            [ 7]  701 	ld	b,(hl)
   3880 2A EE 58      [16]  702 	ld	hl, (#_user + 4)
   3883 E5            [11]  703 	push	hl
   3884 FD E1         [14]  704 	pop	iy
   3886 79            [ 4]  705 	ld	a,c
   3887 F5            [11]  706 	push	af
   3888 33            [ 6]  707 	inc	sp
   3889 C5            [11]  708 	push	bc
   388A 33            [ 6]  709 	inc	sp
   388B D5            [11]  710 	push	de
   388C FD E5         [15]  711 	push	iy
   388E CD 46 4E      [17]  712 	call	_cpct_drawSprite
   3891 DD E1         [14]  713 	pop	ix
   3893 C9            [10]  714 	ret
                            715 	.area _CODE
                            716 	.area _INITIALIZER
                            717 	.area _CABS (ABS)
