                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Jul  3 17:13:18 2015
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
                             22 	.globl _set_stack
                             23 	.globl _cpc_SetInkGphStr
                             24 	.globl _cpc_PrintGphStr
                             25 	.globl _update_stars
                             26 	.globl _draw_stars
                             27 	.globl _init_stars
                             28 	.globl _draw_user
                             29 	.globl _update_user
                             30 	.globl _init_user
                             31 	.globl _draw_shoots
                             32 	.globl _update_shoots
                             33 	.globl _init_shoots
                             34 	.globl _cpct_getScreenPtr
                             35 	.globl _cpct_setVideoMemoryPage
                             36 	.globl _cpct_setPALColour
                             37 	.globl _cpct_setPalette
                             38 	.globl _cpct_fw2hw
                             39 	.globl _cpct_waitVSYNC
                             40 	.globl _cpct_setVideoMode
                             41 	.globl _cpct_drawSolidBox
                             42 	.globl _cpct_px2byteM0
                             43 	.globl _cpct_memset
                             44 	.globl _cpct_disableFirmware
                             45 	.globl _aux_txt
                             46 	.globl _pvmem
                             47 	.globl _block02
                             48 	.globl _block01
                             49 ;--------------------------------------------------------
                             50 ; special function registers
                             51 ;--------------------------------------------------------
                             52 ;--------------------------------------------------------
                             53 ; ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DATA
   36C8                      56 _block01::
   36C8                      57 	.ds 7
   36CF                      58 _block02::
   36CF                      59 	.ds 7
   36D6                      60 _pvmem::
   36D6                      61 	.ds 2
   36D8                      62 _aux_txt::
   36D8                      63 	.ds 40
   3700                      64 _changeVideoMemoryPage_page_1_76:
   3700                      65 	.ds 1
                             66 ;--------------------------------------------------------
                             67 ; ram data
                             68 ;--------------------------------------------------------
                             69 	.area _INITIALIZED
                             70 ;--------------------------------------------------------
                             71 ; absolute external ram data
                             72 ;--------------------------------------------------------
                             73 	.area _DABS (ABS)
                             74 ;--------------------------------------------------------
                             75 ; global & static initialisations
                             76 ;--------------------------------------------------------
                             77 	.area _HOME
                             78 	.area _GSINIT
                             79 	.area _GSFINAL
                             80 	.area _GSINIT
                             81 ;src/main.c:54: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   3A11 FD 21 00 37   [14]   82 	ld	iy,#_changeVideoMemoryPage_page_1_76
   3A15 FD 36 00 00   [19]   83 	ld	0 (iy),#0x00
                             84 ;--------------------------------------------------------
                             85 ; Home
                             86 ;--------------------------------------------------------
                             87 	.area _HOME
                             88 	.area _HOME
                             89 ;--------------------------------------------------------
                             90 ; code
                             91 ;--------------------------------------------------------
                             92 	.area _CODE
                             93 ;src/main.c:53: u8* changeVideoMemoryPage() {
                             94 ;	---------------------------------
                             95 ; Function changeVideoMemoryPage
                             96 ; ---------------------------------
   2000                      97 _changeVideoMemoryPage::
                             98 ;src/main.c:59: if (page) {
   2000 3A 00 37      [13]   99 	ld	a,(#_changeVideoMemoryPage_page_1_76 + 0)
   2003 B7            [ 4]  100 	or	a, a
   2004 28 11         [12]  101 	jr	Z,00102$
                            102 ;src/main.c:60: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  103 	ld	a,#0x30
   2008 F5            [11]  104 	push	af
   2009 33            [ 6]  105 	inc	sp
   200A CD 00 34      [17]  106 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  107 	inc	sp
                            108 ;src/main.c:61: page = 0;  
   200E 21 00 37      [10]  109 	ld	hl,#_changeVideoMemoryPage_page_1_76 + 0
   2011 36 00         [10]  110 	ld	(hl), #0x00
                            111 ;src/main.c:62: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  112 	ld	hl,#0x8000
   2016 C9            [10]  113 	ret
   2017                     114 00102$:
                            115 ;src/main.c:64: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  116 	ld	a,#0x20
   2019 F5            [11]  117 	push	af
   201A 33            [ 6]  118 	inc	sp
   201B CD 00 34      [17]  119 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  120 	inc	sp
                            121 ;src/main.c:65: page = 1;                              // Next page = 1
   201F 21 00 37      [10]  122 	ld	hl,#_changeVideoMemoryPage_page_1_76 + 0
   2022 36 01         [10]  123 	ld	(hl), #0x01
                            124 ;src/main.c:66: screen = SCR_VMEM;
   2024 21 00 C0      [10]  125 	ld	hl,#0xC000
                            126 ;src/main.c:68: return screen;
   2027 C9            [10]  127 	ret
                            128 ;src/main.c:76: void draw_blocks(u8* screen){
                            129 ;	---------------------------------
                            130 ; Function draw_blocks
                            131 ; ---------------------------------
   2028                     132 _draw_blocks::
   2028 DD E5         [15]  133 	push	ix
   202A DD 21 00 00   [14]  134 	ld	ix,#0
   202E DD 39         [15]  135 	add	ix,sp
   2030 3B            [ 6]  136 	dec	sp
                            137 ;src/main.c:79: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2031 21 C9 36      [10]  138 	ld	hl, #_block01 + 1
   2034 4E            [ 7]  139 	ld	c,(hl)
   2035 21 C8 36      [10]  140 	ld	hl, #_block01 + 0
   2038 66            [ 7]  141 	ld	h,(hl)
   2039 DD 5E 04      [19]  142 	ld	e,4 (ix)
   203C DD 56 05      [19]  143 	ld	d,5 (ix)
   203F 79            [ 4]  144 	ld	a,c
   2040 F5            [11]  145 	push	af
   2041 33            [ 6]  146 	inc	sp
   2042 E5            [11]  147 	push	hl
   2043 33            [ 6]  148 	inc	sp
   2044 D5            [11]  149 	push	de
   2045 CD 63 35      [17]  150 	call	_cpct_getScreenPtr
   2048 F1            [10]  151 	pop	af
   2049 F1            [10]  152 	pop	af
   204A 5D            [ 4]  153 	ld	e, l
   204B 54            [ 4]  154 	ld	d, h
                            155 ;src/main.c:80: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   204C 21 CD 36      [10]  156 	ld	hl, #_block01 + 5
   204F 4E            [ 7]  157 	ld	c,(hl)
   2050 21 CC 36      [10]  158 	ld	hl, #_block01 + 4
   2053 46            [ 7]  159 	ld	b,(hl)
   2054 C5            [11]  160 	push	bc
   2055 D5            [11]  161 	push	de
   2056 21 04 04      [10]  162 	ld	hl,#0x0404
   2059 E5            [11]  163 	push	hl
   205A CD 43 34      [17]  164 	call	_cpct_px2byteM0
   205D F1            [10]  165 	pop	af
   205E DD 75 FF      [19]  166 	ld	-1 (ix),l
   2061 D1            [10]  167 	pop	de
   2062 C1            [10]  168 	pop	bc
   2063 79            [ 4]  169 	ld	a,c
   2064 F5            [11]  170 	push	af
   2065 33            [ 6]  171 	inc	sp
   2066 C5            [11]  172 	push	bc
   2067 33            [ 6]  173 	inc	sp
   2068 DD 7E FF      [19]  174 	ld	a,-1 (ix)
   206B F5            [11]  175 	push	af
   206C 33            [ 6]  176 	inc	sp
   206D D5            [11]  177 	push	de
   206E CD 91 34      [17]  178 	call	_cpct_drawSolidBox
   2071 F1            [10]  179 	pop	af
   2072 F1            [10]  180 	pop	af
   2073 33            [ 6]  181 	inc	sp
   2074 33            [ 6]  182 	inc	sp
   2075 DD E1         [14]  183 	pop	ix
   2077 C9            [10]  184 	ret
                            185 ;src/main.c:87: void clear_screen(u8* screen){
                            186 ;	---------------------------------
                            187 ; Function clear_screen
                            188 ; ---------------------------------
   2078                     189 _clear_screen::
                            190 ;src/main.c:88: cpct_memset(screen, 0x00, 0x4000);   
   2078 C1            [10]  191 	pop	bc
   2079 D1            [10]  192 	pop	de
   207A D5            [11]  193 	push	de
   207B C5            [11]  194 	push	bc
   207C 21 00 40      [10]  195 	ld	hl,#0x4000
   207F E5            [11]  196 	push	hl
   2080 AF            [ 4]  197 	xor	a, a
   2081 F5            [11]  198 	push	af
   2082 33            [ 6]  199 	inc	sp
   2083 D5            [11]  200 	push	de
   2084 CD 62 34      [17]  201 	call	_cpct_memset
   2087 F1            [10]  202 	pop	af
   2088 F1            [10]  203 	pop	af
   2089 33            [ 6]  204 	inc	sp
   208A C9            [10]  205 	ret
                            206 ;src/main.c:95: void update_blocks(){
                            207 ;	---------------------------------
                            208 ; Function update_blocks
                            209 ; ---------------------------------
   208B                     210 _update_blocks::
   208B DD E5         [15]  211 	push	ix
   208D DD 21 00 00   [14]  212 	ld	ix,#0
   2091 DD 39         [15]  213 	add	ix,sp
   2093 F5            [11]  214 	push	af
   2094 3B            [ 6]  215 	dec	sp
                            216 ;src/main.c:96: if (block01.vx<128){
   2095 01 C8 36      [10]  217 	ld	bc,#_block01+0
   2098 21 CA 36      [10]  218 	ld	hl, #(_block01 + 0x0002) + 0
   209B 7E            [ 7]  219 	ld	a,(hl)
   209C DD 77 FF      [19]  220 	ld	-1 (ix),a
                            221 ;src/main.c:97: if ((block01.x+block01.vx)<(80-block01.w)){
   209F 0A            [ 7]  222 	ld	a,(bc)
                            223 ;src/main.c:98: block01.x = block01.x + block01.vx;
   20A0 57            [ 4]  224 	ld	d,a
   20A1 DD 86 FF      [19]  225 	add	a, -1 (ix)
   20A4 5F            [ 4]  226 	ld	e,a
                            227 ;src/main.c:96: if (block01.vx<128){
   20A5 DD 7E FF      [19]  228 	ld	a,-1 (ix)
   20A8 D6 80         [ 7]  229 	sub	a, #0x80
   20AA 30 4E         [12]  230 	jr	NC,00108$
                            231 ;src/main.c:97: if ((block01.x+block01.vx)<(80-block01.w)){
   20AC DD 72 FD      [19]  232 	ld	-3 (ix),d
   20AF DD 36 FE 00   [19]  233 	ld	-2 (ix),#0x00
   20B3 DD 66 FF      [19]  234 	ld	h,-1 (ix)
   20B6 2E 00         [ 7]  235 	ld	l,#0x00
   20B8 DD 7E FD      [19]  236 	ld	a,-3 (ix)
   20BB 84            [ 4]  237 	add	a, h
   20BC DD 77 FD      [19]  238 	ld	-3 (ix),a
   20BF DD 7E FE      [19]  239 	ld	a,-2 (ix)
   20C2 8D            [ 4]  240 	adc	a, l
   20C3 DD 77 FE      [19]  241 	ld	-2 (ix),a
   20C6 21 CC 36      [10]  242 	ld	hl, #_block01 + 4
   20C9 66            [ 7]  243 	ld	h,(hl)
   20CA 6C            [ 4]  244 	ld	l,h
   20CB 16 00         [ 7]  245 	ld	d,#0x00
   20CD 3E 50         [ 7]  246 	ld	a,#0x50
   20CF 95            [ 4]  247 	sub	a, l
   20D0 6F            [ 4]  248 	ld	l,a
   20D1 3E 00         [ 7]  249 	ld	a,#0x00
   20D3 9A            [ 4]  250 	sbc	a, d
   20D4 57            [ 4]  251 	ld	d,a
   20D5 DD 7E FD      [19]  252 	ld	a,-3 (ix)
   20D8 95            [ 4]  253 	sub	a, l
   20D9 DD 7E FE      [19]  254 	ld	a,-2 (ix)
   20DC 9A            [ 4]  255 	sbc	a, d
   20DD E2 E2 20      [10]  256 	jp	PO, 00124$
   20E0 EE 80         [ 7]  257 	xor	a, #0x80
   20E2                     258 00124$:
   20E2 F2 E9 20      [10]  259 	jp	P,00102$
                            260 ;src/main.c:98: block01.x = block01.x + block01.vx;
   20E5 7B            [ 4]  261 	ld	a,e
   20E6 02            [ 7]  262 	ld	(bc),a
   20E7 18 2D         [12]  263 	jr	00110$
   20E9                     264 00102$:
                            265 ;src/main.c:101: block01.x = 79-block01.w;
   20E9 3E 4F         [ 7]  266 	ld	a,#0x4F
   20EB 94            [ 4]  267 	sub	a, h
   20EC 02            [ 7]  268 	ld	(bc),a
                            269 ;src/main.c:102: block01.vx = - block01.vx;
   20ED 21 CA 36      [10]  270 	ld	hl, #(_block01 + 0x0002) + 0
   20F0 66            [ 7]  271 	ld	h,(hl)
   20F1 AF            [ 4]  272 	xor	a, a
   20F2 94            [ 4]  273 	sub	a, h
   20F3 57            [ 4]  274 	ld	d,a
   20F4 21 CA 36      [10]  275 	ld	hl,#(_block01 + 0x0002)
   20F7 72            [ 7]  276 	ld	(hl),d
   20F8 18 1C         [12]  277 	jr	00110$
   20FA                     278 00108$:
                            279 ;src/main.c:105: if (( (i8) (block01.x+block01.vx))>0){
   20FA 6B            [ 4]  280 	ld	l,e
   20FB AF            [ 4]  281 	xor	a, a
   20FC 95            [ 4]  282 	sub	a, l
   20FD E2 02 21      [10]  283 	jp	PO, 00125$
   2100 EE 80         [ 7]  284 	xor	a, #0x80
   2102                     285 00125$:
   2102 F2 09 21      [10]  286 	jp	P,00105$
                            287 ;src/main.c:106: block01.x = block01.x + block01.vx;
   2105 7B            [ 4]  288 	ld	a,e
   2106 02            [ 7]  289 	ld	(bc),a
   2107 18 0D         [12]  290 	jr	00110$
   2109                     291 00105$:
                            292 ;src/main.c:109: block01.x = 0;
   2109 AF            [ 4]  293 	xor	a, a
   210A 02            [ 7]  294 	ld	(bc),a
                            295 ;src/main.c:110: block01.vx = - block01.vx;
   210B 21 CA 36      [10]  296 	ld	hl, #(_block01 + 0x0002) + 0
   210E 66            [ 7]  297 	ld	h,(hl)
   210F AF            [ 4]  298 	xor	a, a
   2110 94            [ 4]  299 	sub	a, h
   2111 57            [ 4]  300 	ld	d,a
   2112 21 CA 36      [10]  301 	ld	hl,#(_block01 + 0x0002)
   2115 72            [ 7]  302 	ld	(hl),d
   2116                     303 00110$:
   2116 DD F9         [10]  304 	ld	sp, ix
   2118 DD E1         [14]  305 	pop	ix
   211A C9            [10]  306 	ret
                            307 ;src/main.c:118: void letras_azules(){
                            308 ;	---------------------------------
                            309 ; Function letras_azules
                            310 ; ---------------------------------
   211B                     311 _letras_azules::
                            312 ;src/main.c:120: cpc_SetInkGphStr(0,0);
   211B 21 00 00      [10]  313 	ld	hl,#0x0000
   211E E5            [11]  314 	push	hl
   211F CD FA 2E      [17]  315 	call	_cpc_SetInkGphStr
                            316 ;src/main.c:121: cpc_SetInkGphStr(1,42);
   2122 21 01 2A      [10]  317 	ld	hl, #0x2A01
   2125 E3            [19]  318 	ex	(sp),hl
   2126 CD FA 2E      [17]  319 	call	_cpc_SetInkGphStr
                            320 ;src/main.c:122: cpc_SetInkGphStr(2,34);
   2129 21 02 22      [10]  321 	ld	hl, #0x2202
   212C E3            [19]  322 	ex	(sp),hl
   212D CD FA 2E      [17]  323 	call	_cpc_SetInkGphStr
                            324 ;src/main.c:123: cpc_SetInkGphStr(3,42);
   2130 21 03 2A      [10]  325 	ld	hl, #0x2A03
   2133 E3            [19]  326 	ex	(sp),hl
   2134 CD FA 2E      [17]  327 	call	_cpc_SetInkGphStr
   2137 F1            [10]  328 	pop	af
   2138 C9            [10]  329 	ret
                            330 ;src/main.c:129: void letras_rojas(){
                            331 ;	---------------------------------
                            332 ; Function letras_rojas
                            333 ; ---------------------------------
   2139                     334 _letras_rojas::
                            335 ;src/main.c:131: cpc_SetInkGphStr(0,0);
   2139 21 00 00      [10]  336 	ld	hl,#0x0000
   213C E5            [11]  337 	push	hl
   213D CD FA 2E      [17]  338 	call	_cpc_SetInkGphStr
                            339 ;src/main.c:132: cpc_SetInkGphStr(1,40);
   2140 21 01 28      [10]  340 	ld	hl, #0x2801
   2143 E3            [19]  341 	ex	(sp),hl
   2144 CD FA 2E      [17]  342 	call	_cpc_SetInkGphStr
                            343 ;src/main.c:133: cpc_SetInkGphStr(2,10);
   2147 21 02 0A      [10]  344 	ld	hl, #0x0A02
   214A E3            [19]  345 	ex	(sp),hl
   214B CD FA 2E      [17]  346 	call	_cpc_SetInkGphStr
                            347 ;src/main.c:134: cpc_SetInkGphStr(3,40);
   214E 21 03 28      [10]  348 	ld	hl, #0x2803
   2151 E3            [19]  349 	ex	(sp),hl
   2152 CD FA 2E      [17]  350 	call	_cpc_SetInkGphStr
   2155 F1            [10]  351 	pop	af
   2156 C9            [10]  352 	ret
                            353 ;src/main.c:141: void set_color (unsigned char fondo,unsigned char t){
                            354 ;	---------------------------------
                            355 ; Function set_color
                            356 ; ---------------------------------
   2157                     357 _set_color::
                            358 ;src/main.c:142: cpc_SetInkGphStr(0,fondo);
   2157 21 02 00      [10]  359 	ld	hl, #2+0
   215A 39            [11]  360 	add	hl, sp
   215B 7E            [ 7]  361 	ld	a, (hl)
   215C F5            [11]  362 	push	af
   215D 33            [ 6]  363 	inc	sp
   215E AF            [ 4]  364 	xor	a, a
   215F F5            [11]  365 	push	af
   2160 33            [ 6]  366 	inc	sp
   2161 CD FA 2E      [17]  367 	call	_cpc_SetInkGphStr
   2164 F1            [10]  368 	pop	af
                            369 ;src/main.c:143: cpc_SetInkGphStr(1,t);
   2165 21 03 00      [10]  370 	ld	hl, #3+0
   2168 39            [11]  371 	add	hl, sp
   2169 56            [ 7]  372 	ld	d, (hl)
   216A 1E 01         [ 7]  373 	ld	e,#0x01
   216C D5            [11]  374 	push	de
   216D CD FA 2E      [17]  375 	call	_cpc_SetInkGphStr
   2170 F1            [10]  376 	pop	af
                            377 ;src/main.c:144: cpc_SetInkGphStr(2,t);
   2171 21 03 00      [10]  378 	ld	hl, #3+0
   2174 39            [11]  379 	add	hl, sp
   2175 56            [ 7]  380 	ld	d, (hl)
   2176 1E 02         [ 7]  381 	ld	e,#0x02
   2178 D5            [11]  382 	push	de
   2179 CD FA 2E      [17]  383 	call	_cpc_SetInkGphStr
   217C F1            [10]  384 	pop	af
                            385 ;src/main.c:145: cpc_SetInkGphStr(3,t);
   217D 21 03 00      [10]  386 	ld	hl, #3+0
   2180 39            [11]  387 	add	hl, sp
   2181 56            [ 7]  388 	ld	d, (hl)
   2182 1E 03         [ 7]  389 	ld	e,#0x03
   2184 D5            [11]  390 	push	de
   2185 CD FA 2E      [17]  391 	call	_cpc_SetInkGphStr
   2188 F1            [10]  392 	pop	af
   2189 C9            [10]  393 	ret
                            394 ;src/main.c:152: void draw_scoreboard(u8* screen){
                            395 ;	---------------------------------
                            396 ; Function draw_scoreboard
                            397 ; ---------------------------------
   218A                     398 _draw_scoreboard::
   218A DD E5         [15]  399 	push	ix
   218C DD 21 00 00   [14]  400 	ld	ix,#0
   2190 DD 39         [15]  401 	add	ix,sp
                            402 ;src/main.c:154: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 4, 8));
   2192 DD 5E 04      [19]  403 	ld	e,4 (ix)
   2195 DD 56 05      [19]  404 	ld	d,5 (ix)
   2198 D5            [11]  405 	push	de
   2199 21 04 08      [10]  406 	ld	hl,#0x0804
   219C E5            [11]  407 	push	hl
   219D D5            [11]  408 	push	de
   219E CD 63 35      [17]  409 	call	_cpct_getScreenPtr
   21A1 F1            [10]  410 	pop	af
   21A2 F1            [10]  411 	pop	af
   21A3 D1            [10]  412 	pop	de
   21A4 4D            [ 4]  413 	ld	c, l
   21A5 44            [ 4]  414 	ld	b, h
   21A6 21 C9 21      [10]  415 	ld	hl,#___str_0
   21A9 D5            [11]  416 	push	de
   21AA C5            [11]  417 	push	bc
   21AB E5            [11]  418 	push	hl
   21AC CD A8 2D      [17]  419 	call	_cpc_PrintGphStr
   21AF F1            [10]  420 	pop	af
   21B0 F1            [10]  421 	pop	af
   21B1 D1            [10]  422 	pop	de
                            423 ;src/main.c:155: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   21B2 21 3C 08      [10]  424 	ld	hl,#0x083C
   21B5 E5            [11]  425 	push	hl
   21B6 D5            [11]  426 	push	de
   21B7 CD 63 35      [17]  427 	call	_cpct_getScreenPtr
   21BA F1            [10]  428 	pop	af
   21BB F1            [10]  429 	pop	af
   21BC 11 C9 21      [10]  430 	ld	de,#___str_0
   21BF E5            [11]  431 	push	hl
   21C0 D5            [11]  432 	push	de
   21C1 CD A8 2D      [17]  433 	call	_cpc_PrintGphStr
   21C4 F1            [10]  434 	pop	af
   21C5 F1            [10]  435 	pop	af
   21C6 DD E1         [14]  436 	pop	ix
   21C8 C9            [10]  437 	ret
   21C9                     438 ___str_0:
   21C9 30 30 30 30 30 30   439 	.ascii "00000000"
        30 30
   21D1 00                  440 	.db 0x00
                            441 ;src/main.c:164: void initialization(){
                            442 ;	---------------------------------
                            443 ; Function initialization
                            444 ; ---------------------------------
   21D2                     445 _initialization::
                            446 ;src/main.c:166: pvmem = SCR_BUFF;
   21D2 21 00 80      [10]  447 	ld	hl,#0x8000
   21D5 22 D6 36      [16]  448 	ld	(_pvmem),hl
                            449 ;src/main.c:169: init_stars();
   21D8 CD 39 2B      [17]  450 	call	_init_stars
                            451 ;src/main.c:171: init_user();
   21DB CD BA 25      [17]  452 	call	_init_user
                            453 ;src/main.c:172: init_shoots();
   21DE CD C1 22      [17]  454 	call	_init_shoots
                            455 ;src/main.c:174: block01.x = 50;
   21E1 21 C8 36      [10]  456 	ld	hl,#_block01+0
   21E4 36 32         [10]  457 	ld	(hl),#0x32
                            458 ;src/main.c:175: block01.y = 10;
   21E6 21 C9 36      [10]  459 	ld	hl,#_block01 + 1
   21E9 36 0A         [10]  460 	ld	(hl),#0x0A
                            461 ;src/main.c:176: block01.vx = 2;
   21EB 21 CA 36      [10]  462 	ld	hl,#_block01 + 2
   21EE 36 02         [10]  463 	ld	(hl),#0x02
                            464 ;src/main.c:177: block01.vy = 0;
   21F0 21 CB 36      [10]  465 	ld	hl,#_block01 + 3
   21F3 36 00         [10]  466 	ld	(hl),#0x00
                            467 ;src/main.c:178: block01.w = 20;
   21F5 21 CC 36      [10]  468 	ld	hl,#_block01 + 4
   21F8 36 14         [10]  469 	ld	(hl),#0x14
                            470 ;src/main.c:179: block01.h = 40;
   21FA 21 CD 36      [10]  471 	ld	hl,#_block01 + 5
   21FD 36 28         [10]  472 	ld	(hl),#0x28
                            473 ;src/main.c:181: block02.x = 15;
   21FF 21 CF 36      [10]  474 	ld	hl,#_block02+0
   2202 36 0F         [10]  475 	ld	(hl),#0x0F
                            476 ;src/main.c:182: block02.y = 15;
   2204 21 D0 36      [10]  477 	ld	hl,#_block02 + 1
   2207 36 0F         [10]  478 	ld	(hl),#0x0F
                            479 ;src/main.c:183: block02.vx = 4;
   2209 21 D1 36      [10]  480 	ld	hl,#_block02 + 2
   220C 36 04         [10]  481 	ld	(hl),#0x04
                            482 ;src/main.c:184: block02.vy = 0;
   220E 21 D2 36      [10]  483 	ld	hl,#_block02 + 3
   2211 36 00         [10]  484 	ld	(hl),#0x00
                            485 ;src/main.c:185: block02.w = 25;
   2213 21 D3 36      [10]  486 	ld	hl,#_block02 + 4
   2216 36 19         [10]  487 	ld	(hl),#0x19
                            488 ;src/main.c:186: block02.h = 20;
   2218 21 D4 36      [10]  489 	ld	hl,#_block02 + 5
   221B 36 14         [10]  490 	ld	(hl),#0x14
                            491 ;src/main.c:188: letras_azules();
   221D C3 1B 21      [10]  492 	jp	_letras_azules
                            493 ;src/main.c:196: void main(void) {
                            494 ;	---------------------------------
                            495 ; Function main
                            496 ; ---------------------------------
   2220                     497 _main::
                            498 ;src/main.c:199: set_stack(0x1000);
   2220 21 00 10      [10]  499 	ld	hl,#0x1000
   2223 E5            [11]  500 	push	hl
   2224 CD 08 32      [17]  501 	call	_set_stack
   2227 F1            [10]  502 	pop	af
                            503 ;src/main.c:201: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   2228 CD 79 34      [17]  504 	call	_cpct_disableFirmware
                            505 ;src/main.c:202: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   222B 11 E6 28      [10]  506 	ld	de,#_palette
   222E 3E 10         [ 7]  507 	ld	a,#0x10
   2230 F5            [11]  508 	push	af
   2231 33            [ 6]  509 	inc	sp
   2232 D5            [11]  510 	push	de
   2233 CD DC 33      [17]  511 	call	_cpct_fw2hw
   2236 F1            [10]  512 	pop	af
   2237 33            [ 6]  513 	inc	sp
                            514 ;src/main.c:203: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   2238 11 E6 28      [10]  515 	ld	de,#_palette
   223B 3E 10         [ 7]  516 	ld	a,#0x10
   223D F5            [11]  517 	push	af
   223E 33            [ 6]  518 	inc	sp
   223F D5            [11]  519 	push	de
   2240 CD 89 32      [17]  520 	call	_cpct_setPalette
   2243 F1            [10]  521 	pop	af
   2244 33            [ 6]  522 	inc	sp
                            523 ;src/main.c:204: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   2245 3A E6 28      [13]  524 	ld	a, (#_palette + 0)
   2248 57            [ 4]  525 	ld	d,a
   2249 1E 10         [ 7]  526 	ld	e,#0x10
   224B D5            [11]  527 	push	de
   224C CD 24 33      [17]  528 	call	_cpct_setPALColour
   224F F1            [10]  529 	pop	af
                            530 ;src/main.c:205: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2250 AF            [ 4]  531 	xor	a, a
   2251 F5            [11]  532 	push	af
   2252 33            [ 6]  533 	inc	sp
   2253 CD 31 34      [17]  534 	call	_cpct_setVideoMode
   2256 33            [ 6]  535 	inc	sp
                            536 ;src/main.c:208: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   2257 21 00 40      [10]  537 	ld	hl,#0x4000
   225A E5            [11]  538 	push	hl
   225B AF            [ 4]  539 	xor	a, a
   225C F5            [11]  540 	push	af
   225D 33            [ 6]  541 	inc	sp
   225E 26 C0         [ 7]  542 	ld	h, #0xC0
   2260 E5            [11]  543 	push	hl
   2261 CD 62 34      [17]  544 	call	_cpct_memset
   2264 F1            [10]  545 	pop	af
   2265 F1            [10]  546 	pop	af
   2266 33            [ 6]  547 	inc	sp
                            548 ;src/main.c:209: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   2267 21 00 40      [10]  549 	ld	hl,#0x4000
   226A E5            [11]  550 	push	hl
   226B AF            [ 4]  551 	xor	a, a
   226C F5            [11]  552 	push	af
   226D 33            [ 6]  553 	inc	sp
   226E 26 80         [ 7]  554 	ld	h, #0x80
   2270 E5            [11]  555 	push	hl
   2271 CD 62 34      [17]  556 	call	_cpct_memset
   2274 F1            [10]  557 	pop	af
   2275 F1            [10]  558 	pop	af
   2276 33            [ 6]  559 	inc	sp
                            560 ;src/main.c:211: initialization(); 
   2277 CD D2 21      [17]  561 	call	_initialization
                            562 ;src/main.c:214: while (1){
   227A                     563 00106$:
                            564 ;src/main.c:216: clear_screen(pvmem);
   227A 2A D6 36      [16]  565 	ld	hl,(_pvmem)
   227D E5            [11]  566 	push	hl
   227E CD 78 20      [17]  567 	call	_clear_screen
   2281 F1            [10]  568 	pop	af
                            569 ;src/main.c:218: update_user();
   2282 CD F9 25      [17]  570 	call	_update_user
                            571 ;src/main.c:219: update_shoots();
   2285 CD 56 24      [17]  572 	call	_update_shoots
                            573 ;src/main.c:220: update_blocks();
   2288 CD 8B 20      [17]  574 	call	_update_blocks
                            575 ;src/main.c:223: update_stars();
   228B CD 33 2C      [17]  576 	call	_update_stars
                            577 ;src/main.c:226: cpct_waitVSYNC();   
   228E CD 29 34      [17]  578 	call	_cpct_waitVSYNC
                            579 ;src/main.c:229: draw_stars(pvmem);
   2291 2A D6 36      [16]  580 	ld	hl,(_pvmem)
   2294 E5            [11]  581 	push	hl
   2295 CD B8 2B      [17]  582 	call	_draw_stars
   2298 F1            [10]  583 	pop	af
                            584 ;src/main.c:231: draw_blocks(pvmem);
   2299 2A D6 36      [16]  585 	ld	hl,(_pvmem)
   229C E5            [11]  586 	push	hl
   229D CD 28 20      [17]  587 	call	_draw_blocks
   22A0 F1            [10]  588 	pop	af
                            589 ;src/main.c:232: draw_user(pvmem);
   22A1 2A D6 36      [16]  590 	ld	hl,(_pvmem)
   22A4 E5            [11]  591 	push	hl
   22A5 CD 57 27      [17]  592 	call	_draw_user
   22A8 F1            [10]  593 	pop	af
                            594 ;src/main.c:233: draw_shoots(pvmem); 
   22A9 2A D6 36      [16]  595 	ld	hl,(_pvmem)
   22AC E5            [11]  596 	push	hl
   22AD CD EC 24      [17]  597 	call	_draw_shoots
   22B0 F1            [10]  598 	pop	af
                            599 ;src/main.c:235: draw_scoreboard(pvmem);
   22B1 2A D6 36      [16]  600 	ld	hl,(_pvmem)
   22B4 E5            [11]  601 	push	hl
   22B5 CD 8A 21      [17]  602 	call	_draw_scoreboard
   22B8 F1            [10]  603 	pop	af
                            604 ;src/main.c:237: pvmem = changeVideoMemoryPage();
   22B9 CD 00 20      [17]  605 	call	_changeVideoMemoryPage
   22BC 22 D6 36      [16]  606 	ld	(_pvmem),hl
   22BF 18 B9         [12]  607 	jr	00106$
                            608 	.area _CODE
                            609 	.area _INITIALIZER
                            610 	.area _CABS (ABS)
