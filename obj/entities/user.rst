                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul  6 15:49:38 2015
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
   47DD                      33 _user::
   47DD                      34 	.ds 18
   47EF                      35 _shoot_type::
   47EF                      36 	.ds 1
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
   2DD0                      65 _init_user::
                             66 ;src/entities/user.c:18: user.w = 6;
   2DD0 21 E5 47      [10]   67 	ld	hl,#_user + 8
   2DD3 36 06         [10]   68 	ld	(hl),#0x06
                             69 ;src/entities/user.c:19: user.h = 16;
   2DD5 FD 21 E6 47   [14]   70 	ld	iy,#_user + 9
   2DD9 FD 36 00 10   [19]   71 	ld	0 (iy), #0x10
                             72 ;src/entities/user.c:20: user.x = 39-(user.w/2);
   2DDD 6E            [ 7]   73 	ld	l,(hl)
   2DDE CB 3D         [ 8]   74 	srl	l
   2DE0 3E 27         [ 7]   75 	ld	a,#0x27
   2DE2 95            [ 4]   76 	sub	a, l
   2DE3 32 E3 47      [13]   77 	ld	(#(_user + 0x0006)),a
                             78 ;src/entities/user.c:21: user.y = 199-(user.h);
   2DE6 FD 66 00      [19]   79 	ld	h, 0 (iy)
   2DE9 3E C7         [ 7]   80 	ld	a,#0xC7
   2DEB 94            [ 4]   81 	sub	a, h
   2DEC 32 E4 47      [13]   82 	ld	(#(_user + 0x0007)),a
                             83 ;src/entities/user.c:22: user.sprite = (u8*) ship03;
   2DEF 21 CC 38      [10]   84 	ld	hl,#_ship03
   2DF2 22 E1 47      [16]   85 	ld	((_user + 0x0004)), hl
                             86 ;src/entities/user.c:24: user.vx = 2;
   2DF5 21 EB 47      [10]   87 	ld	hl,#_user + 14
   2DF8 36 02         [10]   88 	ld	(hl),#0x02
                             89 ;src/entities/user.c:25: user.vy = 4;
   2DFA 21 EC 47      [10]   90 	ld	hl,#_user + 15
   2DFD 36 04         [10]   91 	ld	(hl),#0x04
                             92 ;src/entities/user.c:26: user.max_shoots = 10;
   2DFF 21 EE 47      [10]   93 	ld	hl,#_user + 17
   2E02 36 0A         [10]   94 	ld	(hl),#0x0A
                             95 ;src/entities/user.c:27: shoot_type = 1;
   2E04 21 EF 47      [10]   96 	ld	hl,#_shoot_type + 0
   2E07 36 01         [10]   97 	ld	(hl), #0x01
   2E09 C9            [10]   98 	ret
                             99 ;src/entities/user.c:30: u8 get_user_max_shoots(){
                            100 ;	---------------------------------
                            101 ; Function get_user_max_shoots
                            102 ; ---------------------------------
   2E0A                     103 _get_user_max_shoots::
                            104 ;src/entities/user.c:31: return user.max_shoots;
   2E0A 21 EE 47      [10]  105 	ld	hl,#_user+17
   2E0D 6E            [ 7]  106 	ld	l,(hl)
   2E0E C9            [10]  107 	ret
                            108 ;src/entities/user.c:37: void update_user() {
                            109 ;	---------------------------------
                            110 ; Function update_user
                            111 ; ---------------------------------
   2E0F                     112 _update_user::
   2E0F DD E5         [15]  113 	push	ix
   2E11 DD 21 00 00   [14]  114 	ld	ix,#0
   2E15 DD 39         [15]  115 	add	ix,sp
   2E17 F5            [11]  116 	push	af
   2E18 3B            [ 6]  117 	dec	sp
                            118 ;src/entities/user.c:41: cpct_scanKeyboard_f();
   2E19 CD 82 40      [17]  119 	call	_cpct_scanKeyboard_f
                            120 ;src/entities/user.c:48: if ((cpct_isKeyPressed(Key_Q))){ 
   2E1C 21 08 08      [10]  121 	ld	hl,#0x0808
   2E1F E5            [11]  122 	push	hl
   2E20 CD 71 40      [17]  123 	call	_cpct_isKeyPressed
   2E23 F1            [10]  124 	pop	af
   2E24 7D            [ 4]  125 	ld	a,l
   2E25 B7            [ 4]  126 	or	a, a
   2E26 28 2D         [12]  127 	jr	Z,00105$
                            128 ;src/entities/user.c:49: if ((user.y-user.vy)>0)
   2E28 21 E4 47      [10]  129 	ld	hl, #(_user + 0x0007) + 0
   2E2B 5E            [ 7]  130 	ld	e,(hl)
   2E2C 4B            [ 4]  131 	ld	c,e
   2E2D 06 00         [ 7]  132 	ld	b,#0x00
   2E2F 21 EC 47      [10]  133 	ld	hl, #_user + 15
   2E32 56            [ 7]  134 	ld	d,(hl)
   2E33 7A            [ 4]  135 	ld	a,d
   2E34 6F            [ 4]  136 	ld	l,a
   2E35 17            [ 4]  137 	rla
   2E36 9F            [ 4]  138 	sbc	a, a
   2E37 67            [ 4]  139 	ld	h,a
   2E38 79            [ 4]  140 	ld	a,c
   2E39 95            [ 4]  141 	sub	a, l
   2E3A 6F            [ 4]  142 	ld	l,a
   2E3B 78            [ 4]  143 	ld	a,b
   2E3C 9C            [ 4]  144 	sbc	a, h
   2E3D 67            [ 4]  145 	ld	h,a
   2E3E AF            [ 4]  146 	xor	a, a
   2E3F BD            [ 4]  147 	cp	a, l
   2E40 9C            [ 4]  148 	sbc	a, h
   2E41 E2 46 2E      [10]  149 	jp	PO, 00185$
   2E44 EE 80         [ 7]  150 	xor	a, #0x80
   2E46                     151 00185$:
   2E46 F2 50 2E      [10]  152 	jp	P,00102$
                            153 ;src/entities/user.c:50: user.y = user.y - user.vy;
   2E49 7B            [ 4]  154 	ld	a,e
   2E4A 92            [ 4]  155 	sub	a, d
   2E4B 32 E4 47      [13]  156 	ld	(#(_user + 0x0007)),a
   2E4E 18 05         [12]  157 	jr	00105$
   2E50                     158 00102$:
                            159 ;src/entities/user.c:52: user.y = 0;
   2E50 21 E4 47      [10]  160 	ld	hl,#(_user + 0x0007)
   2E53 36 00         [10]  161 	ld	(hl),#0x00
   2E55                     162 00105$:
                            163 ;src/entities/user.c:55: if ((cpct_isKeyPressed(Key_P))){ 
   2E55 21 03 08      [10]  164 	ld	hl,#0x0803
   2E58 E5            [11]  165 	push	hl
   2E59 CD 71 40      [17]  166 	call	_cpct_isKeyPressed
   2E5C F1            [10]  167 	pop	af
   2E5D 7D            [ 4]  168 	ld	a,l
   2E5E B7            [ 4]  169 	or	a, a
   2E5F 28 3F         [12]  170 	jr	Z,00110$
                            171 ;src/entities/user.c:56: if ((user.x+user.vx<(79-user.w)))
   2E61 21 E3 47      [10]  172 	ld	hl, #(_user + 0x0006) + 0
   2E64 5E            [ 7]  173 	ld	e,(hl)
   2E65 4B            [ 4]  174 	ld	c,e
   2E66 06 00         [ 7]  175 	ld	b,#0x00
   2E68 21 EB 47      [10]  176 	ld	hl, #_user + 14
   2E6B 56            [ 7]  177 	ld	d,(hl)
   2E6C 7A            [ 4]  178 	ld	a,d
   2E6D 6F            [ 4]  179 	ld	l,a
   2E6E 17            [ 4]  180 	rla
   2E6F 9F            [ 4]  181 	sbc	a, a
   2E70 67            [ 4]  182 	ld	h,a
   2E71 09            [11]  183 	add	hl,bc
   2E72 4D            [ 4]  184 	ld	c,l
   2E73 44            [ 4]  185 	ld	b,h
   2E74 3A E5 47      [13]  186 	ld	a,(#_user + 8)
   2E77 DD 77 FF      [19]  187 	ld	-1 (ix), a
   2E7A 6F            [ 4]  188 	ld	l, a
   2E7B 26 00         [ 7]  189 	ld	h,#0x00
   2E7D 3E 4F         [ 7]  190 	ld	a,#0x4F
   2E7F 95            [ 4]  191 	sub	a, l
   2E80 6F            [ 4]  192 	ld	l,a
   2E81 3E 00         [ 7]  193 	ld	a,#0x00
   2E83 9C            [ 4]  194 	sbc	a, h
   2E84 67            [ 4]  195 	ld	h,a
   2E85 79            [ 4]  196 	ld	a,c
   2E86 95            [ 4]  197 	sub	a, l
   2E87 78            [ 4]  198 	ld	a,b
   2E88 9C            [ 4]  199 	sbc	a, h
   2E89 E2 8E 2E      [10]  200 	jp	PO, 00186$
   2E8C EE 80         [ 7]  201 	xor	a, #0x80
   2E8E                     202 00186$:
   2E8E F2 98 2E      [10]  203 	jp	P,00107$
                            204 ;src/entities/user.c:57: user.x = user.x + user.vx;
   2E91 7B            [ 4]  205 	ld	a,e
   2E92 82            [ 4]  206 	add	a, d
   2E93 32 E3 47      [13]  207 	ld	(#(_user + 0x0006)),a
   2E96 18 08         [12]  208 	jr	00110$
   2E98                     209 00107$:
                            210 ;src/entities/user.c:59: user.x = 79-user.w;
   2E98 3E 4F         [ 7]  211 	ld	a,#0x4F
   2E9A DD 96 FF      [19]  212 	sub	a, -1 (ix)
   2E9D 32 E3 47      [13]  213 	ld	(#(_user + 0x0006)),a
   2EA0                     214 00110$:
                            215 ;src/entities/user.c:62: if (cpct_isKeyPressed(Key_O)){
   2EA0 21 04 04      [10]  216 	ld	hl,#0x0404
   2EA3 E5            [11]  217 	push	hl
   2EA4 CD 71 40      [17]  218 	call	_cpct_isKeyPressed
   2EA7 F1            [10]  219 	pop	af
   2EA8 7D            [ 4]  220 	ld	a,l
   2EA9 B7            [ 4]  221 	or	a, a
   2EAA 28 2D         [12]  222 	jr	Z,00115$
                            223 ;src/entities/user.c:63: if ((user.x-user.vx)>0) 
   2EAC 21 E3 47      [10]  224 	ld	hl, #(_user + 0x0006) + 0
   2EAF 5E            [ 7]  225 	ld	e,(hl)
   2EB0 4B            [ 4]  226 	ld	c,e
   2EB1 06 00         [ 7]  227 	ld	b,#0x00
   2EB3 21 EB 47      [10]  228 	ld	hl, #_user + 14
   2EB6 56            [ 7]  229 	ld	d,(hl)
   2EB7 7A            [ 4]  230 	ld	a,d
   2EB8 6F            [ 4]  231 	ld	l,a
   2EB9 17            [ 4]  232 	rla
   2EBA 9F            [ 4]  233 	sbc	a, a
   2EBB 67            [ 4]  234 	ld	h,a
   2EBC 79            [ 4]  235 	ld	a,c
   2EBD 95            [ 4]  236 	sub	a, l
   2EBE 6F            [ 4]  237 	ld	l,a
   2EBF 78            [ 4]  238 	ld	a,b
   2EC0 9C            [ 4]  239 	sbc	a, h
   2EC1 67            [ 4]  240 	ld	h,a
   2EC2 AF            [ 4]  241 	xor	a, a
   2EC3 BD            [ 4]  242 	cp	a, l
   2EC4 9C            [ 4]  243 	sbc	a, h
   2EC5 E2 CA 2E      [10]  244 	jp	PO, 00187$
   2EC8 EE 80         [ 7]  245 	xor	a, #0x80
   2ECA                     246 00187$:
   2ECA F2 D4 2E      [10]  247 	jp	P,00112$
                            248 ;src/entities/user.c:64: user.x = user.x - user.vx;    
   2ECD 7B            [ 4]  249 	ld	a,e
   2ECE 92            [ 4]  250 	sub	a, d
   2ECF 32 E3 47      [13]  251 	ld	(#(_user + 0x0006)),a
   2ED2 18 05         [12]  252 	jr	00115$
   2ED4                     253 00112$:
                            254 ;src/entities/user.c:66: user.x = 0;
   2ED4 21 E3 47      [10]  255 	ld	hl,#(_user + 0x0006)
   2ED7 36 00         [10]  256 	ld	(hl),#0x00
   2ED9                     257 00115$:
                            258 ;src/entities/user.c:69: if (cpct_isKeyPressed(Key_A)){
   2ED9 21 08 20      [10]  259 	ld	hl,#0x2008
   2EDC E5            [11]  260 	push	hl
   2EDD CD 71 40      [17]  261 	call	_cpct_isKeyPressed
   2EE0 F1            [10]  262 	pop	af
   2EE1 7D            [ 4]  263 	ld	a,l
   2EE2 B7            [ 4]  264 	or	a, a
   2EE3 28 37         [12]  265 	jr	Z,00120$
                            266 ;src/entities/user.c:70: if ((user.y<(199-user.h) ))
   2EE5 21 E4 47      [10]  267 	ld	hl, #(_user + 0x0007) + 0
   2EE8 5E            [ 7]  268 	ld	e,(hl)
   2EE9 3A E6 47      [13]  269 	ld	a,(#_user + 9)
   2EEC DD 77 FF      [19]  270 	ld	-1 (ix), a
   2EEF 6F            [ 4]  271 	ld	l, a
   2EF0 26 00         [ 7]  272 	ld	h,#0x00
   2EF2 3E C7         [ 7]  273 	ld	a,#0xC7
   2EF4 95            [ 4]  274 	sub	a, l
   2EF5 6F            [ 4]  275 	ld	l,a
   2EF6 3E 00         [ 7]  276 	ld	a,#0x00
   2EF8 9C            [ 4]  277 	sbc	a, h
   2EF9 67            [ 4]  278 	ld	h,a
   2EFA 4B            [ 4]  279 	ld	c,e
   2EFB 16 00         [ 7]  280 	ld	d,#0x00
   2EFD 79            [ 4]  281 	ld	a,c
   2EFE 95            [ 4]  282 	sub	a, l
   2EFF 7A            [ 4]  283 	ld	a,d
   2F00 9C            [ 4]  284 	sbc	a, h
   2F01 E2 06 2F      [10]  285 	jp	PO, 00188$
   2F04 EE 80         [ 7]  286 	xor	a, #0x80
   2F06                     287 00188$:
   2F06 F2 14 2F      [10]  288 	jp	P,00117$
                            289 ;src/entities/user.c:71: user.y = user.y + user.vy;
   2F09 21 EC 47      [10]  290 	ld	hl, #_user + 15
   2F0C 6E            [ 7]  291 	ld	l,(hl)
   2F0D 7B            [ 4]  292 	ld	a,e
   2F0E 85            [ 4]  293 	add	a, l
   2F0F 32 E4 47      [13]  294 	ld	(#(_user + 0x0007)),a
   2F12 18 08         [12]  295 	jr	00120$
   2F14                     296 00117$:
                            297 ;src/entities/user.c:73: user.y = 199-user.h;
   2F14 3E C7         [ 7]  298 	ld	a,#0xC7
   2F16 DD 96 FF      [19]  299 	sub	a, -1 (ix)
   2F19 32 E4 47      [13]  300 	ld	(#(_user + 0x0007)),a
   2F1C                     301 00120$:
                            302 ;src/entities/user.c:76: if (cpct_isKeyPressed(Key_D)){
   2F1C 21 07 20      [10]  303 	ld	hl,#0x2007
   2F1F E5            [11]  304 	push	hl
   2F20 CD 71 40      [17]  305 	call	_cpct_isKeyPressed
   2F23 F1            [10]  306 	pop	af
   2F24 7D            [ 4]  307 	ld	a,l
   2F25 B7            [ 4]  308 	or	a, a
   2F26 28 1B         [12]  309 	jr	Z,00122$
                            310 ;src/entities/user.c:77: shoot_type=(shoot_type+1)%2;
   2F28 FD 21 EF 47   [14]  311 	ld	iy,#_shoot_type
   2F2C FD 6E 00      [19]  312 	ld	l,0 (iy)
   2F2F 26 00         [ 7]  313 	ld	h,#0x00
   2F31 23            [ 6]  314 	inc	hl
   2F32 01 02 00      [10]  315 	ld	bc,#0x0002
   2F35 C5            [11]  316 	push	bc
   2F36 E5            [11]  317 	push	hl
   2F37 CD BA 43      [17]  318 	call	__modsint
   2F3A F1            [10]  319 	pop	af
   2F3B F1            [10]  320 	pop	af
   2F3C FD 21 EF 47   [14]  321 	ld	iy,#_shoot_type
   2F40 FD 75 00      [19]  322 	ld	0 (iy),l
   2F43                     323 00122$:
                            324 ;src/entities/user.c:80: if (cpct_isKeyPressed(Key_H)){
   2F43 21 05 10      [10]  325 	ld	hl,#0x1005
   2F46 E5            [11]  326 	push	hl
   2F47 CD 71 40      [17]  327 	call	_cpct_isKeyPressed
   2F4A F1            [10]  328 	pop	af
   2F4B 7D            [ 4]  329 	ld	a,l
   2F4C B7            [ 4]  330 	or	a, a
   2F4D 28 3D         [12]  331 	jr	Z,00124$
                            332 ;src/entities/user.c:81: create_enemy((rand()%80),(rand()%199),(rand()%2));
   2F4F CD 10 41      [17]  333 	call	_rand
   2F52 01 02 00      [10]  334 	ld	bc,#0x0002
   2F55 C5            [11]  335 	push	bc
   2F56 E5            [11]  336 	push	hl
   2F57 CD BA 43      [17]  337 	call	__modsint
   2F5A F1            [10]  338 	pop	af
   2F5B F1            [10]  339 	pop	af
   2F5C DD 75 FF      [19]  340 	ld	-1 (ix),l
   2F5F CD 10 41      [17]  341 	call	_rand
   2F62 01 C7 00      [10]  342 	ld	bc,#0x00C7
   2F65 C5            [11]  343 	push	bc
   2F66 E5            [11]  344 	push	hl
   2F67 CD BA 43      [17]  345 	call	__modsint
   2F6A F1            [10]  346 	pop	af
   2F6B F1            [10]  347 	pop	af
   2F6C 5D            [ 4]  348 	ld	e,l
   2F6D D5            [11]  349 	push	de
   2F6E CD 10 41      [17]  350 	call	_rand
   2F71 01 50 00      [10]  351 	ld	bc,#0x0050
   2F74 C5            [11]  352 	push	bc
   2F75 E5            [11]  353 	push	hl
   2F76 CD BA 43      [17]  354 	call	__modsint
   2F79 F1            [10]  355 	pop	af
   2F7A F1            [10]  356 	pop	af
   2F7B D1            [10]  357 	pop	de
   2F7C 55            [ 4]  358 	ld	d,l
   2F7D DD 7E FF      [19]  359 	ld	a,-1 (ix)
   2F80 F5            [11]  360 	push	af
   2F81 33            [ 6]  361 	inc	sp
   2F82 7B            [ 4]  362 	ld	a,e
   2F83 F5            [11]  363 	push	af
   2F84 33            [ 6]  364 	inc	sp
   2F85 D5            [11]  365 	push	de
   2F86 33            [ 6]  366 	inc	sp
   2F87 CD 38 23      [17]  367 	call	_create_enemy
   2F8A F1            [10]  368 	pop	af
   2F8B 33            [ 6]  369 	inc	sp
   2F8C                     370 00124$:
                            371 ;src/entities/user.c:83: if (cpct_isKeyPressed(Key_J)){
   2F8C 21 05 20      [10]  372 	ld	hl,#0x2005
   2F8F E5            [11]  373 	push	hl
   2F90 CD 71 40      [17]  374 	call	_cpct_isKeyPressed
   2F93 F1            [10]  375 	pop	af
   2F94 7D            [ 4]  376 	ld	a,l
   2F95 B7            [ 4]  377 	or	a, a
   2F96 CA 3B 30      [10]  378 	jp	Z,00126$
                            379 ;src/entities/user.c:84: x=rand()%80;
   2F99 CD 10 41      [17]  380 	call	_rand
   2F9C 01 50 00      [10]  381 	ld	bc,#0x0050
   2F9F C5            [11]  382 	push	bc
   2FA0 E5            [11]  383 	push	hl
   2FA1 CD BA 43      [17]  384 	call	__modsint
   2FA4 F1            [10]  385 	pop	af
   2FA5 F1            [10]  386 	pop	af
   2FA6 DD 75 FE      [19]  387 	ld	-2 (ix),l
                            388 ;src/entities/user.c:85: y=rand()%199;
   2FA9 CD 10 41      [17]  389 	call	_rand
   2FAC 01 C7 00      [10]  390 	ld	bc,#0x00C7
   2FAF C5            [11]  391 	push	bc
   2FB0 E5            [11]  392 	push	hl
   2FB1 CD BA 43      [17]  393 	call	__modsint
   2FB4 F1            [10]  394 	pop	af
   2FB5 F1            [10]  395 	pop	af
   2FB6 DD 75 FD      [19]  396 	ld	-3 (ix),l
                            397 ;src/entities/user.c:86: create_enemy(x,y,(rand()%2));
   2FB9 CD 10 41      [17]  398 	call	_rand
   2FBC 01 02 00      [10]  399 	ld	bc,#0x0002
   2FBF C5            [11]  400 	push	bc
   2FC0 E5            [11]  401 	push	hl
   2FC1 CD BA 43      [17]  402 	call	__modsint
   2FC4 F1            [10]  403 	pop	af
   2FC5 F1            [10]  404 	pop	af
   2FC6 65            [ 4]  405 	ld	h,l
   2FC7 E5            [11]  406 	push	hl
   2FC8 33            [ 6]  407 	inc	sp
   2FC9 DD 66 FD      [19]  408 	ld	h,-3 (ix)
   2FCC DD 6E FE      [19]  409 	ld	l,-2 (ix)
   2FCF E5            [11]  410 	push	hl
   2FD0 CD 38 23      [17]  411 	call	_create_enemy
   2FD3 F1            [10]  412 	pop	af
   2FD4 33            [ 6]  413 	inc	sp
                            414 ;src/entities/user.c:87: create_enemy(x+8,y,(rand()%2));
   2FD5 CD 10 41      [17]  415 	call	_rand
   2FD8 01 02 00      [10]  416 	ld	bc,#0x0002
   2FDB C5            [11]  417 	push	bc
   2FDC E5            [11]  418 	push	hl
   2FDD CD BA 43      [17]  419 	call	__modsint
   2FE0 F1            [10]  420 	pop	af
   2FE1 F1            [10]  421 	pop	af
   2FE2 65            [ 4]  422 	ld	h,l
   2FE3 DD 7E FE      [19]  423 	ld	a,-2 (ix)
   2FE6 C6 08         [ 7]  424 	add	a, #0x08
   2FE8 57            [ 4]  425 	ld	d,a
   2FE9 E5            [11]  426 	push	hl
   2FEA 33            [ 6]  427 	inc	sp
   2FEB DD 7E FD      [19]  428 	ld	a,-3 (ix)
   2FEE F5            [11]  429 	push	af
   2FEF 33            [ 6]  430 	inc	sp
   2FF0 D5            [11]  431 	push	de
   2FF1 33            [ 6]  432 	inc	sp
   2FF2 CD 38 23      [17]  433 	call	_create_enemy
   2FF5 F1            [10]  434 	pop	af
   2FF6 33            [ 6]  435 	inc	sp
                            436 ;src/entities/user.c:88: create_enemy(x+16,y,(rand()%2));
   2FF7 CD 10 41      [17]  437 	call	_rand
   2FFA 01 02 00      [10]  438 	ld	bc,#0x0002
   2FFD C5            [11]  439 	push	bc
   2FFE E5            [11]  440 	push	hl
   2FFF CD BA 43      [17]  441 	call	__modsint
   3002 F1            [10]  442 	pop	af
   3003 F1            [10]  443 	pop	af
   3004 65            [ 4]  444 	ld	h,l
   3005 DD 7E FE      [19]  445 	ld	a,-2 (ix)
   3008 C6 10         [ 7]  446 	add	a, #0x10
   300A 57            [ 4]  447 	ld	d,a
   300B E5            [11]  448 	push	hl
   300C 33            [ 6]  449 	inc	sp
   300D DD 7E FD      [19]  450 	ld	a,-3 (ix)
   3010 F5            [11]  451 	push	af
   3011 33            [ 6]  452 	inc	sp
   3012 D5            [11]  453 	push	de
   3013 33            [ 6]  454 	inc	sp
   3014 CD 38 23      [17]  455 	call	_create_enemy
   3017 F1            [10]  456 	pop	af
   3018 33            [ 6]  457 	inc	sp
                            458 ;src/entities/user.c:89: create_enemy(x+24,y,(rand()%2));
   3019 CD 10 41      [17]  459 	call	_rand
   301C 01 02 00      [10]  460 	ld	bc,#0x0002
   301F C5            [11]  461 	push	bc
   3020 E5            [11]  462 	push	hl
   3021 CD BA 43      [17]  463 	call	__modsint
   3024 F1            [10]  464 	pop	af
   3025 F1            [10]  465 	pop	af
   3026 65            [ 4]  466 	ld	h,l
   3027 DD 7E FE      [19]  467 	ld	a,-2 (ix)
   302A C6 18         [ 7]  468 	add	a, #0x18
   302C 57            [ 4]  469 	ld	d,a
   302D E5            [11]  470 	push	hl
   302E 33            [ 6]  471 	inc	sp
   302F DD 7E FD      [19]  472 	ld	a,-3 (ix)
   3032 F5            [11]  473 	push	af
   3033 33            [ 6]  474 	inc	sp
   3034 D5            [11]  475 	push	de
   3035 33            [ 6]  476 	inc	sp
   3036 CD 38 23      [17]  477 	call	_create_enemy
   3039 F1            [10]  478 	pop	af
   303A 33            [ 6]  479 	inc	sp
   303B                     480 00126$:
                            481 ;src/entities/user.c:91: if (cpct_isKeyPressed(Key_K)){
   303B 21 04 20      [10]  482 	ld	hl,#0x2004
   303E E5            [11]  483 	push	hl
   303F CD 71 40      [17]  484 	call	_cpct_isKeyPressed
   3042 F1            [10]  485 	pop	af
   3043 7D            [ 4]  486 	ld	a,l
   3044 B7            [ 4]  487 	or	a, a
   3045 28 3F         [12]  488 	jr	Z,00128$
                            489 ;src/entities/user.c:92: create_enemy_group((rand()%80),(rand()%199),(rand()%2),4);
   3047 CD 10 41      [17]  490 	call	_rand
   304A 01 02 00      [10]  491 	ld	bc,#0x0002
   304D C5            [11]  492 	push	bc
   304E E5            [11]  493 	push	hl
   304F CD BA 43      [17]  494 	call	__modsint
   3052 F1            [10]  495 	pop	af
   3053 F1            [10]  496 	pop	af
   3054 DD 75 FF      [19]  497 	ld	-1 (ix),l
   3057 CD 10 41      [17]  498 	call	_rand
   305A 01 C7 00      [10]  499 	ld	bc,#0x00C7
   305D C5            [11]  500 	push	bc
   305E E5            [11]  501 	push	hl
   305F CD BA 43      [17]  502 	call	__modsint
   3062 F1            [10]  503 	pop	af
   3063 E3            [19]  504 	ex	(sp),hl
   3064 CD 10 41      [17]  505 	call	_rand
   3067 11 50 00      [10]  506 	ld	de,#0x0050
   306A D5            [11]  507 	push	de
   306B E5            [11]  508 	push	hl
   306C CD BA 43      [17]  509 	call	__modsint
   306F F1            [10]  510 	pop	af
   3070 F1            [10]  511 	pop	af
   3071 EB            [ 4]  512 	ex	de,hl
   3072 C1            [10]  513 	pop	bc
   3073 3E 04         [ 7]  514 	ld	a,#0x04
   3075 F5            [11]  515 	push	af
   3076 33            [ 6]  516 	inc	sp
   3077 DD 7E FF      [19]  517 	ld	a,-1 (ix)
   307A F5            [11]  518 	push	af
   307B 33            [ 6]  519 	inc	sp
   307C C5            [11]  520 	push	bc
   307D D5            [11]  521 	push	de
   307E CD DC 25      [17]  522 	call	_create_enemy_group
   3081 21 06 00      [10]  523 	ld	hl,#6
   3084 39            [11]  524 	add	hl,sp
   3085 F9            [ 6]  525 	ld	sp,hl
   3086                     526 00128$:
                            527 ;src/entities/user.c:95: if (cpct_isKeyPressed(Key_Space)){
   3086 21 05 80      [10]  528 	ld	hl,#0x8005
   3089 E5            [11]  529 	push	hl
   308A CD 71 40      [17]  530 	call	_cpct_isKeyPressed
   308D F1            [10]  531 	pop	af
   308E 7D            [ 4]  532 	ld	a,l
   308F B7            [ 4]  533 	or	a, a
   3090 28 1B         [12]  534 	jr	Z,00131$
                            535 ;src/entities/user.c:96: create_shoot(user.x+3, user.y-1, shoot_type);
   3092 3A E4 47      [13]  536 	ld	a, (#_user + 7)
   3095 5F            [ 4]  537 	ld	e,a
   3096 1D            [ 4]  538 	dec	e
   3097 3A E3 47      [13]  539 	ld	a, (#_user + 6)
   309A 57            [ 4]  540 	ld	d,a
   309B 14            [ 4]  541 	inc	d
   309C 14            [ 4]  542 	inc	d
   309D 14            [ 4]  543 	inc	d
   309E 3A EF 47      [13]  544 	ld	a,(_shoot_type)
   30A1 F5            [11]  545 	push	af
   30A2 33            [ 6]  546 	inc	sp
   30A3 7B            [ 4]  547 	ld	a,e
   30A4 F5            [11]  548 	push	af
   30A5 33            [ 6]  549 	inc	sp
   30A6 D5            [11]  550 	push	de
   30A7 33            [ 6]  551 	inc	sp
   30A8 CD F1 2A      [17]  552 	call	_create_shoot
   30AB F1            [10]  553 	pop	af
   30AC 33            [ 6]  554 	inc	sp
   30AD                     555 00131$:
   30AD DD F9         [10]  556 	ld	sp, ix
   30AF DD E1         [14]  557 	pop	ix
   30B1 C9            [10]  558 	ret
                            559 ;src/entities/user.c:101: void draw_user(u8* screen){
                            560 ;	---------------------------------
                            561 ; Function draw_user
                            562 ; ---------------------------------
   30B2                     563 _draw_user::
   30B2 DD E5         [15]  564 	push	ix
   30B4 DD 21 00 00   [14]  565 	ld	ix,#0
   30B8 DD 39         [15]  566 	add	ix,sp
                            567 ;src/entities/user.c:103: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   30BA 21 E4 47      [10]  568 	ld	hl, #_user + 7
   30BD 4E            [ 7]  569 	ld	c,(hl)
   30BE 21 E3 47      [10]  570 	ld	hl, #_user + 6
   30C1 66            [ 7]  571 	ld	h,(hl)
   30C2 DD 5E 04      [19]  572 	ld	e,4 (ix)
   30C5 DD 56 05      [19]  573 	ld	d,5 (ix)
   30C8 79            [ 4]  574 	ld	a,c
   30C9 F5            [11]  575 	push	af
   30CA 33            [ 6]  576 	inc	sp
   30CB E5            [11]  577 	push	hl
   30CC 33            [ 6]  578 	inc	sp
   30CD D5            [11]  579 	push	de
   30CE CD C6 43      [17]  580 	call	_cpct_getScreenPtr
   30D1 F1            [10]  581 	pop	af
   30D2 F1            [10]  582 	pop	af
   30D3 EB            [ 4]  583 	ex	de,hl
                            584 ;src/entities/user.c:104: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   30D4 21 E6 47      [10]  585 	ld	hl, #_user + 9
   30D7 4E            [ 7]  586 	ld	c,(hl)
   30D8 21 E5 47      [10]  587 	ld	hl, #_user + 8
   30DB 46            [ 7]  588 	ld	b,(hl)
   30DC 2A E1 47      [16]  589 	ld	hl, (#_user + 4)
   30DF E5            [11]  590 	push	hl
   30E0 FD E1         [14]  591 	pop	iy
   30E2 79            [ 4]  592 	ld	a,c
   30E3 F5            [11]  593 	push	af
   30E4 33            [ 6]  594 	inc	sp
   30E5 C5            [11]  595 	push	bc
   30E6 33            [ 6]  596 	inc	sp
   30E7 D5            [11]  597 	push	de
   30E8 FD E5         [15]  598 	push	iy
   30EA CD 97 41      [17]  599 	call	_cpct_drawSprite
   30ED 21 06 00      [10]  600 	ld	hl,#6
   30F0 39            [11]  601 	add	hl,sp
   30F1 F9            [ 6]  602 	ld	sp,hl
   30F2 DD E1         [14]  603 	pop	ix
   30F4 C9            [10]  604 	ret
                            605 	.area _CODE
                            606 	.area _INITIALIZER
                            607 	.area _CABS (ABS)
