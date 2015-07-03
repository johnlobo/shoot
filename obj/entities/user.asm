;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
; This file was generated Fri Jul  3 18:17:51 2015
;--------------------------------------------------------
	.module user
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _create_shoot
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _shoot_type
	.globl _user
	.globl _init_user
	.globl _get_user_max_shoots
	.globl _update_user
	.globl _draw_user
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_user::
	.ds 18
_shoot_type::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/entities/user.c:8: void init_user(){
;	---------------------------------
; Function init_user
; ---------------------------------
_init_user::
;src/entities/user.c:17: user.w = 6;
	ld	hl,#_user + 8
	ld	(hl),#0x06
;src/entities/user.c:18: user.h = 16;
	ld	iy,#_user + 9
	ld	0 (iy), #0x10
;src/entities/user.c:19: user.x = 39-(user.w/2);
	ld	l,(hl)
	srl	l
	ld	a,#0x27
	sub	a, l
	ld	(#(_user + 0x0006)),a
;src/entities/user.c:20: user.y = 199-(user.h);
	ld	h, 0 (iy)
	ld	a,#0xC7
	sub	a, h
	ld	(#(_user + 0x0007)),a
;src/entities/user.c:21: user.sprite = (u8*) ship03;
	ld	hl,#_ship03
	ld	((_user + 0x0004)), hl
;src/entities/user.c:23: user.vx = 2;
	ld	hl,#_user + 14
	ld	(hl),#0x02
;src/entities/user.c:24: user.vy = 4;
	ld	hl,#_user + 15
	ld	(hl),#0x04
;src/entities/user.c:25: user.max_shoots = 10;
	ld	hl,#_user + 17
	ld	(hl),#0x0A
;src/entities/user.c:26: shoot_type = 1;
	ld	hl,#_shoot_type + 0
	ld	(hl), #0x01
	ret
;src/entities/user.c:29: u8 get_user_max_shoots(){
;	---------------------------------
; Function get_user_max_shoots
; ---------------------------------
_get_user_max_shoots::
;src/entities/user.c:30: return user.max_shoots;
	ld	hl,#_user+17
	ld	l,(hl)
	ret
;src/entities/user.c:36: void update_user() {
;	---------------------------------
; Function update_user
; ---------------------------------
_update_user::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/user.c:39: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/entities/user.c:46: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	hl,#0x0808
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/entities/user.c:47: if ((user.y-user.vy)>0)
	ld	hl, #(_user + 0x0007) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 15
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
	jp	PO, 00167$
	xor	a, #0x80
00167$:
	jp	P,00102$
;src/entities/user.c:48: user.y = user.y - user.vy;
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0007)),a
	jr	00105$
00102$:
;src/entities/user.c:50: user.y = 0;
	ld	hl,#(_user + 0x0007)
	ld	(hl),#0x00
00105$:
;src/entities/user.c:53: if ((cpct_isKeyPressed(Key_P))){ 
	ld	hl,#0x0803
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/entities/user.c:54: if ((user.x+user.vx<(79-user.w)))
	ld	hl, #(_user + 0x0006) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 14
	ld	d,(hl)
	ld	a,d
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#_user + 8)
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
	jp	PO, 00168$
	xor	a, #0x80
00168$:
	jp	P,00107$
;src/entities/user.c:55: user.x = user.x + user.vx;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0006)),a
	jr	00110$
00107$:
;src/entities/user.c:57: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, -1 (ix)
	ld	(#(_user + 0x0006)),a
00110$:
;src/entities/user.c:60: if (cpct_isKeyPressed(Key_O)){
	ld	hl,#0x0404
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00115$
;src/entities/user.c:61: if ((user.x-user.vx)>0) 
	ld	hl, #(_user + 0x0006) + 0
	ld	e,(hl)
	ld	c,e
	ld	b,#0x00
	ld	hl, #_user + 14
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
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	P,00112$
;src/entities/user.c:62: user.x = user.x - user.vx;    
	ld	a,e
	sub	a, d
	ld	(#(_user + 0x0006)),a
	jr	00115$
00112$:
;src/entities/user.c:64: user.x = 0;
	ld	hl,#(_user + 0x0006)
	ld	(hl),#0x00
00115$:
;src/entities/user.c:67: if (cpct_isKeyPressed(Key_A)){
	ld	hl,#0x2008
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/entities/user.c:68: if ((user.y<(199-user.h) ))
	ld	hl, #(_user + 0x0007) + 0
	ld	e,(hl)
	ld	a,(#_user + 9)
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
	jp	PO, 00170$
	xor	a, #0x80
00170$:
	jp	P,00117$
;src/entities/user.c:69: user.y = user.y + user.vy;
	ld	hl, #_user + 15
	ld	l,(hl)
	ld	a,e
	add	a, l
	ld	(#(_user + 0x0007)),a
	jr	00120$
00117$:
;src/entities/user.c:71: user.y = 199-user.h;
	ld	a,#0xC7
	sub	a, -1 (ix)
	ld	(#(_user + 0x0007)),a
00120$:
;src/entities/user.c:74: if (cpct_isKeyPressed(Key_D)){
	ld	hl,#0x2007
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00122$
;src/entities/user.c:75: shoot_type=(shoot_type+1)%2;
	ld	iy,#_shoot_type
	ld	l,0 (iy)
	ld	h,#0x00
	inc	hl
	ld	bc,#0x0002
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	iy,#_shoot_type
	ld	0 (iy),l
00122$:
;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00125$
;src/entities/user.c:79: create_shoot(user.x+3, user.y-1, shoot_type);
	ld	a, (#_user + 7)
	ld	e,a
	dec	e
	ld	a, (#_user + 6)
	ld	d,a
	inc	d
	inc	d
	inc	d
	ld	a,(_shoot_type)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_create_shoot
	pop	af
	inc	sp
00125$:
	inc	sp
	pop	ix
	ret
;src/entities/user.c:84: void draw_user(u8* screen){
;	---------------------------------
; Function draw_user
; ---------------------------------
_draw_user::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/user.c:86: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
	ld	hl, #_user + 7
	ld	c,(hl)
	ld	hl, #_user + 6
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
;src/entities/user.c:87: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
	ld	hl, #_user + 9
	ld	c,(hl)
	ld	hl, #_user + 8
	ld	b,(hl)
	ld	hl, (#_user + 4)
	push	hl
	pop	iy
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	push	iy
	call	_cpct_drawSprite
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
