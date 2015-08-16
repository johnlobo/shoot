;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Sun Aug 16 01:47:07 2015
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
	.globl _engine_anim
	.globl _shoot_type
	.globl _user
	.globl _init_user
	.globl _user_init_level
	.globl _get_last_moved_user
	.globl _get_user_max_shoots
	.globl _get_user_speed
	.globl _user_engine
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
	.ds 25
_shoot_type::
	.ds 1
_engine_anim::
	.ds 4
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
;src/entities/user.c:10: void init_user(){
;	---------------------------------
; Function init_user
; ---------------------------------
_init_user::
;src/entities/user.c:12: user.w = 4;
	ld	hl,#_user + 10
	ld	(hl),#0x04
;src/entities/user.c:13: user.h = 8;
	ld	iy,#_user + 11
	ld	0 (iy), #0x08
;src/entities/user.c:14: user.x = 39-(user.w/2);
	ld	l,(hl)
	srl	l
	ld	a,#0x27
	sub	a, l
	ld	(#(_user + 0x0002)),a
;src/entities/user.c:15: user.y = 199-(user.h);
	ld	h, 0 (iy)
	ld	a,#0xC7
	sub	a, h
	ld	(#(_user + 0x0003)),a
;src/entities/user.c:16: user.vx = 0;
	ld	hl,#_user + 4
	ld	(hl),#0x00
;src/entities/user.c:17: user.vy = 0;
	ld	hl,#_user + 5
	ld	(hl),#0x00
;src/entities/user.c:18: user.topvx = 4;
	ld	hl,#_user + 6
	ld	(hl),#0x04
;src/entities/user.c:19: user.topvy = 5;
	ld	hl,#_user + 7
	ld	(hl),#0x05
;src/entities/user.c:20: user.ax=0;
	ld	hl,#_user + 8
	ld	(hl),#0x00
;src/entities/user.c:21: user.ay=0;
	ld	hl,#_user + 9
	ld	(hl),#0x00
;src/entities/user.c:22: user.sprite = (u8*) G_ship_00;
	ld	hl,#_G_ship_00
	ld	(_user), hl
;src/entities/user.c:23: user.score = 0;
	ld	hl,#0x0000
	ld	((_user + 0x000f)),hl
	ld	((_user + 0x000f)+2), hl
;src/entities/user.c:24: user.shield = 0;
	ld	hl,#_user + 13
	ld	(hl),#0x00
;src/entities/user.c:25: user.lives = 0;
	ld	hl,#_user + 14
	ld	(hl),#0x00
;src/entities/user.c:27: user.max_shoots = 3;
	ld	hl,#_user + 12
	ld	(hl),#0x03
;src/entities/user.c:28: shoot_type = 1;
	ld	hl,#_shoot_type + 0
	ld	(hl), #0x01
;src/entities/user.c:29: user.last_moved = 0;
	ld	hl,#0x0000
	ld	((_user + 0x0015)),hl
	ld	((_user + 0x0015)+2), hl
;src/entities/user.c:30: user.engine_state = 0;
	ld	hl,#_user + 20
	ld	(hl),#0x00
;src/entities/user.c:32: engine_anim[0] = (u8*) G_engine_00;
	ld	hl,#_G_engine_00
	ld	(_engine_anim), hl
;src/entities/user.c:33: engine_anim[1] = (u8*) G_engine_01;
	ld	hl,#_G_engine_01
	ld	((_engine_anim + 0x0002)), hl
	ret
;src/entities/user.c:36: void user_init_level(){
;	---------------------------------
; Function user_init_level
; ---------------------------------
_user_init_level::
;src/entities/user.c:37: user.lives=3;
	ld	hl,#_user + 14
	ld	(hl),#0x03
;src/entities/user.c:38: user.shield=0;
	ld	hl,#_user + 13
	ld	(hl),#0x00
;src/entities/user.c:39: user.max_shoots=3;
	ld	hl,#_user + 12
	ld	(hl),#0x03
	ret
;src/entities/user.c:46: long get_last_moved_user(){
;	---------------------------------
; Function get_last_moved_user
; ---------------------------------
_get_last_moved_user::
;src/entities/user.c:47: return user.last_moved;
	ld	hl, (#(_user + 0x0015) + 0)
	ld	de, (#(_user + 0x0015) + 2)
	ret
;src/entities/user.c:50: u8 get_user_max_shoots(){
;	---------------------------------
; Function get_user_max_shoots
; ---------------------------------
_get_user_max_shoots::
;src/entities/user.c:51: return user.max_shoots;
	ld	hl,#_user+12
	ld	l,(hl)
	ret
;src/entities/user.c:53: u8 get_user_speed(){
;	---------------------------------
; Function get_user_speed
; ---------------------------------
_get_user_speed::
;src/entities/user.c:54: return user.speed;
	ld	hl,#_user+19
	ld	l,(hl)
	ret
;src/entities/user.c:60: void user_engine(u8* screen){
;	---------------------------------
; Function user_engine
; ---------------------------------
_user_engine::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/user.c:63: user.engine_state++;
	ld	de,#_user + 20
	ld	a,(de)
	inc	a
	ld	(de),a
;src/entities/user.c:64: if (user.engine_state==2) user.engine_state=0;
	sub	a, #0x02
	jr	NZ,00102$
	xor	a, a
	ld	(de),a
00102$:
;src/entities/user.c:66: pscreen = cpct_getScreenPtr(screen, user.x+1, user.y+7);
	ld	a, (#_user + 3)
	add	a, #0x07
	ld	c,a
	ld	a, (#_user + 2)
	ld	h,a
	inc	h
	ld	l,4 (ix)
	ld	b,5 (ix)
	push	de
	ld	a,c
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	h, b
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/entities/user.c:67: cpct_drawSprite( (u8*) engine_anim[user.engine_state],pscreen,2,1);
	ld	c, l
	ld	b, h
	ld	a,(de)
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_engine_anim
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0102
	push	hl
	push	bc
	push	de
	call	_cpct_drawSprite
	pop	ix
	ret
;src/entities/user.c:70: void update_user() {
;	---------------------------------
; Function update_user
; ---------------------------------
_update_user::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/user.c:73: user.ax=0;
	ld	hl,#(_user + 0x0008)
	ld	(hl),#0x00
;src/entities/user.c:76: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	hl,#0x0808
	call	_cpct_isKeyPressed
;src/entities/user.c:84: user.ay = -2;
;src/entities/user.c:83: if ((cpct_isKeyPressed(Key_Q))){ 
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/entities/user.c:84: user.ay = -2;
	ld	hl,#(_user + 0x0009)
	ld	(hl),#0xFE
	jr	00105$
00104$:
;src/entities/user.c:85: } else if (cpct_isKeyPressed(Key_A)){
	ld	hl,#0x2008
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/entities/user.c:86: user.ay=2;    
	ld	hl,#(_user + 0x0009)
	ld	(hl),#0x02
00105$:
;src/entities/user.c:89: if ((cpct_isKeyPressed(Key_P))){ 
	ld	hl,#0x0803
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00109$
;src/entities/user.c:90: user.ax = 2;
	ld	hl,#(_user + 0x0008)
	ld	(hl),#0x02
	jr	00110$
00109$:
;src/entities/user.c:91: } else if (cpct_isKeyPressed(Key_O)){
	ld	hl,#0x0404
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00110$
;src/entities/user.c:92: user.ax=-2;    
	ld	hl,#(_user + 0x0008)
	ld	(hl),#0xFE
00110$:
;src/entities/user.c:96: if (cpct_isKeyPressed(Key_D)){
	ld	hl,#0x2007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
;src/entities/user.c:97: shoot_type=(shoot_type+1)%2;
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
;src/entities/user.c:100: if (cpct_isKeyPressed(Key_H)){
	ld	hl,#0x1005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00114$
;src/entities/user.c:101: create_enemy((rand()%80),(rand()%199),(rand()%3));
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
	pop	af
	push	hl
	call	_rand
	ld	de,#0x0050
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	e,l
	ld	d,h
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
;src/entities/user.c:104: if (cpct_isKeyPressed(Key_J)){
	ld	hl,#0x2005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jp	Z,00116$
;src/entities/user.c:105: x=rand()%80;
	call	_rand
	ld	bc,#0x0050
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-4 (ix),l
;src/entities/user.c:106: y=rand()%199;
	call	_rand
	ld	bc,#0x00C7
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c,l
;src/entities/user.c:107: create_enemy(x,y,(rand()%3));
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
;src/entities/user.c:112: if (cpct_isKeyPressed(Key_K)){
	ld	hl,#0x2004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00118$
;src/entities/user.c:113: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
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
	pop	af
	push	hl
	call	_rand
	ld	de,#0x000A
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	e,l
	ld	d,h
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
;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
;src/entities/user.c:116: if (cpct_isKeyPressed(Key_Space)){
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/entities/user.c:117: create_shoot(user.x+2, user.y, shoot_type);
	ld	hl, #_user + 3
	ld	b,(hl)
	ld	a, (#(_user + 0x0002) + 0)
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
;src/entities/user.c:121: if (cpct_isKeyPressed(Key_L)){
	ld	hl,#0x1004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00122$
;src/entities/user.c:122: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
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
;src/entities/user.c:126: if (user.ax!=0){
	ld	hl, #(_user + 0x0008) + 0
	ld	d,(hl)
;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
;src/entities/user.c:126: if (user.ax!=0){
	ld	a,d
	or	a, a
	jr	Z,00129$
;src/entities/user.c:127: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
	ld	hl, #(_user + 0x0004) + 0
	ld	e,(hl)
	ld	hl,#_user + 6
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
;src/entities/user.c:128: user.vx+=user.ax;
	ld	a,e
	add	a, d
	ld	(#(_user + 0x0004)),a
00129$:
;src/entities/user.c:132: if (user.vx>0){
	ld	hl, #(_user + 0x0004) + 0
	ld	d,(hl)
	xor	a, a
	sub	a, d
	jp	PO, 00213$
	xor	a, #0x80
00213$:
	jp	P,00133$
;src/entities/user.c:133: user.vx--;
	dec	d
	ld	hl,#(_user + 0x0004)
	ld	(hl),d
	jr	00134$
00133$:
;src/entities/user.c:134: } else if (user.vx<0){
	bit	7, d
	jr	Z,00134$
;src/entities/user.c:135: user.vx++;
	inc	d
	ld	hl,#(_user + 0x0004)
	ld	(hl),d
00134$:
;src/entities/user.c:138: user.x+=user.vx;
	ld	hl, #(_user + 0x0002) + 0
	ld	d,(hl)
	ld	hl, #(_user + 0x0004) + 0
	ld	h,(hl)
	ld	a,d
	add	a, h
	ld	d,a
	ld	hl,#(_user + 0x0002)
	ld	(hl),d
;src/entities/user.c:140: if (user.x<0)
	ld	hl, #(_user + 0x0002) + 0
	ld	e,(hl)
	bit	7, d
	jr	Z,00138$
;src/entities/user.c:141: user.x=0;
	ld	hl,#(_user + 0x0002)
	ld	(hl),#0x00
	jr	00140$
00138$:
;src/entities/user.c:142: else if (user.x> 79-user.w){
	ld	hl, #_user + 10
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
;src/entities/user.c:143: user.x = 79-user.w;
	ld	a,#0x4F
	sub	a, h
	ld	(#(_user + 0x0002)),a
00140$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/user.c:147: void draw_user(u8* screen){
;	---------------------------------
; Function draw_user
; ---------------------------------
_draw_user::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/user.c:149: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
	ld	hl, #_user + 3
	ld	c,(hl)
	ld	hl, #_user + 2
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
;src/entities/user.c:150: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
	ld	hl, #_user + 11
	ld	b,(hl)
	ld	a, (#_user + 10)
	ld	hl, (#_user + 0)
	push	hl
	pop	iy
	push	bc
	inc	sp
	push	af
	inc	sp
	push	de
	push	iy
	call	_cpct_drawSprite
	pop	ix
	ret
;src/entities/user.c:153: void set_score(u32 new_score){
;	---------------------------------
; Function set_score
; ---------------------------------
_set_score::
;src/entities/user.c:154: user.score = new_score;
	ld	de,#_user+15
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ret
;src/entities/user.c:156: void add_score(u16 new_add_score){
;	---------------------------------
; Function add_score
; ---------------------------------
_add_score::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/entities/user.c:157: user.score += new_add_score;
	ld	de,#(_user + 0x000f)
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
	ld	((_user + 0x000f)), de
	ld	((_user + 0x000f)+2), bc
	ld	sp, ix
	pop	ix
	ret
;src/entities/user.c:159: u32 get_score(){
;	---------------------------------
; Function get_score
; ---------------------------------
_get_score::
;src/entities/user.c:160: return user.score;
	ld	hl, (#(_user + 0x000f) + 0)
	ld	de, (#(_user + 0x000f) + 2)
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
