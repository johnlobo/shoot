;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun  5 2015) (Mac OS X x86_64)
; This file was generated Sun Jun 14 18:05:38 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initialization
	.globl _updateUser
	.globl _drawFrame
	.globl _updateBlock
	.globl _clear_screen
	.globl _draw_blocks
	.globl _draw_sprite
	.globl _changeVideoMemoryPage
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
_changeVideoMemoryPage_page_1_58:
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
;src/main.c:54: static u8 page   = 0;   // Static value to remember the last page shown (0 = page 40, 1 = page C0)
	ld	iy,#_changeVideoMemoryPage_page_1_58
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
;src/main.c:53: u8* changeVideoMemoryPage() {
;	---------------------------------
; Function changeVideoMemoryPage
; ---------------------------------
_changeVideoMemoryPage::
;src/main.c:59: if (page) {
	ld	a,(#_changeVideoMemoryPage_page_1_58 + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:60: cpct_setVideoMemoryPage(cpct_pageC0);  // Set video memory at banck 3 (0xC000 - 0xFFFF)
	ld	a,#0x30
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:61: page = 0;  
	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
	ld	(hl), #0x00
;src/main.c:62: screen = SCR_BUFF;                            // Next page = 0
	ld	hl,#0x4000
	ret
00102$:
;src/main.c:64: cpct_setVideoMemoryPage(cpct_page40);  // Set video memory at banck 1 (0x8000 - 0x7FFF)
	ld	a,#0x10
	push	af
	inc	sp
	call	_cpct_setVideoMemoryPage
	inc	sp
;src/main.c:65: page = 1;                              // Next page = 1
	ld	hl,#_changeVideoMemoryPage_page_1_58 + 0
	ld	(hl), #0x01
;src/main.c:66: screen = SCR_VMEM;
	ld	hl,#0xC000
;src/main.c:68: return screen;
	ret
;src/main.c:72: void draw_sprite(u8* screen){
;	---------------------------------
; Function draw_sprite
; ---------------------------------
_draw_sprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:74: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
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
;src/main.c:75: cpct_drawSprite(ship01,pscreen,user.w,user.h);
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
;src/main.c:79: void draw_blocks(u8* screen){
;	---------------------------------
; Function draw_blocks
; ---------------------------------
_draw_blocks::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:82: pscreen = cpct_getScreenPtr(screen, block01.x, block01.y);
	ld	hl, #_block01 + 1
	ld	b,(hl)
	ld	hl, #_block01 + 0
	ld	d,(hl)
	ld	a,4 (ix)
	ld	-3 (ix),a
	ld	a,5 (ix)
	ld	-2 (ix),a
	ld	c, d
	push	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	ld	e, l
	ld	d, h
;src/main.c:83: cpct_drawSolidBox(pscreen, cpct_px2byteM0(4, 4), block01.w, block01.h);
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
;src/main.c:85: pscreen = cpct_getScreenPtr(screen, block02.x, block02.y);
	ld	hl, #_block02 + 1
	ld	d,(hl)
	ld	a, (#_block02 + 0)
	push	de
	inc	sp
	push	af
	inc	sp
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	ld	e, l
	ld	d, h
;src/main.c:86: cpct_drawSolidBox(pscreen, cpct_px2byteM0(6, 6), block02.w, block02.h);    
	ld	hl, #_block02 + 5
	ld	c,(hl)
	ld	hl, #_block02 + 4
	ld	b,(hl)
	push	bc
	push	de
	ld	hl,#0x0606
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
	ld	sp,ix
	pop	ix
	ret
;src/main.c:90: void clear_screen(u8* screen){
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;src/main.c:91: cpct_memset(screen, 0x00, 0x4000);   
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
;src/main.c:95: void updateBlock(){
;	---------------------------------
; Function updateBlock
; ---------------------------------
_updateBlock::
;src/main.c:96: if (block01.vx>0){
	ld	hl, #(_block01 + 0x0002) + 0
	ld	b,(hl)
;src/main.c:97: if ((block01.x+block01.vx)<79){
	ld	hl, #_block01 + 0
	ld	c,(hl)
	ld	l,b
	ld	h,#0x00
	ld	e,c
	ld	d,#0x00
;src/main.c:98: block01.x = block01.x + block01.vx;
	ld	a,c
	add	a, b
	ld	c,a
;src/main.c:97: if ((block01.x+block01.vx)<79){
	add	hl,de
	ld	e,l
	ld	d,h
;src/main.c:96: if (block01.vx>0){
	ld	a,b
	or	a, a
	jr	Z,00108$
;src/main.c:97: if ((block01.x+block01.vx)<79){
	ld	a,e
	sub	a, #0x4F
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;src/main.c:98: block01.x = block01.x + block01.vx;
	ld	hl,#_block01
	ld	(hl),c
	ret
00102$:
;src/main.c:101: block01.x = 79-block01.w;
	ld	hl, #_block01 + 4
	ld	h,(hl)
	ld	a,#0x4F
	sub	a, h
	ld	hl,#_block01
	ld	(hl),a
;src/main.c:102: block01.vx = - block01.vx;
	ld	hl, #(_block01 + 0x0002) + 0
	ld	h,(hl)
	xor	a, a
	sub	a, h
	ld	d,a
	ld	hl,#(_block01 + 0x0002)
	ld	(hl),d
	ret
00108$:
;src/main.c:105: if ((block01.x+block01.vx)>0){
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P,00105$
;src/main.c:106: block01.x = block01.x + block01.vx;
	ld	hl,#_block01
	ld	(hl),c
	ret
00105$:
;src/main.c:109: block01.x = 0;
	ld	hl,#_block01
	ld	(hl),#0x00
;src/main.c:110: block01.vx = - block01.vx;
	ld	hl, #(_block01 + 0x0002) + 0
	ld	h,(hl)
	xor	a, a
	sub	a, h
	ld	d,a
	ld	hl,#(_block01 + 0x0002)
	ld	(hl),d
	ret
;src/main.c:118: void drawFrame(u8* screen) {
;	---------------------------------
; Function drawFrame
; ---------------------------------
_drawFrame::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:123: pattern = cpct_px2byteM0 (15, 15);
	ld	hl,#0x0F0F
	push	hl
	call	_cpct_px2byteM0
	pop	af
	ld	b,l
;src/main.c:126: pv = cpct_getScreenPtr(screen, (BACK_X),  (BACK_Y));
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	bc
	push	de
	ld	hl,#0x0000
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	de
	pop	bc
;src/main.c:127: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#0x0440
	push	hl
	push	bc
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	push	de
	ld	hl,#0xC500
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	de
	pop	bc
;src/main.c:131: cpct_drawSolidBox(pv, pattern, BACK_W,  4);
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#0x0440
	push	hl
	push	bc
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	push	de
	ld	hl,#0x0000
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	de
	pop	bc
;src/main.c:135: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#0xC702
	push	hl
	push	bc
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	ld	hl,#0x003E
	push	hl
	push	de
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	bc
;src/main.c:139: cpct_drawSolidBox(pv, pattern,  2, BACK_H );
	ex	de,hl
	ld	hl,#0xC702
	push	hl
	push	bc
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
;src/main.c:145: void updateUser() {
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:147: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:154: if ((cpct_isKeyPressed(Key_CursorUp))){ 
	ld	hl,#0x0100
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/main.c:155: if ((user.y-user.vy)>0)
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
	jp	PO, 00155$
	xor	a, #0x80
00155$:
	jp	P,00102$
;src/main.c:156: user.y = user.y - user.vy;
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0005)),a
	jr	00105$
00102$:
;src/main.c:158: user.y = 0;
	ld	hl,#(_user + 0x0005)
	ld	(hl),#0x00
00105$:
;src/main.c:161: if ((cpct_isKeyPressed(Key_CursorRight))){ 
	ld	hl,#0x0200
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/main.c:162: if ((user.x+user.vx<(79-user.w)))
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
	jp	PO, 00156$
	xor	a, #0x80
00156$:
	jp	P,00107$
;src/main.c:163: user.x = user.x + user.vx;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0004)),a
	jr	00110$
00107$:
;src/main.c:165: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, -1 (ix)
	ld	(#(_user + 0x0004)),a
00110$:
;src/main.c:168: if (cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00115$
;src/main.c:169: if ((user.x-user.vx)>0) 
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
	jp	PO, 00157$
	xor	a, #0x80
00157$:
	jp	P,00112$
;src/main.c:170: user.x = user.x - user.vx;    
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0004)),a
	jr	00115$
00112$:
;src/main.c:172: user.x = 0;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x00
00115$:
;src/main.c:175: if (cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00121$
;src/main.c:176: if ((user.y<(199-user.h) ))
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
	jp	PO, 00158$
	xor	a, #0x80
00158$:
	jp	P,00117$
;src/main.c:177: user.y = user.y + user.vy;
	ld	hl, #_user + 13
	ld	l,(hl)
	ld	a,e
	add	a, l
	ld	(#(_user + 0x0005)),a
	jr	00121$
00117$:
;src/main.c:179: user.y = 199-user.h;
	ld	a,#0xC7
	sub	a, -1 (ix)
	ld	(#(_user + 0x0005)),a
00121$:
	inc	sp
	pop	ix
	ret
;src/main.c:184: void initialization(){
;	---------------------------------
; Function initialization
; ---------------------------------
_initialization::
;src/main.c:186: pvmem = SCR_BUFF;
	ld	hl,#0x4000
	ld	(_pvmem),hl
;src/main.c:189: inicializarEstrellas();
	call	_inicializarEstrellas
;src/main.c:191: block01.x = 10;
	ld	hl,#_block01+0
	ld	(hl),#0x0A
;src/main.c:192: block01.y = 10;
	ld	hl,#_block01 + 1
	ld	(hl),#0x0A
;src/main.c:193: block01.vx = 2;
	ld	hl,#_block01 + 2
	ld	(hl),#0x02
;src/main.c:194: block01.vy = 0;
	ld	hl,#_block01 + 3
	ld	(hl),#0x00
;src/main.c:195: block01.w = 20;
	ld	hl,#_block01 + 4
	ld	(hl),#0x14
;src/main.c:196: block01.h = 40;
	ld	hl,#_block01 + 5
	ld	(hl),#0x28
;src/main.c:198: block02.x = 15;
	ld	hl,#_block02+0
	ld	(hl),#0x0F
;src/main.c:199: block02.y = 15;
	ld	hl,#_block02 + 1
	ld	(hl),#0x0F
;src/main.c:200: block02.vx = 4;
	ld	hl,#_block02 + 2
	ld	(hl),#0x04
;src/main.c:201: block02.vy = 0;
	ld	hl,#_block02 + 3
	ld	(hl),#0x00
;src/main.c:202: block02.w = 25;
	ld	hl,#_block02 + 4
	ld	(hl),#0x19
;src/main.c:203: block02.h = 20;
	ld	hl,#_block02 + 5
	ld	(hl),#0x14
;src/main.c:205: user.x = 39;
	ld	hl,#_user + 4
	ld	(hl),#0x27
;src/main.c:206: user.y = 183;
	ld	hl,#_user + 5
	ld	(hl),#0xB7
;src/main.c:207: user.w = 6;
	ld	hl,#_user + 6
	ld	(hl),#0x06
;src/main.c:208: user.h = 16;
	ld	hl,#_user + 7
	ld	(hl),#0x10
;src/main.c:209: user.vx = 2;
	ld	hl,#_user + 12
	ld	(hl),#0x02
;src/main.c:210: user.vy = 4;
	ld	hl,#_user + 13
	ld	(hl),#0x04
	ret
;src/main.c:214: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:216: cpct_disableFirmware();             // Disable firmware to prevent it from interfering
	call	_cpct_disableFirmware
;src/main.c:218: cpct_setPalette  (G_palette, 16);   // Set up palette using hardware colours
	ld	de,#_G_palette
	ld	a,#0x10
	push	af
	inc	sp
	push	de
	call	_cpct_setPalette
	pop	af
	inc	sp
;src/main.c:219: cpct_setBorder   (G_palette[1]);    // Set up the border to the background colour (white)
	ld	a, (#_G_palette + 1)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_cpct_setPALColour
	pop	af
;src/main.c:220: cpct_setVideoMode(0);               // Change to Mode 0 (160x200, 16 colours)
	xor	a, a
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
;src/main.c:223: cpct_memset(SCR_VMEM, 0x00, 0x4000);
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
;src/main.c:224: cpct_memset(SCR_BUFF, 0x00, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	call	_cpct_memset
	pop	af
	pop	af
	inc	sp
;src/main.c:226: initialization(); 
	call	_initialization
;src/main.c:229: while (1){
00104$:
;src/main.c:231: clear_screen(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_clear_screen
	pop	af
;src/main.c:233: updateUser();
	call	_updateUser
;src/main.c:234: updateBlock();
	call	_updateBlock
;src/main.c:236: moverEstrellas();
	call	_moverEstrellas
;src/main.c:237: pintarEstrellas(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_pintarEstrellas
	pop	af
;src/main.c:240: draw_blocks(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_blocks
	pop	af
;src/main.c:243: draw_sprite(pvmem);
	ld	hl,(_pvmem)
	push	hl
	call	_draw_sprite
	pop	af
;src/main.c:246: pvmem = changeVideoMemoryPage();
	call	_changeVideoMemoryPage
	ld	(_pvmem),hl
;src/main.c:249: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
