;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Mon Aug 10 01:24:07 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _game_over
	.globl _win
	.globl _help
	.globl _end
	.globl _level_up
	.globl _redefine_keys
	.globl _menu
	.globl _init_level
	.globl _init_game
	.globl _initial_setup
	.globl _initialization
	.globl _draw_scoreboard
	.globl _clear_both_screens
	.globl _clear_screen
	.globl _changeVideoMemoryPage
	.globl _get_time
	.globl _timer_off
	.globl _timer_on
	.globl _set_stack
	.globl _cpc_PrintGphStr2X
	.globl _cpc_PrintGphStr
	.globl _update_stars
	.globl _draw_stars
	.globl _init_stars
	.globl _get_last_moved_stars
	.globl _draw_messages
	.globl _create_message
	.globl _init_messages
	.globl _colour_message
	.globl _red_message
	.globl _blue_message
	.globl _draw_explosions
	.globl _update_explosions
	.globl _init_explosions
	.globl _get_score
	.globl _set_score
	.globl _draw_user
	.globl _update_user
	.globl _user_engine
	.globl _get_user_speed
	.globl _user_init_level
	.globl _init_user
	.globl _get_last_moved_user
	.globl _draw_enemies
	.globl _update_enemies
	.globl _init_enemies
	.globl _draw_shoots
	.globl _update_shoots
	.globl _init_shoots
	.globl _cpct_setRandomSeedUniform_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryPage
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_setVideoMode
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset_f64
	.globl _cpct_disableFirmware
	.globl _sprintf
	.globl _level
	.globl _aux_txt
	.globl _pvmem
	.globl _previous_state
	.globl _state
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_state::
	.ds 1
_previous_state::
	.ds 1
_pvmem::
	.ds 2
_aux_txt::
	.ds 40
_changeVideoMemoryPage_page_1_89:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_level::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;src/main.c:52: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
	ld	iy,#_changeVideoMemoryPage_page_1_89
	ld	0 (iy),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:51: u8* changeVideoMemoryPage() {
;	---------------------------------
; Function changeVideoMemoryPage
; ---------------------------------
_changeVideoMemoryPage::
;src/main.c:57: if (page) {
	ld	a,(#_changeVideoMemoryPage_page_1_89 + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:58: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
	ld	a,#0x30
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:59: page = 0;  
	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
	ld	(hl), #0x00
;src/main.c:60: screen = SCR_BUFF;                            // Next page = 0
	ld	hl,#0x8000
	ret
00102$:
;src/main.c:62: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
	ld	a,#0x20
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:63: page = 1;                              // Next page = 1
	ld	hl,#_changeVideoMemoryPage_page_1_89 + 0
	ld	(hl), #0x01
;src/main.c:64: screen = SCR_VMEM;
	ld	hl,#0xC000
;src/main.c:66: return screen;
	ret
;src/main.c:73: void clear_screen(u8* screen){
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;src/main.c:74: cpct_memset_f64(screen, 0x00, 0x4000);   
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	bc,#0x4000
	push	bc
	ld	bc,#0x0000
	push	bc
	push    hl
	call    _cpct_memset_f64
	ret
;src/main.c:80: void clear_both_screens(){
;	---------------------------------
; Function clear_both_screens
; ---------------------------------
_clear_both_screens::
;src/main.c:81: cpct_memset_f64(SCR_VMEM, 0x00, 0x4000);   
	ld	hl,#0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_memset_f64
;src/main.c:82: cpct_memset_f64(SCR_BUFF, 0x00, 0x4000);   
	ld	hl,#0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0x80
	push    hl
	call    _cpct_memset_f64
	ret
;src/main.c:89: void draw_scoreboard(u8* screen){
;	---------------------------------
; Function draw_scoreboard
; ---------------------------------
_draw_scoreboard::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:90: sprintf(aux_txt,"%08d",get_score());
	call	_get_score
	push	de
	push	hl
	ld	hl,#___str_0
	push	hl
	ld	hl,#_aux_txt
	push	hl
	call	_sprintf
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
;src/main.c:91: colour_message(0, 2);
	ld	hl,#0x0200
	push	hl
	call	_colour_message
	pop	af
;src/main.c:92: cpc_PrintGphStr(aux_txt,(int) cpct_getScreenPtr(screen, 4, 8));
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	ld	hl,#0x0804
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	de
	ld	bc,#_aux_txt
	push	de
	push	hl
	push	bc
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	call	_red_message
	pop	de
;src/main.c:94: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
	ld	hl,#0x083C
	push	hl
	push	de
	call	_cpct_getScreenPtr
	ld	de,#___str_1+0
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	pop	ix
	ret
___str_0:
	.ascii "%08d"
	.db 0x00
___str_1:
	.ascii "00000000"
	.db 0x00
;src/main.c:101: void initialization(){
;	---------------------------------
; Function initialization
; ---------------------------------
_initialization::
;src/main.c:103: pvmem = SCR_BUFF;
	ld	hl,#0x8000
	ld	(_pvmem),hl
;src/main.c:105: clear_both_screens();
	call	_clear_both_screens
;src/main.c:107: cpct_setRandomSeedUniform_u8((u8) get_time());
	call	_get_time
	call	_cpct_setRandomSeedUniform_u8
;src/main.c:110: init_stars();
	call	_init_stars
;src/main.c:112: init_user();
	call	_init_user
;src/main.c:113: init_shoots();
	call	_init_shoots
;src/main.c:114: init_enemies();
	call	_init_enemies
;src/main.c:115: init_explosions();
	call	_init_explosions
;src/main.c:116: init_messages();
	jp    _init_messages
;src/main.c:121: void initial_setup(){
;	---------------------------------
; Function initial_setup
; ---------------------------------
_initial_setup::
;src/main.c:122: cpct_disableFirmware();  // Disable firmware to prevent it from interfering
	call	_cpct_disableFirmware
;src/main.c:124: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
	ld	de,#_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:125: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
	ld	de,#_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
;src/main.c:126: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
	ld	a, (#_palette + 0)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_cpct_setPALColour
	pop	af
;src/main.c:127: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:130: clear_both_screens();
	call	_clear_both_screens
;src/main.c:131: state=INITIAL_STATE;
	ld	hl,#_state + 0
	ld	(hl), #0x02
	ret
;src/main.c:134: void init_game(){
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;src/main.c:136: }
	ret
;src/main.c:138: void init_level(){
;	---------------------------------
; Function init_level
; ---------------------------------
_init_level::
;src/main.c:140: }
	ret
;src/main.c:142: u8 menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;src/main.c:143: u8 choice=0;
	ld	c,#0x00
;src/main.c:145: clear_screen(SCR_VMEM);
	push	bc
	ld	hl,#0xC000
	push	hl
	call	_clear_screen
	pop	af
	call	_red_message
	ld	hl,#0x1014
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_2+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr2X
	pop	af
	pop	af
	call	_blue_message
	ld	hl,#0x401C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_3+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	ld	hl, #0x501C
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_4+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	ld	hl, #0x601C
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_5+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	ld	hl, #0x701C
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_6+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	call	_red_message
	ld	hl,#0xA014
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	de,#___str_7+0
	push	bc
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	pop	bc
;src/main.c:157: while (choice==0) {
00109$:
	ld	a,c
	or	a, a
	jr	NZ,00111$
;src/main.c:159: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	ld	hl,#0x0108
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00102$
;src/main.c:162: init_game();
	call	_init_game
;src/main.c:163: choice=STATE_GAME;
	ld	c,#0x04
00102$:
;src/main.c:165: if (cpct_isKeyPressed(Key_2))    
	push	bc
	ld	hl,#0x0208
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00104$
;src/main.c:166: choice=STATE_HELP;
	ld	c,#0x03
00104$:
;src/main.c:167: if (cpct_isKeyPressed(Key_3))    
	push	bc
	ld	hl,#0x0207
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00106$
;src/main.c:168: choice=STATE_REDEFINE;
	ld	c,#0x09
00106$:
;src/main.c:169: if (cpct_isKeyPressed(Key_Esc)){    
	push	bc
	ld	hl,#0x0408
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00109$
;src/main.c:170: choice=STATE_EXIT;
	ld	c,#0x05
	jr	00109$
00111$:
;src/main.c:173: return choice; 
	ld	l,c
	ret
___str_2:
	.ascii "SPACE;RETRO;INVADERS"
	.db 0x00
___str_3:
	.ascii "1;JUGAR"
	.db 0x00
___str_4:
	.ascii "2;AYUDA"
	.db 0x00
___str_5:
	.ascii "3;REDEFINIR;TECLAS"
	.db 0x00
___str_6:
	.ascii "ESC;SALIR"
	.db 0x00
___str_7:
	.ascii "C;2015;JOHN;LOBO"
	.db 0x00
;src/main.c:176: u8 redefine_keys(){
;	---------------------------------
; Function redefine_keys
; ---------------------------------
_redefine_keys::
;src/main.c:178: return STATE_MENU;
	ld	l,#0x02
	ret
;src/main.c:182: u8 level_up(){
;	---------------------------------
; Function level_up
; ---------------------------------
_level_up::
;src/main.c:184: return STATE_MENU;
	ld	l,#0x02
	ret
;src/main.c:188: u8 end(){
;	---------------------------------
; Function end
; ---------------------------------
_end::
;src/main.c:190: return STATE_MENU;
	ld	l,#0x02
	ret
;src/main.c:194: u8 help(){
;	---------------------------------
; Function help
; ---------------------------------
_help::
;src/main.c:196: return STATE_MENU;
	ld	l,#0x02
	ret
;src/main.c:200: u8 win(){
;	---------------------------------
; Function win
; ---------------------------------
_win::
;src/main.c:202: return STATE_MENU;
	ld	l,#0x02
	ret
;src/main.c:206: u8 game_over(){
;	---------------------------------
; Function game_over
; ---------------------------------
_game_over::
;src/main.c:208: return STATE_LOSE;
	ld	l,#0x07
	ret
;src/main.c:212: u8 game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:214: timer_on();
	call	_timer_on
;src/main.c:219: initialization(); 
	call	_initialization
;src/main.c:221: create_message(25,96,30,";VAMOS;AL;ATAQUE;");
	ld	hl,#___str_8
	push	hl
	ld	hl,#0x1E60
	push	hl
	ld	a,#0x19
	push	af
	inc	sp
	call	_create_message
	pop	af
	pop	af
	inc	sp
;src/main.c:223: init_level();
	call	_init_level
;src/main.c:225: while(1)
00111$:
;src/main.c:232: if ((STARFIELD_ACTIVE) && (get_time()-get_last_moved_stars()>VELOCIDAD_ESTRELLAS)){
	call	_get_time
	ld	-1 (ix),d
	ld	-2 (ix),e
	ld	-3 (ix),h
	ld	-4 (ix),l
	call	_get_last_moved_stars
	ld	a,-4 (ix)
	sub	a, l
	ld	l,a
	ld	a,-3 (ix)
	sbc	a, h
	ld	h,a
	ld	a,-2 (ix)
	sbc	a, e
	ld	e,a
	ld	a,-1 (ix)
	sbc	a, d
	ld	d,a
	ld	a,#0x28
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	ld	a,#0x00
	sbc	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00102$
;src/main.c:233: update_stars();
	call	_update_stars
00102$:
;src/main.c:236: update_explosions();
	call	_update_explosions
;src/main.c:238: if ((get_time()-get_last_moved_user())>get_user_speed()){
	call	_get_time
	ld	-1 (ix),d
	ld	-2 (ix),e
	ld	-3 (ix),h
	ld	-4 (ix),l
	call	_get_last_moved_user
	ld	a,-4 (ix)
	sub	a, l
	ld	-4 (ix),a
	ld	a,-3 (ix)
	sbc	a, h
	ld	-3 (ix),a
	ld	a,-2 (ix)
	sbc	a, e
	ld	-2 (ix),a
	ld	a,-1 (ix)
	sbc	a, d
	ld	-1 (ix),a
	call	_get_user_speed
	ld	h,#0x00
	ld	de,#0x0000
	ld	a,l
	sub	a, -4 (ix)
	ld	a,h
	sbc	a, -3 (ix)
	ld	a,d
	sbc	a, -2 (ix)
	ld	a,e
	sbc	a, -1 (ix)
	jr	NC,00105$
;src/main.c:239: update_user();
	call	_update_user
00105$:
;src/main.c:241: update_shoots();
	call	_update_shoots
;src/main.c:242: update_enemies();
	call	_update_enemies
;src/main.c:248: clear_screen(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_clear_screen
	pop	af
;src/main.c:252: user_engine(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_user_engine
	pop	af
;src/main.c:256: draw_stars(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_stars
	pop	af
;src/main.c:260: draw_user(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_user
	pop	af
;src/main.c:261: draw_shoots(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_shoots
	pop	af
;src/main.c:262: draw_enemies(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_enemies
	pop	af
;src/main.c:263: draw_explosions(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_explosions
	pop	af
;src/main.c:265: draw_messages(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_messages
	pop	af
;src/main.c:266: draw_scoreboard(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_scoreboard
;src/main.c:274: if (cpct_isKeyPressed(Key_Esc)){     // ESC
	ld	hl, #0x0408
	ex	(sp),hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00109$
;src/main.c:275: state = STATE_MENU;
	ld	hl,#_state + 0
	ld	(hl), #0x02
;src/main.c:276: break;
	jr	00112$
00109$:
;src/main.c:292: pvmem = changeVideoMemoryPage();
	call	_changeVideoMemoryPage
	ld	(_pvmem),hl
	jp	00111$
00112$:
;src/main.c:301: timer_off();
	call	_timer_off
;src/main.c:303: return state;
	ld	iy,#_state
	ld	l,0 (iy)
	ld	sp, ix
	pop	ix
	ret
___str_8:
	.ascii ";VAMOS;AL;ATAQUE;"
	.db 0x00
;src/main.c:311: int main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:314: set_stack(0x1000);
	ld	hl,#0x1000
	push	hl
	call	_set_stack
	pop	af
;src/main.c:316: initial_setup();
	call	_initial_setup
;src/main.c:318: while (state != STATE_EXIT) {
00118$:
;src/main.c:319: switch(state) {
	ld	a,(#_state + 0)
	cp	a,#0x05
	jp	Z,00120$
	cp	a,#0x02
	jr	Z,00101$
	cp	a,#0x03
	jr	Z,00103$
	cp	a,#0x04
	jr	Z,00104$
	cp	a,#0x06
	jp	Z,00114$
	cp	a,#0x07
	jp	Z,00115$
	sub	a, #0x09
	jr	Z,00102$
	jp	00116$
;src/main.c:320: case STATE_MENU:
00101$:
;src/main.c:321: state = menu();
	call	_menu
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:322: break;
	jr	00118$
;src/main.c:324: case STATE_REDEFINE:
00102$:
;src/main.c:325: state = redefine_keys();
	call	_redefine_keys
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:326: break;
	jr	00118$
;src/main.c:328: case STATE_HELP:
00103$:
;src/main.c:329: state = help();
	call	_help
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:330: break;
	jr	00118$
;src/main.c:332: case STATE_GAME:
00104$:
;src/main.c:333: level=1;
	ld	hl,#_level + 0
	ld	(hl), #0x01
;src/main.c:334: user_init_level();
	call	_user_init_level
;src/main.c:336: set_score(0);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_score
	pop	af
	pop	af
;src/main.c:338: while ((state!=STATE_LOSE) && (state!=STATE_WIN) && (state!=STATE_MENU)) {
00111$:
	ld	a,(#_state + 0)
	cp	a,#0x07
	jr	Z,00118$
	cp	a,#0x06
	jr	Z,00118$
	sub	a, #0x02
	jr	Z,00118$
;src/main.c:343: state = game();
	call	_game
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:349: if (state==STATE_LEVELUP)
	ld	a,(#_state + 0)
	sub	a, #0x08
	jr	NZ,00106$
;src/main.c:350: state=level_up();
	call	_level_up
	ld	iy,#_state
	ld	0 (iy),l
00106$:
;src/main.c:351: if (state==STATE_DEAD){
	ld	a,(#_state + 0)
	sub	a, #0x0B
	jr	NZ,00111$
;src/main.c:352: state=end();
	call	_end
	ld	iy,#_state
	ld	0 (iy),l
	jr	00111$
;src/main.c:357: case STATE_WIN:
00114$:
;src/main.c:358: state = win();
	call	_win
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:359: break;
	jp	00118$
;src/main.c:361: case STATE_LOSE:
00115$:
;src/main.c:362: state = game_over();
	call	_game_over
	ld	iy,#_state
	ld	0 (iy),l
;src/main.c:363: break;
	jp	00118$
;src/main.c:365: default:
00116$:
;src/main.c:366: state = STATE_EXIT;
	ld	hl,#_state + 0
	ld	(hl), #0x05
;src/main.c:368: }
	jp	00118$
00120$:
;src/main.c:376: return 0;  
	ld	hl,#0x0000
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__level:
	.db #0x00	; 0
	.area _CABS (ABS)
