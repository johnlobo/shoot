                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jul  5 16:23:35 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_enemy
                             13 	.globl _create_shoot
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_drawSprite
                             16 	.globl _cpct_isKeyPressed
                             17 	.globl _cpct_scanKeyboard_f
                             18 	.globl _rand
                             19 	.globl _shoot_type
                             20 	.globl _user
                             21 	.globl _init_user
                             22 	.globl _get_user_max_shoots
                             23 	.globl _update_user
                             24 	.globl _draw_user
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
   44C0                      32 _user::
   44C0                      33 	.ds 18
   44D2                      34 _shoot_type::
   44D2                      35 	.ds 1
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _INITIALIZED
                             40 ;--------------------------------------------------------
                             41 ; absolute external ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DABS (ABS)
                             44 ;--------------------------------------------------------
                             45 ; global & static initialisations
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _GSINIT
                             49 	.area _GSFINAL
                             50 	.area _GSINIT
                             51 ;--------------------------------------------------------
                             52 ; Home
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _HOME
                             56 ;--------------------------------------------------------
                             57 ; code
                             58 ;--------------------------------------------------------
                             59 	.area _CODE
                             60 ;src/entities/user.c:9: void init_user(){
                             61 ;	---------------------------------
                             62 ; Function init_user
                             63 ; ---------------------------------
   2BF2                      64 _init_user::
                             65 ;src/entities/user.c:18: user.w = 6;
   2BF2 21 C8 44      [10]   66 	ld	hl,#_user + 8
   2BF5 36 06         [10]   67 	ld	(hl),#0x06
                             68 ;src/entities/user.c:19: user.h = 16;
   2BF7 FD 21 C9 44   [14]   69 	ld	iy,#_user + 9
   2BFB FD 36 00 10   [19]   70 	ld	0 (iy), #0x10
                             71 ;src/entities/user.c:20: user.x = 39-(user.w/2);
   2BFF 6E            [ 7]   72 	ld	l,(hl)
   2C00 CB 3D         [ 8]   73 	srl	l
   2C02 3E 27         [ 7]   74 	ld	a,#0x27
   2C04 95            [ 4]   75 	sub	a, l
   2C05 32 C6 44      [13]   76 	ld	(#(_user + 0x0006)),a
                             77 ;src/entities/user.c:21: user.y = 199-(user.h);
   2C08 FD 66 00      [19]   78 	ld	h, 0 (iy)
   2C0B 3E C7         [ 7]   79 	ld	a,#0xC7
   2C0D 94            [ 4]   80 	sub	a, h
   2C0E 32 C7 44      [13]   81 	ld	(#(_user + 0x0007)),a
                             82 ;src/entities/user.c:22: user.sprite = (u8*) ship03;
   2C11 21 F2 35      [10]   83 	ld	hl,#_ship03
   2C14 22 C4 44      [16]   84 	ld	((_user + 0x0004)), hl
                             85 ;src/entities/user.c:24: user.vx = 2;
   2C17 21 CE 44      [10]   86 	ld	hl,#_user + 14
   2C1A 36 02         [10]   87 	ld	(hl),#0x02
                             88 ;src/entities/user.c:25: user.vy = 4;
   2C1C 21 CF 44      [10]   89 	ld	hl,#_user + 15
   2C1F 36 04         [10]   90 	ld	(hl),#0x04
                             91 ;src/entities/user.c:26: user.max_shoots = 10;
   2C21 21 D1 44      [10]   92 	ld	hl,#_user + 17
   2C24 36 0A         [10]   93 	ld	(hl),#0x0A
                             94 ;src/entities/user.c:27: shoot_type = 1;
   2C26 21 D2 44      [10]   95 	ld	hl,#_shoot_type + 0
   2C29 36 01         [10]   96 	ld	(hl), #0x01
   2C2B C9            [10]   97 	ret
                             98 ;src/entities/user.c:30: u8 get_user_max_shoots(){
                             99 ;	---------------------------------
                            100 ; Function get_user_max_shoots
                            101 ; ---------------------------------
   2C2C                     102 _get_user_max_shoots::
                            103 ;src/entities/user.c:31: return user.max_shoots;
   2C2C 21 D1 44      [10]  104 	ld	hl,#_user+17
   2C2F 6E            [ 7]  105 	ld	l,(hl)
   2C30 C9            [10]  106 	ret
                            107 ;src/entities/user.c:37: void update_user() {
                            108 ;	---------------------------------
                            109 ; Function update_user
                            110 ; ---------------------------------
   2C31                     111 _update_user::
   2C31 DD E5         [15]  112 	push	ix
   2C33 DD 21 00 00   [14]  113 	ld	ix,#0
   2C37 DD 39         [15]  114 	add	ix,sp
   2C39 3B            [ 6]  115 	dec	sp
                            116 ;src/entities/user.c:40: cpct_scanKeyboard_f();
   2C3A CD A8 3D      [17]  117 	call	_cpct_scanKeyboard_f
                            118 ;src/entities/user.c:47: if ((cpct_isKeyPressed(Key_Q))){ 
   2C3D 21 08 08      [10]  119 	ld	hl,#0x0808
   2C40 E5            [11]  120 	push	hl
   2C41 CD 97 3D      [17]  121 	call	_cpct_isKeyPressed
   2C44 F1            [10]  122 	pop	af
   2C45 7D            [ 4]  123 	ld	a,l
   2C46 B7            [ 4]  124 	or	a, a
   2C47 28 2D         [12]  125 	jr	Z,00105$
                            126 ;src/entities/user.c:48: if ((user.y-user.vy)>0)
   2C49 21 C7 44      [10]  127 	ld	hl, #(_user + 0x0007) + 0
   2C4C 5E            [ 7]  128 	ld	e,(hl)
   2C4D 4B            [ 4]  129 	ld	c,e
   2C4E 06 00         [ 7]  130 	ld	b,#0x00
   2C50 21 CF 44      [10]  131 	ld	hl, #_user + 15
   2C53 56            [ 7]  132 	ld	d,(hl)
   2C54 7A            [ 4]  133 	ld	a,d
   2C55 6F            [ 4]  134 	ld	l,a
   2C56 17            [ 4]  135 	rla
   2C57 9F            [ 4]  136 	sbc	a, a
   2C58 67            [ 4]  137 	ld	h,a
   2C59 79            [ 4]  138 	ld	a,c
   2C5A 95            [ 4]  139 	sub	a, l
   2C5B 6F            [ 4]  140 	ld	l,a
   2C5C 78            [ 4]  141 	ld	a,b
   2C5D 9C            [ 4]  142 	sbc	a, h
   2C5E 67            [ 4]  143 	ld	h,a
   2C5F AF            [ 4]  144 	xor	a, a
   2C60 BD            [ 4]  145 	cp	a, l
   2C61 9C            [ 4]  146 	sbc	a, h
   2C62 E2 67 2C      [10]  147 	jp	PO, 00173$
   2C65 EE 80         [ 7]  148 	xor	a, #0x80
   2C67                     149 00173$:
   2C67 F2 71 2C      [10]  150 	jp	P,00102$
                            151 ;src/entities/user.c:49: user.y = user.y - user.vy;
   2C6A 7B            [ 4]  152 	ld	a,e
   2C6B 92            [ 4]  153 	sub	a, d
   2C6C 32 C7 44      [13]  154 	ld	(#(_user + 0x0007)),a
   2C6F 18 05         [12]  155 	jr	00105$
   2C71                     156 00102$:
                            157 ;src/entities/user.c:51: user.y = 0;
   2C71 21 C7 44      [10]  158 	ld	hl,#(_user + 0x0007)
   2C74 36 00         [10]  159 	ld	(hl),#0x00
   2C76                     160 00105$:
                            161 ;src/entities/user.c:54: if ((cpct_isKeyPressed(Key_P))){ 
   2C76 21 03 08      [10]  162 	ld	hl,#0x0803
   2C79 E5            [11]  163 	push	hl
   2C7A CD 97 3D      [17]  164 	call	_cpct_isKeyPressed
   2C7D F1            [10]  165 	pop	af
   2C7E 7D            [ 4]  166 	ld	a,l
   2C7F B7            [ 4]  167 	or	a, a
   2C80 28 3F         [12]  168 	jr	Z,00110$
                            169 ;src/entities/user.c:55: if ((user.x+user.vx<(79-user.w)))
   2C82 21 C6 44      [10]  170 	ld	hl, #(_user + 0x0006) + 0
   2C85 5E            [ 7]  171 	ld	e,(hl)
   2C86 4B            [ 4]  172 	ld	c,e
   2C87 06 00         [ 7]  173 	ld	b,#0x00
   2C89 21 CE 44      [10]  174 	ld	hl, #_user + 14
   2C8C 56            [ 7]  175 	ld	d,(hl)
   2C8D 7A            [ 4]  176 	ld	a,d
   2C8E 6F            [ 4]  177 	ld	l,a
   2C8F 17            [ 4]  178 	rla
   2C90 9F            [ 4]  179 	sbc	a, a
   2C91 67            [ 4]  180 	ld	h,a
   2C92 09            [11]  181 	add	hl,bc
   2C93 4D            [ 4]  182 	ld	c,l
   2C94 44            [ 4]  183 	ld	b,h
   2C95 3A C8 44      [13]  184 	ld	a,(#_user + 8)
   2C98 DD 77 FF      [19]  185 	ld	-1 (ix), a
   2C9B 6F            [ 4]  186 	ld	l, a
   2C9C 26 00         [ 7]  187 	ld	h,#0x00
   2C9E 3E 4F         [ 7]  188 	ld	a,#0x4F
   2CA0 95            [ 4]  189 	sub	a, l
   2CA1 6F            [ 4]  190 	ld	l,a
   2CA2 3E 00         [ 7]  191 	ld	a,#0x00
   2CA4 9C            [ 4]  192 	sbc	a, h
   2CA5 67            [ 4]  193 	ld	h,a
   2CA6 79            [ 4]  194 	ld	a,c
   2CA7 95            [ 4]  195 	sub	a, l
   2CA8 78            [ 4]  196 	ld	a,b
   2CA9 9C            [ 4]  197 	sbc	a, h
   2CAA E2 AF 2C      [10]  198 	jp	PO, 00174$
   2CAD EE 80         [ 7]  199 	xor	a, #0x80
   2CAF                     200 00174$:
   2CAF F2 B9 2C      [10]  201 	jp	P,00107$
                            202 ;src/entities/user.c:56: user.x = user.x + user.vx;
   2CB2 7B            [ 4]  203 	ld	a,e
   2CB3 82            [ 4]  204 	add	a, d
   2CB4 32 C6 44      [13]  205 	ld	(#(_user + 0x0006)),a
   2CB7 18 08         [12]  206 	jr	00110$
   2CB9                     207 00107$:
                            208 ;src/entities/user.c:58: user.x = 79-user.w;
   2CB9 3E 4F         [ 7]  209 	ld	a,#0x4F
   2CBB DD 96 FF      [19]  210 	sub	a, -1 (ix)
   2CBE 32 C6 44      [13]  211 	ld	(#(_user + 0x0006)),a
   2CC1                     212 00110$:
                            213 ;src/entities/user.c:61: if (cpct_isKeyPressed(Key_O)){
   2CC1 21 04 04      [10]  214 	ld	hl,#0x0404
   2CC4 E5            [11]  215 	push	hl
   2CC5 CD 97 3D      [17]  216 	call	_cpct_isKeyPressed
   2CC8 F1            [10]  217 	pop	af
   2CC9 7D            [ 4]  218 	ld	a,l
   2CCA B7            [ 4]  219 	or	a, a
   2CCB 28 2D         [12]  220 	jr	Z,00115$
                            221 ;src/entities/user.c:62: if ((user.x-user.vx)>0) 
   2CCD 21 C6 44      [10]  222 	ld	hl, #(_user + 0x0006) + 0
   2CD0 5E            [ 7]  223 	ld	e,(hl)
   2CD1 4B            [ 4]  224 	ld	c,e
   2CD2 06 00         [ 7]  225 	ld	b,#0x00
   2CD4 21 CE 44      [10]  226 	ld	hl, #_user + 14
   2CD7 56            [ 7]  227 	ld	d,(hl)
   2CD8 7A            [ 4]  228 	ld	a,d
   2CD9 6F            [ 4]  229 	ld	l,a
   2CDA 17            [ 4]  230 	rla
   2CDB 9F            [ 4]  231 	sbc	a, a
   2CDC 67            [ 4]  232 	ld	h,a
   2CDD 79            [ 4]  233 	ld	a,c
   2CDE 95            [ 4]  234 	sub	a, l
   2CDF 6F            [ 4]  235 	ld	l,a
   2CE0 78            [ 4]  236 	ld	a,b
   2CE1 9C            [ 4]  237 	sbc	a, h
   2CE2 67            [ 4]  238 	ld	h,a
   2CE3 AF            [ 4]  239 	xor	a, a
   2CE4 BD            [ 4]  240 	cp	a, l
   2CE5 9C            [ 4]  241 	sbc	a, h
   2CE6 E2 EB 2C      [10]  242 	jp	PO, 00175$
   2CE9 EE 80         [ 7]  243 	xor	a, #0x80
   2CEB                     244 00175$:
   2CEB F2 F5 2C      [10]  245 	jp	P,00112$
                            246 ;src/entities/user.c:63: user.x = user.x - user.vx;    
   2CEE 7B            [ 4]  247 	ld	a,e
   2CEF 92            [ 4]  248 	sub	a, d
   2CF0 32 C6 44      [13]  249 	ld	(#(_user + 0x0006)),a
   2CF3 18 05         [12]  250 	jr	00115$
   2CF5                     251 00112$:
                            252 ;src/entities/user.c:65: user.x = 0;
   2CF5 21 C6 44      [10]  253 	ld	hl,#(_user + 0x0006)
   2CF8 36 00         [10]  254 	ld	(hl),#0x00
   2CFA                     255 00115$:
                            256 ;src/entities/user.c:68: if (cpct_isKeyPressed(Key_A)){
   2CFA 21 08 20      [10]  257 	ld	hl,#0x2008
   2CFD E5            [11]  258 	push	hl
   2CFE CD 97 3D      [17]  259 	call	_cpct_isKeyPressed
   2D01 F1            [10]  260 	pop	af
   2D02 7D            [ 4]  261 	ld	a,l
   2D03 B7            [ 4]  262 	or	a, a
   2D04 28 37         [12]  263 	jr	Z,00120$
                            264 ;src/entities/user.c:69: if ((user.y<(199-user.h) ))
   2D06 21 C7 44      [10]  265 	ld	hl, #(_user + 0x0007) + 0
   2D09 5E            [ 7]  266 	ld	e,(hl)
   2D0A 3A C9 44      [13]  267 	ld	a,(#_user + 9)
   2D0D DD 77 FF      [19]  268 	ld	-1 (ix), a
   2D10 6F            [ 4]  269 	ld	l, a
   2D11 26 00         [ 7]  270 	ld	h,#0x00
   2D13 3E C7         [ 7]  271 	ld	a,#0xC7
   2D15 95            [ 4]  272 	sub	a, l
   2D16 6F            [ 4]  273 	ld	l,a
   2D17 3E 00         [ 7]  274 	ld	a,#0x00
   2D19 9C            [ 4]  275 	sbc	a, h
   2D1A 67            [ 4]  276 	ld	h,a
   2D1B 4B            [ 4]  277 	ld	c,e
   2D1C 16 00         [ 7]  278 	ld	d,#0x00
   2D1E 79            [ 4]  279 	ld	a,c
   2D1F 95            [ 4]  280 	sub	a, l
   2D20 7A            [ 4]  281 	ld	a,d
   2D21 9C            [ 4]  282 	sbc	a, h
   2D22 E2 27 2D      [10]  283 	jp	PO, 00176$
   2D25 EE 80         [ 7]  284 	xor	a, #0x80
   2D27                     285 00176$:
   2D27 F2 35 2D      [10]  286 	jp	P,00117$
                            287 ;src/entities/user.c:70: user.y = user.y + user.vy;
   2D2A 21 CF 44      [10]  288 	ld	hl, #_user + 15
   2D2D 6E            [ 7]  289 	ld	l,(hl)
   2D2E 7B            [ 4]  290 	ld	a,e
   2D2F 85            [ 4]  291 	add	a, l
   2D30 32 C7 44      [13]  292 	ld	(#(_user + 0x0007)),a
   2D33 18 08         [12]  293 	jr	00120$
   2D35                     294 00117$:
                            295 ;src/entities/user.c:72: user.y = 199-user.h;
   2D35 3E C7         [ 7]  296 	ld	a,#0xC7
   2D37 DD 96 FF      [19]  297 	sub	a, -1 (ix)
   2D3A 32 C7 44      [13]  298 	ld	(#(_user + 0x0007)),a
   2D3D                     299 00120$:
                            300 ;src/entities/user.c:75: if (cpct_isKeyPressed(Key_D)){
   2D3D 21 07 20      [10]  301 	ld	hl,#0x2007
   2D40 E5            [11]  302 	push	hl
   2D41 CD 97 3D      [17]  303 	call	_cpct_isKeyPressed
   2D44 F1            [10]  304 	pop	af
   2D45 7D            [ 4]  305 	ld	a,l
   2D46 B7            [ 4]  306 	or	a, a
   2D47 28 1B         [12]  307 	jr	Z,00122$
                            308 ;src/entities/user.c:76: shoot_type=(shoot_type+1)%2;
   2D49 FD 21 D2 44   [14]  309 	ld	iy,#_shoot_type
   2D4D FD 6E 00      [19]  310 	ld	l,0 (iy)
   2D50 26 00         [ 7]  311 	ld	h,#0x00
   2D52 23            [ 6]  312 	inc	hl
   2D53 01 02 00      [10]  313 	ld	bc,#0x0002
   2D56 C5            [11]  314 	push	bc
   2D57 E5            [11]  315 	push	hl
   2D58 CD E0 40      [17]  316 	call	__modsint
   2D5B F1            [10]  317 	pop	af
   2D5C F1            [10]  318 	pop	af
   2D5D FD 21 D2 44   [14]  319 	ld	iy,#_shoot_type
   2D61 FD 75 00      [19]  320 	ld	0 (iy),l
   2D64                     321 00122$:
                            322 ;src/entities/user.c:79: if (cpct_isKeyPressed(Key_H)){
   2D64 21 05 10      [10]  323 	ld	hl,#0x1005
   2D67 E5            [11]  324 	push	hl
   2D68 CD 97 3D      [17]  325 	call	_cpct_isKeyPressed
   2D6B F1            [10]  326 	pop	af
   2D6C 7D            [ 4]  327 	ld	a,l
   2D6D B7            [ 4]  328 	or	a, a
   2D6E 28 3D         [12]  329 	jr	Z,00124$
                            330 ;src/entities/user.c:80: create_enemy((rand()%80),(rand()%199),(rand()%2));
   2D70 CD 36 3E      [17]  331 	call	_rand
   2D73 01 02 00      [10]  332 	ld	bc,#0x0002
   2D76 C5            [11]  333 	push	bc
   2D77 E5            [11]  334 	push	hl
   2D78 CD E0 40      [17]  335 	call	__modsint
   2D7B F1            [10]  336 	pop	af
   2D7C F1            [10]  337 	pop	af
   2D7D DD 75 FF      [19]  338 	ld	-1 (ix),l
   2D80 CD 36 3E      [17]  339 	call	_rand
   2D83 01 C7 00      [10]  340 	ld	bc,#0x00C7
   2D86 C5            [11]  341 	push	bc
   2D87 E5            [11]  342 	push	hl
   2D88 CD E0 40      [17]  343 	call	__modsint
   2D8B F1            [10]  344 	pop	af
   2D8C F1            [10]  345 	pop	af
   2D8D 5D            [ 4]  346 	ld	e,l
   2D8E D5            [11]  347 	push	de
   2D8F CD 36 3E      [17]  348 	call	_rand
   2D92 01 50 00      [10]  349 	ld	bc,#0x0050
   2D95 C5            [11]  350 	push	bc
   2D96 E5            [11]  351 	push	hl
   2D97 CD E0 40      [17]  352 	call	__modsint
   2D9A F1            [10]  353 	pop	af
   2D9B F1            [10]  354 	pop	af
   2D9C D1            [10]  355 	pop	de
   2D9D 55            [ 4]  356 	ld	d,l
   2D9E DD 7E FF      [19]  357 	ld	a,-1 (ix)
   2DA1 F5            [11]  358 	push	af
   2DA2 33            [ 6]  359 	inc	sp
   2DA3 7B            [ 4]  360 	ld	a,e
   2DA4 F5            [11]  361 	push	af
   2DA5 33            [ 6]  362 	inc	sp
   2DA6 D5            [11]  363 	push	de
   2DA7 33            [ 6]  364 	inc	sp
   2DA8 CD 34 23      [17]  365 	call	_create_enemy
   2DAB F1            [10]  366 	pop	af
   2DAC 33            [ 6]  367 	inc	sp
   2DAD                     368 00124$:
                            369 ;src/entities/user.c:83: if (cpct_isKeyPressed(Key_Space)){
   2DAD 21 05 80      [10]  370 	ld	hl,#0x8005
   2DB0 E5            [11]  371 	push	hl
   2DB1 CD 97 3D      [17]  372 	call	_cpct_isKeyPressed
   2DB4 F1            [10]  373 	pop	af
   2DB5 7D            [ 4]  374 	ld	a,l
   2DB6 B7            [ 4]  375 	or	a, a
   2DB7 28 1B         [12]  376 	jr	Z,00127$
                            377 ;src/entities/user.c:84: create_shoot(user.x+3, user.y-1, shoot_type);
   2DB9 3A C7 44      [13]  378 	ld	a, (#_user + 7)
   2DBC 5F            [ 4]  379 	ld	e,a
   2DBD 1D            [ 4]  380 	dec	e
   2DBE 3A C6 44      [13]  381 	ld	a, (#_user + 6)
   2DC1 57            [ 4]  382 	ld	d,a
   2DC2 14            [ 4]  383 	inc	d
   2DC3 14            [ 4]  384 	inc	d
   2DC4 14            [ 4]  385 	inc	d
   2DC5 3A D2 44      [13]  386 	ld	a,(_shoot_type)
   2DC8 F5            [11]  387 	push	af
   2DC9 33            [ 6]  388 	inc	sp
   2DCA 7B            [ 4]  389 	ld	a,e
   2DCB F5            [11]  390 	push	af
   2DCC 33            [ 6]  391 	inc	sp
   2DCD D5            [11]  392 	push	de
   2DCE 33            [ 6]  393 	inc	sp
   2DCF CD 13 29      [17]  394 	call	_create_shoot
   2DD2 F1            [10]  395 	pop	af
   2DD3 33            [ 6]  396 	inc	sp
   2DD4                     397 00127$:
   2DD4 33            [ 6]  398 	inc	sp
   2DD5 DD E1         [14]  399 	pop	ix
   2DD7 C9            [10]  400 	ret
                            401 ;src/entities/user.c:89: void draw_user(u8* screen){
                            402 ;	---------------------------------
                            403 ; Function draw_user
                            404 ; ---------------------------------
   2DD8                     405 _draw_user::
   2DD8 DD E5         [15]  406 	push	ix
   2DDA DD 21 00 00   [14]  407 	ld	ix,#0
   2DDE DD 39         [15]  408 	add	ix,sp
                            409 ;src/entities/user.c:91: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   2DE0 21 C7 44      [10]  410 	ld	hl, #_user + 7
   2DE3 4E            [ 7]  411 	ld	c,(hl)
   2DE4 21 C6 44      [10]  412 	ld	hl, #_user + 6
   2DE7 66            [ 7]  413 	ld	h,(hl)
   2DE8 DD 5E 04      [19]  414 	ld	e,4 (ix)
   2DEB DD 56 05      [19]  415 	ld	d,5 (ix)
   2DEE 79            [ 4]  416 	ld	a,c
   2DEF F5            [11]  417 	push	af
   2DF0 33            [ 6]  418 	inc	sp
   2DF1 E5            [11]  419 	push	hl
   2DF2 33            [ 6]  420 	inc	sp
   2DF3 D5            [11]  421 	push	de
   2DF4 CD EC 40      [17]  422 	call	_cpct_getScreenPtr
   2DF7 F1            [10]  423 	pop	af
   2DF8 F1            [10]  424 	pop	af
   2DF9 EB            [ 4]  425 	ex	de,hl
                            426 ;src/entities/user.c:92: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   2DFA 21 C9 44      [10]  427 	ld	hl, #_user + 9
   2DFD 4E            [ 7]  428 	ld	c,(hl)
   2DFE 21 C8 44      [10]  429 	ld	hl, #_user + 8
   2E01 46            [ 7]  430 	ld	b,(hl)
   2E02 2A C4 44      [16]  431 	ld	hl, (#_user + 4)
   2E05 E5            [11]  432 	push	hl
   2E06 FD E1         [14]  433 	pop	iy
   2E08 79            [ 4]  434 	ld	a,c
   2E09 F5            [11]  435 	push	af
   2E0A 33            [ 6]  436 	inc	sp
   2E0B C5            [11]  437 	push	bc
   2E0C 33            [ 6]  438 	inc	sp
   2E0D D5            [11]  439 	push	de
   2E0E FD E5         [15]  440 	push	iy
   2E10 CD BD 3E      [17]  441 	call	_cpct_drawSprite
   2E13 21 06 00      [10]  442 	ld	hl,#6
   2E16 39            [11]  443 	add	hl,sp
   2E17 F9            [ 6]  444 	ld	sp,hl
   2E18 DD E1         [14]  445 	pop	ix
   2E1A C9            [10]  446 	ret
                            447 	.area _CODE
                            448 	.area _INITIALIZER
                            449 	.area _CABS (ABS)
