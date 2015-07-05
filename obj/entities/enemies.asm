;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
; This file was generated Sun Jul  5 16:12:44 2015
;--------------------------------------------------------
	.module enemies
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _draw_enemies
	.globl _update_enemies
	.globl _create_enemy
	.globl _init_enemies
	.globl _get_user_max_shoots
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _active_enemies
	.globl _enemies
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_enemies::
	.ds 310
_active_enemies::
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
;src/entities/enemies.c:12: void init_enemies(){
;	---------------------------------
; Function init_enemies
; ---------------------------------
_init_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/enemies.c:15: enemies[k].active=0;
	ld	hl,#_enemies
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0015
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:16: enemies[k].x=0;
	ld	hl,#0x0010
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:17: enemies[k].y=0;
	ld	hl,#0x0011
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:18: enemies[k].w=0;
	ld	hl,#0x0012
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:19: enemies[k].h=0;
	ld	hl,#0x0013
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:20: enemies[k].dir=0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:21: enemies[k].frame=0;
	ld	hl,#0x0017
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:22: enemies[k].lastmoved=0;
	ld	hl,#0x001B
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
;src/entities/enemies.c:14: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x001F
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x0A
	jr	C,00102$
;src/entities/enemies.c:24: active_enemies=0;
	ld	hl,#_active_enemies + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/enemies.c:30: void create_enemy(u8 x, u8 y, u8 type){
;	---------------------------------
; Function create_enemy
; ---------------------------------
_create_enemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-30
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:32: if (active_enemies < get_user_max_shoots()){
	call	_get_user_max_shoots
	ld	d,l
	ld	a,(#_active_enemies + 0)
	sub	a, d
	jp	NC,00109$
;src/entities/enemies.c:34: while (enemies[k].active){
	ld	de,#0x0000
00101$:
	ld	hl,#_enemies
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x15
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/entities/enemies.c:35: k++;
	ld	hl,#0x001F
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/entities/enemies.c:37: enemies[k].active=1;
	ld	(hl),#0x01
;src/entities/enemies.c:38: enemies[k].frame=0;
	ld	a,-2 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/enemies.c:42: enemies[k].x=x;
	ld	a,-2 (ix)
	add	a, #0x10
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/enemies.c:43: enemies[k].y=y;
	ld	a,-2 (ix)
	add	a, #0x11
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/enemies.c:44: enemies[k].w=6;
	ld	a,-2 (ix)
	add	a, #0x12
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/entities/enemies.c:45: enemies[k].h=12;
	ld	a,-2 (ix)
	add	a, #0x13
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/enemies.c:46: enemies[k].num_frames=0;
	ld	a,-2 (ix)
	add	a, #0x16
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-14 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-16 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	a,-2 (ix)
	add	a, #0x06
	ld	-18 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	a,-2 (ix)
	add	a, #0x08
	ld	-20 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	-22 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	a,-2 (ix)
	add	a, #0x0C
	ld	-24 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	a,-2 (ix)
	add	a, #0x0E
	ld	-26 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
;src/entities/enemies.c:55: enemies[k].trajectory=1;
	ld	a,-2 (ix)
	add	a, #0x19
	ld	-28 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
	ld	a,-2 (ix)
	add	a, #0x1A
	ld	-30 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
;src/entities/enemies.c:39: switch (type){
	ld	a,6 (ix)
	dec	a
	jp	NZ,00105$
;src/entities/enemies.c:42: enemies[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/enemies.c:43: enemies[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:44: enemies[k].w=6;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x06
;src/entities/enemies.c:45: enemies[k].h=12;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x0C
;src/entities/enemies.c:46: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:47: enemies[k].sprite[0]= (u8*) G_baddie02_00;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie02_00)
	inc	hl
	ld	(hl),#>(_G_baddie02_00)
;src/entities/enemies.c:48: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie02_01)
	inc	hl
	ld	(hl),#>(_G_baddie02_01)
;src/entities/enemies.c:49: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie02_02)
	inc	hl
	ld	(hl),#>(_G_baddie02_02)
;src/entities/enemies.c:50: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie02_03)
	inc	hl
	ld	(hl),#>(_G_baddie02_03)
;src/entities/enemies.c:51: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie02_04)
	inc	hl
	ld	(hl),#>(_G_baddie02_04)
;src/entities/enemies.c:52: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie02_05)
	inc	hl
	ld	(hl),#>(_G_baddie02_05)
;src/entities/enemies.c:53: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie02_06)
	inc	hl
	ld	(hl),#>(_G_baddie02_06)
;src/entities/enemies.c:54: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie02_07)
	inc	hl
	ld	(hl),#>(_G_baddie02_07)
;src/entities/enemies.c:55: enemies[k].trajectory=1;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x01
;src/entities/enemies.c:56: enemies[k].trajectory_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:57: break;
	jp	00106$
;src/entities/enemies.c:58: default:
00105$:
;src/entities/enemies.c:59: enemies[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/enemies.c:60: enemies[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:61: enemies[k].w=5;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x05
;src/entities/enemies.c:62: enemies[k].h=16;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x10
;src/entities/enemies.c:63: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:64: enemies[k].sprite[0]= (u8*) G_baddie01_00;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie01_00)
	inc	hl
	ld	(hl),#>(_G_baddie01_00)
;src/entities/enemies.c:65: enemies[k].sprite[1]= (u8*) G_baddie01_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie01_01)
	inc	hl
	ld	(hl),#>(_G_baddie01_01)
;src/entities/enemies.c:66: enemies[k].sprite[2]= (u8*) G_baddie01_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie01_02)
	inc	hl
	ld	(hl),#>(_G_baddie01_02)
;src/entities/enemies.c:67: enemies[k].sprite[3]= (u8*) G_baddie01_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie01_03)
	inc	hl
	ld	(hl),#>(_G_baddie01_03)
;src/entities/enemies.c:68: enemies[k].sprite[4]= (u8*) G_baddie01_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie01_04)
	inc	hl
	ld	(hl),#>(_G_baddie01_04)
;src/entities/enemies.c:69: enemies[k].sprite[5]= (u8*) G_baddie01_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie01_05)
	inc	hl
	ld	(hl),#>(_G_baddie01_05)
;src/entities/enemies.c:70: enemies[k].sprite[6]= (u8*) G_baddie01_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie01_06)
	inc	hl
	ld	(hl),#>(_G_baddie01_06)
;src/entities/enemies.c:71: enemies[k].sprite[7]= (u8*) G_baddie01_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie01_07)
	inc	hl
	ld	(hl),#>(_G_baddie01_07)
;src/entities/enemies.c:72: enemies[k].trajectory=1;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x01
;src/entities/enemies.c:73: enemies[k].trajectory_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:75: }
00106$:
;src/entities/enemies.c:76: active_enemies++;
	ld	hl, #_active_enemies+0
	inc	(hl)
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:85: void update_enemies(){
;	---------------------------------
; Function update_enemies
; ---------------------------------
_update_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:91: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00126$
;src/entities/enemies.c:92: for (i=0;i<MAX_SHOOTS;i++){
	ld	-14 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00124$:
;src/entities/enemies.c:93: if (enemies[i].active){
	ld	a,#<(_enemies)
	add	a, -4 (ix)
	ld	-6 (ix),a
	ld	a,#>(_enemies)
	adc	a, -3 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	bc, #0x0015
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jp	Z,00125$
;src/entities/enemies.c:94: if (enemies[i].trajectory>0){
	ld	a,-6 (ix)
	add	a, #0x19
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	b,(hl)
	ld	a,b
	or	a, a
	jp	Z,00125$
;src/entities/enemies.c:95: dx = enemies[i].x-trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	pop	iy
	pop	hl
	ld	a,16 (iy)
	ld	-9 (ix),a
	ld	c,b
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a,#<(_trajectories)
	add	a, l
	ld	-11 (ix),a
	ld	a,#>(_trajectories)
	adc	a, h
	ld	-10 (ix),a
	ld	a,-11 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	a,-6 (ix)
	add	a, #0x1A
	ld	c,a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	-6 (ix), a
	add	a, a
	ld	h,a
	ld	a,-13 (ix)
	add	a, h
	ld	l,a
	ld	a,-12 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,-9 (ix)
	sub	a,(hl)
	ld	h,a
	ld	l,h
;src/entities/enemies.c:97: if ((dx==0) && (dy==0)){
	ld	a,l
	or	a,a
	jr	NZ,00114$
	or	a,h
	jr	NZ,00114$
;src/entities/enemies.c:98: if (enemies[i].trajectory_step<trajectories[enemies[i].trajectory].waypoints){
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-6 (ix)
	sub	a,(hl)
	jr	NC,00102$
;src/entities/enemies.c:99: enemies[i].trajectory_step++;
	ld	a,-6 (ix)
	inc	a
	ld	(bc),a
	jp	00125$
00102$:
;src/entities/enemies.c:102: enemies[i].trajectory_step=0;
	xor	a, a
	ld	(bc),a
;src/entities/enemies.c:103: enemies[i].trajectory=0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
	jp	00125$
00114$:
;src/entities/enemies.c:107: if (dx>0){
	xor	a, a
	sub	a, l
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	P,00111$
;src/entities/enemies.c:108: if ((u8) dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step]){
	ld	-13 (ix),l
	ld	a,#<(_enemies)
	add	a, -2 (ix)
	ld	c,a
	ld	a,#>(_enemies)
	adc	a, -1 (ix)
	ld	b,a
	push	bc
	pop	iy
	ld	a,25 (iy)
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a,#<(_trajectories)
	add	a, l
	ld	-11 (ix),a
	ld	a,#>(_trajectories)
	adc	a, h
	ld	-10 (ix),a
	ld	a,-11 (ix)
	add	a, #0x29
	ld	-8 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	push	bc
	pop	iy
	ld	a,26 (iy)
	ld	-9 (ix), a
	add	a, -8 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -7 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-8 (ix),a
;src/entities/enemies.c:109: enemies[i].x+=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
;src/entities/enemies.c:108: if ((u8) dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step]){
	ld	a,-8 (ix)
	sub	a, -13 (ix)
	jr	NC,00105$
;src/entities/enemies.c:109: enemies[i].x+=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
	ld	a,(bc)
	add	a, -8 (ix)
	ld	(bc),a
	jp	00125$
00105$:
;src/entities/enemies.c:112: enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	inc	hl
	ld	a,-9 (ix)
	add	a, a
	ld	-13 (ix),a
	ld	a,l
	add	a, -13 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
	jp	00125$
00111$:
;src/entities/enemies.c:115: if (-dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step])
	ld	a,l
	rla
	sbc	a, a
	ld	h,a
	xor	a, a
	sub	a, l
	ld	-13 (ix),a
	ld	a, #0x00
	sbc	a, h
	ld	-12 (ix),a
	ld	hl,#_enemies
	add	hl,de
	ld	c,l
	ld	b,h
	push	bc
	pop	iy
	ld	a,25 (iy)
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a,#<(_trajectories)
	add	a, l
	ld	-11 (ix),a
	ld	a,#>(_trajectories)
	adc	a, h
	ld	-10 (ix),a
	ld	a,-11 (ix)
	add	a, #0x29
	ld	-8 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	push	bc
	pop	iy
	ld	a,26 (iy)
	ld	-9 (ix), a
	add	a, -8 (ix)
	ld	l,a
	ld	a,#0x00
	adc	a, -7 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-8 (ix), a
	ld	l, a
	ld	h,#0x00
;src/entities/enemies.c:116: enemies[i].x-=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
	ld	a,c
	add	a, #0x10
	ld	c,a
	ld	a,b
	adc	a, #0x00
	ld	b,a
;src/entities/enemies.c:115: if (-dx>trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step])
	ld	a,l
	sub	a, -13 (ix)
	ld	a,h
	sbc	a, -12 (ix)
	jp	PO, 00170$
	xor	a, #0x80
00170$:
	jp	P,00108$
;src/entities/enemies.c:116: enemies[i].x-=trajectories[enemies[i].trajectory].vx[enemies[i].trajectory_step];
	ld	a,(bc)
	sub	a, -8 (ix)
	ld	(bc),a
	jr	00125$
00108$:
;src/entities/enemies.c:118: enemies[i].x=trajectories[enemies[i].trajectory].wp[enemies[i].trajectory_step].x;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	inc	hl
	ld	a,-9 (ix)
	add	a, a
	ld	-13 (ix),a
	ld	a,l
	add	a, -13 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
00125$:
;src/entities/enemies.c:92: for (i=0;i<MAX_SHOOTS;i++){
	ld	a,-2 (ix)
	add	a, #0x1F
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	hl,#0x001F
	add	hl,de
	ex	de,hl
	ld	a,-4 (ix)
	add	a, #0x1F
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	inc	-14 (ix)
	ld	a,-14 (ix)
	sub	a, #0x0A
	jp	C,00124$
00126$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:132: void draw_enemies(u8* screen){
;	---------------------------------
; Function draw_enemies
; ---------------------------------
_draw_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:137: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00108$
;src/entities/enemies.c:138: for (k=0;k<MAX_SHOOTS;k++){
	ld	-7 (ix),#0x00
	ld	de,#0x0000
00106$:
;src/entities/enemies.c:139: if (enemies[k].active){
	ld	hl,#_enemies
	add	hl,de
	ld	-5 (ix),l
	ld	-4 (ix),h
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0015
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jp	Z,00107$
;src/entities/enemies.c:140: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0011
	add	hl, bc
	ld	b,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	bc
	ld	bc, #0x0010
	add	hl, bc
	pop	bc
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
;src/entities/enemies.c:141: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	bc
	ld	bc, #0x0013
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	bc
	ld	bc, #0x0012
	add	hl, bc
	pop	bc
	ld	a,(hl)
	ld	-6 (ix),a
	ld	-3 (ix),b
	ld	-2 (ix),c
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0014
	add	hl, bc
	ld	a,(hl)
	add	a, a
	ld	c,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	h,-1 (ix)
	ld	l,-6 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	bc
	call	_cpct_drawSprite
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
00107$:
;src/entities/enemies.c:138: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x001F
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
