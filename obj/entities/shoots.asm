;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
; This file was generated Mon Jul 20 03:16:35 2015
;--------------------------------------------------------
	.module shoots
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_user_max_shoots
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
;src/entities/shoots.c:22: shoots[k].lastmoved=0;
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
	ld	iy,#_active_shoots
	ld	a,0 (iy)
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
	ex	(sp), hl
	ld	a,-12 (ix)
	add	a, #0x08
	ld	l,a
	ld	a,-11 (ix)
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
	ld	a,-12 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/shoots.c:42: shoots[k].x=x;
	ld	a,-12 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;src/entities/shoots.c:43: shoots[k].y=y;
	ld	a,-12 (ix)
	add	a, #0x05
	ld	-4 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/shoots.c:44: shoots[k].w=1;
	ld	a,-12 (ix)
	add	a, #0x06
	ld	-6 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/shoots.c:45: shoots[k].h=4;
	ld	a,-12 (ix)
	add	a, #0x07
	ld	-8 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/entities/shoots.c:46: shoots[k].num_frames=1;
	ld	a,-12 (ix)
	add	a, #0x09
	ld	-10 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:44: shoots[k].w=1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:45: shoots[k].h=4;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x04
;src/entities/shoots.c:46: shoots[k].num_frames=1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
	pop	hl
	push	hl
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:52: shoots[k].w=1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:53: shoots[k].h=8;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x08
;src/entities/shoots.c:54: shoots[k].num_frames=2;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x02
;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
	pop	hl
	push	hl
	ld	(hl),#<(_bullet01_0)
	inc	hl
	ld	(hl),#>(_bullet01_0)
;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
	ld	a,-12 (ix)
	add	a, #0x02
	ld	-10 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
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
	push	af
;src/entities/shoots.c:71: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jr	Z,00113$
;src/entities/shoots.c:72: for (i=0;i<MAX_SHOOTS;i++){
	ld	c,#0x00
00111$:
;src/entities/shoots.c:73: if (shoots[i].active){
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
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	Z,00112$
;src/entities/shoots.c:74: shoots[i].y-=SHOOT_JUMP;
	ld	a,-2 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	add	a,#0xF6
	ld	b,a
	ld	(hl),b
;src/entities/shoots.c:75: if (shoots[i].y<200){
	ld	a,b
	sub	a, #0xC8
	jr	NC,00104$
;src/entities/shoots.c:76: shoots[i].frame++;
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	b,a
	inc	b
	ld	a,b
	ld	(de),a
;src/entities/shoots.c:77: if (shoots[i].frame==shoots[i].num_frames)
	pop	iy
	push	iy
	ld	a,9 (iy)
	ld	-2 (ix),a
	ld	a,b
	sub	a, -2 (ix)
	jr	NZ,00112$
;src/entities/shoots.c:78: shoots[i].frame=0;
	xor	a, a
	ld	(de),a
	jr	00112$
00104$:
;src/entities/shoots.c:81: shoots[i].active=0;
	xor	a, a
	ld	(de),a
;src/entities/shoots.c:82: active_shoots--;
	ld	hl, #_active_shoots+0
	dec	(hl)
00112$:
;src/entities/shoots.c:72: for (i=0;i<MAX_SHOOTS;i++){
	inc	c
	ld	a,c
	sub	a, #0x0A
	jr	C,00111$
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/shoots.c:94: void draw_shoots(u8* screen){
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
;src/entities/shoots.c:99: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jp	Z,00108$
;src/entities/shoots.c:100: for (k=0;k<MAX_SHOOTS;k++){
	ld	c,#0x00
00106$:
;src/entities/shoots.c:101: if (shoots[k].active){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_shoots)
	add	a, l
	ld	-5 (ix),a
	ld	a,#>(_shoots)
	adc	a, h
	ld	-4 (ix),a
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00107$
;src/entities/shoots.c:102: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
	pop	hl
	push	hl
	ld	de, #0x0005
	add	hl, de
	ld	d,(hl)
	pop	hl
	push	hl
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
	pop	af
	pop	af
	pop	bc
	ex	de,hl
;src/entities/shoots.c:103: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
	pop	iy
	push	iy
	ld	a,7 (iy)
	ld	-3 (ix),a
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	b,(hl)
	ld	-2 (ix),e
	ld	-1 (ix),d
	pop	hl
	push	hl
	ld	de, #0x000A
	add	hl, de
	ld	a,(hl)
	add	a, a
	ld	e,a
	pop	hl
	push	hl
	ld	d,#0x00
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	de
	call	_cpct_drawSprite
	pop	bc
00107$:
;src/entities/shoots.c:100: for (k=0;k<MAX_SHOOTS;k++){
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
