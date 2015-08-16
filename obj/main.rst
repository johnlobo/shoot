                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 00:46:06 2015
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
   62DD                      87 _state::
   62DD                      88 	.ds 1
   62DE                      89 _previous_state::
   62DE                      90 	.ds 1
   62DF                      91 _pvmem::
   62DF                      92 	.ds 2
   62E1                      93 _aux_txt::
   62E1                      94 	.ds 40
   6309                      95 _changeVideoMemoryPage_page_1_89:
   6309                      96 	.ds 1
                             97 ;--------------------------------------------------------
                             98 ; ram data
                             99 ;--------------------------------------------------------
                            100 	.area _INITIALIZED
   6C0B                     101 _level::
   6C0B                     102 	.ds 1
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
   6D8E FD 21 09 63   [14]  115 	ld	iy,#_changeVideoMemoryPage_page_1_89
   6D92 FD 36 00 00   [19]  116 	ld	0 (iy),#0x00
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
   2000 3A 09 63      [13]  132 	ld	a,(#_changeVideoMemoryPage_page_1_89 + 0)
   2003 B7            [ 4]  133 	or	a, a
   2004 28 0E         [12]  134 	jr	Z,00102$
                            135 ;src/main.c:58: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
   2006 2E 30         [ 7]  136 	ld	l,#0x30
   2008 CD 6A 54      [17]  137 	call	_cpct_setVideoMemoryPage
                            138 ;src/main.c:59: page = 0;  
   200B 21 09 63      [10]  139 	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
   200E 36 00         [10]  140 	ld	(hl), #0x00
                            141 ;src/main.c:60: screen = SCR_BUFF;                            // Next page = 0
   2010 21 00 80      [10]  142 	ld	hl,#0x8000
   2013 C9            [10]  143 	ret
   2014                     144 00102$:
                            145 ;src/main.c:62: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
   2014 2E 20         [ 7]  146 	ld	l,#0x20
   2016 CD 6A 54      [17]  147 	call	_cpct_setVideoMemoryPage
                            148 ;src/main.c:63: page = 1;                              // Next page = 1
   2019 21 09 63      [10]  149 	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
   201C 36 01         [10]  150 	ld	(hl), #0x01
                            151 ;src/main.c:64: screen = SCR_VMEM;
   201E 21 00 C0      [10]  152 	ld	hl,#0xC000
                            153 ;src/main.c:66: return screen;
   2021 C9            [10]  154 	ret
                            155 ;src/main.c:73: void clear_screen(u8* screen){
                            156 ;	---------------------------------
                            157 ; Function clear_screen
                            158 ; ---------------------------------
   2022                     159 _clear_screen::
                            160 ;src/main.c:74: cpct_memset_f64(screen, 0x00, 0x4000);   
   2022 C1            [10]  161 	pop	bc
   2023 E1            [10]  162 	pop	hl
   2024 E5            [11]  163 	push	hl
   2025 C5            [11]  164 	push	bc
   2026 01 00 40      [10]  165 	ld	bc,#0x4000
   2029 C5            [11]  166 	push	bc
   202A 01 00 00      [10]  167 	ld	bc,#0x0000
   202D C5            [11]  168 	push	bc
   202E E5            [11]  169 	push	hl
   202F CD 73 54      [17]  170 	call	_cpct_memset_f64
   2032 C9            [10]  171 	ret
                            172 ;src/main.c:80: void clear_both_screens(){
                            173 ;	---------------------------------
                            174 ; Function clear_both_screens
                            175 ; ---------------------------------
   2033                     176 _clear_both_screens::
                            177 ;src/main.c:81: cpct_memset_f64(SCR_VMEM, 0x00, 0x4000);   
   2033 21 00 40      [10]  178 	ld	hl,#0x4000
   2036 E5            [11]  179 	push	hl
   2037 26 00         [ 7]  180 	ld	h, #0x00
   2039 E5            [11]  181 	push	hl
   203A 26 C0         [ 7]  182 	ld	h, #0xC0
   203C E5            [11]  183 	push	hl
   203D CD 73 54      [17]  184 	call	_cpct_memset_f64
                            185 ;src/main.c:82: cpct_memset_f64(SCR_BUFF, 0x00, 0x4000);   
   2040 21 00 40      [10]  186 	ld	hl,#0x4000
   2043 E5            [11]  187 	push	hl
   2044 26 00         [ 7]  188 	ld	h, #0x00
   2046 E5            [11]  189 	push	hl
   2047 26 80         [ 7]  190 	ld	h, #0x80
   2049 E5            [11]  191 	push	hl
   204A CD 73 54      [17]  192 	call	_cpct_memset_f64
   204D C9            [10]  193 	ret
                            194 ;src/main.c:89: void draw_scoreboard(u8* screen){
                            195 ;	---------------------------------
                            196 ; Function draw_scoreboard
                            197 ; ---------------------------------
   204E                     198 _draw_scoreboard::
   204E DD E5         [15]  199 	push	ix
   2050 DD 21 00 00   [14]  200 	ld	ix,#0
   2054 DD 39         [15]  201 	add	ix,sp
                            202 ;src/main.c:90: sprintf(aux_txt,"%08d",get_score());
   2056 CD D8 3D      [17]  203 	call	_get_score
   2059 D5            [11]  204 	push	de
   205A E5            [11]  205 	push	hl
   205B 21 A7 20      [10]  206 	ld	hl,#___str_0
   205E E5            [11]  207 	push	hl
   205F 21 E1 62      [10]  208 	ld	hl,#_aux_txt
   2062 E5            [11]  209 	push	hl
   2063 CD 10 55      [17]  210 	call	_sprintf
   2066 21 08 00      [10]  211 	ld	hl,#8
   2069 39            [11]  212 	add	hl,sp
   206A F9            [ 6]  213 	ld	sp,hl
                            214 ;src/main.c:91: colour_message(0, 2);
   206B 21 00 02      [10]  215 	ld	hl,#0x0200
   206E E5            [11]  216 	push	hl
   206F CD 0F 33      [17]  217 	call	_colour_message
   2072 F1            [10]  218 	pop	af
                            219 ;src/main.c:92: cpc_PrintGphStr(aux_txt,(int) cpct_getScreenPtr(screen, 4, 8));
   2073 DD 5E 04      [19]  220 	ld	e,4 (ix)
   2076 DD 56 05      [19]  221 	ld	d,5 (ix)
   2079 D5            [11]  222 	push	de
   207A 21 04 08      [10]  223 	ld	hl,#0x0804
   207D E5            [11]  224 	push	hl
   207E D5            [11]  225 	push	de
   207F CD 89 56      [17]  226 	call	_cpct_getScreenPtr
   2082 D1            [10]  227 	pop	de
   2083 01 E1 62      [10]  228 	ld	bc,#_aux_txt
   2086 D5            [11]  229 	push	de
   2087 E5            [11]  230 	push	hl
   2088 C5            [11]  231 	push	bc
   2089 CD DC 4E      [17]  232 	call	_cpc_PrintGphStr
   208C F1            [10]  233 	pop	af
   208D F1            [10]  234 	pop	af
   208E CD 42 33      [17]  235 	call	_red_message
   2091 D1            [10]  236 	pop	de
                            237 ;src/main.c:94: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
   2092 21 3C 08      [10]  238 	ld	hl,#0x083C
   2095 E5            [11]  239 	push	hl
   2096 D5            [11]  240 	push	de
   2097 CD 89 56      [17]  241 	call	_cpct_getScreenPtr
   209A 11 AC 20      [10]  242 	ld	de,#___str_1+0
   209D E5            [11]  243 	push	hl
   209E D5            [11]  244 	push	de
   209F CD DC 4E      [17]  245 	call	_cpc_PrintGphStr
   20A2 F1            [10]  246 	pop	af
   20A3 F1            [10]  247 	pop	af
   20A4 DD E1         [14]  248 	pop	ix
   20A6 C9            [10]  249 	ret
   20A7                     250 ___str_0:
   20A7 25 30 38 64         251 	.ascii "%08d"
   20AB 00                  252 	.db 0x00
   20AC                     253 ___str_1:
   20AC 30 30 30 30 30 30   254 	.ascii "00000000"
        30 30
   20B4 00                  255 	.db 0x00
                            256 ;src/main.c:101: void initialization(){
                            257 ;	---------------------------------
                            258 ; Function initialization
                            259 ; ---------------------------------
   20B5                     260 _initialization::
                            261 ;src/main.c:103: pvmem = SCR_BUFF;
   20B5 21 00 80      [10]  262 	ld	hl,#0x8000
   20B8 22 DF 62      [16]  263 	ld	(_pvmem),hl
                            264 ;src/main.c:105: clear_both_screens();
   20BB CD 33 20      [17]  265 	call	_clear_both_screens
                            266 ;src/main.c:107: cpct_setRandomSeedUniform_u8((u8) get_time());
   20BE CD C3 4E      [17]  267 	call	_get_time
   20C1 CD 27 52      [17]  268 	call	_cpct_setRandomSeedUniform_u8
                            269 ;src/main.c:110: init_stars();
   20C4 CD 87 4C      [17]  270 	call	_init_stars
                            271 ;src/main.c:112: init_user();
   20C7 CD A1 39      [17]  272 	call	_init_user
                            273 ;src/main.c:113: init_shoots();
   20CA CD F2 35      [17]  274 	call	_init_shoots
                            275 ;src/main.c:114: init_enemies();
   20CD CD 97 25      [17]  276 	call	_init_enemies
                            277 ;src/main.c:115: init_explosions();
   20D0 CD 82 30      [17]  278 	call	_init_explosions
                            279 ;src/main.c:116: init_messages();
   20D3 C3 7E 33      [10]  280 	jp  _init_messages
                            281 ;src/main.c:121: void initial_setup(){
                            282 ;	---------------------------------
                            283 ; Function initial_setup
                            284 ; ---------------------------------
   20D6                     285 _initial_setup::
                            286 ;src/main.c:122: cpct_disableFirmware();  // Disable firmware to prevent it from interfering
   20D6 CD A7 55      [17]  287 	call	_cpct_disableFirmware
                            288 ;src/main.c:124: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
   20D9 11 09 43      [10]  289 	ld	de,#_palette
   20DC 3E 10         [ 7]  290 	ld	a,#0x10
   20DE F5            [11]  291 	push	af
   20DF 33            [ 6]  292 	inc	sp
   20E0 D5            [11]  293 	push	de
   20E1 CD 05 54      [17]  294 	call	_cpct_fw2hw
   20E4 F1            [10]  295 	pop	af
   20E5 33            [ 6]  296 	inc	sp
                            297 ;src/main.c:125: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
   20E6 11 09 43      [10]  298 	ld	de,#_palette
   20E9 3E 10         [ 7]  299 	ld	a,#0x10
   20EB F5            [11]  300 	push	af
   20EC 33            [ 6]  301 	inc	sp
   20ED D5            [11]  302 	push	de
   20EE CD 2C 52      [17]  303 	call	_cpct_setPalette
   20F1 F1            [10]  304 	pop	af
   20F2 33            [ 6]  305 	inc	sp
                            306 ;src/main.c:126: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
   20F3 3A 09 43      [13]  307 	ld	a, (#_palette + 0)
   20F6 57            [ 4]  308 	ld	d,a
   20F7 1E 10         [ 7]  309 	ld	e,#0x10
   20F9 D5            [11]  310 	push	de
   20FA CD 3D 53      [17]  311 	call	_cpct_setPALColour
                            312 ;src/main.c:127: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
   20FD AF            [ 4]  313 	xor	a, a
   20FE F5            [11]  314 	push	af
   20FF 33            [ 6]  315 	inc	sp
   2100 CD 73 55      [17]  316 	call	_cpct_setVideoMode
   2103 33            [ 6]  317 	inc	sp
                            318 ;src/main.c:130: clear_both_screens();
   2104 CD 33 20      [17]  319 	call	_clear_both_screens
                            320 ;src/main.c:131: state=INITIAL_STATE;
   2107 21 DD 62      [10]  321 	ld	hl,#_state + 0
   210A 36 02         [10]  322 	ld	(hl), #0x02
   210C C9            [10]  323 	ret
                            324 ;src/main.c:134: void init_game(){
                            325 ;	---------------------------------
                            326 ; Function init_game
                            327 ; ---------------------------------
   210D                     328 _init_game::
                            329 ;src/main.c:136: }
   210D C9            [10]  330 	ret
                            331 ;src/main.c:138: void init_level(){
                            332 ;	---------------------------------
                            333 ; Function init_level
                            334 ; ---------------------------------
   210E                     335 _init_level::
                            336 ;src/main.c:140: }
   210E C9            [10]  337 	ret
                            338 ;src/main.c:142: u8 menu(){
                            339 ;	---------------------------------
                            340 ; Function menu
                            341 ; ---------------------------------
   210F                     342 _menu::
                            343 ;src/main.c:143: u8 choice=0;
   210F 0E 00         [ 7]  344 	ld	c,#0x00
                            345 ;src/main.c:145: clear_screen(SCR_VMEM);
   2111 C5            [11]  346 	push	bc
   2112 21 00 C0      [10]  347 	ld	hl,#0xC000
   2115 E5            [11]  348 	push	hl
   2116 CD 22 20      [17]  349 	call	_clear_screen
   2119 F1            [10]  350 	pop	af
   211A CD 42 33      [17]  351 	call	_red_message
   211D 21 14 10      [10]  352 	ld	hl,#0x1014
   2120 E5            [11]  353 	push	hl
   2121 21 00 C0      [10]  354 	ld	hl,#0xC000
   2124 E5            [11]  355 	push	hl
   2125 CD 89 56      [17]  356 	call	_cpct_getScreenPtr
   2128 C1            [10]  357 	pop	bc
   2129 11 F1 21      [10]  358 	ld	de,#___str_2+0
   212C C5            [11]  359 	push	bc
   212D E5            [11]  360 	push	hl
   212E D5            [11]  361 	push	de
   212F CD D1 4E      [17]  362 	call	_cpc_PrintGphStr2X
   2132 F1            [10]  363 	pop	af
   2133 F1            [10]  364 	pop	af
   2134 CD 60 33      [17]  365 	call	_blue_message
   2137 21 1C 40      [10]  366 	ld	hl,#0x401C
   213A E5            [11]  367 	push	hl
   213B 21 00 C0      [10]  368 	ld	hl,#0xC000
   213E E5            [11]  369 	push	hl
   213F CD 89 56      [17]  370 	call	_cpct_getScreenPtr
   2142 C1            [10]  371 	pop	bc
   2143 11 06 22      [10]  372 	ld	de,#___str_3+0
   2146 C5            [11]  373 	push	bc
   2147 E5            [11]  374 	push	hl
   2148 D5            [11]  375 	push	de
   2149 CD DC 4E      [17]  376 	call	_cpc_PrintGphStr
   214C F1            [10]  377 	pop	af
   214D 21 1C 50      [10]  378 	ld	hl, #0x501C
   2150 E3            [19]  379 	ex	(sp),hl
   2151 21 00 C0      [10]  380 	ld	hl,#0xC000
   2154 E5            [11]  381 	push	hl
   2155 CD 89 56      [17]  382 	call	_cpct_getScreenPtr
   2158 C1            [10]  383 	pop	bc
   2159 11 0E 22      [10]  384 	ld	de,#___str_4+0
   215C C5            [11]  385 	push	bc
   215D E5            [11]  386 	push	hl
   215E D5            [11]  387 	push	de
   215F CD DC 4E      [17]  388 	call	_cpc_PrintGphStr
   2162 F1            [10]  389 	pop	af
   2163 21 1C 60      [10]  390 	ld	hl, #0x601C
   2166 E3            [19]  391 	ex	(sp),hl
   2167 21 00 C0      [10]  392 	ld	hl,#0xC000
   216A E5            [11]  393 	push	hl
   216B CD 89 56      [17]  394 	call	_cpct_getScreenPtr
   216E C1            [10]  395 	pop	bc
   216F 11 16 22      [10]  396 	ld	de,#___str_5+0
   2172 C5            [11]  397 	push	bc
   2173 E5            [11]  398 	push	hl
   2174 D5            [11]  399 	push	de
   2175 CD DC 4E      [17]  400 	call	_cpc_PrintGphStr
   2178 F1            [10]  401 	pop	af
   2179 21 1C 70      [10]  402 	ld	hl, #0x701C
   217C E3            [19]  403 	ex	(sp),hl
   217D 21 00 C0      [10]  404 	ld	hl,#0xC000
   2180 E5            [11]  405 	push	hl
   2181 CD 89 56      [17]  406 	call	_cpct_getScreenPtr
   2184 C1            [10]  407 	pop	bc
   2185 11 29 22      [10]  408 	ld	de,#___str_6+0
   2188 C5            [11]  409 	push	bc
   2189 E5            [11]  410 	push	hl
   218A D5            [11]  411 	push	de
   218B CD DC 4E      [17]  412 	call	_cpc_PrintGphStr
   218E F1            [10]  413 	pop	af
   218F F1            [10]  414 	pop	af
   2190 CD 42 33      [17]  415 	call	_red_message
   2193 21 14 A0      [10]  416 	ld	hl,#0xA014
   2196 E5            [11]  417 	push	hl
   2197 21 00 C0      [10]  418 	ld	hl,#0xC000
   219A E5            [11]  419 	push	hl
   219B CD 89 56      [17]  420 	call	_cpct_getScreenPtr
   219E C1            [10]  421 	pop	bc
   219F 11 33 22      [10]  422 	ld	de,#___str_7+0
   21A2 C5            [11]  423 	push	bc
   21A3 E5            [11]  424 	push	hl
   21A4 D5            [11]  425 	push	de
   21A5 CD DC 4E      [17]  426 	call	_cpc_PrintGphStr
   21A8 F1            [10]  427 	pop	af
   21A9 F1            [10]  428 	pop	af
   21AA C1            [10]  429 	pop	bc
                            430 ;src/main.c:157: while (choice==0) {
   21AB                     431 00109$:
   21AB 79            [ 4]  432 	ld	a,c
   21AC B7            [ 4]  433 	or	a, a
   21AD 20 40         [12]  434 	jr	NZ,00111$
                            435 ;src/main.c:159: cpct_scanKeyboard_f();
   21AF C5            [11]  436 	push	bc
   21B0 CD 5C 52      [17]  437 	call	_cpct_scanKeyboard_f
   21B3 21 08 01      [10]  438 	ld	hl,#0x0108
   21B6 CD 50 52      [17]  439 	call	_cpct_isKeyPressed
   21B9 7D            [ 4]  440 	ld	a,l
   21BA C1            [10]  441 	pop	bc
   21BB B7            [ 4]  442 	or	a, a
   21BC 28 05         [12]  443 	jr	Z,00102$
                            444 ;src/main.c:162: init_game();
   21BE CD 0D 21      [17]  445 	call	_init_game
                            446 ;src/main.c:163: choice=STATE_GAME;
   21C1 0E 04         [ 7]  447 	ld	c,#0x04
   21C3                     448 00102$:
                            449 ;src/main.c:165: if (cpct_isKeyPressed(Key_2))    
   21C3 C5            [11]  450 	push	bc
   21C4 21 08 02      [10]  451 	ld	hl,#0x0208
   21C7 CD 50 52      [17]  452 	call	_cpct_isKeyPressed
   21CA 7D            [ 4]  453 	ld	a,l
   21CB C1            [10]  454 	pop	bc
   21CC B7            [ 4]  455 	or	a, a
   21CD 28 02         [12]  456 	jr	Z,00104$
                            457 ;src/main.c:166: choice=STATE_HELP;
   21CF 0E 03         [ 7]  458 	ld	c,#0x03
   21D1                     459 00104$:
                            460 ;src/main.c:167: if (cpct_isKeyPressed(Key_3))    
   21D1 C5            [11]  461 	push	bc
   21D2 21 07 02      [10]  462 	ld	hl,#0x0207
   21D5 CD 50 52      [17]  463 	call	_cpct_isKeyPressed
   21D8 7D            [ 4]  464 	ld	a,l
   21D9 C1            [10]  465 	pop	bc
   21DA B7            [ 4]  466 	or	a, a
   21DB 28 02         [12]  467 	jr	Z,00106$
                            468 ;src/main.c:168: choice=STATE_REDEFINE;
   21DD 0E 09         [ 7]  469 	ld	c,#0x09
   21DF                     470 00106$:
                            471 ;src/main.c:169: if (cpct_isKeyPressed(Key_Esc)){    
   21DF C5            [11]  472 	push	bc
   21E0 21 08 04      [10]  473 	ld	hl,#0x0408
   21E3 CD 50 52      [17]  474 	call	_cpct_isKeyPressed
   21E6 7D            [ 4]  475 	ld	a,l
   21E7 C1            [10]  476 	pop	bc
   21E8 B7            [ 4]  477 	or	a, a
   21E9 28 C0         [12]  478 	jr	Z,00109$
                            479 ;src/main.c:170: choice=STATE_EXIT;
   21EB 0E 05         [ 7]  480 	ld	c,#0x05
   21ED 18 BC         [12]  481 	jr	00109$
   21EF                     482 00111$:
                            483 ;src/main.c:173: return choice; 
   21EF 69            [ 4]  484 	ld	l,c
   21F0 C9            [10]  485 	ret
   21F1                     486 ___str_2:
   21F1 53 50 41 43 45 3B   487 	.ascii "SPACE;RETRO;INVADERS"
        52 45 54 52 4F 3B
        49 4E 56 41 44 45
        52 53
   2205 00                  488 	.db 0x00
   2206                     489 ___str_3:
   2206 31 3B 4A 55 47 41   490 	.ascii "1;JUGAR"
        52
   220D 00                  491 	.db 0x00
   220E                     492 ___str_4:
   220E 32 3B 41 59 55 44   493 	.ascii "2;AYUDA"
        41
   2215 00                  494 	.db 0x00
   2216                     495 ___str_5:
   2216 33 3B 52 45 44 45   496 	.ascii "3;REDEFINIR;TECLAS"
        46 49 4E 49 52 3B
        54 45 43 4C 41 53
   2228 00                  497 	.db 0x00
   2229                     498 ___str_6:
   2229 45 53 43 3B 53 41   499 	.ascii "ESC;SALIR"
        4C 49 52
   2232 00                  500 	.db 0x00
   2233                     501 ___str_7:
   2233 43 3B 32 30 31 35   502 	.ascii "C;2015;JOHN;LOBO"
        3B 4A 4F 48 4E 3B
        4C 4F 42 4F
   2243 00                  503 	.db 0x00
                            504 ;src/main.c:176: u8 redefine_keys(){
                            505 ;	---------------------------------
                            506 ; Function redefine_keys
                            507 ; ---------------------------------
   2244                     508 _redefine_keys::
                            509 ;src/main.c:178: return STATE_MENU;
   2244 2E 02         [ 7]  510 	ld	l,#0x02
   2246 C9            [10]  511 	ret
                            512 ;src/main.c:182: u8 level_up(){
                            513 ;	---------------------------------
                            514 ; Function level_up
                            515 ; ---------------------------------
   2247                     516 _level_up::
                            517 ;src/main.c:184: return STATE_MENU;
   2247 2E 02         [ 7]  518 	ld	l,#0x02
   2249 C9            [10]  519 	ret
                            520 ;src/main.c:188: u8 end(){
                            521 ;	---------------------------------
                            522 ; Function end
                            523 ; ---------------------------------
   224A                     524 _end::
                            525 ;src/main.c:190: return STATE_MENU;
   224A 2E 02         [ 7]  526 	ld	l,#0x02
   224C C9            [10]  527 	ret
                            528 ;src/main.c:194: u8 help(){
                            529 ;	---------------------------------
                            530 ; Function help
                            531 ; ---------------------------------
   224D                     532 _help::
                            533 ;src/main.c:196: return STATE_MENU;
   224D 2E 02         [ 7]  534 	ld	l,#0x02
   224F C9            [10]  535 	ret
                            536 ;src/main.c:200: u8 win(){
                            537 ;	---------------------------------
                            538 ; Function win
                            539 ; ---------------------------------
   2250                     540 _win::
                            541 ;src/main.c:202: return STATE_MENU;
   2250 2E 02         [ 7]  542 	ld	l,#0x02
   2252 C9            [10]  543 	ret
                            544 ;src/main.c:206: u8 game_over(){
                            545 ;	---------------------------------
                            546 ; Function game_over
                            547 ; ---------------------------------
   2253                     548 _game_over::
                            549 ;src/main.c:208: return STATE_LOSE;
   2253 2E 07         [ 7]  550 	ld	l,#0x07
   2255 C9            [10]  551 	ret
                            552 ;src/main.c:212: u8 game(){
                            553 ;	---------------------------------
                            554 ; Function game
                            555 ; ---------------------------------
   2256                     556 _game::
   2256 DD E5         [15]  557 	push	ix
   2258 DD 21 00 00   [14]  558 	ld	ix,#0
   225C DD 39         [15]  559 	add	ix,sp
   225E F5            [11]  560 	push	af
   225F F5            [11]  561 	push	af
                            562 ;src/main.c:214: timer_on();
   2260 CD 8D 4E      [17]  563 	call	_timer_on
                            564 ;src/main.c:219: initialization(); 
   2263 CD B5 20      [17]  565 	call	_initialization
                            566 ;src/main.c:221: create_message(25,96,30,";VAMOS;AL;ATAQUE;");
   2266 21 7A 23      [10]  567 	ld	hl,#___str_8
   2269 E5            [11]  568 	push	hl
   226A 21 60 1E      [10]  569 	ld	hl,#0x1E60
   226D E5            [11]  570 	push	hl
   226E 3E 19         [ 7]  571 	ld	a,#0x19
   2270 F5            [11]  572 	push	af
   2271 33            [ 6]  573 	inc	sp
   2272 CD BF 33      [17]  574 	call	_create_message
   2275 F1            [10]  575 	pop	af
   2276 F1            [10]  576 	pop	af
   2277 33            [ 6]  577 	inc	sp
                            578 ;src/main.c:223: init_level();
   2278 CD 0E 21      [17]  579 	call	_init_level
                            580 ;src/main.c:225: while(1)
   227B                     581 00111$:
                            582 ;src/main.c:232: if ((STARFIELD_ACTIVE) && (get_time()-get_last_moved_stars()>VELOCIDAD_ESTRELLAS)){
   227B CD C3 4E      [17]  583 	call	_get_time
   227E DD 72 FF      [19]  584 	ld	-1 (ix),d
   2281 DD 73 FE      [19]  585 	ld	-2 (ix),e
   2284 DD 74 FD      [19]  586 	ld	-3 (ix),h
   2287 DD 75 FC      [19]  587 	ld	-4 (ix),l
   228A CD 6A 4C      [17]  588 	call	_get_last_moved_stars
   228D DD 7E FC      [19]  589 	ld	a,-4 (ix)
   2290 95            [ 4]  590 	sub	a, l
   2291 6F            [ 4]  591 	ld	l,a
   2292 DD 7E FD      [19]  592 	ld	a,-3 (ix)
   2295 9C            [ 4]  593 	sbc	a, h
   2296 67            [ 4]  594 	ld	h,a
   2297 DD 7E FE      [19]  595 	ld	a,-2 (ix)
   229A 9B            [ 4]  596 	sbc	a, e
   229B 5F            [ 4]  597 	ld	e,a
   229C DD 7E FF      [19]  598 	ld	a,-1 (ix)
   229F 9A            [ 4]  599 	sbc	a, d
   22A0 57            [ 4]  600 	ld	d,a
   22A1 3E 28         [ 7]  601 	ld	a,#0x28
   22A3 BD            [ 4]  602 	cp	a, l
   22A4 3E 00         [ 7]  603 	ld	a,#0x00
   22A6 9C            [ 4]  604 	sbc	a, h
   22A7 3E 00         [ 7]  605 	ld	a,#0x00
   22A9 9B            [ 4]  606 	sbc	a, e
   22AA 3E 00         [ 7]  607 	ld	a,#0x00
   22AC 9A            [ 4]  608 	sbc	a, d
   22AD 30 03         [12]  609 	jr	NC,00102$
                            610 ;src/main.c:233: update_stars();
   22AF CD CA 4D      [17]  611 	call	_update_stars
   22B2                     612 00102$:
                            613 ;src/main.c:236: update_explosions();
   22B2 CD 7D 31      [17]  614 	call	_update_explosions
                            615 ;src/main.c:238: if ((get_time()-get_last_moved_user())>get_user_speed()){
   22B5 CD C3 4E      [17]  616 	call	_get_time
   22B8 DD 72 FF      [19]  617 	ld	-1 (ix),d
   22BB DD 73 FE      [19]  618 	ld	-2 (ix),e
   22BE DD 74 FD      [19]  619 	ld	-3 (ix),h
   22C1 DD 75 FC      [19]  620 	ld	-4 (ix),l
   22C4 CD 2C 3A      [17]  621 	call	_get_last_moved_user
   22C7 DD 7E FC      [19]  622 	ld	a,-4 (ix)
   22CA 95            [ 4]  623 	sub	a, l
   22CB DD 77 FC      [19]  624 	ld	-4 (ix),a
   22CE DD 7E FD      [19]  625 	ld	a,-3 (ix)
   22D1 9C            [ 4]  626 	sbc	a, h
   22D2 DD 77 FD      [19]  627 	ld	-3 (ix),a
   22D5 DD 7E FE      [19]  628 	ld	a,-2 (ix)
   22D8 9B            [ 4]  629 	sbc	a, e
   22D9 DD 77 FE      [19]  630 	ld	-2 (ix),a
   22DC DD 7E FF      [19]  631 	ld	a,-1 (ix)
   22DF 9A            [ 4]  632 	sbc	a, d
   22E0 DD 77 FF      [19]  633 	ld	-1 (ix),a
   22E3 CD 39 3A      [17]  634 	call	_get_user_speed
   22E6 26 00         [ 7]  635 	ld	h,#0x00
   22E8 11 00 00      [10]  636 	ld	de,#0x0000
   22EB 7D            [ 4]  637 	ld	a,l
   22EC DD 96 FC      [19]  638 	sub	a, -4 (ix)
   22EF 7C            [ 4]  639 	ld	a,h
   22F0 DD 9E FD      [19]  640 	sbc	a, -3 (ix)
   22F3 7A            [ 4]  641 	ld	a,d
   22F4 DD 9E FE      [19]  642 	sbc	a, -2 (ix)
   22F7 7B            [ 4]  643 	ld	a,e
   22F8 DD 9E FF      [19]  644 	sbc	a, -1 (ix)
   22FB 30 03         [12]  645 	jr	NC,00105$
                            646 ;src/main.c:239: update_user();
   22FD CD 89 3A      [17]  647 	call	_update_user
   2300                     648 00105$:
                            649 ;src/main.c:241: update_shoots();
   2300 CD 6C 37      [17]  650 	call	_update_shoots
                            651 ;src/main.c:242: update_enemies();
   2303 CD 9F 29      [17]  652 	call	_update_enemies
                            653 ;src/main.c:248: clear_screen(pvmem);
   2306 2A DF 62      [16]  654 	ld	hl,(_pvmem)
   2309 E5            [11]  655 	push	hl
   230A CD 22 20      [17]  656 	call	_clear_screen
   230D F1            [10]  657 	pop	af
                            658 ;src/main.c:252: user_engine(pvmem);
   230E 2A DF 62      [16]  659 	ld	hl,(_pvmem)
   2311 E5            [11]  660 	push	hl
   2312 CD 3E 3A      [17]  661 	call	_user_engine
   2315 F1            [10]  662 	pop	af
                            663 ;src/main.c:256: draw_stars(pvmem);
   2316 2A DF 62      [16]  664 	ld	hl,(_pvmem)
   2319 E5            [11]  665 	push	hl
   231A CD 1D 4D      [17]  666 	call	_draw_stars
   231D F1            [10]  667 	pop	af
                            668 ;src/main.c:260: draw_user(pvmem);
   231E 2A DF 62      [16]  669 	ld	hl,(_pvmem)
   2321 E5            [11]  670 	push	hl
   2322 CD 50 3D      [17]  671 	call	_draw_user
   2325 F1            [10]  672 	pop	af
                            673 ;src/main.c:261: draw_shoots(pvmem);
   2326 2A DF 62      [16]  674 	ld	hl,(_pvmem)
   2329 E5            [11]  675 	push	hl
   232A CD 93 38      [17]  676 	call	_draw_shoots
   232D F1            [10]  677 	pop	af
                            678 ;src/main.c:262: draw_enemies(pvmem);
   232E 2A DF 62      [16]  679 	ld	hl,(_pvmem)
   2331 E5            [11]  680 	push	hl
   2332 CD 3E 2F      [17]  681 	call	_draw_enemies
   2335 F1            [10]  682 	pop	af
                            683 ;src/main.c:263: draw_explosions(pvmem);
   2336 2A DF 62      [16]  684 	ld	hl,(_pvmem)
   2339 E5            [11]  685 	push	hl
   233A CD 1A 32      [17]  686 	call	_draw_explosions
   233D F1            [10]  687 	pop	af
                            688 ;src/main.c:265: draw_messages(pvmem);
   233E 2A DF 62      [16]  689 	ld	hl,(_pvmem)
   2341 E5            [11]  690 	push	hl
   2342 CD 0C 34      [17]  691 	call	_draw_messages
   2345 F1            [10]  692 	pop	af
                            693 ;src/main.c:266: draw_scoreboard(pvmem);
   2346 2A DF 62      [16]  694 	ld	hl,(_pvmem)
   2349 E5            [11]  695 	push	hl
   234A CD 4E 20      [17]  696 	call	_draw_scoreboard
   234D F1            [10]  697 	pop	af
                            698 ;src/main.c:274: if (cpct_isKeyPressed(Key_Esc)){     // ESC
   234E 21 08 04      [10]  699 	ld	hl,#0x0408
   2351 CD 50 52      [17]  700 	call	_cpct_isKeyPressed
   2354 7D            [ 4]  701 	ld	a,l
   2355 B7            [ 4]  702 	or	a, a
   2356 28 0A         [12]  703 	jr	Z,00109$
                            704 ;src/main.c:275: state = STATE_MENU;
   2358 FD 21 DD 62   [14]  705 	ld	iy,#_state
   235C FD 36 00 02   [19]  706 	ld	0 (iy),#0x02
                            707 ;src/main.c:276: break;
   2360 18 09         [12]  708 	jr	00112$
   2362                     709 00109$:
                            710 ;src/main.c:292: pvmem = changeVideoMemoryPage();
   2362 CD 00 20      [17]  711 	call	_changeVideoMemoryPage
   2365 22 DF 62      [16]  712 	ld	(_pvmem),hl
   2368 C3 7B 22      [10]  713 	jp	00111$
   236B                     714 00112$:
                            715 ;src/main.c:301: timer_off();
   236B CD B6 4E      [17]  716 	call	_timer_off
                            717 ;src/main.c:303: return state;
   236E FD 21 DD 62   [14]  718 	ld	iy,#_state
   2372 FD 6E 00      [19]  719 	ld	l,0 (iy)
   2375 DD F9         [10]  720 	ld	sp, ix
   2377 DD E1         [14]  721 	pop	ix
   2379 C9            [10]  722 	ret
   237A                     723 ___str_8:
   237A 3B 56 41 4D 4F 53   724 	.ascii ";VAMOS;AL;ATAQUE;"
        3B 41 4C 3B 41 54
        41 51 55 45 3B
   238B 00                  725 	.db 0x00
                            726 ;src/main.c:311: int main() {
                            727 ;	---------------------------------
                            728 ; Function main
                            729 ; ---------------------------------
   238C                     730 _main::
                            731 ;src/main.c:314: set_stack(0x1000);
   238C 21 00 10      [10]  732 	ld	hl,#0x1000
   238F E5            [11]  733 	push	hl
   2390 CD D5 51      [17]  734 	call	_set_stack
   2393 F1            [10]  735 	pop	af
                            736 ;src/main.c:316: initial_setup();
   2394 CD D6 20      [17]  737 	call	_initial_setup
                            738 ;src/main.c:318: while (state != STATE_EXIT) {
   2397                     739 00118$:
                            740 ;src/main.c:319: switch(state) {
   2397 3A DD 62      [13]  741 	ld	a,(#_state + 0)
   239A FE 05         [ 7]  742 	cp	a,#0x05
   239C CA 54 24      [10]  743 	jp	Z,00120$
   239F FE 02         [ 7]  744 	cp	a,#0x02
   23A1 28 19         [12]  745 	jr	Z,00101$
   23A3 FE 03         [ 7]  746 	cp	a,#0x03
   23A5 28 2D         [12]  747 	jr	Z,00103$
   23A7 FE 04         [ 7]  748 	cp	a,#0x04
   23A9 28 35         [12]  749 	jr	Z,00104$
   23AB FE 06         [ 7]  750 	cp	a,#0x06
   23AD CA 32 24      [10]  751 	jp	Z,00114$
   23B0 FE 07         [ 7]  752 	cp	a,#0x07
   23B2 CA 3F 24      [10]  753 	jp	Z,00115$
   23B5 D6 09         [ 7]  754 	sub	a, #0x09
   23B7 28 0F         [12]  755 	jr	Z,00102$
   23B9 C3 4C 24      [10]  756 	jp	00116$
                            757 ;src/main.c:320: case STATE_MENU:
   23BC                     758 00101$:
                            759 ;src/main.c:321: state = menu();
   23BC CD 0F 21      [17]  760 	call	_menu
   23BF FD 21 DD 62   [14]  761 	ld	iy,#_state
   23C3 FD 75 00      [19]  762 	ld	0 (iy),l
                            763 ;src/main.c:322: break;
   23C6 18 CF         [12]  764 	jr	00118$
                            765 ;src/main.c:324: case STATE_REDEFINE:
   23C8                     766 00102$:
                            767 ;src/main.c:325: state = redefine_keys();
   23C8 CD 44 22      [17]  768 	call	_redefine_keys
   23CB FD 21 DD 62   [14]  769 	ld	iy,#_state
   23CF FD 75 00      [19]  770 	ld	0 (iy),l
                            771 ;src/main.c:326: break;
   23D2 18 C3         [12]  772 	jr	00118$
                            773 ;src/main.c:328: case STATE_HELP:
   23D4                     774 00103$:
                            775 ;src/main.c:329: state = help();
   23D4 CD 4D 22      [17]  776 	call	_help
   23D7 FD 21 DD 62   [14]  777 	ld	iy,#_state
   23DB FD 75 00      [19]  778 	ld	0 (iy),l
                            779 ;src/main.c:330: break;
   23DE 18 B7         [12]  780 	jr	00118$
                            781 ;src/main.c:332: case STATE_GAME:
   23E0                     782 00104$:
                            783 ;src/main.c:333: level=1;
   23E0 21 0B 6C      [10]  784 	ld	hl,#_level + 0
   23E3 36 01         [10]  785 	ld	(hl), #0x01
                            786 ;src/main.c:334: user_init_level();
   23E5 CD 1C 3A      [17]  787 	call	_user_init_level
                            788 ;src/main.c:336: set_score(0);
   23E8 21 00 00      [10]  789 	ld	hl,#0x0000
   23EB E5            [11]  790 	push	hl
   23EC 21 00 00      [10]  791 	ld	hl,#0x0000
   23EF E5            [11]  792 	push	hl
   23F0 CD 8A 3D      [17]  793 	call	_set_score
   23F3 F1            [10]  794 	pop	af
   23F4 F1            [10]  795 	pop	af
                            796 ;src/main.c:338: while ((state!=STATE_LOSE) && (state!=STATE_WIN) && (state!=STATE_MENU)) {
   23F5                     797 00111$:
   23F5 3A DD 62      [13]  798 	ld	a,(#_state + 0)
   23F8 FE 07         [ 7]  799 	cp	a,#0x07
   23FA 28 9B         [12]  800 	jr	Z,00118$
   23FC FE 06         [ 7]  801 	cp	a,#0x06
   23FE 28 97         [12]  802 	jr	Z,00118$
   2400 D6 02         [ 7]  803 	sub	a, #0x02
   2402 28 93         [12]  804 	jr	Z,00118$
                            805 ;src/main.c:343: state = game();
   2404 CD 56 22      [17]  806 	call	_game
   2407 FD 21 DD 62   [14]  807 	ld	iy,#_state
   240B FD 75 00      [19]  808 	ld	0 (iy),l
                            809 ;src/main.c:349: if (state==STATE_LEVELUP)
   240E 3A DD 62      [13]  810 	ld	a,(#_state + 0)
   2411 D6 08         [ 7]  811 	sub	a, #0x08
   2413 20 0A         [12]  812 	jr	NZ,00106$
                            813 ;src/main.c:350: state=level_up();
   2415 CD 47 22      [17]  814 	call	_level_up
   2418 FD 21 DD 62   [14]  815 	ld	iy,#_state
   241C FD 75 00      [19]  816 	ld	0 (iy),l
   241F                     817 00106$:
                            818 ;src/main.c:351: if (state==STATE_DEAD){
   241F 3A DD 62      [13]  819 	ld	a,(#_state + 0)
   2422 D6 0B         [ 7]  820 	sub	a, #0x0B
   2424 20 CF         [12]  821 	jr	NZ,00111$
                            822 ;src/main.c:352: state=end();
   2426 CD 4A 22      [17]  823 	call	_end
   2429 FD 21 DD 62   [14]  824 	ld	iy,#_state
   242D FD 75 00      [19]  825 	ld	0 (iy),l
   2430 18 C3         [12]  826 	jr	00111$
                            827 ;src/main.c:357: case STATE_WIN:
   2432                     828 00114$:
                            829 ;src/main.c:358: state = win();
   2432 CD 50 22      [17]  830 	call	_win
   2435 FD 21 DD 62   [14]  831 	ld	iy,#_state
   2439 FD 75 00      [19]  832 	ld	0 (iy),l
                            833 ;src/main.c:359: break;
   243C C3 97 23      [10]  834 	jp	00118$
                            835 ;src/main.c:361: case STATE_LOSE:
   243F                     836 00115$:
                            837 ;src/main.c:362: state = game_over();
   243F CD 53 22      [17]  838 	call	_game_over
   2442 FD 21 DD 62   [14]  839 	ld	iy,#_state
   2446 FD 75 00      [19]  840 	ld	0 (iy),l
                            841 ;src/main.c:363: break;
   2449 C3 97 23      [10]  842 	jp	00118$
                            843 ;src/main.c:365: default:
   244C                     844 00116$:
                            845 ;src/main.c:366: state = STATE_EXIT;
   244C 21 DD 62      [10]  846 	ld	hl,#_state + 0
   244F 36 05         [10]  847 	ld	(hl), #0x05
                            848 ;src/main.c:368: }
   2451 C3 97 23      [10]  849 	jp	00118$
   2454                     850 00120$:
                            851 ;src/main.c:376: return 0;  
   2454 21 00 00      [10]  852 	ld	hl,#0x0000
   2457 C9            [10]  853 	ret
                            854 	.area _CODE
                            855 	.area _INITIALIZER
   6D96                     856 __xinit__level:
   6D96 00                  857 	.db #0x00	; 0
                            858 	.area _CABS (ABS)
