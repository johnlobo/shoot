;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Sun Aug 16 01:47:05 2015
;--------------------------------------------------------
	.module shoots
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _create_explosion
	.globl _add_score
	.globl _get_user_max_shoots
	.globl _check_collision_enemies
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _active_shoots
	.globl _shoots
	.globl _init_shoots
	.globl _create_shoot
	.globl _update_shoots
	.globl _draw_shoots
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_shoots::
	.ds 160
_active_shoots::
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
;src/entities/shoots.c:13: void init_shoots(){
;	---------------------------------
; Function init_shoots
; ---------------------------------
_init_shoots::
;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
	ld	d,#0x00
00102$:
;src/entities/shoots.c:16: shoots[k].active=0;
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_shoots)
	add	a, l
	ld	c,a
	ld	a,#>(_shoots)
	adc	a, h
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:17: shoots[k].x=0;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:18: shoots[k].y=0;
	ld	hl,#0x0005
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:19: shoots[k].w=0;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:20: shoots[k].h=0;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:21: shoots[k].frame=0;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:22: shoots[k].last_moved=0;
	ld	hl,#0x000C
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
	inc	d
	ld	a,d
	sub	a, #0x0A
	jr	C,00102$
;src/entities/shoots.c:24: active_shoots=0;
	ld	hl,#_active_shoots + 0
	ld	(hl), #0x00
	ret
;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
;	---------------------------------
; Function create_shoot
; ---------------------------------
_create_shoot::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
	call	_get_user_max_shoots
	ld	d,l
	ld	a,(#_active_shoots + 0)
	sub	a, d
	jp	NC,00109$
;src/entities/shoots.c:34: while (shoots[k].active){
	ld	bc,#_shoots+0
	ld	d,#0x00
00101$:
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-4 (ix)
	add	a, #0x08
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/entities/shoots.c:35: k++;
	inc	d
	jr	00101$
00103$:
;src/entities/shoots.c:37: shoots[k].active=1;
	ld	(hl),#0x01
;src/entities/shoots.c:38: shoots[k].frame=0;
	ld	a,-4 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/shoots.c:42: shoots[k].x=x;
	ld	a,-4 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;src/entities/shoots.c:43: shoots[k].y=y;
	ld	a,-4 (ix)
	add	a, #0x05
	ld	-6 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/shoots.c:44: shoots[k].w=1;
	ld	a,-4 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/entities/shoots.c:45: shoots[k].h=4;
	ld	a,-4 (ix)
	add	a, #0x07
	ld	-10 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/shoots.c:46: shoots[k].num_frames=1;
	ld	a,-4 (ix)
	add	a, #0x09
	ld	-12 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/shoots.c:39: switch (type){
	ld	a,6 (ix)
	dec	a
	jr	NZ,00105$
;src/entities/shoots.c:42: shoots[k].x=x;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/shoots.c:43: shoots[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:44: shoots[k].w=1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:45: shoots[k].h=4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/entities/shoots.c:46: shoots[k].num_frames=1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_bullet02_0)
	inc	hl
	ld	(hl),#>(_bullet02_0)
;src/entities/shoots.c:48: break;
	jr	00106$
;src/entities/shoots.c:49: default:
00105$:
;src/entities/shoots.c:50: shoots[k].x=x;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/shoots.c:51: shoots[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:52: shoots[k].w=1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:53: shoots[k].h=8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/entities/shoots.c:54: shoots[k].num_frames=2;
	pop	hl
	push	hl
	ld	(hl),#0x02
;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_bullet01_0)
	inc	hl
	ld	(hl),#>(_bullet01_0)
;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
	ld	a,-4 (ix)
	add	a, #0x02
	ld	-12 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	pop	hl
	push	hl
	ld	(hl),#<(_bullet01_1)
	inc	hl
	ld	(hl),#>(_bullet01_1)
;src/entities/shoots.c:58: }
00106$:
;src/entities/shoots.c:59: active_shoots++;
	ld	hl, #_active_shoots+0
	inc	(hl)
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/shoots.c:68: void update_shoots(){
;	---------------------------------
; Function update_shoots
; ---------------------------------
_update_shoots::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;src/entities/shoots.c:72: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jp	Z,00116$
;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
	ld	c,#0x00
00114$:
;src/entities/shoots.c:74: if (shoots[i].active){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_shoots)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_shoots)
	adc	a, h
	ld	-1 (ix),a
	ld	a,-2 (ix)
	add	a, #0x08
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00115$
;src/entities/shoots.c:75: shoots[i].y-=SHOOT_JUMP;
	ld	a,-2 (ix)
	add	a, #0x05
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	add	a,#0xF6
	ld	b,a
	ld	(de),a
;src/entities/shoots.c:76: if (shoots[i].y<200){
	ld	a,(de)
	ld	-5 (ix),a
	ld	a,b
	sub	a, #0xC8
	jp	NC,00107$
;src/entities/shoots.c:77: if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	a,7 (iy)
	ld	-6 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	b,(hl)
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
	push	bc
	push	de
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h,-5 (ix)
	ld	l,-9 (ix)
	push	hl
	call	_check_collision_enemies
	pop	af
	pop	af
	ld	a,l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00104$
;src/entities/shoots.c:78: create_explosion(shoots[i].x,shoots[i].y,0);
	ld	a,(de)
	ld	d,a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	b,(hl)
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_create_explosion
	pop	af
	inc	sp
	pop	bc
;src/entities/shoots.c:79: shoots[i].active=0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/entities/shoots.c:80: active_shoots--;
	ld	hl, #_active_shoots+0
	dec	(hl)
;src/entities/shoots.c:81: add_score(10);
	push	bc
	ld	hl,#0x000A
	push	hl
	call	_add_score
	pop	af
	pop	bc
	jr	00115$
00104$:
;src/entities/shoots.c:83: shoots[i].frame++;
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	inc	a
	ld	-9 (ix), a
	ld	(de),a
;src/entities/shoots.c:84: if (shoots[i].frame==shoots[i].num_frames)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-8 (ix),a
	ld	a,-9 (ix)
	sub	a, -8 (ix)
	jr	NZ,00115$
;src/entities/shoots.c:85: shoots[i].frame=0;
	xor	a, a
	ld	(de),a
	jr	00115$
00107$:
;src/entities/shoots.c:89: shoots[i].active=0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/entities/shoots.c:90: active_shoots--;
	ld	hl, #_active_shoots+0
	dec	(hl)
00115$:
;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
	inc	c
	ld	a,c
	sub	a, #0x0A
	jp	C,00114$
00116$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/shoots.c:102: void draw_shoots(u8* screen){
;	---------------------------------
; Function draw_shoots
; ---------------------------------
_draw_shoots::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/entities/shoots.c:107: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jp	Z,00108$
;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
	ld	c,#0x00
00106$:
;src/entities/shoots.c:109: if (shoots[k].active){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_shoots)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_shoots)
	adc	a, h
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00107$
;src/entities/shoots.c:110: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	d,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	push	de
	push	iy
	call	_cpct_getScreenPtr
	pop	bc
	ld	e, l
	ld	d, h
;src/entities/shoots.c:111: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	a,7 (iy)
	ld	-5 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	b,(hl)
	ld	-4 (ix),e
	ld	-3 (ix),d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x000A
	add	hl, de
	ld	a,(hl)
	add	a, a
	ld	e,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,#0x00
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	de
	call	_cpct_drawSprite
	pop	bc
00107$:
;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
	inc	c
	ld	a,c
	sub	a, #0x0A
	jp	C,00106$
00108$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
