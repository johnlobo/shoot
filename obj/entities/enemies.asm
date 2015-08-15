;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Mon Aug 10 01:34:09 2015
;--------------------------------------------------------
	.module enemies
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _inside_screen
	.globl _detectColision
	.globl _fast_collision
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _active_groups
	.globl _groups
	.globl _active_enemies
	.globl _enemies
	.globl _check_collision_enemies
	.globl _init_enemies
	.globl _create_enemy
	.globl _create_enemy_group
	.globl _update_enemies
	.globl _draw_enemies
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_enemies::
	.ds 1080
_active_enemies::
	.ds 1
_groups::
	.ds 32
_active_groups::
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
;src/entities/enemies.c:14: u8 detectColision(u8 x1,u8 y1,u8 w1,u8 h1,u8 x2,u8 y2,u8 w2,u8 h2){
;	---------------------------------
; Function detectColision
; ---------------------------------
_detectColision::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/enemies.c:15: return ((x1 < x2 + w2) && (x1 + w1 > x2) && (y1 < y2 + h2) && (h1 + y1 > y2));
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,10 (ix)
	ld	h,#0x00
	add	hl,de
	ld	c,4 (ix)
	ld	b,#0x00
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P,00103$
	ld	l,6 (ix)
	ld	h,#0x00
	add	hl,bc
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	P,00103$
	ld	e,9 (ix)
	ld	d,#0x00
	ld	l,11 (ix)
	ld	h,#0x00
	add	hl,de
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P,00103$
	ld	l,7 (ix)
	ld	h,#0x00
	add	hl,bc
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	M,00104$
00103$:
	ld	l,#0x00
	jr	00105$
00104$:
	ld	l,#0x01
00105$:
	pop	ix
	ret
;src/entities/enemies.c:22: u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
;	---------------------------------
; Function check_collision_enemies
; ---------------------------------
_check_collision_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:27: collision = 0;
	ld	-9 (ix),#0x00
;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
	ld	-10 (ix),#0x00
	ld	bc,#0x0000
00108$:
;src/entities/enemies.c:30: if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
	ld	hl,#_enemies
	add	hl,bc
	ex	de,hl
	ld	hl,#0x0017
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00109$
	push	de
	pop	iy
	ld	a,16 (iy)
	ld	-4 (ix),a
	ld	a,17 (iy)
	ld	-3 (ix),a
	xor	a, a
	cp	a, -4 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	jp	P,00109$
	push	de
	pop	iy
	ld	a,18 (iy)
	ld	-6 (ix),a
	ld	a,19 (iy)
	ld	-5 (ix),a
	xor	a, a
	cp	a, -6 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	P,00109$
;src/entities/enemies.c:31: if (fast_collision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
	push	de
	pop	iy
	ld	a,21 (iy)
	ld	-7 (ix),a
	push	de
	pop	iy
	ld	a,20 (iy)
	ld	-8 (ix),a
	ld	d,-6 (ix)
	ld	e,-4 (ix)
	push	bc
	ld	h,-7 (ix)
	ld	l,-8 (ix)
	push	hl
	push	de
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_fast_collision
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a,l
	pop	bc
	or	a, a
	jr	Z,00109$
;src/entities/enemies.c:32: collision = 1;
	ld	-9 (ix),#0x01
;src/entities/enemies.c:33: enemies[i].active = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:34: active_enemies--;
	ld	hl, #_active_enemies+0
	dec	(hl)
00109$:
;src/entities/enemies.c:29: for (i=0;i<MAX_ENEMIES;i++){
	ld	hl,#0x0024
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	-10 (ix)
	ld	a,-10 (ix)
	sub	a, #0x1E
	jp	C,00108$
;src/entities/enemies.c:38: return collision;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:45: void init_enemies(){
;	---------------------------------
; Function init_enemies
; ---------------------------------
_init_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/enemies.c:48: enemies[k].active=0;
	ld	hl,#_enemies
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0017
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:49: enemies[k].x=0;
	ld	hl,#0x0010
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:50: enemies[k].y=0;
	ld	hl,#0x0012
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:51: enemies[k].w=0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:52: enemies[k].h=0;
	ld	hl,#0x0015
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:53: enemies[k].dir=0;
	ld	hl,#0x0016
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:54: enemies[k].frame=0;
	ld	hl,#0x0019
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:55: enemies[k].last_moved=0;
	ld	hl,#0x0020
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
;src/entities/enemies.c:47: for (k=0;k<MAX_ENEMIES;k++){
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x1E
	jr	C,00102$
;src/entities/enemies.c:57: active_enemies=0;
	ld	hl,#_active_enemies + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/enemies.c:65: void create_enemy(i16 x, i16 y, u8 type){
;	---------------------------------
; Function create_enemy
; ---------------------------------
_create_enemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-32
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:67: if (active_enemies < MAX_ENEMIES){
	ld	a,(#_active_enemies + 0)
	sub	a, #0x1E
	jp	NC,00110$
;src/entities/enemies.c:69: while (enemies[k].active){
	ld	de,#0x0000
00101$:
	ld	hl,#_enemies
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,-8 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/entities/enemies.c:70: k++;
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/entities/enemies.c:72: enemies[k].active=1;
	ld	(hl),#0x01
;src/entities/enemies.c:73: enemies[k].frame=0;
	ld	a,-8 (ix)
	add	a, #0x19
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/enemies.c:77: enemies[k].x=x;
	ld	a,-8 (ix)
	add	a, #0x10
	ld	-10 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/enemies.c:78: enemies[k].y=y;
	ld	a,-8 (ix)
	add	a, #0x12
	ld	-12 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/enemies.c:79: enemies[k].w=4;
	ld	a,-8 (ix)
	add	a, #0x14
	ld	-14 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
;src/entities/enemies.c:80: enemies[k].h=8;
	ld	a,-8 (ix)
	add	a, #0x15
	ld	-16 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
;src/entities/enemies.c:81: enemies[k].num_frames=0;
	ld	a,-8 (ix)
	add	a, #0x18
	ld	-18 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
	ld	a,-8 (ix)
	add	a, #0x02
	ld	-2 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
	ld	a,-8 (ix)
	add	a, #0x04
	ld	-4 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
	ld	a,-8 (ix)
	add	a, #0x06
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
	ld	a,-8 (ix)
	add	a, #0x08
	ld	-20 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
	ld	a,-8 (ix)
	add	a, #0x0A
	ld	-22 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
	ld	a,-8 (ix)
	add	a, #0x0C
	ld	-24 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
	ld	a,-8 (ix)
	add	a, #0x0E
	ld	-26 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
;src/entities/enemies.c:90: enemies[k].movement=0;
	ld	a,-8 (ix)
	add	a, #0x1D
	ld	-28 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
;src/entities/enemies.c:91: enemies[k].stage=0;
	ld	a,-8 (ix)
	add	a, #0x1E
	ld	-30 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
;src/entities/enemies.c:92: enemies[k].stage_step=0;
	ld	a,-8 (ix)
	add	a, #0x1F
	ld	-32 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
;src/entities/enemies.c:74: switch (type){
	ld	a,8 (ix)
	dec	a
	jr	Z,00104$
	ld	a,8 (ix)
	sub	a, #0x02
	jp	Z,00105$
	jp	00106$
;src/entities/enemies.c:76: case 1:
00104$:
;src/entities/enemies.c:77: enemies[k].x=x;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:78: enemies[k].y=y;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:79: enemies[k].w=4;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x04
;src/entities/enemies.c:80: enemies[k].h=8;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x08
;src/entities/enemies.c:81: enemies[k].num_frames=0;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:82: enemies[k].sprite[0]= (u8*) G_baddie04_00;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_G_baddie04_00)
	inc	hl
	ld	(hl),#>(_G_baddie04_00)
;src/entities/enemies.c:83: enemies[k].sprite[1]= (u8*) G_baddie04_01;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie04_01)
	inc	hl
	ld	(hl),#>(_G_baddie04_01)
;src/entities/enemies.c:84: enemies[k].sprite[2]= (u8*) G_baddie04_02;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_G_baddie04_02)
	inc	hl
	ld	(hl),#>(_G_baddie04_02)
;src/entities/enemies.c:85: enemies[k].sprite[3]= (u8*) G_baddie04_03;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#<(_G_baddie04_03)
	inc	hl
	ld	(hl),#>(_G_baddie04_03)
;src/entities/enemies.c:86: enemies[k].sprite[4]= (u8*) G_baddie04_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie04_04)
	inc	hl
	ld	(hl),#>(_G_baddie04_04)
;src/entities/enemies.c:87: enemies[k].sprite[5]= (u8*) G_baddie04_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie04_05)
	inc	hl
	ld	(hl),#>(_G_baddie04_05)
;src/entities/enemies.c:88: enemies[k].sprite[6]= (u8*) G_baddie04_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie04_06)
	inc	hl
	ld	(hl),#>(_G_baddie04_06)
;src/entities/enemies.c:89: enemies[k].sprite[7]= (u8*) G_baddie04_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie04_07)
	inc	hl
	ld	(hl),#>(_G_baddie04_07)
;src/entities/enemies.c:90: enemies[k].movement=0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:91: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:92: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:93: break;
	jp	00107$
;src/entities/enemies.c:94: case 2:
00105$:
;src/entities/enemies.c:95: enemies[k].x=x;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:96: enemies[k].y=y;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:97: enemies[k].w=4;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x04
;src/entities/enemies.c:98: enemies[k].h=8;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x08
;src/entities/enemies.c:99: enemies[k].num_frames=0;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:100: enemies[k].sprite[0]= (u8*) G_baddie03_00;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_G_baddie03_00)
	inc	hl
	ld	(hl),#>(_G_baddie03_00)
;src/entities/enemies.c:101: enemies[k].sprite[1]= (u8*) G_baddie03_01;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie03_01)
	inc	hl
	ld	(hl),#>(_G_baddie03_01)
;src/entities/enemies.c:102: enemies[k].sprite[2]= (u8*) G_baddie03_02;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_G_baddie03_02)
	inc	hl
	ld	(hl),#>(_G_baddie03_02)
;src/entities/enemies.c:103: enemies[k].sprite[3]= (u8*) G_baddie03_03;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#<(_G_baddie03_03)
	inc	hl
	ld	(hl),#>(_G_baddie03_03)
;src/entities/enemies.c:104: enemies[k].sprite[4]= (u8*) G_baddie03_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie03_04)
	inc	hl
	ld	(hl),#>(_G_baddie03_04)
;src/entities/enemies.c:105: enemies[k].sprite[5]= (u8*) G_baddie03_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie03_05)
	inc	hl
	ld	(hl),#>(_G_baddie03_05)
;src/entities/enemies.c:106: enemies[k].sprite[6]= (u8*) G_baddie03_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie03_06)
	inc	hl
	ld	(hl),#>(_G_baddie03_06)
;src/entities/enemies.c:107: enemies[k].sprite[7]= (u8*) G_baddie03_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie03_07)
	inc	hl
	ld	(hl),#>(_G_baddie03_07)
;src/entities/enemies.c:108: enemies[k].movement=0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:109: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:110: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:111: break;
	jp	00107$
;src/entities/enemies.c:112: default:
00106$:
;src/entities/enemies.c:113: enemies[k].x=x;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:114: enemies[k].y=y;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:115: enemies[k].w=5;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#0x05
;src/entities/enemies.c:116: enemies[k].h=16;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#0x10
;src/entities/enemies.c:117: enemies[k].num_frames=0;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:118: enemies[k].sprite[0]= (u8*) G_baddie01_00;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_G_baddie01_00)
	inc	hl
	ld	(hl),#>(_G_baddie01_00)
;src/entities/enemies.c:119: enemies[k].sprite[1]= (u8*) G_baddie01_01;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie01_01)
	inc	hl
	ld	(hl),#>(_G_baddie01_01)
;src/entities/enemies.c:120: enemies[k].sprite[2]= (u8*) G_baddie01_02;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_G_baddie01_02)
	inc	hl
	ld	(hl),#>(_G_baddie01_02)
;src/entities/enemies.c:121: enemies[k].sprite[3]= (u8*) G_baddie01_03;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#<(_G_baddie01_03)
	inc	hl
	ld	(hl),#>(_G_baddie01_03)
;src/entities/enemies.c:122: enemies[k].sprite[4]= (u8*) G_baddie01_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie01_04)
	inc	hl
	ld	(hl),#>(_G_baddie01_04)
;src/entities/enemies.c:123: enemies[k].sprite[5]= (u8*) G_baddie01_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie01_05)
	inc	hl
	ld	(hl),#>(_G_baddie01_05)
;src/entities/enemies.c:124: enemies[k].sprite[6]= (u8*) G_baddie01_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie01_06)
	inc	hl
	ld	(hl),#>(_G_baddie01_06)
;src/entities/enemies.c:125: enemies[k].sprite[7]= (u8*) G_baddie01_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie01_07)
	inc	hl
	ld	(hl),#>(_G_baddie01_07)
;src/entities/enemies.c:126: enemies[k].movement=1;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x01
;src/entities/enemies.c:127: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:128: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:130: }
00107$:
;src/entities/enemies.c:131: active_enemies++;
	ld	hl, #_active_enemies+0
	inc	(hl)
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:137: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
;	---------------------------------
; Function create_enemy_group
; ---------------------------------
_create_enemy_group::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/enemies.c:139: if (active_groups < MAX_ENEMY_GROUPS){
	ld	a,(#_active_groups + 0)
	sub	a, #0x04
	jr	NC,00106$
;src/entities/enemies.c:141: while (groups[k].active){
	ld	d,#0x00
00101$:
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_groups)
	add	a, l
	ld	c,a
	ld	a,#>(_groups)
	adc	a, h
	ld	b,a
	ld	a,(bc)
	or	a, a
	jr	Z,00103$
;src/entities/enemies.c:142: k++;
	inc	d
	jr	00101$
00103$:
;src/entities/enemies.c:144: groups[k].active=1;
	ld	a,#0x01
	ld	(bc),a
;src/entities/enemies.c:145: groups[k].x=x;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:146: groups[k].y=y;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:147: groups[k].enemy_type=type;
	ld	hl,#0x0005
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
;src/entities/enemies.c:148: groups[k].num_enemies=num_enemies;
	ld	hl,#0x0006
	add	hl,bc
	ld	a,9 (ix)
	ld	(hl),a
;src/entities/enemies.c:149: groups[k].sleep=ENEMY_GAP;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/entities/enemies.c:150: active_groups++;
	ld	hl, #_active_groups+0
	inc	(hl)
00106$:
	pop	ix
	ret
;src/entities/enemies.c:158: void update_enemies(){
;	---------------------------------
; Function update_enemies
; ---------------------------------
_update_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-21
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:162: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00112$
;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
	ld	-21 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00124$:
;src/entities/enemies.c:164: if (enemies[i].active){
	ld	a,#<(_enemies)
	add	a, -4 (ix)
	ld	-6 (ix),a
	ld	a,#>(_enemies)
	adc	a, -3 (ix)
	ld	-5 (ix),a
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	push	bc
	pop	iy
	ld	a,23 (iy)
	ld	-7 (ix), a
	or	a, a
	jp	Z,00125$
;src/entities/enemies.c:165: if (enemies[i].movement<99){
	ld	a,-6 (ix)
	add	a, #0x1D
	ld	-9 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x63
	jp	NC,00125$
;src/entities/enemies.c:166: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
	ld	a,-6 (ix)
	add	a, #0x1F
	ld	-11 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	e,(hl)
	ld	c,d
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_movements
	add	hl,bc
	inc	hl
	ld	b,l
	ld	d,h
	ld	a,-6 (ix)
	add	a, #0x1E
	ld	-13 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-7 (ix), a
	add	a, a
	add	a, a
	add	a,b
	ld	-15 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h,(hl)
	ld	a,e
	sub	a, h
	jp	NC,00104$
;src/entities/enemies.c:167: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
	ld	a,-6 (ix)
	add	a, #0x16
	ld	-17 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-15 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-15 (ix)
	ld	(hl),a
;src/entities/enemies.c:168: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
	ld	a,-6 (ix)
	add	a, #0x10
	ld	-17 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-15 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a,#<(_movements)
	add	a, l
	ld	-19 (ix),a
	ld	a,#>(_movements)
	adc	a, h
	ld	-18 (ix),a
	inc	-19 (ix)
	jr	NZ,00176$
	inc	-18 (ix)
00176$:
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-19 (ix)
	add	a, h
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	inc	hl
	ld	a,(hl)
	ld	-20 (ix), a
	ld	-19 (ix),a
	ld	a,-20 (ix)
	rla
	sbc	a, a
	ld	-18 (ix),a
	ld	a,-15 (ix)
	add	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,-14 (ix)
	adc	a, -18 (ix)
	ld	-18 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-19 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-18 (ix)
	ld	(hl),a
;src/entities/enemies.c:169: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
	ld	a,-6 (ix)
	add	a, #0x12
	ld	-19 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-17 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-16 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a,#<(_movements)
	add	a, l
	ld	-15 (ix),a
	ld	a,#>(_movements)
	adc	a, h
	ld	-14 (ix),a
	inc	-15 (ix)
	jr	NZ,00177$
	inc	-14 (ix)
00177$:
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-15 (ix)
	add	a, h
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-20 (ix), a
	ld	-15 (ix),a
	ld	a,-20 (ix)
	rla
	sbc	a, a
	ld	-14 (ix),a
	ld	a,-17 (ix)
	add	a, -15 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a, -14 (ix)
	ld	-16 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,-17 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-16 (ix)
	ld	(hl),a
;src/entities/enemies.c:170: enemies[i].stage_step++;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	inc	-20 (ix)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,-20 (ix)
	ld	(hl),a
	jp	00125$
00104$:
;src/entities/enemies.c:172: enemies[i].stage++;
	ld	a,-7 (ix)
	inc	a
	ld	-20 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,-20 (ix)
	ld	(hl),a
;src/entities/enemies.c:173: enemies[i].stage_step=0;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:174: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-19 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-19 (ix),l
	ld	-18 (ix),h
	ld	a,#<(_movements)
	add	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,#>(_movements)
	adc	a, -18 (ix)
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	ld	a,-20 (ix)
	sub	a, -19 (ix)
	jr	C,00102$
;src/entities/enemies.c:175: enemies[i].stage=0;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x00
00102$:
;src/entities/enemies.c:177: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
	ld	a,#<(_enemies)
	add	a, -2 (ix)
	ld	-19 (ix),a
	ld	a,#>(_enemies)
	adc	a, -1 (ix)
	ld	-18 (ix),a
	ld	a,-19 (ix)
	add	a, #0x16
	ld	-17 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	a,-19 (ix)
	add	a, #0x1D
	ld	-15 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	a,#<(_movements)
	add	a, -13 (ix)
	ld	-13 (ix),a
	ld	a,#>(_movements)
	adc	a, -12 (ix)
	ld	-12 (ix),a
	inc	-13 (ix)
	jr	NZ,00178$
	inc	-12 (ix)
00178$:
	ld	a,-19 (ix)
	add	a, #0x1E
	ld	-11 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-13 (ix)
	add	a, h
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-20 (ix)
	ld	(hl),a
;src/entities/enemies.c:178: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
	ld	a,-19 (ix)
	add	a, #0x10
	ld	-17 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-12 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,#<(_movements)
	add	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,#>(_movements)
	adc	a, -8 (ix)
	ld	-8 (ix),a
	inc	-9 (ix)
	jr	NZ,00179$
	inc	-8 (ix)
00179$:
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-9 (ix)
	add	a, h
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	inc	hl
	ld	a,(hl)
	ld	-20 (ix), a
	ld	-9 (ix),a
	ld	a,-20 (ix)
	rla
	sbc	a, a
	ld	-8 (ix),a
	ld	a,-13 (ix)
	add	a, -9 (ix)
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a, -8 (ix)
	ld	-12 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-13 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-12 (ix)
	ld	(hl),a
;src/entities/enemies.c:179: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
	ld	a,-19 (ix)
	add	a, #0x12
	ld	-17 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-12 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-15 (ix),l
	ld	-14 (ix),h
	ld	a,#<(_movements)
	add	a, -15 (ix)
	ld	-15 (ix),a
	ld	a,#>(_movements)
	adc	a, -14 (ix)
	ld	-14 (ix),a
	inc	-15 (ix)
	jr	NZ,00180$
	inc	-14 (ix)
00180$:
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	sla	-20 (ix)
	sla	-20 (ix)
	ld	a,-15 (ix)
	add	a, -20 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-20 (ix), a
	ld	-15 (ix),a
	ld	a,-20 (ix)
	rla
	sbc	a, a
	ld	-14 (ix),a
	ld	a,-13 (ix)
	add	a, -15 (ix)
	ld	-15 (ix),a
	ld	a,-12 (ix)
	adc	a, -14 (ix)
	ld	-14 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-15 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-14 (ix)
	ld	(hl),a
;src/entities/enemies.c:180: enemies[i].stage_step++;
	ld	a,-19 (ix)
	add	a, #0x1F
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	inc	a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	(hl),a
00125$:
;src/entities/enemies.c:163: for (i=0;i<MAX_ENEMIES;i++){
	ld	a,-2 (ix)
	add	a, #0x24
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	a,-4 (ix)
	add	a, #0x24
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	inc	-21 (ix)
	ld	a,-21 (ix)
	sub	a, #0x1E
	jp	C,00124$
00112$:
;src/entities/enemies.c:188: if (active_groups>0){
	ld	a,(#_active_groups + 0)
	or	a, a
	jp	Z,00128$
;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	ld	-21 (ix),#0x00
00126$:
;src/entities/enemies.c:191: if (groups[i].active){
	ld	l,-21 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_groups)
	add	a, l
	ld	e,a
	ld	a,#>(_groups)
	adc	a, h
	ld	d,a
	ld	a,(de)
	or	a, a
	jr	Z,00127$
;src/entities/enemies.c:192: if (groups[i].sleep==0){
	ld	hl,#0x0007
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00117$
;src/entities/enemies.c:193: groups[i].sleep=ENEMY_GAP;
	ld	(hl),#0x03
;src/entities/enemies.c:194: if (groups[i].num_enemies==0){
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	or	a, a
	jr	NZ,00114$
;src/entities/enemies.c:195: groups[i].active=0;
	xor	a, a
	ld	(de),a
;src/entities/enemies.c:196: active_groups--;
	ld	hl, #_active_groups+0
	dec	(hl)
	jr	00127$
00114$:
;src/entities/enemies.c:198: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ex	de,hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	ld	a,-20 (ix)
	push	af
	inc	sp
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	push	de
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/entities/enemies.c:199: groups[i].num_enemies--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	jr	00127$
00117$:
;src/entities/enemies.c:202: groups[i].sleep--;
	add	a,#0xFF
	ld	(hl),a
00127$:
;src/entities/enemies.c:190: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	inc	-21 (ix)
	ld	a,-21 (ix)
	sub	a, #0x04
	jr	C,00126$
00128$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:210: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
;	---------------------------------
; Function inside_screen
; ---------------------------------
_inside_screen::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:212: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
	bit	7, 5 (ix)
	jr	NZ,00103$
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,de
	ld	de, #0x8050
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00103$
	bit	7, 7 (ix)
	jr	NZ,00103$
	ld	e,9 (ix)
	ld	d,#0x00
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl,de
	ld	de, #0x80C8
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	C,00104$
00103$:
	ld	l,#0x00
	jr	00105$
00104$:
	ld	l,#0x01
00105$:
	inc	sp
	pop	ix
	ret
;src/entities/enemies.c:219: void draw_enemies(u8* screen){
;	---------------------------------
; Function draw_enemies
; ---------------------------------
_draw_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:224: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00109$
;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
	ld	-15 (ix),#0x00
	ld	de,#0x0000
00107$:
;src/entities/enemies.c:226: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
	ld	hl,#_enemies
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	bc, #0x0017
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jp	Z,00108$
	ld	a,-4 (ix)
	add	a, #0x15
	ld	-14 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	b,(hl)
	ld	a,-4 (ix)
	add	a, #0x14
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	a,-4 (ix)
	add	a, #0x12
	ld	-6 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,-4 (ix)
	add	a, #0x10
	ld	-10 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	push	de
	push	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_inside_screen
	pop	af
	pop	af
	pop	af
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00108$
;src/entities/enemies.c:227: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	h,l
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	pop	iy
	pop	hl
	push	de
	ld	a,c
	push	af
	inc	sp
	push	hl
	inc	sp
	push	iy
	call	_cpct_getScreenPtr
	pop	de
	ld	c, l
	ld	b, h
;src/entities/enemies.c:228: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	ld	-8 (ix),c
	ld	-7 (ix),b
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	bc, #0x0016
	add	hl, bc
	ld	a,(hl)
	add	a, a
	ld	c,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	h,-12 (ix)
	ld	l,-10 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	push	bc
	call	_cpct_drawSprite
	pop	de
00108$:
;src/entities/enemies.c:225: for (k=0;k<MAX_ENEMIES;k++){
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	inc	-15 (ix)
	ld	a,-15 (ix)
	sub	a, #0x1E
	jp	C,00107$
00109$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
