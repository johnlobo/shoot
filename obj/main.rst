                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jun 14 18:20:21 2015
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
   2D18                      48 _block01::
   2D18                      49 	.ds 7
   2D1F                      50 _block02::
   2D1F                      51 	.ds 7
   2D26                      52 _user::
   2D26                      53 	.ds 15
   2D35                      54 _pvmem::
   2D35                      55 	.ds 2
   2D37                      56 _changeVideoMemoryPage_page_1_58:
   2D37                      57 	.ds 1
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
   2F0B FD 21 37 2D   [14]   74 	ld	iy,#_changeVideoMemoryPage_page_1_58
   2F0F FD 36 00 00   [19]   75 	ld	0 (iy),#0x00
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
   2000 3A 37 2D      [13]   91 	ld	a,(#_changeVideoMemoryPage_page_1_58 + 0)
   2003 B7            [ 4]   92 	or	a, a
   2004 28 11         [12]   93 	jr	Z,00102$
                             94 ;src/main.c:60: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]   95 	ld	a,#0x30
   2008 F5            [11]   96 	push	af
   2009 33            [ 6]   97 	inc	sp
   200A CD 4B 2A      [17]   98 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]   99 	inc	sp
                            100 ;src/main.c:61: page = 0;  
   200E 21 37 2D      [10]  101 	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
   2011 36 00         [10]  102 	ld	(hl), #0x00
                            103 ;src/main.c:62: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 40      [10]  104 	ld	hl,#0x4000
   2016 C9            [10]  105 	ret
   2017                     106 00102$:
                            107 ;src/main.c:64: cpct_setVideoMemoryPage(cpct_page40);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 10         [ 7]  108 	ld	a,#0x10
   2019 F5            [11]  109 	push	af
   201A 33            [ 6]  110 	inc	sp
   201B CD 4B 2A      [17]  111 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  112 	inc	sp
                            113 ;src/main.c:65: page = 1;                              // Next page = 1
   201F 21 37 2D      [10]  114 	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
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
   2030 21 2B 2D      [10]  129 	ld	hl, #_user + 5
   2033 4E            [ 7]  130 	ld	c,(hl)
   2034 21 2A 2D      [10]  131 	ld	hl, #_user + 4
   2037 66            [ 7]  132 	ld	h,(hl)
   2038 DD 5E 04      [19]  133 	ld	e,4 (ix)
   203B DD 56 05      [19]  134 	ld	d,5 (ix)
   203E 79            [ 4]  135 	ld	a,c
   203F F5            [11]  136 	push	af
   2040 33            [ 6]  137 	inc	sp
   2041 E5            [11]  138 	push	hl
   2042 33            [ 6]  139 	inc	sp
   2043 D5            [11]  140 	push	de
   2044 CD B3 2B      [17]  141 	call	_cpct_getScreenPtr
   2047 F1            [10]  142 	pop	af
   2048 F1            [10]  143 	pop	af
   2049 EB            [ 4]  144 	ex	de,hl
                            145 ;src/main.c:75: cpct_drawSprite(ship01,pscreen,user.w,user.h);
   204A 21 2D 2D      [10]  146 	ld	hl, #_user + 7
   204D 4E            [ 7]  147 	ld	c,(hl)
   204E 21 2C 2D      [10]  148 	ld	hl, #_user + 6
   2051 46            [ 7]  149 	ld	b,(hl)
   2052 79            [ 4]  150 	ld	a,c
   2053 F5            [11]  151 	push	af
   2054 33            [ 6]  152 	inc	sp
   2055 C5            [11]  153 	push	bc
   2056 33            [ 6]  154 	inc	sp
   2057 D5            [11]  155 	push	de
   2058 21 5D 25      [10]  156 	ld	hl,#_ship01
   205B E5            [11]  157 	push	hl
   205C CD 99 29      [17]  158 	call	_cpct_drawSprite
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
   2071 21 19 2D      [10]  175 	ld	hl, #_block01 + 1
   2074 46            [ 7]  176 	ld	b,(hl)
   2075 21 18 2D      [10]  177 	ld	hl, #_block01 + 0
   2078 56            [ 7]  178 	ld	d,(hl)
   2079 DD 7E 04      [19]  179 	ld	a,4 (ix)
   207C DD 77 FE      [19]  180 	ld	-2 (ix),a
   207F DD 7E 05      [19]  181 	ld	a,5 (ix)
   2082 DD 77 FF      [19]  182 	ld	-1 (ix),a
   2085 4A            [ 4]  183 	ld	c, d
   2086 C5            [11]  184 	push	bc
   2087 DD 6E FE      [19]  185 	ld	l,-2 (ix)
   208A DD 66 FF      [19]  186 	ld	h,-1 (ix)
   208D E5            [11]  187 	push	hl
   208E CD B3 2B      [17]  188 	call	_cpct_getScreenPtr
   2091 F1            [10]  189 	pop	af
   2092 F1            [10]  190 	pop	af
   2093 5D            [ 4]  191 	ld	e, l
   2094 54            [ 4]  192 	ld	d, h
                            193 ;src/main.c:83: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   2095 21 1D 2D      [10]  194 	ld	hl, #_block01 + 5
   2098 4E            [ 7]  195 	ld	c,(hl)
   2099 21 1C 2D      [10]  196 	ld	hl, #_block01 + 4
   209C 46            [ 7]  197 	ld	b,(hl)
   209D C5            [11]  198 	push	bc
   209E D5            [11]  199 	push	de
   209F 21 04 04      [10]  200 	ld	hl,#0x0404
   20A2 E5            [11]  201 	push	hl
   20A3 CD 8E 2A      [17]  202 	call	_cpct_px2byteM0
   20A6 F1            [10]  203 	pop	af
   20A7 DD 75 FD      [19]  204 	ld	-3 (ix),l
   20AA D1            [10]  205 	pop	de
   20AB C1            [10]  206 	pop	bc
   20AC 79            [ 4]  207 	ld	a,c
   20AD F5            [11]  208 	push	af
   20AE 33            [ 6]  209 	inc	sp
   20AF C5            [11]  210 	push	bc
   20B0 33            [ 6]  211 	inc	sp
   20B1 DD 7E FD      [19]  212 	ld	a,-3 (ix)
   20B4 F5            [11]  213 	push	af
   20B5 33            [ 6]  214 	inc	sp
   20B6 D5            [11]  215 	push	de
   20B7 CD E1 2A      [17]  216 	call	_cpct_drawSolidBox
   20BA F1            [10]  217 	pop	af
   20BB F1            [10]  218 	pop	af
   20BC 33            [ 6]  219 	inc	sp
                            220 ;src/main.c:85: pscreen = cpct_getScreenPtr(screen, block02.x, block02.y);
   20BD 21 20 2D      [10]  221 	ld	hl, #_block02 + 1
   20C0 56            [ 7]  222 	ld	d,(hl)
   20C1 3A 1F 2D      [13]  223 	ld	a, (#_block02 + 0)
   20C4 D5            [11]  224 	push	de
   20C5 33            [ 6]  225 	inc	sp
   20C6 F5            [11]  226 	push	af
   20C7 33            [ 6]  227 	inc	sp
   20C8 DD 6E FE      [19]  228 	ld	l,-2 (ix)
   20CB DD 66 FF      [19]  229 	ld	h,-1 (ix)
   20CE E5            [11]  230 	push	hl
   20CF CD B3 2B      [17]  231 	call	_cpct_getScreenPtr
   20D2 F1            [10]  232 	pop	af
   20D3 F1            [10]  233 	pop	af
   20D4 5D            [ 4]  234 	ld	e, l
   20D5 54            [ 4]  235 	ld	d, h
                            236 ;src/main.c:86: cpct_drawSolidBox(pscreen, cpct_px2byteM0(6, 6), block02.w, block02.h);    
   20D6 21 24 2D      [10]  237 	ld	hl, #_block02 + 5
   20D9 4E            [ 7]  238 	ld	c,(hl)
   20DA 21 23 2D      [10]  239 	ld	hl, #_block02 + 4
   20DD 46            [ 7]  240 	ld	b,(hl)
   20DE C5            [11]  241 	push	bc
   20DF D5            [11]  242 	push	de
   20E0 21 06 06      [10]  243 	ld	hl,#0x0606
   20E3 E5            [11]  244 	push	hl
   20E4 CD 8E 2A      [17]  245 	call	_cpct_px2byteM0
   20E7 F1            [10]  246 	pop	af
   20E8 DD 75 FD      [19]  247 	ld	-3 (ix),l
   20EB D1            [10]  248 	pop	de
   20EC C1            [10]  249 	pop	bc
   20ED 79            [ 4]  250 	ld	a,c
   20EE F5            [11]  251 	push	af
   20EF 33            [ 6]  252 	inc	sp
   20F0 C5            [11]  253 	push	bc
   20F1 33            [ 6]  254 	inc	sp
   20F2 DD 7E FD      [19]  255 	ld	a,-3 (ix)
   20F5 F5            [11]  256 	push	af
   20F6 33            [ 6]  257 	inc	sp
   20F7 D5            [11]  258 	push	de
   20F8 CD E1 2A      [17]  259 	call	_cpct_drawSolidBox
   20FB DD F9         [10]  260 	ld	sp,ix
   20FD DD E1         [14]  261 	pop	ix
   20FF C9            [10]  262 	ret
                            263 ;src/main.c:90: void clear_screen(u8* screen){
                            264 ;	---------------------------------
                            265 ; Function clear_screen
                            266 ; ---------------------------------
   2100                     267 _clear_screen::
                            268 ;src/main.c:91: cpct_memset(screen, 0x00, 0x4000);   
   2100 C1            [10]  269 	pop	bc
   2101 D1            [10]  270 	pop	de
   2102 D5            [11]  271 	push	de
   2103 C5            [11]  272 	push	bc
   2104 21 00 40      [10]  273 	ld	hl,#0x4000
   2107 E5            [11]  274 	push	hl
   2108 AF            [ 4]  275 	xor	a, a
   2109 F5            [11]  276 	push	af
   210A 33            [ 6]  277 	inc	sp
   210B D5            [11]  278 	push	de
   210C CD B2 2A      [17]  279 	call	_cpct_memset
   210F F1            [10]  280 	pop	af
   2110 F1            [10]  281 	pop	af
   2111 33            [ 6]  282 	inc	sp
   2112 C9            [10]  283 	ret
                            284 ;src/main.c:95: void updateBlock(){
                            285 ;	---------------------------------
                            286 ; Function updateBlock
                            287 ; ---------------------------------
   2113                     288 _updateBlock::
                            289 ;src/main.c:96: if (block01.vx>0){
   2113 21 1A 2D      [10]  290 	ld	hl, #(_block01 + 0x0002) + 0
   2116 46            [ 7]  291 	ld	b,(hl)
                            292 ;src/main.c:97: if ((block01.x+block01.vx)<(79-block01.w)){
   2117 21 18 2D      [10]  293 	ld	hl, #_block01 + 0
   211A 4E            [ 7]  294 	ld	c,(hl)
   211B 68            [ 4]  295 	ld	l,b
   211C 26 00         [ 7]  296 	ld	h,#0x00
   211E 59            [ 4]  297 	ld	e,c
   211F 16 00         [ 7]  298 	ld	d,#0x00
                            299 ;src/main.c:98: block01.x = block01.x + block01.vx;
   2121 79            [ 4]  300 	ld	a,c
   2122 80            [ 4]  301 	add	a, b
   2123 4F            [ 4]  302 	ld	c,a
                            303 ;src/main.c:97: if ((block01.x+block01.vx)<(79-block01.w)){
   2124 19            [11]  304 	add	hl,de
   2125 5D            [ 4]  305 	ld	e,l
   2126 54            [ 4]  306 	ld	d,h
                            307 ;src/main.c:96: if (block01.vx>0){
   2127 78            [ 4]  308 	ld	a,b
   2128 B7            [ 4]  309 	or	a, a
   2129 28 33         [12]  310 	jr	Z,00108$
                            311 ;src/main.c:97: if ((block01.x+block01.vx)<(79-block01.w)){
   212B 21 1C 2D      [10]  312 	ld	hl, #_block01 + 4
   212E 66            [ 7]  313 	ld	h,(hl)
   212F 6C            [ 4]  314 	ld	l,h
   2130 06 00         [ 7]  315 	ld	b,#0x00
   2132 3E 4F         [ 7]  316 	ld	a,#0x4F
   2134 95            [ 4]  317 	sub	a, l
   2135 6F            [ 4]  318 	ld	l,a
   2136 3E 00         [ 7]  319 	ld	a,#0x00
   2138 98            [ 4]  320 	sbc	a, b
   2139 47            [ 4]  321 	ld	b,a
   213A 7B            [ 4]  322 	ld	a,e
   213B 95            [ 4]  323 	sub	a, l
   213C 7A            [ 4]  324 	ld	a,d
   213D 98            [ 4]  325 	sbc	a, b
   213E E2 43 21      [10]  326 	jp	PO, 00124$
   2141 EE 80         [ 7]  327 	xor	a, #0x80
   2143                     328 00124$:
   2143 F2 4B 21      [10]  329 	jp	P,00102$
                            330 ;src/main.c:98: block01.x = block01.x + block01.vx;
   2146 21 18 2D      [10]  331 	ld	hl,#_block01
   2149 71            [ 7]  332 	ld	(hl),c
   214A C9            [10]  333 	ret
   214B                     334 00102$:
                            335 ;src/main.c:101: block01.x = 79-block01.w;
   214B 3E 4F         [ 7]  336 	ld	a,#0x4F
   214D 94            [ 4]  337 	sub	a, h
   214E 21 18 2D      [10]  338 	ld	hl,#_block01
   2151 77            [ 7]  339 	ld	(hl),a
                            340 ;src/main.c:102: block01.vx = - block01.vx;
   2152 21 1A 2D      [10]  341 	ld	hl, #(_block01 + 0x0002) + 0
   2155 66            [ 7]  342 	ld	h,(hl)
   2156 AF            [ 4]  343 	xor	a, a
   2157 94            [ 4]  344 	sub	a, h
   2158 57            [ 4]  345 	ld	d,a
   2159 21 1A 2D      [10]  346 	ld	hl,#(_block01 + 0x0002)
   215C 72            [ 7]  347 	ld	(hl),d
   215D C9            [10]  348 	ret
   215E                     349 00108$:
                            350 ;src/main.c:105: if ((block01.x+block01.vx)>0){
   215E AF            [ 4]  351 	xor	a, a
   215F BB            [ 4]  352 	cp	a, e
   2160 9A            [ 4]  353 	sbc	a, d
   2161 E2 66 21      [10]  354 	jp	PO, 00125$
   2164 EE 80         [ 7]  355 	xor	a, #0x80
   2166                     356 00125$:
   2166 F2 6E 21      [10]  357 	jp	P,00105$
                            358 ;src/main.c:106: block01.x = block01.x + block01.vx;
   2169 21 18 2D      [10]  359 	ld	hl,#_block01
   216C 71            [ 7]  360 	ld	(hl),c
   216D C9            [10]  361 	ret
   216E                     362 00105$:
                            363 ;src/main.c:109: block01.x = 0;
   216E 21 18 2D      [10]  364 	ld	hl,#_block01
   2171 36 00         [10]  365 	ld	(hl),#0x00
                            366 ;src/main.c:110: block01.vx = - block01.vx;
   2173 21 1A 2D      [10]  367 	ld	hl, #(_block01 + 0x0002) + 0
   2176 66            [ 7]  368 	ld	h,(hl)
   2177 AF            [ 4]  369 	xor	a, a
   2178 94            [ 4]  370 	sub	a, h
   2179 57            [ 4]  371 	ld	d,a
   217A 21 1A 2D      [10]  372 	ld	hl,#(_block01 + 0x0002)
   217D 72            [ 7]  373 	ld	(hl),d
   217E C9            [10]  374 	ret
                            375 ;src/main.c:118: void drawFrame(u8* screen) {
                            376 ;	---------------------------------
                            377 ; Function drawFrame
                            378 ; ---------------------------------
   217F                     379 _drawFrame::
   217F DD E5         [15]  380 	push	ix
   2181 DD 21 00 00   [14]  381 	ld	ix,#0
   2185 DD 39         [15]  382 	add	ix,sp
                            383 ;src/main.c:123: pattern = cpct_px2byteM0 (15, 15);
   2187 21 0F 0F      [10]  384 	ld	hl,#0x0F0F
   218A E5            [11]  385 	push	hl
   218B CD 8E 2A      [17]  386 	call	_cpct_px2byteM0
   218E F1            [10]  387 	pop	af
   218F 45            [ 4]  388 	ld	b,l
                            389 ;src/main.c:126: pv = cpct_getScreenPtr(screen, (BACK_X),  (BACK_Y));
   2190 DD 5E 04      [19]  390 	ld	e,4 (ix)
   2193 DD 56 05      [19]  391 	ld	d,5 (ix)
   2196 C5            [11]  392 	push	bc
   2197 D5            [11]  393 	push	de
   2198 21 00 00      [10]  394 	ld	hl,#0x0000
   219B E5            [11]  395 	push	hl
   219C D5            [11]  396 	push	de
   219D CD B3 2B      [17]  397 	call	_cpct_getScreenPtr
   21A0 F1            [10]  398 	pop	af
   21A1 F1            [10]  399 	pop	af
   21A2 D1            [10]  400 	pop	de
   21A3 C1            [10]  401 	pop	bc
                            402 ;src/main.c:127: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
   21A4 E5            [11]  403 	push	hl
   21A5 FD E1         [14]  404 	pop	iy
   21A7 C5            [11]  405 	push	bc
   21A8 D5            [11]  406 	push	de
   21A9 21 40 04      [10]  407 	ld	hl,#0x0440
   21AC E5            [11]  408 	push	hl
   21AD C5            [11]  409 	push	bc
   21AE 33            [ 6]  410 	inc	sp
   21AF FD E5         [15]  411 	push	iy
   21B1 CD E1 2A      [17]  412 	call	_cpct_drawSolidBox
   21B4 F1            [10]  413 	pop	af
   21B5 F1            [10]  414 	pop	af
   21B6 33            [ 6]  415 	inc	sp
   21B7 D1            [10]  416 	pop	de
   21B8 D5            [11]  417 	push	de
   21B9 21 00 C5      [10]  418 	ld	hl,#0xC500
   21BC E5            [11]  419 	push	hl
   21BD D5            [11]  420 	push	de
   21BE CD B3 2B      [17]  421 	call	_cpct_getScreenPtr
   21C1 F1            [10]  422 	pop	af
   21C2 F1            [10]  423 	pop	af
   21C3 D1            [10]  424 	pop	de
   21C4 C1            [10]  425 	pop	bc
                            426 ;src/main.c:131: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
   21C5 E5            [11]  427 	push	hl
   21C6 FD E1         [14]  428 	pop	iy
   21C8 C5            [11]  429 	push	bc
   21C9 D5            [11]  430 	push	de
   21CA 21 40 04      [10]  431 	ld	hl,#0x0440
   21CD E5            [11]  432 	push	hl
   21CE C5            [11]  433 	push	bc
   21CF 33            [ 6]  434 	inc	sp
   21D0 FD E5         [15]  435 	push	iy
   21D2 CD E1 2A      [17]  436 	call	_cpct_drawSolidBox
   21D5 F1            [10]  437 	pop	af
   21D6 F1            [10]  438 	pop	af
   21D7 33            [ 6]  439 	inc	sp
   21D8 D1            [10]  440 	pop	de
   21D9 D5            [11]  441 	push	de
   21DA 21 00 00      [10]  442 	ld	hl,#0x0000
   21DD E5            [11]  443 	push	hl
   21DE D5            [11]  444 	push	de
   21DF CD B3 2B      [17]  445 	call	_cpct_getScreenPtr
   21E2 F1            [10]  446 	pop	af
   21E3 F1            [10]  447 	pop	af
   21E4 D1            [10]  448 	pop	de
   21E5 C1            [10]  449 	pop	bc
                            450 ;src/main.c:135: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
   21E6 E5            [11]  451 	push	hl
   21E7 FD E1         [14]  452 	pop	iy
   21E9 C5            [11]  453 	push	bc
   21EA D5            [11]  454 	push	de
   21EB 21 02 C7      [10]  455 	ld	hl,#0xC702
   21EE E5            [11]  456 	push	hl
   21EF C5            [11]  457 	push	bc
   21F0 33            [ 6]  458 	inc	sp
   21F1 FD E5         [15]  459 	push	iy
   21F3 CD E1 2A      [17]  460 	call	_cpct_drawSolidBox
   21F6 F1            [10]  461 	pop	af
   21F7 F1            [10]  462 	pop	af
   21F8 33            [ 6]  463 	inc	sp
   21F9 D1            [10]  464 	pop	de
   21FA 21 3E 00      [10]  465 	ld	hl,#0x003E
   21FD E5            [11]  466 	push	hl
   21FE D5            [11]  467 	push	de
   21FF CD B3 2B      [17]  468 	call	_cpct_getScreenPtr
   2202 F1            [10]  469 	pop	af
   2203 F1            [10]  470 	pop	af
   2204 C1            [10]  471 	pop	bc
                            472 ;src/main.c:139: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
   2205 EB            [ 4]  473 	ex	de,hl
   2206 21 02 C7      [10]  474 	ld	hl,#0xC702
   2209 E5            [11]  475 	push	hl
   220A C5            [11]  476 	push	bc
   220B 33            [ 6]  477 	inc	sp
   220C D5            [11]  478 	push	de
   220D CD E1 2A      [17]  479 	call	_cpct_drawSolidBox
   2210 F1            [10]  480 	pop	af
   2211 F1            [10]  481 	pop	af
   2212 33            [ 6]  482 	inc	sp
   2213 DD E1         [14]  483 	pop	ix
   2215 C9            [10]  484 	ret
                            485 ;src/main.c:145: void updateUser() {
                            486 ;	---------------------------------
                            487 ; Function updateUser
                            488 ; ---------------------------------
   2216                     489 _updateUser::
   2216 DD E5         [15]  490 	push	ix
   2218 DD 21 00 00   [14]  491 	ld	ix,#0
   221C DD 39         [15]  492 	add	ix,sp
   221E 3B            [ 6]  493 	dec	sp
                            494 ;src/main.c:147: cpct_scanKeyboard_f();
   221F CD A8 28      [17]  495 	call	_cpct_scanKeyboard_f
                            496 ;src/main.c:154: if ((cpct_isKeyPressed(Key_CursorUp))){ 
   2222 21 00 01      [10]  497 	ld	hl,#0x0100
   2225 E5            [11]  498 	push	hl
   2226 CD 97 28      [17]  499 	call	_cpct_isKeyPressed
   2229 F1            [10]  500 	pop	af
   222A 7D            [ 4]  501 	ld	a,l
   222B B7            [ 4]  502 	or	a, a
   222C 28 2D         [12]  503 	jr	Z,00105$
                            504 ;src/main.c:155: if ((user.y-user.vy)>0)
   222E 21 2B 2D      [10]  505 	ld	hl, #(_user + 0x0005) + 0
   2231 5E            [ 7]  506 	ld	e,(hl)
   2232 4B            [ 4]  507 	ld	c,e
   2233 06 00         [ 7]  508 	ld	b,#0x00
   2235 21 33 2D      [10]  509 	ld	hl, #_user + 13
   2238 56            [ 7]  510 	ld	d,(hl)
   2239 7A            [ 4]  511 	ld	a,d
   223A 6F            [ 4]  512 	ld	l,a
   223B 17            [ 4]  513 	rla
   223C 9F            [ 4]  514 	sbc	a, a
   223D 67            [ 4]  515 	ld	h,a
   223E 79            [ 4]  516 	ld	a,c
   223F 95            [ 4]  517 	sub	a, l
   2240 6F            [ 4]  518 	ld	l,a
   2241 78            [ 4]  519 	ld	a,b
   2242 9C            [ 4]  520 	sbc	a, h
   2243 67            [ 4]  521 	ld	h,a
   2244 AF            [ 4]  522 	xor	a, a
   2245 BD            [ 4]  523 	cp	a, l
   2246 9C            [ 4]  524 	sbc	a, h
   2247 E2 4C 22      [10]  525 	jp	PO, 00155$
   224A EE 80         [ 7]  526 	xor	a, #0x80
   224C                     527 00155$:
   224C F2 56 22      [10]  528 	jp	P,00102$
                            529 ;src/main.c:156: user.y = user.y - user.vy;
   224F 7B            [ 4]  530 	ld	a,e
   2250 92            [ 4]  531 	sub	a, d
   2251 32 2B 2D      [13]  532 	ld	(#(_user + 0x0005)),a
   2254 18 05         [12]  533 	jr	00105$
   2256                     534 00102$:
                            535 ;src/main.c:158: user.y = 0;
   2256 21 2B 2D      [10]  536 	ld	hl,#(_user + 0x0005)
   2259 36 00         [10]  537 	ld	(hl),#0x00
   225B                     538 00105$:
                            539 ;src/main.c:161: if ((cpct_isKeyPressed(Key_CursorRight))){ 
   225B 21 00 02      [10]  540 	ld	hl,#0x0200
   225E E5            [11]  541 	push	hl
   225F CD 97 28      [17]  542 	call	_cpct_isKeyPressed
   2262 F1            [10]  543 	pop	af
   2263 7D            [ 4]  544 	ld	a,l
   2264 B7            [ 4]  545 	or	a, a
   2265 28 3F         [12]  546 	jr	Z,00110$
                            547 ;src/main.c:162: if ((user.x+user.vx<(79-user.w)))
   2267 21 2A 2D      [10]  548 	ld	hl, #(_user + 0x0004) + 0
   226A 5E            [ 7]  549 	ld	e,(hl)
   226B 4B            [ 4]  550 	ld	c,e
   226C 06 00         [ 7]  551 	ld	b,#0x00
   226E 21 32 2D      [10]  552 	ld	hl, #_user + 12
   2271 56            [ 7]  553 	ld	d,(hl)
   2272 7A            [ 4]  554 	ld	a,d
   2273 6F            [ 4]  555 	ld	l,a
   2274 17            [ 4]  556 	rla
   2275 9F            [ 4]  557 	sbc	a, a
   2276 67            [ 4]  558 	ld	h,a
   2277 09            [11]  559 	add	hl,bc
   2278 4D            [ 4]  560 	ld	c,l
   2279 44            [ 4]  561 	ld	b,h
   227A 3A 2C 2D      [13]  562 	ld	a,(#_user + 6)
   227D DD 77 FF      [19]  563 	ld	-1 (ix), a
   2280 6F            [ 4]  564 	ld	l, a
   2281 26 00         [ 7]  565 	ld	h,#0x00
   2283 3E 4F         [ 7]  566 	ld	a,#0x4F
   2285 95            [ 4]  567 	sub	a, l
   2286 6F            [ 4]  568 	ld	l,a
   2287 3E 00         [ 7]  569 	ld	a,#0x00
   2289 9C            [ 4]  570 	sbc	a, h
   228A 67            [ 4]  571 	ld	h,a
   228B 79            [ 4]  572 	ld	a,c
   228C 95            [ 4]  573 	sub	a, l
   228D 78            [ 4]  574 	ld	a,b
   228E 9C            [ 4]  575 	sbc	a, h
   228F E2 94 22      [10]  576 	jp	PO, 00156$
   2292 EE 80         [ 7]  577 	xor	a, #0x80
   2294                     578 00156$:
   2294 F2 9E 22      [10]  579 	jp	P,00107$
                            580 ;src/main.c:163: user.x = user.x + user.vx;
   2297 7B            [ 4]  581 	ld	a,e
   2298 82            [ 4]  582 	add	a, d
   2299 32 2A 2D      [13]  583 	ld	(#(_user + 0x0004)),a
   229C 18 08         [12]  584 	jr	00110$
   229E                     585 00107$:
                            586 ;src/main.c:165: user.x = 79-user.w;
   229E 3E 4F         [ 7]  587 	ld	a,#0x4F
   22A0 DD 96 FF      [19]  588 	sub	a, -1 (ix)
   22A3 32 2A 2D      [13]  589 	ld	(#(_user + 0x0004)),a
   22A6                     590 00110$:
                            591 ;src/main.c:168: if (cpct_isKeyPressed(Key_CursorLeft)){
   22A6 21 01 01      [10]  592 	ld	hl,#0x0101
   22A9 E5            [11]  593 	push	hl
   22AA CD 97 28      [17]  594 	call	_cpct_isKeyPressed
   22AD F1            [10]  595 	pop	af
   22AE 7D            [ 4]  596 	ld	a,l
   22AF B7            [ 4]  597 	or	a, a
   22B0 28 2D         [12]  598 	jr	Z,00115$
                            599 ;src/main.c:169: if ((user.x-user.vx)>0) 
   22B2 21 2A 2D      [10]  600 	ld	hl, #(_user + 0x0004) + 0
   22B5 5E            [ 7]  601 	ld	e,(hl)
   22B6 4B            [ 4]  602 	ld	c,e
   22B7 06 00         [ 7]  603 	ld	b,#0x00
   22B9 21 32 2D      [10]  604 	ld	hl, #_user + 12
   22BC 56            [ 7]  605 	ld	d,(hl)
   22BD 7A            [ 4]  606 	ld	a,d
   22BE 6F            [ 4]  607 	ld	l,a
   22BF 17            [ 4]  608 	rla
   22C0 9F            [ 4]  609 	sbc	a, a
   22C1 67            [ 4]  610 	ld	h,a
   22C2 79            [ 4]  611 	ld	a,c
   22C3 95            [ 4]  612 	sub	a, l
   22C4 6F            [ 4]  613 	ld	l,a
   22C5 78            [ 4]  614 	ld	a,b
   22C6 9C            [ 4]  615 	sbc	a, h
   22C7 67            [ 4]  616 	ld	h,a
   22C8 AF            [ 4]  617 	xor	a, a
   22C9 BD            [ 4]  618 	cp	a, l
   22CA 9C            [ 4]  619 	sbc	a, h
   22CB E2 D0 22      [10]  620 	jp	PO, 00157$
   22CE EE 80         [ 7]  621 	xor	a, #0x80
   22D0                     622 00157$:
   22D0 F2 DA 22      [10]  623 	jp	P,00112$
                            624 ;src/main.c:170: user.x = user.x - user.vx;    
   22D3 7B            [ 4]  625 	ld	a,e
   22D4 92            [ 4]  626 	sub	a, d
   22D5 32 2A 2D      [13]  627 	ld	(#(_user + 0x0004)),a
   22D8 18 05         [12]  628 	jr	00115$
   22DA                     629 00112$:
                            630 ;src/main.c:172: user.x = 0;
   22DA 21 2A 2D      [10]  631 	ld	hl,#(_user + 0x0004)
   22DD 36 00         [10]  632 	ld	(hl),#0x00
   22DF                     633 00115$:
                            634 ;src/main.c:175: if (cpct_isKeyPressed(Key_CursorDown)){
   22DF 21 00 04      [10]  635 	ld	hl,#0x0400
   22E2 E5            [11]  636 	push	hl
   22E3 CD 97 28      [17]  637 	call	_cpct_isKeyPressed
   22E6 F1            [10]  638 	pop	af
   22E7 7D            [ 4]  639 	ld	a,l
   22E8 B7            [ 4]  640 	or	a, a
   22E9 28 37         [12]  641 	jr	Z,00121$
                            642 ;src/main.c:176: if ((user.y<(199-user.h) ))
   22EB 21 2B 2D      [10]  643 	ld	hl, #(_user + 0x0005) + 0
   22EE 5E            [ 7]  644 	ld	e,(hl)
   22EF 3A 2D 2D      [13]  645 	ld	a,(#_user + 7)
   22F2 DD 77 FF      [19]  646 	ld	-1 (ix), a
   22F5 6F            [ 4]  647 	ld	l, a
   22F6 26 00         [ 7]  648 	ld	h,#0x00
   22F8 3E C7         [ 7]  649 	ld	a,#0xC7
   22FA 95            [ 4]  650 	sub	a, l
   22FB 6F            [ 4]  651 	ld	l,a
   22FC 3E 00         [ 7]  652 	ld	a,#0x00
   22FE 9C            [ 4]  653 	sbc	a, h
   22FF 67            [ 4]  654 	ld	h,a
   2300 4B            [ 4]  655 	ld	c,e
   2301 16 00         [ 7]  656 	ld	d,#0x00
   2303 79            [ 4]  657 	ld	a,c
   2304 95            [ 4]  658 	sub	a, l
   2305 7A            [ 4]  659 	ld	a,d
   2306 9C            [ 4]  660 	sbc	a, h
   2307 E2 0C 23      [10]  661 	jp	PO, 00158$
   230A EE 80         [ 7]  662 	xor	a, #0x80
   230C                     663 00158$:
   230C F2 1A 23      [10]  664 	jp	P,00117$
                            665 ;src/main.c:177: user.y = user.y + user.vy;
   230F 21 33 2D      [10]  666 	ld	hl, #_user + 13
   2312 6E            [ 7]  667 	ld	l,(hl)
   2313 7B            [ 4]  668 	ld	a,e
   2314 85            [ 4]  669 	add	a, l
   2315 32 2B 2D      [13]  670 	ld	(#(_user + 0x0005)),a
   2318 18 08         [12]  671 	jr	00121$
   231A                     672 00117$:
                            673 ;src/main.c:179: user.y = 199-user.h;
   231A 3E C7         [ 7]  674 	ld	a,#0xC7
   231C DD 96 FF      [19]  675 	sub	a, -1 (ix)
   231F 32 2B 2D      [13]  676 	ld	(#(_user + 0x0005)),a
   2322                     677 00121$:
   2322 33            [ 6]  678 	inc	sp
   2323 DD E1         [14]  679 	pop	ix
   2325 C9            [10]  680 	ret
                            681 ;src/main.c:184: void initialization(){
                            682 ;	---------------------------------
                            683 ; Function initialization
                            684 ; ---------------------------------
   2326                     685 _initialization::
                            686 ;src/main.c:186: pvmem = SCR_BUFF;
   2326 21 00 40      [10]  687 	ld	hl,#0x4000
   2329 22 35 2D      [16]  688 	ld	(_pvmem),hl
                            689 ;src/main.c:189: inicializarEstrellas();
   232C CD 49 26      [17]  690 	call	_inicializarEstrellas
                            691 ;src/main.c:191: block01.x = 10;
   232F 21 18 2D      [10]  692 	ld	hl,#_block01+0
   2332 36 0A         [10]  693 	ld	(hl),#0x0A
                            694 ;src/main.c:192: block01.y = 10;
   2334 21 19 2D      [10]  695 	ld	hl,#_block01 + 1
   2337 36 0A         [10]  696 	ld	(hl),#0x0A
                            697 ;src/main.c:193: block01.vx = 2;
   2339 21 1A 2D      [10]  698 	ld	hl,#_block01 + 2
   233C 36 02         [10]  699 	ld	(hl),#0x02
                            700 ;src/main.c:194: block01.vy = 0;
   233E 21 1B 2D      [10]  701 	ld	hl,#_block01 + 3
   2341 36 00         [10]  702 	ld	(hl),#0x00
                            703 ;src/main.c:195: block01.w = 20;
   2343 21 1C 2D      [10]  704 	ld	hl,#_block01 + 4
   2346 36 14         [10]  705 	ld	(hl),#0x14
                            706 ;src/main.c:196: block01.h = 40;
   2348 21 1D 2D      [10]  707 	ld	hl,#_block01 + 5
   234B 36 28         [10]  708 	ld	(hl),#0x28
                            709 ;src/main.c:198: block02.x = 15;
   234D 21 1F 2D      [10]  710 	ld	hl,#_block02+0
   2350 36 0F         [10]  711 	ld	(hl),#0x0F
                            712 ;src/main.c:199: block02.y = 15;
   2352 21 20 2D      [10]  713 	ld	hl,#_block02 + 1
   2355 36 0F         [10]  714 	ld	(hl),#0x0F
                            715 ;src/main.c:200: block02.vx = 4;
   2357 21 21 2D      [10]  716 	ld	hl,#_block02 + 2
   235A 36 04         [10]  717 	ld	(hl),#0x04
                            718 ;src/main.c:201: block02.vy = 0;
   235C 21 22 2D      [10]  719 	ld	hl,#_block02 + 3
   235F 36 00         [10]  720 	ld	(hl),#0x00
                            721 ;src/main.c:202: block02.w = 25;
   2361 21 23 2D      [10]  722 	ld	hl,#_block02 + 4
   2364 36 19         [10]  723 	ld	(hl),#0x19
                            724 ;src/main.c:203: block02.h = 20;
   2366 21 24 2D      [10]  725 	ld	hl,#_block02 + 5
   2369 36 14         [10]  726 	ld	(hl),#0x14
                            727 ;src/main.c:205: user.x = 39;
   236B 21 2A 2D      [10]  728 	ld	hl,#_user + 4
   236E 36 27         [10]  729 	ld	(hl),#0x27
                            730 ;src/main.c:206: user.y = 183;
   2370 21 2B 2D      [10]  731 	ld	hl,#_user + 5
   2373 36 B7         [10]  732 	ld	(hl),#0xB7
                            733 ;src/main.c:207: user.w = 6;
   2375 21 2C 2D      [10]  734 	ld	hl,#_user + 6
   2378 36 06         [10]  735 	ld	(hl),#0x06
                            736 ;src/main.c:208: user.h = 16;
   237A 21 2D 2D      [10]  737 	ld	hl,#_user + 7
   237D 36 10         [10]  738 	ld	(hl),#0x10
                            739 ;src/main.c:209: user.vx = 2;
   237F 21 32 2D      [10]  740 	ld	hl,#_user + 12
   2382 36 02         [10]  741 	ld	(hl),#0x02
                            742 ;src/main.c:210: user.vy = 4;
   2384 21 33 2D      [10]  743 	ld	hl,#_user + 13
   2387 36 04         [10]  744 	ld	(hl),#0x04
   2389 C9            [10]  745 	ret
                            746 ;src/main.c:214: void main(void) {
                            747 ;	---------------------------------
                            748 ; Function main
                            749 ; ---------------------------------
   238A                     750 _main::
                            751 ;src/main.c:216: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   238A CD C9 2A      [17]  752 	call	_cpct_disableFirmware
                            753 ;src/main.c:218: cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
   238D 11 2E 25      [10]  754 	ld	de,#_G_palette
   2390 3E 10         [ 7]  755 	ld	a,#0x10
   2392 F5            [11]  756 	push	af
   2393 33            [ 6]  757 	inc	sp
   2394 D5            [11]  758 	push	de
   2395 CD 73 28      [17]  759 	call	_cpct_setPalette
   2398 F1            [10]  760 	pop	af
   2399 33            [ 6]  761 	inc	sp
                            762 ;src/main.c:219: cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
   239A 3A 2F 25      [13]  763 	ld	a, (#_G_palette + 1)
   239D 57            [ 4]  764 	ld	d,a
   239E 1E 10         [ 7]  765 	ld	e,#0x10
   23A0 D5            [11]  766 	push	de
   23A1 CD 89 29      [17]  767 	call	_cpct_setPALColour
   23A4 F1            [10]  768 	pop	af
                            769 ;src/main.c:220: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   23A5 AF            [ 4]  770 	xor	a, a
   23A6 F5            [11]  771 	push	af
   23A7 33            [ 6]  772 	inc	sp
   23A8 CD 7C 2A      [17]  773 	call	_cpct_setVideoMode
   23AB 33            [ 6]  774 	inc	sp
                            775 ;src/main.c:223: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   23AC 21 00 40      [10]  776 	ld	hl,#0x4000
   23AF E5            [11]  777 	push	hl
   23B0 AF            [ 4]  778 	xor	a, a
   23B1 F5            [11]  779 	push	af
   23B2 33            [ 6]  780 	inc	sp
   23B3 26 C0         [ 7]  781 	ld	h, #0xC0
   23B5 E5            [11]  782 	push	hl
   23B6 CD B2 2A      [17]  783 	call	_cpct_memset
   23B9 F1            [10]  784 	pop	af
   23BA F1            [10]  785 	pop	af
   23BB 33            [ 6]  786 	inc	sp
                            787 ;src/main.c:224: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   23BC 21 00 40      [10]  788 	ld	hl,#0x4000
   23BF E5            [11]  789 	push	hl
   23C0 AF            [ 4]  790 	xor	a, a
   23C1 F5            [11]  791 	push	af
   23C2 33            [ 6]  792 	inc	sp
   23C3 2E 00         [ 7]  793 	ld	l, #0x00
   23C5 E5            [11]  794 	push	hl
   23C6 CD B2 2A      [17]  795 	call	_cpct_memset
   23C9 F1            [10]  796 	pop	af
   23CA F1            [10]  797 	pop	af
   23CB 33            [ 6]  798 	inc	sp
                            799 ;src/main.c:226: initialization(); 
   23CC CD 26 23      [17]  800 	call	_initialization
                            801 ;src/main.c:229: while (1){
   23CF                     802 00104$:
                            803 ;src/main.c:231: clear_screen(pvmem);
   23CF 2A 35 2D      [16]  804 	ld	hl,(_pvmem)
   23D2 E5            [11]  805 	push	hl
   23D3 CD 00 21      [17]  806 	call	_clear_screen
   23D6 F1            [10]  807 	pop	af
                            808 ;src/main.c:233: updateUser();
   23D7 CD 16 22      [17]  809 	call	_updateUser
                            810 ;src/main.c:234: updateBlock();
   23DA CD 13 21      [17]  811 	call	_updateBlock
                            812 ;src/main.c:236: moverEstrellas();
   23DD CD B1 27      [17]  813 	call	_moverEstrellas
                            814 ;src/main.c:237: pintarEstrellas(pvmem);
   23E0 2A 35 2D      [16]  815 	ld	hl,(_pvmem)
   23E3 E5            [11]  816 	push	hl
   23E4 CD 36 27      [17]  817 	call	_pintarEstrellas
   23E7 F1            [10]  818 	pop	af
                            819 ;src/main.c:240: draw_blocks(pvmem);
   23E8 2A 35 2D      [16]  820 	ld	hl,(_pvmem)
   23EB E5            [11]  821 	push	hl
   23EC CD 67 20      [17]  822 	call	_draw_blocks
   23EF F1            [10]  823 	pop	af
                            824 ;src/main.c:243: draw_sprite(pvmem);
   23F0 2A 35 2D      [16]  825 	ld	hl,(_pvmem)
   23F3 E5            [11]  826 	push	hl
   23F4 CD 28 20      [17]  827 	call	_draw_sprite
   23F7 F1            [10]  828 	pop	af
                            829 ;src/main.c:246: pvmem = changeVideoMemoryPage();
   23F8 CD 00 20      [17]  830 	call	_changeVideoMemoryPage
   23FB 22 35 2D      [16]  831 	ld	(_pvmem),hl
                            832 ;src/main.c:249: cpct_waitVSYNC();
   23FE CD 74 2A      [17]  833 	call	_cpct_waitVSYNC
   2401 18 CC         [12]  834 	jr	00104$
                            835 	.area _CODE
                            836 	.area _INITIALIZER
                            837 	.area _CABS (ABS)
