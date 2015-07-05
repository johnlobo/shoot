                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Jul  3 18:17:51 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_shoot
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _cpct_isKeyPressed
                             16 	.globl _cpct_scanKeyboard_f
                             17 	.globl _shoot_type
                             18 	.globl _user
                             19 	.globl _init_user
                             20 	.globl _get_user_max_shoots
                             21 	.globl _update_user
                             22 	.globl _draw_user
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   42BA                      30 _user::
   42BA                      31 	.ds 18
   42CC                      32 _shoot_type::
   42CC                      33 	.ds 1
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/entities/user.c:8: void init_user(){
                             59 ;	---------------------------------
                             60 ; Function init_user
                             61 ; ---------------------------------
   2A35                      62 _init_user::
                             63 ;src/entities/user.c:17: user.w = 6;
   2A35 21 C2 42      [10]   64 	ld	hl,#_user + 8
   2A38 36 06         [10]   65 	ld	(hl),#0x06
                             66 ;src/entities/user.c:18: user.h = 16;
   2A3A FD 21 C3 42   [14]   67 	ld	iy,#_user + 9
   2A3E FD 36 00 10   [19]   68 	ld	0 (iy), #0x10
                             69 ;src/entities/user.c:19: user.x = 39-(user.w/2);
   2A42 6E            [ 7]   70 	ld	l,(hl)
   2A43 CB 3D         [ 8]   71 	srl	l
   2A45 3E 27         [ 7]   72 	ld	a,#0x27
   2A47 95            [ 4]   73 	sub	a, l
   2A48 32 C0 42      [13]   74 	ld	(#(_user + 0x0006)),a
                             75 ;src/entities/user.c:20: user.y = 199-(user.h);
   2A4B FD 66 00      [19]   76 	ld	h, 0 (iy)
   2A4E 3E C7         [ 7]   77 	ld	a,#0xC7
   2A50 94            [ 4]   78 	sub	a, h
   2A51 32 C1 42      [13]   79 	ld	(#(_user + 0x0007)),a
                             80 ;src/entities/user.c:21: user.sprite = (u8*) ship03;
   2A54 21 EC 33      [10]   81 	ld	hl,#_ship03
   2A57 22 BE 42      [16]   82 	ld	((_user + 0x0004)), hl
                             83 ;src/entities/user.c:23: user.vx = 2;
   2A5A 21 C8 42      [10]   84 	ld	hl,#_user + 14
   2A5D 36 02         [10]   85 	ld	(hl),#0x02
                             86 ;src/entities/user.c:24: user.vy = 4;
   2A5F 21 C9 42      [10]   87 	ld	hl,#_user + 15
   2A62 36 04         [10]   88 	ld	(hl),#0x04
                             89 ;src/entities/user.c:25: user.max_shoots = 10;
   2A64 21 CB 42      [10]   90 	ld	hl,#_user + 17
   2A67 36 0A         [10]   91 	ld	(hl),#0x0A
                             92 ;src/entities/user.c:26: shoot_type = 1;
   2A69 21 CC 42      [10]   93 	ld	hl,#_shoot_type + 0
   2A6C 36 01         [10]   94 	ld	(hl), #0x01
   2A6E C9            [10]   95 	ret
                             96 ;src/entities/user.c:29: u8 get_user_max_shoots(){
                             97 ;	---------------------------------
                             98 ; Function get_user_max_shoots
                             99 ; ---------------------------------
   2A6F                     100 _get_user_max_shoots::
                            101 ;src/entities/user.c:30: return user.max_shoots;
   2A6F 21 CB 42      [10]  102 	ld	hl,#_user+17
   2A72 6E            [ 7]  103 	ld	l,(hl)
   2A73 C9            [10]  104 	ret
                            105 ;src/entities/user.c:36: void update_user() {
                            106 ;	---------------------------------
                            107 ; Function update_user
                            108 ; ---------------------------------
   2A74                     109 _update_user::
   2A74 DD E5         [15]  110 	push	ix
   2A76 DD 21 00 00   [14]  111 	ld	ix,#0
   2A7A DD 39         [15]  112 	add	ix,sp
   2A7C 3B            [ 6]  113 	dec	sp
                            114 ;src/entities/user.c:39: cpct_scanKeyboard_f();
   2A7D CD A2 3B      [17]  115 	call	_cpct_scanKeyboard_f
                            116 ;src/entities/user.c:46: if ((cpct_isKeyPressed(Key_Q))){ 
   2A80 21 08 08      [10]  117 	ld	hl,#0x0808
   2A83 E5            [11]  118 	push	hl
   2A84 CD 91 3B      [17]  119 	call	_cpct_isKeyPressed
   2A87 F1            [10]  120 	pop	af
   2A88 7D            [ 4]  121 	ld	a,l
   2A89 B7            [ 4]  122 	or	a, a
   2A8A 28 2D         [12]  123 	jr	Z,00105$
                            124 ;src/entities/user.c:47: if ((user.y-user.vy)>0)
   2A8C 21 C1 42      [10]  125 	ld	hl, #(_user + 0x0007) + 0
   2A8F 5E            [ 7]  126 	ld	e,(hl)
   2A90 4B            [ 4]  127 	ld	c,e
   2A91 06 00         [ 7]  128 	ld	b,#0x00
   2A93 21 C9 42      [10]  129 	ld	hl, #_user + 15
   2A96 56            [ 7]  130 	ld	d,(hl)
   2A97 7A            [ 4]  131 	ld	a,d
   2A98 6F            [ 4]  132 	ld	l,a
   2A99 17            [ 4]  133 	rla
   2A9A 9F            [ 4]  134 	sbc	a, a
   2A9B 67            [ 4]  135 	ld	h,a
   2A9C 79            [ 4]  136 	ld	a,c
   2A9D 95            [ 4]  137 	sub	a, l
   2A9E 6F            [ 4]  138 	ld	l,a
   2A9F 78            [ 4]  139 	ld	a,b
   2AA0 9C            [ 4]  140 	sbc	a, h
   2AA1 67            [ 4]  141 	ld	h,a
   2AA2 AF            [ 4]  142 	xor	a, a
   2AA3 BD            [ 4]  143 	cp	a, l
   2AA4 9C            [ 4]  144 	sbc	a, h
   2AA5 E2 AA 2A      [10]  145 	jp	PO, 00167$
   2AA8 EE 80         [ 7]  146 	xor	a, #0x80
   2AAA                     147 00167$:
   2AAA F2 B4 2A      [10]  148 	jp	P,00102$
                            149 ;src/entities/user.c:48: user.y = user.y - user.vy;
   2AAD 7B            [ 4]  150 	ld	a,e
   2AAE 92            [ 4]  151 	sub	a, d
   2AAF 32 C1 42      [13]  152 	ld	(#(_user + 0x0007)),a
   2AB2 18 05         [12]  153 	jr	00105$
   2AB4                     154 00102$:
                            155 ;src/entities/user.c:50: user.y = 0;
   2AB4 21 C1 42      [10]  156 	ld	hl,#(_user + 0x0007)
   2AB7 36 00         [10]  157 	ld	(hl),#0x00
   2AB9                     158 00105$:
                            159 ;src/entities/user.c:53: if ((cpct_isKeyPressed(Key_P))){ 
   2AB9 21 03 08      [10]  160 	ld	hl,#0x0803
   2ABC E5            [11]  161 	push	hl
   2ABD CD 91 3B      [17]  162 	call	_cpct_isKeyPressed
   2AC0 F1            [10]  163 	pop	af
   2AC1 7D            [ 4]  164 	ld	a,l
   2AC2 B7            [ 4]  165 	or	a, a
   2AC3 28 3F         [12]  166 	jr	Z,00110$
                            167 ;src/entities/user.c:54: if ((user.x+user.vx<(79-user.w)))
   2AC5 21 C0 42      [10]  168 	ld	hl, #(_user + 0x0006) + 0
   2AC8 5E            [ 7]  169 	ld	e,(hl)
   2AC9 4B            [ 4]  170 	ld	c,e
   2ACA 06 00         [ 7]  171 	ld	b,#0x00
   2ACC 21 C8 42      [10]  172 	ld	hl, #_user + 14
   2ACF 56            [ 7]  173 	ld	d,(hl)
   2AD0 7A            [ 4]  174 	ld	a,d
   2AD1 6F            [ 4]  175 	ld	l,a
   2AD2 17            [ 4]  176 	rla
   2AD3 9F            [ 4]  177 	sbc	a, a
   2AD4 67            [ 4]  178 	ld	h,a
   2AD5 09            [11]  179 	add	hl,bc
   2AD6 4D            [ 4]  180 	ld	c,l
   2AD7 44            [ 4]  181 	ld	b,h
   2AD8 3A C2 42      [13]  182 	ld	a,(#_user + 8)
   2ADB DD 77 FF      [19]  183 	ld	-1 (ix), a
   2ADE 6F            [ 4]  184 	ld	l, a
   2ADF 26 00         [ 7]  185 	ld	h,#0x00
   2AE1 3E 4F         [ 7]  186 	ld	a,#0x4F
   2AE3 95            [ 4]  187 	sub	a, l
   2AE4 6F            [ 4]  188 	ld	l,a
   2AE5 3E 00         [ 7]  189 	ld	a,#0x00
   2AE7 9C            [ 4]  190 	sbc	a, h
   2AE8 67            [ 4]  191 	ld	h,a
   2AE9 79            [ 4]  192 	ld	a,c
   2AEA 95            [ 4]  193 	sub	a, l
   2AEB 78            [ 4]  194 	ld	a,b
   2AEC 9C            [ 4]  195 	sbc	a, h
   2AED E2 F2 2A      [10]  196 	jp	PO, 00168$
   2AF0 EE 80         [ 7]  197 	xor	a, #0x80
   2AF2                     198 00168$:
   2AF2 F2 FC 2A      [10]  199 	jp	P,00107$
                            200 ;src/entities/user.c:55: user.x = user.x + user.vx;
   2AF5 7B            [ 4]  201 	ld	a,e
   2AF6 82            [ 4]  202 	add	a, d
   2AF7 32 C0 42      [13]  203 	ld	(#(_user + 0x0006)),a
   2AFA 18 08         [12]  204 	jr	00110$
   2AFC                     205 00107$:
                            206 ;src/entities/user.c:57: user.x = 79-user.w;
   2AFC 3E 4F         [ 7]  207 	ld	a,#0x4F
   2AFE DD 96 FF      [19]  208 	sub	a, -1 (ix)
   2B01 32 C0 42      [13]  209 	ld	(#(_user + 0x0006)),a
   2B04                     210 00110$:
                            211 ;src/entities/user.c:60: if (cpct_isKeyPressed(Key_O)){
   2B04 21 04 04      [10]  212 	ld	hl,#0x0404
   2B07 E5            [11]  213 	push	hl
   2B08 CD 91 3B      [17]  214 	call	_cpct_isKeyPressed
   2B0B F1            [10]  215 	pop	af
   2B0C 7D            [ 4]  216 	ld	a,l
   2B0D B7            [ 4]  217 	or	a, a
   2B0E 28 2D         [12]  218 	jr	Z,00115$
                            219 ;src/entities/user.c:61: if ((user.x-user.vx)>0) 
   2B10 21 C0 42      [10]  220 	ld	hl, #(_user + 0x0006) + 0
   2B13 5E            [ 7]  221 	ld	e,(hl)
   2B14 4B            [ 4]  222 	ld	c,e
   2B15 06 00         [ 7]  223 	ld	b,#0x00
   2B17 21 C8 42      [10]  224 	ld	hl, #_user + 14
   2B1A 56            [ 7]  225 	ld	d,(hl)
   2B1B 7A            [ 4]  226 	ld	a,d
   2B1C 6F            [ 4]  227 	ld	l,a
   2B1D 17            [ 4]  228 	rla
   2B1E 9F            [ 4]  229 	sbc	a, a
   2B1F 67            [ 4]  230 	ld	h,a
   2B20 79            [ 4]  231 	ld	a,c
   2B21 95            [ 4]  232 	sub	a, l
   2B22 6F            [ 4]  233 	ld	l,a
   2B23 78            [ 4]  234 	ld	a,b
   2B24 9C            [ 4]  235 	sbc	a, h
   2B25 67            [ 4]  236 	ld	h,a
   2B26 AF            [ 4]  237 	xor	a, a
   2B27 BD            [ 4]  238 	cp	a, l
   2B28 9C            [ 4]  239 	sbc	a, h
   2B29 E2 2E 2B      [10]  240 	jp	PO, 00169$
   2B2C EE 80         [ 7]  241 	xor	a, #0x80
   2B2E                     242 00169$:
   2B2E F2 38 2B      [10]  243 	jp	P,00112$
                            244 ;src/entities/user.c:62: user.x = user.x - user.vx;    
   2B31 7B            [ 4]  245 	ld	a,e
   2B32 92            [ 4]  246 	sub	a, d
   2B33 32 C0 42      [13]  247 	ld	(#(_user + 0x0006)),a
   2B36 18 05         [12]  248 	jr	00115$
   2B38                     249 00112$:
                            250 ;src/entities/user.c:64: user.x = 0;
   2B38 21 C0 42      [10]  251 	ld	hl,#(_user + 0x0006)
   2B3B 36 00         [10]  252 	ld	(hl),#0x00
   2B3D                     253 00115$:
                            254 ;src/entities/user.c:67: if (cpct_isKeyPressed(Key_A)){
   2B3D 21 08 20      [10]  255 	ld	hl,#0x2008
   2B40 E5            [11]  256 	push	hl
   2B41 CD 91 3B      [17]  257 	call	_cpct_isKeyPressed
   2B44 F1            [10]  258 	pop	af
   2B45 7D            [ 4]  259 	ld	a,l
   2B46 B7            [ 4]  260 	or	a, a
   2B47 28 37         [12]  261 	jr	Z,00120$
                            262 ;src/entities/user.c:68: if ((user.y<(199-user.h) ))
   2B49 21 C1 42      [10]  263 	ld	hl, #(_user + 0x0007) + 0
   2B4C 5E            [ 7]  264 	ld	e,(hl)
   2B4D 3A C3 42      [13]  265 	ld	a,(#_user + 9)
   2B50 DD 77 FF      [19]  266 	ld	-1 (ix), a
   2B53 6F            [ 4]  267 	ld	l, a
   2B54 26 00         [ 7]  268 	ld	h,#0x00
   2B56 3E C7         [ 7]  269 	ld	a,#0xC7
   2B58 95            [ 4]  270 	sub	a, l
   2B59 6F            [ 4]  271 	ld	l,a
   2B5A 3E 00         [ 7]  272 	ld	a,#0x00
   2B5C 9C            [ 4]  273 	sbc	a, h
   2B5D 67            [ 4]  274 	ld	h,a
   2B5E 4B            [ 4]  275 	ld	c,e
   2B5F 16 00         [ 7]  276 	ld	d,#0x00
   2B61 79            [ 4]  277 	ld	a,c
   2B62 95            [ 4]  278 	sub	a, l
   2B63 7A            [ 4]  279 	ld	a,d
   2B64 9C            [ 4]  280 	sbc	a, h
   2B65 E2 6A 2B      [10]  281 	jp	PO, 00170$
   2B68 EE 80         [ 7]  282 	xor	a, #0x80
   2B6A                     283 00170$:
   2B6A F2 78 2B      [10]  284 	jp	P,00117$
                            285 ;src/entities/user.c:69: user.y = user.y + user.vy;
   2B6D 21 C9 42      [10]  286 	ld	hl, #_user + 15
   2B70 6E            [ 7]  287 	ld	l,(hl)
   2B71 7B            [ 4]  288 	ld	a,e
   2B72 85            [ 4]  289 	add	a, l
   2B73 32 C1 42      [13]  290 	ld	(#(_user + 0x0007)),a
   2B76 18 08         [12]  291 	jr	00120$
   2B78                     292 00117$:
                            293 ;src/entities/user.c:71: user.y = 199-user.h;
   2B78 3E C7         [ 7]  294 	ld	a,#0xC7
   2B7A DD 96 FF      [19]  295 	sub	a, -1 (ix)
   2B7D 32 C1 42      [13]  296 	ld	(#(_user + 0x0007)),a
   2B80                     297 00120$:
                            298 ;src/entities/user.c:74: if (cpct_isKeyPressed(Key_D)){
   2B80 21 07 20      [10]  299 	ld	hl,#0x2007
   2B83 E5            [11]  300 	push	hl
   2B84 CD 91 3B      [17]  301 	call	_cpct_isKeyPressed
   2B87 F1            [10]  302 	pop	af
   2B88 7D            [ 4]  303 	ld	a,l
   2B89 B7            [ 4]  304 	or	a, a
   2B8A 28 1B         [12]  305 	jr	Z,00122$
                            306 ;src/entities/user.c:75: shoot_type=(shoot_type+1)%2;
   2B8C FD 21 CC 42   [14]  307 	ld	iy,#_shoot_type
   2B90 FD 6E 00      [19]  308 	ld	l,0 (iy)
   2B93 26 00         [ 7]  309 	ld	h,#0x00
   2B95 23            [ 6]  310 	inc	hl
   2B96 01 02 00      [10]  311 	ld	bc,#0x0002
   2B99 C5            [11]  312 	push	bc
   2B9A E5            [11]  313 	push	hl
   2B9B CD DA 3E      [17]  314 	call	__modsint
   2B9E F1            [10]  315 	pop	af
   2B9F F1            [10]  316 	pop	af
   2BA0 FD 21 CC 42   [14]  317 	ld	iy,#_shoot_type
   2BA4 FD 75 00      [19]  318 	ld	0 (iy),l
   2BA7                     319 00122$:
                            320 ;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
   2BA7 21 05 80      [10]  321 	ld	hl,#0x8005
   2BAA E5            [11]  322 	push	hl
   2BAB CD 91 3B      [17]  323 	call	_cpct_isKeyPressed
   2BAE F1            [10]  324 	pop	af
   2BAF 7D            [ 4]  325 	ld	a,l
   2BB0 B7            [ 4]  326 	or	a, a
   2BB1 28 1B         [12]  327 	jr	Z,00125$
                            328 ;src/entities/user.c:79: create_shoot(user.x+3, user.y-1, shoot_type);
   2BB3 3A C1 42      [13]  329 	ld	a, (#_user + 7)
   2BB6 5F            [ 4]  330 	ld	e,a
   2BB7 1D            [ 4]  331 	dec	e
   2BB8 3A C0 42      [13]  332 	ld	a, (#_user + 6)
   2BBB 57            [ 4]  333 	ld	d,a
   2BBC 14            [ 4]  334 	inc	d
   2BBD 14            [ 4]  335 	inc	d
   2BBE 14            [ 4]  336 	inc	d
   2BBF 3A CC 42      [13]  337 	ld	a,(_shoot_type)
   2BC2 F5            [11]  338 	push	af
   2BC3 33            [ 6]  339 	inc	sp
   2BC4 7B            [ 4]  340 	ld	a,e
   2BC5 F5            [11]  341 	push	af
   2BC6 33            [ 6]  342 	inc	sp
   2BC7 D5            [11]  343 	push	de
   2BC8 33            [ 6]  344 	inc	sp
   2BC9 CD 56 27      [17]  345 	call	_create_shoot
   2BCC F1            [10]  346 	pop	af
   2BCD 33            [ 6]  347 	inc	sp
   2BCE                     348 00125$:
   2BCE 33            [ 6]  349 	inc	sp
   2BCF DD E1         [14]  350 	pop	ix
   2BD1 C9            [10]  351 	ret
                            352 ;src/entities/user.c:84: void draw_user(u8* screen){
                            353 ;	---------------------------------
                            354 ; Function draw_user
                            355 ; ---------------------------------
   2BD2                     356 _draw_user::
   2BD2 DD E5         [15]  357 	push	ix
   2BD4 DD 21 00 00   [14]  358 	ld	ix,#0
   2BD8 DD 39         [15]  359 	add	ix,sp
                            360 ;src/entities/user.c:86: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   2BDA 21 C1 42      [10]  361 	ld	hl, #_user + 7
   2BDD 4E            [ 7]  362 	ld	c,(hl)
   2BDE 21 C0 42      [10]  363 	ld	hl, #_user + 6
   2BE1 66            [ 7]  364 	ld	h,(hl)
   2BE2 DD 5E 04      [19]  365 	ld	e,4 (ix)
   2BE5 DD 56 05      [19]  366 	ld	d,5 (ix)
   2BE8 79            [ 4]  367 	ld	a,c
   2BE9 F5            [11]  368 	push	af
   2BEA 33            [ 6]  369 	inc	sp
   2BEB E5            [11]  370 	push	hl
   2BEC 33            [ 6]  371 	inc	sp
   2BED D5            [11]  372 	push	de
   2BEE CD E6 3E      [17]  373 	call	_cpct_getScreenPtr
   2BF1 F1            [10]  374 	pop	af
   2BF2 F1            [10]  375 	pop	af
   2BF3 EB            [ 4]  376 	ex	de,hl
                            377 ;src/entities/user.c:87: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   2BF4 21 C3 42      [10]  378 	ld	hl, #_user + 9
   2BF7 4E            [ 7]  379 	ld	c,(hl)
   2BF8 21 C2 42      [10]  380 	ld	hl, #_user + 8
   2BFB 46            [ 7]  381 	ld	b,(hl)
   2BFC 2A BE 42      [16]  382 	ld	hl, (#_user + 4)
   2BFF E5            [11]  383 	push	hl
   2C00 FD E1         [14]  384 	pop	iy
   2C02 79            [ 4]  385 	ld	a,c
   2C03 F5            [11]  386 	push	af
   2C04 33            [ 6]  387 	inc	sp
   2C05 C5            [11]  388 	push	bc
   2C06 33            [ 6]  389 	inc	sp
   2C07 D5            [11]  390 	push	de
   2C08 FD E5         [15]  391 	push	iy
   2C0A CD B7 3C      [17]  392 	call	_cpct_drawSprite
   2C0D 21 06 00      [10]  393 	ld	hl,#6
   2C10 39            [11]  394 	add	hl,sp
   2C11 F9            [ 6]  395 	ld	sp,hl
   2C12 DD E1         [14]  396 	pop	ix
   2C14 C9            [10]  397 	ret
                            398 	.area _CODE
                            399 	.area _INITIALIZER
                            400 	.area _CABS (ABS)
