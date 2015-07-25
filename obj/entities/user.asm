;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
; This file was generated Thu Jul 23 01:06:51 2015
;--------------------------------------------------------
	.module user
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _create_explosion
	.globl _create_enemy_group
	.globl _create_enemy
	.globl _create_shoot
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _rand
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
	.ds 22
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
;src/entities/user.c:9: void init_user(){
;	---------------------------------
; Function init_user
; ---------------------------------
_init_user::
;src/entities/user.c:11: user.w = 4;
	ld	hl,#_user + 14
	ld	(hl),#0x04
;src/entities/user.c:12: user.h = 8;
	ld	iy,#_user + 15
	ld	0 (iy), #0x08
;src/entities/user.c:13: user.x = 39-(user.w/2);
	ld	l,(hl)
	srl	l
	ld	a,#0x27
	sub	a, l
	ld	(#(_user + 0x0006)),a
;src/entities/user.c:14: user.y = 199-(user.h);
	ld	h, 0 (iy)
	ld	a,#0xC7
	sub	a, h
	ld	(#(_user + 0x0007)),a
;src/entities/user.c:15: user.vx = 0;
	ld	hl,#_user + 8
	ld	(hl),#0x00
;src/entities/user.c:16: user.vy = 0;
	ld	hl,#_user + 9
	ld	(hl),#0x00
;src/entities/user.c:17: user.topvx = 4;
	ld	hl,#_user + 10
	ld	(hl),#0x04
;src/entities/user.c:18: user.topvy = 5;
	ld	hl,#_user + 11
	ld	(hl),#0x05
;src/entities/user.c:19: user.ax=0;
	ld	hl,#_user + 12
	ld	(hl),#0x00
;src/entities/user.c:20: user.ay=0;
	ld	hl,#_user + 13
	ld	(hl),#0x00
;src/entities/user.c:21: user.sprite = (u8*) G_ship_00;
	ld	hl,#_G_ship_00
	ld	((_user + 0x0004)), hl
;src/entities/user.c:23: user.max_shoots = 10;
	ld	hl,#_user + 21
	ld	(hl),#0x0A
;src/entities/user.c:24: shoot_type = 1;
	ld	hl,#_shoot_type + 0
	ld	(hl), #0x01
	ret
;src/entities/user.c:27: u8 get_user_max_shoots(){
;	---------------------------------
; Function get_user_max_shoots
; ---------------------------------
_get_user_max_shoots::
;src/entities/user.c:28: return user.max_shoots;
	ld	hl,#_user+21
	ld	l,(hl)
	ret
;src/entities/user.c:31: void update_user() {
;	---------------------------------
; Function update_user
; ---------------------------------
_update_user::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/entities/user.c:34: user.ax=0;
	ld	bc,#_user+0
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0x00
;src/entities/user.c:37: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	ld	hl,#0x0808
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	pop	bc
;src/entities/user.c:45: user.ay = -2;
;src/entities/user.c:44: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	a,l
	or	a, a
	jr	Z,00102$
;src/entities/user.c:45: user.ay = -2;
	ld	hl,#(_user + 0x000d)
	ld	(hl),#0xFE
00102$:
;src/entities/user.c:48: if ((cpct_isKeyPressed(Key_P))){ 
	push	bc
	ld	hl,#0x0803
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00104$
;src/entities/user.c:49: user.ax = 2;
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0x02
00104$:
;src/entities/user.c:52: if (cpct_isKeyPressed(Key_O)){
	push	bc
	ld	hl,#0x0404
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00106$
;src/entities/user.c:53: user.ax=-2;    
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0xFE
00106$:
;src/entities/user.c:56: if (cpct_isKeyPressed(Key_A)){
	push	bc
	ld	hl,#0x2008
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00108$
;src/entities/user.c:57: user.ay=2;    
	ld	hl,#(_user + 0x000d)
	ld	(hl),#0x02
00108$:
;src/entities/user.c:60: if (cpct_isKeyPressed(Key_D)){
	push	bc
	ld	hl,#0x2007
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00110$
;src/entities/user.c:61: shoot_type=(shoot_type+1)%2;
	ld	iy,#_shoot_type
	ld	l,0 (iy)
	ld	h,#0x00
	inc	hl
	push	bc
	ld	de,#0x0002
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	iy,#_shoot_type
	ld	0 (iy),l
00110$:
;src/entities/user.c:64: if (cpct_isKeyPressed(Key_H)){
	push	bc
	ld	hl,#0x1005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00112$
;src/entities/user.c:65: create_enemy((rand()%80),(rand()%199),(rand()%3));
	push	bc
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-1 (ix),l
	push	bc
	call	_rand
	ld	de,#0x00C7
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix),h
	ld	-3 (ix),l
	call	_rand
	ld	de,#0x0050
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	pop	bc
00112$:
;src/entities/user.c:68: if (cpct_isKeyPressed(Key_J)){
	push	bc
	ld	hl,#0x2005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jp	Z,00114$
;src/entities/user.c:69: x=rand()%80;
	push	bc
	call	_rand
	ld	de,#0x0050
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-6 (ix),l
;src/entities/user.c:70: y=rand()%199;
	push	bc
	call	_rand
	ld	de,#0x00C7
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-7 (ix),l
;src/entities/user.c:71: create_enemy(x,y,(rand()%3));
	push	bc
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	h,l
	ld	a,-7 (ix)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-6 (ix)
	ld	-5 (ix),a
	ld	-4 (ix),#0x00
	push	bc
	push	hl
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	h,l
	ld	a,-5 (ix)
	add	a, #0x08
	ld	e,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	d,a
	push	bc
	push	hl
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	h,l
	ld	a,-5 (ix)
	add	a, #0x10
	ld	e,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	d,a
	push	bc
	push	hl
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	pop	bc
00114$:
;src/entities/user.c:76: if (cpct_isKeyPressed(Key_K)){
	push	bc
	ld	hl,#0x2004
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00116$
;src/entities/user.c:77: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
	push	bc
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-5 (ix),l
	push	bc
	call	_rand
	ld	de,#0x0028
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix),h
	ld	-3 (ix),l
	call	_rand
	ld	de,#0x000A
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	push	bc
	ld	a,#0x0C
	push	af
	inc	sp
	ld	a,-5 (ix)
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_create_enemy_group
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
00116$:
;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
	push	bc
	ld	hl,#0x8005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	pop	bc
;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
;src/entities/user.c:80: if (cpct_isKeyPressed(Key_Space)){
	ld	a,l
	or	a, a
	jr	Z,00118$
;src/entities/user.c:81: create_shoot(user.x+2, user.y, shoot_type);
	ld	hl, #_user + 7
	ld	e,(hl)
	ld	a, (#(_user + 0x0006) + 0)
	ld	d,a
	inc	d
	inc	d
	push	bc
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
	pop	bc
00118$:
;src/entities/user.c:85: if (cpct_isKeyPressed(Key_L)){
	push	bc
	ld	hl,#0x1004
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00120$
;src/entities/user.c:86: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
	push	bc
	call	_rand
	ld	de,#0x0002
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	-5 (ix),l
	push	bc
	call	_rand
	ld	de,#0x0050
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	add	a, #0x14
	ld	-3 (ix),a
	push	bc
	call	_rand
	ld	de,#0x0014
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	add	a, #0x05
	ld	d,a
	push	bc
	ld	h,-5 (ix)
	ld	l,-3 (ix)
	push	hl
	push	de
	inc	sp
	call	_create_explosion
	pop	af
	inc	sp
	pop	bc
00120$:
;src/entities/user.c:89: if (user.ax!=0){
	ld	hl, #(_user + 0x000c) + 0
	ld	d,(hl)
;src/entities/user.c:90: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
;src/entities/user.c:89: if (user.ax!=0){
	ld	a,d
	or	a, a
	jr	Z,00127$
;src/entities/user.c:90: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
	ld	hl, #(_user + 0x0008) + 0
	ld	e,(hl)
	bit	7, e
	jr	NZ,00125$
	ld	hl, #(_user + 0x000a) + 0
	ld	h,(hl)
	ld	a,e
	sub	a, h
	jp	PO, 00208$
	xor	a, #0x80
00208$:
	jp	M,00121$
00125$:
	xor	a, a
	sub	a, e
	jp	PO, 00209$
	xor	a, #0x80
00209$:
	jp	M,00127$
	ld	a, (#(_user + 0x000a) + 0)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	xor	a, a
	sub	a, l
	ld	-5 (ix),a
	ld	a, #0x00
	sbc	a, h
	ld	-4 (ix),a
	ld	a,e
	ld	h,a
	rla
	sbc	a, a
	ld	l,a
	ld	a,-5 (ix)
	sub	a, h
	ld	a,-4 (ix)
	sbc	a, l
	jp	PO, 00210$
	xor	a, #0x80
00210$:
	jp	P,00127$
00121$:
;src/entities/user.c:91: user.vx+=user.ax;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0008)),a
00127$:
;src/entities/user.c:95: if (user.vx>0){
	ld	hl, #(_user + 0x0008) + 0
	ld	d,(hl)
	xor	a, a
	sub	a, d
	jp	PO, 00211$
	xor	a, #0x80
00211$:
	jp	P,00131$
;src/entities/user.c:96: user.vx--;
	dec	d
	ld	hl,#(_user + 0x0008)
	ld	(hl),d
	jr	00132$
00131$:
;src/entities/user.c:97: } else if (user.vx<0){
	bit	7, d
	jr	Z,00132$
;src/entities/user.c:98: user.vx++;
	inc	d
	ld	hl,#(_user + 0x0008)
	ld	(hl),d
00132$:
;src/entities/user.c:101: user.x+=user.vx;
	ld	hl, #(_user + 0x0006) + 0
	ld	d,(hl)
	ld	hl, #(_user + 0x0008) + 0
	ld	h,(hl)
	ld	a,d
	add	a, h
	ld	d,a
	ld	hl,#(_user + 0x0006)
	ld	(hl),d
;src/entities/user.c:103: if (user.x<0)
	ld	hl, #(_user + 0x0006) + 0
	ld	e,(hl)
	bit	7, d
	jr	Z,00136$
;src/entities/user.c:104: user.x=0;
	ld	hl,#(_user + 0x0006)
	ld	(hl),#0x00
	jr	00138$
00136$:
;src/entities/user.c:105: else if (user.x> 79-user.w){
	ld	hl, #_user + 14
	ld	h,(hl)
	ld	c,h
	ld	b,#0x00
	ld	a,#0x4F
	sub	a, c
	ld	c,a
	ld	a,#0x00
	sbc	a, b
	ld	b,a
	ld	a,e
	rla
	sbc	a, a
	ld	d,a
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00212$
	xor	a, #0x80
00212$:
	jp	P,00138$
;src/entities/user.c:106: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, h
	ld	(#(_user + 0x0006)),a
00138$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/user.c:110: void draw_user(u8* screen){
;	---------------------------------
; Function draw_user
; ---------------------------------
_draw_user::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/user.c:112: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
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
;src/entities/user.c:113: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
	ld	hl, #_user + 15
	ld	c,(hl)
	ld	hl, #_user + 14
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
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
