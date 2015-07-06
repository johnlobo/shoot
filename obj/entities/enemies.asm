;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
; This file was generated Mon Jul  6 16:29:22 2015
;--------------------------------------------------------
	.module enemies
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _inside_screen
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _active_groups
	.globl _groups
	.globl _active_enemies
	.globl _enemies
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
	.ds 360
_active_enemies::
	.ds 1
_groups::
	.ds 16
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
;src/entities/enemies.c:14: void init_enemies(){
;	---------------------------------
; Function init_enemies
; ---------------------------------
_init_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:16: for (k=0;k<MAX_SHOOTS;k++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/enemies.c:17: enemies[k].active=0;
	ld	hl,#_enemies
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0017
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:18: enemies[k].x=0;
	ld	hl,#0x0010
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:19: enemies[k].y=0;
	ld	hl,#0x0012
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:20: enemies[k].w=0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:21: enemies[k].h=0;
	ld	hl,#0x0015
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:22: enemies[k].dir=0;
	ld	hl,#0x0016
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:23: enemies[k].frame=0;
	ld	hl,#0x0019
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:24: enemies[k].lastmoved=0;
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
;src/entities/enemies.c:16: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x0A
	jr	C,00102$
;src/entities/enemies.c:26: active_enemies=0;
	ld	hl,#_active_enemies + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/enemies.c:34: void create_enemy(i16 x, i16 y, u8 type){
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
;src/entities/enemies.c:36: if (active_enemies < MAX_ENEMIES){
	ld	a,(#_active_enemies + 0)
	sub	a, #0x0A
	jp	NC,00109$
;src/entities/enemies.c:38: while (enemies[k].active){
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
;src/entities/enemies.c:39: k++;
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/entities/enemies.c:41: enemies[k].active=1;
	ld	(hl),#0x01
;src/entities/enemies.c:42: enemies[k].frame=0;
	ld	a,-8 (ix)
	add	a, #0x19
	ld	l,a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/enemies.c:46: enemies[k].x=x;
	ld	a,-8 (ix)
	add	a, #0x10
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/enemies.c:47: enemies[k].y=y;
	ld	a,-8 (ix)
	add	a, #0x12
	ld	-4 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/enemies.c:48: enemies[k].w=6;
	ld	a,-8 (ix)
	add	a, #0x14
	ld	-2 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;src/entities/enemies.c:49: enemies[k].h=12;
	ld	a,-8 (ix)
	add	a, #0x15
	ld	-10 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/enemies.c:50: enemies[k].num_frames=0;
	ld	a,-8 (ix)
	add	a, #0x18
	ld	-12 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	a,-8 (ix)
	add	a, #0x02
	ld	-14 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	a,-8 (ix)
	add	a, #0x04
	ld	-16 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	a,-8 (ix)
	add	a, #0x06
	ld	-18 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	a,-8 (ix)
	add	a, #0x08
	ld	-20 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	a,-8 (ix)
	add	a, #0x0A
	ld	-22 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	a,-8 (ix)
	add	a, #0x0C
	ld	-24 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	a,-8 (ix)
	add	a, #0x0E
	ld	-26 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
;src/entities/enemies.c:59: enemies[k].movement=0;
	ld	a,-8 (ix)
	add	a, #0x1D
	ld	-28 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
;src/entities/enemies.c:60: enemies[k].stage=0;
	ld	a,-8 (ix)
	add	a, #0x1E
	ld	-30 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
;src/entities/enemies.c:61: enemies[k].stage_step=0;
	ld	a,-8 (ix)
	add	a, #0x1F
	ld	-32 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
;src/entities/enemies.c:43: switch (type){
	ld	a,8 (ix)
	dec	a
	jp	NZ,00105$
;src/entities/enemies.c:46: enemies[k].x=x;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:47: enemies[k].y=y;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:48: enemies[k].w=6;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x06
;src/entities/enemies.c:49: enemies[k].h=12;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x0C
;src/entities/enemies.c:50: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:51: enemies[k].sprite[0]= (u8*) G_baddie02_00;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_G_baddie02_00)
	inc	hl
	ld	(hl),#>(_G_baddie02_00)
;src/entities/enemies.c:52: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie02_01)
	inc	hl
	ld	(hl),#>(_G_baddie02_01)
;src/entities/enemies.c:53: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie02_02)
	inc	hl
	ld	(hl),#>(_G_baddie02_02)
;src/entities/enemies.c:54: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie02_03)
	inc	hl
	ld	(hl),#>(_G_baddie02_03)
;src/entities/enemies.c:55: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie02_04)
	inc	hl
	ld	(hl),#>(_G_baddie02_04)
;src/entities/enemies.c:56: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie02_05)
	inc	hl
	ld	(hl),#>(_G_baddie02_05)
;src/entities/enemies.c:57: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie02_06)
	inc	hl
	ld	(hl),#>(_G_baddie02_06)
;src/entities/enemies.c:58: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie02_07)
	inc	hl
	ld	(hl),#>(_G_baddie02_07)
;src/entities/enemies.c:59: enemies[k].movement=0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:60: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:61: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:62: break;
	jp	00106$
;src/entities/enemies.c:63: default:
00105$:
;src/entities/enemies.c:64: enemies[k].x=x;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:65: enemies[k].y=y;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:66: enemies[k].w=5;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x05
;src/entities/enemies.c:67: enemies[k].h=16;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x10
;src/entities/enemies.c:68: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:69: enemies[k].sprite[0]= (u8*) G_baddie01_00;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_G_baddie01_00)
	inc	hl
	ld	(hl),#>(_G_baddie01_00)
;src/entities/enemies.c:70: enemies[k].sprite[1]= (u8*) G_baddie01_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie01_01)
	inc	hl
	ld	(hl),#>(_G_baddie01_01)
;src/entities/enemies.c:71: enemies[k].sprite[2]= (u8*) G_baddie01_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie01_02)
	inc	hl
	ld	(hl),#>(_G_baddie01_02)
;src/entities/enemies.c:72: enemies[k].sprite[3]= (u8*) G_baddie01_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie01_03)
	inc	hl
	ld	(hl),#>(_G_baddie01_03)
;src/entities/enemies.c:73: enemies[k].sprite[4]= (u8*) G_baddie01_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie01_04)
	inc	hl
	ld	(hl),#>(_G_baddie01_04)
;src/entities/enemies.c:74: enemies[k].sprite[5]= (u8*) G_baddie01_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie01_05)
	inc	hl
	ld	(hl),#>(_G_baddie01_05)
;src/entities/enemies.c:75: enemies[k].sprite[6]= (u8*) G_baddie01_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie01_06)
	inc	hl
	ld	(hl),#>(_G_baddie01_06)
;src/entities/enemies.c:76: enemies[k].sprite[7]= (u8*) G_baddie01_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie01_07)
	inc	hl
	ld	(hl),#>(_G_baddie01_07)
;src/entities/enemies.c:77: enemies[k].movement=1;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x01
;src/entities/enemies.c:78: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:79: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:81: }
00106$:
;src/entities/enemies.c:82: active_enemies++;
	ld	hl, #_active_enemies+0
	inc	(hl)
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:88: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
;	---------------------------------
; Function create_enemy_group
; ---------------------------------
_create_enemy_group::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/enemies.c:90: if (active_groups < MAX_ENEMY_GROUPS){
	ld	a,(#_active_groups + 0)
	sub	a, #0x02
	jr	NC,00106$
;src/entities/enemies.c:92: while (groups[k].active){
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
;src/entities/enemies.c:93: k++;
	inc	d
	jr	00101$
00103$:
;src/entities/enemies.c:95: groups[k].active=1;
	ld	a,#0x01
	ld	(bc),a
;src/entities/enemies.c:96: groups[k].x=x;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:97: groups[k].y=y;
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
;src/entities/enemies.c:98: groups[k].enemy_type=type;
	ld	hl,#0x0005
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
;src/entities/enemies.c:99: groups[k].num_enemies=num_enemies;
	ld	hl,#0x0006
	add	hl,bc
	ld	a,9 (ix)
	ld	(hl),a
;src/entities/enemies.c:100: groups[k].sleep=ENEMY_GAP;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x05
;src/entities/enemies.c:101: active_groups++;
	ld	hl, #_active_groups+0
	inc	(hl)
00106$:
	pop	ix
	ret
;src/entities/enemies.c:109: void update_enemies(){
;	---------------------------------
; Function update_enemies
; ---------------------------------
_update_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/entities/enemies.c:113: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00112$
;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
	ld	bc,#_movements+0
	ld	-15 (ix),#0x00
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
00124$:
;src/entities/enemies.c:115: if (enemies[i].active){
	ld	a,#<(_enemies)
	add	a, -14 (ix)
	ld	-2 (ix),a
	ld	a,#>(_enemies)
	adc	a, -13 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0017
	add	hl, de
	ld	a,(hl)
	or	a, a
	jp	Z,00125$
;src/entities/enemies.c:116: if (enemies[i].movement<99){
	ld	a,-2 (ix)
	add	a, #0x1D
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-5 (ix), a
	sub	a, #0x63
	jp	NC,00125$
;src/entities/enemies.c:117: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
	ld	a,-2 (ix)
	add	a, #0x1F
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	-6 (ix),a
	push	de
	ld	e,-5 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	add	hl, bc
	inc	hl
	push	hl
	pop	iy
	ld	a,-2 (ix)
	add	a, #0x1E
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-5 (ix), a
	add	a, a
	add	a, a
	ld	h,a
	push	bc
	ld	c,h
	ld	b,#0x00
	add	iy, bc
	pop	bc
	push	iy
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,-6 (ix)
	sub	a,(hl)
	jp	NC,00104$
;src/entities/enemies.c:118: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
	ld	a,-2 (ix)
	add	a, #0x16
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	a, 0 (iy)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),a
;src/entities/enemies.c:119: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
	ld	iy,#0x0010
	push	bc
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	add	iy, bc
	pop	bc
	ld	a,0 (iy)
	ld	-10 (ix),a
	ld	a,1 (iy)
	ld	-9 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	add	hl,bc
	inc	hl
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-12 (ix)
	add	a, h
	ld	l,a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	h,a
	inc	hl
	ld	a,(hl)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ld	a,-10 (ix)
	add	a, l
	ld	l,a
	ld	a,-9 (ix)
	adc	a, h
	ld	0 (iy), l
	ld	1 (iy), a
;src/entities/enemies.c:120: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
	ld	a,-2 (ix)
	add	a, #0x12
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	push	de
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	add	hl,bc
	inc	hl
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-2 (ix)
	add	a, h
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	ld	a,-10 (ix)
	add	a, l
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, h
	ld	-9 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,-10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-9 (ix)
	ld	(hl),a
;src/entities/enemies.c:121: enemies[i].stage_step++;
	ld	a,(de)
	inc	a
	ld	(de),a
	jr	00125$
00104$:
;src/entities/enemies.c:123: enemies[i].stage++;
	ld	a,-5 (ix)
	inc	a
	ld	-12 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,-12 (ix)
	ld	(hl),a
;src/entities/enemies.c:124: enemies[i].stage_step=0;
	xor	a, a
	ld	(de),a
;src/entities/enemies.c:125: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e, (hl)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl,bc
	ld	a,-12 (ix)
	sub	a,(hl)
	jr	C,00125$
;src/entities/enemies.c:126: enemies[i].stage=0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
00125$:
;src/entities/enemies.c:114: for (i=0;i<MAX_ENEMIES;i++){
	ld	a,-14 (ix)
	add	a, #0x24
	ld	-14 (ix),a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	inc	-15 (ix)
	ld	a,-15 (ix)
	sub	a, #0x0A
	jp	C,00124$
00112$:
;src/entities/enemies.c:135: if (active_groups>0){
	ld	a,(#_active_groups + 0)
	or	a, a
	jr	Z,00128$
;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	ld	-15 (ix),#0x00
00126$:
;src/entities/enemies.c:138: if (groups[i].active){
	ld	l,-15 (ix)
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
;src/entities/enemies.c:139: if (groups[i].sleep==0){
	ld	hl,#0x0007
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00117$
;src/entities/enemies.c:140: groups[i].sleep=ENEMY_GAP;
	ld	(hl),#0x05
;src/entities/enemies.c:141: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
	ld	l, e
	ld	h, d
	ld	bc, #0x0005
	add	hl, bc
	ld	c,(hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	ld	a,c
	push	af
	inc	sp
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	push	bc
	push	hl
	call	_create_enemy
	pop	af
	pop	af
	inc	sp
	pop	de
;src/entities/enemies.c:142: if (groups[i].num_enemies==0){
	ld	hl,#0x0006
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00114$
;src/entities/enemies.c:143: groups[i].active=0;
	xor	a, a
	ld	(de),a
;src/entities/enemies.c:144: active_groups--;
	ld	hl, #_active_groups+0
	dec	(hl)
	jr	00127$
00114$:
;src/entities/enemies.c:146: groups[i].num_enemies--;
	add	a,#0xFF
	ld	(hl),a
	jr	00127$
00117$:
;src/entities/enemies.c:149: groups[i].sleep--;
	add	a,#0xFF
	ld	(hl),a
00127$:
;src/entities/enemies.c:137: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	inc	-15 (ix)
	ld	a,-15 (ix)
	sub	a, #0x02
	jr	C,00126$
00128$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:157: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
;	---------------------------------
; Function inside_screen
; ---------------------------------
_inside_screen::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:158: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
	bit	7, 5 (ix)
	jr	NZ,00103$
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,de
	ld	de, #0x80A0
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
;src/entities/enemies.c:165: void draw_enemies(u8* screen){
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
;src/entities/enemies.c:170: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00109$
;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
	ld	-15 (ix),#0x00
	ld	de,#0x0000
00107$:
;src/entities/enemies.c:172: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
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
;src/entities/enemies.c:173: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
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
	pop	af
	pop	af
	pop	de
	ld	c, l
	ld	b, h
;src/entities/enemies.c:174: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
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
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	de
00108$:
;src/entities/enemies.c:171: for (k=0;k<MAX_SHOOTS;k++){
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	inc	-15 (ix)
	ld	a,-15 (ix)
	sub	a, #0x0A
	jp	C,00107$
00109$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
