;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Fri Aug  7 17:19:38 2015
;--------------------------------------------------------
	.module messages
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpc_SetInkGphStr
	.globl _cpc_PrintGphStr2X
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _aux_txt2
	.globl _active_messages
	.globl _messages
	.globl _strcpy
	.globl _strlen
	.globl _colour_message
	.globl _red_message
	.globl _blue_message
	.globl _init_messages
	.globl _create_message
	.globl _draw_messages
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_messages::
	.ds 340
_active_messages::
	.ds 1
_aux_txt2::
	.ds 40
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/entities/messages.c:14: void strcpy(i8* to, const i8* from){
;	---------------------------------
; Function strcpy
; ---------------------------------
_strcpy::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/messages.c:17: while (i){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	pop	iy
	ld	d,#0x1E
00101$:
	ld	a,d
	or	a, a
	jr	Z,00104$
;src/entities/messages.c:18: *to++ = *from++;
	ld	a,(bc)
	inc	bc
	ld	0 (iy), a
	inc	iy
;src/entities/messages.c:19: i--;
	dec	d
	jr	00101$
00104$:
	pop	ix
	ret
;src/entities/messages.c:23: u8 strlen(const char *str)
;	---------------------------------
; Function strlen
; ---------------------------------
_strlen::
;src/entities/messages.c:27: for (s = str; *s; ++s);
	pop	bc
	pop	de
	push	de
	push	bc
00103$:
	ld	a,(de)
	or	a, a
	jr	Z,00101$
	inc	de
	jr	00103$
00101$:
;src/entities/messages.c:28: return(s - str);
	ld	hl,#2
	add	hl,sp
	ld	a,e
	sub	a, (hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a, (hl)
	ld	l,e
	ret
;src/entities/messages.c:35: void colour_message (u8 backg, u8 t){
;	---------------------------------
; Function colour_message
; ---------------------------------
_colour_message::
;src/entities/messages.c:36: cpc_SetInkGphStr(0,backg);
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
;src/entities/messages.c:37: cpc_SetInkGphStr(1,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x01
	push	de
	call	_cpc_SetInkGphStr
	pop	af
;src/entities/messages.c:38: cpc_SetInkGphStr(2,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x02
	push	de
	call	_cpc_SetInkGphStr
	pop	af
;src/entities/messages.c:39: cpc_SetInkGphStr(3,t);
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x03
	push	de
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/entities/messages.c:45: void red_message(){
;	---------------------------------
; Function red_message
; ---------------------------------
_red_message::
;src/entities/messages.c:47: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:48: cpc_SetInkGphStr(1,42);
	ld	hl, #0x2A01
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:49: cpc_SetInkGphStr(2,34);
	ld	hl, #0x2202
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:50: cpc_SetInkGphStr(3,42);
	ld	hl, #0x2A03
	ex	(sp),hl
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/entities/messages.c:56: void blue_message(){
;	---------------------------------
; Function blue_message
; ---------------------------------
_blue_message::
;src/entities/messages.c:58: cpc_SetInkGphStr(0,0);
	ld	hl,#0x0000
	push	hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:59: cpc_SetInkGphStr(1,40);
	ld	hl, #0x2801
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:60: cpc_SetInkGphStr(2,40);
	ld	hl, #0x2802
	ex	(sp),hl
	call	_cpc_SetInkGphStr
;src/entities/messages.c:61: cpc_SetInkGphStr(3,10);
	ld	hl, #0x0A03
	ex	(sp),hl
	call	_cpc_SetInkGphStr
	pop	af
	ret
;src/entities/messages.c:64: void init_messages(){
;	---------------------------------
; Function init_messages
; ---------------------------------
_init_messages::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/messages.c:68: messages[i].active=0;
	ld	hl,#_messages
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;src/entities/messages.c:69: messages[i].x=0;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl),#0x00
;src/entities/messages.c:70: messages[i].y=0;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl),#0x00
;src/entities/messages.c:71: messages[i].time=0;
	ld	hl,#0x0021
	add	hl,bc
	ld	(hl),#0x00
;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
	ld	hl,#0x0022
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x0A
	jr	C,00102$
;src/entities/messages.c:73: active_messages=0;
	ld	hl,#_active_messages + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/messages.c:76: void create_message(u8 x, u8 y, u8 time, u8 *text){
;	---------------------------------
; Function create_message
; ---------------------------------
_create_message::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/messages.c:79: while (messages[i].active==1) { 
	ld	bc,#0x0000
00101$:
	ld	hl,#_messages
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	dec	a
	jr	NZ,00103$
;src/entities/messages.c:80: i++;
	ld	hl,#0x0022
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00101$
00103$:
;src/entities/messages.c:82: messages[i].active=1;
	ld	a,#0x01
	ld	(de),a
;src/entities/messages.c:83: messages[i].x = x;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/messages.c:84: messages[i].y = y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/messages.c:85: messages[i].time = time;
	ld	hl,#0x0021
	add	hl,de
	ld	a,6 (ix)
	ld	(hl),a
;src/entities/messages.c:86: strcpy(messages[i].text,text);
	inc	de
	inc	de
	inc	de
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	push	de
	call	_strcpy
	pop	af
	pop	af
;src/entities/messages.c:87: active_messages++;
	ld	hl, #_active_messages+0
	inc	(hl)
	pop	ix
	ret
;src/entities/messages.c:90: void draw_messages(u8* screen){
;	---------------------------------
; Function draw_messages
; ---------------------------------
_draw_messages::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/entities/messages.c:94: if (active_messages){
	ld	a,(#_active_messages + 0)
	or	a, a
	jp	Z,00110$
;src/entities/messages.c:95: blue_message();
	call	_blue_message
;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
	ld	-13 (ix),#0x00
	ld	de,#0x0000
00108$:
;src/entities/messages.c:97: if (messages[i].active){
	ld	hl,#_messages
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00109$
;src/entities/messages.c:98: pscreen = cpct_getScreenPtr(screen, messages[i].x-2, messages[i].y-4);
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	add	a,#0xFC
	ld	b,a
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	dec	c
	dec	c
	ld	a,4 (ix)
	ld	-8 (ix),a
	ld	a,5 (ix)
	ld	-7 (ix),a
	push	de
	push	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	c, l
	ld	b, h
;src/entities/messages.c:99: cpct_drawSolidBox(pscreen , cpct_px2byteM0(3, 3), strlen(messages[i].text)*2+4, 18);
	ld	a,-2 (ix)
	add	a, #0x03
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	bc
	push	de
	push	hl
	call	_strlen
	pop	af
	ld	a,l
	pop	de
	pop	bc
	add	a, a
	add	a, #0x04
	ld	-11 (ix),a
	push	bc
	push	de
	ld	hl,#0x0303
	push	hl
	call	_cpct_px2byteM0
	pop	af
	ld	-12 (ix),l
	pop	de
	pop	bc
	push	de
	ld	a,#0x12
	push	af
	inc	sp
	ld	h,-11 (ix)
	ld	l,-12 (ix)
	push	hl
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
;src/entities/messages.c:100: cpc_PrintGphStr2X(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,(hl)
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	c,-10 (ix)
	ld	b,-9 (ix)
	push	de
	push	hl
	push	bc
	call	_cpc_PrintGphStr2X
	pop	af
	pop	af
	pop	de
;src/entities/messages.c:101: messages[i].time--;
	ld	a,-2 (ix)
	add	a, #0x21
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	add	a,#0xFF
	ld	(hl),a
;src/entities/messages.c:102: if (!messages[i].time){
	or	a, a
	jr	NZ,00109$
;src/entities/messages.c:103: messages[i].active=0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/entities/messages.c:104: active_messages--;
	ld	hl, #_active_messages+0
	dec	(hl)
00109$:
;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
	ld	hl,#0x0022
	add	hl,de
	ex	de,hl
	inc	-13 (ix)
	ld	a,-13 (ix)
	sub	a, #0x0A
	jp	C,00108$
00110$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
