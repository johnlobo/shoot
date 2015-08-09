                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 17:19:38 2015
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
                             15 	.globl _update_blocks
                             16 	.globl _clear_screen
                             17 	.globl _draw_blocks
                             18 	.globl _changeVideoMemoryPage
                             19 	.globl _get_time
                             20 	.globl _timer_on
                             21 	.globl _set_stack
                             22 	.globl _cpc_PrintGphStr
                             23 	.globl _update_stars
                             24 	.globl _draw_stars
                             25 	.globl _init_stars
                             26 	.globl _draw_messages
                             27 	.globl _create_message
                             28 	.globl _init_messages
                             29 	.globl _colour_message
                             30 	.globl _red_message
                             31 	.globl _draw_explosions
                             32 	.globl _update_explosions
                             33 	.globl _init_explosions
                             34 	.globl _get_score
                             35 	.globl _draw_user
                             36 	.globl _update_user
                             37 	.globl _init_user
                             38 	.globl _draw_enemies
                             39 	.globl _update_enemies
                             40 	.globl _init_enemies
                             41 	.globl _draw_shoots
                             42 	.globl _update_shoots
                             43 	.globl _init_shoots
                             44 	.globl _cpct_setRandomSeedUniform_u8
                             45 	.globl _cpct_getScreenPtr
                             46 	.globl _cpct_setVideoMemoryPage
                             47 	.globl _cpct_setPALColour
                             48 	.globl _cpct_setPalette
                             49 	.globl _cpct_fw2hw
                             50 	.globl _cpct_setVideoMode
                             51 	.globl _cpct_drawSolidBox
                             52 	.globl _cpct_px2byteM0
                             53 	.globl _cpct_memset_f64
                             54 	.globl _sprintf
                             55 	.globl _aux_txt
                             56 	.globl _pvmem
                             57 	.globl _block02
                             58 	.globl _block01
                             59 ;--------------------------------------------------------
                             60 ; special function registers
                             61 ;--------------------------------------------------------
                             62 ;--------------------------------------------------------
                             63 ; ram data
                             64 ;--------------------------------------------------------
                             65 	.area _DATA
   5BF4                      66 _block01::
   5BF4                      67 	.ds 7
   5BFB                      68 _block02::
   5BFB                      69 	.ds 7
   5C02                      70 _pvmem::
   5C02                      71 	.ds 2
   5C04                      72 _aux_txt::
   5C04                      73 	.ds 40
   5C2C                      74 _changeVideoMemoryPage_page_1_88:
   5C2C                      75 	.ds 1
                             76 ;--------------------------------------------------------
                             77 ; ram data
                             78 ;--------------------------------------------------------
                             79 	.area _INITIALIZED
                             80 ;--------------------------------------------------------
                             81 ; absolute external ram data
                             82 ;--------------------------------------------------------
                             83 	.area _DABS (ABS)
                             84 ;--------------------------------------------------------
                             85 ; global & static initialisations
                             86 ;--------------------------------------------------------
                             87 	.area _HOME
                             88 	.area _GSINIT
                             89 	.area _GSFINAL
                             90 	.area _GSINIT
                             91 ;src/main.c:51: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   66B8 FD 21 2C 5C   [14]   92 	ld	iy,#_changeVideoMemoryPage_page_1_88
   66BC FD 36 00 00   [19]   93 	ld	0 (iy),#0x00
                             94 ;--------------------------------------------------------
                             95 ; Home
                             96 ;--------------------------------------------------------
                             97 	.area _HOME
                             98 	.area _HOME
                             99 ;--------------------------------------------------------
                            100 ; code
                            101 ;--------------------------------------------------------
                            102 	.area _CODE
                            103 ;src/main.c:50: u8* changeVideoMemoryPage() {
                            104 ;	---------------------------------
                            105 ; Function changeVideoMemoryPage
                            106 ; ---------------------------------
   2000                     107 _changeVideoMemoryPage::
                            108 ;src/main.c:56: if (page) {
   2000 3A 2C 5C      [13]  109 	ld	a,(#_changeVideoMemoryPage_page_1_88 + 0)
   2003 B7            [ 4]  110 	or	a, a
   2004 28 11         [12]  111 	jr	Z,00102$
                            112 ;src/main.c:57: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  113 	ld	a,#0x30
   2008 F5            [11]  114 	push	af
   2009 33            [ 6]  115 	inc	sp
   200A CD 7C 4D      [17]  116 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  117 	inc	sp
                            118 ;src/main.c:58: page = 0;  
   200E 21 2C 5C      [10]  119 	ld	hl,#_changeVideoMemoryPage_page_1_88 + 0
   2011 36 00         [10]  120 	ld	(hl), #0x00
                            121 ;src/main.c:59: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  122 	ld	hl,#0x8000
   2016 C9            [10]  123 	ret
   2017                     124 00102$:
                            125 ;src/main.c:61: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  126 	ld	a,#0x20
   2019 F5            [11]  127 	push	af
   201A 33            [ 6]  128 	inc	sp
   201B CD 7C 4D      [17]  129 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  130 	inc	sp
                            131 ;src/main.c:62: page = 1;                              // Next page = 1
   201F 21 2C 5C      [10]  132 	ld	hl,#_changeVideoMemoryPage_page_1_88 + 0
   2022 36 01         [10]  133 	ld	(hl), #0x01
                            134 ;src/main.c:63: screen = SCR_VMEM;
   2024 21 00 C0      [10]  135 	ld	hl,#0xC000
                            136 ;src/main.c:65: return screen;
   2027 C9            [10]  137 	ret
                            138 ;src/main.c:73: void draw_blocks(u8* screen){
                            139 ;	---------------------------------
                            140 ; Function draw_blocks
                            141 ; ---------------------------------
   2028                     142 _draw_blocks::
   2028 DD E5         [15]  143 	push	ix
   202A DD 21 00 00   [14]  144 	ld	ix,#0
   202E DD 39         [15]  145 	add	ix,sp
   2030 3B            [ 6]  146 	dec	sp
                            147 ;src/main.c:76: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
   2031 21 F5 5B      [10]  148 	ld	hl, #_block01 + 1
   2034 4E            [ 7]  149 	ld	c,(hl)
   2035 21 F4 5B      [10]  150 	ld	hl, #_block01 + 0
   2038 66            [ 7]  151 	ld	h,(hl)
   2039 DD 5E 04      [19]  152 	ld	e,4 (ix)
   203C DD 56 05      [19]  153 	ld	d,5 (ix)
   203F 79            [ 4]  154 	ld	a,c
   2040 F5            [11]  155 	push	af
   2041 33            [ 6]  156 	inc	sp
   2042 E5            [11]  157 	push	hl
   2043 33            [ 6]  158 	inc	sp
   2044 D5            [11]  159 	push	de
   2045 CD A0 4F      [17]  160 	call	_cpct_getScreenPtr
   2048 5D            [ 4]  161 	ld	e, l
   2049 54            [ 4]  162 	ld	d, h
                            163 ;src/main.c:77: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
   204A 21 F9 5B      [10]  164 	ld	hl, #_block01 + 5
   204D 4E            [ 7]  165 	ld	c,(hl)
   204E 21 F8 5B      [10]  166 	ld	hl, #_block01 + 4
   2051 46            [ 7]  167 	ld	b,(hl)
   2052 C5            [11]  168 	push	bc
   2053 D5            [11]  169 	push	de
   2054 21 04 04      [10]  170 	ld	hl,#0x0404
   2057 E5            [11]  171 	push	hl
   2058 CD 9C 4E      [17]  172 	call	_cpct_px2byteM0
   205B F1            [10]  173 	pop	af
   205C DD 75 FF      [19]  174 	ld	-1 (ix),l
   205F D1            [10]  175 	pop	de
   2060 C1            [10]  176 	pop	bc
   2061 79            [ 4]  177 	ld	a,c
   2062 F5            [11]  178 	push	af
   2063 33            [ 6]  179 	inc	sp
   2064 C5            [11]  180 	push	bc
   2065 33            [ 6]  181 	inc	sp
   2066 DD 7E FF      [19]  182 	ld	a,-1 (ix)
   2069 F5            [11]  183 	push	af
   206A 33            [ 6]  184 	inc	sp
   206B D5            [11]  185 	push	de
   206C CD BB 4E      [17]  186 	call	_cpct_drawSolidBox
   206F F1            [10]  187 	pop	af
   2070 F1            [10]  188 	pop	af
   2071 33            [ 6]  189 	inc	sp
   2072 33            [ 6]  190 	inc	sp
   2073 DD E1         [14]  191 	pop	ix
   2075 C9            [10]  192 	ret
                            193 ;src/main.c:84: void clear_screen(u8* screen){
                            194 ;	---------------------------------
                            195 ; Function clear_screen
                            196 ; ---------------------------------
   2076                     197 _clear_screen::
                            198 ;src/main.c:85: cpct_memset_f64(screen, 0x00, 0x4000);   
   2076 C1            [10]  199 	pop	bc
   2077 E1            [10]  200 	pop	hl
   2078 E5            [11]  201 	push	hl
   2079 C5            [11]  202 	push	bc
   207A 01 00 40      [10]  203 	ld	bc,#0x4000
   207D C5            [11]  204 	push	bc
   207E 01 00 00      [10]  205 	ld	bc,#0x0000
   2081 C5            [11]  206 	push	bc
   2082 E5            [11]  207 	push    hl
   2083 CD 8A 4D      [17]  208 	call    _cpct_memset_f64
   2086 C9            [10]  209 	ret
                            210 ;src/main.c:92: void update_blocks(){
                            211 ;	---------------------------------
                            212 ; Function update_blocks
                            213 ; ---------------------------------
   2087                     214 _update_blocks::
   2087 DD E5         [15]  215 	push	ix
   2089 DD 21 00 00   [14]  216 	ld	ix,#0
   208D DD 39         [15]  217 	add	ix,sp
   208F F5            [11]  218 	push	af
   2090 3B            [ 6]  219 	dec	sp
                            220 ;src/main.c:93: if (block01.vx<128){
   2091 01 F4 5B      [10]  221 	ld	bc,#_block01+0
   2094 21 F6 5B      [10]  222 	ld	hl, #(_block01 + 0x0002) + 0
   2097 7E            [ 7]  223 	ld	a,(hl)
   2098 DD 77 FF      [19]  224 	ld	-1 (ix),a
                            225 ;src/main.c:94: if ((block01.x+block01.vx)<(80-block01.w)){
   209B 0A            [ 7]  226 	ld	a,(bc)
                            227 ;src/main.c:95: block01.x = block01.x + block01.vx;
   209C 57            [ 4]  228 	ld	d,a
   209D DD 86 FF      [19]  229 	add	a, -1 (ix)
   20A0 5F            [ 4]  230 	ld	e,a
                            231 ;src/main.c:93: if (block01.vx<128){
   20A1 DD 7E FF      [19]  232 	ld	a,-1 (ix)
   20A4 D6 80         [ 7]  233 	sub	a, #0x80
   20A6 30 4E         [12]  234 	jr	NC,00108$
                            235 ;src/main.c:94: if ((block01.x+block01.vx)<(80-block01.w)){
   20A8 DD 72 FD      [19]  236 	ld	-3 (ix),d
   20AB DD 36 FE 00   [19]  237 	ld	-2 (ix),#0x00
   20AF DD 66 FF      [19]  238 	ld	h,-1 (ix)
   20B2 2E 00         [ 7]  239 	ld	l,#0x00
   20B4 DD 7E FD      [19]  240 	ld	a,-3 (ix)
   20B7 84            [ 4]  241 	add	a, h
   20B8 DD 77 FD      [19]  242 	ld	-3 (ix),a
   20BB DD 7E FE      [19]  243 	ld	a,-2 (ix)
   20BE 8D            [ 4]  244 	adc	a, l
   20BF DD 77 FE      [19]  245 	ld	-2 (ix),a
   20C2 21 F8 5B      [10]  246 	ld	hl, #_block01 + 4
   20C5 66            [ 7]  247 	ld	h,(hl)
   20C6 6C            [ 4]  248 	ld	l,h
   20C7 16 00         [ 7]  249 	ld	d,#0x00
   20C9 3E 50         [ 7]  250 	ld	a,#0x50
   20CB 95            [ 4]  251 	sub	a, l
   20CC 6F            [ 4]  252 	ld	l,a
   20CD 3E 00         [ 7]  253 	ld	a,#0x00
   20CF 9A            [ 4]  254 	sbc	a, d
   20D0 57            [ 4]  255 	ld	d,a
   20D1 DD 7E FD      [19]  256 	ld	a,-3 (ix)
   20D4 95            [ 4]  257 	sub	a, l
   20D5 DD 7E FE      [19]  258 	ld	a,-2 (ix)
   20D8 9A            [ 4]  259 	sbc	a, d
   20D9 E2 DE 20      [10]  260 	jp	PO, 00124$
   20DC EE 80         [ 7]  261 	xor	a, #0x80
   20DE                     262 00124$:
   20DE F2 E5 20      [10]  263 	jp	P,00102$
                            264 ;src/main.c:95: block01.x = block01.x + block01.vx;
   20E1 7B            [ 4]  265 	ld	a,e
   20E2 02            [ 7]  266 	ld	(bc),a
   20E3 18 2D         [12]  267 	jr	00110$
   20E5                     268 00102$:
                            269 ;src/main.c:98: block01.x = 79-block01.w;
   20E5 3E 4F         [ 7]  270 	ld	a,#0x4F
   20E7 94            [ 4]  271 	sub	a, h
   20E8 02            [ 7]  272 	ld	(bc),a
                            273 ;src/main.c:99: block01.vx = - block01.vx;
   20E9 21 F6 5B      [10]  274 	ld	hl, #(_block01 + 0x0002) + 0
   20EC 66            [ 7]  275 	ld	h,(hl)
   20ED AF            [ 4]  276 	xor	a, a
   20EE 94            [ 4]  277 	sub	a, h
   20EF 57            [ 4]  278 	ld	d,a
   20F0 21 F6 5B      [10]  279 	ld	hl,#(_block01 + 0x0002)
   20F3 72            [ 7]  280 	ld	(hl),d
   20F4 18 1C         [12]  281 	jr	00110$
   20F6                     282 00108$:
                            283 ;src/main.c:102: if (( (i8) (block01.x+block01.vx))>0){
   20F6 6B            [ 4]  284 	ld	l,e
   20F7 AF            [ 4]  285 	xor	a, a
   20F8 95            [ 4]  286 	sub	a, l
   20F9 E2 FE 20      [10]  287 	jp	PO, 00125$
   20FC EE 80         [ 7]  288 	xor	a, #0x80
   20FE                     289 00125$:
   20FE F2 05 21      [10]  290 	jp	P,00105$
                            291 ;src/main.c:103: block01.x = block01.x + block01.vx;
   2101 7B            [ 4]  292 	ld	a,e
   2102 02            [ 7]  293 	ld	(bc),a
   2103 18 0D         [12]  294 	jr	00110$
   2105                     295 00105$:
                            296 ;src/main.c:106: block01.x = 0;
   2105 AF            [ 4]  297 	xor	a, a
   2106 02            [ 7]  298 	ld	(bc),a
                            299 ;src/main.c:107: block01.vx = - block01.vx;
   2107 21 F6 5B      [10]  300 	ld	hl, #(_block01 + 0x0002) + 0
   210A 66            [ 7]  301 	ld	h,(hl)
   210B AF            [ 4]  302 	xor	a, a
   210C 94            [ 4]  303 	sub	a, h
   210D 57            [ 4]  304 	ld	d,a
   210E 21 F6 5B      [10]  305 	ld	hl,#(_block01 + 0x0002)
   2111 72            [ 7]  306 	ld	(hl),d
   2112                     307 00110$:
   2112 DD F9         [10]  308 	ld	sp, ix
   2114 DD E1         [14]  309 	pop	ix
   2116 C9            [10]  310 	ret
                            311 ;src/main.c:121: void draw_scoreboard(u8* screen){
                            312 ;	---------------------------------
                            313 ; Function draw_scoreboard
                            314 ; ---------------------------------
   2117                     315 _draw_scoreboard::
   2117 DD E5         [15]  316 	push	ix
   2119 DD 21 00 00   [14]  317 	ld	ix,#0
   211D DD 39         [15]  318 	add	ix,sp
                            319 ;src/main.c:122: sprintf(aux_txt,"%08d",get_score());
   211F CD C9 3A      [17]  320 	call	_get_score
   2122 D5            [11]  321 	push	de
   2123 E5            [11]  322 	push	hl
   2124 21 70 21      [10]  323 	ld	hl,#___str_0
   2127 E5            [11]  324 	push	hl
   2128 21 04 5C      [10]  325 	ld	hl,#_aux_txt
   212B E5            [11]  326 	push	hl
   212C CD 27 4E      [17]  327 	call	_sprintf
   212F 21 08 00      [10]  328 	ld	hl,#8
   2132 39            [11]  329 	add	hl,sp
   2133 F9            [ 6]  330 	ld	sp,hl
                            331 ;src/main.c:123: colour_message(0, 2);
   2134 21 00 02      [10]  332 	ld	hl,#0x0200
   2137 E5            [11]  333 	push	hl
   2138 CD 01 31      [17]  334 	call	_colour_message
   213B F1            [10]  335 	pop	af
                            336 ;src/main.c:124: cpc_PrintGphStr(aux_txt,(int) cpct_getScreenPtr(screen, 4, 8));
   213C DD 5E 04      [19]  337 	ld	e,4 (ix)
   213F DD 56 05      [19]  338 	ld	d,5 (ix)
   2142 D5            [11]  339 	push	de
   2143 21 04 08      [10]  340 	ld	hl,#0x0804
   2146 E5            [11]  341 	push	hl
   2147 D5            [11]  342 	push	de
   2148 CD A0 4F      [17]  343 	call	_cpct_getScreenPtr
   214B D1            [10]  344 	pop	de
   214C 01 04 5C      [10]  345 	ld	bc,#_aux_txt
   214F D5            [11]  346 	push	de
   2150 E5            [11]  347 	push	hl
   2151 C5            [11]  348 	push	bc
   2152 CD E5 47      [17]  349 	call	_cpc_PrintGphStr
   2155 F1            [10]  350 	pop	af
   2156 F1            [10]  351 	pop	af
   2157 CD 34 31      [17]  352 	call	_red_message
   215A D1            [10]  353 	pop	de
                            354 ;src/main.c:126: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   215B 21 3C 08      [10]  355 	ld	hl,#0x083C
   215E E5            [11]  356 	push	hl
   215F D5            [11]  357 	push	de
   2160 CD A0 4F      [17]  358 	call	_cpct_getScreenPtr
   2163 11 75 21      [10]  359 	ld	de,#___str_1+0
   2166 E5            [11]  360 	push	hl
   2167 D5            [11]  361 	push	de
   2168 CD E5 47      [17]  362 	call	_cpc_PrintGphStr
   216B F1            [10]  363 	pop	af
   216C F1            [10]  364 	pop	af
   216D DD E1         [14]  365 	pop	ix
   216F C9            [10]  366 	ret
   2170                     367 ___str_0:
   2170 25 30 38 64         368 	.ascii "%08d"
   2174 00                  369 	.db 0x00
   2175                     370 ___str_1:
   2175 30 30 30 30 30 30   371 	.ascii "00000000"
        30 30
   217D 00                  372 	.db 0x00
                            373 ;src/main.c:134: void initialization(){
                            374 ;	---------------------------------
                            375 ; Function initialization
                            376 ; ---------------------------------
   217E                     377 _initialization::
                            378 ;src/main.c:136: pvmem = SCR_BUFF;
   217E 21 00 80      [10]  379 	ld	hl,#0x8000
   2181 22 02 5C      [16]  380 	ld	(_pvmem),hl
                            381 ;src/main.c:138: cpct_setRandomSeedUniform_u8((u8) get_time());
   2184 CD CC 47      [17]  382 	call	_get_time
   2187 CD 30 4B      [17]  383 	call	_cpct_setRandomSeedUniform_u8
                            384 ;src/main.c:141: init_stars();
   218A CD FC 45      [17]  385 	call	_init_stars
                            386 ;src/main.c:143: init_user();
   218D CD 0C 37      [17]  387 	call	_init_user
                            388 ;src/main.c:144: init_shoots();
   2190 CD 6B 33      [17]  389 	call	_init_shoots
                            390 ;src/main.c:145: init_enemies();
   2193 CD DC 23      [17]  391 	call	_init_enemies
                            392 ;src/main.c:146: init_explosions();
   2196 CD C7 2E      [17]  393 	call	_init_explosions
                            394 ;src/main.c:147: init_messages();
   2199 CD 70 31      [17]  395 	call	_init_messages
                            396 ;src/main.c:149: block01.x = 50;
   219C 21 F4 5B      [10]  397 	ld	hl,#_block01+0
   219F 36 32         [10]  398 	ld	(hl),#0x32
                            399 ;src/main.c:150: block01.y = 10;
   21A1 21 F5 5B      [10]  400 	ld	hl,#_block01 + 1
   21A4 36 0A         [10]  401 	ld	(hl),#0x0A
                            402 ;src/main.c:151: block01.vx = 2;
   21A6 21 F6 5B      [10]  403 	ld	hl,#_block01 + 2
   21A9 36 02         [10]  404 	ld	(hl),#0x02
                            405 ;src/main.c:152: block01.vy = 0;
   21AB 21 F7 5B      [10]  406 	ld	hl,#_block01 + 3
   21AE 36 00         [10]  407 	ld	(hl),#0x00
                            408 ;src/main.c:153: block01.w = 20;
   21B0 21 F8 5B      [10]  409 	ld	hl,#_block01 + 4
   21B3 36 14         [10]  410 	ld	(hl),#0x14
                            411 ;src/main.c:154: block01.h = 40;
   21B5 21 F9 5B      [10]  412 	ld	hl,#_block01 + 5
   21B8 36 28         [10]  413 	ld	(hl),#0x28
                            414 ;src/main.c:156: block02.x = 15;
   21BA 21 FB 5B      [10]  415 	ld	hl,#_block02+0
   21BD 36 0F         [10]  416 	ld	(hl),#0x0F
                            417 ;src/main.c:157: block02.y = 15;
   21BF 21 FC 5B      [10]  418 	ld	hl,#_block02 + 1
   21C2 36 0F         [10]  419 	ld	(hl),#0x0F
                            420 ;src/main.c:158: block02.vx = 4;
   21C4 21 FD 5B      [10]  421 	ld	hl,#_block02 + 2
   21C7 36 04         [10]  422 	ld	(hl),#0x04
                            423 ;src/main.c:159: block02.vy = 0;
   21C9 21 FE 5B      [10]  424 	ld	hl,#_block02 + 3
   21CC 36 00         [10]  425 	ld	(hl),#0x00
                            426 ;src/main.c:160: block02.w = 25;
   21CE 21 FF 5B      [10]  427 	ld	hl,#_block02 + 4
   21D1 36 19         [10]  428 	ld	(hl),#0x19
                            429 ;src/main.c:161: block02.h = 20;
   21D3 21 00 5C      [10]  430 	ld	hl,#_block02 + 5
   21D6 36 14         [10]  431 	ld	(hl),#0x14
   21D8 C9            [10]  432 	ret
                            433 ;src/main.c:169: void main(void) {
                            434 ;	---------------------------------
                            435 ; Function main
                            436 ; ---------------------------------
   21D9                     437 _main::
                            438 ;src/main.c:172: set_stack(0x1000);
   21D9 21 00 10      [10]  439 	ld	hl,#0x1000
   21DC E5            [11]  440 	push	hl
   21DD CD DE 4A      [17]  441 	call	_set_stack
   21E0 F1            [10]  442 	pop	af
                            443 ;src/main.c:175: timer_on();
   21E1 CD 96 47      [17]  444 	call	_timer_on
                            445 ;src/main.c:176: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   21E4 11 FA 3F      [10]  446 	ld	de,#_palette
   21E7 3E 10         [ 7]  447 	ld	a,#0x10
   21E9 F5            [11]  448 	push	af
   21EA 33            [ 6]  449 	inc	sp
   21EB D5            [11]  450 	push	de
   21EC CD 17 4D      [17]  451 	call	_cpct_fw2hw
   21EF F1            [10]  452 	pop	af
   21F0 33            [ 6]  453 	inc	sp
                            454 ;src/main.c:177: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   21F1 11 FA 3F      [10]  455 	ld	de,#_palette
   21F4 3E 10         [ 7]  456 	ld	a,#0x10
   21F6 F5            [11]  457 	push	af
   21F7 33            [ 6]  458 	inc	sp
   21F8 D5            [11]  459 	push	de
   21F9 CD B0 4B      [17]  460 	call	_cpct_setPalette
   21FC F1            [10]  461 	pop	af
   21FD 33            [ 6]  462 	inc	sp
                            463 ;src/main.c:178: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   21FE 3A FA 3F      [13]  464 	ld	a, (#_palette + 0)
   2201 57            [ 4]  465 	ld	d,a
   2202 1E 10         [ 7]  466 	ld	e,#0x10
   2204 D5            [11]  467 	push	de
   2205 CD 4B 4C      [17]  468 	call	_cpct_setPALColour
   2208 F1            [10]  469 	pop	af
                            470 ;src/main.c:179: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2209 AF            [ 4]  471 	xor	a, a
   220A F5            [11]  472 	push	af
   220B 33            [ 6]  473 	inc	sp
   220C CD 8A 4E      [17]  474 	call	_cpct_setVideoMode
   220F 33            [ 6]  475 	inc	sp
                            476 ;src/main.c:182: clear_screen(SCR_VMEM);
   2210 21 00 C0      [10]  477 	ld	hl,#0xC000
   2213 E5            [11]  478 	push	hl
   2214 CD 76 20      [17]  479 	call	_clear_screen
                            480 ;src/main.c:183: clear_screen(SCR_BUFF);
   2217 21 00 80      [10]  481 	ld	hl, #0x8000
   221A E3            [19]  482 	ex	(sp),hl
   221B CD 76 20      [17]  483 	call	_clear_screen
   221E F1            [10]  484 	pop	af
                            485 ;src/main.c:185: initialization(); 
   221F CD 7E 21      [17]  486 	call	_initialization
                            487 ;src/main.c:186: create_message(25,96,30,";VAMOS;AL;ATAQUE;");
   2222 21 8B 22      [10]  488 	ld	hl,#___str_2
   2225 E5            [11]  489 	push	hl
   2226 21 60 1E      [10]  490 	ld	hl,#0x1E60
   2229 E5            [11]  491 	push	hl
   222A 3E 19         [ 7]  492 	ld	a,#0x19
   222C F5            [11]  493 	push	af
   222D 33            [ 6]  494 	inc	sp
   222E CD B1 31      [17]  495 	call	_create_message
   2231 F1            [10]  496 	pop	af
   2232 F1            [10]  497 	pop	af
   2233 33            [ 6]  498 	inc	sp
                            499 ;src/main.c:189: while (1){
   2234                     500 00106$:
                            501 ;src/main.c:191: clear_screen(pvmem);
   2234 2A 02 5C      [16]  502 	ld	hl,(_pvmem)
   2237 E5            [11]  503 	push	hl
   2238 CD 76 20      [17]  504 	call	_clear_screen
   223B F1            [10]  505 	pop	af
                            506 ;src/main.c:193: update_user();
   223C CD 68 37      [17]  507 	call	_update_user
                            508 ;src/main.c:194: update_shoots();
   223F CD E9 34      [17]  509 	call	_update_shoots
                            510 ;src/main.c:196: update_enemies();
   2242 CD E4 27      [17]  511 	call	_update_enemies
                            512 ;src/main.c:197: update_explosions();
   2245 CD C2 2F      [17]  513 	call	_update_explosions
                            514 ;src/main.c:200: update_stars();
   2248 CD E9 46      [17]  515 	call	_update_stars
                            516 ;src/main.c:203: draw_stars(pvmem);
   224B 2A 02 5C      [16]  517 	ld	hl,(_pvmem)
   224E E5            [11]  518 	push	hl
   224F CD 70 46      [17]  519 	call	_draw_stars
   2252 F1            [10]  520 	pop	af
                            521 ;src/main.c:206: draw_user(pvmem);
   2253 2A 02 5C      [16]  522 	ld	hl,(_pvmem)
   2256 E5            [11]  523 	push	hl
   2257 CD 3F 3A      [17]  524 	call	_draw_user
   225A F1            [10]  525 	pop	af
                            526 ;src/main.c:207: draw_shoots(pvmem);
   225B 2A 02 5C      [16]  527 	ld	hl,(_pvmem)
   225E E5            [11]  528 	push	hl
   225F CD 01 36      [17]  529 	call	_draw_shoots
   2262 F1            [10]  530 	pop	af
                            531 ;src/main.c:208: draw_enemies(pvmem);
   2263 2A 02 5C      [16]  532 	ld	hl,(_pvmem)
   2266 E5            [11]  533 	push	hl
   2267 CD 83 2D      [17]  534 	call	_draw_enemies
   226A F1            [10]  535 	pop	af
                            536 ;src/main.c:209: draw_explosions(pvmem);
   226B 2A 02 5C      [16]  537 	ld	hl,(_pvmem)
   226E E5            [11]  538 	push	hl
   226F CD 0C 30      [17]  539 	call	_draw_explosions
   2272 F1            [10]  540 	pop	af
                            541 ;src/main.c:211: draw_messages(pvmem);
   2273 2A 02 5C      [16]  542 	ld	hl,(_pvmem)
   2276 E5            [11]  543 	push	hl
   2277 CD FE 31      [17]  544 	call	_draw_messages
   227A F1            [10]  545 	pop	af
                            546 ;src/main.c:212: draw_scoreboard(pvmem);
   227B 2A 02 5C      [16]  547 	ld	hl,(_pvmem)
   227E E5            [11]  548 	push	hl
   227F CD 17 21      [17]  549 	call	_draw_scoreboard
   2282 F1            [10]  550 	pop	af
                            551 ;src/main.c:218: pvmem = changeVideoMemoryPage();
   2283 CD 00 20      [17]  552 	call	_changeVideoMemoryPage
   2286 22 02 5C      [16]  553 	ld	(_pvmem),hl
   2289 18 A9         [12]  554 	jr	00106$
   228B                     555 ___str_2:
   228B 3B 56 41 4D 4F 53   556 	.ascii ";VAMOS;AL;ATAQUE;"
        3B 41 4C 3B 41 54
        41 51 55 45 3B
   229C 00                  557 	.db 0x00
                            558 	.area _CODE
                            559 	.area _INITIALIZER
                            560 	.area _CABS (ABS)
