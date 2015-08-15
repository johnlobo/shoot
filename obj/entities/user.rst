                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 01:29:59 2015
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
                             21 	.globl _engine_anim
                             22 	.globl _shoot_type
                             23 	.globl _user
                             24 	.globl _init_user
                             25 	.globl _user_init_level
                             26 	.globl _get_last_moved_user
                             27 	.globl _get_user_max_shoots
                             28 	.globl _get_user_speed
                             29 	.globl _user_engine
                             30 	.globl _update_user
                             31 	.globl _draw_user
                             32 	.globl _set_score
                             33 	.globl _add_score
                             34 	.globl _get_score
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   6B13                      42 _user::
   6B13                      43 	.ds 25
   6B2C                      44 _shoot_type::
   6B2C                      45 	.ds 1
   6B2D                      46 _engine_anim::
   6B2D                      47 	.ds 4
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/entities/user.c:10: void init_user(){
                             73 ;	---------------------------------
                             74 ; Function init_user
                             75 ; ---------------------------------
   391F                      76 _init_user::
                             77 ;src/entities/user.c:12: user.w = 4;
   391F 21 1D 6B      [10]   78 	ld	hl,#_user + 10
   3922 36 04         [10]   79 	ld	(hl),#0x04
                             80 ;src/entities/user.c:13: user.h = 8;
   3924 FD 21 1E 6B   [14]   81 	ld	iy,#_user + 11
   3928 FD 36 00 08   [19]   82 	ld	0 (iy), #0x08
                             83 ;src/entities/user.c:14: user.x = 39-(user.w/2);
   392C 6E            [ 7]   84 	ld	l,(hl)
   392D CB 3D         [ 8]   85 	srl	l
   392F 3E 27         [ 7]   86 	ld	a,#0x27
   3931 95            [ 4]   87 	sub	a, l
   3932 32 15 6B      [13]   88 	ld	(#(_user + 0x0002)),a
                             89 ;src/entities/user.c:15: user.y = 199-(user.h);
   3935 FD 66 00      [19]   90 	ld	h, 0 (iy)
   3938 3E C7         [ 7]   91 	ld	a,#0xC7
   393A 94            [ 4]   92 	sub	a, h
   393B 32 16 6B      [13]   93 	ld	(#(_user + 0x0003)),a
                             94 ;src/entities/user.c:16: user.vx = 0;
   393E 21 17 6B      [10]   95 	ld	hl,#_user + 4
   3941 36 00         [10]   96 	ld	(hl),#0x00
                             97 ;src/entities/user.c:17: user.vy = 0;
   3943 21 18 6B      [10]   98 	ld	hl,#_user + 5
   3946 36 00         [10]   99 	ld	(hl),#0x00
                            100 ;src/entities/user.c:18: user.topvx = 4;
   3948 21 19 6B      [10]  101 	ld	hl,#_user + 6
   394B 36 04         [10]  102 	ld	(hl),#0x04
                            103 ;src/entities/user.c:19: user.topvy = 5;
   394D 21 1A 6B      [10]  104 	ld	hl,#_user + 7
   3950 36 05         [10]  105 	ld	(hl),#0x05
                            106 ;src/entities/user.c:20: user.ax=0;
   3952 21 1B 6B      [10]  107 	ld	hl,#_user + 8
   3955 36 00         [10]  108 	ld	(hl),#0x00
                            109 ;src/entities/user.c:21: user.ay=0;
   3957 21 1C 6B      [10]  110 	ld	hl,#_user + 9
   395A 36 00         [10]  111 	ld	(hl),#0x00
                            112 ;src/entities/user.c:22: user.sprite = (u8*) G_ship_00;
   395C 21 79 44      [10]  113 	ld	hl,#_G_ship_00
   395F 22 13 6B      [16]  114 	ld	(_user), hl
                            115 ;src/entities/user.c:23: user.score = 0;
   3962 21 00 00      [10]  116 	ld	hl,#0x0000
   3965 22 22 6B      [16]  117 	ld	((_user + 0x000f)),hl
   3968 22 24 6B      [16]  118 	ld	((_user + 0x000f)+2), hl
                            119 ;src/entities/user.c:24: user.shield = 0;
   396B 21 20 6B      [10]  120 	ld	hl,#_user + 13
   396E 36 00         [10]  121 	ld	(hl),#0x00
                            122 ;src/entities/user.c:25: user.lives = 0;
   3970 21 21 6B      [10]  123 	ld	hl,#_user + 14
   3973 36 00         [10]  124 	ld	(hl),#0x00
                            125 ;src/entities/user.c:27: user.max_shoots = 3;
   3975 21 1F 6B      [10]  126 	ld	hl,#_user + 12
   3978 36 03         [10]  127 	ld	(hl),#0x03
                            128 ;src/entities/user.c:28: shoot_type = 1;
   397A 21 2C 6B      [10]  129 	ld	hl,#_shoot_type + 0
   397D 36 01         [10]  130 	ld	(hl), #0x01
                            131 ;src/entities/user.c:29: user.last_moved = 0;
   397F 21 00 00      [10]  132 	ld	hl,#0x0000
   3982 22 28 6B      [16]  133 	ld	((_user + 0x0015)),hl
   3985 22 2A 6B      [16]  134 	ld	((_user + 0x0015)+2), hl
                            135 ;src/entities/user.c:30: user.engine_state = 0;
   3988 21 27 6B      [10]  136 	ld	hl,#_user + 20
   398B 36 00         [10]  137 	ld	(hl),#0x00
                            138 ;src/entities/user.c:32: engine_anim[0] = (u8*) G_engine_00;
   398D 21 64 4A      [10]  139 	ld	hl,#_G_engine_00
   3990 22 2D 6B      [16]  140 	ld	(_engine_anim), hl
                            141 ;src/entities/user.c:33: engine_anim[1] = (u8*) G_engine_01;
   3993 21 66 4A      [10]  142 	ld	hl,#_G_engine_01
   3996 22 2F 6B      [16]  143 	ld	((_engine_anim + 0x0002)), hl
   3999 C9            [10]  144 	ret
                            145 ;src/entities/user.c:36: void user_init_level(){
                            146 ;	---------------------------------
                            147 ; Function user_init_level
                            148 ; ---------------------------------
   399A                     149 _user_init_level::
                            150 ;src/entities/user.c:37: user.lives=3;
   399A 21 21 6B      [10]  151 	ld	hl,#_user + 14
   399D 36 03         [10]  152 	ld	(hl),#0x03
                            153 ;src/entities/user.c:38: user.shield=0;
   399F 21 20 6B      [10]  154 	ld	hl,#_user + 13
   39A2 36 00         [10]  155 	ld	(hl),#0x00
                            156 ;src/entities/user.c:39: user.max_shoots=3;
   39A4 21 1F 6B      [10]  157 	ld	hl,#_user + 12
   39A7 36 03         [10]  158 	ld	(hl),#0x03
   39A9 C9            [10]  159 	ret
                            160 ;src/entities/user.c:46: long get_last_moved_user(){
                            161 ;	---------------------------------
                            162 ; Function get_last_moved_user
                            163 ; ---------------------------------
   39AA                     164 _get_last_moved_user::
                            165 ;src/entities/user.c:47: return user.last_moved;
   39AA 2A 28 6B      [16]  166 	ld	hl, (#(_user + 0x0015) + 0)
   39AD ED 5B 2A 6B   [20]  167 	ld	de, (#(_user + 0x0015) + 2)
   39B1 C9            [10]  168 	ret
                            169 ;src/entities/user.c:50: u8 get_user_max_shoots(){
                            170 ;	---------------------------------
                            171 ; Function get_user_max_shoots
                            172 ; ---------------------------------
   39B2                     173 _get_user_max_shoots::
                            174 ;src/entities/user.c:51: return user.max_shoots;
   39B2 21 1F 6B      [10]  175 	ld	hl,#_user+12
   39B5 6E            [ 7]  176 	ld	l,(hl)
   39B6 C9            [10]  177 	ret
                            178 ;src/entities/user.c:53: u8 get_user_speed(){
                            179 ;	---------------------------------
                            180 ; Function get_user_speed
                            181 ; ---------------------------------
   39B7                     182 _get_user_speed::
                            183 ;src/entities/user.c:54: return user.speed;
   39B7 21 26 6B      [10]  184 	ld	hl,#_user+19
   39BA 6E            [ 7]  185 	ld	l,(hl)
   39BB C9            [10]  186 	ret
                            187 ;src/entities/user.c:60: void user_engine(u8* screen){
                            188 ;	---------------------------------
                            189 ; Function user_engine
                            190 ; ---------------------------------
   39BC                     191 _user_engine::
   39BC DD E5         [15]  192 	push	ix
   39BE DD 21 00 00   [14]  193 	ld	ix,#0
   39C2 DD 39         [15]  194 	add	ix,sp
                            195 ;src/entities/user.c:63: user.engine_state++;
   39C4 11 27 6B      [10]  196 	ld	de,#_user + 20
   39C7 1A            [ 7]  197 	ld	a,(de)
   39C8 3C            [ 4]  198 	inc	a
   39C9 12            [ 7]  199 	ld	(de),a
                            200 ;src/entities/user.c:64: if (user.engine_state==2) user.engine_state=0;
   39CA D6 02         [ 7]  201 	sub	a, #0x02
   39CC 20 02         [12]  202 	jr	NZ,00102$
   39CE AF            [ 4]  203 	xor	a, a
   39CF 12            [ 7]  204 	ld	(de),a
   39D0                     205 00102$:
                            206 ;src/entities/user.c:66: pscreen = cpct_getScreenPtr(screen, user.x+1, user.y+7);
   39D0 3A 16 6B      [13]  207 	ld	a, (#_user + 3)
   39D3 C6 07         [ 7]  208 	add	a, #0x07
   39D5 4F            [ 4]  209 	ld	c,a
   39D6 3A 15 6B      [13]  210 	ld	a, (#_user + 2)
   39D9 67            [ 4]  211 	ld	h,a
   39DA 24            [ 4]  212 	inc	h
   39DB DD 6E 04      [19]  213 	ld	l,4 (ix)
   39DE DD 46 05      [19]  214 	ld	b,5 (ix)
   39E1 D5            [11]  215 	push	de
   39E2 79            [ 4]  216 	ld	a,c
   39E3 F5            [11]  217 	push	af
   39E4 33            [ 6]  218 	inc	sp
   39E5 E5            [11]  219 	push	hl
   39E6 33            [ 6]  220 	inc	sp
   39E7 60            [ 4]  221 	ld	h, b
   39E8 E5            [11]  222 	push	hl
   39E9 CD 25 56      [17]  223 	call	_cpct_getScreenPtr
   39EC D1            [10]  224 	pop	de
                            225 ;src/entities/user.c:67: cpct_drawSprite( (u8*) engine_anim[user.engine_state],pscreen,2,1);
   39ED 4D            [ 4]  226 	ld	c, l
   39EE 44            [ 4]  227 	ld	b, h
   39EF 1A            [ 7]  228 	ld	a,(de)
   39F0 6F            [ 4]  229 	ld	l,a
   39F1 26 00         [ 7]  230 	ld	h,#0x00
   39F3 29            [11]  231 	add	hl, hl
   39F4 11 2D 6B      [10]  232 	ld	de,#_engine_anim
   39F7 19            [11]  233 	add	hl,de
   39F8 5E            [ 7]  234 	ld	e,(hl)
   39F9 23            [ 6]  235 	inc	hl
   39FA 56            [ 7]  236 	ld	d,(hl)
   39FB 21 02 01      [10]  237 	ld	hl,#0x0102
   39FE E5            [11]  238 	push	hl
   39FF C5            [11]  239 	push	bc
   3A00 D5            [11]  240 	push	de
   3A01 CD E0 52      [17]  241 	call	_cpct_drawSprite
   3A04 DD E1         [14]  242 	pop	ix
   3A06 C9            [10]  243 	ret
                            244 ;src/entities/user.c:70: void update_user() {
                            245 ;	---------------------------------
                            246 ; Function update_user
                            247 ; ---------------------------------
   3A07                     248 _update_user::
   3A07 DD E5         [15]  249 	push	ix
   3A09 DD 21 00 00   [14]  250 	ld	ix,#0
   3A0D DD 39         [15]  251 	add	ix,sp
   3A0F F5            [11]  252 	push	af
   3A10 F5            [11]  253 	push	af
                            254 ;src/entities/user.c:73: user.ax=0;
   3A11 21 1B 6B      [10]  255 	ld	hl,#(_user + 0x0008)
   3A14 36 00         [10]  256 	ld	(hl),#0x00
                            257 ;src/entities/user.c:76: cpct_scanKeyboard_f();
   3A16 CD EF 51      [17]  258 	call	_cpct_scanKeyboard_f
                            259 ;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
   3A19 21 08 08      [10]  260 	ld	hl,#0x0808
   3A1C E5            [11]  261 	push	hl
   3A1D CD DE 51      [17]  262 	call	_cpct_isKeyPressed
   3A20 F1            [10]  263 	pop	af
                            264 ;src/entities/user.c:84: user.ay = -2;
                            265 ;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
   3A21 7D            [ 4]  266 	ld	a,l
   3A22 B7            [ 4]  267 	or	a, a
   3A23 28 07         [12]  268 	jr	Z,00104$
                            269 ;src/entities/user.c:84: user.ay = -2;
   3A25 21 1C 6B      [10]  270 	ld	hl,#(_user + 0x0009)
   3A28 36 FE         [10]  271 	ld	(hl),#0xFE
   3A2A 18 11         [12]  272 	jr	00105$
   3A2C                     273 00104$:
                            274 ;src/entities/user.c:85: } else if (cpct_isKeyPressed(Key_A)){
   3A2C 21 08 20      [10]  275 	ld	hl,#0x2008
   3A2F E5            [11]  276 	push	hl
   3A30 CD DE 51      [17]  277 	call	_cpct_isKeyPressed
   3A33 F1            [10]  278 	pop	af
   3A34 7D            [ 4]  279 	ld	a,l
   3A35 B7            [ 4]  280 	or	a, a
   3A36 28 05         [12]  281 	jr	Z,00105$
                            282 ;src/entities/user.c:86: user.ay=2;    
   3A38 21 1C 6B      [10]  283 	ld	hl,#(_user + 0x0009)
   3A3B 36 02         [10]  284 	ld	(hl),#0x02
   3A3D                     285 00105$:
                            286 ;src/entities/user.c:89: if ((cpct_isKeyPressed(Key_P))){ 
   3A3D 21 03 08      [10]  287 	ld	hl,#0x0803
   3A40 E5            [11]  288 	push	hl
   3A41 CD DE 51      [17]  289 	call	_cpct_isKeyPressed
   3A44 F1            [10]  290 	pop	af
   3A45 7D            [ 4]  291 	ld	a,l
   3A46 B7            [ 4]  292 	or	a, a
   3A47 28 07         [12]  293 	jr	Z,00109$
                            294 ;src/entities/user.c:90: user.ax = 2;
   3A49 21 1B 6B      [10]  295 	ld	hl,#(_user + 0x0008)
   3A4C 36 02         [10]  296 	ld	(hl),#0x02
   3A4E 18 11         [12]  297 	jr	00110$
   3A50                     298 00109$:
                            299 ;src/entities/user.c:91: } else if (cpct_isKeyPressed(Key_O)){
   3A50 21 04 04      [10]  300 	ld	hl,#0x0404
   3A53 E5            [11]  301 	push	hl
   3A54 CD DE 51      [17]  302 	call	_cpct_isKeyPressed
   3A57 F1            [10]  303 	pop	af
   3A58 7D            [ 4]  304 	ld	a,l
   3A59 B7            [ 4]  305 	or	a, a
   3A5A 28 05         [12]  306 	jr	Z,00110$
                            307 ;src/entities/user.c:92: user.ax=-2;    
   3A5C 21 1B 6B      [10]  308 	ld	hl,#(_user + 0x0008)
   3A5F 36 FE         [10]  309 	ld	(hl),#0xFE
   3A61                     310 00110$:
                            311 ;src/entities/user.c:96: if (cpct_isKeyPressed(Key_D)){
   3A61 21 07 20      [10]  312 	ld	hl,#0x2007
   3A64 E5            [11]  313 	push	hl
   3A65 CD DE 51      [17]  314 	call	_cpct_isKeyPressed
   3A68 F1            [10]  315 	pop	af
   3A69 7D            [ 4]  316 	ld	a,l
   3A6A B7            [ 4]  317 	or	a, a
   3A6B 28 1B         [12]  318 	jr	Z,00112$
                            319 ;src/entities/user.c:97: shoot_type=(shoot_type+1)%2;
   3A6D FD 21 2C 6B   [14]  320 	ld	iy,#_shoot_type
   3A71 FD 6E 00      [19]  321 	ld	l,0 (iy)
   3A74 26 00         [ 7]  322 	ld	h,#0x00
   3A76 23            [ 6]  323 	inc	hl
   3A77 01 02 00      [10]  324 	ld	bc,#0x0002
   3A7A C5            [11]  325 	push	bc
   3A7B E5            [11]  326 	push	hl
   3A7C CD 19 56      [17]  327 	call	__modsint
   3A7F F1            [10]  328 	pop	af
   3A80 F1            [10]  329 	pop	af
   3A81 FD 21 2C 6B   [14]  330 	ld	iy,#_shoot_type
   3A85 FD 75 00      [19]  331 	ld	0 (iy),l
   3A88                     332 00112$:
                            333 ;src/entities/user.c:100: if (cpct_isKeyPressed(Key_H)){
   3A88 21 05 10      [10]  334 	ld	hl,#0x1005
   3A8B E5            [11]  335 	push	hl
   3A8C CD DE 51      [17]  336 	call	_cpct_isKeyPressed
   3A8F F1            [10]  337 	pop	af
   3A90 7D            [ 4]  338 	ld	a,l
   3A91 B7            [ 4]  339 	or	a, a
   3A92 28 39         [12]  340 	jr	Z,00114$
                            341 ;src/entities/user.c:101: create_enemy((rand()%80),(rand()%199),(rand()%3));
   3A94 CD 59 52      [17]  342 	call	_rand
   3A97 01 03 00      [10]  343 	ld	bc,#0x0003
   3A9A C5            [11]  344 	push	bc
   3A9B E5            [11]  345 	push	hl
   3A9C CD 19 56      [17]  346 	call	__modsint
   3A9F F1            [10]  347 	pop	af
   3AA0 F1            [10]  348 	pop	af
   3AA1 DD 75 FF      [19]  349 	ld	-1 (ix),l
   3AA4 CD 59 52      [17]  350 	call	_rand
   3AA7 01 C7 00      [10]  351 	ld	bc,#0x00C7
   3AAA C5            [11]  352 	push	bc
   3AAB E5            [11]  353 	push	hl
   3AAC CD 19 56      [17]  354 	call	__modsint
   3AAF F1            [10]  355 	pop	af
   3AB0 E3            [19]  356 	ex	(sp),hl
   3AB1 CD 59 52      [17]  357 	call	_rand
   3AB4 11 50 00      [10]  358 	ld	de,#0x0050
   3AB7 D5            [11]  359 	push	de
   3AB8 E5            [11]  360 	push	hl
   3AB9 CD 19 56      [17]  361 	call	__modsint
   3ABC F1            [10]  362 	pop	af
   3ABD F1            [10]  363 	pop	af
   3ABE EB            [ 4]  364 	ex	de,hl
   3ABF C1            [10]  365 	pop	bc
   3AC0 DD 7E FF      [19]  366 	ld	a,-1 (ix)
   3AC3 F5            [11]  367 	push	af
   3AC4 33            [ 6]  368 	inc	sp
   3AC5 C5            [11]  369 	push	bc
   3AC6 D5            [11]  370 	push	de
   3AC7 CD 0D 26      [17]  371 	call	_create_enemy
   3ACA F1            [10]  372 	pop	af
   3ACB F1            [10]  373 	pop	af
   3ACC 33            [ 6]  374 	inc	sp
   3ACD                     375 00114$:
                            376 ;src/entities/user.c:104: if (cpct_isKeyPressed(Key_J)){
   3ACD 21 05 20      [10]  377 	ld	hl,#0x2005
   3AD0 E5            [11]  378 	push	hl
   3AD1 CD DE 51      [17]  379 	call	_cpct_isKeyPressed
   3AD4 F1            [10]  380 	pop	af
   3AD5 7D            [ 4]  381 	ld	a,l
   3AD6 B7            [ 4]  382 	or	a, a
   3AD7 CA 6D 3B      [10]  383 	jp	Z,00116$
                            384 ;src/entities/user.c:105: x=rand()%80;
   3ADA CD 59 52      [17]  385 	call	_rand
   3ADD 01 50 00      [10]  386 	ld	bc,#0x0050
   3AE0 C5            [11]  387 	push	bc
   3AE1 E5            [11]  388 	push	hl
   3AE2 CD 19 56      [17]  389 	call	__modsint
   3AE5 F1            [10]  390 	pop	af
   3AE6 F1            [10]  391 	pop	af
   3AE7 DD 75 FC      [19]  392 	ld	-4 (ix),l
                            393 ;src/entities/user.c:106: y=rand()%199;
   3AEA CD 59 52      [17]  394 	call	_rand
   3AED 01 C7 00      [10]  395 	ld	bc,#0x00C7
   3AF0 C5            [11]  396 	push	bc
   3AF1 E5            [11]  397 	push	hl
   3AF2 CD 19 56      [17]  398 	call	__modsint
   3AF5 F1            [10]  399 	pop	af
   3AF6 F1            [10]  400 	pop	af
   3AF7 4D            [ 4]  401 	ld	c,l
                            402 ;src/entities/user.c:107: create_enemy(x,y,(rand()%3));
   3AF8 C5            [11]  403 	push	bc
   3AF9 CD 59 52      [17]  404 	call	_rand
   3AFC 11 03 00      [10]  405 	ld	de,#0x0003
   3AFF D5            [11]  406 	push	de
   3B00 E5            [11]  407 	push	hl
   3B01 CD 19 56      [17]  408 	call	__modsint
   3B04 F1            [10]  409 	pop	af
   3B05 F1            [10]  410 	pop	af
   3B06 C1            [10]  411 	pop	bc
   3B07 5D            [ 4]  412 	ld	e,l
   3B08 DD 71 FD      [19]  413 	ld	-3 (ix),c
   3B0B DD 36 FE 00   [19]  414 	ld	-2 (ix),#0x00
   3B0F DD 4E FC      [19]  415 	ld	c,-4 (ix)
   3B12 06 00         [ 7]  416 	ld	b,#0x00
   3B14 C5            [11]  417 	push	bc
   3B15 7B            [ 4]  418 	ld	a,e
   3B16 F5            [11]  419 	push	af
   3B17 33            [ 6]  420 	inc	sp
   3B18 DD 6E FD      [19]  421 	ld	l,-3 (ix)
   3B1B DD 66 FE      [19]  422 	ld	h,-2 (ix)
   3B1E E5            [11]  423 	push	hl
   3B1F C5            [11]  424 	push	bc
   3B20 CD 0D 26      [17]  425 	call	_create_enemy
   3B23 F1            [10]  426 	pop	af
   3B24 F1            [10]  427 	pop	af
   3B25 33            [ 6]  428 	inc	sp
   3B26 CD 59 52      [17]  429 	call	_rand
   3B29 11 03 00      [10]  430 	ld	de,#0x0003
   3B2C D5            [11]  431 	push	de
   3B2D E5            [11]  432 	push	hl
   3B2E CD 19 56      [17]  433 	call	__modsint
   3B31 F1            [10]  434 	pop	af
   3B32 F1            [10]  435 	pop	af
   3B33 C1            [10]  436 	pop	bc
   3B34 5D            [ 4]  437 	ld	e,l
   3B35 21 08 00      [10]  438 	ld	hl,#0x0008
   3B38 09            [11]  439 	add	hl,bc
   3B39 C5            [11]  440 	push	bc
   3B3A 7B            [ 4]  441 	ld	a,e
   3B3B F5            [11]  442 	push	af
   3B3C 33            [ 6]  443 	inc	sp
   3B3D DD 5E FD      [19]  444 	ld	e,-3 (ix)
   3B40 DD 56 FE      [19]  445 	ld	d,-2 (ix)
   3B43 D5            [11]  446 	push	de
   3B44 E5            [11]  447 	push	hl
   3B45 CD 0D 26      [17]  448 	call	_create_enemy
   3B48 F1            [10]  449 	pop	af
   3B49 F1            [10]  450 	pop	af
   3B4A 33            [ 6]  451 	inc	sp
   3B4B CD 59 52      [17]  452 	call	_rand
   3B4E 11 03 00      [10]  453 	ld	de,#0x0003
   3B51 D5            [11]  454 	push	de
   3B52 E5            [11]  455 	push	hl
   3B53 CD 19 56      [17]  456 	call	__modsint
   3B56 F1            [10]  457 	pop	af
   3B57 F1            [10]  458 	pop	af
   3B58 C1            [10]  459 	pop	bc
   3B59 5D            [ 4]  460 	ld	e,l
   3B5A 21 10 00      [10]  461 	ld	hl,#0x0010
   3B5D 09            [11]  462 	add	hl,bc
   3B5E 7B            [ 4]  463 	ld	a,e
   3B5F F5            [11]  464 	push	af
   3B60 33            [ 6]  465 	inc	sp
   3B61 D1            [10]  466 	pop	de
   3B62 C1            [10]  467 	pop	bc
   3B63 C5            [11]  468 	push	bc
   3B64 D5            [11]  469 	push	de
   3B65 C5            [11]  470 	push	bc
   3B66 E5            [11]  471 	push	hl
   3B67 CD 0D 26      [17]  472 	call	_create_enemy
   3B6A F1            [10]  473 	pop	af
   3B6B F1            [10]  474 	pop	af
   3B6C 33            [ 6]  475 	inc	sp
   3B6D                     476 00116$:
                            477 ;src/entities/user.c:112: if (cpct_isKeyPressed(Key_K)){
   3B6D 21 04 20      [10]  478 	ld	hl,#0x2004
   3B70 E5            [11]  479 	push	hl
   3B71 CD DE 51      [17]  480 	call	_cpct_isKeyPressed
   3B74 F1            [10]  481 	pop	af
   3B75 7D            [ 4]  482 	ld	a,l
   3B76 B7            [ 4]  483 	or	a, a
   3B77 28 44         [12]  484 	jr	Z,00118$
                            485 ;src/entities/user.c:113: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
   3B79 CD 59 52      [17]  486 	call	_rand
   3B7C 01 03 00      [10]  487 	ld	bc,#0x0003
   3B7F C5            [11]  488 	push	bc
   3B80 E5            [11]  489 	push	hl
   3B81 CD 19 56      [17]  490 	call	__modsint
   3B84 F1            [10]  491 	pop	af
   3B85 F1            [10]  492 	pop	af
   3B86 DD 75 FD      [19]  493 	ld	-3 (ix),l
   3B89 CD 59 52      [17]  494 	call	_rand
   3B8C 01 28 00      [10]  495 	ld	bc,#0x0028
   3B8F C5            [11]  496 	push	bc
   3B90 E5            [11]  497 	push	hl
   3B91 CD 19 56      [17]  498 	call	__modsint
   3B94 F1            [10]  499 	pop	af
   3B95 E3            [19]  500 	ex	(sp),hl
   3B96 CD 59 52      [17]  501 	call	_rand
   3B99 11 0A 00      [10]  502 	ld	de,#0x000A
   3B9C D5            [11]  503 	push	de
   3B9D E5            [11]  504 	push	hl
   3B9E CD 19 56      [17]  505 	call	__modsint
   3BA1 F1            [10]  506 	pop	af
   3BA2 F1            [10]  507 	pop	af
   3BA3 EB            [ 4]  508 	ex	de,hl
   3BA4 C1            [10]  509 	pop	bc
   3BA5 13            [ 6]  510 	inc	de
   3BA6 13            [ 6]  511 	inc	de
   3BA7 13            [ 6]  512 	inc	de
   3BA8 13            [ 6]  513 	inc	de
   3BA9 13            [ 6]  514 	inc	de
   3BAA 3E 0C         [ 7]  515 	ld	a,#0x0C
   3BAC F5            [11]  516 	push	af
   3BAD 33            [ 6]  517 	inc	sp
   3BAE DD 7E FD      [19]  518 	ld	a,-3 (ix)
   3BB1 F5            [11]  519 	push	af
   3BB2 33            [ 6]  520 	inc	sp
   3BB3 C5            [11]  521 	push	bc
   3BB4 D5            [11]  522 	push	de
   3BB5 CD 4C 29      [17]  523 	call	_create_enemy_group
   3BB8 21 06 00      [10]  524 	ld	hl,#6
   3BBB 39            [11]  525 	add	hl,sp
   3BBC F9            [ 6]  526 	ld	sp,hl
   3BBD                     527 00118$:
                            528 ;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
   3BBD 21 05 80      [10]  529 	ld	hl,#0x8005
   3BC0 E5            [11]  530 	push	hl
   3BC1 CD DE 51      [17]  531 	call	_cpct_isKeyPressed
   3BC4 F1            [10]  532 	pop	af
                            533 ;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
                            534 ;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
   3BC5 7D            [ 4]  535 	ld	a,l
   3BC6 B7            [ 4]  536 	or	a, a
   3BC7 28 16         [12]  537 	jr	Z,00120$
                            538 ;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
   3BC9 21 16 6B      [10]  539 	ld	hl, #_user + 3
   3BCC 46            [ 7]  540 	ld	b,(hl)
   3BCD 3A 15 6B      [13]  541 	ld	a, (#(_user + 0x0002) + 0)
   3BD0 57            [ 4]  542 	ld	d,a
   3BD1 14            [ 4]  543 	inc	d
   3BD2 14            [ 4]  544 	inc	d
   3BD3 3A 2C 6B      [13]  545 	ld	a,(_shoot_type)
   3BD6 F5            [11]  546 	push	af
   3BD7 33            [ 6]  547 	inc	sp
   3BD8 4A            [ 4]  548 	ld	c, d
   3BD9 C5            [11]  549 	push	bc
   3BDA CD CC 35      [17]  550 	call	_create_shoot
   3BDD F1            [10]  551 	pop	af
   3BDE 33            [ 6]  552 	inc	sp
   3BDF                     553 00120$:
                            554 ;src/entities/user.c:121: if (cpct_isKeyPressed(Key_L)){
   3BDF 21 04 10      [10]  555 	ld	hl,#0x1004
   3BE2 E5            [11]  556 	push	hl
   3BE3 CD DE 51      [17]  557 	call	_cpct_isKeyPressed
   3BE6 F1            [10]  558 	pop	af
   3BE7 7D            [ 4]  559 	ld	a,l
   3BE8 B7            [ 4]  560 	or	a, a
   3BE9 28 43         [12]  561 	jr	Z,00122$
                            562 ;src/entities/user.c:122: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
   3BEB CD 59 52      [17]  563 	call	_rand
   3BEE 01 02 00      [10]  564 	ld	bc,#0x0002
   3BF1 C5            [11]  565 	push	bc
   3BF2 E5            [11]  566 	push	hl
   3BF3 CD 19 56      [17]  567 	call	__modsint
   3BF6 F1            [10]  568 	pop	af
   3BF7 F1            [10]  569 	pop	af
   3BF8 DD 75 FD      [19]  570 	ld	-3 (ix),l
   3BFB CD 59 52      [17]  571 	call	_rand
   3BFE 01 50 00      [10]  572 	ld	bc,#0x0050
   3C01 C5            [11]  573 	push	bc
   3C02 E5            [11]  574 	push	hl
   3C03 CD 19 56      [17]  575 	call	__modsint
   3C06 F1            [10]  576 	pop	af
   3C07 F1            [10]  577 	pop	af
   3C08 7D            [ 4]  578 	ld	a,l
   3C09 C6 14         [ 7]  579 	add	a, #0x14
   3C0B 5F            [ 4]  580 	ld	e,a
   3C0C D5            [11]  581 	push	de
   3C0D CD 59 52      [17]  582 	call	_rand
   3C10 01 14 00      [10]  583 	ld	bc,#0x0014
   3C13 C5            [11]  584 	push	bc
   3C14 E5            [11]  585 	push	hl
   3C15 CD 19 56      [17]  586 	call	__modsint
   3C18 F1            [10]  587 	pop	af
   3C19 F1            [10]  588 	pop	af
   3C1A D1            [10]  589 	pop	de
   3C1B 7D            [ 4]  590 	ld	a,l
   3C1C C6 05         [ 7]  591 	add	a, #0x05
   3C1E 57            [ 4]  592 	ld	d,a
   3C1F DD 7E FD      [19]  593 	ld	a,-3 (ix)
   3C22 F5            [11]  594 	push	af
   3C23 33            [ 6]  595 	inc	sp
   3C24 7B            [ 4]  596 	ld	a,e
   3C25 F5            [11]  597 	push	af
   3C26 33            [ 6]  598 	inc	sp
   3C27 D5            [11]  599 	push	de
   3C28 33            [ 6]  600 	inc	sp
   3C29 CD 0F 31      [17]  601 	call	_create_explosion
   3C2C F1            [10]  602 	pop	af
   3C2D 33            [ 6]  603 	inc	sp
   3C2E                     604 00122$:
                            605 ;src/entities/user.c:126: if (user.ax!=0){
   3C2E 21 1B 6B      [10]  606 	ld	hl, #(_user + 0x0008) + 0
   3C31 56            [ 7]  607 	ld	d,(hl)
                            608 ;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
                            609 ;src/entities/user.c:126: if (user.ax!=0){
   3C32 7A            [ 4]  610 	ld	a,d
   3C33 B7            [ 4]  611 	or	a, a
   3C34 28 42         [12]  612 	jr	Z,00129$
                            613 ;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
   3C36 21 17 6B      [10]  614 	ld	hl, #(_user + 0x0004) + 0
   3C39 5E            [ 7]  615 	ld	e,(hl)
   3C3A 21 19 6B      [10]  616 	ld	hl,#_user + 6
   3C3D CB 7B         [ 8]  617 	bit	7, e
   3C3F 20 0B         [12]  618 	jr	NZ,00127$
   3C41 46            [ 7]  619 	ld	b,(hl)
   3C42 7B            [ 4]  620 	ld	a,e
   3C43 90            [ 4]  621 	sub	a, b
   3C44 E2 49 3C      [10]  622 	jp	PO, 00210$
   3C47 EE 80         [ 7]  623 	xor	a, #0x80
   3C49                     624 00210$:
   3C49 FA 73 3C      [10]  625 	jp	M,00123$
   3C4C                     626 00127$:
   3C4C AF            [ 4]  627 	xor	a, a
   3C4D 93            [ 4]  628 	sub	a, e
   3C4E E2 53 3C      [10]  629 	jp	PO, 00211$
   3C51 EE 80         [ 7]  630 	xor	a, #0x80
   3C53                     631 00211$:
   3C53 FA 78 3C      [10]  632 	jp	M,00129$
   3C56 7E            [ 7]  633 	ld	a,(hl)
   3C57 6F            [ 4]  634 	ld	l,a
   3C58 17            [ 4]  635 	rla
   3C59 9F            [ 4]  636 	sbc	a, a
   3C5A 67            [ 4]  637 	ld	h,a
   3C5B AF            [ 4]  638 	xor	a, a
   3C5C 95            [ 4]  639 	sub	a, l
   3C5D 6F            [ 4]  640 	ld	l,a
   3C5E 3E 00         [ 7]  641 	ld	a, #0x00
   3C60 9C            [ 4]  642 	sbc	a, h
   3C61 67            [ 4]  643 	ld	h,a
   3C62 7B            [ 4]  644 	ld	a,e
   3C63 4F            [ 4]  645 	ld	c,a
   3C64 17            [ 4]  646 	rla
   3C65 9F            [ 4]  647 	sbc	a, a
   3C66 47            [ 4]  648 	ld	b,a
   3C67 7D            [ 4]  649 	ld	a,l
   3C68 91            [ 4]  650 	sub	a, c
   3C69 7C            [ 4]  651 	ld	a,h
   3C6A 98            [ 4]  652 	sbc	a, b
   3C6B E2 70 3C      [10]  653 	jp	PO, 00212$
   3C6E EE 80         [ 7]  654 	xor	a, #0x80
   3C70                     655 00212$:
   3C70 F2 78 3C      [10]  656 	jp	P,00129$
   3C73                     657 00123$:
                            658 ;src/entities/user.c:128: user.vx+=user.ax;
   3C73 7B            [ 4]  659 	ld	a,e
   3C74 82            [ 4]  660 	add	a, d
   3C75 32 17 6B      [13]  661 	ld	(#(_user + 0x0004)),a
   3C78                     662 00129$:
                            663 ;src/entities/user.c:132: if (user.vx>0){
   3C78 21 17 6B      [10]  664 	ld	hl, #(_user + 0x0004) + 0
   3C7B 56            [ 7]  665 	ld	d,(hl)
   3C7C AF            [ 4]  666 	xor	a, a
   3C7D 92            [ 4]  667 	sub	a, d
   3C7E E2 83 3C      [10]  668 	jp	PO, 00213$
   3C81 EE 80         [ 7]  669 	xor	a, #0x80
   3C83                     670 00213$:
   3C83 F2 8D 3C      [10]  671 	jp	P,00133$
                            672 ;src/entities/user.c:133: user.vx--;
   3C86 15            [ 4]  673 	dec	d
   3C87 21 17 6B      [10]  674 	ld	hl,#(_user + 0x0004)
   3C8A 72            [ 7]  675 	ld	(hl),d
   3C8B 18 09         [12]  676 	jr	00134$
   3C8D                     677 00133$:
                            678 ;src/entities/user.c:134: } else if (user.vx<0){
   3C8D CB 7A         [ 8]  679 	bit	7, d
   3C8F 28 05         [12]  680 	jr	Z,00134$
                            681 ;src/entities/user.c:135: user.vx++;
   3C91 14            [ 4]  682 	inc	d
   3C92 21 17 6B      [10]  683 	ld	hl,#(_user + 0x0004)
   3C95 72            [ 7]  684 	ld	(hl),d
   3C96                     685 00134$:
                            686 ;src/entities/user.c:138: user.x+=user.vx;
   3C96 21 15 6B      [10]  687 	ld	hl, #(_user + 0x0002) + 0
   3C99 56            [ 7]  688 	ld	d,(hl)
   3C9A 21 17 6B      [10]  689 	ld	hl, #(_user + 0x0004) + 0
   3C9D 66            [ 7]  690 	ld	h,(hl)
   3C9E 7A            [ 4]  691 	ld	a,d
   3C9F 84            [ 4]  692 	add	a, h
   3CA0 57            [ 4]  693 	ld	d,a
   3CA1 21 15 6B      [10]  694 	ld	hl,#(_user + 0x0002)
   3CA4 72            [ 7]  695 	ld	(hl),d
                            696 ;src/entities/user.c:140: if (user.x<0)
   3CA5 21 15 6B      [10]  697 	ld	hl, #(_user + 0x0002) + 0
   3CA8 5E            [ 7]  698 	ld	e,(hl)
   3CA9 CB 7A         [ 8]  699 	bit	7, d
   3CAB 28 07         [12]  700 	jr	Z,00138$
                            701 ;src/entities/user.c:141: user.x=0;
   3CAD 21 15 6B      [10]  702 	ld	hl,#(_user + 0x0002)
   3CB0 36 00         [10]  703 	ld	(hl),#0x00
   3CB2 18 25         [12]  704 	jr	00140$
   3CB4                     705 00138$:
                            706 ;src/entities/user.c:142: else if (user.x> 79-user.w){
   3CB4 21 1D 6B      [10]  707 	ld	hl, #_user + 10
   3CB7 66            [ 7]  708 	ld	h,(hl)
   3CB8 4C            [ 4]  709 	ld	c,h
   3CB9 06 00         [ 7]  710 	ld	b,#0x00
   3CBB 3E 4F         [ 7]  711 	ld	a,#0x4F
   3CBD 91            [ 4]  712 	sub	a, c
   3CBE 4F            [ 4]  713 	ld	c,a
   3CBF 3E 00         [ 7]  714 	ld	a,#0x00
   3CC1 98            [ 4]  715 	sbc	a, b
   3CC2 47            [ 4]  716 	ld	b,a
   3CC3 7B            [ 4]  717 	ld	a,e
   3CC4 17            [ 4]  718 	rla
   3CC5 9F            [ 4]  719 	sbc	a, a
   3CC6 57            [ 4]  720 	ld	d,a
   3CC7 79            [ 4]  721 	ld	a,c
   3CC8 93            [ 4]  722 	sub	a, e
   3CC9 78            [ 4]  723 	ld	a,b
   3CCA 9A            [ 4]  724 	sbc	a, d
   3CCB E2 D0 3C      [10]  725 	jp	PO, 00214$
   3CCE EE 80         [ 7]  726 	xor	a, #0x80
   3CD0                     727 00214$:
   3CD0 F2 D9 3C      [10]  728 	jp	P,00140$
                            729 ;src/entities/user.c:143: user.x = 79-user.w;
   3CD3 3E 4F         [ 7]  730 	ld	a,#0x4F
   3CD5 94            [ 4]  731 	sub	a, h
   3CD6 32 15 6B      [13]  732 	ld	(#(_user + 0x0002)),a
   3CD9                     733 00140$:
   3CD9 DD F9         [10]  734 	ld	sp, ix
   3CDB DD E1         [14]  735 	pop	ix
   3CDD C9            [10]  736 	ret
                            737 ;src/entities/user.c:147: void draw_user(u8* screen){
                            738 ;	---------------------------------
                            739 ; Function draw_user
                            740 ; ---------------------------------
   3CDE                     741 _draw_user::
   3CDE DD E5         [15]  742 	push	ix
   3CE0 DD 21 00 00   [14]  743 	ld	ix,#0
   3CE4 DD 39         [15]  744 	add	ix,sp
                            745 ;src/entities/user.c:149: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   3CE6 21 16 6B      [10]  746 	ld	hl, #_user + 3
   3CE9 4E            [ 7]  747 	ld	c,(hl)
   3CEA 21 15 6B      [10]  748 	ld	hl, #_user + 2
   3CED 66            [ 7]  749 	ld	h,(hl)
   3CEE DD 5E 04      [19]  750 	ld	e,4 (ix)
   3CF1 DD 56 05      [19]  751 	ld	d,5 (ix)
   3CF4 79            [ 4]  752 	ld	a,c
   3CF5 F5            [11]  753 	push	af
   3CF6 33            [ 6]  754 	inc	sp
   3CF7 E5            [11]  755 	push	hl
   3CF8 33            [ 6]  756 	inc	sp
   3CF9 D5            [11]  757 	push	de
   3CFA CD 25 56      [17]  758 	call	_cpct_getScreenPtr
   3CFD EB            [ 4]  759 	ex	de,hl
                            760 ;src/entities/user.c:150: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   3CFE 21 1E 6B      [10]  761 	ld	hl, #_user + 11
   3D01 46            [ 7]  762 	ld	b,(hl)
   3D02 3A 1D 6B      [13]  763 	ld	a, (#_user + 10)
   3D05 2A 13 6B      [16]  764 	ld	hl, (#_user + 0)
   3D08 E5            [11]  765 	push	hl
   3D09 FD E1         [14]  766 	pop	iy
   3D0B C5            [11]  767 	push	bc
   3D0C 33            [ 6]  768 	inc	sp
   3D0D F5            [11]  769 	push	af
   3D0E 33            [ 6]  770 	inc	sp
   3D0F D5            [11]  771 	push	de
   3D10 FD E5         [15]  772 	push	iy
   3D12 CD E0 52      [17]  773 	call	_cpct_drawSprite
   3D15 DD E1         [14]  774 	pop	ix
   3D17 C9            [10]  775 	ret
                            776 ;src/entities/user.c:153: void set_score(u32 new_score){
                            777 ;	---------------------------------
                            778 ; Function set_score
                            779 ; ---------------------------------
   3D18                     780 _set_score::
                            781 ;src/entities/user.c:154: user.score = new_score;
   3D18 11 22 6B      [10]  782 	ld	de,#_user+15
   3D1B 21 02 00      [10]  783 	ld	hl, #0x0002
   3D1E 39            [11]  784 	add	hl, sp
   3D1F 01 04 00      [10]  785 	ld	bc, #0x0004
   3D22 ED B0         [21]  786 	ldir
   3D24 C9            [10]  787 	ret
                            788 ;src/entities/user.c:156: void add_score(u16 new_add_score){
                            789 ;	---------------------------------
                            790 ; Function add_score
                            791 ; ---------------------------------
   3D25                     792 _add_score::
   3D25 DD E5         [15]  793 	push	ix
   3D27 DD 21 00 00   [14]  794 	ld	ix,#0
   3D2B DD 39         [15]  795 	add	ix,sp
   3D2D F5            [11]  796 	push	af
   3D2E F5            [11]  797 	push	af
                            798 ;src/entities/user.c:157: user.score += new_add_score;
   3D2F 11 22 6B      [10]  799 	ld	de,#(_user + 0x000f)
   3D32 21 00 00      [10]  800 	ld	hl, #0x0000
   3D35 39            [11]  801 	add	hl, sp
   3D36 EB            [ 4]  802 	ex	de, hl
   3D37 01 04 00      [10]  803 	ld	bc, #0x0004
   3D3A ED B0         [21]  804 	ldir
   3D3C DD 6E 04      [19]  805 	ld	l,4 (ix)
   3D3F DD 66 05      [19]  806 	ld	h,5 (ix)
   3D42 01 00 00      [10]  807 	ld	bc,#0x0000
   3D45 DD 7E FC      [19]  808 	ld	a,-4 (ix)
   3D48 85            [ 4]  809 	add	a, l
   3D49 5F            [ 4]  810 	ld	e,a
   3D4A DD 7E FD      [19]  811 	ld	a,-3 (ix)
   3D4D 8C            [ 4]  812 	adc	a, h
   3D4E 57            [ 4]  813 	ld	d,a
   3D4F DD 7E FE      [19]  814 	ld	a,-2 (ix)
   3D52 89            [ 4]  815 	adc	a, c
   3D53 4F            [ 4]  816 	ld	c,a
   3D54 DD 7E FF      [19]  817 	ld	a,-1 (ix)
   3D57 88            [ 4]  818 	adc	a, b
   3D58 47            [ 4]  819 	ld	b,a
   3D59 ED 53 22 6B   [20]  820 	ld	((_user + 0x000f)), de
   3D5D ED 43 24 6B   [20]  821 	ld	((_user + 0x000f)+2), bc
   3D61 DD F9         [10]  822 	ld	sp, ix
   3D63 DD E1         [14]  823 	pop	ix
   3D65 C9            [10]  824 	ret
                            825 ;src/entities/user.c:159: u32 get_score(){
                            826 ;	---------------------------------
                            827 ; Function get_score
                            828 ; ---------------------------------
   3D66                     829 _get_score::
                            830 ;src/entities/user.c:160: return user.score;
   3D66 2A 22 6B      [16]  831 	ld	hl, (#(_user + 0x000f) + 0)
   3D69 ED 5B 24 6B   [20]  832 	ld	de, (#(_user + 0x000f) + 2)
   3D6D C9            [10]  833 	ret
                            834 	.area _CODE
                            835 	.area _INITIALIZER
                            836 	.area _CABS (ABS)
