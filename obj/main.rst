                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jul  5 16:22:13 2015
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
                             31 	.globl _draw_enemies
                             32 	.globl _update_enemies
                             33 	.globl _init_enemies
                             34 	.globl _draw_shoots
                             35 	.globl _update_shoots
                             36 	.globl _init_shoots
                             37 	.globl _cpct_getScreenPtr
                             38 	.globl _cpct_setVideoMemoryPage
                             39 	.globl _cpct_setPALColour
                             40 	.globl _cpct_setPalette
                             41 	.globl _cpct_fw2hw
                             42 	.globl _cpct_waitVSYNC
                             43 	.globl _cpct_setVideoMode
                             44 	.globl _cpct_drawSolidBox
                             45 	.globl _cpct_px2byteM0
                             46 	.globl _cpct_memset
                             47 	.globl _cpct_disableFirmware
                             48 	.globl _aux_txt
                             49 	.globl _pvmem
                             50 	.globl _block02
                             51 	.globl _block01
                             52 ;--------------------------------------------------------
                             53 ; special function registers
                             54 ;--------------------------------------------------------
                             55 ;--------------------------------------------------------
                             56 ; ram data
                             57 ;--------------------------------------------------------
                             58 	.area _DATA
   4251                      59 _block01::
   4251                      60 	.ds 7
   4258                      61 _block02::
   4258                      62 	.ds 7
   425F                      63 _pvmem::
   425F                      64 	.ds 2
   4261                      65 _aux_txt::
   4261                      66 	.ds 40
   4289                      67 _changeVideoMemoryPage_page_1_78:
   4289                      68 	.ds 1
                             69 ;--------------------------------------------------------
                             70 ; ram data
                             71 ;--------------------------------------------------------
                             72 	.area _INITIALIZED
                             73 ;--------------------------------------------------------
                             74 ; absolute external ram data
                             75 ;--------------------------------------------------------
                             76 	.area _DABS (ABS)
                             77 ;--------------------------------------------------------
                             78 ; global & static initialisations
                             79 ;--------------------------------------------------------
                             80 	.area _HOME
                             81 	.area _GSINIT
                             82 	.area _GSFINAL
                             83 	.area _GSINIT
                             84 ;src/main.c:54: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   46D7 FD 21 89 42   [14]   85 	ld	iy,#_changeVideoMemoryPage_page_1_78
   46DB FD 36 00 00   [19]   86 	ld	0 (iy),#0x00
                             87 ;--------------------------------------------------------
                             88 ; Home
                             89 ;--------------------------------------------------------
                             90 	.area _HOME
                             91 	.area _HOME
                             92 ;--------------------------------------------------------
                             93 ; code
                             94 ;--------------------------------------------------------
                             95 	.area _CODE
                             96 ;src/main.c:53: u8* changeVideoMemoryPage() {
                             97 ;	---------------------------------
                             98 ; Function changeVideoMemoryPage
                             99 ; ---------------------------------
   2000                     100 _changeVideoMemoryPage::
                            101 ;src/main.c:59: if (page) {
   2000 3A 89 42      [13]  102 	ld	a,(#_changeVideoMemoryPage_page_1_78 + 0)
   2003 B7            [ 4]  103 	or	a, a
   2004 28 11         [12]  104 	jr	Z,00102$
                            105 ;src/main.c:60: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  106 	ld	a,#0x30
   2008 F5            [11]  107 	push	af
   2009 33            [ 6]  108 	inc	sp
   200A CD 89 3F      [17]  109 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  110 	inc	sp
                            111 ;src/main.c:61: page = 0;  
   200E 21 89 42      [10]  112 	ld	hl,#_changeVideoMemoryPage_page_1_78 + 0
   2011 36 00         [10]  113 	ld	(hl), #0x00
                            114 ;src/main.c:62: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  115 	ld	hl,#0x8000
   2016 C9            [10]  116 	ret
   2017                     117 00102$:
                            118 ;src/main.c:64: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  119 	ld	a,#0x20
   2019 F5            [11]  120 	push	af
   201A 33            [ 6]  121 	inc	sp
   201B CD 89 3F      [17]  122 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  123 	inc	sp
                            124 ;src/main.c:65: page = 1;                              // Next page = 1
   201F 21 89 42      [10]  125 	ld	hl,#_changeVideoMemoryPage_page_1_78 + 0
   2022 36 01         [10]  126 	ld	(hl), #0x01
                            127 ;src/main.c:66: screen = SCR_VMEM;
   2024 21 00 C0      [10]  128 	ld	hl,#0xC000
                            129 ;src/main.c:68: return screen;
   2027 C9            [10]  130 	ret
                            131 ;src/main.c:76: void draw_blocks(u8* screen){
                            132 ;	---------------------------------
                            133 ; Function draw_blocks
                            134 ; ---------------------------------
   2028                     135 _draw_blocks::
   2028 DD E5         [15]  136 	push	ix
   202A DD 21 00 00   [14]  137 	ld	ix,#0
   202E DD 39         [15]  138 	add	ix,sp
   2030 3B            [ 6]  139 	dec	sp
                            140 ;src/main.c:79: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2031 21 52 42      [10]  141 	ld	hl, #_block01 + 1
   2034 4E            [ 7]  142 	ld	c,(hl)
   2035 21 51 42      [10]  143 	ld	hl, #_block01 + 0
   2038 66            [ 7]  144 	ld	h,(hl)
   2039 DD 5E 04      [19]  145 	ld	e,4 (ix)
   203C DD 56 05      [19]  146 	ld	d,5 (ix)
   203F 79            [ 4]  147 	ld	a,c
   2040 F5            [11]  148 	push	af
   2041 33            [ 6]  149 	inc	sp
   2042 E5            [11]  150 	push	hl
   2043 33            [ 6]  151 	inc	sp
   2044 D5            [11]  152 	push	de
   2045 CD EC 40      [17]  153 	call	_cpct_getScreenPtr
   2048 F1            [10]  154 	pop	af
   2049 F1            [10]  155 	pop	af
   204A 5D            [ 4]  156 	ld	e, l
   204B 54            [ 4]  157 	ld	d, h
                            158 ;src/main.c:80: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   204C 21 56 42      [10]  159 	ld	hl, #_block01 + 5
   204F 4E            [ 7]  160 	ld	c,(hl)
   2050 21 55 42      [10]  161 	ld	hl, #_block01 + 4
   2053 46            [ 7]  162 	ld	b,(hl)
   2054 C5            [11]  163 	push	bc
   2055 D5            [11]  164 	push	de
   2056 21 04 04      [10]  165 	ld	hl,#0x0404
   2059 E5            [11]  166 	push	hl
   205A CD CC 3F      [17]  167 	call	_cpct_px2byteM0
   205D F1            [10]  168 	pop	af
   205E DD 75 FF      [19]  169 	ld	-1 (ix),l
   2061 D1            [10]  170 	pop	de
   2062 C1            [10]  171 	pop	bc
   2063 79            [ 4]  172 	ld	a,c
   2064 F5            [11]  173 	push	af
   2065 33            [ 6]  174 	inc	sp
   2066 C5            [11]  175 	push	bc
   2067 33            [ 6]  176 	inc	sp
   2068 DD 7E FF      [19]  177 	ld	a,-1 (ix)
   206B F5            [11]  178 	push	af
   206C 33            [ 6]  179 	inc	sp
   206D D5            [11]  180 	push	de
   206E CD 1A 40      [17]  181 	call	_cpct_drawSolidBox
   2071 F1            [10]  182 	pop	af
   2072 F1            [10]  183 	pop	af
   2073 33            [ 6]  184 	inc	sp
   2074 33            [ 6]  185 	inc	sp
   2075 DD E1         [14]  186 	pop	ix
   2077 C9            [10]  187 	ret
                            188 ;src/main.c:87: void clear_screen(u8* screen){
                            189 ;	---------------------------------
                            190 ; Function clear_screen
                            191 ; ---------------------------------
   2078                     192 _clear_screen::
                            193 ;src/main.c:88: cpct_memset(screen, 0x00, 0x4000);   
   2078 C1            [10]  194 	pop	bc
   2079 D1            [10]  195 	pop	de
   207A D5            [11]  196 	push	de
   207B C5            [11]  197 	push	bc
   207C 21 00 40      [10]  198 	ld	hl,#0x4000
   207F E5            [11]  199 	push	hl
   2080 AF            [ 4]  200 	xor	a, a
   2081 F5            [11]  201 	push	af
   2082 33            [ 6]  202 	inc	sp
   2083 D5            [11]  203 	push	de
   2084 CD EB 3F      [17]  204 	call	_cpct_memset
   2087 F1            [10]  205 	pop	af
   2088 F1            [10]  206 	pop	af
   2089 33            [ 6]  207 	inc	sp
   208A C9            [10]  208 	ret
                            209 ;src/main.c:95: void update_blocks(){
                            210 ;	---------------------------------
                            211 ; Function update_blocks
                            212 ; ---------------------------------
   208B                     213 _update_blocks::
   208B DD E5         [15]  214 	push	ix
   208D DD 21 00 00   [14]  215 	ld	ix,#0
   2091 DD 39         [15]  216 	add	ix,sp
   2093 F5            [11]  217 	push	af
   2094 3B            [ 6]  218 	dec	sp
                            219 ;src/main.c:96: if (block01.vx<128){
   2095 01 51 42      [10]  220 	ld	bc,#_block01+0
   2098 21 53 42      [10]  221 	ld	hl, #(_block01 + 0x0002) + 0
   209B 7E            [ 7]  222 	ld	a,(hl)
   209C DD 77 FF      [19]  223 	ld	-1 (ix),a
                            224 ;src/main.c:97: if ((block01.x+block01.vx)<(80-block01.w)){
   209F 0A            [ 7]  225 	ld	a,(bc)
                            226 ;src/main.c:98: block01.x = block01.x + block01.vx;
   20A0 57            [ 4]  227 	ld	d,a
   20A1 DD 86 FF      [19]  228 	add	a, -1 (ix)
   20A4 5F            [ 4]  229 	ld	e,a
                            230 ;src/main.c:96: if (block01.vx<128){
   20A5 DD 7E FF      [19]  231 	ld	a,-1 (ix)
   20A8 D6 80         [ 7]  232 	sub	a, #0x80
   20AA 30 4E         [12]  233 	jr	NC,00108$
                            234 ;src/main.c:97: if ((block01.x+block01.vx)<(80-block01.w)){
   20AC DD 72 FD      [19]  235 	ld	-3 (ix),d
   20AF DD 36 FE 00   [19]  236 	ld	-2 (ix),#0x00
   20B3 DD 66 FF      [19]  237 	ld	h,-1 (ix)
   20B6 2E 00         [ 7]  238 	ld	l,#0x00
   20B8 DD 7E FD      [19]  239 	ld	a,-3 (ix)
   20BB 84            [ 4]  240 	add	a, h
   20BC DD 77 FD      [19]  241 	ld	-3 (ix),a
   20BF DD 7E FE      [19]  242 	ld	a,-2 (ix)
   20C2 8D            [ 4]  243 	adc	a, l
   20C3 DD 77 FE      [19]  244 	ld	-2 (ix),a
   20C6 21 55 42      [10]  245 	ld	hl, #_block01 + 4
   20C9 66            [ 7]  246 	ld	h,(hl)
   20CA 6C            [ 4]  247 	ld	l,h
   20CB 16 00         [ 7]  248 	ld	d,#0x00
   20CD 3E 50         [ 7]  249 	ld	a,#0x50
   20CF 95            [ 4]  250 	sub	a, l
   20D0 6F            [ 4]  251 	ld	l,a
   20D1 3E 00         [ 7]  252 	ld	a,#0x00
   20D3 9A            [ 4]  253 	sbc	a, d
   20D4 57            [ 4]  254 	ld	d,a
   20D5 DD 7E FD      [19]  255 	ld	a,-3 (ix)
   20D8 95            [ 4]  256 	sub	a, l
   20D9 DD 7E FE      [19]  257 	ld	a,-2 (ix)
   20DC 9A            [ 4]  258 	sbc	a, d
   20DD E2 E2 20      [10]  259 	jp	PO, 00124$
   20E0 EE 80         [ 7]  260 	xor	a, #0x80
   20E2                     261 00124$:
   20E2 F2 E9 20      [10]  262 	jp	P,00102$
                            263 ;src/main.c:98: block01.x = block01.x + block01.vx;
   20E5 7B            [ 4]  264 	ld	a,e
   20E6 02            [ 7]  265 	ld	(bc),a
   20E7 18 2D         [12]  266 	jr	00110$
   20E9                     267 00102$:
                            268 ;src/main.c:101: block01.x = 79-block01.w;
   20E9 3E 4F         [ 7]  269 	ld	a,#0x4F
   20EB 94            [ 4]  270 	sub	a, h
   20EC 02            [ 7]  271 	ld	(bc),a
                            272 ;src/main.c:102: block01.vx = - block01.vx;
   20ED 21 53 42      [10]  273 	ld	hl, #(_block01 + 0x0002) + 0
   20F0 66            [ 7]  274 	ld	h,(hl)
   20F1 AF            [ 4]  275 	xor	a, a
   20F2 94            [ 4]  276 	sub	a, h
   20F3 57            [ 4]  277 	ld	d,a
   20F4 21 53 42      [10]  278 	ld	hl,#(_block01 + 0x0002)
   20F7 72            [ 7]  279 	ld	(hl),d
   20F8 18 1C         [12]  280 	jr	00110$
   20FA                     281 00108$:
                            282 ;src/main.c:105: if (( (i8) (block01.x+block01.vx))>0){
   20FA 6B            [ 4]  283 	ld	l,e
   20FB AF            [ 4]  284 	xor	a, a
   20FC 95            [ 4]  285 	sub	a, l
   20FD E2 02 21      [10]  286 	jp	PO, 00125$
   2100 EE 80         [ 7]  287 	xor	a, #0x80
   2102                     288 00125$:
   2102 F2 09 21      [10]  289 	jp	P,00105$
                            290 ;src/main.c:106: block01.x = block01.x + block01.vx;
   2105 7B            [ 4]  291 	ld	a,e
   2106 02            [ 7]  292 	ld	(bc),a
   2107 18 0D         [12]  293 	jr	00110$
   2109                     294 00105$:
                            295 ;src/main.c:109: block01.x = 0;
   2109 AF            [ 4]  296 	xor	a, a
   210A 02            [ 7]  297 	ld	(bc),a
                            298 ;src/main.c:110: block01.vx = - block01.vx;
   210B 21 53 42      [10]  299 	ld	hl, #(_block01 + 0x0002) + 0
   210E 66            [ 7]  300 	ld	h,(hl)
   210F AF            [ 4]  301 	xor	a, a
   2110 94            [ 4]  302 	sub	a, h
   2111 57            [ 4]  303 	ld	d,a
   2112 21 53 42      [10]  304 	ld	hl,#(_block01 + 0x0002)
   2115 72            [ 7]  305 	ld	(hl),d
   2116                     306 00110$:
   2116 DD F9         [10]  307 	ld	sp, ix
   2118 DD E1         [14]  308 	pop	ix
   211A C9            [10]  309 	ret
                            310 ;src/main.c:118: void letras_azules(){
                            311 ;	---------------------------------
                            312 ; Function letras_azules
                            313 ; ---------------------------------
   211B                     314 _letras_azules::
                            315 ;src/main.c:120: cpc_SetInkGphStr(0,0);
   211B 21 00 00      [10]  316 	ld	hl,#0x0000
   211E E5            [11]  317 	push	hl
   211F CD 83 3A      [17]  318 	call	_cpc_SetInkGphStr
                            319 ;src/main.c:121: cpc_SetInkGphStr(1,42);
   2122 21 01 2A      [10]  320 	ld	hl, #0x2A01
   2125 E3            [19]  321 	ex	(sp),hl
   2126 CD 83 3A      [17]  322 	call	_cpc_SetInkGphStr
                            323 ;src/main.c:122: cpc_SetInkGphStr(2,34);
   2129 21 02 22      [10]  324 	ld	hl, #0x2202
   212C E3            [19]  325 	ex	(sp),hl
   212D CD 83 3A      [17]  326 	call	_cpc_SetInkGphStr
                            327 ;src/main.c:123: cpc_SetInkGphStr(3,42);
   2130 21 03 2A      [10]  328 	ld	hl, #0x2A03
   2133 E3            [19]  329 	ex	(sp),hl
   2134 CD 83 3A      [17]  330 	call	_cpc_SetInkGphStr
   2137 F1            [10]  331 	pop	af
   2138 C9            [10]  332 	ret
                            333 ;src/main.c:129: void letras_rojas(){
                            334 ;	---------------------------------
                            335 ; Function letras_rojas
                            336 ; ---------------------------------
   2139                     337 _letras_rojas::
                            338 ;src/main.c:131: cpc_SetInkGphStr(0,0);
   2139 21 00 00      [10]  339 	ld	hl,#0x0000
   213C E5            [11]  340 	push	hl
   213D CD 83 3A      [17]  341 	call	_cpc_SetInkGphStr
                            342 ;src/main.c:132: cpc_SetInkGphStr(1,40);
   2140 21 01 28      [10]  343 	ld	hl, #0x2801
   2143 E3            [19]  344 	ex	(sp),hl
   2144 CD 83 3A      [17]  345 	call	_cpc_SetInkGphStr
                            346 ;src/main.c:133: cpc_SetInkGphStr(2,10);
   2147 21 02 0A      [10]  347 	ld	hl, #0x0A02
   214A E3            [19]  348 	ex	(sp),hl
   214B CD 83 3A      [17]  349 	call	_cpc_SetInkGphStr
                            350 ;src/main.c:134: cpc_SetInkGphStr(3,40);
   214E 21 03 28      [10]  351 	ld	hl, #0x2803
   2151 E3            [19]  352 	ex	(sp),hl
   2152 CD 83 3A      [17]  353 	call	_cpc_SetInkGphStr
   2155 F1            [10]  354 	pop	af
   2156 C9            [10]  355 	ret
                            356 ;src/main.c:141: void set_color (unsigned char fondo,unsigned char t){
                            357 ;	---------------------------------
                            358 ; Function set_color
                            359 ; ---------------------------------
   2157                     360 _set_color::
                            361 ;src/main.c:142: cpc_SetInkGphStr(0,fondo);
   2157 21 02 00      [10]  362 	ld	hl, #2+0
   215A 39            [11]  363 	add	hl, sp
   215B 7E            [ 7]  364 	ld	a, (hl)
   215C F5            [11]  365 	push	af
   215D 33            [ 6]  366 	inc	sp
   215E AF            [ 4]  367 	xor	a, a
   215F F5            [11]  368 	push	af
   2160 33            [ 6]  369 	inc	sp
   2161 CD 83 3A      [17]  370 	call	_cpc_SetInkGphStr
   2164 F1            [10]  371 	pop	af
                            372 ;src/main.c:143: cpc_SetInkGphStr(1,t);
   2165 21 03 00      [10]  373 	ld	hl, #3+0
   2168 39            [11]  374 	add	hl, sp
   2169 56            [ 7]  375 	ld	d, (hl)
   216A 1E 01         [ 7]  376 	ld	e,#0x01
   216C D5            [11]  377 	push	de
   216D CD 83 3A      [17]  378 	call	_cpc_SetInkGphStr
   2170 F1            [10]  379 	pop	af
                            380 ;src/main.c:144: cpc_SetInkGphStr(2,t);
   2171 21 03 00      [10]  381 	ld	hl, #3+0
   2174 39            [11]  382 	add	hl, sp
   2175 56            [ 7]  383 	ld	d, (hl)
   2176 1E 02         [ 7]  384 	ld	e,#0x02
   2178 D5            [11]  385 	push	de
   2179 CD 83 3A      [17]  386 	call	_cpc_SetInkGphStr
   217C F1            [10]  387 	pop	af
                            388 ;src/main.c:145: cpc_SetInkGphStr(3,t);
   217D 21 03 00      [10]  389 	ld	hl, #3+0
   2180 39            [11]  390 	add	hl, sp
   2181 56            [ 7]  391 	ld	d, (hl)
   2182 1E 03         [ 7]  392 	ld	e,#0x03
   2184 D5            [11]  393 	push	de
   2185 CD 83 3A      [17]  394 	call	_cpc_SetInkGphStr
   2188 F1            [10]  395 	pop	af
   2189 C9            [10]  396 	ret
                            397 ;src/main.c:152: void draw_scoreboard(u8* screen){
                            398 ;	---------------------------------
                            399 ; Function draw_scoreboard
                            400 ; ---------------------------------
   218A                     401 _draw_scoreboard::
   218A DD E5         [15]  402 	push	ix
   218C DD 21 00 00   [14]  403 	ld	ix,#0
   2190 DD 39         [15]  404 	add	ix,sp
                            405 ;src/main.c:154: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 4, 8));
   2192 DD 5E 04      [19]  406 	ld	e,4 (ix)
   2195 DD 56 05      [19]  407 	ld	d,5 (ix)
   2198 D5            [11]  408 	push	de
   2199 21 04 08      [10]  409 	ld	hl,#0x0804
   219C E5            [11]  410 	push	hl
   219D D5            [11]  411 	push	de
   219E CD EC 40      [17]  412 	call	_cpct_getScreenPtr
   21A1 F1            [10]  413 	pop	af
   21A2 F1            [10]  414 	pop	af
   21A3 D1            [10]  415 	pop	de
   21A4 4D            [ 4]  416 	ld	c, l
   21A5 44            [ 4]  417 	ld	b, h
   21A6 21 C9 21      [10]  418 	ld	hl,#___str_0
   21A9 D5            [11]  419 	push	de
   21AA C5            [11]  420 	push	bc
   21AB E5            [11]  421 	push	hl
   21AC CD 31 39      [17]  422 	call	_cpc_PrintGphStr
   21AF F1            [10]  423 	pop	af
   21B0 F1            [10]  424 	pop	af
   21B1 D1            [10]  425 	pop	de
                            426 ;src/main.c:155: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   21B2 21 3C 08      [10]  427 	ld	hl,#0x083C
   21B5 E5            [11]  428 	push	hl
   21B6 D5            [11]  429 	push	de
   21B7 CD EC 40      [17]  430 	call	_cpct_getScreenPtr
   21BA F1            [10]  431 	pop	af
   21BB F1            [10]  432 	pop	af
   21BC 11 C9 21      [10]  433 	ld	de,#___str_0
   21BF E5            [11]  434 	push	hl
   21C0 D5            [11]  435 	push	de
   21C1 CD 31 39      [17]  436 	call	_cpc_PrintGphStr
   21C4 F1            [10]  437 	pop	af
   21C5 F1            [10]  438 	pop	af
   21C6 DD E1         [14]  439 	pop	ix
   21C8 C9            [10]  440 	ret
   21C9                     441 ___str_0:
   21C9 30 30 30 30 30 30   442 	.ascii "00000000"
        30 30
   21D1 00                  443 	.db 0x00
                            444 ;src/main.c:164: void initialization(){
                            445 ;	---------------------------------
                            446 ; Function initialization
                            447 ; ---------------------------------
   21D2                     448 _initialization::
                            449 ;src/main.c:166: pvmem = SCR_BUFF;
   21D2 21 00 80      [10]  450 	ld	hl,#0x8000
   21D5 22 5F 42      [16]  451 	ld	(_pvmem),hl
                            452 ;src/main.c:169: init_stars();
   21D8 CD C2 36      [17]  453 	call	_init_stars
                            454 ;src/main.c:171: init_user();
   21DB CD F2 2B      [17]  455 	call	_init_user
                            456 ;src/main.c:172: init_shoots();
   21DE CD A8 28      [17]  457 	call	_init_shoots
                            458 ;src/main.c:173: init_enemies();
   21E1 CD CF 22      [17]  459 	call	_init_enemies
                            460 ;src/main.c:175: block01.x = 50;
   21E4 21 51 42      [10]  461 	ld	hl,#_block01+0
   21E7 36 32         [10]  462 	ld	(hl),#0x32
                            463 ;src/main.c:176: block01.y = 10;
   21E9 21 52 42      [10]  464 	ld	hl,#_block01 + 1
   21EC 36 0A         [10]  465 	ld	(hl),#0x0A
                            466 ;src/main.c:177: block01.vx = 2;
   21EE 21 53 42      [10]  467 	ld	hl,#_block01 + 2
   21F1 36 02         [10]  468 	ld	(hl),#0x02
                            469 ;src/main.c:178: block01.vy = 0;
   21F3 21 54 42      [10]  470 	ld	hl,#_block01 + 3
   21F6 36 00         [10]  471 	ld	(hl),#0x00
                            472 ;src/main.c:179: block01.w = 20;
   21F8 21 55 42      [10]  473 	ld	hl,#_block01 + 4
   21FB 36 14         [10]  474 	ld	(hl),#0x14
                            475 ;src/main.c:180: block01.h = 40;
   21FD 21 56 42      [10]  476 	ld	hl,#_block01 + 5
   2200 36 28         [10]  477 	ld	(hl),#0x28
                            478 ;src/main.c:182: block02.x = 15;
   2202 21 58 42      [10]  479 	ld	hl,#_block02+0
   2205 36 0F         [10]  480 	ld	(hl),#0x0F
                            481 ;src/main.c:183: block02.y = 15;
   2207 21 59 42      [10]  482 	ld	hl,#_block02 + 1
   220A 36 0F         [10]  483 	ld	(hl),#0x0F
                            484 ;src/main.c:184: block02.vx = 4;
   220C 21 5A 42      [10]  485 	ld	hl,#_block02 + 2
   220F 36 04         [10]  486 	ld	(hl),#0x04
                            487 ;src/main.c:185: block02.vy = 0;
   2211 21 5B 42      [10]  488 	ld	hl,#_block02 + 3
   2214 36 00         [10]  489 	ld	(hl),#0x00
                            490 ;src/main.c:186: block02.w = 25;
   2216 21 5C 42      [10]  491 	ld	hl,#_block02 + 4
   2219 36 19         [10]  492 	ld	(hl),#0x19
                            493 ;src/main.c:187: block02.h = 20;
   221B 21 5D 42      [10]  494 	ld	hl,#_block02 + 5
   221E 36 14         [10]  495 	ld	(hl),#0x14
                            496 ;src/main.c:189: letras_azules();
   2220 C3 1B 21      [10]  497 	jp	_letras_azules
                            498 ;src/main.c:197: void main(void) {
                            499 ;	---------------------------------
                            500 ; Function main
                            501 ; ---------------------------------
   2223                     502 _main::
                            503 ;src/main.c:200: set_stack(0x1000);
   2223 21 00 10      [10]  504 	ld	hl,#0x1000
   2226 E5            [11]  505 	push	hl
   2227 CD 91 3D      [17]  506 	call	_set_stack
   222A F1            [10]  507 	pop	af
                            508 ;src/main.c:202: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
   222B CD 02 40      [17]  509 	call	_cpct_disableFirmware
                            510 ;src/main.c:203: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   222E 11 6F 34      [10]  511 	ld	de,#_palette
   2231 3E 10         [ 7]  512 	ld	a,#0x10
   2233 F5            [11]  513 	push	af
   2234 33            [ 6]  514 	inc	sp
   2235 D5            [11]  515 	push	de
   2236 CD 65 3F      [17]  516 	call	_cpct_fw2hw
   2239 F1            [10]  517 	pop	af
   223A 33            [ 6]  518 	inc	sp
                            519 ;src/main.c:204: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   223B 11 6F 34      [10]  520 	ld	de,#_palette
   223E 3E 10         [ 7]  521 	ld	a,#0x10
   2240 F5            [11]  522 	push	af
   2241 33            [ 6]  523 	inc	sp
   2242 D5            [11]  524 	push	de
   2243 CD 12 3E      [17]  525 	call	_cpct_setPalette
   2246 F1            [10]  526 	pop	af
   2247 33            [ 6]  527 	inc	sp
                            528 ;src/main.c:205: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   2248 3A 6F 34      [13]  529 	ld	a, (#_palette + 0)
   224B 57            [ 4]  530 	ld	d,a
   224C 1E 10         [ 7]  531 	ld	e,#0x10
   224E D5            [11]  532 	push	de
   224F CD AD 3E      [17]  533 	call	_cpct_setPALColour
   2252 F1            [10]  534 	pop	af
                            535 ;src/main.c:206: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2253 AF            [ 4]  536 	xor	a, a
   2254 F5            [11]  537 	push	af
   2255 33            [ 6]  538 	inc	sp
   2256 CD BA 3F      [17]  539 	call	_cpct_setVideoMode
   2259 33            [ 6]  540 	inc	sp
                            541 ;src/main.c:209: cpct_memset(SCR_VMEM, 0x00, 0x4000);
   225A 21 00 40      [10]  542 	ld	hl,#0x4000
   225D E5            [11]  543 	push	hl
   225E AF            [ 4]  544 	xor	a, a
   225F F5            [11]  545 	push	af
   2260 33            [ 6]  546 	inc	sp
   2261 26 C0         [ 7]  547 	ld	h, #0xC0
   2263 E5            [11]  548 	push	hl
   2264 CD EB 3F      [17]  549 	call	_cpct_memset
   2267 F1            [10]  550 	pop	af
   2268 F1            [10]  551 	pop	af
   2269 33            [ 6]  552 	inc	sp
                            553 ;src/main.c:210: cpct_memset(SCR_BUFF, 0x00, 0x4000);
   226A 21 00 40      [10]  554 	ld	hl,#0x4000
   226D E5            [11]  555 	push	hl
   226E AF            [ 4]  556 	xor	a, a
   226F F5            [11]  557 	push	af
   2270 33            [ 6]  558 	inc	sp
   2271 26 80         [ 7]  559 	ld	h, #0x80
   2273 E5            [11]  560 	push	hl
   2274 CD EB 3F      [17]  561 	call	_cpct_memset
   2277 F1            [10]  562 	pop	af
   2278 F1            [10]  563 	pop	af
   2279 33            [ 6]  564 	inc	sp
                            565 ;src/main.c:212: initialization(); 
   227A CD D2 21      [17]  566 	call	_initialization
                            567 ;src/main.c:215: while (1){
   227D                     568 00106$:
                            569 ;src/main.c:217: clear_screen(pvmem);
   227D 2A 5F 42      [16]  570 	ld	hl,(_pvmem)
   2280 E5            [11]  571 	push	hl
   2281 CD 78 20      [17]  572 	call	_clear_screen
   2284 F1            [10]  573 	pop	af
                            574 ;src/main.c:219: update_user();
   2285 CD 31 2C      [17]  575 	call	_update_user
                            576 ;src/main.c:220: update_shoots();
   2288 CD 3D 2A      [17]  577 	call	_update_shoots
                            578 ;src/main.c:221: update_blocks();
   228B CD 8B 20      [17]  579 	call	_update_blocks
                            580 ;src/main.c:222: update_enemies();
   228E CD 93 25      [17]  581 	call	_update_enemies
                            582 ;src/main.c:225: update_stars();
   2291 CD BC 37      [17]  583 	call	_update_stars
                            584 ;src/main.c:228: cpct_waitVSYNC();   
   2294 CD B2 3F      [17]  585 	call	_cpct_waitVSYNC
                            586 ;src/main.c:231: draw_stars(pvmem);
   2297 2A 5F 42      [16]  587 	ld	hl,(_pvmem)
   229A E5            [11]  588 	push	hl
   229B CD 41 37      [17]  589 	call	_draw_stars
   229E F1            [10]  590 	pop	af
                            591 ;src/main.c:233: draw_blocks(pvmem);
   229F 2A 5F 42      [16]  592 	ld	hl,(_pvmem)
   22A2 E5            [11]  593 	push	hl
   22A3 CD 28 20      [17]  594 	call	_draw_blocks
   22A6 F1            [10]  595 	pop	af
                            596 ;src/main.c:234: draw_user(pvmem);
   22A7 2A 5F 42      [16]  597 	ld	hl,(_pvmem)
   22AA E5            [11]  598 	push	hl
   22AB CD D8 2D      [17]  599 	call	_draw_user
   22AE F1            [10]  600 	pop	af
                            601 ;src/main.c:235: draw_shoots(pvmem);
   22AF 2A 5F 42      [16]  602 	ld	hl,(_pvmem)
   22B2 E5            [11]  603 	push	hl
   22B3 CD D3 2A      [17]  604 	call	_draw_shoots
   22B6 F1            [10]  605 	pop	af
                            606 ;src/main.c:236: draw_enemies(pvmem); 
   22B7 2A 5F 42      [16]  607 	ld	hl,(_pvmem)
   22BA E5            [11]  608 	push	hl
   22BB CD DE 27      [17]  609 	call	_draw_enemies
   22BE F1            [10]  610 	pop	af
                            611 ;src/main.c:238: draw_scoreboard(pvmem);
   22BF 2A 5F 42      [16]  612 	ld	hl,(_pvmem)
   22C2 E5            [11]  613 	push	hl
   22C3 CD 8A 21      [17]  614 	call	_draw_scoreboard
   22C6 F1            [10]  615 	pop	af
                            616 ;src/main.c:240: pvmem = changeVideoMemoryPage();
   22C7 CD 00 20      [17]  617 	call	_changeVideoMemoryPage
   22CA 22 5F 42      [16]  618 	ld	(_pvmem),hl
   22CD 18 AE         [12]  619 	jr	00106$
                            620 	.area _CODE
                            621 	.area _INITIALIZER
                            622 	.area _CABS (ABS)
