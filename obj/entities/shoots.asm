;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
; This file was generated Fri Jul  3 17:13:19 2015
;--------------------------------------------------------
	.module shoots
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_user_max_shoots
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _max_baddie_shoots
	.globl _active_baddie_shoots
	.globl _baddie_shoots
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
	.ds 180
_active_shoots::
	.ds 1
_baddie_shoots::
	.ds 72
_active_baddie_shoots::
	.ds 1
_max_baddie_shoots::
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
;src/entities/shoots.c:15: void init_shoots(){
;	---------------------------------
; Function init_shoots
; ---------------------------------
_init_shoots::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/shoots.c:18: shoots[k].active=0;
	ld	hl,#_shoots
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:19: shoots[k].x=0;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:20: shoots[k].y=0;
	ld	hl,#0x0005
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:21: shoots[k].w=0;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:22: shoots[k].h=0;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:23: shoots[k].frame=0;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:24: shoots[k].new=0;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:25: shoots[k].dead=0;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/entities/shoots.c:26: shoots[k].lastmoved=0;
	ld	hl,#0x000E
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
;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x0012
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x0A
	jr	C,00102$
;src/entities/shoots.c:28: active_shoots=0;
	ld	hl,#_active_shoots + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
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
;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
	call	_get_user_max_shoots
	ld	d,l
	ld	a,(#_active_shoots + 0)
	sub	a, d
	jp	NC,00109$
;src/entities/shoots.c:38: while (shoots[k].active){
	ld	de,#0x0000
00101$:
	ld	hl,#_shoots
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x08
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/entities/shoots.c:39: k++;
	ld	hl,#0x0012
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/entities/shoots.c:41: shoots[k].active=1;
	ld	(hl),#0x01
;src/entities/shoots.c:42: shoots[k].frame=0;
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/shoots.c:46: shoots[k].x=x;
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/shoots.c:47: shoots[k].y=y;
	ld	a,-2 (ix)
	add	a, #0x05
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/shoots.c:48: shoots[k].w=1;
	ld	a,-2 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/entities/shoots.c:49: shoots[k].h=4;
	ld	a,-2 (ix)
	add	a, #0x07
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/shoots.c:50: shoots[k].num_frames=1;
	ld	a,-2 (ix)
	add	a, #0x09
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/shoots.c:43: switch (type){
	ld	a,6 (ix)
	dec	a
	jr	NZ,00105$
;src/entities/shoots.c:46: shoots[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/shoots.c:47: shoots[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:48: shoots[k].w=1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:49: shoots[k].h=4;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x04
;src/entities/shoots.c:50: shoots[k].num_frames=1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_bullet02_0)
	inc	hl
	ld	(hl),#>(_bullet02_0)
;src/entities/shoots.c:52: break;
	jr	00106$
;src/entities/shoots.c:53: default:
00105$:
;src/entities/shoots.c:54: shoots[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/shoots.c:55: shoots[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/shoots.c:56: shoots[k].w=1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/entities/shoots.c:57: shoots[k].h=8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/entities/shoots.c:58: shoots[k].num_frames=2;
	pop	hl
	push	hl
	ld	(hl),#0x02
;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_bullet01_0)
	inc	hl
	ld	(hl),#>(_bullet01_0)
;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	pop	hl
	push	hl
	ld	(hl),#<(_bullet01_1)
	inc	hl
	ld	(hl),#>(_bullet01_1)
;src/entities/shoots.c:62: }
00106$:
;src/entities/shoots.c:63: active_shoots++;
	ld	hl, #_active_shoots+0
	inc	(hl)
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/shoots.c:72: void update_shoots(){
;	---------------------------------
; Function update_shoots
; ---------------------------------
_update_shoots::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/entities/shoots.c:75: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jp	Z,00113$
;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
	ld	-3 (ix),#0x00
	ld	de,#0x0000
00111$:
;src/entities/shoots.c:77: if (shoots[i].active){
	ld	hl,#_shoots
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x08
	ld	c,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	or	a, a
	jr	Z,00112$
;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
	ld	iy,#0x0005
	push	bc
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	add	a,#0xF8
	ld	h,a
	ld	0 (iy), h
;src/entities/shoots.c:79: if (shoots[i].y<200){
	ld	a,h
	sub	a, #0xC8
	jr	NC,00104$
;src/entities/shoots.c:80: shoots[i].frame++;
	ld	iy,#0x000A
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	add	iy, bc
	inc	0 (iy)
	ld	c, 0 (iy)
;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-2 (ix),a
	ld	a,c
	sub	a, -2 (ix)
	jr	NZ,00112$
;src/entities/shoots.c:82: shoots[i].frame=0;
	ld	0 (iy), #0x00
	jr	00112$
00104$:
;src/entities/shoots.c:85: shoots[i].active=0;
	xor	a, a
	ld	(bc),a
;src/entities/shoots.c:86: active_shoots--;
	ld	hl, #_active_shoots+0
	dec	(hl)
00112$:
;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
	ld	hl,#0x0012
	add	hl,de
	ex	de,hl
	inc	-3 (ix)
	ld	a,-3 (ix)
	sub	a, #0x0A
	jr	C,00111$
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/shoots.c:98: void draw_shoots(u8* screen){
;	---------------------------------
; Function draw_shoots
; ---------------------------------
_draw_shoots::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/entities/shoots.c:103: if (active_shoots>0){
	ld	a,(#_active_shoots + 0)
	or	a, a
	jp	Z,00108$
;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
	ld	-7 (ix),#0x00
	ld	de,#0x0000
00106$:
;src/entities/shoots.c:105: if (shoots[k].active){
	ld	hl,#_shoots
	add	hl,de
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	bc, #0x0008
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jp	Z,00107$
;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	bc, #0x0005
	add	hl, bc
	ld	b,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	pop	iy
	pop	hl
	push	de
	push	bc
	push	iy
	call	_cpct_getScreenPtr
	pop	af
	pop	af
	pop	de
	ld	b,l
	ld	c,h
;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	bc
	ld	bc, #0x0007
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-4 (ix),a
	ld	-6 (ix),b
	ld	-5 (ix),c
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	bc, #0x000A
	add	hl, bc
	ld	a,(hl)
	add	a, a
	ld	c,a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	h,-1 (ix)
	ld	l,-4 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	push	bc
	call	_cpct_drawSprite
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
00107$:
;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x0012
	add	hl,de
	ex	de,hl
	inc	-7 (ix)
	ld	a,-7 (ix)
	sub	a, #0x0A
	jp	C,00106$
00108$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
