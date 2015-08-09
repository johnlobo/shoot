                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 01:24:07 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _game
                             14 	.globl _game_over
                             15 	.globl _win
                             16 	.globl _help
                             17 	.globl _end
                             18 	.globl _level_up
                             19 	.globl _redefine_keys
                             20 	.globl _menu
                             21 	.globl _init_level
                             22 	.globl _init_game
                             23 	.globl _initial_setup
                             24 	.globl _initialization
                             25 	.globl _draw_scoreboard
                             26 	.globl _clear_both_screens
                             27 	.globl _clear_screen
                             28 	.globl _changeVideoMemoryPage
                             29 	.globl _get_time
                             30 	.globl _timer_off
                             31 	.globl _timer_on
                             32 	.globl _set_stack
                             33 	.globl _cpc_PrintGphStr2X
                             34 	.globl _cpc_PrintGphStr
                             35 	.globl _update_stars
                             36 	.globl _draw_stars
                             37 	.globl _init_stars
                             38 	.globl _get_last_moved_stars
                             39 	.globl _draw_messages
                             40 	.globl _create_message
                             41 	.globl _init_messages
                             42 	.globl _colour_message
                             43 	.globl _red_message
                             44 	.globl _blue_message
                             45 	.globl _draw_explosions
                             46 	.globl _update_explosions
                             47 	.globl _init_explosions
                             48 	.globl _get_score
                             49 	.globl _set_score
                             50 	.globl _draw_user
                             51 	.globl _update_user
                             52 	.globl _user_engine
                             53 	.globl _get_user_speed
                             54 	.globl _user_init_level
                             55 	.globl _init_user
                             56 	.globl _get_last_moved_user
                             57 	.globl _draw_enemies
                             58 	.globl _update_enemies
                             59 	.globl _init_enemies
                             60 	.globl _draw_shoots
                             61 	.globl _update_shoots
                             62 	.globl _init_shoots
                             63 	.globl _cpct_setRandomSeedUniform_u8
                             64 	.globl _cpct_getScreenPtr
                             65 	.globl _cpct_setVideoMemoryPage
                             66 	.globl _cpct_setPALColour
                             67 	.globl _cpct_setPalette
                             68 	.globl _cpct_fw2hw
                             69 	.globl _cpct_setVideoMode
                             70 	.globl _cpct_isKeyPressed
                             71 	.globl _cpct_scanKeyboard_f
                             72 	.globl _cpct_memset_f64
                             73 	.globl _cpct_disableFirmware
                             74 	.globl _sprintf
                             75 	.globl _level
                             76 	.globl _aux_txt
                             77 	.globl _pvmem
                             78 	.globl _previous_state
                             79 	.globl _state
                             80 ;--------------------------------------------------------
                             81 ; special function registers
                             82 ;--------------------------------------------------------
                             83 ;--------------------------------------------------------
                             84 ; ram data
                             85 ;--------------------------------------------------------
                             86 	.area _DATA
   6279                      87 _state::
   6279                      88 	.ds 1
   627A                      89 _previous_state::
   627A                      90 	.ds 1
   627B                      91 _pvmem::
   627B                      92 	.ds 2
   627D                      93 _aux_txt::
   627D                      94 	.ds 40
   62A5                      95 _changeVideoMemoryPage_page_1_89:
   62A5                      96 	.ds 1
                             97 ;--------------------------------------------------------
                             98 ; ram data
                             99 ;--------------------------------------------------------
                            100 	.area _INITIALIZED
   6BA7                     101 _level::
   6BA7                     102 	.ds 1
                            103 ;--------------------------------------------------------
                            104 ; absolute external ram data
                            105 ;--------------------------------------------------------
                            106 	.area _DABS (ABS)
                            107 ;--------------------------------------------------------
                            108 ; global & static initialisations
                            109 ;--------------------------------------------------------
                            110 	.area _HOME
                            111 	.area _GSINIT
                            112 	.area _GSFINAL
                            113 	.area _GSINIT
                            114 ;src/main.c:52: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
   6D2A FD 21 A5 62   [14]  115 	ld	iy,#_changeVideoMemoryPage_page_1_89
   6D2E FD 36 00 00   [19]  116 	ld	0 (iy),#0x00
                            117 ;--------------------------------------------------------
                            118 ; Home
                            119 ;--------------------------------------------------------
                            120 	.area _HOME
                            121 	.area _HOME
                            122 ;--------------------------------------------------------
                            123 ; code
                            124 ;--------------------------------------------------------
                            125 	.area _CODE
                            126 ;src/main.c:51: u8* changeVideoMemoryPage() {
                            127 ;	---------------------------------
                            128 ; Function changeVideoMemoryPage
                            129 ; ---------------------------------
   2000                     130 _changeVideoMemoryPage::
                            131 ;src/main.c:57: if (page) {
   2000 3A A5 62      [13]  132 	ld	a,(#_changeVideoMemoryPage_page_1_89 + 0)
   2003 B7            [ 4]  133 	or	a, a
   2004 28 11         [12]  134 	jr	Z,00102$
                            135 ;src/main.c:58: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 3E 30         [ 7]  136 	ld	a,#0x30
   2008 F5            [11]  137 	push	af
   2009 33            [ 6]  138 	inc	sp
   200A CD 01 54      [17]  139 	call	_cpct_setVideoMemoryPage
   200D 33            [ 6]  140 	inc	sp
                            141 ;src/main.c:59: page = 0;  
   200E 21 A5 62      [10]  142 	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
   2011 36 00         [10]  143 	ld	(hl), #0x00
                            144 ;src/main.c:60: screen = SCR_BUFF;                            // Next page = 0
   2013 21 00 80      [10]  145 	ld	hl,#0x8000
   2016 C9            [10]  146 	ret
   2017                     147 00102$:
                            148 ;src/main.c:62: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2017 3E 20         [ 7]  149 	ld	a,#0x20
   2019 F5            [11]  150 	push	af
   201A 33            [ 6]  151 	inc	sp
   201B CD 01 54      [17]  152 	call	_cpct_setVideoMemoryPage
   201E 33            [ 6]  153 	inc	sp
                            154 ;src/main.c:63: page = 1;                              // Next page = 1
   201F 21 A5 62      [10]  155 	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
   2022 36 01         [10]  156 	ld	(hl), #0x01
                            157 ;src/main.c:64: screen = SCR_VMEM;
   2024 21 00 C0      [10]  158 	ld	hl,#0xC000
                            159 ;src/main.c:66: return screen;
   2027 C9            [10]  160 	ret
                            161 ;src/main.c:73: void clear_screen(u8* screen){
                            162 ;	---------------------------------
                            163 ; Function clear_screen
                            164 ; ---------------------------------
   2028                     165 _clear_screen::
                            166 ;src/main.c:74: cpct_memset_f64(screen, 0x00, 0x4000);   
   2028 C1            [10]  167 	pop	bc
   2029 E1            [10]  168 	pop	hl
   202A E5            [11]  169 	push	hl
   202B C5            [11]  170 	push	bc
   202C 01 00 40      [10]  171 	ld	bc,#0x4000
   202F C5            [11]  172 	push	bc
   2030 01 00 00      [10]  173 	ld	bc,#0x0000
   2033 C5            [11]  174 	push	bc
   2034 E5            [11]  175 	push    hl
   2035 CD 0F 54      [17]  176 	call    _cpct_memset_f64
   2038 C9            [10]  177 	ret
                            178 ;src/main.c:80: void clear_both_screens(){
                            179 ;	---------------------------------
                            180 ; Function clear_both_screens
                            181 ; ---------------------------------
   2039                     182 _clear_both_screens::
                            183 ;src/main.c:81: cpct_memset_f64(SCR_VMEM, 0x00, 0x4000);   
   2039 21 00 40      [10]  184 	ld	hl,#0x4000
   203C E5            [11]  185 	push	hl
   203D 26 00         [ 7]  186 	ld	h, #0x00
   203F E5            [11]  187 	push	hl
   2040 26 C0         [ 7]  188 	ld	h, #0xC0
   2042 E5            [11]  189 	push	hl
   2043 CD 0F 54      [17]  190 	call	_cpct_memset_f64
                            191 ;src/main.c:82: cpct_memset_f64(SCR_BUFF, 0x00, 0x4000);   
   2046 21 00 40      [10]  192 	ld	hl,#0x4000
   2049 E5            [11]  193 	push	hl
   204A 26 00         [ 7]  194 	ld	h, #0x00
   204C E5            [11]  195 	push	hl
   204D 26 80         [ 7]  196 	ld	h, #0x80
   204F E5            [11]  197 	push    hl
   2050 CD 0F 54      [17]  198 	call    _cpct_memset_f64
   2053 C9            [10]  199 	ret
                            200 ;src/main.c:89: void draw_scoreboard(u8* screen){
                            201 ;	---------------------------------
                            202 ; Function draw_scoreboard
                            203 ; ---------------------------------
   2054                     204 _draw_scoreboard::
   2054 DD E5         [15]  205 	push	ix
   2056 DD 21 00 00   [14]  206 	ld	ix,#0
   205A DD 39         [15]  207 	add	ix,sp
                            208 ;src/main.c:90: sprintf(aux_txt,"%08d",get_score());
   205C CD 66 3D      [17]  209 	call	_get_score
   205F D5            [11]  210 	push	de
   2060 E5            [11]  211 	push	hl
   2061 21 AD 20      [10]  212 	ld	hl,#___str_0
   2064 E5            [11]  213 	push	hl
   2065 21 7D 62      [10]  214 	ld	hl,#_aux_txt
   2068 E5            [11]  215 	push	hl
   2069 CD AC 54      [17]  216 	call	_sprintf
   206C 21 08 00      [10]  217 	ld	hl,#8
   206F 39            [11]  218 	add	hl,sp
   2070 F9            [ 6]  219 	ld	sp,hl
                            220 ;src/main.c:91: colour_message(0, 2);
   2071 21 00 02      [10]  221 	ld	hl,#0x0200
   2074 E5            [11]  222 	push	hl
   2075 CD 14 33      [17]  223 	call	_colour_message
   2078 F1            [10]  224 	pop	af
                            225 ;src/main.c:92: cpc_PrintGphStr(aux_txt,(int) cpct_getScreenPtr(screen, 4, 8));
   2079 DD 5E 04      [19]  226 	ld	e,4 (ix)
   207C DD 56 05      [19]  227 	ld	d,5 (ix)
   207F D5            [11]  228 	push	de
   2080 21 04 08      [10]  229 	ld	hl,#0x0804
   2083 E5            [11]  230 	push	hl
   2084 D5            [11]  231 	push	de
   2085 CD 25 56      [17]  232 	call	_cpct_getScreenPtr
   2088 D1            [10]  233 	pop	de
   2089 01 7D 62      [10]  234 	ld	bc,#_aux_txt
   208C D5            [11]  235 	push	de
   208D E5            [11]  236 	push	hl
   208E C5            [11]  237 	push	bc
   208F CD 6A 4E      [17]  238 	call	_cpc_PrintGphStr
   2092 F1            [10]  239 	pop	af
   2093 F1            [10]  240 	pop	af
   2094 CD 47 33      [17]  241 	call	_red_message
   2097 D1            [10]  242 	pop	de
                            243 ;src/main.c:94: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   2098 21 3C 08      [10]  244 	ld	hl,#0x083C
   209B E5            [11]  245 	push	hl
   209C D5            [11]  246 	push	de
   209D CD 25 56      [17]  247 	call	_cpct_getScreenPtr
   20A0 11 B2 20      [10]  248 	ld	de,#___str_1+0
   20A3 E5            [11]  249 	push	hl
   20A4 D5            [11]  250 	push	de
   20A5 CD 6A 4E      [17]  251 	call	_cpc_PrintGphStr
   20A8 F1            [10]  252 	pop	af
   20A9 F1            [10]  253 	pop	af
   20AA DD E1         [14]  254 	pop	ix
   20AC C9            [10]  255 	ret
   20AD                     256 ___str_0:
   20AD 25 30 38 64         257 	.ascii "%08d"
   20B1 00                  258 	.db 0x00
   20B2                     259 ___str_1:
   20B2 30 30 30 30 30 30   260 	.ascii "00000000"
        30 30
   20BA 00                  261 	.db 0x00
                            262 ;src/main.c:101: void initialization(){
                            263 ;	---------------------------------
                            264 ; Function initialization
                            265 ; ---------------------------------
   20BB                     266 _initialization::
                            267 ;src/main.c:103: pvmem = SCR_BUFF;
   20BB 21 00 80      [10]  268 	ld	hl,#0x8000
   20BE 22 7B 62      [16]  269 	ld	(_pvmem),hl
                            270 ;src/main.c:105: clear_both_screens();
   20C1 CD 39 20      [17]  271 	call	_clear_both_screens
                            272 ;src/main.c:107: cpct_setRandomSeedUniform_u8((u8) get_time());
   20C4 CD 51 4E      [17]  273 	call	_get_time
   20C7 CD B5 51      [17]  274 	call	_cpct_setRandomSeedUniform_u8
                            275 ;src/main.c:110: init_stars();
   20CA CD 15 4C      [17]  276 	call	_init_stars
                            277 ;src/main.c:112: init_user();
   20CD CD 1F 39      [17]  278 	call	_init_user
                            279 ;src/main.c:113: init_shoots();
   20D0 CD 7E 35      [17]  280 	call	_init_shoots
                            281 ;src/main.c:114: init_enemies();
   20D3 CD A4 25      [17]  282 	call	_init_enemies
                            283 ;src/main.c:115: init_explosions();
   20D6 CD 8F 30      [17]  284 	call	_init_explosions
                            285 ;src/main.c:116: init_messages();
   20D9 C3 83 33      [10]  286 	jp    _init_messages
                            287 ;src/main.c:121: void initial_setup(){
                            288 ;	---------------------------------
                            289 ; Function initial_setup
                            290 ; ---------------------------------
   20DC                     291 _initial_setup::
                            292 ;src/main.c:122: cpct_disableFirmware();  // Disable firmware to prevent it from interfering
   20DC CD 43 55      [17]  293 	call	_cpct_disableFirmware
                            294 ;src/main.c:124: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   20DF 11 97 42      [10]  295 	ld	de,#_palette
   20E2 3E 10         [ 7]  296 	ld	a,#0x10
   20E4 F5            [11]  297 	push	af
   20E5 33            [ 6]  298 	inc	sp
   20E6 D5            [11]  299 	push	de
   20E7 CD 9C 53      [17]  300 	call	_cpct_fw2hw
   20EA F1            [10]  301 	pop	af
   20EB 33            [ 6]  302 	inc	sp
                            303 ;src/main.c:125: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   20EC 11 97 42      [10]  304 	ld	de,#_palette
   20EF 3E 10         [ 7]  305 	ld	a,#0x10
   20F1 F5            [11]  306 	push	af
   20F2 33            [ 6]  307 	inc	sp
   20F3 D5            [11]  308 	push	de
   20F4 CD BA 51      [17]  309 	call	_cpct_setPalette
   20F7 F1            [10]  310 	pop	af
   20F8 33            [ 6]  311 	inc	sp
                            312 ;src/main.c:126: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   20F9 3A 97 42      [13]  313 	ld	a, (#_palette + 0)
   20FC 57            [ 4]  314 	ld	d,a
   20FD 1E 10         [ 7]  315 	ld	e,#0x10
   20FF D5            [11]  316 	push	de
   2100 CD D0 52      [17]  317 	call	_cpct_setPALColour
   2103 F1            [10]  318 	pop	af
                            319 ;src/main.c:127: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   2104 AF            [ 4]  320 	xor	a, a
   2105 F5            [11]  321 	push	af
   2106 33            [ 6]  322 	inc	sp
   2107 CD 0F 55      [17]  323 	call	_cpct_setVideoMode
   210A 33            [ 6]  324 	inc	sp
                            325 ;src/main.c:130: clear_both_screens();
   210B CD 39 20      [17]  326 	call	_clear_both_screens
                            327 ;src/main.c:131: state=INITIAL_STATE;
   210E 21 79 62      [10]  328 	ld	hl,#_state + 0
   2111 36 02         [10]  329 	ld	(hl), #0x02
   2113 C9            [10]  330 	ret
                            331 ;src/main.c:134: void init_game(){
                            332 ;	---------------------------------
                            333 ; Function init_game
                            334 ; ---------------------------------
   2114                     335 _init_game::
                            336 ;src/main.c:136: }
   2114 C9            [10]  337 	ret
                            338 ;src/main.c:138: void init_level(){
                            339 ;	---------------------------------
                            340 ; Function init_level
                            341 ; ---------------------------------
   2115                     342 _init_level::
                            343 ;src/main.c:140: }
   2115 C9            [10]  344 	ret
                            345 ;src/main.c:142: u8 menu(){
                            346 ;	---------------------------------
                            347 ; Function menu
                            348 ; ---------------------------------
   2116                     349 _menu::
                            350 ;src/main.c:143: u8 choice=0;
   2116 0E 00         [ 7]  351 	ld	c,#0x00
                            352 ;src/main.c:145: clear_screen(SCR_VMEM);
   2118 C5            [11]  353 	push	bc
   2119 21 00 C0      [10]  354 	ld	hl,#0xC000
   211C E5            [11]  355 	push	hl
   211D CD 28 20      [17]  356 	call	_clear_screen
   2120 F1            [10]  357 	pop	af
   2121 CD 47 33      [17]  358 	call	_red_message
   2124 21 14 10      [10]  359 	ld	hl,#0x1014
   2127 E5            [11]  360 	push	hl
   2128 21 00 C0      [10]  361 	ld	hl,#0xC000
   212B E5            [11]  362 	push	hl
   212C CD 25 56      [17]  363 	call	_cpct_getScreenPtr
   212F C1            [10]  364 	pop	bc
   2130 11 00 22      [10]  365 	ld	de,#___str_2+0
   2133 C5            [11]  366 	push	bc
   2134 E5            [11]  367 	push	hl
   2135 D5            [11]  368 	push	de
   2136 CD 5F 4E      [17]  369 	call	_cpc_PrintGphStr2X
   2139 F1            [10]  370 	pop	af
   213A F1            [10]  371 	pop	af
   213B CD 65 33      [17]  372 	call	_blue_message
   213E 21 1C 40      [10]  373 	ld	hl,#0x401C
   2141 E5            [11]  374 	push	hl
   2142 21 00 C0      [10]  375 	ld	hl,#0xC000
   2145 E5            [11]  376 	push	hl
   2146 CD 25 56      [17]  377 	call	_cpct_getScreenPtr
   2149 C1            [10]  378 	pop	bc
   214A 11 15 22      [10]  379 	ld	de,#___str_3+0
   214D C5            [11]  380 	push	bc
   214E E5            [11]  381 	push	hl
   214F D5            [11]  382 	push	de
   2150 CD 6A 4E      [17]  383 	call	_cpc_PrintGphStr
   2153 F1            [10]  384 	pop	af
   2154 21 1C 50      [10]  385 	ld	hl, #0x501C
   2157 E3            [19]  386 	ex	(sp),hl
   2158 21 00 C0      [10]  387 	ld	hl,#0xC000
   215B E5            [11]  388 	push	hl
   215C CD 25 56      [17]  389 	call	_cpct_getScreenPtr
   215F C1            [10]  390 	pop	bc
   2160 11 1D 22      [10]  391 	ld	de,#___str_4+0
   2163 C5            [11]  392 	push	bc
   2164 E5            [11]  393 	push	hl
   2165 D5            [11]  394 	push	de
   2166 CD 6A 4E      [17]  395 	call	_cpc_PrintGphStr
   2169 F1            [10]  396 	pop	af
   216A 21 1C 60      [10]  397 	ld	hl, #0x601C
   216D E3            [19]  398 	ex	(sp),hl
   216E 21 00 C0      [10]  399 	ld	hl,#0xC000
   2171 E5            [11]  400 	push	hl
   2172 CD 25 56      [17]  401 	call	_cpct_getScreenPtr
   2175 C1            [10]  402 	pop	bc
   2176 11 25 22      [10]  403 	ld	de,#___str_5+0
   2179 C5            [11]  404 	push	bc
   217A E5            [11]  405 	push	hl
   217B D5            [11]  406 	push	de
   217C CD 6A 4E      [17]  407 	call	_cpc_PrintGphStr
   217F F1            [10]  408 	pop	af
   2180 21 1C 70      [10]  409 	ld	hl, #0x701C
   2183 E3            [19]  410 	ex	(sp),hl
   2184 21 00 C0      [10]  411 	ld	hl,#0xC000
   2187 E5            [11]  412 	push	hl
   2188 CD 25 56      [17]  413 	call	_cpct_getScreenPtr
   218B C1            [10]  414 	pop	bc
   218C 11 38 22      [10]  415 	ld	de,#___str_6+0
   218F C5            [11]  416 	push	bc
   2190 E5            [11]  417 	push	hl
   2191 D5            [11]  418 	push	de
   2192 CD 6A 4E      [17]  419 	call	_cpc_PrintGphStr
   2195 F1            [10]  420 	pop	af
   2196 F1            [10]  421 	pop	af
   2197 CD 47 33      [17]  422 	call	_red_message
   219A 21 14 A0      [10]  423 	ld	hl,#0xA014
   219D E5            [11]  424 	push	hl
   219E 21 00 C0      [10]  425 	ld	hl,#0xC000
   21A1 E5            [11]  426 	push	hl
   21A2 CD 25 56      [17]  427 	call	_cpct_getScreenPtr
   21A5 C1            [10]  428 	pop	bc
   21A6 11 42 22      [10]  429 	ld	de,#___str_7+0
   21A9 C5            [11]  430 	push	bc
   21AA E5            [11]  431 	push	hl
   21AB D5            [11]  432 	push	de
   21AC CD 6A 4E      [17]  433 	call	_cpc_PrintGphStr
   21AF F1            [10]  434 	pop	af
   21B0 F1            [10]  435 	pop	af
   21B1 C1            [10]  436 	pop	bc
                            437 ;src/main.c:157: while (choice==0) {
   21B2                     438 00109$:
   21B2 79            [ 4]  439 	ld	a,c
   21B3 B7            [ 4]  440 	or	a, a
   21B4 20 48         [12]  441 	jr	NZ,00111$
                            442 ;src/main.c:159: cpct_scanKeyboard_f();
   21B6 C5            [11]  443 	push	bc
   21B7 CD EF 51      [17]  444 	call	_cpct_scanKeyboard_f
   21BA 21 08 01      [10]  445 	ld	hl,#0x0108
   21BD E5            [11]  446 	push	hl
   21BE CD DE 51      [17]  447 	call	_cpct_isKeyPressed
   21C1 F1            [10]  448 	pop	af
   21C2 7D            [ 4]  449 	ld	a,l
   21C3 C1            [10]  450 	pop	bc
   21C4 B7            [ 4]  451 	or	a, a
   21C5 28 05         [12]  452 	jr	Z,00102$
                            453 ;src/main.c:162: init_game();
   21C7 CD 14 21      [17]  454 	call	_init_game
                            455 ;src/main.c:163: choice=STATE_GAME;
   21CA 0E 04         [ 7]  456 	ld	c,#0x04
   21CC                     457 00102$:
                            458 ;src/main.c:165: if (cpct_isKeyPressed(Key_2))    
   21CC C5            [11]  459 	push	bc
   21CD 21 08 02      [10]  460 	ld	hl,#0x0208
   21D0 E5            [11]  461 	push	hl
   21D1 CD DE 51      [17]  462 	call	_cpct_isKeyPressed
   21D4 F1            [10]  463 	pop	af
   21D5 7D            [ 4]  464 	ld	a,l
   21D6 C1            [10]  465 	pop	bc
   21D7 B7            [ 4]  466 	or	a, a
   21D8 28 02         [12]  467 	jr	Z,00104$
                            468 ;src/main.c:166: choice=STATE_HELP;
   21DA 0E 03         [ 7]  469 	ld	c,#0x03
   21DC                     470 00104$:
                            471 ;src/main.c:167: if (cpct_isKeyPressed(Key_3))    
   21DC C5            [11]  472 	push	bc
   21DD 21 07 02      [10]  473 	ld	hl,#0x0207
   21E0 E5            [11]  474 	push	hl
   21E1 CD DE 51      [17]  475 	call	_cpct_isKeyPressed
   21E4 F1            [10]  476 	pop	af
   21E5 7D            [ 4]  477 	ld	a,l
   21E6 C1            [10]  478 	pop	bc
   21E7 B7            [ 4]  479 	or	a, a
   21E8 28 02         [12]  480 	jr	Z,00106$
                            481 ;src/main.c:168: choice=STATE_REDEFINE;
   21EA 0E 09         [ 7]  482 	ld	c,#0x09
   21EC                     483 00106$:
                            484 ;src/main.c:169: if (cpct_isKeyPressed(Key_Esc)){    
   21EC C5            [11]  485 	push	bc
   21ED 21 08 04      [10]  486 	ld	hl,#0x0408
   21F0 E5            [11]  487 	push	hl
   21F1 CD DE 51      [17]  488 	call	_cpct_isKeyPressed
   21F4 F1            [10]  489 	pop	af
   21F5 7D            [ 4]  490 	ld	a,l
   21F6 C1            [10]  491 	pop	bc
   21F7 B7            [ 4]  492 	or	a, a
   21F8 28 B8         [12]  493 	jr	Z,00109$
                            494 ;src/main.c:170: choice=STATE_EXIT;
   21FA 0E 05         [ 7]  495 	ld	c,#0x05
   21FC 18 B4         [12]  496 	jr	00109$
   21FE                     497 00111$:
                            498 ;src/main.c:173: return choice; 
   21FE 69            [ 4]  499 	ld	l,c
   21FF C9            [10]  500 	ret
   2200                     501 ___str_2:
   2200 53 50 41 43 45 3B   502 	.ascii "SPACE;RETRO;INVADERS"
        52 45 54 52 4F 3B
        49 4E 56 41 44 45
        52 53
   2214 00                  503 	.db 0x00
   2215                     504 ___str_3:
   2215 31 3B 4A 55 47 41   505 	.ascii "1;JUGAR"
        52
   221C 00                  506 	.db 0x00
   221D                     507 ___str_4:
   221D 32 3B 41 59 55 44   508 	.ascii "2;AYUDA"
        41
   2224 00                  509 	.db 0x00
   2225                     510 ___str_5:
   2225 33 3B 52 45 44 45   511 	.ascii "3;REDEFINIR;TECLAS"
        46 49 4E 49 52 3B
        54 45 43 4C 41 53
   2237 00                  512 	.db 0x00
   2238                     513 ___str_6:
   2238 45 53 43 3B 53 41   514 	.ascii "ESC;SALIR"
        4C 49 52
   2241 00                  515 	.db 0x00
   2242                     516 ___str_7:
   2242 43 3B 32 30 31 35   517 	.ascii "C;2015;JOHN;LOBO"
        3B 4A 4F 48 4E 3B
        4C 4F 42 4F
   2252 00                  518 	.db 0x00
                            519 ;src/main.c:176: u8 redefine_keys(){
                            520 ;	---------------------------------
                            521 ; Function redefine_keys
                            522 ; ---------------------------------
   2253                     523 _redefine_keys::
                            524 ;src/main.c:178: return STATE_MENU;
   2253 2E 02         [ 7]  525 	ld	l,#0x02
   2255 C9            [10]  526 	ret
                            527 ;src/main.c:182: u8 level_up(){
                            528 ;	---------------------------------
                            529 ; Function level_up
                            530 ; ---------------------------------
   2256                     531 _level_up::
                            532 ;src/main.c:184: return STATE_MENU;
   2256 2E 02         [ 7]  533 	ld	l,#0x02
   2258 C9            [10]  534 	ret
                            535 ;src/main.c:188: u8 end(){
                            536 ;	---------------------------------
                            537 ; Function end
                            538 ; ---------------------------------
   2259                     539 _end::
                            540 ;src/main.c:190: return STATE_MENU;
   2259 2E 02         [ 7]  541 	ld	l,#0x02
   225B C9            [10]  542 	ret
                            543 ;src/main.c:194: u8 help(){
                            544 ;	---------------------------------
                            545 ; Function help
                            546 ; ---------------------------------
   225C                     547 _help::
                            548 ;src/main.c:196: return STATE_MENU;
   225C 2E 02         [ 7]  549 	ld	l,#0x02
   225E C9            [10]  550 	ret
                            551 ;src/main.c:200: u8 win(){
                            552 ;	---------------------------------
                            553 ; Function win
                            554 ; ---------------------------------
   225F                     555 _win::
                            556 ;src/main.c:202: return STATE_MENU;
   225F 2E 02         [ 7]  557 	ld	l,#0x02
   2261 C9            [10]  558 	ret
                            559 ;src/main.c:206: u8 game_over(){
                            560 ;	---------------------------------
                            561 ; Function game_over
                            562 ; ---------------------------------
   2262                     563 _game_over::
                            564 ;src/main.c:208: return STATE_LOSE;
   2262 2E 07         [ 7]  565 	ld	l,#0x07
   2264 C9            [10]  566 	ret
                            567 ;src/main.c:212: u8 game(){
                            568 ;	---------------------------------
                            569 ; Function game
                            570 ; ---------------------------------
   2265                     571 _game::
   2265 DD E5         [15]  572 	push	ix
   2267 DD 21 00 00   [14]  573 	ld	ix,#0
   226B DD 39         [15]  574 	add	ix,sp
   226D F5            [11]  575 	push	af
   226E F5            [11]  576 	push	af
                            577 ;src/main.c:214: timer_on();
   226F CD 1B 4E      [17]  578 	call	_timer_on
                            579 ;src/main.c:219: initialization(); 
   2272 CD BB 20      [17]  580 	call	_initialization
                            581 ;src/main.c:221: create_message(25,96,30,";VAMOS;AL;ATAQUE;");
   2275 21 87 23      [10]  582 	ld	hl,#___str_8
   2278 E5            [11]  583 	push	hl
   2279 21 60 1E      [10]  584 	ld	hl,#0x1E60
   227C E5            [11]  585 	push	hl
   227D 3E 19         [ 7]  586 	ld	a,#0x19
   227F F5            [11]  587 	push	af
   2280 33            [ 6]  588 	inc	sp
   2281 CD C4 33      [17]  589 	call	_create_message
   2284 F1            [10]  590 	pop	af
   2285 F1            [10]  591 	pop	af
   2286 33            [ 6]  592 	inc	sp
                            593 ;src/main.c:223: init_level();
   2287 CD 15 21      [17]  594 	call	_init_level
                            595 ;src/main.c:225: while(1)
   228A                     596 00111$:
                            597 ;src/main.c:232: if ((STARFIELD_ACTIVE) && (get_time()-get_last_moved_stars()>VELOCIDAD_ESTRELLAS)){
   228A CD 51 4E      [17]  598 	call	_get_time
   228D DD 72 FF      [19]  599 	ld	-1 (ix),d
   2290 DD 73 FE      [19]  600 	ld	-2 (ix),e
   2293 DD 74 FD      [19]  601 	ld	-3 (ix),h
   2296 DD 75 FC      [19]  602 	ld	-4 (ix),l
   2299 CD F8 4B      [17]  603 	call	_get_last_moved_stars
   229C DD 7E FC      [19]  604 	ld	a,-4 (ix)
   229F 95            [ 4]  605 	sub	a, l
   22A0 6F            [ 4]  606 	ld	l,a
   22A1 DD 7E FD      [19]  607 	ld	a,-3 (ix)
   22A4 9C            [ 4]  608 	sbc	a, h
   22A5 67            [ 4]  609 	ld	h,a
   22A6 DD 7E FE      [19]  610 	ld	a,-2 (ix)
   22A9 9B            [ 4]  611 	sbc	a, e
   22AA 5F            [ 4]  612 	ld	e,a
   22AB DD 7E FF      [19]  613 	ld	a,-1 (ix)
   22AE 9A            [ 4]  614 	sbc	a, d
   22AF 57            [ 4]  615 	ld	d,a
   22B0 3E 28         [ 7]  616 	ld	a,#0x28
   22B2 BD            [ 4]  617 	cp	a, l
   22B3 3E 00         [ 7]  618 	ld	a,#0x00
   22B5 9C            [ 4]  619 	sbc	a, h
   22B6 3E 00         [ 7]  620 	ld	a,#0x00
   22B8 9B            [ 4]  621 	sbc	a, e
   22B9 3E 00         [ 7]  622 	ld	a,#0x00
   22BB 9A            [ 4]  623 	sbc	a, d
   22BC 30 03         [12]  624 	jr	NC,00102$
                            625 ;src/main.c:233: update_stars();
   22BE CD 58 4D      [17]  626 	call	_update_stars
   22C1                     627 00102$:
                            628 ;src/main.c:236: update_explosions();
   22C1 CD 8A 31      [17]  629 	call	_update_explosions
                            630 ;src/main.c:238: if ((get_time()-get_last_moved_user())>get_user_speed()){
   22C4 CD 51 4E      [17]  631 	call	_get_time
   22C7 DD 72 FF      [19]  632 	ld	-1 (ix),d
   22CA DD 73 FE      [19]  633 	ld	-2 (ix),e
   22CD DD 74 FD      [19]  634 	ld	-3 (ix),h
   22D0 DD 75 FC      [19]  635 	ld	-4 (ix),l
   22D3 CD AA 39      [17]  636 	call	_get_last_moved_user
   22D6 DD 7E FC      [19]  637 	ld	a,-4 (ix)
   22D9 95            [ 4]  638 	sub	a, l
   22DA DD 77 FC      [19]  639 	ld	-4 (ix),a
   22DD DD 7E FD      [19]  640 	ld	a,-3 (ix)
   22E0 9C            [ 4]  641 	sbc	a, h
   22E1 DD 77 FD      [19]  642 	ld	-3 (ix),a
   22E4 DD 7E FE      [19]  643 	ld	a,-2 (ix)
   22E7 9B            [ 4]  644 	sbc	a, e
   22E8 DD 77 FE      [19]  645 	ld	-2 (ix),a
   22EB DD 7E FF      [19]  646 	ld	a,-1 (ix)
   22EE 9A            [ 4]  647 	sbc	a, d
   22EF DD 77 FF      [19]  648 	ld	-1 (ix),a
   22F2 CD B7 39      [17]  649 	call	_get_user_speed
   22F5 26 00         [ 7]  650 	ld	h,#0x00
   22F7 11 00 00      [10]  651 	ld	de,#0x0000
   22FA 7D            [ 4]  652 	ld	a,l
   22FB DD 96 FC      [19]  653 	sub	a, -4 (ix)
   22FE 7C            [ 4]  654 	ld	a,h
   22FF DD 9E FD      [19]  655 	sbc	a, -3 (ix)
   2302 7A            [ 4]  656 	ld	a,d
   2303 DD 9E FE      [19]  657 	sbc	a, -2 (ix)
   2306 7B            [ 4]  658 	ld	a,e
   2307 DD 9E FF      [19]  659 	sbc	a, -1 (ix)
   230A 30 03         [12]  660 	jr	NC,00105$
                            661 ;src/main.c:239: update_user();
   230C CD 07 3A      [17]  662 	call	_update_user
   230F                     663 00105$:
                            664 ;src/main.c:241: update_shoots();
   230F CD FC 36      [17]  665 	call	_update_shoots
                            666 ;src/main.c:242: update_enemies();
   2312 CD AC 29      [17]  667 	call	_update_enemies
                            668 ;src/main.c:248: clear_screen(pvmem);
   2315 2A 7B 62      [16]  669 	ld	hl,(_pvmem)
   2318 E5            [11]  670 	push	hl
   2319 CD 28 20      [17]  671 	call	_clear_screen
   231C F1            [10]  672 	pop	af
                            673 ;src/main.c:252: user_engine(pvmem);
   231D 2A 7B 62      [16]  674 	ld	hl,(_pvmem)
   2320 E5            [11]  675 	push	hl
   2321 CD BC 39      [17]  676 	call	_user_engine
   2324 F1            [10]  677 	pop	af
                            678 ;src/main.c:256: draw_stars(pvmem);
   2325 2A 7B 62      [16]  679 	ld	hl,(_pvmem)
   2328 E5            [11]  680 	push	hl
   2329 CD AB 4C      [17]  681 	call	_draw_stars
   232C F1            [10]  682 	pop	af
                            683 ;src/main.c:260: draw_user(pvmem);
   232D 2A 7B 62      [16]  684 	ld	hl,(_pvmem)
   2330 E5            [11]  685 	push	hl
   2331 CD DE 3C      [17]  686 	call	_draw_user
   2334 F1            [10]  687 	pop	af
                            688 ;src/main.c:261: draw_shoots(pvmem);
   2335 2A 7B 62      [16]  689 	ld	hl,(_pvmem)
   2338 E5            [11]  690 	push	hl
   2339 CD 14 38      [17]  691 	call	_draw_shoots
   233C F1            [10]  692 	pop	af
                            693 ;src/main.c:262: draw_enemies(pvmem);
   233D 2A 7B 62      [16]  694 	ld	hl,(_pvmem)
   2340 E5            [11]  695 	push	hl
   2341 CD 4B 2F      [17]  696 	call	_draw_enemies
   2344 F1            [10]  697 	pop	af
                            698 ;src/main.c:263: draw_explosions(pvmem);
   2345 2A 7B 62      [16]  699 	ld	hl,(_pvmem)
   2348 E5            [11]  700 	push	hl
   2349 CD 1F 32      [17]  701 	call	_draw_explosions
   234C F1            [10]  702 	pop	af
                            703 ;src/main.c:265: draw_messages(pvmem);
   234D 2A 7B 62      [16]  704 	ld	hl,(_pvmem)
   2350 E5            [11]  705 	push	hl
   2351 CD 11 34      [17]  706 	call	_draw_messages
   2354 F1            [10]  707 	pop	af
                            708 ;src/main.c:266: draw_scoreboard(pvmem);
   2355 2A 7B 62      [16]  709 	ld	hl,(_pvmem)
   2358 E5            [11]  710 	push	hl
   2359 CD 54 20      [17]  711 	call	_draw_scoreboard
                            712 ;src/main.c:274: if (cpct_isKeyPressed(Key_Esc)){     // ESC
   235C 21 08 04      [10]  713 	ld	hl, #0x0408
   235F E3            [19]  714 	ex	(sp),hl
   2360 CD DE 51      [17]  715 	call	_cpct_isKeyPressed
   2363 F1            [10]  716 	pop	af
   2364 7D            [ 4]  717 	ld	a,l
   2365 B7            [ 4]  718 	or	a, a
   2366 28 07         [12]  719 	jr	Z,00109$
                            720 ;src/main.c:275: state = STATE_MENU;
   2368 21 79 62      [10]  721 	ld	hl,#_state + 0
   236B 36 02         [10]  722 	ld	(hl), #0x02
                            723 ;src/main.c:276: break;
   236D 18 09         [12]  724 	jr	00112$
   236F                     725 00109$:
                            726 ;src/main.c:292: pvmem = changeVideoMemoryPage();
   236F CD 00 20      [17]  727 	call	_changeVideoMemoryPage
   2372 22 7B 62      [16]  728 	ld	(_pvmem),hl
   2375 C3 8A 22      [10]  729 	jp	00111$
   2378                     730 00112$:
                            731 ;src/main.c:301: timer_off();
   2378 CD 44 4E      [17]  732 	call	_timer_off
                            733 ;src/main.c:303: return state;
   237B FD 21 79 62   [14]  734 	ld	iy,#_state
   237F FD 6E 00      [19]  735 	ld	l,0 (iy)
   2382 DD F9         [10]  736 	ld	sp, ix
   2384 DD E1         [14]  737 	pop	ix
   2386 C9            [10]  738 	ret
   2387                     739 ___str_8:
   2387 3B 56 41 4D 4F 53   740 	.ascii ";VAMOS;AL;ATAQUE;"
        3B 41 4C 3B 41 54
        41 51 55 45 3B
   2398 00                  741 	.db 0x00
                            742 ;src/main.c:311: int main() {
                            743 ;	---------------------------------
                            744 ; Function main
                            745 ; ---------------------------------
   2399                     746 _main::
                            747 ;src/main.c:314: set_stack(0x1000);
   2399 21 00 10      [10]  748 	ld	hl,#0x1000
   239C E5            [11]  749 	push	hl
   239D CD 63 51      [17]  750 	call	_set_stack
   23A0 F1            [10]  751 	pop	af
                            752 ;src/main.c:316: initial_setup();
   23A1 CD DC 20      [17]  753 	call	_initial_setup
                            754 ;src/main.c:318: while (state != STATE_EXIT) {
   23A4                     755 00118$:
                            756 ;src/main.c:319: switch(state) {
   23A4 3A 79 62      [13]  757 	ld	a,(#_state + 0)
   23A7 FE 05         [ 7]  758 	cp	a,#0x05
   23A9 CA 61 24      [10]  759 	jp	Z,00120$
   23AC FE 02         [ 7]  760 	cp	a,#0x02
   23AE 28 19         [12]  761 	jr	Z,00101$
   23B0 FE 03         [ 7]  762 	cp	a,#0x03
   23B2 28 2D         [12]  763 	jr	Z,00103$
   23B4 FE 04         [ 7]  764 	cp	a,#0x04
   23B6 28 35         [12]  765 	jr	Z,00104$
   23B8 FE 06         [ 7]  766 	cp	a,#0x06
   23BA CA 3F 24      [10]  767 	jp	Z,00114$
   23BD FE 07         [ 7]  768 	cp	a,#0x07
   23BF CA 4C 24      [10]  769 	jp	Z,00115$
   23C2 D6 09         [ 7]  770 	sub	a, #0x09
   23C4 28 0F         [12]  771 	jr	Z,00102$
   23C6 C3 59 24      [10]  772 	jp	00116$
                            773 ;src/main.c:320: case STATE_MENU:
   23C9                     774 00101$:
                            775 ;src/main.c:321: state = menu();
   23C9 CD 16 21      [17]  776 	call	_menu
   23CC FD 21 79 62   [14]  777 	ld	iy,#_state
   23D0 FD 75 00      [19]  778 	ld	0 (iy),l
                            779 ;src/main.c:322: break;
   23D3 18 CF         [12]  780 	jr	00118$
                            781 ;src/main.c:324: case STATE_REDEFINE:
   23D5                     782 00102$:
                            783 ;src/main.c:325: state = redefine_keys();
   23D5 CD 53 22      [17]  784 	call	_redefine_keys
   23D8 FD 21 79 62   [14]  785 	ld	iy,#_state
   23DC FD 75 00      [19]  786 	ld	0 (iy),l
                            787 ;src/main.c:326: break;
   23DF 18 C3         [12]  788 	jr	00118$
                            789 ;src/main.c:328: case STATE_HELP:
   23E1                     790 00103$:
                            791 ;src/main.c:329: state = help();
   23E1 CD 5C 22      [17]  792 	call	_help
   23E4 FD 21 79 62   [14]  793 	ld	iy,#_state
   23E8 FD 75 00      [19]  794 	ld	0 (iy),l
                            795 ;src/main.c:330: break;
   23EB 18 B7         [12]  796 	jr	00118$
                            797 ;src/main.c:332: case STATE_GAME:
   23ED                     798 00104$:
                            799 ;src/main.c:333: level=1;
   23ED 21 A7 6B      [10]  800 	ld	hl,#_level + 0
   23F0 36 01         [10]  801 	ld	(hl), #0x01
                            802 ;src/main.c:334: user_init_level();
   23F2 CD 9A 39      [17]  803 	call	_user_init_level
                            804 ;src/main.c:336: set_score(0);
   23F5 21 00 00      [10]  805 	ld	hl,#0x0000
   23F8 E5            [11]  806 	push	hl
   23F9 21 00 00      [10]  807 	ld	hl,#0x0000
   23FC E5            [11]  808 	push	hl
   23FD CD 18 3D      [17]  809 	call	_set_score
   2400 F1            [10]  810 	pop	af
   2401 F1            [10]  811 	pop	af
                            812 ;src/main.c:338: while ((state!=STATE_LOSE) && (state!=STATE_WIN) && (state!=STATE_MENU)) {
   2402                     813 00111$:
   2402 3A 79 62      [13]  814 	ld	a,(#_state + 0)
   2405 FE 07         [ 7]  815 	cp	a,#0x07
   2407 28 9B         [12]  816 	jr	Z,00118$
   2409 FE 06         [ 7]  817 	cp	a,#0x06
   240B 28 97         [12]  818 	jr	Z,00118$
   240D D6 02         [ 7]  819 	sub	a, #0x02
   240F 28 93         [12]  820 	jr	Z,00118$
                            821 ;src/main.c:343: state = game();
   2411 CD 65 22      [17]  822 	call	_game
   2414 FD 21 79 62   [14]  823 	ld	iy,#_state
   2418 FD 75 00      [19]  824 	ld	0 (iy),l
                            825 ;src/main.c:349: if (state==STATE_LEVELUP)
   241B 3A 79 62      [13]  826 	ld	a,(#_state + 0)
   241E D6 08         [ 7]  827 	sub	a, #0x08
   2420 20 0A         [12]  828 	jr	NZ,00106$
                            829 ;src/main.c:350: state=level_up();
   2422 CD 56 22      [17]  830 	call	_level_up
   2425 FD 21 79 62   [14]  831 	ld	iy,#_state
   2429 FD 75 00      [19]  832 	ld	0 (iy),l
   242C                     833 00106$:
                            834 ;src/main.c:351: if (state==STATE_DEAD){
   242C 3A 79 62      [13]  835 	ld	a,(#_state + 0)
   242F D6 0B         [ 7]  836 	sub	a, #0x0B
   2431 20 CF         [12]  837 	jr	NZ,00111$
                            838 ;src/main.c:352: state=end();
   2433 CD 59 22      [17]  839 	call	_end
   2436 FD 21 79 62   [14]  840 	ld	iy,#_state
   243A FD 75 00      [19]  841 	ld	0 (iy),l
   243D 18 C3         [12]  842 	jr	00111$
                            843 ;src/main.c:357: case STATE_WIN:
   243F                     844 00114$:
                            845 ;src/main.c:358: state = win();
   243F CD 5F 22      [17]  846 	call	_win
   2442 FD 21 79 62   [14]  847 	ld	iy,#_state
   2446 FD 75 00      [19]  848 	ld	0 (iy),l
                            849 ;src/main.c:359: break;
   2449 C3 A4 23      [10]  850 	jp	00118$
                            851 ;src/main.c:361: case STATE_LOSE:
   244C                     852 00115$:
                            853 ;src/main.c:362: state = game_over();
   244C CD 62 22      [17]  854 	call	_game_over
   244F FD 21 79 62   [14]  855 	ld	iy,#_state
   2453 FD 75 00      [19]  856 	ld	0 (iy),l
                            857 ;src/main.c:363: break;
   2456 C3 A4 23      [10]  858 	jp	00118$
                            859 ;src/main.c:365: default:
   2459                     860 00116$:
                            861 ;src/main.c:366: state = STATE_EXIT;
   2459 21 79 62      [10]  862 	ld	hl,#_state + 0
   245C 36 05         [10]  863 	ld	(hl), #0x05
                            864 ;src/main.c:368: }
   245E C3 A4 23      [10]  865 	jp	00118$
   2461                     866 00120$:
                            867 ;src/main.c:376: return 0;  
   2461 21 00 00      [10]  868 	ld	hl,#0x0000
   2464 C9            [10]  869 	ret
                            870 	.area _CODE
                            871 	.area _INITIALIZER
   6D32                     872 __xinit__level:
   6D32 00                  873 	.db #0x00	; 0
                            874 	.area _CABS (ABS)
