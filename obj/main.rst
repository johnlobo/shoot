                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 23:27:27 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _initialization
                             14 	.globl _draw_scoreboard
                             15 	.globl _set_color
                             16 	.globl _letras_rojas
                             17 	.globl _letras_azules
                             18 	.globl _update_blocks
                             19 	.globl _clear_screen
                             20 	.globl _draw_blocks
                             21 	.globl _changeVideoMemoryPage
                             22 	.globl _timer_on
                             23 	.globl _set_stack
                             24 	.globl _cpc_SetInkGphStr
                             25 	.globl _cpc_PrintGphStr
                             26 	.globl _update_stars
                             27 	.globl _draw_stars
                             28 	.globl _init_stars
                             29 	.globl _draw_explosions
                             30 	.globl _update_explosions
                             31 	.globl _init_explosions
                             32 	.globl _draw_user
                             33 	.globl _update_user
                             34 	.globl _init_user
                             35 	.globl _draw_enemies
                             36 	.globl _update_enemies
                             37 	.globl _init_enemies
                             38 	.globl _draw_shoots
                             39 	.globl _update_shoots
                             40 	.globl _init_shoots
                             41 	.globl _cpct_getScreenPtr
                             42 	.globl _cpct_setVideoMemoryPage
                             43 	.globl _cpct_setPALColour
                             44 	.globl _cpct_setPalette
                             45 	.globl _cpct_fw2hw
                             46 	.globl _cpct_waitVSYNC
                             47 	.globl _cpct_setVideoMode
                             48 	.globl _cpct_drawSolidBox
                             49 	.globl _cpct_px2byteM0
                             50 	.globl _cpct_memset
                             51 	.globl _aux_txt
                             52 	.globl _pvmem
                             53 	.globl _block02
                             54 	.globl _block01
                             55 ;--------------------------------------------------------
                             56 ; special function registers
                             57 ;--------------------------------------------------------
                             58 ;--------------------------------------------------------
                             59 ; ram data
                             60 ;--------------------------------------------------------
                             61 	.area _DATA
   4E76                      62 _block01::
   4E76                      63 	.ds 7
   4E7D                      64 _block02::
   4E7D                      65 	.ds 7
   4E84                      66 _pvmem::
   4E84                      67 	.ds 2
   4E86                      68 _aux_txt::
   4E86                      69 	.ds 40
   4EAE                      70 _changeVideoMemoryPage_page_1_83:
   4EAE                      71 	.ds 1
                             72 ;--------------------------------------------------------
                             73 ; ram data
                             74 ;--------------------------------------------------------
                             75 	.area _INITIALIZED
                             76 ;--------------------------------------------------------
                             77 ; absolute external ram data
                             78 ;--------------------------------------------------------
                             79 	.area _DABS (ABS)
                             80 ;--------------------------------------------------------
                             81 ; global & static initialisations
                             82 ;--------------------------------------------------------
                             83 	.area _HOME
                             84 	.area _GSINIT
                             85 	.area _GSFINAL
                             86 	.area _GSINIT
                             87 ;src/main.c:50: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   57C3 FD 21 AE 4E   [14]   88 	ld	iy,#_changeVideoMemoryPage_page_1_83
   57C7 FD 36 00 00   [19]   89 	ld	0 (iy),#0x00
                             90 ;--------------------------------------------------------
                             91 ; Home
                             92 ;--------------------------------------------------------
                             93 	.area _HOME
                             94 	.area _HOME
                             95 ;--------------------------------------------------------
                             96 ; code
                             97 ;--------------------------------------------------------
                             98 	.area _CODE
                             99 ;src/main.c:49: u8* changeVideoMemoryPage() {
                            100 ;	---------------------------------
                            101 ; Function changeVideoMemoryPage
                            102 ; ---------------------------------
   2000                     103 _changeVideoMemoryPage::
                            104 ;src/main.c:55: if (page) {
   2000 3A AE 4E      [13]  105 	ld	a,(#_changeVideoMemoryPage_page_1_83 + 0)
   2003 B7            [ 4]  106 	or	a, a
   2004 28 11         [12]  107 	jr	Z,00102$
                            108 ;src/main.c:56: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  109 	ld	a,#0x30
   2008 F5            [11]  110 	push	af
   2009 33            [ 6]  111 	inc	sp
   200A CD B4 4B      [17]  112 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  113 	inc	sp
                            114 ;src/main.c:57: page = 0;  
   200E 21 AE 4E      [10]  115 	ld	hl,#_changeVideoMemoryPage_page_1_83 + 0
   2011 36 00         [10]  116 	ld	(hl), #0x00
                            117 ;src/main.c:58: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  118 	ld	hl,#0x8000
   2016 C9            [10]  119 	ret
   2017                     120 00102$:
                            121 ;src/main.c:60: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  122 	ld	a,#0x20
   2019 F5            [11]  123 	push	af
   201A 33            [ 6]  124 	inc	sp
   201B CD B4 4B      [17]  125 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  126 	inc	sp
                            127 ;src/main.c:61: page = 1;                              // Next page = 1
   201F 21 AE 4E      [10]  128 	ld	hl,#_changeVideoMemoryPage_page_1_83 + 0
   2022 36 01         [10]  129 	ld	(hl), #0x01
                            130 ;src/main.c:62: screen = SCR_VMEM;
   2024 21 00 C0      [10]  131 	ld	hl,#0xC000
                            132 ;src/main.c:64: return screen;
   2027 C9            [10]  133 	ret
                            134 ;src/main.c:72: void draw_blocks(u8* screen){
                            135 ;	---------------------------------
                            136 ; Function draw_blocks
                            137 ; ---------------------------------
   2028                     138 _draw_blocks::
   2028 DD E5         [15]  139 	push	ix
   202A DD 21 00 00   [14]  140 	ld	ix,#0
   202E DD 39         [15]  141 	add	ix,sp
   2030 3B            [ 6]  142 	dec	sp
                            143 ;src/main.c:75: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2031 21 77 4E      [10]  144 	ld	hl, #_block01 + 1
   2034 4E            [ 7]  145 	ld	c,(hl)
   2035 21 76 4E      [10]  146 	ld	hl, #_block01 + 0
   2038 66            [ 7]  147 	ld	h,(hl)
   2039 DD 5E 04      [19]  148 	ld	e,4 (ix)
   203C DD 56 05      [19]  149 	ld	d,5 (ix)
   203F 79            [ 4]  150 	ld	a,c
   2040 F5            [11]  151 	push	af
   2041 33            [ 6]  152 	inc	sp
   2042 E5            [11]  153 	push	hl
   2043 33            [ 6]  154 	inc	sp
   2044 D5            [11]  155 	push	de
   2045 CD 11 4D      [17]  156 	call	_cpct_getScreenPtr
   2048 F1            [10]  157 	pop	af
   2049 F1            [10]  158 	pop	af
   204A 5D            [ 4]  159 	ld	e, l
   204B 54            [ 4]  160 	ld	d, h
                            161 ;src/main.c:76: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   204C 21 7B 4E      [10]  162 	ld	hl, #_block01 + 5
   204F 4E            [ 7]  163 	ld	c,(hl)
   2050 21 7A 4E      [10]  164 	ld	hl, #_block01 + 4
   2053 46            [ 7]  165 	ld	b,(hl)
   2054 C5            [11]  166 	push	bc
   2055 D5            [11]  167 	push	de
   2056 21 04 04      [10]  168 	ld	hl,#0x0404
   2059 E5            [11]  169 	push	hl
   205A CD F7 4B      [17]  170 	call	_cpct_px2byteM0
   205D F1            [10]  171 	pop	af
   205E DD 75 FF      [19]  172 	ld	-1 (ix),l
   2061 D1            [10]  173 	pop	de
   2062 C1            [10]  174 	pop	bc
   2063 79            [ 4]  175 	ld	a,c
   2064 F5            [11]  176 	push	af
   2065 33            [ 6]  177 	inc	sp
   2066 C5            [11]  178 	push	bc
   2067 33            [ 6]  179 	inc	sp
   2068 DD 7E FF      [19]  180 	ld	a,-1 (ix)
   206B F5            [11]  181 	push	af
   206C 33            [ 6]  182 	inc	sp
   206D D5            [11]  183 	push	de
   206E CD 2B 4C      [17]  184 	call	_cpct_drawSolidBox
   2071 F1            [10]  185 	pop	af
   2072 F1            [10]  186 	pop	af
   2073 33            [ 6]  187 	inc	sp
   2074 33            [ 6]  188 	inc	sp
   2075 DD E1         [14]  189 	pop	ix
   2077 C9            [10]  190 	ret
                            191 ;src/main.c:83: void clear_screen(u8* screen){
                            192 ;	---------------------------------
                            193 ; Function clear_screen
                            194 ; ---------------------------------
   2078                     195 _clear_screen::
                            196 ;src/main.c:84: cpct_memset(screen, 0x00, 0x4000);   
   2078 C1            [10]  197 	pop	bc
   2079 D1            [10]  198 	pop	de
   207A D5            [11]  199 	push	de
   207B C5            [11]  200 	push	bc
   207C 21 00 40      [10]  201 	ld	hl,#0x4000
   207F E5            [11]  202 	push	hl
   2080 AF            [ 4]  203 	xor	a, a
   2081 F5            [11]  204 	push	af
   2082 33            [ 6]  205 	inc	sp
   2083 D5            [11]  206 	push    de
   2084 CD 16 4C      [17]  207 	call    _cpct_memset
   2087 C9            [10]  208 	ret
                            209 ;src/main.c:91: void update_blocks(){
                            210 ;	---------------------------------
                            211 ; Function update_blocks
                            212 ; ---------------------------------
   2088                     213 _update_blocks::
   2088 DD E5         [15]  214 	push	ix
   208A DD 21 00 00   [14]  215 	ld	ix,#0
   208E DD 39         [15]  216 	add	ix,sp
   2090 F5            [11]  217 	push	af
   2091 3B            [ 6]  218 	dec	sp
                            219 ;src/main.c:92: if (block01.vx<128){
   2092 01 76 4E      [10]  220 	ld	bc,#_block01+0
   2095 21 78 4E      [10]  221 	ld	hl, #(_block01 + 0x0002) + 0
   2098 7E            [ 7]  222 	ld	a,(hl)
   2099 DD 77 FF      [19]  223 	ld	-1 (ix),a
                            224 ;src/main.c:93: if ((block01.x+block01.vx)<(80-block01.w)){
   209C 0A            [ 7]  225 	ld	a,(bc)
                            226 ;src/main.c:94: block01.x = block01.x + block01.vx;
   209D 57            [ 4]  227 	ld	d,a
   209E DD 86 FF      [19]  228 	add	a, -1 (ix)
   20A1 5F            [ 4]  229 	ld	e,a
                            230 ;src/main.c:92: if (block01.vx<128){
   20A2 DD 7E FF      [19]  231 	ld	a,-1 (ix)
   20A5 D6 80         [ 7]  232 	sub	a, #0x80
   20A7 30 4E         [12]  233 	jr	NC,00108$
                            234 ;src/main.c:93: if ((block01.x+block01.vx)<(80-block01.w)){
   20A9 DD 72 FD      [19]  235 	ld	-3 (ix),d
   20AC DD 36 FE 00   [19]  236 	ld	-2 (ix),#0x00
   20B0 DD 66 FF      [19]  237 	ld	h,-1 (ix)
   20B3 2E 00         [ 7]  238 	ld	l,#0x00
   20B5 DD 7E FD      [19]  239 	ld	a,-3 (ix)
   20B8 84            [ 4]  240 	add	a, h
   20B9 DD 77 FD      [19]  241 	ld	-3 (ix),a
   20BC DD 7E FE      [19]  242 	ld	a,-2 (ix)
   20BF 8D            [ 4]  243 	adc	a, l
   20C0 DD 77 FE      [19]  244 	ld	-2 (ix),a
   20C3 21 7A 4E      [10]  245 	ld	hl, #_block01 + 4
   20C6 66            [ 7]  246 	ld	h,(hl)
   20C7 6C            [ 4]  247 	ld	l,h
   20C8 16 00         [ 7]  248 	ld	d,#0x00
   20CA 3E 50         [ 7]  249 	ld	a,#0x50
   20CC 95            [ 4]  250 	sub	a, l
   20CD 6F            [ 4]  251 	ld	l,a
   20CE 3E 00         [ 7]  252 	ld	a,#0x00
   20D0 9A            [ 4]  253 	sbc	a, d
   20D1 57            [ 4]  254 	ld	d,a
   20D2 DD 7E FD      [19]  255 	ld	a,-3 (ix)
   20D5 95            [ 4]  256 	sub	a, l
   20D6 DD 7E FE      [19]  257 	ld	a,-2 (ix)
   20D9 9A            [ 4]  258 	sbc	a, d
   20DA E2 DF 20      [10]  259 	jp	PO, 00124$
   20DD EE 80         [ 7]  260 	xor	a, #0x80
   20DF                     261 00124$:
   20DF F2 E6 20      [10]  262 	jp	P,00102$
                            263 ;src/main.c:94: block01.x = block01.x + block01.vx;
   20E2 7B            [ 4]  264 	ld	a,e
   20E3 02            [ 7]  265 	ld	(bc),a
   20E4 18 2D         [12]  266 	jr	00110$
   20E6                     267 00102$:
                            268 ;src/main.c:97: block01.x = 79-block01.w;
   20E6 3E 4F         [ 7]  269 	ld	a,#0x4F
   20E8 94            [ 4]  270 	sub	a, h
   20E9 02            [ 7]  271 	ld	(bc),a
                            272 ;src/main.c:98: block01.vx = - block01.vx;
   20EA 21 78 4E      [10]  273 	ld	hl, #(_block01 + 0x0002) + 0
   20ED 66            [ 7]  274 	ld	h,(hl)
   20EE AF            [ 4]  275 	xor	a, a
   20EF 94            [ 4]  276 	sub	a, h
   20F0 57            [ 4]  277 	ld	d,a
   20F1 21 78 4E      [10]  278 	ld	hl,#(_block01 + 0x0002)
   20F4 72            [ 7]  279 	ld	(hl),d
   20F5 18 1C         [12]  280 	jr	00110$
   20F7                     281 00108$:
                            282 ;src/main.c:101: if (( (i8) (block01.x+block01.vx))>0){
   20F7 6B            [ 4]  283 	ld	l,e
   20F8 AF            [ 4]  284 	xor	a, a
   20F9 95            [ 4]  285 	sub	a, l
   20FA E2 FF 20      [10]  286 	jp	PO, 00125$
   20FD EE 80         [ 7]  287 	xor	a, #0x80
   20FF                     288 00125$:
   20FF F2 06 21      [10]  289 	jp	P,00105$
                            290 ;src/main.c:102: block01.x = block01.x + block01.vx;
   2102 7B            [ 4]  291 	ld	a,e
   2103 02            [ 7]  292 	ld	(bc),a
   2104 18 0D         [12]  293 	jr	00110$
   2106                     294 00105$:
                            295 ;src/main.c:105: block01.x = 0;
   2106 AF            [ 4]  296 	xor	a, a
   2107 02            [ 7]  297 	ld	(bc),a
                            298 ;src/main.c:106: block01.vx = - block01.vx;
   2108 21 78 4E      [10]  299 	ld	hl, #(_block01 + 0x0002) + 0
   210B 66            [ 7]  300 	ld	h,(hl)
   210C AF            [ 4]  301 	xor	a, a
   210D 94            [ 4]  302 	sub	a, h
   210E 57            [ 4]  303 	ld	d,a
   210F 21 78 4E      [10]  304 	ld	hl,#(_block01 + 0x0002)
   2112 72            [ 7]  305 	ld	(hl),d
   2113                     306 00110$:
   2113 DD F9         [10]  307 	ld	sp, ix
   2115 DD E1         [14]  308 	pop	ix
   2117 C9            [10]  309 	ret
                            310 ;src/main.c:114: void letras_azules(){
                            311 ;	---------------------------------
                            312 ; Function letras_azules
                            313 ; ---------------------------------
   2118                     314 _letras_azules::
                            315 ;src/main.c:116: cpc_SetInkGphStr(0,0);
   2118 21 00 00      [10]  316 	ld	hl,#0x0000
   211B E5            [11]  317 	push	hl
   211C CD AE 46      [17]  318 	call	_cpc_SetInkGphStr
                            319 ;src/main.c:117: cpc_SetInkGphStr(1,42);
   211F 21 01 2A      [10]  320 	ld	hl, #0x2A01
   2122 E3            [19]  321 	ex	(sp),hl
   2123 CD AE 46      [17]  322 	call	_cpc_SetInkGphStr
                            323 ;src/main.c:118: cpc_SetInkGphStr(2,34);
   2126 21 02 22      [10]  324 	ld	hl, #0x2202
   2129 E3            [19]  325 	ex	(sp),hl
   212A CD AE 46      [17]  326 	call	_cpc_SetInkGphStr
                            327 ;src/main.c:119: cpc_SetInkGphStr(3,42);
   212D 21 03 2A      [10]  328 	ld	hl, #0x2A03
   2130 E3            [19]  329 	ex	(sp),hl
   2131 CD AE 46      [17]  330 	call	_cpc_SetInkGphStr
   2134 F1            [10]  331 	pop	af
   2135 C9            [10]  332 	ret
                            333 ;src/main.c:125: void letras_rojas(){
                            334 ;	---------------------------------
                            335 ; Function letras_rojas
                            336 ; ---------------------------------
   2136                     337 _letras_rojas::
                            338 ;src/main.c:127: cpc_SetInkGphStr(0,0);
   2136 21 00 00      [10]  339 	ld	hl,#0x0000
   2139 E5            [11]  340 	push	hl
   213A CD AE 46      [17]  341 	call	_cpc_SetInkGphStr
                            342 ;src/main.c:128: cpc_SetInkGphStr(1,40);
   213D 21 01 28      [10]  343 	ld	hl, #0x2801
   2140 E3            [19]  344 	ex	(sp),hl
   2141 CD AE 46      [17]  345 	call	_cpc_SetInkGphStr
                            346 ;src/main.c:129: cpc_SetInkGphStr(2,10);
   2144 21 02 0A      [10]  347 	ld	hl, #0x0A02
   2147 E3            [19]  348 	ex	(sp),hl
   2148 CD AE 46      [17]  349 	call	_cpc_SetInkGphStr
                            350 ;src/main.c:130: cpc_SetInkGphStr(3,40);
   214B 21 03 28      [10]  351 	ld	hl, #0x2803
   214E E3            [19]  352 	ex	(sp),hl
   214F CD AE 46      [17]  353 	call	_cpc_SetInkGphStr
   2152 F1            [10]  354 	pop	af
   2153 C9            [10]  355 	ret
                            356 ;src/main.c:137: void set_color (unsigned char fondo,unsigned char t){
                            357 ;	---------------------------------
                            358 ; Function set_color
                            359 ; ---------------------------------
   2154                     360 _set_color::
                            361 ;src/main.c:138: cpc_SetInkGphStr(0,fondo);
   2154 21 02 00      [10]  362 	ld	hl, #2+0
   2157 39            [11]  363 	add	hl, sp
   2158 7E            [ 7]  364 	ld	a, (hl)
   2159 F5            [11]  365 	push	af
   215A 33            [ 6]  366 	inc	sp
   215B AF            [ 4]  367 	xor	a, a
   215C F5            [11]  368 	push	af
   215D 33            [ 6]  369 	inc	sp
   215E CD AE 46      [17]  370 	call	_cpc_SetInkGphStr
   2161 F1            [10]  371 	pop	af
                            372 ;src/main.c:139: cpc_SetInkGphStr(1,t);
   2162 21 03 00      [10]  373 	ld	hl, #3+0
   2165 39            [11]  374 	add	hl, sp
   2166 56            [ 7]  375 	ld	d, (hl)
   2167 1E 01         [ 7]  376 	ld	e,#0x01
   2169 D5            [11]  377 	push	de
   216A CD AE 46      [17]  378 	call	_cpc_SetInkGphStr
   216D F1            [10]  379 	pop	af
                            380 ;src/main.c:140: cpc_SetInkGphStr(2,t);
   216E 21 03 00      [10]  381 	ld	hl, #3+0
   2171 39            [11]  382 	add	hl, sp
   2172 56            [ 7]  383 	ld	d, (hl)
   2173 1E 02         [ 7]  384 	ld	e,#0x02
   2175 D5            [11]  385 	push	de
   2176 CD AE 46      [17]  386 	call	_cpc_SetInkGphStr
   2179 F1            [10]  387 	pop	af
                            388 ;src/main.c:141: cpc_SetInkGphStr(3,t);
   217A 21 03 00      [10]  389 	ld	hl, #3+0
   217D 39            [11]  390 	add	hl, sp
   217E 56            [ 7]  391 	ld	d, (hl)
   217F 1E 03         [ 7]  392 	ld	e,#0x03
   2181 D5            [11]  393 	push	de
   2182 CD AE 46      [17]  394 	call	_cpc_SetInkGphStr
   2185 F1            [10]  395 	pop	af
   2186 C9            [10]  396 	ret
                            397 ;src/main.c:148: void draw_scoreboard(u8* screen){
                            398 ;	---------------------------------
                            399 ; Function draw_scoreboard
                            400 ; ---------------------------------
   2187                     401 _draw_scoreboard::
   2187 DD E5         [15]  402 	push	ix
   2189 DD 21 00 00   [14]  403 	ld	ix,#0
   218D DD 39         [15]  404 	add	ix,sp
                            405 ;src/main.c:150: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 4, 8));
   218F DD 5E 04      [19]  406 	ld	e,4 (ix)
   2192 DD 56 05      [19]  407 	ld	d,5 (ix)
   2195 D5            [11]  408 	push	de
   2196 21 04 08      [10]  409 	ld	hl,#0x0804
   2199 E5            [11]  410 	push	hl
   219A D5            [11]  411 	push	de
   219B CD 11 4D      [17]  412 	call	_cpct_getScreenPtr
   219E F1            [10]  413 	pop	af
   219F F1            [10]  414 	pop	af
   21A0 D1            [10]  415 	pop	de
   21A1 4D            [ 4]  416 	ld	c, l
   21A2 44            [ 4]  417 	ld	b, h
   21A3 21 C6 21      [10]  418 	ld	hl,#___str_0
   21A6 D5            [11]  419 	push	de
   21A7 C5            [11]  420 	push	bc
   21A8 E5            [11]  421 	push	hl
   21A9 CD 5C 45      [17]  422 	call	_cpc_PrintGphStr
   21AC F1            [10]  423 	pop	af
   21AD F1            [10]  424 	pop	af
   21AE D1            [10]  425 	pop	de
                            426 ;src/main.c:151: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   21AF 21 3C 08      [10]  427 	ld	hl,#0x083C
   21B2 E5            [11]  428 	push	hl
   21B3 D5            [11]  429 	push	de
   21B4 CD 11 4D      [17]  430 	call	_cpct_getScreenPtr
   21B7 F1            [10]  431 	pop	af
   21B8 F1            [10]  432 	pop	af
   21B9 11 C6 21      [10]  433 	ld	de,#___str_0
   21BC E5            [11]  434 	push	hl
   21BD D5            [11]  435 	push	de
   21BE CD 5C 45      [17]  436 	call	_cpc_PrintGphStr
   21C1 F1            [10]  437 	pop	af
   21C2 F1            [10]  438 	pop	af
   21C3 DD E1         [14]  439 	pop	ix
   21C5 C9            [10]  440 	ret
   21C6                     441 ___str_0:
   21C6 30 30 30 30 30 30   442 	.ascii "00000000"
        30 30
   21CE 00                  443 	.db 0x00
                            444 ;src/main.c:160: void initialization(){
                            445 ;	---------------------------------
                            446 ; Function initialization
                            447 ; ---------------------------------
   21CF                     448 _initialization::
                            449 ;src/main.c:162: pvmem = SCR_BUFF;
   21CF 21 00 80      [10]  450 	ld	hl,#0x8000
   21D2 22 84 4E      [16]  451 	ld	(_pvmem),hl
                            452 ;src/main.c:165: init_stars();
   21D5 CD A9 42      [17]  453 	call	_init_stars
                            454 ;src/main.c:167: init_user();
   21D8 CD CF 32      [17]  455 	call	_init_user
                            456 ;src/main.c:168: init_shoots();
   21DB CD E2 2F      [17]  457 	call	_init_shoots
                            458 ;src/main.c:169: init_enemies();
   21DE CD D4 22      [17]  459 	call	_init_enemies
                            460 ;src/main.c:170: init_explosions();
   21E1 CD C1 2D      [17]  461 	call	_init_explosions
                            462 ;src/main.c:172: block01.x = 50;
   21E4 21 76 4E      [10]  463 	ld	hl,#_block01+0
   21E7 36 32         [10]  464 	ld	(hl),#0x32
                            465 ;src/main.c:173: block01.y = 10;
   21E9 21 77 4E      [10]  466 	ld	hl,#_block01 + 1
   21EC 36 0A         [10]  467 	ld	(hl),#0x0A
                            468 ;src/main.c:174: block01.vx = 2;
   21EE 21 78 4E      [10]  469 	ld	hl,#_block01 + 2
   21F1 36 02         [10]  470 	ld	(hl),#0x02
                            471 ;src/main.c:175: block01.vy = 0;
   21F3 21 79 4E      [10]  472 	ld	hl,#_block01 + 3
   21F6 36 00         [10]  473 	ld	(hl),#0x00
                            474 ;src/main.c:176: block01.w = 20;
   21F8 21 7A 4E      [10]  475 	ld	hl,#_block01 + 4
   21FB 36 14         [10]  476 	ld	(hl),#0x14
                            477 ;src/main.c:177: block01.h = 40;
   21FD 21 7B 4E      [10]  478 	ld	hl,#_block01 + 5
   2200 36 28         [10]  479 	ld	(hl),#0x28
                            480 ;src/main.c:179: block02.x = 15;
   2202 21 7D 4E      [10]  481 	ld	hl,#_block02+0
   2205 36 0F         [10]  482 	ld	(hl),#0x0F
                            483 ;src/main.c:180: block02.y = 15;
   2207 21 7E 4E      [10]  484 	ld	hl,#_block02 + 1
   220A 36 0F         [10]  485 	ld	(hl),#0x0F
                            486 ;src/main.c:181: block02.vx = 4;
   220C 21 7F 4E      [10]  487 	ld	hl,#_block02 + 2
   220F 36 04         [10]  488 	ld	(hl),#0x04
                            489 ;src/main.c:182: block02.vy = 0;
   2211 21 80 4E      [10]  490 	ld	hl,#_block02 + 3
   2214 36 00         [10]  491 	ld	(hl),#0x00
                            492 ;src/main.c:183: block02.w = 25;
   2216 21 81 4E      [10]  493 	ld	hl,#_block02 + 4
   2219 36 19         [10]  494 	ld	(hl),#0x19
                            495 ;src/main.c:184: block02.h = 20;
   221B 21 82 4E      [10]  496 	ld	hl,#_block02 + 5
   221E 36 14         [10]  497 	ld	(hl),#0x14
                            498 ;src/main.c:186: letras_azules();
   2220 C3 18 21      [10]  499 	jp    _letras_azules
                            500 ;src/main.c:194: void main(void) {
                            501 ;	---------------------------------
                            502 ; Function main
                            503 ; ---------------------------------
   2223                     504 _main::
                            505 ;src/main.c:197: set_stack(0x1000);
   2223 21 00 10      [10]  506 	ld	hl,#0x1000
   2226 E5            [11]  507 	push	hl
   2227 CD BC 49      [17]  508 	call	_set_stack
   222A F1            [10]  509 	pop	af
                            510 ;src/main.c:200: timer_on();
   222B CD 56 44      [17]  511 	call	_timer_on
                            512 ;src/main.c:201: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   222E 11 A6 3C      [10]  513 	ld	de,#_palette
   2231 3E 10         [ 7]  514 	ld	a,#0x10
   2233 F5            [11]  515 	push	af
   2234 33            [ 6]  516 	inc	sp
   2235 D5            [11]  517 	push	de
   2236 CD 90 4B      [17]  518 	call	_cpct_fw2hw
   2239 F1            [10]  519 	pop	af
   223A 33            [ 6]  520 	inc	sp
                            521 ;src/main.c:202: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   223B 11 A6 3C      [10]  522 	ld	de,#_palette
   223E 3E 10         [ 7]  523 	ld	a,#0x10
   2240 F5            [11]  524 	push	af
   2241 33            [ 6]  525 	inc	sp
   2242 D5            [11]  526 	push	de
   2243 CD 3D 4A      [17]  527 	call	_cpct_setPalette
   2246 F1            [10]  528 	pop	af
   2247 33            [ 6]  529 	inc	sp
                            530 ;src/main.c:203: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   2248 3A A6 3C      [13]  531 	ld	a, (#_palette + 0)
   224B 57            [ 4]  532 	ld	d,a
   224C 1E 10         [ 7]  533 	ld	e,#0x10
   224E D5            [11]  534 	push	de
   224F CD D8 4A      [17]  535 	call	_cpct_setPALColour
   2252 F1            [10]  536 	pop	af
                            537 ;src/main.c:204: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2253 AF            [ 4]  538 	xor	a, a
   2254 F5            [11]  539 	push	af
   2255 33            [ 6]  540 	inc	sp
   2256 CD E5 4B      [17]  541 	call	_cpct_setVideoMode
   2259 33            [ 6]  542 	inc	sp
                            543 ;src/main.c:207: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   225A 21 00 40      [10]  544 	ld	hl,#0x4000
   225D E5            [11]  545 	push	hl
   225E AF            [ 4]  546 	xor	a, a
   225F F5            [11]  547 	push	af
   2260 33            [ 6]  548 	inc	sp
   2261 26 C0         [ 7]  549 	ld	h, #0xC0
   2263 E5            [11]  550 	push	hl
   2264 CD 16 4C      [17]  551 	call	_cpct_memset
                            552 ;src/main.c:208: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   2267 21 00 40      [10]  553 	ld	hl,#0x4000
   226A E5            [11]  554 	push	hl
   226B AF            [ 4]  555 	xor	a, a
   226C F5            [11]  556 	push	af
   226D 33            [ 6]  557 	inc	sp
   226E 26 80         [ 7]  558 	ld	h, #0x80
   2270 E5            [11]  559 	push	hl
   2271 CD 16 4C      [17]  560 	call	_cpct_memset
                            561 ;src/main.c:210: initialization(); 
   2274 CD CF 21      [17]  562 	call	_initialization
                            563 ;src/main.c:213: while (1){
   2277                     564 00106$:
                            565 ;src/main.c:215: clear_screen(pvmem);
   2277 2A 84 4E      [16]  566 	ld	hl,(_pvmem)
   227A E5            [11]  567 	push	hl
   227B CD 78 20      [17]  568 	call	_clear_screen
   227E F1            [10]  569 	pop	af
                            570 ;src/main.c:217: update_user();
   227F CD 22 33      [17]  571 	call	_update_user
                            572 ;src/main.c:218: update_shoots();
   2282 CD 5F 31      [17]  573 	call	_update_shoots
                            574 ;src/main.c:219: update_blocks();
   2285 CD 88 20      [17]  575 	call	_update_blocks
                            576 ;src/main.c:220: update_enemies();
   2288 CD DC 26      [17]  577 	call	_update_enemies
                            578 ;src/main.c:221: update_explosions();
   228B CD BC 2E      [17]  579 	call	_update_explosions
                            580 ;src/main.c:224: update_stars();
   228E CD A3 43      [17]  581 	call	_update_stars
                            582 ;src/main.c:229: draw_stars(pvmem);
   2291 2A 84 4E      [16]  583 	ld	hl,(_pvmem)
   2294 E5            [11]  584 	push	hl
   2295 CD 28 43      [17]  585 	call	_draw_stars
   2298 F1            [10]  586 	pop	af
                            587 ;src/main.c:231: draw_blocks(pvmem);
   2299 2A 84 4E      [16]  588 	ld	hl,(_pvmem)
   229C E5            [11]  589 	push	hl
   229D CD 28 20      [17]  590 	call	_draw_blocks
   22A0 F1            [10]  591 	pop	af
                            592 ;src/main.c:232: draw_user(pvmem);
   22A1 2A 84 4E      [16]  593 	ld	hl,(_pvmem)
   22A4 E5            [11]  594 	push	hl
   22A5 CD 14 36      [17]  595 	call	_draw_user
   22A8 F1            [10]  596 	pop	af
                            597 ;src/main.c:233: draw_shoots(pvmem);
   22A9 2A 84 4E      [16]  598 	ld	hl,(_pvmem)
   22AC E5            [11]  599 	push	hl
   22AD CD DF 31      [17]  600 	call	_draw_shoots
   22B0 F1            [10]  601 	pop	af
                            602 ;src/main.c:234: draw_enemies(pvmem);
   22B1 2A 84 4E      [16]  603 	ld	hl,(_pvmem)
   22B4 E5            [11]  604 	push	hl
   22B5 CD 7B 2C      [17]  605 	call	_draw_enemies
   22B8 F1            [10]  606 	pop	af
                            607 ;src/main.c:235: draw_explosions(pvmem);
   22B9 2A 84 4E      [16]  608 	ld	hl,(_pvmem)
   22BC E5            [11]  609 	push	hl
   22BD CD 06 2F      [17]  610 	call	_draw_explosions
   22C0 F1            [10]  611 	pop	af
                            612 ;src/main.c:237: draw_scoreboard(pvmem);
   22C1 2A 84 4E      [16]  613 	ld	hl,(_pvmem)
   22C4 E5            [11]  614 	push	hl
   22C5 CD 87 21      [17]  615 	call	_draw_scoreboard
   22C8 F1            [10]  616 	pop	af
                            617 ;src/main.c:240: cpct_waitVSYNC(); 
   22C9 CD DD 4B      [17]  618 	call	_cpct_waitVSYNC
                            619 ;src/main.c:242: pvmem = changeVideoMemoryPage();
   22CC CD 00 20      [17]  620 	call	_changeVideoMemoryPage
   22CF 22 84 4E      [16]  621 	ld	(_pvmem),hl
                            622 ;src/main.c:247: timer_off();
   22D2 18 A3         [12]  623 	jr	00106$
                            624 	.area _CODE
                            625 	.area _INITIALIZER
                            626 	.area _CABS (ABS)
