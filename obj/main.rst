                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jun 14 18:05:38 2015
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
                             15 	.globl _drawFrame
                             16 	.globl _updateBlock
                             17 	.globl _clear_screen
                             18 	.globl _draw_blocks
                             19 	.globl _draw_sprite
                             20 	.globl _changeVideoMemoryPage
                             21 	.globl _moverEstrellas
                             22 	.globl _pintarEstrellas
                             23 	.globl _inicializarEstrellas
                             24 	.globl _cpct_getScreenPtr
                             25 	.globl _cpct_setVideoMemoryPage
                             26 	.globl _cpct_setPALColour
                             27 	.globl _cpct_setPalette
                             28 	.globl _cpct_waitVSYNC
                             29 	.globl _cpct_setVideoMode
                             30 	.globl _cpct_drawSolidBox
                             31 	.globl _cpct_drawSprite
                             32 	.globl _cpct_px2byteM0
                             33 	.globl _cpct_memset
                             34 	.globl _cpct_isKeyPressed
                             35 	.globl _cpct_scanKeyboard_f
                             36 	.globl _cpct_disableFirmware
                             37 	.globl _pvmem
                             38 	.globl _user
                             39 	.globl _block02
                             40 	.globl _block01
                             41 ;--------------------------------------------------------
                             42 ; special function registers
                             43 ;--------------------------------------------------------
                             44 ;--------------------------------------------------------
                             45 ; ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DATA
   2D08                      48 _block01::
   2D08                      49 	.ds 7
   2D0F                      50 _block02::
   2D0F                      51 	.ds 7
   2D16                      52 _user::
   2D16                      53 	.ds 15
   2D25                      54 _pvmem::
   2D25                      55 	.ds 2
   2D27                      56 _changeVideoMemoryPage_page_1_58:
   2D27                      57 	.ds 1
                             58 ;--------------------------------------------------------
                             59 ; ram data
                             60 ;--------------------------------------------------------
                             61 	.area _INITIALIZED
                             62 ;--------------------------------------------------------
                             63 ; absolute external ram data
                             64 ;--------------------------------------------------------
                             65 	.area _DABS (ABS)
                             66 ;--------------------------------------------------------
                             67 ; global & static initialisations
                             68 ;--------------------------------------------------------
                             69 	.area _HOME
                             70 	.area _GSINIT
                             71 	.area _GSFINAL
                             72 	.area _GSINIT
                             73 ;src/main.c:54: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   2EFB FD 21 27 2D   [14]   74 	ld	iy,#_changeVideoMemoryPage_page_1_58
   2EFF FD 36 00 00   [19]   75 	ld	0 (iy),#0x00
                             76 ;--------------------------------------------------------
                             77 ; Home
                             78 ;--------------------------------------------------------
                             79 	.area _HOME
                             80 	.area _HOME
                             81 ;--------------------------------------------------------
                             82 ; code
                             83 ;--------------------------------------------------------
                             84 	.area _CODE
                             85 ;src/main.c:53: u8* changeVideoMemoryPage() {
                             86 ;	---------------------------------
                             87 ; Function changeVideoMemoryPage
                             88 ; ---------------------------------
   2000                      89 _changeVideoMemoryPage::
                             90 ;src/main.c:59: if (page) {
   2000 3A 27 2D      [13]   91 	ld	a,(#_changeVideoMemoryPage_page_1_58 + 0)
   2003 B7            [ 4]   92 	or	a, a
   2004 28 11         [12]   93 	jr	Z,00102$
                             94 ;src/main.c:60: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]   95 	ld	a,#0x30
   2008 F5            [11]   96 	push	af
   2009 33            [ 6]   97 	inc	sp
   200A CD 3B 2A      [17]   98 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]   99 	inc	sp
                            100 ;src/main.c:61: page = 0;  
   200E 21 27 2D      [10]  101 	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
   2011 36 00         [10]  102 	ld	(hl), #0x00
                            103 ;src/main.c:62: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 40      [10]  104 	ld	hl,#0x4000
   2016 C9            [10]  105 	ret
   2017                     106 00102$:
                            107 ;src/main.c:64: cpct_setVideoMemoryPage(cpct_page40);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 10         [ 7]  108 	ld	a,#0x10
   2019 F5            [11]  109 	push	af
   201A 33            [ 6]  110 	inc	sp
   201B CD 3B 2A      [17]  111 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  112 	inc	sp
                            113 ;src/main.c:65: page = 1;                              // Next page = 1
   201F 21 27 2D      [10]  114 	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
   2022 36 01         [10]  115 	ld	(hl), #0x01
                            116 ;src/main.c:66: screen = SCR_VMEM;
   2024 21 00 C0      [10]  117 	ld	hl,#0xC000
                            118 ;src/main.c:68: return screen;
   2027 C9            [10]  119 	ret
                            120 ;src/main.c:72: void draw_sprite(u8* screen){
                            121 ;	---------------------------------
                            122 ; Function draw_sprite
                            123 ; ---------------------------------
   2028                     124 _draw_sprite::
   2028 DD E5         [15]  125 	push	ix
   202A DD 21 00 00   [14]  126 	ld	ix,#0
   202E DD 39         [15]  127 	add	ix,sp
                            128 ;src/main.c:74: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   2030 21 1B 2D      [10]  129 	ld	hl, #_user + 5
   2033 4E            [ 7]  130 	ld	c,(hl)
   2034 21 1A 2D      [10]  131 	ld	hl, #_user + 4
   2037 66            [ 7]  132 	ld	h,(hl)
   2038 DD 5E 04      [19]  133 	ld	e,4 (ix)
   203B DD 56 05      [19]  134 	ld	d,5 (ix)
   203E 79            [ 4]  135 	ld	a,c
   203F F5            [11]  136 	push	af
   2040 33            [ 6]  137 	inc	sp
   2041 E5            [11]  138 	push	hl
   2042 33            [ 6]  139 	inc	sp
   2043 D5            [11]  140 	push	de
   2044 CD A3 2B      [17]  141 	call	_cpct_getScreenPtr
   2047 F1            [10]  142 	pop	af
   2048 F1            [10]  143 	pop	af
   2049 EB            [ 4]  144 	ex	de,hl
                            145 ;src/main.c:75: cpct_drawSprite(ship01,pscreen,user.w,user.h);
   204A 21 1D 2D      [10]  146 	ld	hl, #_user + 7
   204D 4E            [ 7]  147 	ld	c,(hl)
   204E 21 1C 2D      [10]  148 	ld	hl, #_user + 6
   2051 46            [ 7]  149 	ld	b,(hl)
   2052 79            [ 4]  150 	ld	a,c
   2053 F5            [11]  151 	push	af
   2054 33            [ 6]  152 	inc	sp
   2055 C5            [11]  153 	push	bc
   2056 33            [ 6]  154 	inc	sp
   2057 D5            [11]  155 	push	de
   2058 21 4D 25      [10]  156 	ld	hl,#_ship01
   205B E5            [11]  157 	push	hl
   205C CD 89 29      [17]  158 	call	_cpct_drawSprite
   205F 21 06 00      [10]  159 	ld	hl,#6
   2062 39            [11]  160 	add	hl,sp
   2063 F9            [ 6]  161 	ld	sp,hl
   2064 DD E1         [14]  162 	pop	ix
   2066 C9            [10]  163 	ret
                            164 ;src/main.c:79: void draw_blocks(u8* screen){
                            165 ;	---------------------------------
                            166 ; Function draw_blocks
                            167 ; ---------------------------------
   2067                     168 _draw_blocks::
   2067 DD E5         [15]  169 	push	ix
   2069 DD 21 00 00   [14]  170 	ld	ix,#0
   206D DD 39         [15]  171 	add	ix,sp
   206F F5            [11]  172 	push	af
   2070 3B            [ 6]  173 	dec	sp
                            174 ;src/main.c:82: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2071 21 09 2D      [10]  175 	ld	hl, #_block01 + 1
   2074 46            [ 7]  176 	ld	b,(hl)
   2075 21 08 2D      [10]  177 	ld	hl, #_block01 + 0
   2078 56            [ 7]  178 	ld	d,(hl)
   2079 DD 7E 04      [19]  179 	ld	a,4 (ix)
   207C DD 77 FD      [19]  180 	ld	-3 (ix),a
   207F DD 7E 05      [19]  181 	ld	a,5 (ix)
   2082 DD 77 FE      [19]  182 	ld	-2 (ix),a
   2085 4A            [ 4]  183 	ld	c, d
   2086 C5            [11]  184 	push	bc
   2087 C1            [10]  185 	pop	bc
   2088 E1            [10]  186 	pop	hl
   2089 E5            [11]  187 	push	hl
   208A C5            [11]  188 	push	bc
   208B E5            [11]  189 	push	hl
   208C CD A3 2B      [17]  190 	call	_cpct_getScreenPtr
   208F F1            [10]  191 	pop	af
   2090 F1            [10]  192 	pop	af
   2091 5D            [ 4]  193 	ld	e, l
   2092 54            [ 4]  194 	ld	d, h
                            195 ;src/main.c:83: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   2093 21 0D 2D      [10]  196 	ld	hl, #_block01 + 5
   2096 4E            [ 7]  197 	ld	c,(hl)
   2097 21 0C 2D      [10]  198 	ld	hl, #_block01 + 4
   209A 46            [ 7]  199 	ld	b,(hl)
   209B C5            [11]  200 	push	bc
   209C D5            [11]  201 	push	de
   209D 21 04 04      [10]  202 	ld	hl,#0x0404
   20A0 E5            [11]  203 	push	hl
   20A1 CD 7E 2A      [17]  204 	call	_cpct_px2byteM0
   20A4 F1            [10]  205 	pop	af
   20A5 DD 75 FF      [19]  206 	ld	-1 (ix),l
   20A8 D1            [10]  207 	pop	de
   20A9 C1            [10]  208 	pop	bc
   20AA 79            [ 4]  209 	ld	a,c
   20AB F5            [11]  210 	push	af
   20AC 33            [ 6]  211 	inc	sp
   20AD C5            [11]  212 	push	bc
   20AE 33            [ 6]  213 	inc	sp
   20AF DD 7E FF      [19]  214 	ld	a,-1 (ix)
   20B2 F5            [11]  215 	push	af
   20B3 33            [ 6]  216 	inc	sp
   20B4 D5            [11]  217 	push	de
   20B5 CD D1 2A      [17]  218 	call	_cpct_drawSolidBox
   20B8 F1            [10]  219 	pop	af
   20B9 F1            [10]  220 	pop	af
   20BA 33            [ 6]  221 	inc	sp
                            222 ;src/main.c:85: pscreen = cpct_getScreenPtr(screen, block02.x, block02.y);
   20BB 21 10 2D      [10]  223 	ld	hl, #_block02 + 1
   20BE 56            [ 7]  224 	ld	d,(hl)
   20BF 3A 0F 2D      [13]  225 	ld	a, (#_block02 + 0)
   20C2 D5            [11]  226 	push	de
   20C3 33            [ 6]  227 	inc	sp
   20C4 F5            [11]  228 	push	af
   20C5 33            [ 6]  229 	inc	sp
   20C6 C1            [10]  230 	pop	bc
   20C7 E1            [10]  231 	pop	hl
   20C8 E5            [11]  232 	push	hl
   20C9 C5            [11]  233 	push	bc
   20CA E5            [11]  234 	push	hl
   20CB CD A3 2B      [17]  235 	call	_cpct_getScreenPtr
   20CE F1            [10]  236 	pop	af
   20CF F1            [10]  237 	pop	af
   20D0 5D            [ 4]  238 	ld	e, l
   20D1 54            [ 4]  239 	ld	d, h
                            240 ;src/main.c:86: cpct_drawSolidBox(pscreen, cpct_px2byteM0(6, 6), block02.w, block02.h);    
   20D2 21 14 2D      [10]  241 	ld	hl, #_block02 + 5
   20D5 4E            [ 7]  242 	ld	c,(hl)
   20D6 21 13 2D      [10]  243 	ld	hl, #_block02 + 4
   20D9 46            [ 7]  244 	ld	b,(hl)
   20DA C5            [11]  245 	push	bc
   20DB D5            [11]  246 	push	de
   20DC 21 06 06      [10]  247 	ld	hl,#0x0606
   20DF E5            [11]  248 	push	hl
   20E0 CD 7E 2A      [17]  249 	call	_cpct_px2byteM0
   20E3 F1            [10]  250 	pop	af
   20E4 DD 75 FF      [19]  251 	ld	-1 (ix),l
   20E7 D1            [10]  252 	pop	de
   20E8 C1            [10]  253 	pop	bc
   20E9 79            [ 4]  254 	ld	a,c
   20EA F5            [11]  255 	push	af
   20EB 33            [ 6]  256 	inc	sp
   20EC C5            [11]  257 	push	bc
   20ED 33            [ 6]  258 	inc	sp
   20EE DD 7E FF      [19]  259 	ld	a,-1 (ix)
   20F1 F5            [11]  260 	push	af
   20F2 33            [ 6]  261 	inc	sp
   20F3 D5            [11]  262 	push	de
   20F4 CD D1 2A      [17]  263 	call	_cpct_drawSolidBox
   20F7 DD F9         [10]  264 	ld	sp,ix
   20F9 DD E1         [14]  265 	pop	ix
   20FB C9            [10]  266 	ret
                            267 ;src/main.c:90: void clear_screen(u8* screen){
                            268 ;	---------------------------------
                            269 ; Function clear_screen
                            270 ; ---------------------------------
   20FC                     271 _clear_screen::
                            272 ;src/main.c:91: cpct_memset(screen, 0x00, 0x4000);   
   20FC C1            [10]  273 	pop	bc
   20FD D1            [10]  274 	pop	de
   20FE D5            [11]  275 	push	de
   20FF C5            [11]  276 	push	bc
   2100 21 00 40      [10]  277 	ld	hl,#0x4000
   2103 E5            [11]  278 	push	hl
   2104 AF            [ 4]  279 	xor	a, a
   2105 F5            [11]  280 	push	af
   2106 33            [ 6]  281 	inc	sp
   2107 D5            [11]  282 	push	de
   2108 CD A2 2A      [17]  283 	call	_cpct_memset
   210B F1            [10]  284 	pop	af
   210C F1            [10]  285 	pop	af
   210D 33            [ 6]  286 	inc	sp
   210E C9            [10]  287 	ret
                            288 ;src/main.c:95: void updateBlock(){
                            289 ;	---------------------------------
                            290 ; Function updateBlock
                            291 ; ---------------------------------
   210F                     292 _updateBlock::
                            293 ;src/main.c:96: if (block01.vx>0){
   210F 21 0A 2D      [10]  294 	ld	hl, #(_block01 + 0x0002) + 0
   2112 46            [ 7]  295 	ld	b,(hl)
                            296 ;src/main.c:97: if ((block01.x+block01.vx)<79){
   2113 21 08 2D      [10]  297 	ld	hl, #_block01 + 0
   2116 4E            [ 7]  298 	ld	c,(hl)
   2117 68            [ 4]  299 	ld	l,b
   2118 26 00         [ 7]  300 	ld	h,#0x00
   211A 59            [ 4]  301 	ld	e,c
   211B 16 00         [ 7]  302 	ld	d,#0x00
                            303 ;src/main.c:98: block01.x = block01.x + block01.vx;
   211D 79            [ 4]  304 	ld	a,c
   211E 80            [ 4]  305 	add	a, b
   211F 4F            [ 4]  306 	ld	c,a
                            307 ;src/main.c:97: if ((block01.x+block01.vx)<79){
   2120 19            [11]  308 	add	hl,de
   2121 5D            [ 4]  309 	ld	e,l
   2122 54            [ 4]  310 	ld	d,h
                            311 ;src/main.c:96: if (block01.vx>0){
   2123 78            [ 4]  312 	ld	a,b
   2124 B7            [ 4]  313 	or	a, a
   2125 28 27         [12]  314 	jr	Z,00108$
                            315 ;src/main.c:97: if ((block01.x+block01.vx)<79){
   2127 7B            [ 4]  316 	ld	a,e
   2128 D6 4F         [ 7]  317 	sub	a, #0x4F
   212A 7A            [ 4]  318 	ld	a,d
   212B 17            [ 4]  319 	rla
   212C 3F            [ 4]  320 	ccf
   212D 1F            [ 4]  321 	rra
   212E DE 80         [ 7]  322 	sbc	a, #0x80
   2130 30 05         [12]  323 	jr	NC,00102$
                            324 ;src/main.c:98: block01.x = block01.x + block01.vx;
   2132 21 08 2D      [10]  325 	ld	hl,#_block01
   2135 71            [ 7]  326 	ld	(hl),c
   2136 C9            [10]  327 	ret
   2137                     328 00102$:
                            329 ;src/main.c:101: block01.x = 79-block01.w;
   2137 21 0C 2D      [10]  330 	ld	hl, #_block01 + 4
   213A 66            [ 7]  331 	ld	h,(hl)
   213B 3E 4F         [ 7]  332 	ld	a,#0x4F
   213D 94            [ 4]  333 	sub	a, h
   213E 21 08 2D      [10]  334 	ld	hl,#_block01
   2141 77            [ 7]  335 	ld	(hl),a
                            336 ;src/main.c:102: block01.vx = - block01.vx;
   2142 21 0A 2D      [10]  337 	ld	hl, #(_block01 + 0x0002) + 0
   2145 66            [ 7]  338 	ld	h,(hl)
   2146 AF            [ 4]  339 	xor	a, a
   2147 94            [ 4]  340 	sub	a, h
   2148 57            [ 4]  341 	ld	d,a
   2149 21 0A 2D      [10]  342 	ld	hl,#(_block01 + 0x0002)
   214C 72            [ 7]  343 	ld	(hl),d
   214D C9            [10]  344 	ret
   214E                     345 00108$:
                            346 ;src/main.c:105: if ((block01.x+block01.vx)>0){
   214E AF            [ 4]  347 	xor	a, a
   214F BB            [ 4]  348 	cp	a, e
   2150 9A            [ 4]  349 	sbc	a, d
   2151 E2 56 21      [10]  350 	jp	PO, 00124$
   2154 EE 80         [ 7]  351 	xor	a, #0x80
   2156                     352 00124$:
   2156 F2 5E 21      [10]  353 	jp	P,00105$
                            354 ;src/main.c:106: block01.x = block01.x + block01.vx;
   2159 21 08 2D      [10]  355 	ld	hl,#_block01
   215C 71            [ 7]  356 	ld	(hl),c
   215D C9            [10]  357 	ret
   215E                     358 00105$:
                            359 ;src/main.c:109: block01.x = 0;
   215E 21 08 2D      [10]  360 	ld	hl,#_block01
   2161 36 00         [10]  361 	ld	(hl),#0x00
                            362 ;src/main.c:110: block01.vx = - block01.vx;
   2163 21 0A 2D      [10]  363 	ld	hl, #(_block01 + 0x0002) + 0
   2166 66            [ 7]  364 	ld	h,(hl)
   2167 AF            [ 4]  365 	xor	a, a
   2168 94            [ 4]  366 	sub	a, h
   2169 57            [ 4]  367 	ld	d,a
   216A 21 0A 2D      [10]  368 	ld	hl,#(_block01 + 0x0002)
   216D 72            [ 7]  369 	ld	(hl),d
   216E C9            [10]  370 	ret
                            371 ;src/main.c:118: void drawFrame(u8* screen) {
                            372 ;	---------------------------------
                            373 ; Function drawFrame
                            374 ; ---------------------------------
   216F                     375 _drawFrame::
   216F DD E5         [15]  376 	push	ix
   2171 DD 21 00 00   [14]  377 	ld	ix,#0
   2175 DD 39         [15]  378 	add	ix,sp
                            379 ;src/main.c:123: pattern = cpct_px2byteM0 (15, 15);
   2177 21 0F 0F      [10]  380 	ld	hl,#0x0F0F
   217A E5            [11]  381 	push	hl
   217B CD 7E 2A      [17]  382 	call	_cpct_px2byteM0
   217E F1            [10]  383 	pop	af
   217F 45            [ 4]  384 	ld	b,l
                            385 ;src/main.c:126: pv = cpct_getScreenPtr(screen, (BACK_X),  (BACK_Y));
   2180 DD 5E 04      [19]  386 	ld	e,4 (ix)
   2183 DD 56 05      [19]  387 	ld	d,5 (ix)
   2186 C5            [11]  388 	push	bc
   2187 D5            [11]  389 	push	de
   2188 21 00 00      [10]  390 	ld	hl,#0x0000
   218B E5            [11]  391 	push	hl
   218C D5            [11]  392 	push	de
   218D CD A3 2B      [17]  393 	call	_cpct_getScreenPtr
   2190 F1            [10]  394 	pop	af
   2191 F1            [10]  395 	pop	af
   2192 D1            [10]  396 	pop	de
   2193 C1            [10]  397 	pop	bc
                            398 ;src/main.c:127: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
   2194 E5            [11]  399 	push	hl
   2195 FD E1         [14]  400 	pop	iy
   2197 C5            [11]  401 	push	bc
   2198 D5            [11]  402 	push	de
   2199 21 40 04      [10]  403 	ld	hl,#0x0440
   219C E5            [11]  404 	push	hl
   219D C5            [11]  405 	push	bc
   219E 33            [ 6]  406 	inc	sp
   219F FD E5         [15]  407 	push	iy
   21A1 CD D1 2A      [17]  408 	call	_cpct_drawSolidBox
   21A4 F1            [10]  409 	pop	af
   21A5 F1            [10]  410 	pop	af
   21A6 33            [ 6]  411 	inc	sp
   21A7 D1            [10]  412 	pop	de
   21A8 D5            [11]  413 	push	de
   21A9 21 00 C5      [10]  414 	ld	hl,#0xC500
   21AC E5            [11]  415 	push	hl
   21AD D5            [11]  416 	push	de
   21AE CD A3 2B      [17]  417 	call	_cpct_getScreenPtr
   21B1 F1            [10]  418 	pop	af
   21B2 F1            [10]  419 	pop	af
   21B3 D1            [10]  420 	pop	de
   21B4 C1            [10]  421 	pop	bc
                            422 ;src/main.c:131: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
   21B5 E5            [11]  423 	push	hl
   21B6 FD E1         [14]  424 	pop	iy
   21B8 C5            [11]  425 	push	bc
   21B9 D5            [11]  426 	push	de
   21BA 21 40 04      [10]  427 	ld	hl,#0x0440
   21BD E5            [11]  428 	push	hl
   21BE C5            [11]  429 	push	bc
   21BF 33            [ 6]  430 	inc	sp
   21C0 FD E5         [15]  431 	push	iy
   21C2 CD D1 2A      [17]  432 	call	_cpct_drawSolidBox
   21C5 F1            [10]  433 	pop	af
   21C6 F1            [10]  434 	pop	af
   21C7 33            [ 6]  435 	inc	sp
   21C8 D1            [10]  436 	pop	de
   21C9 D5            [11]  437 	push	de
   21CA 21 00 00      [10]  438 	ld	hl,#0x0000
   21CD E5            [11]  439 	push	hl
   21CE D5            [11]  440 	push	de
   21CF CD A3 2B      [17]  441 	call	_cpct_getScreenPtr
   21D2 F1            [10]  442 	pop	af
   21D3 F1            [10]  443 	pop	af
   21D4 D1            [10]  444 	pop	de
   21D5 C1            [10]  445 	pop	bc
                            446 ;src/main.c:135: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
   21D6 E5            [11]  447 	push	hl
   21D7 FD E1         [14]  448 	pop	iy
   21D9 C5            [11]  449 	push	bc
   21DA D5            [11]  450 	push	de
   21DB 21 02 C7      [10]  451 	ld	hl,#0xC702
   21DE E5            [11]  452 	push	hl
   21DF C5            [11]  453 	push	bc
   21E0 33            [ 6]  454 	inc	sp
   21E1 FD E5         [15]  455 	push	iy
   21E3 CD D1 2A      [17]  456 	call	_cpct_drawSolidBox
   21E6 F1            [10]  457 	pop	af
   21E7 F1            [10]  458 	pop	af
   21E8 33            [ 6]  459 	inc	sp
   21E9 D1            [10]  460 	pop	de
   21EA 21 3E 00      [10]  461 	ld	hl,#0x003E
   21ED E5            [11]  462 	push	hl
   21EE D5            [11]  463 	push	de
   21EF CD A3 2B      [17]  464 	call	_cpct_getScreenPtr
   21F2 F1            [10]  465 	pop	af
   21F3 F1            [10]  466 	pop	af
   21F4 C1            [10]  467 	pop	bc
                            468 ;src/main.c:139: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
   21F5 EB            [ 4]  469 	ex	de,hl
   21F6 21 02 C7      [10]  470 	ld	hl,#0xC702
   21F9 E5            [11]  471 	push	hl
   21FA C5            [11]  472 	push	bc
   21FB 33            [ 6]  473 	inc	sp
   21FC D5            [11]  474 	push	de
   21FD CD D1 2A      [17]  475 	call	_cpct_drawSolidBox
   2200 F1            [10]  476 	pop	af
   2201 F1            [10]  477 	pop	af
   2202 33            [ 6]  478 	inc	sp
   2203 DD E1         [14]  479 	pop	ix
   2205 C9            [10]  480 	ret
                            481 ;src/main.c:145: void updateUser() {
                            482 ;	---------------------------------
                            483 ; Function updateUser
                            484 ; ---------------------------------
   2206                     485 _updateUser::
   2206 DD E5         [15]  486 	push	ix
   2208 DD 21 00 00   [14]  487 	ld	ix,#0
   220C DD 39         [15]  488 	add	ix,sp
   220E 3B            [ 6]  489 	dec	sp
                            490 ;src/main.c:147: cpct_scanKeyboard_f();
   220F CD 98 28      [17]  491 	call	_cpct_scanKeyboard_f
                            492 ;src/main.c:154: if ((cpct_isKeyPressed(Key_CursorUp))){ 
   2212 21 00 01      [10]  493 	ld	hl,#0x0100
   2215 E5            [11]  494 	push	hl
   2216 CD 87 28      [17]  495 	call	_cpct_isKeyPressed
   2219 F1            [10]  496 	pop	af
   221A 7D            [ 4]  497 	ld	a,l
   221B B7            [ 4]  498 	or	a, a
   221C 28 2D         [12]  499 	jr	Z,00105$
                            500 ;src/main.c:155: if ((user.y-user.vy)>0)
   221E 21 1B 2D      [10]  501 	ld	hl, #(_user + 0x0005) + 0
   2221 5E            [ 7]  502 	ld	e,(hl)
   2222 4B            [ 4]  503 	ld	c,e
   2223 06 00         [ 7]  504 	ld	b,#0x00
   2225 21 23 2D      [10]  505 	ld	hl, #_user + 13
   2228 56            [ 7]  506 	ld	d,(hl)
   2229 7A            [ 4]  507 	ld	a,d
   222A 6F            [ 4]  508 	ld	l,a
   222B 17            [ 4]  509 	rla
   222C 9F            [ 4]  510 	sbc	a, a
   222D 67            [ 4]  511 	ld	h,a
   222E 79            [ 4]  512 	ld	a,c
   222F 95            [ 4]  513 	sub	a, l
   2230 6F            [ 4]  514 	ld	l,a
   2231 78            [ 4]  515 	ld	a,b
   2232 9C            [ 4]  516 	sbc	a, h
   2233 67            [ 4]  517 	ld	h,a
   2234 AF            [ 4]  518 	xor	a, a
   2235 BD            [ 4]  519 	cp	a, l
   2236 9C            [ 4]  520 	sbc	a, h
   2237 E2 3C 22      [10]  521 	jp	PO, 00155$
   223A EE 80         [ 7]  522 	xor	a, #0x80
   223C                     523 00155$:
   223C F2 46 22      [10]  524 	jp	P,00102$
                            525 ;src/main.c:156: user.y = user.y - user.vy;
   223F 7B            [ 4]  526 	ld	a,e
   2240 92            [ 4]  527 	sub	a, d
   2241 32 1B 2D      [13]  528 	ld	(#(_user + 0x0005)),a
   2244 18 05         [12]  529 	jr	00105$
   2246                     530 00102$:
                            531 ;src/main.c:158: user.y = 0;
   2246 21 1B 2D      [10]  532 	ld	hl,#(_user + 0x0005)
   2249 36 00         [10]  533 	ld	(hl),#0x00
   224B                     534 00105$:
                            535 ;src/main.c:161: if ((cpct_isKeyPressed(Key_CursorRight))){ 
   224B 21 00 02      [10]  536 	ld	hl,#0x0200
   224E E5            [11]  537 	push	hl
   224F CD 87 28      [17]  538 	call	_cpct_isKeyPressed
   2252 F1            [10]  539 	pop	af
   2253 7D            [ 4]  540 	ld	a,l
   2254 B7            [ 4]  541 	or	a, a
   2255 28 3F         [12]  542 	jr	Z,00110$
                            543 ;src/main.c:162: if ((user.x+user.vx<(79-user.w)))
   2257 21 1A 2D      [10]  544 	ld	hl, #(_user + 0x0004) + 0
   225A 5E            [ 7]  545 	ld	e,(hl)
   225B 4B            [ 4]  546 	ld	c,e
   225C 06 00         [ 7]  547 	ld	b,#0x00
   225E 21 22 2D      [10]  548 	ld	hl, #_user + 12
   2261 56            [ 7]  549 	ld	d,(hl)
   2262 7A            [ 4]  550 	ld	a,d
   2263 6F            [ 4]  551 	ld	l,a
   2264 17            [ 4]  552 	rla
   2265 9F            [ 4]  553 	sbc	a, a
   2266 67            [ 4]  554 	ld	h,a
   2267 09            [11]  555 	add	hl,bc
   2268 4D            [ 4]  556 	ld	c,l
   2269 44            [ 4]  557 	ld	b,h
   226A 3A 1C 2D      [13]  558 	ld	a,(#_user + 6)
   226D DD 77 FF      [19]  559 	ld	-1 (ix), a
   2270 6F            [ 4]  560 	ld	l, a
   2271 26 00         [ 7]  561 	ld	h,#0x00
   2273 3E 4F         [ 7]  562 	ld	a,#0x4F
   2275 95            [ 4]  563 	sub	a, l
   2276 6F            [ 4]  564 	ld	l,a
   2277 3E 00         [ 7]  565 	ld	a,#0x00
   2279 9C            [ 4]  566 	sbc	a, h
   227A 67            [ 4]  567 	ld	h,a
   227B 79            [ 4]  568 	ld	a,c
   227C 95            [ 4]  569 	sub	a, l
   227D 78            [ 4]  570 	ld	a,b
   227E 9C            [ 4]  571 	sbc	a, h
   227F E2 84 22      [10]  572 	jp	PO, 00156$
   2282 EE 80         [ 7]  573 	xor	a, #0x80
   2284                     574 00156$:
   2284 F2 8E 22      [10]  575 	jp	P,00107$
                            576 ;src/main.c:163: user.x = user.x + user.vx;
   2287 7B            [ 4]  577 	ld	a,e
   2288 82            [ 4]  578 	add	a, d
   2289 32 1A 2D      [13]  579 	ld	(#(_user + 0x0004)),a
   228C 18 08         [12]  580 	jr	00110$
   228E                     581 00107$:
                            582 ;src/main.c:165: user.x = 79-user.w;
   228E 3E 4F         [ 7]  583 	ld	a,#0x4F
   2290 DD 96 FF      [19]  584 	sub	a, -1 (ix)
   2293 32 1A 2D      [13]  585 	ld	(#(_user + 0x0004)),a
   2296                     586 00110$:
                            587 ;src/main.c:168: if (cpct_isKeyPressed(Key_CursorLeft)){
   2296 21 01 01      [10]  588 	ld	hl,#0x0101
   2299 E5            [11]  589 	push	hl
   229A CD 87 28      [17]  590 	call	_cpct_isKeyPressed
   229D F1            [10]  591 	pop	af
   229E 7D            [ 4]  592 	ld	a,l
   229F B7            [ 4]  593 	or	a, a
   22A0 28 2D         [12]  594 	jr	Z,00115$
                            595 ;src/main.c:169: if ((user.x-user.vx)>0) 
   22A2 21 1A 2D      [10]  596 	ld	hl, #(_user + 0x0004) + 0
   22A5 5E            [ 7]  597 	ld	e,(hl)
   22A6 4B            [ 4]  598 	ld	c,e
   22A7 06 00         [ 7]  599 	ld	b,#0x00
   22A9 21 22 2D      [10]  600 	ld	hl, #_user + 12
   22AC 56            [ 7]  601 	ld	d,(hl)
   22AD 7A            [ 4]  602 	ld	a,d
   22AE 6F            [ 4]  603 	ld	l,a
   22AF 17            [ 4]  604 	rla
   22B0 9F            [ 4]  605 	sbc	a, a
   22B1 67            [ 4]  606 	ld	h,a
   22B2 79            [ 4]  607 	ld	a,c
   22B3 95            [ 4]  608 	sub	a, l
   22B4 6F            [ 4]  609 	ld	l,a
   22B5 78            [ 4]  610 	ld	a,b
   22B6 9C            [ 4]  611 	sbc	a, h
   22B7 67            [ 4]  612 	ld	h,a
   22B8 AF            [ 4]  613 	xor	a, a
   22B9 BD            [ 4]  614 	cp	a, l
   22BA 9C            [ 4]  615 	sbc	a, h
   22BB E2 C0 22      [10]  616 	jp	PO, 00157$
   22BE EE 80         [ 7]  617 	xor	a, #0x80
   22C0                     618 00157$:
   22C0 F2 CA 22      [10]  619 	jp	P,00112$
                            620 ;src/main.c:170: user.x = user.x - user.vx;    
   22C3 7B            [ 4]  621 	ld	a,e
   22C4 92            [ 4]  622 	sub	a, d
   22C5 32 1A 2D      [13]  623 	ld	(#(_user + 0x0004)),a
   22C8 18 05         [12]  624 	jr	00115$
   22CA                     625 00112$:
                            626 ;src/main.c:172: user.x = 0;
   22CA 21 1A 2D      [10]  627 	ld	hl,#(_user + 0x0004)
   22CD 36 00         [10]  628 	ld	(hl),#0x00
   22CF                     629 00115$:
                            630 ;src/main.c:175: if (cpct_isKeyPressed(Key_CursorDown)){
   22CF 21 00 04      [10]  631 	ld	hl,#0x0400
   22D2 E5            [11]  632 	push	hl
   22D3 CD 87 28      [17]  633 	call	_cpct_isKeyPressed
   22D6 F1            [10]  634 	pop	af
   22D7 7D            [ 4]  635 	ld	a,l
   22D8 B7            [ 4]  636 	or	a, a
   22D9 28 37         [12]  637 	jr	Z,00121$
                            638 ;src/main.c:176: if ((user.y<(199-user.h) ))
   22DB 21 1B 2D      [10]  639 	ld	hl, #(_user + 0x0005) + 0
   22DE 5E            [ 7]  640 	ld	e,(hl)
   22DF 3A 1D 2D      [13]  641 	ld	a,(#_user + 7)
   22E2 DD 77 FF      [19]  642 	ld	-1 (ix), a
   22E5 6F            [ 4]  643 	ld	l, a
   22E6 26 00         [ 7]  644 	ld	h,#0x00
   22E8 3E C7         [ 7]  645 	ld	a,#0xC7
   22EA 95            [ 4]  646 	sub	a, l
   22EB 6F            [ 4]  647 	ld	l,a
   22EC 3E 00         [ 7]  648 	ld	a,#0x00
   22EE 9C            [ 4]  649 	sbc	a, h
   22EF 67            [ 4]  650 	ld	h,a
   22F0 4B            [ 4]  651 	ld	c,e
   22F1 16 00         [ 7]  652 	ld	d,#0x00
   22F3 79            [ 4]  653 	ld	a,c
   22F4 95            [ 4]  654 	sub	a, l
   22F5 7A            [ 4]  655 	ld	a,d
   22F6 9C            [ 4]  656 	sbc	a, h
   22F7 E2 FC 22      [10]  657 	jp	PO, 00158$
   22FA EE 80         [ 7]  658 	xor	a, #0x80
   22FC                     659 00158$:
   22FC F2 0A 23      [10]  660 	jp	P,00117$
                            661 ;src/main.c:177: user.y = user.y + user.vy;
   22FF 21 23 2D      [10]  662 	ld	hl, #_user + 13
   2302 6E            [ 7]  663 	ld	l,(hl)
   2303 7B            [ 4]  664 	ld	a,e
   2304 85            [ 4]  665 	add	a, l
   2305 32 1B 2D      [13]  666 	ld	(#(_user + 0x0005)),a
   2308 18 08         [12]  667 	jr	00121$
   230A                     668 00117$:
                            669 ;src/main.c:179: user.y = 199-user.h;
   230A 3E C7         [ 7]  670 	ld	a,#0xC7
   230C DD 96 FF      [19]  671 	sub	a, -1 (ix)
   230F 32 1B 2D      [13]  672 	ld	(#(_user + 0x0005)),a
   2312                     673 00121$:
   2312 33            [ 6]  674 	inc	sp
   2313 DD E1         [14]  675 	pop	ix
   2315 C9            [10]  676 	ret
                            677 ;src/main.c:184: void initialization(){
                            678 ;	---------------------------------
                            679 ; Function initialization
                            680 ; ---------------------------------
   2316                     681 _initialization::
                            682 ;src/main.c:186: pvmem = SCR_BUFF;
   2316 21 00 40      [10]  683 	ld	hl,#0x4000
   2319 22 25 2D      [16]  684 	ld	(_pvmem),hl
                            685 ;src/main.c:189: inicializarEstrellas();
   231C CD 39 26      [17]  686 	call	_inicializarEstrellas
                            687 ;src/main.c:191: block01.x = 10;
   231F 21 08 2D      [10]  688 	ld	hl,#_block01+0
   2322 36 0A         [10]  689 	ld	(hl),#0x0A
                            690 ;src/main.c:192: block01.y = 10;
   2324 21 09 2D      [10]  691 	ld	hl,#_block01 + 1
   2327 36 0A         [10]  692 	ld	(hl),#0x0A
                            693 ;src/main.c:193: block01.vx = 2;
   2329 21 0A 2D      [10]  694 	ld	hl,#_block01 + 2
   232C 36 02         [10]  695 	ld	(hl),#0x02
                            696 ;src/main.c:194: block01.vy = 0;
   232E 21 0B 2D      [10]  697 	ld	hl,#_block01 + 3
   2331 36 00         [10]  698 	ld	(hl),#0x00
                            699 ;src/main.c:195: block01.w = 20;
   2333 21 0C 2D      [10]  700 	ld	hl,#_block01 + 4
   2336 36 14         [10]  701 	ld	(hl),#0x14
                            702 ;src/main.c:196: block01.h = 40;
   2338 21 0D 2D      [10]  703 	ld	hl,#_block01 + 5
   233B 36 28         [10]  704 	ld	(hl),#0x28
                            705 ;src/main.c:198: block02.x = 15;
   233D 21 0F 2D      [10]  706 	ld	hl,#_block02+0
   2340 36 0F         [10]  707 	ld	(hl),#0x0F
                            708 ;src/main.c:199: block02.y = 15;
   2342 21 10 2D      [10]  709 	ld	hl,#_block02 + 1
   2345 36 0F         [10]  710 	ld	(hl),#0x0F
                            711 ;src/main.c:200: block02.vx = 4;
   2347 21 11 2D      [10]  712 	ld	hl,#_block02 + 2
   234A 36 04         [10]  713 	ld	(hl),#0x04
                            714 ;src/main.c:201: block02.vy = 0;
   234C 21 12 2D      [10]  715 	ld	hl,#_block02 + 3
   234F 36 00         [10]  716 	ld	(hl),#0x00
                            717 ;src/main.c:202: block02.w = 25;
   2351 21 13 2D      [10]  718 	ld	hl,#_block02 + 4
   2354 36 19         [10]  719 	ld	(hl),#0x19
                            720 ;src/main.c:203: block02.h = 20;
   2356 21 14 2D      [10]  721 	ld	hl,#_block02 + 5
   2359 36 14         [10]  722 	ld	(hl),#0x14
                            723 ;src/main.c:205: user.x = 39;
   235B 21 1A 2D      [10]  724 	ld	hl,#_user + 4
   235E 36 27         [10]  725 	ld	(hl),#0x27
                            726 ;src/main.c:206: user.y = 183;
   2360 21 1B 2D      [10]  727 	ld	hl,#_user + 5
   2363 36 B7         [10]  728 	ld	(hl),#0xB7
                            729 ;src/main.c:207: user.w = 6;
   2365 21 1C 2D      [10]  730 	ld	hl,#_user + 6
   2368 36 06         [10]  731 	ld	(hl),#0x06
                            732 ;src/main.c:208: user.h = 16;
   236A 21 1D 2D      [10]  733 	ld	hl,#_user + 7
   236D 36 10         [10]  734 	ld	(hl),#0x10
                            735 ;src/main.c:209: user.vx = 2;
   236F 21 22 2D      [10]  736 	ld	hl,#_user + 12
   2372 36 02         [10]  737 	ld	(hl),#0x02
                            738 ;src/main.c:210: user.vy = 4;
   2374 21 23 2D      [10]  739 	ld	hl,#_user + 13
   2377 36 04         [10]  740 	ld	(hl),#0x04
   2379 C9            [10]  741 	ret
                            742 ;src/main.c:214: void main(void) {
                            743 ;	---------------------------------
                            744 ; Function main
                            745 ; ---------------------------------
   237A                     746 _main::
                            747 ;src/main.c:216: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   237A CD B9 2A      [17]  748 	call	_cpct_disableFirmware
                            749 ;src/main.c:218: cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
   237D 11 1E 25      [10]  750 	ld	de,#_G_palette
   2380 3E 10         [ 7]  751 	ld	a,#0x10
   2382 F5            [11]  752 	push	af
   2383 33            [ 6]  753 	inc	sp
   2384 D5            [11]  754 	push	de
   2385 CD 63 28      [17]  755 	call	_cpct_setPalette
   2388 F1            [10]  756 	pop	af
   2389 33            [ 6]  757 	inc	sp
                            758 ;src/main.c:219: cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
   238A 3A 1F 25      [13]  759 	ld	a, (#_G_palette + 1)
   238D 57            [ 4]  760 	ld	d,a
   238E 1E 10         [ 7]  761 	ld	e,#0x10
   2390 D5            [11]  762 	push	de
   2391 CD 79 29      [17]  763 	call	_cpct_setPALColour
   2394 F1            [10]  764 	pop	af
                            765 ;src/main.c:220: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2395 AF            [ 4]  766 	xor	a, a
   2396 F5            [11]  767 	push	af
   2397 33            [ 6]  768 	inc	sp
   2398 CD 6C 2A      [17]  769 	call	_cpct_setVideoMode
   239B 33            [ 6]  770 	inc	sp
                            771 ;src/main.c:223: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   239C 21 00 40      [10]  772 	ld	hl,#0x4000
   239F E5            [11]  773 	push	hl
   23A0 AF            [ 4]  774 	xor	a, a
   23A1 F5            [11]  775 	push	af
   23A2 33            [ 6]  776 	inc	sp
   23A3 26 C0         [ 7]  777 	ld	h, #0xC0
   23A5 E5            [11]  778 	push	hl
   23A6 CD A2 2A      [17]  779 	call	_cpct_memset
   23A9 F1            [10]  780 	pop	af
   23AA F1            [10]  781 	pop	af
   23AB 33            [ 6]  782 	inc	sp
                            783 ;src/main.c:224: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   23AC 21 00 40      [10]  784 	ld	hl,#0x4000
   23AF E5            [11]  785 	push	hl
   23B0 AF            [ 4]  786 	xor	a, a
   23B1 F5            [11]  787 	push	af
   23B2 33            [ 6]  788 	inc	sp
   23B3 2E 00         [ 7]  789 	ld	l, #0x00
   23B5 E5            [11]  790 	push	hl
   23B6 CD A2 2A      [17]  791 	call	_cpct_memset
   23B9 F1            [10]  792 	pop	af
   23BA F1            [10]  793 	pop	af
   23BB 33            [ 6]  794 	inc	sp
                            795 ;src/main.c:226: initialization(); 
   23BC CD 16 23      [17]  796 	call	_initialization
                            797 ;src/main.c:229: while (1){
   23BF                     798 00104$:
                            799 ;src/main.c:231: clear_screen(pvmem);
   23BF 2A 25 2D      [16]  800 	ld	hl,(_pvmem)
   23C2 E5            [11]  801 	push	hl
   23C3 CD FC 20      [17]  802 	call	_clear_screen
   23C6 F1            [10]  803 	pop	af
                            804 ;src/main.c:233: updateUser();
   23C7 CD 06 22      [17]  805 	call	_updateUser
                            806 ;src/main.c:234: updateBlock();
   23CA CD 0F 21      [17]  807 	call	_updateBlock
                            808 ;src/main.c:236: moverEstrellas();
   23CD CD A1 27      [17]  809 	call	_moverEstrellas
                            810 ;src/main.c:237: pintarEstrellas(pvmem);
   23D0 2A 25 2D      [16]  811 	ld	hl,(_pvmem)
   23D3 E5            [11]  812 	push	hl
   23D4 CD 26 27      [17]  813 	call	_pintarEstrellas
   23D7 F1            [10]  814 	pop	af
                            815 ;src/main.c:240: draw_blocks(pvmem);
   23D8 2A 25 2D      [16]  816 	ld	hl,(_pvmem)
   23DB E5            [11]  817 	push	hl
   23DC CD 67 20      [17]  818 	call	_draw_blocks
   23DF F1            [10]  819 	pop	af
                            820 ;src/main.c:243: draw_sprite(pvmem);
   23E0 2A 25 2D      [16]  821 	ld	hl,(_pvmem)
   23E3 E5            [11]  822 	push	hl
   23E4 CD 28 20      [17]  823 	call	_draw_sprite
   23E7 F1            [10]  824 	pop	af
                            825 ;src/main.c:246: pvmem = changeVideoMemoryPage();
   23E8 CD 00 20      [17]  826 	call	_changeVideoMemoryPage
   23EB 22 25 2D      [16]  827 	ld	(_pvmem),hl
                            828 ;src/main.c:249: cpct_waitVSYNC();
   23EE CD 64 2A      [17]  829 	call	_cpct_waitVSYNC
   23F1 18 CC         [12]  830 	jr	00104$
                            831 	.area _CODE
                            832 	.area _INITIALIZER
                            833 	.area _CABS (ABS)
