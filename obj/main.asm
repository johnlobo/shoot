;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 21 2015) (Mac OS X x86_64)
; This file was generated Sun Jun 21 18:17:49 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initialization
	.globl _updateUser
	.globl _updateBlock
	.globl _clear_screen
	.globl _draw_blocks
	.globl _draw_sprite
	.globl _changeVideoMemoryPage
	.globl _set_stack
	.globl _cpc_SetInkGphStr
	.globl _moverEstrellas
	.globl _pintarEstrellas
	.globl _inicializarEstrellas
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryPage
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSprite
	.globl _cpct_px2byteM0
	.globl _cpct_memset
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_disableFirmware
	.globl _aux_txt
	.globl _pvmem
	.globl _user
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
_user::
	.ds 15
_pvmem::
	.ds 2
_aux_txt::
	.ds 40
_changeVideoMemoryPage_page_1_71:
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
;src/main.c:57: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
	ld	iy,#_changeVideoMemoryPage_page_1_71
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
;src/main.c:56: u8* changeVideoMemoryPage() {
;	---------------------------------
; Function changeVideoMemoryPage
; ---------------------------------
_changeVideoMemoryPage::
;src/main.c:62: if (page) {
	ld	a,(#_changeVideoMemoryPage_page_1_71 + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:63: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
	ld	a,#0x30
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:64: page = 0;  
	ld	hl,#_changeVideoMemoryPage_page_1_71 + 0
	ld	(hl), #0x00
;src/main.c:65: screen = SCR_BUFF;                            // Next page = 0
	ld	hl,#0x8000
	ret
00102$:
;src/main.c:67: cpct_setVideoMemoryPage(cpct_page80);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
	ld	a,#0x20
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:68: page = 1;                              // Next page = 1
	ld	hl,#_changeVideoMemoryPage_page_1_71 + 0
	ld	(hl), #0x01
;src/main.c:69: screen = SCR_VMEM;
	ld	hl,#0xC000
;src/main.c:71: return screen;
	ret
;src/main.c:77: void draw_sprite(u8* screen){
;	---------------------------------
; Function draw_sprite
; ---------------------------------
_draw_sprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:79: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
	ld	hl, #_user + 5
	ld	c,(hl)
	ld	hl, #_user + 4
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
	ex	de,hl
;src/main.c:80: cpct_drawSprite(ship01,pscreen,user.w,user.h);
	ld	hl, #_user + 7
	ld	c,(hl)
	ld	hl, #_user + 6
	ld	b,(hl)
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	ld	hl,#_ship01
	push	hl
	call	_cpct_drawSprite
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	ix
	ret
;src/main.c:86: void draw_blocks(u8* screen){
;	---------------------------------
; Function draw_blocks
; ---------------------------------
_draw_blocks::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:89: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
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
;src/main.c:90: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
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
;src/main.c:97: void clear_screen(u8* screen){
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;src/main.c:98: cpct_memset(screen, 0x00, 0x4000);   
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cpct_memset
	pop	af
	pop	af
	inc	sp
	ret
;src/main.c:105: void updateBlock(){
;	---------------------------------
; Function updateBlock
; ---------------------------------
_updateBlock::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:106: if (block01.vx<128){
	ld	bc,#_block01+0
	ld	hl, #(_block01 + 0x0002) + 0
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:107: if ((block01.x+block01.vx)<(80-block01.w)){
	ld	a,(bc)
;src/main.c:108: block01.x = block01.x + block01.vx;
	ld	d,a
	add	a, -1 (ix)
	ld	e,a
;src/main.c:106: if (block01.vx<128){
	ld	a,-1 (ix)
	sub	a, #0x80
	jr	NC,00108$
;src/main.c:107: if ((block01.x+block01.vx)<(80-block01.w)){
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
;src/main.c:108: block01.x = block01.x + block01.vx;
	ld	a,e
	ld	(bc),a
	jr	00110$
00102$:
;src/main.c:111: block01.x = 79-block01.w;
	ld	a,#0x4F
	sub	a, h
	ld	(bc),a
;src/main.c:112: block01.vx = - block01.vx;
	ld	hl, #(_block01 + 0x0002) + 0
	ld	h,(hl)
	xor	a, a
	sub	a, h
	ld	d,a
	ld	hl,#(_block01 + 0x0002)
	ld	(hl),d
	jr	00110$
00108$:
;src/main.c:115: if (( (i8) (block01.x+block01.vx))>0){
	ld	l,e
	xor	a, a
	sub	a, l
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P,00105$
;src/main.c:116: block01.x = block01.x + block01.vx;
	ld	a,e
	ld	(bc),a
	jr	00110$
00105$:
;src/main.c:119: block01.x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:120: block01.vx = - block01.vx;
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
;src/main.c:128: void updateUser() {
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:130: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:137: if ((cpct_isKeyPressed(Key_CursorUp))){ 
	ld	hl,#0x0100
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/main.c:138: if ((user.y-user.vy)>0)
	ld	hl, #(_user + 0x0005) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 13
	ld	d,(hl)
	ld	a,d
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ld	a,c
	sub	a, l
	ld	l,a
	ld	a,b
	sbc	a, h
	ld	h,a
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00172$
	xor	a, #0x80
00172$:
	jp	P,00102$
;src/main.c:139: user.y = user.y - user.vy;
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0005)),a
	jr	00105$
00102$:
;src/main.c:141: user.y = 0;
	ld	hl,#(_user + 0x0005)
	ld	(hl),#0x00
00105$:
;src/main.c:144: if ((cpct_isKeyPressed(Key_CursorRight))){ 
	ld	hl,#0x0200
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/main.c:145: if ((user.x+user.vx<(79-user.w)))
	ld	hl, #(_user + 0x0004) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 12
	ld	d,(hl)
	ld	a,d
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_user + 6)
	ld	-1 (ix), a
	ld	l, a
	ld	h,#0x00
	ld	a,#0x4F
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	h,a
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00173$
	xor	a, #0x80
00173$:
	jp	P,00107$
;src/main.c:146: user.x = user.x + user.vx;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0004)),a
	jr	00110$
00107$:
;src/main.c:148: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, -1 (ix)
	ld	(#(_user + 0x0004)),a
00110$:
;src/main.c:151: if (cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00115$
;src/main.c:152: if ((user.x-user.vx)>0) 
	ld	hl, #(_user + 0x0004) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 12
	ld	d,(hl)
	ld	a,d
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ld	a,c
	sub	a, l
	ld	l,a
	ld	a,b
	sbc	a, h
	ld	h,a
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	P,00112$
;src/main.c:153: user.x = user.x - user.vx;    
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0004)),a
	jr	00115$
00112$:
;src/main.c:155: user.x = 0;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x00
00115$:
;src/main.c:158: if (cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/main.c:159: if ((user.y<(199-user.h) ))
	ld	hl, #(_user + 0x0005) + 0
	ld	e,(hl)
	ld	a,(#_user + 7)
	ld	-1 (ix), a
	ld	l, a
	ld	h,#0x00
	ld	a,#0xC7
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	h,a
	ld	c,e
	ld	d,#0x00
	ld	a,c
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00175$
	xor	a, #0x80
00175$:
	jp	P,00117$
;src/main.c:160: user.y = user.y + user.vy;
	ld	hl, #_user + 13
	ld	l,(hl)
	ld	a,e
	add	a, l
	ld	(#(_user + 0x0005)),a
	jr	00120$
00117$:
;src/main.c:162: user.y = 199-user.h;
	ld	a,#0xC7
	sub	a, -1 (ix)
	ld	(#(_user + 0x0005)),a
00120$:
;src/main.c:166: if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00126$
;src/main.c:168: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:170: while(!cpct_isKeyPressed(Key_P)){
00121$:
	ld	hl,#0x0803
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	NZ,00126$
;src/main.c:172: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00121$
00126$:
	inc	sp
	pop	ix
	ret
;src/main.c:182: void initialization(){
;	---------------------------------
; Function initialization
; ---------------------------------
_initialization::
;src/main.c:184: pvmem = SCR_BUFF;
	ld	hl,#0x8000
	ld	(_pvmem),hl
;src/main.c:187: inicializarEstrellas();
	call	_inicializarEstrellas
;src/main.c:189: block01.x = 50;
	ld	hl,#_block01+0
	ld	(hl),#0x32
;src/main.c:190: block01.y = 10;
	ld	hl,#_block01 + 1
	ld	(hl),#0x0A
;src/main.c:191: block01.vx = 2;
	ld	hl,#_block01 + 2
	ld	(hl),#0x02
;src/main.c:192: block01.vy = 0;
	ld	hl,#_block01 + 3
	ld	(hl),#0x00
;src/main.c:193: block01.w = 20;
	ld	hl,#_block01 + 4
	ld	(hl),#0x14
;src/main.c:194: block01.h = 40;
	ld	hl,#_block01 + 5
	ld	(hl),#0x28
;src/main.c:196: block02.x = 15;
	ld	hl,#_block02+0
	ld	(hl),#0x0F
;src/main.c:197: block02.y = 15;
	ld	hl,#_block02 + 1
	ld	(hl),#0x0F
;src/main.c:198: block02.vx = 4;
	ld	hl,#_block02 + 2
	ld	(hl),#0x04
;src/main.c:199: block02.vy = 0;
	ld	hl,#_block02 + 3
	ld	(hl),#0x00
;src/main.c:200: block02.w = 25;
	ld	hl,#_block02 + 4
	ld	(hl),#0x19
;src/main.c:201: block02.h = 20;
	ld	hl,#_block02 + 5
	ld	(hl),#0x14
;src/main.c:203: user.x = 39;
	ld	hl,#_user + 4
	ld	(hl),#0x27
;src/main.c:204: user.y = 183;
	ld	hl,#_user + 5
	ld	(hl),#0xB7
;src/main.c:205: user.w = 6;
	ld	hl,#_user + 6
	ld	(hl),#0x06
;src/main.c:206: user.h = 16;
	ld	hl,#_user + 7
	ld	(hl),#0x10
;src/main.c:207: user.vx = 2;
	ld	hl,#_user + 12
	ld	(hl),#0x02
;src/main.c:208: user.vy = 4;
	ld	hl,#_user + 13
	ld	(hl),#0x04
;src/main.c:211: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;src/main.c:212: cpc_SetInkGphStr(1,2);
	ld	hl, #0x0201
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:213: cpc_SetInkGphStr(2,8);
	ld	hl, #0x0802
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/main.c:214: cpc_SetInkGphStr(3,42);
	ld	hl, #0x2A03
	ex	(sp),hl
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/main.c:222: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:225: set_stack(0x1000);
	ld	hl,#0x1000
	push	hl
	call	_set_stack
	pop	af
;src/main.c:227: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
	call	_cpct_disableFirmware
;src/main.c:229: cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
	ld	de,#_G_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
;src/main.c:230: cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
	ld	a, (#_G_palette + 1)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_cpct_setPALColour
	pop	af
;src/main.c:231: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:234: cpct_memset(SCR_VMEM, 0x00, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
	pop	af
	pop	af
	inc	sp
;src/main.c:235: cpct_memset(SCR_BUFF, 0x00, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0x80
	push	hl
	call	_cpct_memset
	pop	af
	pop	af
	inc	sp
;src/main.c:237: initialization(); 
	call	_initialization
;src/main.c:240: while (1){
00104$:
;src/main.c:242: clear_screen(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_clear_screen
	pop	af
;src/main.c:244: updateUser();
	call	_updateUser
;src/main.c:245: updateBlock();
	call	_updateBlock
;src/main.c:247: moverEstrellas();
	call	_moverEstrellas
;src/main.c:248: pintarEstrellas(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_pintarEstrellas
	pop	af
;src/main.c:253: draw_sprite(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_sprite
	pop	af
;src/main.c:255: pvmem = changeVideoMemoryPage();
	call	_changeVideoMemoryPage
	ld	(_pvmem),hl
;src/main.c:258: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
