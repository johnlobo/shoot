                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:10:22 2015
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
                             46 	.globl _cpct_setVideoMode
                             47 	.globl _cpct_drawSolidBox
                             48 	.globl _cpct_px2byteM0
                             49 	.globl _cpct_memset
                             50 	.globl _aux_txt
                             51 	.globl _pvmem
                             52 	.globl _block02
                             53 	.globl _block01
                             54 ;--------------------------------------------------------
                             55 ; special function registers
                             56 ;--------------------------------------------------------
                             57 ;--------------------------------------------------------
                             58 ; ram data
                             59 ;--------------------------------------------------------
                             60 	.area _DATA
   51C1                      61 _block01::
   51C1                      62 	.ds 7
   51C8                      63 _block02::
   51C8                      64 	.ds 7
   51CF                      65 _pvmem::
   51CF                      66 	.ds 2
   51D1                      67 _aux_txt::
   51D1                      68 	.ds 40
   51F9                      69 _changeVideoMemoryPage_page_1_86:
   51F9                      70 	.ds 1
                             71 ;--------------------------------------------------------
                             72 ; ram data
                             73 ;--------------------------------------------------------
                             74 	.area _INITIALIZED
                             75 ;--------------------------------------------------------
                             76 ; absolute external ram data
                             77 ;--------------------------------------------------------
                             78 	.area _DABS (ABS)
                             79 ;--------------------------------------------------------
                             80 ; global & static initialisations
                             81 ;--------------------------------------------------------
                             82 	.area _HOME
                             83 	.area _GSINIT
                             84 	.area _GSFINAL
                             85 	.area _GSINIT
                             86 ;src/main.c:52: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   5B08 FD 21 F9 51   [14]   87 	ld	iy,#_changeVideoMemoryPage_page_1_86
   5B0C FD 36 00 00   [19]   88 	ld	0 (iy),#0x00
                             89 ;--------------------------------------------------------
                             90 ; Home
                             91 ;--------------------------------------------------------
                             92 	.area _HOME
                             93 	.area _HOME
                             94 ;--------------------------------------------------------
                             95 ; code
                             96 ;--------------------------------------------------------
                             97 	.area _CODE
                             98 ;src/main.c:51: u8* changeVideoMemoryPage() {
                             99 ;	---------------------------------
                            100 ; Function changeVideoMemoryPage
                            101 ; ---------------------------------
   2000                     102 _changeVideoMemoryPage::
                            103 ;src/main.c:57: if (page) {
   2000 3A F9 51      [13]  104 	ld	a,(#_changeVideoMemoryPage_page_1_86 + 0)
   2003 B7            [ 4]  105 	or	a, a
   2004 28 11         [12]  106 	jr	Z,00102$
                            107 ;src/main.c:58: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  108 	ld	a,#0x30
   2008 F5            [11]  109 	push	af
   2009 33            [ 6]  110 	inc	sp
   200A CD 0F 4F      [17]  111 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  112 	inc	sp
                            113 ;src/main.c:59: page = 0;  
   200E 21 F9 51      [10]  114 	ld	hl,#_changeVideoMemoryPage_page_1_86 + 0
   2011 36 00         [10]  115 	ld	(hl), #0x00
                            116 ;src/main.c:60: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  117 	ld	hl,#0x8000
   2016 C9            [10]  118 	ret
   2017                     119 00102$:
                            120 ;src/main.c:62: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  121 	ld	a,#0x20
   2019 F5            [11]  122 	push	af
   201A 33            [ 6]  123 	inc	sp
   201B CD 0F 4F      [17]  124 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  125 	inc	sp
                            126 ;src/main.c:63: page = 1;                              // Next page = 1
   201F 21 F9 51      [10]  127 	ld	hl,#_changeVideoMemoryPage_page_1_86 + 0
   2022 36 01         [10]  128 	ld	(hl), #0x01
                            129 ;src/main.c:64: screen = SCR_VMEM;
   2024 21 00 C0      [10]  130 	ld	hl,#0xC000
                            131 ;src/main.c:66: return screen;
   2027 C9            [10]  132 	ret
                            133 ;src/main.c:74: void draw_blocks(u8* screen){
                            134 ;	---------------------------------
                            135 ; Function draw_blocks
                            136 ; ---------------------------------
   2028                     137 _draw_blocks::
   2028 DD E5         [15]  138 	push	ix
   202A DD 21 00 00   [14]  139 	ld	ix,#0
   202E DD 39         [15]  140 	add	ix,sp
   2030 3B            [ 6]  141 	dec	sp
                            142 ;src/main.c:77: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2031 21 C2 51      [10]  143 	ld	hl, #_block01 + 1
   2034 4E            [ 7]  144 	ld	c,(hl)
   2035 21 C1 51      [10]  145 	ld	hl, #_block01 + 0
   2038 66            [ 7]  146 	ld	h,(hl)
   2039 DD 5E 04      [19]  147 	ld	e,4 (ix)
   203C DD 56 05      [19]  148 	ld	d,5 (ix)
   203F 79            [ 4]  149 	ld	a,c
   2040 F5            [11]  150 	push	af
   2041 33            [ 6]  151 	inc	sp
   2042 E5            [11]  152 	push	hl
   2043 33            [ 6]  153 	inc	sp
   2044 D5            [11]  154 	push	de
   2045 CD 5C 50      [17]  155 	call	_cpct_getScreenPtr
   2048 F1            [10]  156 	pop	af
   2049 F1            [10]  157 	pop	af
   204A 5D            [ 4]  158 	ld	e, l
   204B 54            [ 4]  159 	ld	d, h
                            160 ;src/main.c:78: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   204C 21 C6 51      [10]  161 	ld	hl, #_block01 + 5
   204F 4E            [ 7]  162 	ld	c,(hl)
   2050 21 C5 51      [10]  163 	ld	hl, #_block01 + 4
   2053 46            [ 7]  164 	ld	b,(hl)
   2054 C5            [11]  165 	push	bc
   2055 D5            [11]  166 	push	de
   2056 21 04 04      [10]  167 	ld	hl,#0x0404
   2059 E5            [11]  168 	push	hl
   205A CD 4A 4F      [17]  169 	call	_cpct_px2byteM0
   205D F1            [10]  170 	pop	af
   205E DD 75 FF      [19]  171 	ld	-1 (ix),l
   2061 D1            [10]  172 	pop	de
   2062 C1            [10]  173 	pop	bc
   2063 79            [ 4]  174 	ld	a,c
   2064 F5            [11]  175 	push	af
   2065 33            [ 6]  176 	inc	sp
   2066 C5            [11]  177 	push	bc
   2067 33            [ 6]  178 	inc	sp
   2068 DD 7E FF      [19]  179 	ld	a,-1 (ix)
   206B F5            [11]  180 	push	af
   206C 33            [ 6]  181 	inc	sp
   206D D5            [11]  182 	push	de
   206E CD 77 4F      [17]  183 	call	_cpct_drawSolidBox
   2071 F1            [10]  184 	pop	af
   2072 F1            [10]  185 	pop	af
   2073 33            [ 6]  186 	inc	sp
   2074 33            [ 6]  187 	inc	sp
   2075 DD E1         [14]  188 	pop	ix
   2077 C9            [10]  189 	ret
                            190 ;src/main.c:85: void clear_screen(u8* screen){
                            191 ;	---------------------------------
                            192 ; Function clear_screen
                            193 ; ---------------------------------
   2078                     194 _clear_screen::
                            195 ;src/main.c:86: cpct_memset(screen, 0x00, 0x4000);   
   2078 C1            [10]  196 	pop	bc
   2079 D1            [10]  197 	pop	de
   207A D5            [11]  198 	push	de
   207B C5            [11]  199 	push	bc
   207C 21 00 40      [10]  200 	ld	hl,#0x4000
   207F E5            [11]  201 	push	hl
   2080 AF            [ 4]  202 	xor	a, a
   2081 F5            [11]  203 	push	af
   2082 33            [ 6]  204 	inc	sp
   2083 D5            [11]  205 	push    de
   2084 CD 69 4F      [17]  206 	call    _cpct_memset
   2087 C9            [10]  207 	ret
                            208 ;src/main.c:93: void update_blocks(){
                            209 ;	---------------------------------
                            210 ; Function update_blocks
                            211 ; ---------------------------------
   2088                     212 _update_blocks::
   2088 DD E5         [15]  213 	push	ix
   208A DD 21 00 00   [14]  214 	ld	ix,#0
   208E DD 39         [15]  215 	add	ix,sp
   2090 F5            [11]  216 	push	af
   2091 3B            [ 6]  217 	dec	sp
                            218 ;src/main.c:94: if (block01.vx<128){
   2092 01 C1 51      [10]  219 	ld	bc,#_block01+0
   2095 21 C3 51      [10]  220 	ld	hl, #(_block01 + 0x0002) + 0
   2098 7E            [ 7]  221 	ld	a,(hl)
   2099 DD 77 FF      [19]  222 	ld	-1 (ix),a
                            223 ;src/main.c:95: if ((block01.x+block01.vx)<(80-block01.w)){
   209C 0A            [ 7]  224 	ld	a,(bc)
                            225 ;src/main.c:96: block01.x = block01.x + block01.vx;
   209D 57            [ 4]  226 	ld	d,a
   209E DD 86 FF      [19]  227 	add	a, -1 (ix)
   20A1 5F            [ 4]  228 	ld	e,a
                            229 ;src/main.c:94: if (block01.vx<128){
   20A2 DD 7E FF      [19]  230 	ld	a,-1 (ix)
   20A5 D6 80         [ 7]  231 	sub	a, #0x80
   20A7 30 4E         [12]  232 	jr	NC,00108$
                            233 ;src/main.c:95: if ((block01.x+block01.vx)<(80-block01.w)){
   20A9 DD 72 FD      [19]  234 	ld	-3 (ix),d
   20AC DD 36 FE 00   [19]  235 	ld	-2 (ix),#0x00
   20B0 DD 66 FF      [19]  236 	ld	h,-1 (ix)
   20B3 2E 00         [ 7]  237 	ld	l,#0x00
   20B5 DD 7E FD      [19]  238 	ld	a,-3 (ix)
   20B8 84            [ 4]  239 	add	a, h
   20B9 DD 77 FD      [19]  240 	ld	-3 (ix),a
   20BC DD 7E FE      [19]  241 	ld	a,-2 (ix)
   20BF 8D            [ 4]  242 	adc	a, l
   20C0 DD 77 FE      [19]  243 	ld	-2 (ix),a
   20C3 21 C5 51      [10]  244 	ld	hl, #_block01 + 4
   20C6 66            [ 7]  245 	ld	h,(hl)
   20C7 6C            [ 4]  246 	ld	l,h
   20C8 16 00         [ 7]  247 	ld	d,#0x00
   20CA 3E 50         [ 7]  248 	ld	a,#0x50
   20CC 95            [ 4]  249 	sub	a, l
   20CD 6F            [ 4]  250 	ld	l,a
   20CE 3E 00         [ 7]  251 	ld	a,#0x00
   20D0 9A            [ 4]  252 	sbc	a, d
   20D1 57            [ 4]  253 	ld	d,a
   20D2 DD 7E FD      [19]  254 	ld	a,-3 (ix)
   20D5 95            [ 4]  255 	sub	a, l
   20D6 DD 7E FE      [19]  256 	ld	a,-2 (ix)
   20D9 9A            [ 4]  257 	sbc	a, d
   20DA E2 DF 20      [10]  258 	jp	PO, 00124$
   20DD EE 80         [ 7]  259 	xor	a, #0x80
   20DF                     260 00124$:
   20DF F2 E6 20      [10]  261 	jp	P,00102$
                            262 ;src/main.c:96: block01.x = block01.x + block01.vx;
   20E2 7B            [ 4]  263 	ld	a,e
   20E3 02            [ 7]  264 	ld	(bc),a
   20E4 18 2D         [12]  265 	jr	00110$
   20E6                     266 00102$:
                            267 ;src/main.c:99: block01.x = 79-block01.w;
   20E6 3E 4F         [ 7]  268 	ld	a,#0x4F
   20E8 94            [ 4]  269 	sub	a, h
   20E9 02            [ 7]  270 	ld	(bc),a
                            271 ;src/main.c:100: block01.vx = - block01.vx;
   20EA 21 C3 51      [10]  272 	ld	hl, #(_block01 + 0x0002) + 0
   20ED 66            [ 7]  273 	ld	h,(hl)
   20EE AF            [ 4]  274 	xor	a, a
   20EF 94            [ 4]  275 	sub	a, h
   20F0 57            [ 4]  276 	ld	d,a
   20F1 21 C3 51      [10]  277 	ld	hl,#(_block01 + 0x0002)
   20F4 72            [ 7]  278 	ld	(hl),d
   20F5 18 1C         [12]  279 	jr	00110$
   20F7                     280 00108$:
                            281 ;src/main.c:103: if (( (i8) (block01.x+block01.vx))>0){
   20F7 6B            [ 4]  282 	ld	l,e
   20F8 AF            [ 4]  283 	xor	a, a
   20F9 95            [ 4]  284 	sub	a, l
   20FA E2 FF 20      [10]  285 	jp	PO, 00125$
   20FD EE 80         [ 7]  286 	xor	a, #0x80
   20FF                     287 00125$:
   20FF F2 06 21      [10]  288 	jp	P,00105$
                            289 ;src/main.c:104: block01.x = block01.x + block01.vx;
   2102 7B            [ 4]  290 	ld	a,e
   2103 02            [ 7]  291 	ld	(bc),a
   2104 18 0D         [12]  292 	jr	00110$
   2106                     293 00105$:
                            294 ;src/main.c:107: block01.x = 0;
   2106 AF            [ 4]  295 	xor	a, a
   2107 02            [ 7]  296 	ld	(bc),a
                            297 ;src/main.c:108: block01.vx = - block01.vx;
   2108 21 C3 51      [10]  298 	ld	hl, #(_block01 + 0x0002) + 0
   210B 66            [ 7]  299 	ld	h,(hl)
   210C AF            [ 4]  300 	xor	a, a
   210D 94            [ 4]  301 	sub	a, h
   210E 57            [ 4]  302 	ld	d,a
   210F 21 C3 51      [10]  303 	ld	hl,#(_block01 + 0x0002)
   2112 72            [ 7]  304 	ld	(hl),d
   2113                     305 00110$:
   2113 DD F9         [10]  306 	ld	sp, ix
   2115 DD E1         [14]  307 	pop	ix
   2117 C9            [10]  308 	ret
                            309 ;src/main.c:116: void letras_azules(){
                            310 ;	---------------------------------
                            311 ; Function letras_azules
                            312 ; ---------------------------------
   2118                     313 _letras_azules::
                            314 ;src/main.c:118: cpc_SetInkGphStr(0,0);
   2118 21 00 00      [10]  315 	ld	hl,#0x0000
   211B E5            [11]  316 	push	hl
   211C CD F0 48      [17]  317 	call	_cpc_SetInkGphStr
                            318 ;src/main.c:119: cpc_SetInkGphStr(1,42);
   211F 21 01 2A      [10]  319 	ld	hl, #0x2A01
   2122 E3            [19]  320 	ex	(sp),hl
   2123 CD F0 48      [17]  321 	call	_cpc_SetInkGphStr
                            322 ;src/main.c:120: cpc_SetInkGphStr(2,34);
   2126 21 02 22      [10]  323 	ld	hl, #0x2202
   2129 E3            [19]  324 	ex	(sp),hl
   212A CD F0 48      [17]  325 	call	_cpc_SetInkGphStr
                            326 ;src/main.c:121: cpc_SetInkGphStr(3,42);
   212D 21 03 2A      [10]  327 	ld	hl, #0x2A03
   2130 E3            [19]  328 	ex	(sp),hl
   2131 CD F0 48      [17]  329 	call	_cpc_SetInkGphStr
   2134 F1            [10]  330 	pop	af
   2135 C9            [10]  331 	ret
                            332 ;src/main.c:127: void letras_rojas(){
                            333 ;	---------------------------------
                            334 ; Function letras_rojas
                            335 ; ---------------------------------
   2136                     336 _letras_rojas::
                            337 ;src/main.c:129: cpc_SetInkGphStr(0,0);
   2136 21 00 00      [10]  338 	ld	hl,#0x0000
   2139 E5            [11]  339 	push	hl
   213A CD F0 48      [17]  340 	call	_cpc_SetInkGphStr
                            341 ;src/main.c:130: cpc_SetInkGphStr(1,40);
   213D 21 01 28      [10]  342 	ld	hl, #0x2801
   2140 E3            [19]  343 	ex	(sp),hl
   2141 CD F0 48      [17]  344 	call	_cpc_SetInkGphStr
                            345 ;src/main.c:131: cpc_SetInkGphStr(2,10);
   2144 21 02 0A      [10]  346 	ld	hl, #0x0A02
   2147 E3            [19]  347 	ex	(sp),hl
   2148 CD F0 48      [17]  348 	call	_cpc_SetInkGphStr
                            349 ;src/main.c:132: cpc_SetInkGphStr(3,40);
   214B 21 03 28      [10]  350 	ld	hl, #0x2803
   214E E3            [19]  351 	ex	(sp),hl
   214F CD F0 48      [17]  352 	call	_cpc_SetInkGphStr
   2152 F1            [10]  353 	pop	af
   2153 C9            [10]  354 	ret
                            355 ;src/main.c:139: void set_color (unsigned char fondo,unsigned char t){
                            356 ;	---------------------------------
                            357 ; Function set_color
                            358 ; ---------------------------------
   2154                     359 _set_color::
                            360 ;src/main.c:140: cpc_SetInkGphStr(0,fondo);
   2154 21 02 00      [10]  361 	ld	hl, #2+0
   2157 39            [11]  362 	add	hl, sp
   2158 7E            [ 7]  363 	ld	a, (hl)
   2159 F5            [11]  364 	push	af
   215A 33            [ 6]  365 	inc	sp
   215B AF            [ 4]  366 	xor	a, a
   215C F5            [11]  367 	push	af
   215D 33            [ 6]  368 	inc	sp
   215E CD F0 48      [17]  369 	call	_cpc_SetInkGphStr
   2161 F1            [10]  370 	pop	af
                            371 ;src/main.c:141: cpc_SetInkGphStr(1,t);
   2162 21 03 00      [10]  372 	ld	hl, #3+0
   2165 39            [11]  373 	add	hl, sp
   2166 56            [ 7]  374 	ld	d, (hl)
   2167 1E 01         [ 7]  375 	ld	e,#0x01
   2169 D5            [11]  376 	push	de
   216A CD F0 48      [17]  377 	call	_cpc_SetInkGphStr
   216D F1            [10]  378 	pop	af
                            379 ;src/main.c:142: cpc_SetInkGphStr(2,t);
   216E 21 03 00      [10]  380 	ld	hl, #3+0
   2171 39            [11]  381 	add	hl, sp
   2172 56            [ 7]  382 	ld	d, (hl)
   2173 1E 02         [ 7]  383 	ld	e,#0x02
   2175 D5            [11]  384 	push	de
   2176 CD F0 48      [17]  385 	call	_cpc_SetInkGphStr
   2179 F1            [10]  386 	pop	af
                            387 ;src/main.c:143: cpc_SetInkGphStr(3,t);
   217A 21 03 00      [10]  388 	ld	hl, #3+0
   217D 39            [11]  389 	add	hl, sp
   217E 56            [ 7]  390 	ld	d, (hl)
   217F 1E 03         [ 7]  391 	ld	e,#0x03
   2181 D5            [11]  392 	push	de
   2182 CD F0 48      [17]  393 	call	_cpc_SetInkGphStr
   2185 F1            [10]  394 	pop	af
   2186 C9            [10]  395 	ret
                            396 ;src/main.c:150: void draw_scoreboard(u8* screen){
                            397 ;	---------------------------------
                            398 ; Function draw_scoreboard
                            399 ; ---------------------------------
   2187                     400 _draw_scoreboard::
   2187 DD E5         [15]  401 	push	ix
   2189 DD 21 00 00   [14]  402 	ld	ix,#0
   218D DD 39         [15]  403 	add	ix,sp
                            404 ;src/main.c:152: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 4, 8));
   218F DD 5E 04      [19]  405 	ld	e,4 (ix)
   2192 DD 56 05      [19]  406 	ld	d,5 (ix)
   2195 D5            [11]  407 	push	de
   2196 21 04 08      [10]  408 	ld	hl,#0x0804
   2199 E5            [11]  409 	push	hl
   219A D5            [11]  410 	push	de
   219B CD 5C 50      [17]  411 	call	_cpct_getScreenPtr
   219E F1            [10]  412 	pop	af
   219F F1            [10]  413 	pop	af
   21A0 D1            [10]  414 	pop	de
   21A1 4D            [ 4]  415 	ld	c, l
   21A2 44            [ 4]  416 	ld	b, h
   21A3 21 C6 21      [10]  417 	ld	hl,#___str_0
   21A6 D5            [11]  418 	push	de
   21A7 C5            [11]  419 	push	bc
   21A8 E5            [11]  420 	push	hl
   21A9 CD 9E 47      [17]  421 	call	_cpc_PrintGphStr
   21AC F1            [10]  422 	pop	af
   21AD F1            [10]  423 	pop	af
   21AE D1            [10]  424 	pop	de
                            425 ;src/main.c:153: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   21AF 21 3C 08      [10]  426 	ld	hl,#0x083C
   21B2 E5            [11]  427 	push	hl
   21B3 D5            [11]  428 	push	de
   21B4 CD 5C 50      [17]  429 	call	_cpct_getScreenPtr
   21B7 F1            [10]  430 	pop	af
   21B8 F1            [10]  431 	pop	af
   21B9 11 C6 21      [10]  432 	ld	de,#___str_0
   21BC E5            [11]  433 	push	hl
   21BD D5            [11]  434 	push	de
   21BE CD 9E 47      [17]  435 	call	_cpc_PrintGphStr
   21C1 F1            [10]  436 	pop	af
   21C2 F1            [10]  437 	pop	af
   21C3 DD E1         [14]  438 	pop	ix
   21C5 C9            [10]  439 	ret
   21C6                     440 ___str_0:
   21C6 30 30 30 30 30 30   441 	.ascii "00000000"
        30 30
   21CE 00                  442 	.db 0x00
                            443 ;src/main.c:162: void initialization(){
                            444 ;	---------------------------------
                            445 ; Function initialization
                            446 ; ---------------------------------
   21CF                     447 _initialization::
                            448 ;src/main.c:164: pvmem = SCR_BUFF;
   21CF 21 00 80      [10]  449 	ld	hl,#0x8000
   21D2 22 CF 51      [16]  450 	ld	(_pvmem),hl
                            451 ;src/main.c:167: init_stars();
   21D5 CD EB 44      [17]  452 	call	_init_stars
                            453 ;src/main.c:169: init_user();
   21D8 CD B9 34      [17]  454 	call	_init_user
                            455 ;src/main.c:170: init_shoots();
   21DB CD 3A 31      [17]  456 	call	_init_shoots
                            457 ;src/main.c:171: init_enemies();
   21DE CD 10 24      [17]  458 	call	_init_enemies
                            459 ;src/main.c:172: init_explosions();
   21E1 CD FD 2E      [17]  460 	call	_init_explosions
                            461 ;src/main.c:174: block01.x = 50;
   21E4 21 C1 51      [10]  462 	ld	hl,#_block01+0
   21E7 36 32         [10]  463 	ld	(hl),#0x32
                            464 ;src/main.c:175: block01.y = 10;
   21E9 21 C2 51      [10]  465 	ld	hl,#_block01 + 1
   21EC 36 0A         [10]  466 	ld	(hl),#0x0A
                            467 ;src/main.c:176: block01.vx = 2;
   21EE 21 C3 51      [10]  468 	ld	hl,#_block01 + 2
   21F1 36 02         [10]  469 	ld	(hl),#0x02
                            470 ;src/main.c:177: block01.vy = 0;
   21F3 21 C4 51      [10]  471 	ld	hl,#_block01 + 3
   21F6 36 00         [10]  472 	ld	(hl),#0x00
                            473 ;src/main.c:178: block01.w = 20;
   21F8 21 C5 51      [10]  474 	ld	hl,#_block01 + 4
   21FB 36 14         [10]  475 	ld	(hl),#0x14
                            476 ;src/main.c:179: block01.h = 40;
   21FD 21 C6 51      [10]  477 	ld	hl,#_block01 + 5
   2200 36 28         [10]  478 	ld	(hl),#0x28
                            479 ;src/main.c:181: block02.x = 15;
   2202 21 C8 51      [10]  480 	ld	hl,#_block02+0
   2205 36 0F         [10]  481 	ld	(hl),#0x0F
                            482 ;src/main.c:182: block02.y = 15;
   2207 21 C9 51      [10]  483 	ld	hl,#_block02 + 1
   220A 36 0F         [10]  484 	ld	(hl),#0x0F
                            485 ;src/main.c:183: block02.vx = 4;
   220C 21 CA 51      [10]  486 	ld	hl,#_block02 + 2
   220F 36 04         [10]  487 	ld	(hl),#0x04
                            488 ;src/main.c:184: block02.vy = 0;
   2211 21 CB 51      [10]  489 	ld	hl,#_block02 + 3
   2214 36 00         [10]  490 	ld	(hl),#0x00
                            491 ;src/main.c:185: block02.w = 25;
   2216 21 CC 51      [10]  492 	ld	hl,#_block02 + 4
   2219 36 19         [10]  493 	ld	(hl),#0x19
                            494 ;src/main.c:186: block02.h = 20;
   221B 21 CD 51      [10]  495 	ld	hl,#_block02 + 5
   221E 36 14         [10]  496 	ld	(hl),#0x14
                            497 ;src/main.c:188: letras_azules();
   2220 C3 18 21      [10]  498 	jp    _letras_azules
                            499 ;src/main.c:196: void main(void) {
                            500 ;	---------------------------------
                            501 ; Function main
                            502 ; ---------------------------------
   2223                     503 _main::
                            504 ;src/main.c:199: set_stack(0x1000);
   2223 21 00 10      [10]  505 	ld	hl,#0x1000
   2226 E5            [11]  506 	push	hl
   2227 CD FE 4B      [17]  507 	call	_set_stack
   222A F1            [10]  508 	pop	af
                            509 ;src/main.c:202: timer_on();
   222B CD 98 46      [17]  510 	call	_timer_on
                            511 ;src/main.c:203: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   222E 11 E8 3E      [10]  512 	ld	de,#_palette
   2231 3E 10         [ 7]  513 	ld	a,#0x10
   2233 F5            [11]  514 	push	af
   2234 33            [ 6]  515 	inc	sp
   2235 D5            [11]  516 	push	de
   2236 CD EB 4E      [17]  517 	call	_cpct_fw2hw
   2239 F1            [10]  518 	pop	af
   223A 33            [ 6]  519 	inc	sp
                            520 ;src/main.c:204: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   223B 11 E8 3E      [10]  521 	ld	de,#_palette
   223E 3E 10         [ 7]  522 	ld	a,#0x10
   2240 F5            [11]  523 	push	af
   2241 33            [ 6]  524 	inc	sp
   2242 D5            [11]  525 	push	de
   2243 CD 9B 4D      [17]  526 	call	_cpct_setPalette
   2246 F1            [10]  527 	pop	af
   2247 33            [ 6]  528 	inc	sp
                            529 ;src/main.c:205: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   2248 3A E8 3E      [13]  530 	ld	a, (#_palette + 0)
   224B 57            [ 4]  531 	ld	d,a
   224C 1E 10         [ 7]  532 	ld	e,#0x10
   224E D5            [11]  533 	push	de
   224F CD 36 4E      [17]  534 	call	_cpct_setPALColour
   2252 F1            [10]  535 	pop	af
                            536 ;src/main.c:206: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2253 AF            [ 4]  537 	xor	a, a
   2254 F5            [11]  538 	push	af
   2255 33            [ 6]  539 	inc	sp
   2256 CD 38 4F      [17]  540 	call	_cpct_setVideoMode
   2259 33            [ 6]  541 	inc	sp
                            542 ;src/main.c:209: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   225A 21 00 40      [10]  543 	ld	hl,#0x4000
   225D E5            [11]  544 	push	hl
   225E AF            [ 4]  545 	xor	a, a
   225F F5            [11]  546 	push	af
   2260 33            [ 6]  547 	inc	sp
   2261 26 C0         [ 7]  548 	ld	h, #0xC0
   2263 E5            [11]  549 	push	hl
   2264 CD 69 4F      [17]  550 	call	_cpct_memset
                            551 ;src/main.c:210: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   2267 21 00 40      [10]  552 	ld	hl,#0x4000
   226A E5            [11]  553 	push	hl
   226B AF            [ 4]  554 	xor	a, a
   226C F5            [11]  555 	push	af
   226D 33            [ 6]  556 	inc	sp
   226E 26 80         [ 7]  557 	ld	h, #0x80
   2270 E5            [11]  558 	push	hl
   2271 CD 69 4F      [17]  559 	call	_cpct_memset
                            560 ;src/main.c:212: initialization(); 
   2274 CD CF 21      [17]  561 	call	_initialization
                            562 ;src/main.c:215: while (1){
   2277                     563 00106$:
                            564 ;src/main.c:217: clear_screen(pvmem);
   2277 2A CF 51      [16]  565 	ld	hl,(_pvmem)
   227A E5            [11]  566 	push	hl
   227B CD 78 20      [17]  567 	call	_clear_screen
   227E F1            [10]  568 	pop	af
                            569 ;src/main.c:219: update_user();
   227F CD 0C 35      [17]  570 	call	_update_user
                            571 ;src/main.c:220: update_shoots();
   2282 CD B4 32      [17]  572 	call	_update_shoots
                            573 ;src/main.c:221: update_blocks();
   2285 CD 88 20      [17]  574 	call	_update_blocks
                            575 ;src/main.c:222: update_enemies();
   2288 CD 18 28      [17]  576 	call	_update_enemies
                            577 ;src/main.c:223: update_explosions();
   228B CD F8 2F      [17]  578 	call	_update_explosions
                            579 ;src/main.c:226: update_stars();
   228E CD E5 45      [17]  580 	call	_update_stars
                            581 ;src/main.c:231: draw_stars(pvmem);
   2291 2A CF 51      [16]  582 	ld	hl,(_pvmem)
   2294 E5            [11]  583 	push	hl
   2295 CD 6A 45      [17]  584 	call	_draw_stars
   2298 F1            [10]  585 	pop	af
                            586 ;src/main.c:233: draw_blocks(pvmem);
   2299 2A CF 51      [16]  587 	ld	hl,(_pvmem)
   229C E5            [11]  588 	push	hl
   229D CD 28 20      [17]  589 	call	_draw_blocks
   22A0 F1            [10]  590 	pop	af
                            591 ;src/main.c:234: draw_user(pvmem);
   22A1 2A CF 51      [16]  592 	ld	hl,(_pvmem)
   22A4 E5            [11]  593 	push	hl
   22A5 CD 56 38      [17]  594 	call	_draw_user
   22A8 F1            [10]  595 	pop	af
                            596 ;src/main.c:235: draw_shoots(pvmem);
   22A9 2A CF 51      [16]  597 	ld	hl,(_pvmem)
   22AC E5            [11]  598 	push	hl
   22AD CD C9 33      [17]  599 	call	_draw_shoots
   22B0 F1            [10]  600 	pop	af
                            601 ;src/main.c:236: draw_enemies(pvmem);
   22B1 2A CF 51      [16]  602 	ld	hl,(_pvmem)
   22B4 E5            [11]  603 	push	hl
   22B5 CD B7 2D      [17]  604 	call	_draw_enemies
   22B8 F1            [10]  605 	pop	af
                            606 ;src/main.c:237: draw_explosions(pvmem);
   22B9 2A CF 51      [16]  607 	ld	hl,(_pvmem)
   22BC E5            [11]  608 	push	hl
   22BD CD 42 30      [17]  609 	call	_draw_explosions
   22C0 F1            [10]  610 	pop	af
                            611 ;src/main.c:239: draw_scoreboard(pvmem);
   22C1 2A CF 51      [16]  612 	ld	hl,(_pvmem)
   22C4 E5            [11]  613 	push	hl
   22C5 CD 87 21      [17]  614 	call	_draw_scoreboard
   22C8 F1            [10]  615 	pop	af
                            616 ;src/main.c:244: pvmem = changeVideoMemoryPage();
   22C9 CD 00 20      [17]  617 	call	_changeVideoMemoryPage
   22CC 22 CF 51      [16]  618 	ld	(_pvmem),hl
   22CF 18 A6         [12]  619 	jr	00106$
                            620 	.area _CODE
                            621 	.area _INITIALIZER
                            622 	.area _CABS (ABS)
