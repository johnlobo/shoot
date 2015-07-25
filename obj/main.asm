;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
; This file was generated Thu Jul 23 01:10:22 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initialization
	.globl _draw_scoreboard
	.globl _set_color
	.globl _letras_rojas
	.globl _letras_azules
	.globl _update_blocks
	.globl _clear_screen
	.globl _draw_blocks
	.globl _changeVideoMemoryPage
	.globl _timer_on
	.globl _set_stack
	.globl _cpc_SetInkGphStr
	.globl _cpc_PrintGphStr
	.globl _update_stars
	.globl _draw_stars
	.globl _init_stars
	.globl _draw_explosions
	.globl _update_explosions
	.globl _init_explosions
	.globl _draw_user
	.globl _update_user
	.globl _init_user
	.globl _draw_enemies
	.globl _update_enemies
	.globl _init_enemies
	.globl _draw_shoots
	.globl _update_shoots
	.globl _init_shoots
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryPage
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_setVideoMode
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _cpct_memset
	.globl _aux_txt
	.globl _pvmem
	.globl _block02
	.globl _block01
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_block01::
	.ds 7
_block02::
	.ds 7
_pvmem::
	.ds 2
_aux_txt::
	.ds 40
_changeVideoMemoryPage_page_1_86:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
	ld	iy,#_changeVideoMemoryPage_page_1_86
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
	ld	a,(#_changeVideoMemoryPage_page_1_86 + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:58: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
	ld	a,#0x30
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:59: page = 0;  
	ld	hl,#_changeVideoMemoryPage_page_1_86 + 0
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
	ld	hl,#_changeVideoMemoryPage_page_1_86 + 0
	ld	(hl), #0x01
;src/main.c:64: screen = SCR_VMEM;
	ld	hl,#0xC000
;src/main.c:66: return screen;
	ret
;src/main.c:74: void draw_blocks(u8* screen){
;	---------------------------------
; Function draw_blocks
; ---------------------------------
_draw_blocks::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:77: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
	ld	hl, #_block01 + 1
	ld	c,(hl)
	ld	hl, #_block01 + 0
	ld	h,(hl)
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	a,c
	push	af
	inc	sp
	push	hl
	inc	sp
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	ld	e, l
	ld	d, h
;src/main.c:78: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
	ld	hl, #_block01 + 5
	ld	c,(hl)
	ld	hl, #_block01 + 4
	ld	b,(hl)
	push	bc
	push	de
	ld	hl,#0x0404
	push	hl
	call	_cpct_px2byteM0
	pop	af
	ld	-1 (ix),l
	pop	de
	pop	bc
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	inc	sp
	pop	ix
	ret
;src/main.c:85: void clear_screen(u8* screen){
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;src/main.c:86: cpct_memset(screen, 0x00, 0x4000);   
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	push    de
	call    _cpct_memset
	ret
;src/main.c:93: void update_blocks(){
;	---------------------------------
; Function update_blocks
; ---------------------------------
_update_blocks::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:94: if (block01.vx<128){
	ld	bc,#_block01+0
	ld	hl, #(_block01 + 0x0002) + 0
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:95: if ((block01.x+block01.vx)<(80-block01.w)){
	ld	a,(bc)
;src/main.c:96: block01.x = block01.x + block01.vx;
	ld	d,a
	add	a, -1 (ix)
	ld	e,a
;src/main.c:94: if (block01.vx<128){
	ld	a,-1 (ix)
	sub	a, #0x80
	jr	NC,00108$
;src/main.c:95: if ((block01.x+block01.vx)<(80-block01.w)){
	ld	-3 (ix),d
	ld	-2 (ix),#0x00
	ld	h,-1 (ix)
	ld	l,#0x00
	ld	a,-3 (ix)
	add	a, h
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a, l
	ld	-2 (ix),a
	ld	hl, #_block01 + 4
	ld	h,(hl)
	ld	l,h
	ld	d,#0x00
	ld	a,#0x50
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, d
	ld	d,a
	ld	a,-3 (ix)
	sub	a, l
	ld	a,-2 (ix)
	sbc	a, d
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P,00102$
;src/main.c:96: block01.x = block01.x + block01.vx;
	ld	a,e
	ld	(bc),a
	jr	00110$
00102$:
;src/main.c:99: block01.x = 79-block01.w;
	ld	a,#0x4F
	sub	a, h
	ld	(bc),a
;src/main.c:100: block01.vx = - block01.vx;
	ld	hl, #(_block01 + 0x0002) + 0
	ld	h,(hl)
	xor	a, a
	sub	a, h
	ld	d,a
	ld	hl,#(_block01 + 0x0002)
	ld	(hl),d
	jr	00110$
00108$:
;src/main.c:103: if (( (i8) (block01.x+block01.vx))>0){
	ld	l,e
	xor	a, a
	sub	a, l
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P,00105$
;src/main.c:104: block01.x = block01.x + block01.vx;
	ld	a,e
	ld	(bc),a
	jr	00110$
00105$:
;src/main.c:107: block01.x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:108: block01.vx = - block01.vx;
	ld	hl, #(_block01 + 0x0002) + 0
	ld	h,(hl)
	xor	a, a
	sub	a, h
	ld	d,a
	ld	hl,#(_block01 + 0x0002)
	ld	(hl),d
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:116: void letras_azules(){
;	---------------------------------
; Function letras_azules
; ---------------------------------
_letras_azules::
;src/main.c:118: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;src/main.c:119: cpc_SetInkGphStr(1,42);
	ld	hl, #0x2A01
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:120: cpc_SetInkGphStr(2,34);
	ld	hl, #0x2202
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:121: cpc_SetInkGphStr(3,42);
	ld	hl, #0x2A03
	ex	(sp),hl
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/main.c:127: void letras_rojas(){
;	---------------------------------
; Function letras_rojas
; ---------------------------------
_letras_rojas::
;src/main.c:129: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;src/main.c:130: cpc_SetInkGphStr(1,40);
	ld	hl, #0x2801
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:131: cpc_SetInkGphStr(2,10);
	ld	hl, #0x0A02
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:132: cpc_SetInkGphStr(3,40);
	ld	hl, #0x2803
	ex	(sp),hl
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/main.c:139: void set_color (unsigned char fondo,unsigned char t){
;	---------------------------------
; Function set_color
; ---------------------------------
_set_color::
;src/main.c:140: cpc_SetInkGphStr(0,fondo);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_cpc_SetInkGphStr
	pop	af
;src/main.c:141: cpc_SetInkGphStr(1,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x01
	push	de
	call	_cpc_SetInkGphStr
	pop	af
;src/main.c:142: cpc_SetInkGphStr(2,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x02
	push	de
	call	_cpc_SetInkGphStr
	pop	af
;src/main.c:143: cpc_SetInkGphStr(3,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x03
	push	de
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/main.c:150: void draw_scoreboard(u8* screen){
;	---------------------------------
; Function draw_scoreboard
; ---------------------------------
_draw_scoreboard::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:152: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 4, 8));
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	ld	hl,#0x0804
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	de
	ld	c, l
	ld	b, h
	ld	hl,#___str_0
	push	de
	push	bc
	push	hl
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	pop	de
;src/main.c:153: cpc_PrintGphStr("00000000",(int) cpct_getScreenPtr(screen, 60, 8));
	ld	hl,#0x083C
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	ld	de,#___str_0
	push	hl
	push	de
	call	_cpc_PrintGphStr
	pop	af
	pop	af
	pop	ix
	ret
___str_0:
	.ascii "00000000"
	.db 0x00
;src/main.c:162: void initialization(){
;	---------------------------------
; Function initialization
; ---------------------------------
_initialization::
;src/main.c:164: pvmem = SCR_BUFF;
	ld	hl,#0x8000
	ld	(_pvmem),hl
;src/main.c:167: init_stars();
	call	_init_stars
;src/main.c:169: init_user();
	call	_init_user
;src/main.c:170: init_shoots();
	call	_init_shoots
;src/main.c:171: init_enemies();
	call	_init_enemies
;src/main.c:172: init_explosions();
	call	_init_explosions
;src/main.c:174: block01.x = 50;
	ld	hl,#_block01+0
	ld	(hl),#0x32
;src/main.c:175: block01.y = 10;
	ld	hl,#_block01 + 1
	ld	(hl),#0x0A
;src/main.c:176: block01.vx = 2;
	ld	hl,#_block01 + 2
	ld	(hl),#0x02
;src/main.c:177: block01.vy = 0;
	ld	hl,#_block01 + 3
	ld	(hl),#0x00
;src/main.c:178: block01.w = 20;
	ld	hl,#_block01 + 4
	ld	(hl),#0x14
;src/main.c:179: block01.h = 40;
	ld	hl,#_block01 + 5
	ld	(hl),#0x28
;src/main.c:181: block02.x = 15;
	ld	hl,#_block02+0
	ld	(hl),#0x0F
;src/main.c:182: block02.y = 15;
	ld	hl,#_block02 + 1
	ld	(hl),#0x0F
;src/main.c:183: block02.vx = 4;
	ld	hl,#_block02 + 2
	ld	(hl),#0x04
;src/main.c:184: block02.vy = 0;
	ld	hl,#_block02 + 3
	ld	(hl),#0x00
;src/main.c:185: block02.w = 25;
	ld	hl,#_block02 + 4
	ld	(hl),#0x19
;src/main.c:186: block02.h = 20;
	ld	hl,#_block02 + 5
	ld	(hl),#0x14
;src/main.c:188: letras_azules();
	jp    _letras_azules
;src/main.c:196: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:199: set_stack(0x1000);
	ld	hl,#0x1000
	push	hl
	call	_set_stack
	pop	af
;src/main.c:202: timer_on();
	call	_timer_on
;src/main.c:203: cpct_fw2hw       (palette, 16);   // Convert Firmware colours to Hardware colours 
	ld	de,#_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_fw2hw
	pop	af
	inc	sp
;src/main.c:204: cpct_setPalette  (palette, 16);   // Set up palette using hardware colours
	ld	de,#_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
;src/main.c:205: cpct_setBorder   (palette[0]);    // Set up the border to the background colour (white)
	ld	a, (#_palette + 0)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_cpct_setPALColour
	pop	af
;src/main.c:206: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:209: cpct_memset(SCR_VMEM, 0x00, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:210: cpct_memset(SCR_BUFF, 0x00, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0x80
	push	hl
	call	_cpct_memset
;src/main.c:212: initialization(); 
	call	_initialization
;src/main.c:215: while (1){
00106$:
;src/main.c:217: clear_screen(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_clear_screen
	pop	af
;src/main.c:219: update_user();
	call	_update_user
;src/main.c:220: update_shoots();
	call	_update_shoots
;src/main.c:221: update_blocks();
	call	_update_blocks
;src/main.c:222: update_enemies();
	call	_update_enemies
;src/main.c:223: update_explosions();
	call	_update_explosions
;src/main.c:226: update_stars();
	call	_update_stars
;src/main.c:231: draw_stars(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_stars
	pop	af
;src/main.c:233: draw_blocks(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_blocks
	pop	af
;src/main.c:234: draw_user(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_user
	pop	af
;src/main.c:235: draw_shoots(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_shoots
	pop	af
;src/main.c:236: draw_enemies(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_enemies
	pop	af
;src/main.c:237: draw_explosions(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_explosions
	pop	af
;src/main.c:239: draw_scoreboard(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_scoreboard
	pop	af
;src/main.c:244: pvmem = changeVideoMemoryPage();
	call	_changeVideoMemoryPage
	ld	(_pvmem),hl
	jr	00106$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
