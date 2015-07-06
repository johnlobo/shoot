                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul  6 16:34:53 2015
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
   47CF                      33 _user::
   47CF                      34 	.ds 18
   47E1                      35 _shoot_type::
   47E1                      36 	.ds 1
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
   2DC5                      65 _init_user::
                             66 ;src/entities/user.c:18: user.w = 6;
   2DC5 21 D7 47      [10]   67 	ld	hl,#_user + 8
   2DC8 36 06         [10]   68 	ld	(hl),#0x06
                             69 ;src/entities/user.c:19: user.h = 16;
   2DCA FD 21 D8 47   [14]   70 	ld	iy,#_user + 9
   2DCE FD 36 00 10   [19]   71 	ld	0 (iy), #0x10
                             72 ;src/entities/user.c:20: user.x = 39-(user.w/2);
   2DD2 6E            [ 7]   73 	ld	l,(hl)
   2DD3 CB 3D         [ 8]   74 	srl	l
   2DD5 3E 27         [ 7]   75 	ld	a,#0x27
   2DD7 95            [ 4]   76 	sub	a, l
   2DD8 32 D5 47      [13]   77 	ld	(#(_user + 0x0006)),a
                             78 ;src/entities/user.c:21: user.y = 199-(user.h);
   2DDB FD 66 00      [19]   79 	ld	h, 0 (iy)
   2DDE 3E C7         [ 7]   80 	ld	a,#0xC7
   2DE0 94            [ 4]   81 	sub	a, h
   2DE1 32 D6 47      [13]   82 	ld	(#(_user + 0x0007)),a
                             83 ;src/entities/user.c:22: user.sprite = (u8*) ship03;
   2DE4 21 BE 38      [10]   84 	ld	hl,#_ship03
   2DE7 22 D3 47      [16]   85 	ld	((_user + 0x0004)), hl
                             86 ;src/entities/user.c:24: user.vx = 2;
   2DEA 21 DD 47      [10]   87 	ld	hl,#_user + 14
   2DED 36 02         [10]   88 	ld	(hl),#0x02
                             89 ;src/entities/user.c:25: user.vy = 4;
   2DEF 21 DE 47      [10]   90 	ld	hl,#_user + 15
   2DF2 36 04         [10]   91 	ld	(hl),#0x04
                             92 ;src/entities/user.c:26: user.max_shoots = 10;
   2DF4 21 E0 47      [10]   93 	ld	hl,#_user + 17
   2DF7 36 0A         [10]   94 	ld	(hl),#0x0A
                             95 ;src/entities/user.c:27: shoot_type = 1;
   2DF9 21 E1 47      [10]   96 	ld	hl,#_shoot_type + 0
   2DFC 36 01         [10]   97 	ld	(hl), #0x01
   2DFE C9            [10]   98 	ret
                             99 ;src/entities/user.c:30: u8 get_user_max_shoots(){
                            100 ;	---------------------------------
                            101 ; Function get_user_max_shoots
                            102 ; ---------------------------------
   2DFF                     103 _get_user_max_shoots::
                            104 ;src/entities/user.c:31: return user.max_shoots;
   2DFF 21 E0 47      [10]  105 	ld	hl,#_user+17
   2E02 6E            [ 7]  106 	ld	l,(hl)
   2E03 C9            [10]  107 	ret
                            108 ;src/entities/user.c:37: void update_user() {
                            109 ;	---------------------------------
                            110 ; Function update_user
                            111 ; ---------------------------------
   2E04                     112 _update_user::
   2E04 DD E5         [15]  113 	push	ix
   2E06 DD 21 00 00   [14]  114 	ld	ix,#0
   2E0A DD 39         [15]  115 	add	ix,sp
   2E0C F5            [11]  116 	push	af
   2E0D F5            [11]  117 	push	af
                            118 ;src/entities/user.c:41: cpct_scanKeyboard_f();
   2E0E CD 74 40      [17]  119 	call	_cpct_scanKeyboard_f
                            120 ;src/entities/user.c:48: if ((cpct_isKeyPressed(Key_Q))){ 
   2E11 21 08 08      [10]  121 	ld	hl,#0x0808
   2E14 E5            [11]  122 	push	hl
   2E15 CD 63 40      [17]  123 	call	_cpct_isKeyPressed
   2E18 F1            [10]  124 	pop	af
   2E19 7D            [ 4]  125 	ld	a,l
   2E1A B7            [ 4]  126 	or	a, a
   2E1B 28 2D         [12]  127 	jr	Z,00105$
                            128 ;src/entities/user.c:49: if ((user.y-user.vy)>0)
   2E1D 21 D6 47      [10]  129 	ld	hl, #(_user + 0x0007) + 0
   2E20 5E            [ 7]  130 	ld	e,(hl)
   2E21 4B            [ 4]  131 	ld	c,e
   2E22 06 00         [ 7]  132 	ld	b,#0x00
   2E24 21 DE 47      [10]  133 	ld	hl, #_user + 15
   2E27 56            [ 7]  134 	ld	d,(hl)
   2E28 7A            [ 4]  135 	ld	a,d
   2E29 6F            [ 4]  136 	ld	l,a
   2E2A 17            [ 4]  137 	rla
   2E2B 9F            [ 4]  138 	sbc	a, a
   2E2C 67            [ 4]  139 	ld	h,a
   2E2D 79            [ 4]  140 	ld	a,c
   2E2E 95            [ 4]  141 	sub	a, l
   2E2F 6F            [ 4]  142 	ld	l,a
   2E30 78            [ 4]  143 	ld	a,b
   2E31 9C            [ 4]  144 	sbc	a, h
   2E32 67            [ 4]  145 	ld	h,a
   2E33 AF            [ 4]  146 	xor	a, a
   2E34 BD            [ 4]  147 	cp	a, l
   2E35 9C            [ 4]  148 	sbc	a, h
   2E36 E2 3B 2E      [10]  149 	jp	PO, 00185$
   2E39 EE 80         [ 7]  150 	xor	a, #0x80
   2E3B                     151 00185$:
   2E3B F2 45 2E      [10]  152 	jp	P,00102$
                            153 ;src/entities/user.c:50: user.y = user.y - user.vy;
   2E3E 7B            [ 4]  154 	ld	a,e
   2E3F 92            [ 4]  155 	sub	a, d
   2E40 32 D6 47      [13]  156 	ld	(#(_user + 0x0007)),a
   2E43 18 05         [12]  157 	jr	00105$
   2E45                     158 00102$:
                            159 ;src/entities/user.c:52: user.y = 0;
   2E45 21 D6 47      [10]  160 	ld	hl,#(_user + 0x0007)
   2E48 36 00         [10]  161 	ld	(hl),#0x00
   2E4A                     162 00105$:
                            163 ;src/entities/user.c:55: if ((cpct_isKeyPressed(Key_P))){ 
   2E4A 21 03 08      [10]  164 	ld	hl,#0x0803
   2E4D E5            [11]  165 	push	hl
   2E4E CD 63 40      [17]  166 	call	_cpct_isKeyPressed
   2E51 F1            [10]  167 	pop	af
   2E52 7D            [ 4]  168 	ld	a,l
   2E53 B7            [ 4]  169 	or	a, a
   2E54 28 3F         [12]  170 	jr	Z,00110$
                            171 ;src/entities/user.c:56: if ((user.x+user.vx<(79-user.w)))
   2E56 21 D5 47      [10]  172 	ld	hl, #(_user + 0x0006) + 0
   2E59 5E            [ 7]  173 	ld	e,(hl)
   2E5A 4B            [ 4]  174 	ld	c,e
   2E5B 06 00         [ 7]  175 	ld	b,#0x00
   2E5D 21 DD 47      [10]  176 	ld	hl, #_user + 14
   2E60 56            [ 7]  177 	ld	d,(hl)
   2E61 7A            [ 4]  178 	ld	a,d
   2E62 6F            [ 4]  179 	ld	l,a
   2E63 17            [ 4]  180 	rla
   2E64 9F            [ 4]  181 	sbc	a, a
   2E65 67            [ 4]  182 	ld	h,a
   2E66 09            [11]  183 	add	hl,bc
   2E67 4D            [ 4]  184 	ld	c,l
   2E68 44            [ 4]  185 	ld	b,h
   2E69 3A D7 47      [13]  186 	ld	a,(#_user + 8)
   2E6C DD 77 FF      [19]  187 	ld	-1 (ix), a
   2E6F 6F            [ 4]  188 	ld	l, a
   2E70 26 00         [ 7]  189 	ld	h,#0x00
   2E72 3E 4F         [ 7]  190 	ld	a,#0x4F
   2E74 95            [ 4]  191 	sub	a, l
   2E75 6F            [ 4]  192 	ld	l,a
   2E76 3E 00         [ 7]  193 	ld	a,#0x00
   2E78 9C            [ 4]  194 	sbc	a, h
   2E79 67            [ 4]  195 	ld	h,a
   2E7A 79            [ 4]  196 	ld	a,c
   2E7B 95            [ 4]  197 	sub	a, l
   2E7C 78            [ 4]  198 	ld	a,b
   2E7D 9C            [ 4]  199 	sbc	a, h
   2E7E E2 83 2E      [10]  200 	jp	PO, 00186$
   2E81 EE 80         [ 7]  201 	xor	a, #0x80
   2E83                     202 00186$:
   2E83 F2 8D 2E      [10]  203 	jp	P,00107$
                            204 ;src/entities/user.c:57: user.x = user.x + user.vx;
   2E86 7B            [ 4]  205 	ld	a,e
   2E87 82            [ 4]  206 	add	a, d
   2E88 32 D5 47      [13]  207 	ld	(#(_user + 0x0006)),a
   2E8B 18 08         [12]  208 	jr	00110$
   2E8D                     209 00107$:
                            210 ;src/entities/user.c:59: user.x = 79-user.w;
   2E8D 3E 4F         [ 7]  211 	ld	a,#0x4F
   2E8F DD 96 FF      [19]  212 	sub	a, -1 (ix)
   2E92 32 D5 47      [13]  213 	ld	(#(_user + 0x0006)),a
   2E95                     214 00110$:
                            215 ;src/entities/user.c:62: if (cpct_isKeyPressed(Key_O)){
   2E95 21 04 04      [10]  216 	ld	hl,#0x0404
   2E98 E5            [11]  217 	push	hl
   2E99 CD 63 40      [17]  218 	call	_cpct_isKeyPressed
   2E9C F1            [10]  219 	pop	af
   2E9D 7D            [ 4]  220 	ld	a,l
   2E9E B7            [ 4]  221 	or	a, a
   2E9F 28 2D         [12]  222 	jr	Z,00115$
                            223 ;src/entities/user.c:63: if ((user.x-user.vx)>0) 
   2EA1 21 D5 47      [10]  224 	ld	hl, #(_user + 0x0006) + 0
   2EA4 5E            [ 7]  225 	ld	e,(hl)
   2EA5 4B            [ 4]  226 	ld	c,e
   2EA6 06 00         [ 7]  227 	ld	b,#0x00
   2EA8 21 DD 47      [10]  228 	ld	hl, #_user + 14
   2EAB 56            [ 7]  229 	ld	d,(hl)
   2EAC 7A            [ 4]  230 	ld	a,d
   2EAD 6F            [ 4]  231 	ld	l,a
   2EAE 17            [ 4]  232 	rla
   2EAF 9F            [ 4]  233 	sbc	a, a
   2EB0 67            [ 4]  234 	ld	h,a
   2EB1 79            [ 4]  235 	ld	a,c
   2EB2 95            [ 4]  236 	sub	a, l
   2EB3 6F            [ 4]  237 	ld	l,a
   2EB4 78            [ 4]  238 	ld	a,b
   2EB5 9C            [ 4]  239 	sbc	a, h
   2EB6 67            [ 4]  240 	ld	h,a
   2EB7 AF            [ 4]  241 	xor	a, a
   2EB8 BD            [ 4]  242 	cp	a, l
   2EB9 9C            [ 4]  243 	sbc	a, h
   2EBA E2 BF 2E      [10]  244 	jp	PO, 00187$
   2EBD EE 80         [ 7]  245 	xor	a, #0x80
   2EBF                     246 00187$:
   2EBF F2 C9 2E      [10]  247 	jp	P,00112$
                            248 ;src/entities/user.c:64: user.x = user.x - user.vx;    
   2EC2 7B            [ 4]  249 	ld	a,e
   2EC3 92            [ 4]  250 	sub	a, d
   2EC4 32 D5 47      [13]  251 	ld	(#(_user + 0x0006)),a
   2EC7 18 05         [12]  252 	jr	00115$
   2EC9                     253 00112$:
                            254 ;src/entities/user.c:66: user.x = 0;
   2EC9 21 D5 47      [10]  255 	ld	hl,#(_user + 0x0006)
   2ECC 36 00         [10]  256 	ld	(hl),#0x00
   2ECE                     257 00115$:
                            258 ;src/entities/user.c:69: if (cpct_isKeyPressed(Key_A)){
   2ECE 21 08 20      [10]  259 	ld	hl,#0x2008
   2ED1 E5            [11]  260 	push	hl
   2ED2 CD 63 40      [17]  261 	call	_cpct_isKeyPressed
   2ED5 F1            [10]  262 	pop	af
   2ED6 7D            [ 4]  263 	ld	a,l
   2ED7 B7            [ 4]  264 	or	a, a
   2ED8 28 37         [12]  265 	jr	Z,00120$
                            266 ;src/entities/user.c:70: if ((user.y<(199-user.h) ))
   2EDA 21 D6 47      [10]  267 	ld	hl, #(_user + 0x0007) + 0
   2EDD 5E            [ 7]  268 	ld	e,(hl)
   2EDE 3A D8 47      [13]  269 	ld	a,(#_user + 9)
   2EE1 DD 77 FF      [19]  270 	ld	-1 (ix), a
   2EE4 6F            [ 4]  271 	ld	l, a
   2EE5 26 00         [ 7]  272 	ld	h,#0x00
   2EE7 3E C7         [ 7]  273 	ld	a,#0xC7
   2EE9 95            [ 4]  274 	sub	a, l
   2EEA 6F            [ 4]  275 	ld	l,a
   2EEB 3E 00         [ 7]  276 	ld	a,#0x00
   2EED 9C            [ 4]  277 	sbc	a, h
   2EEE 67            [ 4]  278 	ld	h,a
   2EEF 4B            [ 4]  279 	ld	c,e
   2EF0 16 00         [ 7]  280 	ld	d,#0x00
   2EF2 79            [ 4]  281 	ld	a,c
   2EF3 95            [ 4]  282 	sub	a, l
   2EF4 7A            [ 4]  283 	ld	a,d
   2EF5 9C            [ 4]  284 	sbc	a, h
   2EF6 E2 FB 2E      [10]  285 	jp	PO, 00188$
   2EF9 EE 80         [ 7]  286 	xor	a, #0x80
   2EFB                     287 00188$:
   2EFB F2 09 2F      [10]  288 	jp	P,00117$
                            289 ;src/entities/user.c:71: user.y = user.y + user.vy;
   2EFE 21 DE 47      [10]  290 	ld	hl, #_user + 15
   2F01 6E            [ 7]  291 	ld	l,(hl)
   2F02 7B            [ 4]  292 	ld	a,e
   2F03 85            [ 4]  293 	add	a, l
   2F04 32 D6 47      [13]  294 	ld	(#(_user + 0x0007)),a
   2F07 18 08         [12]  295 	jr	00120$
   2F09                     296 00117$:
                            297 ;src/entities/user.c:73: user.y = 199-user.h;
   2F09 3E C7         [ 7]  298 	ld	a,#0xC7
   2F0B DD 96 FF      [19]  299 	sub	a, -1 (ix)
   2F0E 32 D6 47      [13]  300 	ld	(#(_user + 0x0007)),a
   2F11                     301 00120$:
                            302 ;src/entities/user.c:76: if (cpct_isKeyPressed(Key_D)){
   2F11 21 07 20      [10]  303 	ld	hl,#0x2007
   2F14 E5            [11]  304 	push	hl
   2F15 CD 63 40      [17]  305 	call	_cpct_isKeyPressed
   2F18 F1            [10]  306 	pop	af
   2F19 7D            [ 4]  307 	ld	a,l
   2F1A B7            [ 4]  308 	or	a, a
   2F1B 28 1B         [12]  309 	jr	Z,00122$
                            310 ;src/entities/user.c:77: shoot_type=(shoot_type+1)%2;
   2F1D FD 21 E1 47   [14]  311 	ld	iy,#_shoot_type
   2F21 FD 6E 00      [19]  312 	ld	l,0 (iy)
   2F24 26 00         [ 7]  313 	ld	h,#0x00
   2F26 23            [ 6]  314 	inc	hl
   2F27 01 02 00      [10]  315 	ld	bc,#0x0002
   2F2A C5            [11]  316 	push	bc
   2F2B E5            [11]  317 	push	hl
   2F2C CD AC 43      [17]  318 	call	__modsint
   2F2F F1            [10]  319 	pop	af
   2F30 F1            [10]  320 	pop	af
   2F31 FD 21 E1 47   [14]  321 	ld	iy,#_shoot_type
   2F35 FD 75 00      [19]  322 	ld	0 (iy),l
   2F38                     323 00122$:
                            324 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_H)){
   2F38 21 05 10      [10]  325 	ld	hl,#0x1005
   2F3B E5            [11]  326 	push	hl
   2F3C CD 63 40      [17]  327 	call	_cpct_isKeyPressed
   2F3F F1            [10]  328 	pop	af
   2F40 7D            [ 4]  329 	ld	a,l
   2F41 B7            [ 4]  330 	or	a, a
   2F42 28 39         [12]  331 	jr	Z,00124$
                            332 ;src/entities/user.c:81: create_enemy((rand()%80),(rand()%199),(rand()%2));
   2F44 CD 02 41      [17]  333 	call	_rand
   2F47 01 02 00      [10]  334 	ld	bc,#0x0002
   2F4A C5            [11]  335 	push	bc
   2F4B E5            [11]  336 	push	hl
   2F4C CD AC 43      [17]  337 	call	__modsint
   2F4F F1            [10]  338 	pop	af
   2F50 F1            [10]  339 	pop	af
   2F51 DD 75 FF      [19]  340 	ld	-1 (ix),l
   2F54 CD 02 41      [17]  341 	call	_rand
   2F57 01 C7 00      [10]  342 	ld	bc,#0x00C7
   2F5A C5            [11]  343 	push	bc
   2F5B E5            [11]  344 	push	hl
   2F5C CD AC 43      [17]  345 	call	__modsint
   2F5F F1            [10]  346 	pop	af
   2F60 E3            [19]  347 	ex	(sp),hl
   2F61 CD 02 41      [17]  348 	call	_rand
   2F64 11 50 00      [10]  349 	ld	de,#0x0050
   2F67 D5            [11]  350 	push	de
   2F68 E5            [11]  351 	push	hl
   2F69 CD AC 43      [17]  352 	call	__modsint
   2F6C F1            [10]  353 	pop	af
   2F6D F1            [10]  354 	pop	af
   2F6E EB            [ 4]  355 	ex	de,hl
   2F6F C1            [10]  356 	pop	bc
   2F70 DD 7E FF      [19]  357 	ld	a,-1 (ix)
   2F73 F5            [11]  358 	push	af
   2F74 33            [ 6]  359 	inc	sp
   2F75 C5            [11]  360 	push	bc
   2F76 D5            [11]  361 	push	de
   2F77 CD 38 23      [17]  362 	call	_create_enemy
   2F7A F1            [10]  363 	pop	af
   2F7B F1            [10]  364 	pop	af
   2F7C 33            [ 6]  365 	inc	sp
   2F7D                     366 00124$:
                            367 ;src/entities/user.c:83: if (cpct_isKeyPressed(Key_J)){
   2F7D 21 05 20      [10]  368 	ld	hl,#0x2005
   2F80 E5            [11]  369 	push	hl
   2F81 CD 63 40      [17]  370 	call	_cpct_isKeyPressed
   2F84 F1            [10]  371 	pop	af
   2F85 7D            [ 4]  372 	ld	a,l
   2F86 B7            [ 4]  373 	or	a, a
   2F87 CA 42 30      [10]  374 	jp	Z,00126$
                            375 ;src/entities/user.c:84: x=rand()%80;
   2F8A CD 02 41      [17]  376 	call	_rand
   2F8D 01 50 00      [10]  377 	ld	bc,#0x0050
   2F90 C5            [11]  378 	push	bc
   2F91 E5            [11]  379 	push	hl
   2F92 CD AC 43      [17]  380 	call	__modsint
   2F95 F1            [10]  381 	pop	af
   2F96 F1            [10]  382 	pop	af
   2F97 DD 75 FC      [19]  383 	ld	-4 (ix),l
                            384 ;src/entities/user.c:85: y=rand()%199;
   2F9A CD 02 41      [17]  385 	call	_rand
   2F9D 01 C7 00      [10]  386 	ld	bc,#0x00C7
   2FA0 C5            [11]  387 	push	bc
   2FA1 E5            [11]  388 	push	hl
   2FA2 CD AC 43      [17]  389 	call	__modsint
   2FA5 F1            [10]  390 	pop	af
   2FA6 F1            [10]  391 	pop	af
   2FA7 4D            [ 4]  392 	ld	c,l
                            393 ;src/entities/user.c:86: create_enemy(x,y,(rand()%2));
   2FA8 C5            [11]  394 	push	bc
   2FA9 CD 02 41      [17]  395 	call	_rand
   2FAC 11 02 00      [10]  396 	ld	de,#0x0002
   2FAF D5            [11]  397 	push	de
   2FB0 E5            [11]  398 	push	hl
   2FB1 CD AC 43      [17]  399 	call	__modsint
   2FB4 F1            [10]  400 	pop	af
   2FB5 F1            [10]  401 	pop	af
   2FB6 C1            [10]  402 	pop	bc
   2FB7 5D            [ 4]  403 	ld	e,l
   2FB8 DD 71 FD      [19]  404 	ld	-3 (ix),c
   2FBB DD 36 FE 00   [19]  405 	ld	-2 (ix),#0x00
   2FBF DD 4E FC      [19]  406 	ld	c,-4 (ix)
   2FC2 06 00         [ 7]  407 	ld	b,#0x00
   2FC4 C5            [11]  408 	push	bc
   2FC5 7B            [ 4]  409 	ld	a,e
   2FC6 F5            [11]  410 	push	af
   2FC7 33            [ 6]  411 	inc	sp
   2FC8 DD 6E FD      [19]  412 	ld	l,-3 (ix)
   2FCB DD 66 FE      [19]  413 	ld	h,-2 (ix)
   2FCE E5            [11]  414 	push	hl
   2FCF C5            [11]  415 	push	bc
   2FD0 CD 38 23      [17]  416 	call	_create_enemy
   2FD3 F1            [10]  417 	pop	af
   2FD4 F1            [10]  418 	pop	af
   2FD5 33            [ 6]  419 	inc	sp
   2FD6 CD 02 41      [17]  420 	call	_rand
   2FD9 11 02 00      [10]  421 	ld	de,#0x0002
   2FDC D5            [11]  422 	push	de
   2FDD E5            [11]  423 	push	hl
   2FDE CD AC 43      [17]  424 	call	__modsint
   2FE1 F1            [10]  425 	pop	af
   2FE2 F1            [10]  426 	pop	af
   2FE3 C1            [10]  427 	pop	bc
   2FE4 5D            [ 4]  428 	ld	e,l
   2FE5 21 08 00      [10]  429 	ld	hl,#0x0008
   2FE8 09            [11]  430 	add	hl,bc
   2FE9 C5            [11]  431 	push	bc
   2FEA 7B            [ 4]  432 	ld	a,e
   2FEB F5            [11]  433 	push	af
   2FEC 33            [ 6]  434 	inc	sp
   2FED DD 5E FD      [19]  435 	ld	e,-3 (ix)
   2FF0 DD 56 FE      [19]  436 	ld	d,-2 (ix)
   2FF3 D5            [11]  437 	push	de
   2FF4 E5            [11]  438 	push	hl
   2FF5 CD 38 23      [17]  439 	call	_create_enemy
   2FF8 F1            [10]  440 	pop	af
   2FF9 F1            [10]  441 	pop	af
   2FFA 33            [ 6]  442 	inc	sp
   2FFB CD 02 41      [17]  443 	call	_rand
   2FFE 11 02 00      [10]  444 	ld	de,#0x0002
   3001 D5            [11]  445 	push	de
   3002 E5            [11]  446 	push	hl
   3003 CD AC 43      [17]  447 	call	__modsint
   3006 F1            [10]  448 	pop	af
   3007 F1            [10]  449 	pop	af
   3008 C1            [10]  450 	pop	bc
   3009 5D            [ 4]  451 	ld	e,l
   300A 21 10 00      [10]  452 	ld	hl,#0x0010
   300D 09            [11]  453 	add	hl,bc
   300E C5            [11]  454 	push	bc
   300F 7B            [ 4]  455 	ld	a,e
   3010 F5            [11]  456 	push	af
   3011 33            [ 6]  457 	inc	sp
   3012 DD 5E FD      [19]  458 	ld	e,-3 (ix)
   3015 DD 56 FE      [19]  459 	ld	d,-2 (ix)
   3018 D5            [11]  460 	push	de
   3019 E5            [11]  461 	push	hl
   301A CD 38 23      [17]  462 	call	_create_enemy
   301D F1            [10]  463 	pop	af
   301E F1            [10]  464 	pop	af
   301F 33            [ 6]  465 	inc	sp
   3020 CD 02 41      [17]  466 	call	_rand
   3023 11 02 00      [10]  467 	ld	de,#0x0002
   3026 D5            [11]  468 	push	de
   3027 E5            [11]  469 	push	hl
   3028 CD AC 43      [17]  470 	call	__modsint
   302B F1            [10]  471 	pop	af
   302C F1            [10]  472 	pop	af
   302D C1            [10]  473 	pop	bc
   302E 5D            [ 4]  474 	ld	e,l
   302F 21 18 00      [10]  475 	ld	hl,#0x0018
   3032 09            [11]  476 	add	hl,bc
   3033 7B            [ 4]  477 	ld	a,e
   3034 F5            [11]  478 	push	af
   3035 33            [ 6]  479 	inc	sp
   3036 D1            [10]  480 	pop	de
   3037 C1            [10]  481 	pop	bc
   3038 C5            [11]  482 	push	bc
   3039 D5            [11]  483 	push	de
   303A C5            [11]  484 	push	bc
   303B E5            [11]  485 	push	hl
   303C CD 38 23      [17]  486 	call	_create_enemy
   303F F1            [10]  487 	pop	af
   3040 F1            [10]  488 	pop	af
   3041 33            [ 6]  489 	inc	sp
   3042                     490 00126$:
                            491 ;src/entities/user.c:91: if (cpct_isKeyPressed(Key_K)){
   3042 21 04 20      [10]  492 	ld	hl,#0x2004
   3045 E5            [11]  493 	push	hl
   3046 CD 63 40      [17]  494 	call	_cpct_isKeyPressed
   3049 F1            [10]  495 	pop	af
   304A 7D            [ 4]  496 	ld	a,l
   304B B7            [ 4]  497 	or	a, a
   304C 28 2A         [12]  498 	jr	Z,00128$
                            499 ;src/entities/user.c:92: create_enemy_group((rand()%80),(rand()%199),0,4);
   304E CD 02 41      [17]  500 	call	_rand
   3051 01 C7 00      [10]  501 	ld	bc,#0x00C7
   3054 C5            [11]  502 	push	bc
   3055 E5            [11]  503 	push	hl
   3056 CD AC 43      [17]  504 	call	__modsint
   3059 F1            [10]  505 	pop	af
   305A E3            [19]  506 	ex	(sp),hl
   305B CD 02 41      [17]  507 	call	_rand
   305E 11 50 00      [10]  508 	ld	de,#0x0050
   3061 D5            [11]  509 	push	de
   3062 E5            [11]  510 	push	hl
   3063 CD AC 43      [17]  511 	call	__modsint
   3066 F1            [10]  512 	pop	af
   3067 F1            [10]  513 	pop	af
   3068 EB            [ 4]  514 	ex	de,hl
   3069 C1            [10]  515 	pop	bc
   306A 21 00 04      [10]  516 	ld	hl,#0x0400
   306D E5            [11]  517 	push	hl
   306E C5            [11]  518 	push	bc
   306F D5            [11]  519 	push	de
   3070 CD C8 25      [17]  520 	call	_create_enemy_group
   3073 21 06 00      [10]  521 	ld	hl,#6
   3076 39            [11]  522 	add	hl,sp
   3077 F9            [ 6]  523 	ld	sp,hl
   3078                     524 00128$:
                            525 ;src/entities/user.c:95: if (cpct_isKeyPressed(Key_Space)){
   3078 21 05 80      [10]  526 	ld	hl,#0x8005
   307B E5            [11]  527 	push	hl
   307C CD 63 40      [17]  528 	call	_cpct_isKeyPressed
   307F F1            [10]  529 	pop	af
   3080 7D            [ 4]  530 	ld	a,l
   3081 B7            [ 4]  531 	or	a, a
   3082 28 1B         [12]  532 	jr	Z,00131$
                            533 ;src/entities/user.c:96: create_shoot(user.x+3, user.y-1, shoot_type);
   3084 3A D6 47      [13]  534 	ld	a, (#_user + 7)
   3087 5F            [ 4]  535 	ld	e,a
   3088 1D            [ 4]  536 	dec	e
   3089 3A D5 47      [13]  537 	ld	a, (#_user + 6)
   308C 57            [ 4]  538 	ld	d,a
   308D 14            [ 4]  539 	inc	d
   308E 14            [ 4]  540 	inc	d
   308F 14            [ 4]  541 	inc	d
   3090 3A E1 47      [13]  542 	ld	a,(_shoot_type)
   3093 F5            [11]  543 	push	af
   3094 33            [ 6]  544 	inc	sp
   3095 7B            [ 4]  545 	ld	a,e
   3096 F5            [11]  546 	push	af
   3097 33            [ 6]  547 	inc	sp
   3098 D5            [11]  548 	push	de
   3099 33            [ 6]  549 	inc	sp
   309A CD E6 2A      [17]  550 	call	_create_shoot
   309D F1            [10]  551 	pop	af
   309E 33            [ 6]  552 	inc	sp
   309F                     553 00131$:
   309F DD F9         [10]  554 	ld	sp, ix
   30A1 DD E1         [14]  555 	pop	ix
   30A3 C9            [10]  556 	ret
                            557 ;src/entities/user.c:101: void draw_user(u8* screen){
                            558 ;	---------------------------------
                            559 ; Function draw_user
                            560 ; ---------------------------------
   30A4                     561 _draw_user::
   30A4 DD E5         [15]  562 	push	ix
   30A6 DD 21 00 00   [14]  563 	ld	ix,#0
   30AA DD 39         [15]  564 	add	ix,sp
                            565 ;src/entities/user.c:103: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   30AC 21 D6 47      [10]  566 	ld	hl, #_user + 7
   30AF 4E            [ 7]  567 	ld	c,(hl)
   30B0 21 D5 47      [10]  568 	ld	hl, #_user + 6
   30B3 66            [ 7]  569 	ld	h,(hl)
   30B4 DD 5E 04      [19]  570 	ld	e,4 (ix)
   30B7 DD 56 05      [19]  571 	ld	d,5 (ix)
   30BA 79            [ 4]  572 	ld	a,c
   30BB F5            [11]  573 	push	af
   30BC 33            [ 6]  574 	inc	sp
   30BD E5            [11]  575 	push	hl
   30BE 33            [ 6]  576 	inc	sp
   30BF D5            [11]  577 	push	de
   30C0 CD B8 43      [17]  578 	call	_cpct_getScreenPtr
   30C3 F1            [10]  579 	pop	af
   30C4 F1            [10]  580 	pop	af
   30C5 EB            [ 4]  581 	ex	de,hl
                            582 ;src/entities/user.c:104: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   30C6 21 D8 47      [10]  583 	ld	hl, #_user + 9
   30C9 4E            [ 7]  584 	ld	c,(hl)
   30CA 21 D7 47      [10]  585 	ld	hl, #_user + 8
   30CD 46            [ 7]  586 	ld	b,(hl)
   30CE 2A D3 47      [16]  587 	ld	hl, (#_user + 4)
   30D1 E5            [11]  588 	push	hl
   30D2 FD E1         [14]  589 	pop	iy
   30D4 79            [ 4]  590 	ld	a,c
   30D5 F5            [11]  591 	push	af
   30D6 33            [ 6]  592 	inc	sp
   30D7 C5            [11]  593 	push	bc
   30D8 33            [ 6]  594 	inc	sp
   30D9 D5            [11]  595 	push	de
   30DA FD E5         [15]  596 	push	iy
   30DC CD 89 41      [17]  597 	call	_cpct_drawSprite
   30DF 21 06 00      [10]  598 	ld	hl,#6
   30E2 39            [11]  599 	add	hl,sp
   30E3 F9            [ 6]  600 	ld	sp,hl
   30E4 DD E1         [14]  601 	pop	ix
   30E6 C9            [10]  602 	ret
                            603 	.area _CODE
                            604 	.area _INITIALIZER
                            605 	.area _CABS (ABS)
