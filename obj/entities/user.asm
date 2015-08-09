;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Fri Aug  7 15:43:54 2015
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
	.globl _set_score
	.globl _add_score
	.globl _get_score
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_user::
	.ds 26
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
;src/entities/user.c:22: user.score = 0;
	ld	hl,#0x0000
	ld	((_user + 0x0016)),hl
	ld	((_user + 0x0016)+2), hl
;src/entities/user.c:24: user.max_shoots = 10;
	ld	hl,#_user + 21
	ld	(hl),#0x0A
;src/entities/user.c:25: shoot_type = 1;
	ld	hl,#_shoot_type + 0
	ld	(hl), #0x01
	ret
;src/entities/user.c:28: u8 get_user_max_shoots(){
;	---------------------------------
; Function get_user_max_shoots
; ---------------------------------
_get_user_max_shoots::
;src/entities/user.c:29: return user.max_shoots;
	ld	hl,#_user+21
	ld	l,(hl)
	ret
;src/entities/user.c:32: void update_user() {
;	---------------------------------
; Function update_user
; ---------------------------------
_update_user::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/user.c:35: user.ax=0;
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0x00
;src/entities/user.c:38: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/entities/user.c:45: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	hl,#0x0808
	push	hl
	call	_cpct_isKeyPressed
	pop	af
;src/entities/user.c:46: user.ay = -2;
;src/entities/user.c:45: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/entities/user.c:46: user.ay = -2;
	ld	hl,#(_user + 0x000d)
	ld	(hl),#0xFE
	jr	00105$
00104$:
;src/entities/user.c:47: } else if (cpct_isKeyPressed(Key_A)){
	ld	hl,#0x2008
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/entities/user.c:48: user.ay=2;    
	ld	hl,#(_user + 0x000d)
	ld	(hl),#0x02
00105$:
;src/entities/user.c:51: if ((cpct_isKeyPressed(Key_P))){ 
	ld	hl,#0x0803
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00109$
;src/entities/user.c:52: user.ax = 2;
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0x02
	jr	00110$
00109$:
;src/entities/user.c:53: } else if (cpct_isKeyPressed(Key_O)){
	ld	hl,#0x0404
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/entities/user.c:54: user.ax=-2;    
	ld	hl,#(_user + 0x000c)
	ld	(hl),#0xFE
00110$:
;src/entities/user.c:58: if (cpct_isKeyPressed(Key_D)){
	ld	hl,#0x2007
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00112$
;src/entities/user.c:59: shoot_type=(shoot_type+1)%2;
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
00112$:
;src/entities/user.c:62: if (cpct_isKeyPressed(Key_H)){
	ld	hl,#0x1005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00114$
;src/entities/user.c:63: create_enemy((rand()%80),(rand()%199),(rand()%3));
	call	_rand
	ld	bc,#0x0003
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-1 (ix),l
	call	_rand
	ld	bc,#0x00C7
	push	bc
	push	hl
	call	__modsint
	pop	af
	ex	(sp),hl
	call	_rand
	ld	de,#0x0050
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	push	de
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
00114$:
;src/entities/user.c:66: if (cpct_isKeyPressed(Key_J)){
	ld	hl,#0x2005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jp	Z,00116$
;src/entities/user.c:67: x=rand()%80;
	call	_rand
	ld	bc,#0x0050
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-4 (ix),l
;src/entities/user.c:68: y=rand()%199;
	call	_rand
	ld	bc,#0x00C7
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c,l
;src/entities/user.c:69: create_enemy(x,y,(rand()%3));
	push	bc
	call	_rand
	ld	de,#0x0003
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	e,l
	ld	-3 (ix),c
	ld	-2 (ix),#0x00
	ld	c,-4 (ix)
	ld	b,#0x00
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	bc
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
	ld	e,l
	ld	hl,#0x0008
	add	hl,bc
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	push	de
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
	ld	e,l
	ld	hl,#0x0010
	add	hl,bc
	ld	a,e
	push	af
	inc	sp
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	push	hl
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
00116$:
;src/entities/user.c:74: if (cpct_isKeyPressed(Key_K)){
	ld	hl,#0x2004
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00118$
;src/entities/user.c:75: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
	call	_rand
	ld	bc,#0x0003
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-3 (ix),l
	call	_rand
	ld	bc,#0x0028
	push	bc
	push	hl
	call	__modsint
	pop	af
	ex	(sp),hl
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
	ld	a,#0x0C
	push	af
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	push	de
	call	_create_enemy_group
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00118$:
;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	push	hl
	call	_cpct_isKeyPressed
	pop	af
;src/entities/user.c:79: create_shoot(user.x+2, user.y, shoot_type);
;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/entities/user.c:79: create_shoot(user.x+2, user.y, shoot_type);
	ld	hl, #_user + 7
	ld	b,(hl)
	ld	a, (#(_user + 0x0006) + 0)
	ld	d,a
	inc	d
	inc	d
	ld	a,(_shoot_type)
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_create_shoot
	pop	af
	inc	sp
00120$:
;src/entities/user.c:83: if (cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	push	hl
	call	_cpct_isKeyPressed
	pop	af
	ld	a,l
	or	a, a
	jr	Z,00122$
;src/entities/user.c:84: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
	call	_rand
	ld	bc,#0x0002
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-3 (ix),l
	call	_rand
	ld	bc,#0x0050
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	a,l
	add	a, #0x14
	ld	e,a
	push	de
	call	_rand
	ld	bc,#0x0014
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	a,l
	add	a, #0x05
	ld	d,a
	ld	a,-3 (ix)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_create_explosion
	pop	af
	inc	sp
00122$:
;src/entities/user.c:88: if (user.ax!=0){
	ld	hl, #(_user + 0x000c) + 0
	ld	d,(hl)
;src/entities/user.c:89: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
;src/entities/user.c:88: if (user.ax!=0){
	ld	a,d
	or	a, a
	jr	Z,00129$
;src/entities/user.c:89: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
	ld	hl, #(_user + 0x0008) + 0
	ld	e,(hl)
	ld	hl,#_user + 10
	bit	7, e
	jr	NZ,00127$
	ld	b,(hl)
	ld	a,e
	sub	a, b
	jp	PO, 00210$
	xor	a, #0x80
00210$:
	jp	M,00123$
00127$:
	xor	a, a
	sub	a, e
	jp	PO, 00211$
	xor	a, #0x80
00211$:
	jp	M,00129$
	ld	a,(hl)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	xor	a, a
	sub	a, l
	ld	l,a
	ld	a, #0x00
	sbc	a, h
	ld	h,a
	ld	a,e
	ld	c,a
	rla
	sbc	a, a
	ld	b,a
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00212$
	xor	a, #0x80
00212$:
	jp	P,00129$
00123$:
;src/entities/user.c:90: user.vx+=user.ax;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0008)),a
00129$:
;src/entities/user.c:94: if (user.vx>0){
	ld	hl, #(_user + 0x0008) + 0
	ld	d,(hl)
	xor	a, a
	sub	a, d
	jp	PO, 00213$
	xor	a, #0x80
00213$:
	jp	P,00133$
;src/entities/user.c:95: user.vx--;
	dec	d
	ld	hl,#(_user + 0x0008)
	ld	(hl),d
	jr	00134$
00133$:
;src/entities/user.c:96: } else if (user.vx<0){
	bit	7, d
	jr	Z,00134$
;src/entities/user.c:97: user.vx++;
	inc	d
	ld	hl,#(_user + 0x0008)
	ld	(hl),d
00134$:
;src/entities/user.c:100: user.x+=user.vx;
	ld	hl, #(_user + 0x0006) + 0
	ld	d,(hl)
	ld	hl, #(_user + 0x0008) + 0
	ld	h,(hl)
	ld	a,d
	add	a, h
	ld	d,a
	ld	hl,#(_user + 0x0006)
	ld	(hl),d
;src/entities/user.c:102: if (user.x<0)
	ld	hl, #(_user + 0x0006) + 0
	ld	e,(hl)
	bit	7, d
	jr	Z,00138$
;src/entities/user.c:103: user.x=0;
	ld	hl,#(_user + 0x0006)
	ld	(hl),#0x00
	jr	00140$
00138$:
;src/entities/user.c:104: else if (user.x> 79-user.w){
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
	jp	PO, 00214$
	xor	a, #0x80
00214$:
	jp	P,00140$
;src/entities/user.c:105: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, h
	ld	(#(_user + 0x0006)),a
00140$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/user.c:109: void draw_user(u8* screen){
;	---------------------------------
; Function draw_user
; ---------------------------------
_draw_user::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/user.c:111: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
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
	ex	de,hl
;src/entities/user.c:112: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
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
;src/entities/user.c:115: void set_score(u32 new_score){
;	---------------------------------
; Function set_score
; ---------------------------------
_set_score::
;src/entities/user.c:116: user.score = new_score;
	ld	de,#_user+22
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ret
;src/entities/user.c:118: void add_score(u16 new_add_score){
;	---------------------------------
; Function add_score
; ---------------------------------
_add_score::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/user.c:119: user.score += new_add_score;
	ld	de,#(_user + 0x0016)
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	bc,#0x0000
	ld	a,-4 (ix)
	add	a, l
	ld	e,a
	ld	a,-3 (ix)
	adc	a, h
	ld	d,a
	ld	a,-2 (ix)
	adc	a, c
	ld	c,a
	ld	a,-1 (ix)
	adc	a, b
	ld	b,a
	ld	((_user + 0x0016)), de
	ld	((_user + 0x0016)+2), bc
	ld	sp, ix
	pop	ix
	ret
;src/entities/user.c:121: u32 get_score(){
;	---------------------------------
; Function get_score
; ---------------------------------
_get_score::
;src/entities/user.c:122: return user.score;
	ld	hl, (#(_user + 0x0016) + 0)
	ld	de, (#(_user + 0x0016) + 2)
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
