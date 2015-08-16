                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:47:07 2015
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
   6B77                      42 _user::
   6B77                      43 	.ds 25
   6B90                      44 _shoot_type::
   6B90                      45 	.ds 1
   6B91                      46 _engine_anim::
   6B91                      47 	.ds 4
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
   39A1                      76 _init_user::
                             77 ;src/entities/user.c:12: user.w = 4;
   39A1 21 81 6B      [10]   78 	ld	hl,#_user + 10
   39A4 36 04         [10]   79 	ld	(hl),#0x04
                             80 ;src/entities/user.c:13: user.h = 8;
   39A6 FD 21 82 6B   [14]   81 	ld	iy,#_user + 11
   39AA FD 36 00 08   [19]   82 	ld	0 (iy), #0x08
                             83 ;src/entities/user.c:14: user.x = 39-(user.w/2);
   39AE 6E            [ 7]   84 	ld	l,(hl)
   39AF CB 3D         [ 8]   85 	srl	l
   39B1 3E 27         [ 7]   86 	ld	a,#0x27
   39B3 95            [ 4]   87 	sub	a, l
   39B4 32 79 6B      [13]   88 	ld	(#(_user + 0x0002)),a
                             89 ;src/entities/user.c:15: user.y = 199-(user.h);
   39B7 FD 66 00      [19]   90 	ld	h, 0 (iy)
   39BA 3E C7         [ 7]   91 	ld	a,#0xC7
   39BC 94            [ 4]   92 	sub	a, h
   39BD 32 7A 6B      [13]   93 	ld	(#(_user + 0x0003)),a
                             94 ;src/entities/user.c:16: user.vx = 0;
   39C0 21 7B 6B      [10]   95 	ld	hl,#_user + 4
   39C3 36 00         [10]   96 	ld	(hl),#0x00
                             97 ;src/entities/user.c:17: user.vy = 0;
   39C5 21 7C 6B      [10]   98 	ld	hl,#_user + 5
   39C8 36 00         [10]   99 	ld	(hl),#0x00
                            100 ;src/entities/user.c:18: user.topvx = 4;
   39CA 21 7D 6B      [10]  101 	ld	hl,#_user + 6
   39CD 36 04         [10]  102 	ld	(hl),#0x04
                            103 ;src/entities/user.c:19: user.topvy = 5;
   39CF 21 7E 6B      [10]  104 	ld	hl,#_user + 7
   39D2 36 05         [10]  105 	ld	(hl),#0x05
                            106 ;src/entities/user.c:20: user.ax=0;
   39D4 21 7F 6B      [10]  107 	ld	hl,#_user + 8
   39D7 36 00         [10]  108 	ld	(hl),#0x00
                            109 ;src/entities/user.c:21: user.ay=0;
   39D9 21 80 6B      [10]  110 	ld	hl,#_user + 9
   39DC 36 00         [10]  111 	ld	(hl),#0x00
                            112 ;src/entities/user.c:22: user.sprite = (u8*) G_ship_00;
   39DE 21 EB 44      [10]  113 	ld	hl,#_G_ship_00
   39E1 22 77 6B      [16]  114 	ld	(_user), hl
                            115 ;src/entities/user.c:23: user.score = 0;
   39E4 21 00 00      [10]  116 	ld	hl,#0x0000
   39E7 22 86 6B      [16]  117 	ld	((_user + 0x000f)),hl
   39EA 22 88 6B      [16]  118 	ld	((_user + 0x000f)+2), hl
                            119 ;src/entities/user.c:24: user.shield = 0;
   39ED 21 84 6B      [10]  120 	ld	hl,#_user + 13
   39F0 36 00         [10]  121 	ld	(hl),#0x00
                            122 ;src/entities/user.c:25: user.lives = 0;
   39F2 21 85 6B      [10]  123 	ld	hl,#_user + 14
   39F5 36 00         [10]  124 	ld	(hl),#0x00
                            125 ;src/entities/user.c:27: user.max_shoots = 3;
   39F7 21 83 6B      [10]  126 	ld	hl,#_user + 12
   39FA 36 03         [10]  127 	ld	(hl),#0x03
                            128 ;src/entities/user.c:28: shoot_type = 1;
   39FC 21 90 6B      [10]  129 	ld	hl,#_shoot_type + 0
   39FF 36 01         [10]  130 	ld	(hl), #0x01
                            131 ;src/entities/user.c:29: user.last_moved = 0;
   3A01 21 00 00      [10]  132 	ld	hl,#0x0000
   3A04 22 8C 6B      [16]  133 	ld	((_user + 0x0015)),hl
   3A07 22 8E 6B      [16]  134 	ld	((_user + 0x0015)+2), hl
                            135 ;src/entities/user.c:30: user.engine_state = 0;
   3A0A 21 8B 6B      [10]  136 	ld	hl,#_user + 20
   3A0D 36 00         [10]  137 	ld	(hl),#0x00
                            138 ;src/entities/user.c:32: engine_anim[0] = (u8*) G_engine_00;
   3A0F 21 D6 4A      [10]  139 	ld	hl,#_G_engine_00
   3A12 22 91 6B      [16]  140 	ld	(_engine_anim), hl
                            141 ;src/entities/user.c:33: engine_anim[1] = (u8*) G_engine_01;
   3A15 21 D8 4A      [10]  142 	ld	hl,#_G_engine_01
   3A18 22 93 6B      [16]  143 	ld	((_engine_anim + 0x0002)), hl
   3A1B C9            [10]  144 	ret
                            145 ;src/entities/user.c:36: void user_init_level(){
                            146 ;	---------------------------------
                            147 ; Function user_init_level
                            148 ; ---------------------------------
   3A1C                     149 _user_init_level::
                            150 ;src/entities/user.c:37: user.lives=3;
   3A1C 21 85 6B      [10]  151 	ld	hl,#_user + 14
   3A1F 36 03         [10]  152 	ld	(hl),#0x03
                            153 ;src/entities/user.c:38: user.shield=0;
   3A21 21 84 6B      [10]  154 	ld	hl,#_user + 13
   3A24 36 00         [10]  155 	ld	(hl),#0x00
                            156 ;src/entities/user.c:39: user.max_shoots=3;
   3A26 21 83 6B      [10]  157 	ld	hl,#_user + 12
   3A29 36 03         [10]  158 	ld	(hl),#0x03
   3A2B C9            [10]  159 	ret
                            160 ;src/entities/user.c:46: long get_last_moved_user(){
                            161 ;	---------------------------------
                            162 ; Function get_last_moved_user
                            163 ; ---------------------------------
   3A2C                     164 _get_last_moved_user::
                            165 ;src/entities/user.c:47: return user.last_moved;
   3A2C 2A 8C 6B      [16]  166 	ld	hl, (#(_user + 0x0015) + 0)
   3A2F ED 5B 8E 6B   [20]  167 	ld	de, (#(_user + 0x0015) + 2)
   3A33 C9            [10]  168 	ret
                            169 ;src/entities/user.c:50: u8 get_user_max_shoots(){
                            170 ;	---------------------------------
                            171 ; Function get_user_max_shoots
                            172 ; ---------------------------------
   3A34                     173 _get_user_max_shoots::
                            174 ;src/entities/user.c:51: return user.max_shoots;
   3A34 21 83 6B      [10]  175 	ld	hl,#_user+12
   3A37 6E            [ 7]  176 	ld	l,(hl)
   3A38 C9            [10]  177 	ret
                            178 ;src/entities/user.c:53: u8 get_user_speed(){
                            179 ;	---------------------------------
                            180 ; Function get_user_speed
                            181 ; ---------------------------------
   3A39                     182 _get_user_speed::
                            183 ;src/entities/user.c:54: return user.speed;
   3A39 21 8A 6B      [10]  184 	ld	hl,#_user+19
   3A3C 6E            [ 7]  185 	ld	l,(hl)
   3A3D C9            [10]  186 	ret
                            187 ;src/entities/user.c:60: void user_engine(u8* screen){
                            188 ;	---------------------------------
                            189 ; Function user_engine
                            190 ; ---------------------------------
   3A3E                     191 _user_engine::
   3A3E DD E5         [15]  192 	push	ix
   3A40 DD 21 00 00   [14]  193 	ld	ix,#0
   3A44 DD 39         [15]  194 	add	ix,sp
                            195 ;src/entities/user.c:63: user.engine_state++;
   3A46 11 8B 6B      [10]  196 	ld	de,#_user + 20
   3A49 1A            [ 7]  197 	ld	a,(de)
   3A4A 3C            [ 4]  198 	inc	a
   3A4B 12            [ 7]  199 	ld	(de),a
                            200 ;src/entities/user.c:64: if (user.engine_state==2) user.engine_state=0;
   3A4C D6 02         [ 7]  201 	sub	a, #0x02
   3A4E 20 02         [12]  202 	jr	NZ,00102$
   3A50 AF            [ 4]  203 	xor	a, a
   3A51 12            [ 7]  204 	ld	(de),a
   3A52                     205 00102$:
                            206 ;src/entities/user.c:66: pscreen = cpct_getScreenPtr(screen, user.x+1, user.y+7);
   3A52 3A 7A 6B      [13]  207 	ld	a, (#_user + 3)
   3A55 C6 07         [ 7]  208 	add	a, #0x07
   3A57 4F            [ 4]  209 	ld	c,a
   3A58 3A 79 6B      [13]  210 	ld	a, (#_user + 2)
   3A5B 67            [ 4]  211 	ld	h,a
   3A5C 24            [ 4]  212 	inc	h
   3A5D DD 6E 04      [19]  213 	ld	l,4 (ix)
   3A60 DD 46 05      [19]  214 	ld	b,5 (ix)
   3A63 D5            [11]  215 	push	de
   3A64 79            [ 4]  216 	ld	a,c
   3A65 F5            [11]  217 	push	af
   3A66 33            [ 6]  218 	inc	sp
   3A67 E5            [11]  219 	push	hl
   3A68 33            [ 6]  220 	inc	sp
   3A69 60            [ 4]  221 	ld	h, b
   3A6A E5            [11]  222 	push	hl
   3A6B CD 89 56      [17]  223 	call	_cpct_getScreenPtr
   3A6E D1            [10]  224 	pop	de
                            225 ;src/entities/user.c:67: cpct_drawSprite( (u8*) engine_anim[user.engine_state],pscreen,2,1);
   3A6F 4D            [ 4]  226 	ld	c, l
   3A70 44            [ 4]  227 	ld	b, h
   3A71 1A            [ 7]  228 	ld	a,(de)
   3A72 6F            [ 4]  229 	ld	l,a
   3A73 26 00         [ 7]  230 	ld	h,#0x00
   3A75 29            [11]  231 	add	hl, hl
   3A76 11 91 6B      [10]  232 	ld	de,#_engine_anim
   3A79 19            [11]  233 	add	hl,de
   3A7A 5E            [ 7]  234 	ld	e,(hl)
   3A7B 23            [ 6]  235 	inc	hl
   3A7C 56            [ 7]  236 	ld	d,(hl)
   3A7D 21 02 01      [10]  237 	ld	hl,#0x0102
   3A80 E5            [11]  238 	push	hl
   3A81 C5            [11]  239 	push	bc
   3A82 D5            [11]  240 	push	de
   3A83 CD 49 53      [17]  241 	call	_cpct_drawSprite
   3A86 DD E1         [14]  242 	pop	ix
   3A88 C9            [10]  243 	ret
                            244 ;src/entities/user.c:70: void update_user() {
                            245 ;	---------------------------------
                            246 ; Function update_user
                            247 ; ---------------------------------
   3A89                     248 _update_user::
   3A89 DD E5         [15]  249 	push	ix
   3A8B DD 21 00 00   [14]  250 	ld	ix,#0
   3A8F DD 39         [15]  251 	add	ix,sp
   3A91 F5            [11]  252 	push	af
   3A92 F5            [11]  253 	push	af
                            254 ;src/entities/user.c:73: user.ax=0;
   3A93 21 7F 6B      [10]  255 	ld	hl,#(_user + 0x0008)
   3A96 36 00         [10]  256 	ld	(hl),#0x00
                            257 ;src/entities/user.c:76: cpct_scanKeyboard_f();
   3A98 CD 5C 52      [17]  258 	call	_cpct_scanKeyboard_f
                            259 ;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
   3A9B 21 08 08      [10]  260 	ld	hl,#0x0808
   3A9E CD 50 52      [17]  261 	call	_cpct_isKeyPressed
                            262 ;src/entities/user.c:84: user.ay = -2;
                            263 ;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
   3AA1 7D            [ 4]  264 	ld	a,l
   3AA2 B7            [ 4]  265 	or	a, a
   3AA3 28 07         [12]  266 	jr	Z,00104$
                            267 ;src/entities/user.c:84: user.ay = -2;
   3AA5 21 80 6B      [10]  268 	ld	hl,#(_user + 0x0009)
   3AA8 36 FE         [10]  269 	ld	(hl),#0xFE
   3AAA 18 0F         [12]  270 	jr	00105$
   3AAC                     271 00104$:
                            272 ;src/entities/user.c:85: } else if (cpct_isKeyPressed(Key_A)){
   3AAC 21 08 20      [10]  273 	ld	hl,#0x2008
   3AAF CD 50 52      [17]  274 	call	_cpct_isKeyPressed
   3AB2 7D            [ 4]  275 	ld	a,l
   3AB3 B7            [ 4]  276 	or	a, a
   3AB4 28 05         [12]  277 	jr	Z,00105$
                            278 ;src/entities/user.c:86: user.ay=2;    
   3AB6 21 80 6B      [10]  279 	ld	hl,#(_user + 0x0009)
   3AB9 36 02         [10]  280 	ld	(hl),#0x02
   3ABB                     281 00105$:
                            282 ;src/entities/user.c:89: if ((cpct_isKeyPressed(Key_P))){ 
   3ABB 21 03 08      [10]  283 	ld	hl,#0x0803
   3ABE CD 50 52      [17]  284 	call	_cpct_isKeyPressed
   3AC1 7D            [ 4]  285 	ld	a,l
   3AC2 B7            [ 4]  286 	or	a, a
   3AC3 28 07         [12]  287 	jr	Z,00109$
                            288 ;src/entities/user.c:90: user.ax = 2;
   3AC5 21 7F 6B      [10]  289 	ld	hl,#(_user + 0x0008)
   3AC8 36 02         [10]  290 	ld	(hl),#0x02
   3ACA 18 0F         [12]  291 	jr	00110$
   3ACC                     292 00109$:
                            293 ;src/entities/user.c:91: } else if (cpct_isKeyPressed(Key_O)){
   3ACC 21 04 04      [10]  294 	ld	hl,#0x0404
   3ACF CD 50 52      [17]  295 	call	_cpct_isKeyPressed
   3AD2 7D            [ 4]  296 	ld	a,l
   3AD3 B7            [ 4]  297 	or	a, a
   3AD4 28 05         [12]  298 	jr	Z,00110$
                            299 ;src/entities/user.c:92: user.ax=-2;    
   3AD6 21 7F 6B      [10]  300 	ld	hl,#(_user + 0x0008)
   3AD9 36 FE         [10]  301 	ld	(hl),#0xFE
   3ADB                     302 00110$:
                            303 ;src/entities/user.c:96: if (cpct_isKeyPressed(Key_D)){
   3ADB 21 07 20      [10]  304 	ld	hl,#0x2007
   3ADE CD 50 52      [17]  305 	call	_cpct_isKeyPressed
   3AE1 7D            [ 4]  306 	ld	a,l
   3AE2 B7            [ 4]  307 	or	a, a
   3AE3 28 1B         [12]  308 	jr	Z,00112$
                            309 ;src/entities/user.c:97: shoot_type=(shoot_type+1)%2;
   3AE5 FD 21 90 6B   [14]  310 	ld	iy,#_shoot_type
   3AE9 FD 6E 00      [19]  311 	ld	l,0 (iy)
   3AEC 26 00         [ 7]  312 	ld	h,#0x00
   3AEE 23            [ 6]  313 	inc	hl
   3AEF 01 02 00      [10]  314 	ld	bc,#0x0002
   3AF2 C5            [11]  315 	push	bc
   3AF3 E5            [11]  316 	push	hl
   3AF4 CD 7D 56      [17]  317 	call	__modsint
   3AF7 F1            [10]  318 	pop	af
   3AF8 F1            [10]  319 	pop	af
   3AF9 FD 21 90 6B   [14]  320 	ld	iy,#_shoot_type
   3AFD FD 75 00      [19]  321 	ld	0 (iy),l
   3B00                     322 00112$:
                            323 ;src/entities/user.c:100: if (cpct_isKeyPressed(Key_H)){
   3B00 21 05 10      [10]  324 	ld	hl,#0x1005
   3B03 CD 50 52      [17]  325 	call	_cpct_isKeyPressed
   3B06 7D            [ 4]  326 	ld	a,l
   3B07 B7            [ 4]  327 	or	a, a
   3B08 28 3B         [12]  328 	jr	Z,00114$
                            329 ;src/entities/user.c:101: create_enemy((rand()%80),(rand()%199),(rand()%3));
   3B0A CD C6 52      [17]  330 	call	_rand
   3B0D 01 03 00      [10]  331 	ld	bc,#0x0003
   3B10 C5            [11]  332 	push	bc
   3B11 E5            [11]  333 	push	hl
   3B12 CD 7D 56      [17]  334 	call	__modsint
   3B15 F1            [10]  335 	pop	af
   3B16 F1            [10]  336 	pop	af
   3B17 DD 75 FF      [19]  337 	ld	-1 (ix),l
   3B1A CD C6 52      [17]  338 	call	_rand
   3B1D 01 C7 00      [10]  339 	ld	bc,#0x00C7
   3B20 C5            [11]  340 	push	bc
   3B21 E5            [11]  341 	push	hl
   3B22 CD 7D 56      [17]  342 	call	__modsint
   3B25 F1            [10]  343 	pop	af
   3B26 F1            [10]  344 	pop	af
   3B27 E5            [11]  345 	push	hl
   3B28 CD C6 52      [17]  346 	call	_rand
   3B2B 11 50 00      [10]  347 	ld	de,#0x0050
   3B2E D5            [11]  348 	push	de
   3B2F E5            [11]  349 	push	hl
   3B30 CD 7D 56      [17]  350 	call	__modsint
   3B33 F1            [10]  351 	pop	af
   3B34 F1            [10]  352 	pop	af
   3B35 5D            [ 4]  353 	ld	e,l
   3B36 54            [ 4]  354 	ld	d,h
   3B37 C1            [10]  355 	pop	bc
   3B38 DD 7E FF      [19]  356 	ld	a,-1 (ix)
   3B3B F5            [11]  357 	push	af
   3B3C 33            [ 6]  358 	inc	sp
   3B3D C5            [11]  359 	push	bc
   3B3E D5            [11]  360 	push	de
   3B3F CD 00 26      [17]  361 	call	_create_enemy
   3B42 F1            [10]  362 	pop	af
   3B43 F1            [10]  363 	pop	af
   3B44 33            [ 6]  364 	inc	sp
   3B45                     365 00114$:
                            366 ;src/entities/user.c:104: if (cpct_isKeyPressed(Key_J)){
   3B45 21 05 20      [10]  367 	ld	hl,#0x2005
   3B48 CD 50 52      [17]  368 	call	_cpct_isKeyPressed
   3B4B 7D            [ 4]  369 	ld	a,l
   3B4C B7            [ 4]  370 	or	a, a
   3B4D CA E3 3B      [10]  371 	jp	Z,00116$
                            372 ;src/entities/user.c:105: x=rand()%80;
   3B50 CD C6 52      [17]  373 	call	_rand
   3B53 01 50 00      [10]  374 	ld	bc,#0x0050
   3B56 C5            [11]  375 	push	bc
   3B57 E5            [11]  376 	push	hl
   3B58 CD 7D 56      [17]  377 	call	__modsint
   3B5B F1            [10]  378 	pop	af
   3B5C F1            [10]  379 	pop	af
   3B5D DD 75 FC      [19]  380 	ld	-4 (ix),l
                            381 ;src/entities/user.c:106: y=rand()%199;
   3B60 CD C6 52      [17]  382 	call	_rand
   3B63 01 C7 00      [10]  383 	ld	bc,#0x00C7
   3B66 C5            [11]  384 	push	bc
   3B67 E5            [11]  385 	push	hl
   3B68 CD 7D 56      [17]  386 	call	__modsint
   3B6B F1            [10]  387 	pop	af
   3B6C F1            [10]  388 	pop	af
   3B6D 4D            [ 4]  389 	ld	c,l
                            390 ;src/entities/user.c:107: create_enemy(x,y,(rand()%3));
   3B6E C5            [11]  391 	push	bc
   3B6F CD C6 52      [17]  392 	call	_rand
   3B72 11 03 00      [10]  393 	ld	de,#0x0003
   3B75 D5            [11]  394 	push	de
   3B76 E5            [11]  395 	push	hl
   3B77 CD 7D 56      [17]  396 	call	__modsint
   3B7A F1            [10]  397 	pop	af
   3B7B F1            [10]  398 	pop	af
   3B7C C1            [10]  399 	pop	bc
   3B7D 5D            [ 4]  400 	ld	e,l
   3B7E DD 71 FD      [19]  401 	ld	-3 (ix),c
   3B81 DD 36 FE 00   [19]  402 	ld	-2 (ix),#0x00
   3B85 DD 4E FC      [19]  403 	ld	c,-4 (ix)
   3B88 06 00         [ 7]  404 	ld	b,#0x00
   3B8A C5            [11]  405 	push	bc
   3B8B 7B            [ 4]  406 	ld	a,e
   3B8C F5            [11]  407 	push	af
   3B8D 33            [ 6]  408 	inc	sp
   3B8E DD 6E FD      [19]  409 	ld	l,-3 (ix)
   3B91 DD 66 FE      [19]  410 	ld	h,-2 (ix)
   3B94 E5            [11]  411 	push	hl
   3B95 C5            [11]  412 	push	bc
   3B96 CD 00 26      [17]  413 	call	_create_enemy
   3B99 F1            [10]  414 	pop	af
   3B9A F1            [10]  415 	pop	af
   3B9B 33            [ 6]  416 	inc	sp
   3B9C CD C6 52      [17]  417 	call	_rand
   3B9F 11 03 00      [10]  418 	ld	de,#0x0003
   3BA2 D5            [11]  419 	push	de
   3BA3 E5            [11]  420 	push	hl
   3BA4 CD 7D 56      [17]  421 	call	__modsint
   3BA7 F1            [10]  422 	pop	af
   3BA8 F1            [10]  423 	pop	af
   3BA9 C1            [10]  424 	pop	bc
   3BAA 5D            [ 4]  425 	ld	e,l
   3BAB 21 08 00      [10]  426 	ld	hl,#0x0008
   3BAE 09            [11]  427 	add	hl,bc
   3BAF C5            [11]  428 	push	bc
   3BB0 7B            [ 4]  429 	ld	a,e
   3BB1 F5            [11]  430 	push	af
   3BB2 33            [ 6]  431 	inc	sp
   3BB3 DD 5E FD      [19]  432 	ld	e,-3 (ix)
   3BB6 DD 56 FE      [19]  433 	ld	d,-2 (ix)
   3BB9 D5            [11]  434 	push	de
   3BBA E5            [11]  435 	push	hl
   3BBB CD 00 26      [17]  436 	call	_create_enemy
   3BBE F1            [10]  437 	pop	af
   3BBF F1            [10]  438 	pop	af
   3BC0 33            [ 6]  439 	inc	sp
   3BC1 CD C6 52      [17]  440 	call	_rand
   3BC4 11 03 00      [10]  441 	ld	de,#0x0003
   3BC7 D5            [11]  442 	push	de
   3BC8 E5            [11]  443 	push	hl
   3BC9 CD 7D 56      [17]  444 	call	__modsint
   3BCC F1            [10]  445 	pop	af
   3BCD F1            [10]  446 	pop	af
   3BCE C1            [10]  447 	pop	bc
   3BCF 5D            [ 4]  448 	ld	e,l
   3BD0 21 10 00      [10]  449 	ld	hl,#0x0010
   3BD3 09            [11]  450 	add	hl,bc
   3BD4 7B            [ 4]  451 	ld	a,e
   3BD5 F5            [11]  452 	push	af
   3BD6 33            [ 6]  453 	inc	sp
   3BD7 D1            [10]  454 	pop	de
   3BD8 C1            [10]  455 	pop	bc
   3BD9 C5            [11]  456 	push	bc
   3BDA D5            [11]  457 	push	de
   3BDB C5            [11]  458 	push	bc
   3BDC E5            [11]  459 	push	hl
   3BDD CD 00 26      [17]  460 	call	_create_enemy
   3BE0 F1            [10]  461 	pop	af
   3BE1 F1            [10]  462 	pop	af
   3BE2 33            [ 6]  463 	inc	sp
   3BE3                     464 00116$:
                            465 ;src/entities/user.c:112: if (cpct_isKeyPressed(Key_K)){
   3BE3 21 04 20      [10]  466 	ld	hl,#0x2004
   3BE6 CD 50 52      [17]  467 	call	_cpct_isKeyPressed
   3BE9 7D            [ 4]  468 	ld	a,l
   3BEA B7            [ 4]  469 	or	a, a
   3BEB 28 46         [12]  470 	jr	Z,00118$
                            471 ;src/entities/user.c:113: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
   3BED CD C6 52      [17]  472 	call	_rand
   3BF0 01 03 00      [10]  473 	ld	bc,#0x0003
   3BF3 C5            [11]  474 	push	bc
   3BF4 E5            [11]  475 	push	hl
   3BF5 CD 7D 56      [17]  476 	call	__modsint
   3BF8 F1            [10]  477 	pop	af
   3BF9 F1            [10]  478 	pop	af
   3BFA DD 75 FD      [19]  479 	ld	-3 (ix),l
   3BFD CD C6 52      [17]  480 	call	_rand
   3C00 01 28 00      [10]  481 	ld	bc,#0x0028
   3C03 C5            [11]  482 	push	bc
   3C04 E5            [11]  483 	push	hl
   3C05 CD 7D 56      [17]  484 	call	__modsint
   3C08 F1            [10]  485 	pop	af
   3C09 F1            [10]  486 	pop	af
   3C0A E5            [11]  487 	push	hl
   3C0B CD C6 52      [17]  488 	call	_rand
   3C0E 11 0A 00      [10]  489 	ld	de,#0x000A
   3C11 D5            [11]  490 	push	de
   3C12 E5            [11]  491 	push	hl
   3C13 CD 7D 56      [17]  492 	call	__modsint
   3C16 F1            [10]  493 	pop	af
   3C17 F1            [10]  494 	pop	af
   3C18 5D            [ 4]  495 	ld	e,l
   3C19 54            [ 4]  496 	ld	d,h
   3C1A C1            [10]  497 	pop	bc
   3C1B 13            [ 6]  498 	inc	de
   3C1C 13            [ 6]  499 	inc	de
   3C1D 13            [ 6]  500 	inc	de
   3C1E 13            [ 6]  501 	inc	de
   3C1F 13            [ 6]  502 	inc	de
   3C20 3E 0C         [ 7]  503 	ld	a,#0x0C
   3C22 F5            [11]  504 	push	af
   3C23 33            [ 6]  505 	inc	sp
   3C24 DD 7E FD      [19]  506 	ld	a,-3 (ix)
   3C27 F5            [11]  507 	push	af
   3C28 33            [ 6]  508 	inc	sp
   3C29 C5            [11]  509 	push	bc
   3C2A D5            [11]  510 	push	de
   3C2B CD 3F 29      [17]  511 	call	_create_enemy_group
   3C2E 21 06 00      [10]  512 	ld	hl,#6
   3C31 39            [11]  513 	add	hl,sp
   3C32 F9            [ 6]  514 	ld	sp,hl
   3C33                     515 00118$:
                            516 ;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
   3C33 21 05 80      [10]  517 	ld	hl,#0x8005
   3C36 CD 50 52      [17]  518 	call	_cpct_isKeyPressed
                            519 ;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
                            520 ;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
   3C39 7D            [ 4]  521 	ld	a,l
   3C3A B7            [ 4]  522 	or	a, a
   3C3B 28 16         [12]  523 	jr	Z,00120$
                            524 ;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
   3C3D 21 7A 6B      [10]  525 	ld	hl, #_user + 3
   3C40 46            [ 7]  526 	ld	b,(hl)
   3C41 3A 79 6B      [13]  527 	ld	a, (#(_user + 0x0002) + 0)
   3C44 57            [ 4]  528 	ld	d,a
   3C45 14            [ 4]  529 	inc	d
   3C46 14            [ 4]  530 	inc	d
   3C47 3A 90 6B      [13]  531 	ld	a,(_shoot_type)
   3C4A F5            [11]  532 	push	af
   3C4B 33            [ 6]  533 	inc	sp
   3C4C 4A            [ 4]  534 	ld	c, d
   3C4D C5            [11]  535 	push	bc
   3C4E CD 40 36      [17]  536 	call	_create_shoot
   3C51 F1            [10]  537 	pop	af
   3C52 33            [ 6]  538 	inc	sp
   3C53                     539 00120$:
                            540 ;src/entities/user.c:121: if (cpct_isKeyPressed(Key_L)){
   3C53 21 04 10      [10]  541 	ld	hl,#0x1004
   3C56 CD 50 52      [17]  542 	call	_cpct_isKeyPressed
   3C59 7D            [ 4]  543 	ld	a,l
   3C5A B7            [ 4]  544 	or	a, a
   3C5B 28 43         [12]  545 	jr	Z,00122$
                            546 ;src/entities/user.c:122: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
   3C5D CD C6 52      [17]  547 	call	_rand
   3C60 01 02 00      [10]  548 	ld	bc,#0x0002
   3C63 C5            [11]  549 	push	bc
   3C64 E5            [11]  550 	push	hl
   3C65 CD 7D 56      [17]  551 	call	__modsint
   3C68 F1            [10]  552 	pop	af
   3C69 F1            [10]  553 	pop	af
   3C6A DD 75 FD      [19]  554 	ld	-3 (ix),l
   3C6D CD C6 52      [17]  555 	call	_rand
   3C70 01 50 00      [10]  556 	ld	bc,#0x0050
   3C73 C5            [11]  557 	push	bc
   3C74 E5            [11]  558 	push	hl
   3C75 CD 7D 56      [17]  559 	call	__modsint
   3C78 F1            [10]  560 	pop	af
   3C79 F1            [10]  561 	pop	af
   3C7A 7D            [ 4]  562 	ld	a,l
   3C7B C6 14         [ 7]  563 	add	a, #0x14
   3C7D 5F            [ 4]  564 	ld	e,a
   3C7E D5            [11]  565 	push	de
   3C7F CD C6 52      [17]  566 	call	_rand
   3C82 01 14 00      [10]  567 	ld	bc,#0x0014
   3C85 C5            [11]  568 	push	bc
   3C86 E5            [11]  569 	push	hl
   3C87 CD 7D 56      [17]  570 	call	__modsint
   3C8A F1            [10]  571 	pop	af
   3C8B F1            [10]  572 	pop	af
   3C8C D1            [10]  573 	pop	de
   3C8D 7D            [ 4]  574 	ld	a,l
   3C8E C6 05         [ 7]  575 	add	a, #0x05
   3C90 57            [ 4]  576 	ld	d,a
   3C91 DD 7E FD      [19]  577 	ld	a,-3 (ix)
   3C94 F5            [11]  578 	push	af
   3C95 33            [ 6]  579 	inc	sp
   3C96 7B            [ 4]  580 	ld	a,e
   3C97 F5            [11]  581 	push	af
   3C98 33            [ 6]  582 	inc	sp
   3C99 D5            [11]  583 	push	de
   3C9A 33            [ 6]  584 	inc	sp
   3C9B CD 02 31      [17]  585 	call	_create_explosion
   3C9E F1            [10]  586 	pop	af
   3C9F 33            [ 6]  587 	inc	sp
   3CA0                     588 00122$:
                            589 ;src/entities/user.c:126: if (user.ax!=0){
   3CA0 21 7F 6B      [10]  590 	ld	hl, #(_user + 0x0008) + 0
   3CA3 56            [ 7]  591 	ld	d,(hl)
                            592 ;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
                            593 ;src/entities/user.c:126: if (user.ax!=0){
   3CA4 7A            [ 4]  594 	ld	a,d
   3CA5 B7            [ 4]  595 	or	a, a
   3CA6 28 42         [12]  596 	jr	Z,00129$
                            597 ;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
   3CA8 21 7B 6B      [10]  598 	ld	hl, #(_user + 0x0004) + 0
   3CAB 5E            [ 7]  599 	ld	e,(hl)
   3CAC 21 7D 6B      [10]  600 	ld	hl,#_user + 6
   3CAF CB 7B         [ 8]  601 	bit	7, e
   3CB1 20 0B         [12]  602 	jr	NZ,00127$
   3CB3 46            [ 7]  603 	ld	b,(hl)
   3CB4 7B            [ 4]  604 	ld	a,e
   3CB5 90            [ 4]  605 	sub	a, b
   3CB6 E2 BB 3C      [10]  606 	jp	PO, 00210$
   3CB9 EE 80         [ 7]  607 	xor	a, #0x80
   3CBB                     608 00210$:
   3CBB FA E5 3C      [10]  609 	jp	M,00123$
   3CBE                     610 00127$:
   3CBE AF            [ 4]  611 	xor	a, a
   3CBF 93            [ 4]  612 	sub	a, e
   3CC0 E2 C5 3C      [10]  613 	jp	PO, 00211$
   3CC3 EE 80         [ 7]  614 	xor	a, #0x80
   3CC5                     615 00211$:
   3CC5 FA EA 3C      [10]  616 	jp	M,00129$
   3CC8 7E            [ 7]  617 	ld	a,(hl)
   3CC9 6F            [ 4]  618 	ld	l,a
   3CCA 17            [ 4]  619 	rla
   3CCB 9F            [ 4]  620 	sbc	a, a
   3CCC 67            [ 4]  621 	ld	h,a
   3CCD AF            [ 4]  622 	xor	a, a
   3CCE 95            [ 4]  623 	sub	a, l
   3CCF 6F            [ 4]  624 	ld	l,a
   3CD0 3E 00         [ 7]  625 	ld	a, #0x00
   3CD2 9C            [ 4]  626 	sbc	a, h
   3CD3 67            [ 4]  627 	ld	h,a
   3CD4 7B            [ 4]  628 	ld	a,e
   3CD5 4F            [ 4]  629 	ld	c,a
   3CD6 17            [ 4]  630 	rla
   3CD7 9F            [ 4]  631 	sbc	a, a
   3CD8 47            [ 4]  632 	ld	b,a
   3CD9 7D            [ 4]  633 	ld	a,l
   3CDA 91            [ 4]  634 	sub	a, c
   3CDB 7C            [ 4]  635 	ld	a,h
   3CDC 98            [ 4]  636 	sbc	a, b
   3CDD E2 E2 3C      [10]  637 	jp	PO, 00212$
   3CE0 EE 80         [ 7]  638 	xor	a, #0x80
   3CE2                     639 00212$:
   3CE2 F2 EA 3C      [10]  640 	jp	P,00129$
   3CE5                     641 00123$:
                            642 ;src/entities/user.c:128: user.vx+=user.ax;
   3CE5 7B            [ 4]  643 	ld	a,e
   3CE6 82            [ 4]  644 	add	a, d
   3CE7 32 7B 6B      [13]  645 	ld	(#(_user + 0x0004)),a
   3CEA                     646 00129$:
                            647 ;src/entities/user.c:132: if (user.vx>0){
   3CEA 21 7B 6B      [10]  648 	ld	hl, #(_user + 0x0004) + 0
   3CED 56            [ 7]  649 	ld	d,(hl)
   3CEE AF            [ 4]  650 	xor	a, a
   3CEF 92            [ 4]  651 	sub	a, d
   3CF0 E2 F5 3C      [10]  652 	jp	PO, 00213$
   3CF3 EE 80         [ 7]  653 	xor	a, #0x80
   3CF5                     654 00213$:
   3CF5 F2 FF 3C      [10]  655 	jp	P,00133$
                            656 ;src/entities/user.c:133: user.vx--;
   3CF8 15            [ 4]  657 	dec	d
   3CF9 21 7B 6B      [10]  658 	ld	hl,#(_user + 0x0004)
   3CFC 72            [ 7]  659 	ld	(hl),d
   3CFD 18 09         [12]  660 	jr	00134$
   3CFF                     661 00133$:
                            662 ;src/entities/user.c:134: } else if (user.vx<0){
   3CFF CB 7A         [ 8]  663 	bit	7, d
   3D01 28 05         [12]  664 	jr	Z,00134$
                            665 ;src/entities/user.c:135: user.vx++;
   3D03 14            [ 4]  666 	inc	d
   3D04 21 7B 6B      [10]  667 	ld	hl,#(_user + 0x0004)
   3D07 72            [ 7]  668 	ld	(hl),d
   3D08                     669 00134$:
                            670 ;src/entities/user.c:138: user.x+=user.vx;
   3D08 21 79 6B      [10]  671 	ld	hl, #(_user + 0x0002) + 0
   3D0B 56            [ 7]  672 	ld	d,(hl)
   3D0C 21 7B 6B      [10]  673 	ld	hl, #(_user + 0x0004) + 0
   3D0F 66            [ 7]  674 	ld	h,(hl)
   3D10 7A            [ 4]  675 	ld	a,d
   3D11 84            [ 4]  676 	add	a, h
   3D12 57            [ 4]  677 	ld	d,a
   3D13 21 79 6B      [10]  678 	ld	hl,#(_user + 0x0002)
   3D16 72            [ 7]  679 	ld	(hl),d
                            680 ;src/entities/user.c:140: if (user.x<0)
   3D17 21 79 6B      [10]  681 	ld	hl, #(_user + 0x0002) + 0
   3D1A 5E            [ 7]  682 	ld	e,(hl)
   3D1B CB 7A         [ 8]  683 	bit	7, d
   3D1D 28 07         [12]  684 	jr	Z,00138$
                            685 ;src/entities/user.c:141: user.x=0;
   3D1F 21 79 6B      [10]  686 	ld	hl,#(_user + 0x0002)
   3D22 36 00         [10]  687 	ld	(hl),#0x00
   3D24 18 25         [12]  688 	jr	00140$
   3D26                     689 00138$:
                            690 ;src/entities/user.c:142: else if (user.x> 79-user.w){
   3D26 21 81 6B      [10]  691 	ld	hl, #_user + 10
   3D29 66            [ 7]  692 	ld	h,(hl)
   3D2A 4C            [ 4]  693 	ld	c,h
   3D2B 06 00         [ 7]  694 	ld	b,#0x00
   3D2D 3E 4F         [ 7]  695 	ld	a,#0x4F
   3D2F 91            [ 4]  696 	sub	a, c
   3D30 4F            [ 4]  697 	ld	c,a
   3D31 3E 00         [ 7]  698 	ld	a,#0x00
   3D33 98            [ 4]  699 	sbc	a, b
   3D34 47            [ 4]  700 	ld	b,a
   3D35 7B            [ 4]  701 	ld	a,e
   3D36 17            [ 4]  702 	rla
   3D37 9F            [ 4]  703 	sbc	a, a
   3D38 57            [ 4]  704 	ld	d,a
   3D39 79            [ 4]  705 	ld	a,c
   3D3A 93            [ 4]  706 	sub	a, e
   3D3B 78            [ 4]  707 	ld	a,b
   3D3C 9A            [ 4]  708 	sbc	a, d
   3D3D E2 42 3D      [10]  709 	jp	PO, 00214$
   3D40 EE 80         [ 7]  710 	xor	a, #0x80
   3D42                     711 00214$:
   3D42 F2 4B 3D      [10]  712 	jp	P,00140$
                            713 ;src/entities/user.c:143: user.x = 79-user.w;
   3D45 3E 4F         [ 7]  714 	ld	a,#0x4F
   3D47 94            [ 4]  715 	sub	a, h
   3D48 32 79 6B      [13]  716 	ld	(#(_user + 0x0002)),a
   3D4B                     717 00140$:
   3D4B DD F9         [10]  718 	ld	sp, ix
   3D4D DD E1         [14]  719 	pop	ix
   3D4F C9            [10]  720 	ret
                            721 ;src/entities/user.c:147: void draw_user(u8* screen){
                            722 ;	---------------------------------
                            723 ; Function draw_user
                            724 ; ---------------------------------
   3D50                     725 _draw_user::
   3D50 DD E5         [15]  726 	push	ix
   3D52 DD 21 00 00   [14]  727 	ld	ix,#0
   3D56 DD 39         [15]  728 	add	ix,sp
                            729 ;src/entities/user.c:149: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   3D58 21 7A 6B      [10]  730 	ld	hl, #_user + 3
   3D5B 4E            [ 7]  731 	ld	c,(hl)
   3D5C 21 79 6B      [10]  732 	ld	hl, #_user + 2
   3D5F 66            [ 7]  733 	ld	h,(hl)
   3D60 DD 5E 04      [19]  734 	ld	e,4 (ix)
   3D63 DD 56 05      [19]  735 	ld	d,5 (ix)
   3D66 79            [ 4]  736 	ld	a,c
   3D67 F5            [11]  737 	push	af
   3D68 33            [ 6]  738 	inc	sp
   3D69 E5            [11]  739 	push	hl
   3D6A 33            [ 6]  740 	inc	sp
   3D6B D5            [11]  741 	push	de
   3D6C CD 89 56      [17]  742 	call	_cpct_getScreenPtr
   3D6F EB            [ 4]  743 	ex	de,hl
                            744 ;src/entities/user.c:150: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   3D70 21 82 6B      [10]  745 	ld	hl, #_user + 11
   3D73 46            [ 7]  746 	ld	b,(hl)
   3D74 3A 81 6B      [13]  747 	ld	a, (#_user + 10)
   3D77 2A 77 6B      [16]  748 	ld	hl, (#_user + 0)
   3D7A E5            [11]  749 	push	hl
   3D7B FD E1         [14]  750 	pop	iy
   3D7D C5            [11]  751 	push	bc
   3D7E 33            [ 6]  752 	inc	sp
   3D7F F5            [11]  753 	push	af
   3D80 33            [ 6]  754 	inc	sp
   3D81 D5            [11]  755 	push	de
   3D82 FD E5         [15]  756 	push	iy
   3D84 CD 49 53      [17]  757 	call	_cpct_drawSprite
   3D87 DD E1         [14]  758 	pop	ix
   3D89 C9            [10]  759 	ret
                            760 ;src/entities/user.c:153: void set_score(u32 new_score){
                            761 ;	---------------------------------
                            762 ; Function set_score
                            763 ; ---------------------------------
   3D8A                     764 _set_score::
                            765 ;src/entities/user.c:154: user.score = new_score;
   3D8A 11 86 6B      [10]  766 	ld	de,#_user+15
   3D8D 21 02 00      [10]  767 	ld	hl, #0x0002
   3D90 39            [11]  768 	add	hl, sp
   3D91 01 04 00      [10]  769 	ld	bc, #0x0004
   3D94 ED B0         [21]  770 	ldir
   3D96 C9            [10]  771 	ret
                            772 ;src/entities/user.c:156: void add_score(u16 new_add_score){
                            773 ;	---------------------------------
                            774 ; Function add_score
                            775 ; ---------------------------------
   3D97                     776 _add_score::
   3D97 DD E5         [15]  777 	push	ix
   3D99 DD 21 00 00   [14]  778 	ld	ix,#0
   3D9D DD 39         [15]  779 	add	ix,sp
   3D9F F5            [11]  780 	push	af
   3DA0 F5            [11]  781 	push	af
                            782 ;src/entities/user.c:157: user.score += new_add_score;
   3DA1 11 86 6B      [10]  783 	ld	de,#(_user + 0x000f)
   3DA4 21 00 00      [10]  784 	ld	hl, #0x0000
   3DA7 39            [11]  785 	add	hl, sp
   3DA8 EB            [ 4]  786 	ex	de, hl
   3DA9 01 04 00      [10]  787 	ld	bc, #0x0004
   3DAC ED B0         [21]  788 	ldir
   3DAE DD 6E 04      [19]  789 	ld	l,4 (ix)
   3DB1 DD 66 05      [19]  790 	ld	h,5 (ix)
   3DB4 01 00 00      [10]  791 	ld	bc,#0x0000
   3DB7 DD 7E FC      [19]  792 	ld	a,-4 (ix)
   3DBA 85            [ 4]  793 	add	a, l
   3DBB 5F            [ 4]  794 	ld	e,a
   3DBC DD 7E FD      [19]  795 	ld	a,-3 (ix)
   3DBF 8C            [ 4]  796 	adc	a, h
   3DC0 57            [ 4]  797 	ld	d,a
   3DC1 DD 7E FE      [19]  798 	ld	a,-2 (ix)
   3DC4 89            [ 4]  799 	adc	a, c
   3DC5 4F            [ 4]  800 	ld	c,a
   3DC6 DD 7E FF      [19]  801 	ld	a,-1 (ix)
   3DC9 88            [ 4]  802 	adc	a, b
   3DCA 47            [ 4]  803 	ld	b,a
   3DCB ED 53 86 6B   [20]  804 	ld	((_user + 0x000f)), de
   3DCF ED 43 88 6B   [20]  805 	ld	((_user + 0x000f)+2), bc
   3DD3 DD F9         [10]  806 	ld	sp, ix
   3DD5 DD E1         [14]  807 	pop	ix
   3DD7 C9            [10]  808 	ret
                            809 ;src/entities/user.c:159: u32 get_score(){
                            810 ;	---------------------------------
                            811 ; Function get_score
                            812 ; ---------------------------------
   3DD8                     813 _get_score::
                            814 ;src/entities/user.c:160: return user.score;
   3DD8 2A 86 6B      [16]  815 	ld	hl, (#(_user + 0x000f) + 0)
   3DDB ED 5B 88 6B   [20]  816 	ld	de, (#(_user + 0x000f) + 2)
   3DDF C9            [10]  817 	ret
                            818 	.area _CODE
                            819 	.area _INITIALIZER
                            820 	.area _CABS (ABS)
