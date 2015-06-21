                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jun 21 18:17:49 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _initialization
                             14 	.globl _updateUser
                             15 	.globl _updateBlock
                             16 	.globl _clear_screen
                             17 	.globl _draw_blocks
                             18 	.globl _draw_sprite
                             19 	.globl _changeVideoMemoryPage
                             20 	.globl _set_stack
                             21 	.globl _cpc_SetInkGphStr
                             22 	.globl _moverEstrellas
                             23 	.globl _pintarEstrellas
                             24 	.globl _inicializarEstrellas
                             25 	.globl _cpct_getScreenPtr
                             26 	.globl _cpct_setVideoMemoryPage
                             27 	.globl _cpct_setPALColour
                             28 	.globl _cpct_setPalette
                             29 	.globl _cpct_waitVSYNC
                             30 	.globl _cpct_setVideoMode
                             31 	.globl _cpct_drawSolidBox
                             32 	.globl _cpct_drawSprite
                             33 	.globl _cpct_px2byteM0
                             34 	.globl _cpct_memset
                             35 	.globl _cpct_isKeyPressed
                             36 	.globl _cpct_scanKeyboard_f
                             37 	.globl _cpct_disableFirmware
                             38 	.globl _aux_txt
                             39 	.globl _pvmem
                             40 	.globl _user
                             41 	.globl _block02
                             42 	.globl _block01
                             43 ;--------------------------------------------------------
                             44 ; special function registers
                             45 ;--------------------------------------------------------
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DATA
   3154                      50 _block01::
   3154                      51 	.ds 7
   315B                      52 _block02::
   315B                      53 	.ds 7
   3162                      54 _user::
   3162                      55 	.ds 15
   3171                      56 _pvmem::
   3171                      57 	.ds 2
   3173                      58 _aux_txt::
   3173                      59 	.ds 40
   319B                      60 _changeVideoMemoryPage_page_1_71:
   319B                      61 	.ds 1
                             62 ;--------------------------------------------------------
                             63 ; ram data
                             64 ;--------------------------------------------------------
                             65 	.area _INITIALIZED
                             66 ;--------------------------------------------------------
                             67 ; absolute external ram data
                             68 ;--------------------------------------------------------
                             69 	.area _DABS (ABS)
                             70 ;--------------------------------------------------------
                             71 ; global & static initialisations
                             72 ;--------------------------------------------------------
                             73 	.area _HOME
                             74 	.area _GSINIT
                             75 	.area _GSFINAL
                             76 	.area _GSINIT
                             77 ;src/main.c:57: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   3397 FD 21 9B 31   [14]   78 	ld	iy,#_changeVideoMemoryPage_page_1_71
   339B FD 36 00 00   [19]   79 	ld	0 (iy),#0x00
                             80 ;--------------------------------------------------------
                             81 ; Home
                             82 ;--------------------------------------------------------
                             83 	.area _HOME
                             84 	.area _HOME
                             85 ;--------------------------------------------------------
                             86 ; code
                             87 ;--------------------------------------------------------
                             88 	.area _CODE
                             89 ;src/main.c:56: u8* changeVideoMemoryPage() {
                             90 ;	---------------------------------
                             91 ; Function changeVideoMemoryPage
                             92 ; ---------------------------------
   2000                      93 _changeVideoMemoryPage::
                             94 ;src/main.c:62: if (page) {
   2000 3A 9B 31      [13]   95 	ld	a,(#_changeVideoMemoryPage_page_1_71 + 0)
   2003 B7            [ 4]   96 	or	a, a
   2004 28 11         [12]   97 	jr	Z,00102$
                             98 ;src/main.c:63: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]   99 	ld	a,#0x30
   2008 F5            [11]  100 	push	af
   2009 33            [ 6]  101 	inc	sp
   200A CD 87 2E      [17]  102 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  103 	inc	sp
                            104 ;src/main.c:64: page = 0;  
   200E 21 9B 31      [10]  105 	ld	hl,#_changeVideoMemoryPage_page_1_71 + 0
   2011 36 00         [10]  106 	ld	(hl), #0x00
                            107 ;src/main.c:65: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  108 	ld	hl,#0x8000
   2016 C9            [10]  109 	ret
   2017                     110 00102$:
                            111 ;src/main.c:67: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  112 	ld	a,#0x20
   2019 F5            [11]  113 	push	af
   201A 33            [ 6]  114 	inc	sp
   201B CD 87 2E      [17]  115 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  116 	inc	sp
                            117 ;src/main.c:68: page = 1;                              // Next page = 1
   201F 21 9B 31      [10]  118 	ld	hl,#_changeVideoMemoryPage_page_1_71 + 0
   2022 36 01         [10]  119 	ld	(hl), #0x01
                            120 ;src/main.c:69: screen = SCR_VMEM;
   2024 21 00 C0      [10]  121 	ld	hl,#0xC000
                            122 ;src/main.c:71: return screen;
   2027 C9            [10]  123 	ret
                            124 ;src/main.c:77: void draw_sprite(u8* screen){
                            125 ;	---------------------------------
                            126 ; Function draw_sprite
                            127 ; ---------------------------------
   2028                     128 _draw_sprite::
   2028 DD E5         [15]  129 	push	ix
   202A DD 21 00 00   [14]  130 	ld	ix,#0
   202E DD 39         [15]  131 	add	ix,sp
                            132 ;src/main.c:79: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   2030 21 67 31      [10]  133 	ld	hl, #_user + 5
   2033 4E            [ 7]  134 	ld	c,(hl)
   2034 21 66 31      [10]  135 	ld	hl, #_user + 4
   2037 66            [ 7]  136 	ld	h,(hl)
   2038 DD 5E 04      [19]  137 	ld	e,4 (ix)
   203B DD 56 05      [19]  138 	ld	d,5 (ix)
   203E 79            [ 4]  139 	ld	a,c
   203F F5            [11]  140 	push	af
   2040 33            [ 6]  141 	inc	sp
   2041 E5            [11]  142 	push	hl
   2042 33            [ 6]  143 	inc	sp
   2043 D5            [11]  144 	push	de
   2044 CD EF 2F      [17]  145 	call	_cpct_getScreenPtr
   2047 F1            [10]  146 	pop	af
   2048 F1            [10]  147 	pop	af
   2049 EB            [ 4]  148 	ex	de,hl
                            149 ;src/main.c:80: cpct_drawSprite(ship01,pscreen,user.w,user.h);
   204A 21 69 31      [10]  150 	ld	hl, #_user + 7
   204D 4E            [ 7]  151 	ld	c,(hl)
   204E 21 68 31      [10]  152 	ld	hl, #_user + 6
   2051 46            [ 7]  153 	ld	b,(hl)
   2052 79            [ 4]  154 	ld	a,c
   2053 F5            [11]  155 	push	af
   2054 33            [ 6]  156 	inc	sp
   2055 C5            [11]  157 	push	bc
   2056 33            [ 6]  158 	inc	sp
   2057 D5            [11]  159 	push	de
   2058 21 DE 24      [10]  160 	ld	hl,#_ship01
   205B E5            [11]  161 	push	hl
   205C CD D5 2D      [17]  162 	call	_cpct_drawSprite
   205F 21 06 00      [10]  163 	ld	hl,#6
   2062 39            [11]  164 	add	hl,sp
   2063 F9            [ 6]  165 	ld	sp,hl
   2064 DD E1         [14]  166 	pop	ix
   2066 C9            [10]  167 	ret
                            168 ;src/main.c:86: void draw_blocks(u8* screen){
                            169 ;	---------------------------------
                            170 ; Function draw_blocks
                            171 ; ---------------------------------
   2067                     172 _draw_blocks::
   2067 DD E5         [15]  173 	push	ix
   2069 DD 21 00 00   [14]  174 	ld	ix,#0
   206D DD 39         [15]  175 	add	ix,sp
   206F 3B            [ 6]  176 	dec	sp
                            177 ;src/main.c:89: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2070 21 55 31      [10]  178 	ld	hl, #_block01 + 1
   2073 4E            [ 7]  179 	ld	c,(hl)
   2074 21 54 31      [10]  180 	ld	hl, #_block01 + 0
   2077 66            [ 7]  181 	ld	h,(hl)
   2078 DD 5E 04      [19]  182 	ld	e,4 (ix)
   207B DD 56 05      [19]  183 	ld	d,5 (ix)
   207E 79            [ 4]  184 	ld	a,c
   207F F5            [11]  185 	push	af
   2080 33            [ 6]  186 	inc	sp
   2081 E5            [11]  187 	push	hl
   2082 33            [ 6]  188 	inc	sp
   2083 D5            [11]  189 	push	de
   2084 CD EF 2F      [17]  190 	call	_cpct_getScreenPtr
   2087 F1            [10]  191 	pop	af
   2088 F1            [10]  192 	pop	af
   2089 5D            [ 4]  193 	ld	e, l
   208A 54            [ 4]  194 	ld	d, h
                            195 ;src/main.c:90: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   208B 21 59 31      [10]  196 	ld	hl, #_block01 + 5
   208E 4E            [ 7]  197 	ld	c,(hl)
   208F 21 58 31      [10]  198 	ld	hl, #_block01 + 4
   2092 46            [ 7]  199 	ld	b,(hl)
   2093 C5            [11]  200 	push	bc
   2094 D5            [11]  201 	push	de
   2095 21 04 04      [10]  202 	ld	hl,#0x0404
   2098 E5            [11]  203 	push	hl
   2099 CD CA 2E      [17]  204 	call	_cpct_px2byteM0
   209C F1            [10]  205 	pop	af
   209D DD 75 FF      [19]  206 	ld	-1 (ix),l
   20A0 D1            [10]  207 	pop	de
   20A1 C1            [10]  208 	pop	bc
   20A2 79            [ 4]  209 	ld	a,c
   20A3 F5            [11]  210 	push	af
   20A4 33            [ 6]  211 	inc	sp
   20A5 C5            [11]  212 	push	bc
   20A6 33            [ 6]  213 	inc	sp
   20A7 DD 7E FF      [19]  214 	ld	a,-1 (ix)
   20AA F5            [11]  215 	push	af
   20AB 33            [ 6]  216 	inc	sp
   20AC D5            [11]  217 	push	de
   20AD CD 1D 2F      [17]  218 	call	_cpct_drawSolidBox
   20B0 F1            [10]  219 	pop	af
   20B1 F1            [10]  220 	pop	af
   20B2 33            [ 6]  221 	inc	sp
   20B3 33            [ 6]  222 	inc	sp
   20B4 DD E1         [14]  223 	pop	ix
   20B6 C9            [10]  224 	ret
                            225 ;src/main.c:97: void clear_screen(u8* screen){
                            226 ;	---------------------------------
                            227 ; Function clear_screen
                            228 ; ---------------------------------
   20B7                     229 _clear_screen::
                            230 ;src/main.c:98: cpct_memset(screen, 0x00, 0x4000);   
   20B7 C1            [10]  231 	pop	bc
   20B8 D1            [10]  232 	pop	de
   20B9 D5            [11]  233 	push	de
   20BA C5            [11]  234 	push	bc
   20BB 21 00 40      [10]  235 	ld	hl,#0x4000
   20BE E5            [11]  236 	push	hl
   20BF AF            [ 4]  237 	xor	a, a
   20C0 F5            [11]  238 	push	af
   20C1 33            [ 6]  239 	inc	sp
   20C2 D5            [11]  240 	push	de
   20C3 CD EE 2E      [17]  241 	call	_cpct_memset
   20C6 F1            [10]  242 	pop	af
   20C7 F1            [10]  243 	pop	af
   20C8 33            [ 6]  244 	inc	sp
   20C9 C9            [10]  245 	ret
                            246 ;src/main.c:105: void updateBlock(){
                            247 ;	---------------------------------
                            248 ; Function updateBlock
                            249 ; ---------------------------------
   20CA                     250 _updateBlock::
   20CA DD E5         [15]  251 	push	ix
   20CC DD 21 00 00   [14]  252 	ld	ix,#0
   20D0 DD 39         [15]  253 	add	ix,sp
   20D2 F5            [11]  254 	push	af
   20D3 3B            [ 6]  255 	dec	sp
                            256 ;src/main.c:106: if (block01.vx<128){
   20D4 01 54 31      [10]  257 	ld	bc,#_block01+0
   20D7 21 56 31      [10]  258 	ld	hl, #(_block01 + 0x0002) + 0
   20DA 7E            [ 7]  259 	ld	a,(hl)
   20DB DD 77 FF      [19]  260 	ld	-1 (ix),a
                            261 ;src/main.c:107: if ((block01.x+block01.vx)<(80-block01.w)){
   20DE 0A            [ 7]  262 	ld	a,(bc)
                            263 ;src/main.c:108: block01.x = block01.x + block01.vx;
   20DF 57            [ 4]  264 	ld	d,a
   20E0 DD 86 FF      [19]  265 	add	a, -1 (ix)
   20E3 5F            [ 4]  266 	ld	e,a
                            267 ;src/main.c:106: if (block01.vx<128){
   20E4 DD 7E FF      [19]  268 	ld	a,-1 (ix)
   20E7 D6 80         [ 7]  269 	sub	a, #0x80
   20E9 30 4E         [12]  270 	jr	NC,00108$
                            271 ;src/main.c:107: if ((block01.x+block01.vx)<(80-block01.w)){
   20EB DD 72 FD      [19]  272 	ld	-3 (ix),d
   20EE DD 36 FE 00   [19]  273 	ld	-2 (ix),#0x00
   20F2 DD 66 FF      [19]  274 	ld	h,-1 (ix)
   20F5 2E 00         [ 7]  275 	ld	l,#0x00
   20F7 DD 7E FD      [19]  276 	ld	a,-3 (ix)
   20FA 84            [ 4]  277 	add	a, h
   20FB DD 77 FD      [19]  278 	ld	-3 (ix),a
   20FE DD 7E FE      [19]  279 	ld	a,-2 (ix)
   2101 8D            [ 4]  280 	adc	a, l
   2102 DD 77 FE      [19]  281 	ld	-2 (ix),a
   2105 21 58 31      [10]  282 	ld	hl, #_block01 + 4
   2108 66            [ 7]  283 	ld	h,(hl)
   2109 6C            [ 4]  284 	ld	l,h
   210A 16 00         [ 7]  285 	ld	d,#0x00
   210C 3E 50         [ 7]  286 	ld	a,#0x50
   210E 95            [ 4]  287 	sub	a, l
   210F 6F            [ 4]  288 	ld	l,a
   2110 3E 00         [ 7]  289 	ld	a,#0x00
   2112 9A            [ 4]  290 	sbc	a, d
   2113 57            [ 4]  291 	ld	d,a
   2114 DD 7E FD      [19]  292 	ld	a,-3 (ix)
   2117 95            [ 4]  293 	sub	a, l
   2118 DD 7E FE      [19]  294 	ld	a,-2 (ix)
   211B 9A            [ 4]  295 	sbc	a, d
   211C E2 21 21      [10]  296 	jp	PO, 00124$
   211F EE 80         [ 7]  297 	xor	a, #0x80
   2121                     298 00124$:
   2121 F2 28 21      [10]  299 	jp	P,00102$
                            300 ;src/main.c:108: block01.x = block01.x + block01.vx;
   2124 7B            [ 4]  301 	ld	a,e
   2125 02            [ 7]  302 	ld	(bc),a
   2126 18 2D         [12]  303 	jr	00110$
   2128                     304 00102$:
                            305 ;src/main.c:111: block01.x = 79-block01.w;
   2128 3E 4F         [ 7]  306 	ld	a,#0x4F
   212A 94            [ 4]  307 	sub	a, h
   212B 02            [ 7]  308 	ld	(bc),a
                            309 ;src/main.c:112: block01.vx = - block01.vx;
   212C 21 56 31      [10]  310 	ld	hl, #(_block01 + 0x0002) + 0
   212F 66            [ 7]  311 	ld	h,(hl)
   2130 AF            [ 4]  312 	xor	a, a
   2131 94            [ 4]  313 	sub	a, h
   2132 57            [ 4]  314 	ld	d,a
   2133 21 56 31      [10]  315 	ld	hl,#(_block01 + 0x0002)
   2136 72            [ 7]  316 	ld	(hl),d
   2137 18 1C         [12]  317 	jr	00110$
   2139                     318 00108$:
                            319 ;src/main.c:115: if (( (i8) (block01.x+block01.vx))>0){
   2139 6B            [ 4]  320 	ld	l,e
   213A AF            [ 4]  321 	xor	a, a
   213B 95            [ 4]  322 	sub	a, l
   213C E2 41 21      [10]  323 	jp	PO, 00125$
   213F EE 80         [ 7]  324 	xor	a, #0x80
   2141                     325 00125$:
   2141 F2 48 21      [10]  326 	jp	P,00105$
                            327 ;src/main.c:116: block01.x = block01.x + block01.vx;
   2144 7B            [ 4]  328 	ld	a,e
   2145 02            [ 7]  329 	ld	(bc),a
   2146 18 0D         [12]  330 	jr	00110$
   2148                     331 00105$:
                            332 ;src/main.c:119: block01.x = 0;
   2148 AF            [ 4]  333 	xor	a, a
   2149 02            [ 7]  334 	ld	(bc),a
                            335 ;src/main.c:120: block01.vx = - block01.vx;
   214A 21 56 31      [10]  336 	ld	hl, #(_block01 + 0x0002) + 0
   214D 66            [ 7]  337 	ld	h,(hl)
   214E AF            [ 4]  338 	xor	a, a
   214F 94            [ 4]  339 	sub	a, h
   2150 57            [ 4]  340 	ld	d,a
   2151 21 56 31      [10]  341 	ld	hl,#(_block01 + 0x0002)
   2154 72            [ 7]  342 	ld	(hl),d
   2155                     343 00110$:
   2155 DD F9         [10]  344 	ld	sp, ix
   2157 DD E1         [14]  345 	pop	ix
   2159 C9            [10]  346 	ret
                            347 ;src/main.c:128: void updateUser() {
                            348 ;	---------------------------------
                            349 ; Function updateUser
                            350 ; ---------------------------------
   215A                     351 _updateUser::
   215A DD E5         [15]  352 	push	ix
   215C DD 21 00 00   [14]  353 	ld	ix,#0
   2160 DD 39         [15]  354 	add	ix,sp
   2162 3B            [ 6]  355 	dec	sp
                            356 ;src/main.c:130: cpct_scanKeyboard_f();
   2163 CD E4 2C      [17]  357 	call	_cpct_scanKeyboard_f
                            358 ;src/main.c:137: if ((cpct_isKeyPressed(Key_CursorUp))){ 
   2166 21 00 01      [10]  359 	ld	hl,#0x0100
   2169 E5            [11]  360 	push	hl
   216A CD D3 2C      [17]  361 	call	_cpct_isKeyPressed
   216D F1            [10]  362 	pop	af
   216E 7D            [ 4]  363 	ld	a,l
   216F B7            [ 4]  364 	or	a, a
   2170 28 2D         [12]  365 	jr	Z,00105$
                            366 ;src/main.c:138: if ((user.y-user.vy)>0)
   2172 21 67 31      [10]  367 	ld	hl, #(_user + 0x0005) + 0
   2175 5E            [ 7]  368 	ld	e,(hl)
   2176 4B            [ 4]  369 	ld	c,e
   2177 06 00         [ 7]  370 	ld	b,#0x00
   2179 21 6F 31      [10]  371 	ld	hl, #_user + 13
   217C 56            [ 7]  372 	ld	d,(hl)
   217D 7A            [ 4]  373 	ld	a,d
   217E 6F            [ 4]  374 	ld	l,a
   217F 17            [ 4]  375 	rla
   2180 9F            [ 4]  376 	sbc	a, a
   2181 67            [ 4]  377 	ld	h,a
   2182 79            [ 4]  378 	ld	a,c
   2183 95            [ 4]  379 	sub	a, l
   2184 6F            [ 4]  380 	ld	l,a
   2185 78            [ 4]  381 	ld	a,b
   2186 9C            [ 4]  382 	sbc	a, h
   2187 67            [ 4]  383 	ld	h,a
   2188 AF            [ 4]  384 	xor	a, a
   2189 BD            [ 4]  385 	cp	a, l
   218A 9C            [ 4]  386 	sbc	a, h
   218B E2 90 21      [10]  387 	jp	PO, 00172$
   218E EE 80         [ 7]  388 	xor	a, #0x80
   2190                     389 00172$:
   2190 F2 9A 21      [10]  390 	jp	P,00102$
                            391 ;src/main.c:139: user.y = user.y - user.vy;
   2193 7B            [ 4]  392 	ld	a,e
   2194 92            [ 4]  393 	sub	a, d
   2195 32 67 31      [13]  394 	ld	(#(_user + 0x0005)),a
   2198 18 05         [12]  395 	jr	00105$
   219A                     396 00102$:
                            397 ;src/main.c:141: user.y = 0;
   219A 21 67 31      [10]  398 	ld	hl,#(_user + 0x0005)
   219D 36 00         [10]  399 	ld	(hl),#0x00
   219F                     400 00105$:
                            401 ;src/main.c:144: if ((cpct_isKeyPressed(Key_CursorRight))){ 
   219F 21 00 02      [10]  402 	ld	hl,#0x0200
   21A2 E5            [11]  403 	push	hl
   21A3 CD D3 2C      [17]  404 	call	_cpct_isKeyPressed
   21A6 F1            [10]  405 	pop	af
   21A7 7D            [ 4]  406 	ld	a,l
   21A8 B7            [ 4]  407 	or	a, a
   21A9 28 3F         [12]  408 	jr	Z,00110$
                            409 ;src/main.c:145: if ((user.x+user.vx<(79-user.w)))
   21AB 21 66 31      [10]  410 	ld	hl, #(_user + 0x0004) + 0
   21AE 5E            [ 7]  411 	ld	e,(hl)
   21AF 4B            [ 4]  412 	ld	c,e
   21B0 06 00         [ 7]  413 	ld	b,#0x00
   21B2 21 6E 31      [10]  414 	ld	hl, #_user + 12
   21B5 56            [ 7]  415 	ld	d,(hl)
   21B6 7A            [ 4]  416 	ld	a,d
   21B7 6F            [ 4]  417 	ld	l,a
   21B8 17            [ 4]  418 	rla
   21B9 9F            [ 4]  419 	sbc	a, a
   21BA 67            [ 4]  420 	ld	h,a
   21BB 09            [11]  421 	add	hl,bc
   21BC 4D            [ 4]  422 	ld	c,l
   21BD 44            [ 4]  423 	ld	b,h
   21BE 3A 68 31      [13]  424 	ld	a,(#_user + 6)
   21C1 DD 77 FF      [19]  425 	ld	-1 (ix), a
   21C4 6F            [ 4]  426 	ld	l, a
   21C5 26 00         [ 7]  427 	ld	h,#0x00
   21C7 3E 4F         [ 7]  428 	ld	a,#0x4F
   21C9 95            [ 4]  429 	sub	a, l
   21CA 6F            [ 4]  430 	ld	l,a
   21CB 3E 00         [ 7]  431 	ld	a,#0x00
   21CD 9C            [ 4]  432 	sbc	a, h
   21CE 67            [ 4]  433 	ld	h,a
   21CF 79            [ 4]  434 	ld	a,c
   21D0 95            [ 4]  435 	sub	a, l
   21D1 78            [ 4]  436 	ld	a,b
   21D2 9C            [ 4]  437 	sbc	a, h
   21D3 E2 D8 21      [10]  438 	jp	PO, 00173$
   21D6 EE 80         [ 7]  439 	xor	a, #0x80
   21D8                     440 00173$:
   21D8 F2 E2 21      [10]  441 	jp	P,00107$
                            442 ;src/main.c:146: user.x = user.x + user.vx;
   21DB 7B            [ 4]  443 	ld	a,e
   21DC 82            [ 4]  444 	add	a, d
   21DD 32 66 31      [13]  445 	ld	(#(_user + 0x0004)),a
   21E0 18 08         [12]  446 	jr	00110$
   21E2                     447 00107$:
                            448 ;src/main.c:148: user.x = 79-user.w;
   21E2 3E 4F         [ 7]  449 	ld	a,#0x4F
   21E4 DD 96 FF      [19]  450 	sub	a, -1 (ix)
   21E7 32 66 31      [13]  451 	ld	(#(_user + 0x0004)),a
   21EA                     452 00110$:
                            453 ;src/main.c:151: if (cpct_isKeyPressed(Key_CursorLeft)){
   21EA 21 01 01      [10]  454 	ld	hl,#0x0101
   21ED E5            [11]  455 	push	hl
   21EE CD D3 2C      [17]  456 	call	_cpct_isKeyPressed
   21F1 F1            [10]  457 	pop	af
   21F2 7D            [ 4]  458 	ld	a,l
   21F3 B7            [ 4]  459 	or	a, a
   21F4 28 2D         [12]  460 	jr	Z,00115$
                            461 ;src/main.c:152: if ((user.x-user.vx)>0) 
   21F6 21 66 31      [10]  462 	ld	hl, #(_user + 0x0004) + 0
   21F9 5E            [ 7]  463 	ld	e,(hl)
   21FA 4B            [ 4]  464 	ld	c,e
   21FB 06 00         [ 7]  465 	ld	b,#0x00
   21FD 21 6E 31      [10]  466 	ld	hl, #_user + 12
   2200 56            [ 7]  467 	ld	d,(hl)
   2201 7A            [ 4]  468 	ld	a,d
   2202 6F            [ 4]  469 	ld	l,a
   2203 17            [ 4]  470 	rla
   2204 9F            [ 4]  471 	sbc	a, a
   2205 67            [ 4]  472 	ld	h,a
   2206 79            [ 4]  473 	ld	a,c
   2207 95            [ 4]  474 	sub	a, l
   2208 6F            [ 4]  475 	ld	l,a
   2209 78            [ 4]  476 	ld	a,b
   220A 9C            [ 4]  477 	sbc	a, h
   220B 67            [ 4]  478 	ld	h,a
   220C AF            [ 4]  479 	xor	a, a
   220D BD            [ 4]  480 	cp	a, l
   220E 9C            [ 4]  481 	sbc	a, h
   220F E2 14 22      [10]  482 	jp	PO, 00174$
   2212 EE 80         [ 7]  483 	xor	a, #0x80
   2214                     484 00174$:
   2214 F2 1E 22      [10]  485 	jp	P,00112$
                            486 ;src/main.c:153: user.x = user.x - user.vx;    
   2217 7B            [ 4]  487 	ld	a,e
   2218 92            [ 4]  488 	sub	a, d
   2219 32 66 31      [13]  489 	ld	(#(_user + 0x0004)),a
   221C 18 05         [12]  490 	jr	00115$
   221E                     491 00112$:
                            492 ;src/main.c:155: user.x = 0;
   221E 21 66 31      [10]  493 	ld	hl,#(_user + 0x0004)
   2221 36 00         [10]  494 	ld	(hl),#0x00
   2223                     495 00115$:
                            496 ;src/main.c:158: if (cpct_isKeyPressed(Key_CursorDown)){
   2223 21 00 04      [10]  497 	ld	hl,#0x0400
   2226 E5            [11]  498 	push	hl
   2227 CD D3 2C      [17]  499 	call	_cpct_isKeyPressed
   222A F1            [10]  500 	pop	af
   222B 7D            [ 4]  501 	ld	a,l
   222C B7            [ 4]  502 	or	a, a
   222D 28 37         [12]  503 	jr	Z,00120$
                            504 ;src/main.c:159: if ((user.y<(199-user.h) ))
   222F 21 67 31      [10]  505 	ld	hl, #(_user + 0x0005) + 0
   2232 5E            [ 7]  506 	ld	e,(hl)
   2233 3A 69 31      [13]  507 	ld	a,(#_user + 7)
   2236 DD 77 FF      [19]  508 	ld	-1 (ix), a
   2239 6F            [ 4]  509 	ld	l, a
   223A 26 00         [ 7]  510 	ld	h,#0x00
   223C 3E C7         [ 7]  511 	ld	a,#0xC7
   223E 95            [ 4]  512 	sub	a, l
   223F 6F            [ 4]  513 	ld	l,a
   2240 3E 00         [ 7]  514 	ld	a,#0x00
   2242 9C            [ 4]  515 	sbc	a, h
   2243 67            [ 4]  516 	ld	h,a
   2244 4B            [ 4]  517 	ld	c,e
   2245 16 00         [ 7]  518 	ld	d,#0x00
   2247 79            [ 4]  519 	ld	a,c
   2248 95            [ 4]  520 	sub	a, l
   2249 7A            [ 4]  521 	ld	a,d
   224A 9C            [ 4]  522 	sbc	a, h
   224B E2 50 22      [10]  523 	jp	PO, 00175$
   224E EE 80         [ 7]  524 	xor	a, #0x80
   2250                     525 00175$:
   2250 F2 5E 22      [10]  526 	jp	P,00117$
                            527 ;src/main.c:160: user.y = user.y + user.vy;
   2253 21 6F 31      [10]  528 	ld	hl, #_user + 13
   2256 6E            [ 7]  529 	ld	l,(hl)
   2257 7B            [ 4]  530 	ld	a,e
   2258 85            [ 4]  531 	add	a, l
   2259 32 67 31      [13]  532 	ld	(#(_user + 0x0005)),a
   225C 18 08         [12]  533 	jr	00120$
   225E                     534 00117$:
                            535 ;src/main.c:162: user.y = 199-user.h;
   225E 3E C7         [ 7]  536 	ld	a,#0xC7
   2260 DD 96 FF      [19]  537 	sub	a, -1 (ix)
   2263 32 67 31      [13]  538 	ld	(#(_user + 0x0005)),a
   2266                     539 00120$:
                            540 ;src/main.c:166: if (cpct_isKeyPressed(Key_Space)){
   2266 21 05 80      [10]  541 	ld	hl,#0x8005
   2269 E5            [11]  542 	push	hl
   226A CD D3 2C      [17]  543 	call	_cpct_isKeyPressed
   226D F1            [10]  544 	pop	af
   226E 7D            [ 4]  545 	ld	a,l
   226F B7            [ 4]  546 	or	a, a
   2270 28 14         [12]  547 	jr	Z,00126$
                            548 ;src/main.c:168: cpct_scanKeyboard_f();
   2272 CD E4 2C      [17]  549 	call	_cpct_scanKeyboard_f
                            550 ;src/main.c:170: while(!cpct_isKeyPressed(Key_P)){
   2275                     551 00121$:
   2275 21 03 08      [10]  552 	ld	hl,#0x0803
   2278 E5            [11]  553 	push	hl
   2279 CD D3 2C      [17]  554 	call	_cpct_isKeyPressed
   227C F1            [10]  555 	pop	af
   227D 7D            [ 4]  556 	ld	a,l
   227E B7            [ 4]  557 	or	a, a
   227F 20 05         [12]  558 	jr	NZ,00126$
                            559 ;src/main.c:172: cpct_scanKeyboard_f();
   2281 CD E4 2C      [17]  560 	call	_cpct_scanKeyboard_f
   2284 18 EF         [12]  561 	jr	00121$
   2286                     562 00126$:
   2286 33            [ 6]  563 	inc	sp
   2287 DD E1         [14]  564 	pop	ix
   2289 C9            [10]  565 	ret
                            566 ;src/main.c:182: void initialization(){
                            567 ;	---------------------------------
                            568 ; Function initialization
                            569 ; ---------------------------------
   228A                     570 _initialization::
                            571 ;src/main.c:184: pvmem = SCR_BUFF;
   228A 21 00 80      [10]  572 	ld	hl,#0x8000
   228D 22 71 31      [16]  573 	ld	(_pvmem),hl
                            574 ;src/main.c:187: inicializarEstrellas();
   2290 CD CA 25      [17]  575 	call	_inicializarEstrellas
                            576 ;src/main.c:189: block01.x = 50;
   2293 21 54 31      [10]  577 	ld	hl,#_block01+0
   2296 36 32         [10]  578 	ld	(hl),#0x32
                            579 ;src/main.c:190: block01.y = 10;
   2298 21 55 31      [10]  580 	ld	hl,#_block01 + 1
   229B 36 0A         [10]  581 	ld	(hl),#0x0A
                            582 ;src/main.c:191: block01.vx = 2;
   229D 21 56 31      [10]  583 	ld	hl,#_block01 + 2
   22A0 36 02         [10]  584 	ld	(hl),#0x02
                            585 ;src/main.c:192: block01.vy = 0;
   22A2 21 57 31      [10]  586 	ld	hl,#_block01 + 3
   22A5 36 00         [10]  587 	ld	(hl),#0x00
                            588 ;src/main.c:193: block01.w = 20;
   22A7 21 58 31      [10]  589 	ld	hl,#_block01 + 4
   22AA 36 14         [10]  590 	ld	(hl),#0x14
                            591 ;src/main.c:194: block01.h = 40;
   22AC 21 59 31      [10]  592 	ld	hl,#_block01 + 5
   22AF 36 28         [10]  593 	ld	(hl),#0x28
                            594 ;src/main.c:196: block02.x = 15;
   22B1 21 5B 31      [10]  595 	ld	hl,#_block02+0
   22B4 36 0F         [10]  596 	ld	(hl),#0x0F
                            597 ;src/main.c:197: block02.y = 15;
   22B6 21 5C 31      [10]  598 	ld	hl,#_block02 + 1
   22B9 36 0F         [10]  599 	ld	(hl),#0x0F
                            600 ;src/main.c:198: block02.vx = 4;
   22BB 21 5D 31      [10]  601 	ld	hl,#_block02 + 2
   22BE 36 04         [10]  602 	ld	(hl),#0x04
                            603 ;src/main.c:199: block02.vy = 0;
   22C0 21 5E 31      [10]  604 	ld	hl,#_block02 + 3
   22C3 36 00         [10]  605 	ld	(hl),#0x00
                            606 ;src/main.c:200: block02.w = 25;
   22C5 21 5F 31      [10]  607 	ld	hl,#_block02 + 4
   22C8 36 19         [10]  608 	ld	(hl),#0x19
                            609 ;src/main.c:201: block02.h = 20;
   22CA 21 60 31      [10]  610 	ld	hl,#_block02 + 5
   22CD 36 14         [10]  611 	ld	(hl),#0x14
                            612 ;src/main.c:203: user.x = 39;
   22CF 21 66 31      [10]  613 	ld	hl,#_user + 4
   22D2 36 27         [10]  614 	ld	(hl),#0x27
                            615 ;src/main.c:204: user.y = 183;
   22D4 21 67 31      [10]  616 	ld	hl,#_user + 5
   22D7 36 B7         [10]  617 	ld	(hl),#0xB7
                            618 ;src/main.c:205: user.w = 6;
   22D9 21 68 31      [10]  619 	ld	hl,#_user + 6
   22DC 36 06         [10]  620 	ld	(hl),#0x06
                            621 ;src/main.c:206: user.h = 16;
   22DE 21 69 31      [10]  622 	ld	hl,#_user + 7
   22E1 36 10         [10]  623 	ld	(hl),#0x10
                            624 ;src/main.c:207: user.vx = 2;
   22E3 21 6E 31      [10]  625 	ld	hl,#_user + 12
   22E6 36 02         [10]  626 	ld	(hl),#0x02
                            627 ;src/main.c:208: user.vy = 4;
   22E8 21 6F 31      [10]  628 	ld	hl,#_user + 13
   22EB 36 04         [10]  629 	ld	(hl),#0x04
                            630 ;src/main.c:211: cpc_SetInkGphStr(0,0);
   22ED 21 00 00      [10]  631 	ld	hl,#0x0000
   22F0 E5            [11]  632 	push	hl
   22F1 CD 9B 29      [17]  633 	call	_cpc_SetInkGphStr
                            634 ;src/main.c:212: cpc_SetInkGphStr(1,2);
   22F4 21 01 02      [10]  635 	ld	hl, #0x0201
   22F7 E3            [19]  636 	ex	(sp),hl
   22F8 CD 9B 29      [17]  637 	call	_cpc_SetInkGphStr
                            638 ;src/main.c:213: cpc_SetInkGphStr(2,8);
   22FB 21 02 08      [10]  639 	ld	hl, #0x0802
   22FE E3            [19]  640 	ex	(sp),hl
   22FF CD 9B 29      [17]  641 	call	_cpc_SetInkGphStr
                            642 ;src/main.c:214: cpc_SetInkGphStr(3,42);
   2302 21 03 2A      [10]  643 	ld	hl, #0x2A03
   2305 E3            [19]  644 	ex	(sp),hl
   2306 CD 9B 29      [17]  645 	call	_cpc_SetInkGphStr
   2309 F1            [10]  646 	pop	af
   230A C9            [10]  647 	ret
                            648 ;src/main.c:222: void main(void) {
                            649 ;	---------------------------------
                            650 ; Function main
                            651 ; ---------------------------------
   230B                     652 _main::
                            653 ;src/main.c:225: set_stack(0x1000);
   230B 21 00 10      [10]  654 	ld	hl,#0x1000
   230E E5            [11]  655 	push	hl
   230F CD A9 2C      [17]  656 	call	_set_stack
   2312 F1            [10]  657 	pop	af
                            658 ;src/main.c:227: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   2313 CD 05 2F      [17]  659 	call	_cpct_disableFirmware
                            660 ;src/main.c:229: cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
   2316 11 AF 24      [10]  661 	ld	de,#_G_palette
   2319 3E 10         [ 7]  662 	ld	a,#0x10
   231B F5            [11]  663 	push	af
   231C 33            [ 6]  664 	inc	sp
   231D D5            [11]  665 	push	de
   231E CD AF 2C      [17]  666 	call	_cpct_setPalette
   2321 F1            [10]  667 	pop	af
   2322 33            [ 6]  668 	inc	sp
                            669 ;src/main.c:230: cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
   2323 3A B0 24      [13]  670 	ld	a, (#_G_palette + 1)
   2326 57            [ 4]  671 	ld	d,a
   2327 1E 10         [ 7]  672 	ld	e,#0x10
   2329 D5            [11]  673 	push	de
   232A CD C5 2D      [17]  674 	call	_cpct_setPALColour
   232D F1            [10]  675 	pop	af
                            676 ;src/main.c:231: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   232E AF            [ 4]  677 	xor	a, a
   232F F5            [11]  678 	push	af
   2330 33            [ 6]  679 	inc	sp
   2331 CD B8 2E      [17]  680 	call	_cpct_setVideoMode
   2334 33            [ 6]  681 	inc	sp
                            682 ;src/main.c:234: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   2335 21 00 40      [10]  683 	ld	hl,#0x4000
   2338 E5            [11]  684 	push	hl
   2339 AF            [ 4]  685 	xor	a, a
   233A F5            [11]  686 	push	af
   233B 33            [ 6]  687 	inc	sp
   233C 26 C0         [ 7]  688 	ld	h, #0xC0
   233E E5            [11]  689 	push	hl
   233F CD EE 2E      [17]  690 	call	_cpct_memset
   2342 F1            [10]  691 	pop	af
   2343 F1            [10]  692 	pop	af
   2344 33            [ 6]  693 	inc	sp
                            694 ;src/main.c:235: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   2345 21 00 40      [10]  695 	ld	hl,#0x4000
   2348 E5            [11]  696 	push	hl
   2349 AF            [ 4]  697 	xor	a, a
   234A F5            [11]  698 	push	af
   234B 33            [ 6]  699 	inc	sp
   234C 26 80         [ 7]  700 	ld	h, #0x80
   234E E5            [11]  701 	push	hl
   234F CD EE 2E      [17]  702 	call	_cpct_memset
   2352 F1            [10]  703 	pop	af
   2353 F1            [10]  704 	pop	af
   2354 33            [ 6]  705 	inc	sp
                            706 ;src/main.c:237: initialization(); 
   2355 CD 8A 22      [17]  707 	call	_initialization
                            708 ;src/main.c:240: while (1){
   2358                     709 00104$:
                            710 ;src/main.c:242: clear_screen(pvmem);
   2358 2A 71 31      [16]  711 	ld	hl,(_pvmem)
   235B E5            [11]  712 	push	hl
   235C CD B7 20      [17]  713 	call	_clear_screen
   235F F1            [10]  714 	pop	af
                            715 ;src/main.c:244: updateUser();
   2360 CD 5A 21      [17]  716 	call	_updateUser
                            717 ;src/main.c:245: updateBlock();
   2363 CD CA 20      [17]  718 	call	_updateBlock
                            719 ;src/main.c:247: moverEstrellas();
   2366 CD D5 26      [17]  720 	call	_moverEstrellas
                            721 ;src/main.c:248: pintarEstrellas(pvmem);
   2369 2A 71 31      [16]  722 	ld	hl,(_pvmem)
   236C E5            [11]  723 	push	hl
   236D CD 5A 26      [17]  724 	call	_pintarEstrellas
   2370 F1            [10]  725 	pop	af
                            726 ;src/main.c:253: draw_sprite(pvmem);
   2371 2A 71 31      [16]  727 	ld	hl,(_pvmem)
   2374 E5            [11]  728 	push	hl
   2375 CD 28 20      [17]  729 	call	_draw_sprite
   2378 F1            [10]  730 	pop	af
                            731 ;src/main.c:255: pvmem = changeVideoMemoryPage();
   2379 CD 00 20      [17]  732 	call	_changeVideoMemoryPage
   237C 22 71 31      [16]  733 	ld	(_pvmem),hl
                            734 ;src/main.c:258: cpct_waitVSYNC();
   237F CD B0 2E      [17]  735 	call	_cpct_waitVSYNC
   2382 18 D4         [12]  736 	jr	00104$
                            737 	.area _CODE
                            738 	.area _INITIALIZER
                            739 	.area _CABS (ABS)
