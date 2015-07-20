;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
; This file was generated Mon Jul 20 03:16:35 2015
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
;src/entities/enemies.c:16: void init_enemies(){
;	---------------------------------
; Function init_enemies
; ---------------------------------
_init_enemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:18: for (k=0;k<MAX_ENEMIES;k++){
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00102$:
;src/entities/enemies.c:19: enemies[k].active=0;
	ld	hl,#_enemies
	add	hl,de
	ld	c,l
	ld	b,h
	ld	hl,#0x0017
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:20: enemies[k].x=0;
	ld	hl,#0x0010
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:21: enemies[k].y=0;
	ld	hl,#0x0012
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/enemies.c:22: enemies[k].w=0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:23: enemies[k].h=0;
	ld	hl,#0x0015
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:24: enemies[k].dir=0;
	ld	hl,#0x0016
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:25: enemies[k].frame=0;
	ld	hl,#0x0019
	add	hl,bc
	ld	(hl),#0x00
;src/entities/enemies.c:26: enemies[k].lastmoved=0;
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
;src/entities/enemies.c:18: for (k=0;k<MAX_ENEMIES;k++){
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x1E
	jr	C,00102$
;src/entities/enemies.c:28: active_enemies=0;
	ld	hl,#_active_enemies + 0
	ld	(hl), #0x00
	inc	sp
	pop	ix
	ret
;src/entities/enemies.c:36: void create_enemy(i16 x, i16 y, u8 type){
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
;src/entities/enemies.c:38: if (active_enemies < MAX_ENEMIES){
	ld	a,(#_active_enemies + 0)
	sub	a, #0x1E
	jp	NC,00110$
;src/entities/enemies.c:40: while (enemies[k].active){
	ld	de,#0x0000
00101$:
	ld	hl,#_enemies
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/entities/enemies.c:41: k++;
	ld	hl,#0x0024
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/entities/enemies.c:43: enemies[k].active=1;
	ld	(hl),#0x01
;src/entities/enemies.c:44: enemies[k].frame=0;
	ld	a,-2 (ix)
	add	a, #0x19
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
;src/entities/enemies.c:48: enemies[k].x=x;
	ld	a,-2 (ix)
	add	a, #0x10
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/entities/enemies.c:49: enemies[k].y=y;
	ld	a,-2 (ix)
	add	a, #0x12
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/entities/enemies.c:50: enemies[k].w=6;
	ld	a,-2 (ix)
	add	a, #0x14
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;src/entities/enemies.c:51: enemies[k].h=12;
	ld	a,-2 (ix)
	add	a, #0x15
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
;src/entities/enemies.c:52: enemies[k].num_frames=0;
	ld	a,-2 (ix)
	add	a, #0x18
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/entities/enemies.c:54: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	a,-2 (ix)
	add	a, #0x02
	ld	-14 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
;src/entities/enemies.c:55: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-16 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
;src/entities/enemies.c:56: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	a,-2 (ix)
	add	a, #0x06
	ld	-18 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-17 (ix),a
;src/entities/enemies.c:57: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	a,-2 (ix)
	add	a, #0x08
	ld	-20 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-19 (ix),a
;src/entities/enemies.c:58: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	-22 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
;src/entities/enemies.c:59: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	a,-2 (ix)
	add	a, #0x0C
	ld	-24 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-23 (ix),a
;src/entities/enemies.c:60: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	a,-2 (ix)
	add	a, #0x0E
	ld	-26 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-25 (ix),a
;src/entities/enemies.c:61: enemies[k].movement=0;
	ld	a,-2 (ix)
	add	a, #0x1D
	ld	-28 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-27 (ix),a
;src/entities/enemies.c:62: enemies[k].stage=0;
	ld	a,-2 (ix)
	add	a, #0x1E
	ld	-30 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
;src/entities/enemies.c:63: enemies[k].stage_step=0;
	ld	a,-2 (ix)
	add	a, #0x1F
	ld	-32 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-31 (ix),a
;src/entities/enemies.c:45: switch (type){
	ld	a,8 (ix)
	dec	a
	jr	Z,00104$
	ld	a,8 (ix)
	sub	a, #0x02
	jp	Z,00105$
	jp	00106$
;src/entities/enemies.c:47: case 1:
00104$:
;src/entities/enemies.c:48: enemies[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:49: enemies[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:50: enemies[k].w=6;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x06
;src/entities/enemies.c:51: enemies[k].h=12;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x0C
;src/entities/enemies.c:52: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:53: enemies[k].sprite[0]= (u8*) G_baddie02_00;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie02_00)
	inc	hl
	ld	(hl),#>(_G_baddie02_00)
;src/entities/enemies.c:54: enemies[k].sprite[1]= (u8*) G_baddie02_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie02_01)
	inc	hl
	ld	(hl),#>(_G_baddie02_01)
;src/entities/enemies.c:55: enemies[k].sprite[2]= (u8*) G_baddie02_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie02_02)
	inc	hl
	ld	(hl),#>(_G_baddie02_02)
;src/entities/enemies.c:56: enemies[k].sprite[3]= (u8*) G_baddie02_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie02_03)
	inc	hl
	ld	(hl),#>(_G_baddie02_03)
;src/entities/enemies.c:57: enemies[k].sprite[4]= (u8*) G_baddie02_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie02_04)
	inc	hl
	ld	(hl),#>(_G_baddie02_04)
;src/entities/enemies.c:58: enemies[k].sprite[5]= (u8*) G_baddie02_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie02_05)
	inc	hl
	ld	(hl),#>(_G_baddie02_05)
;src/entities/enemies.c:59: enemies[k].sprite[6]= (u8*) G_baddie02_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie02_06)
	inc	hl
	ld	(hl),#>(_G_baddie02_06)
;src/entities/enemies.c:60: enemies[k].sprite[7]= (u8*) G_baddie02_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie02_07)
	inc	hl
	ld	(hl),#>(_G_baddie02_07)
;src/entities/enemies.c:61: enemies[k].movement=0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:62: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:63: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:64: break;
	jp	00107$
;src/entities/enemies.c:65: case 2:
00105$:
;src/entities/enemies.c:66: enemies[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:67: enemies[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:68: enemies[k].w=4;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x04
;src/entities/enemies.c:69: enemies[k].h=8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x08
;src/entities/enemies.c:70: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:71: enemies[k].sprite[0]= (u8*) G_baddie03_00;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie03_00)
	inc	hl
	ld	(hl),#>(_G_baddie03_00)
;src/entities/enemies.c:72: enemies[k].sprite[1]= (u8*) G_baddie03_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie03_01)
	inc	hl
	ld	(hl),#>(_G_baddie03_01)
;src/entities/enemies.c:73: enemies[k].sprite[2]= (u8*) G_baddie03_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie03_02)
	inc	hl
	ld	(hl),#>(_G_baddie03_02)
;src/entities/enemies.c:74: enemies[k].sprite[3]= (u8*) G_baddie03_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie03_03)
	inc	hl
	ld	(hl),#>(_G_baddie03_03)
;src/entities/enemies.c:75: enemies[k].sprite[4]= (u8*) G_baddie03_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie03_04)
	inc	hl
	ld	(hl),#>(_G_baddie03_04)
;src/entities/enemies.c:76: enemies[k].sprite[5]= (u8*) G_baddie03_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie03_05)
	inc	hl
	ld	(hl),#>(_G_baddie03_05)
;src/entities/enemies.c:77: enemies[k].sprite[6]= (u8*) G_baddie03_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie03_06)
	inc	hl
	ld	(hl),#>(_G_baddie03_06)
;src/entities/enemies.c:78: enemies[k].sprite[7]= (u8*) G_baddie03_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie03_07)
	inc	hl
	ld	(hl),#>(_G_baddie03_07)
;src/entities/enemies.c:79: enemies[k].movement=0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:80: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:81: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:82: break;
	jp	00107$
;src/entities/enemies.c:83: default:
00106$:
;src/entities/enemies.c:84: enemies[k].x=x;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:85: enemies[k].y=y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;src/entities/enemies.c:86: enemies[k].w=5;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x05
;src/entities/enemies.c:87: enemies[k].h=16;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x10
;src/entities/enemies.c:88: enemies[k].num_frames=0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:89: enemies[k].sprite[0]= (u8*) G_baddie01_00;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#<(_G_baddie01_00)
	inc	hl
	ld	(hl),#>(_G_baddie01_00)
;src/entities/enemies.c:90: enemies[k].sprite[1]= (u8*) G_baddie01_01;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	(hl),#<(_G_baddie01_01)
	inc	hl
	ld	(hl),#>(_G_baddie01_01)
;src/entities/enemies.c:91: enemies[k].sprite[2]= (u8*) G_baddie01_02;
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),#<(_G_baddie01_02)
	inc	hl
	ld	(hl),#>(_G_baddie01_02)
;src/entities/enemies.c:92: enemies[k].sprite[3]= (u8*) G_baddie01_03;
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),#<(_G_baddie01_03)
	inc	hl
	ld	(hl),#>(_G_baddie01_03)
;src/entities/enemies.c:93: enemies[k].sprite[4]= (u8*) G_baddie01_04;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#<(_G_baddie01_04)
	inc	hl
	ld	(hl),#>(_G_baddie01_04)
;src/entities/enemies.c:94: enemies[k].sprite[5]= (u8*) G_baddie01_05;
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),#<(_G_baddie01_05)
	inc	hl
	ld	(hl),#>(_G_baddie01_05)
;src/entities/enemies.c:95: enemies[k].sprite[6]= (u8*) G_baddie01_06;
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),#<(_G_baddie01_06)
	inc	hl
	ld	(hl),#>(_G_baddie01_06)
;src/entities/enemies.c:96: enemies[k].sprite[7]= (u8*) G_baddie01_07;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#<(_G_baddie01_07)
	inc	hl
	ld	(hl),#>(_G_baddie01_07)
;src/entities/enemies.c:97: enemies[k].movement=1;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x01
;src/entities/enemies.c:98: enemies[k].stage=0;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:99: enemies[k].stage_step=0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/entities/enemies.c:101: }
00107$:
;src/entities/enemies.c:102: active_enemies++;
	ld	hl, #_active_enemies+0
	inc	(hl)
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:108: void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
;	---------------------------------
; Function create_enemy_group
; ---------------------------------
_create_enemy_group::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/entities/enemies.c:110: if (active_groups < MAX_ENEMY_GROUPS){
	ld	a,(#_active_groups + 0)
	sub	a, #0x04
	jr	NC,00106$
;src/entities/enemies.c:112: while (groups[k].active){
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
;src/entities/enemies.c:113: k++;
	inc	d
	jr	00101$
00103$:
;src/entities/enemies.c:115: groups[k].active=1;
	ld	a,#0x01
	ld	(bc),a
;src/entities/enemies.c:116: groups[k].x=x;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/enemies.c:117: groups[k].y=y;
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
;src/entities/enemies.c:118: groups[k].enemy_type=type;
	ld	hl,#0x0005
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
;src/entities/enemies.c:119: groups[k].num_enemies=num_enemies;
	ld	hl,#0x0006
	add	hl,bc
	ld	a,9 (ix)
	ld	(hl),a
;src/entities/enemies.c:120: groups[k].sleep=ENEMY_GAP;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/entities/enemies.c:121: active_groups++;
	ld	hl, #_active_groups+0
	inc	(hl)
00106$:
	pop	ix
	ret
;src/entities/enemies.c:129: void update_enemies(){
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
;src/entities/enemies.c:133: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00112$
;src/entities/enemies.c:134: for (i=0;i<MAX_ENEMIES;i++){
	ld	-21 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00124$:
;src/entities/enemies.c:135: if (enemies[i].active){
	ld	a,#<(_enemies)
	add	a, -2 (ix)
	ld	-8 (ix),a
	ld	a,#>(_enemies)
	adc	a, -1 (ix)
	ld	-7 (ix),a
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	push	bc
	pop	iy
	ld	a,23 (iy)
	ld	-9 (ix), a
	or	a, a
	jp	Z,00125$
;src/entities/enemies.c:136: if (enemies[i].movement<99){
	ld	a,-8 (ix)
	add	a, #0x1D
	ld	-6 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	ld	a,d
	sub	a, #0x63
	jp	NC,00125$
;src/entities/enemies.c:137: if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
	ld	a,-8 (ix)
	add	a, #0x1F
	ld	-11 (ix),a
	ld	a,-7 (ix)
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
	ld	a,-8 (ix)
	add	a, #0x1E
	ld	-13 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-9 (ix), a
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
;src/entities/enemies.c:138: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
	ld	a,-8 (ix)
	add	a, #0x16
	ld	-17 (ix),a
	ld	a,-7 (ix)
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
;src/entities/enemies.c:139: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
	ld	a,-8 (ix)
	add	a, #0x10
	ld	-17 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-15 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
;src/entities/enemies.c:140: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
	ld	a,-8 (ix)
	add	a, #0x12
	ld	-19 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-18 (ix),a
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	a,(hl)
	ld	-17 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-16 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
;src/entities/enemies.c:141: enemies[i].stage_step++;
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
;src/entities/enemies.c:143: enemies[i].stage++;
	ld	a,-9 (ix)
	inc	a
	ld	-20 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,-20 (ix)
	ld	(hl),a
;src/entities/enemies.c:144: enemies[i].stage_step=0;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x00
;src/entities/enemies.c:145: if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
;src/entities/enemies.c:146: enemies[i].stage=0;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),#0x00
00102$:
;src/entities/enemies.c:148: enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
	ld	a,#<(_enemies)
	add	a, -4 (ix)
	ld	-19 (ix),a
	ld	a,#>(_enemies)
	adc	a, -3 (ix)
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
;src/entities/enemies.c:149: enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
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
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	a,#<(_movements)
	add	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,#>(_movements)
	adc	a, -5 (ix)
	ld	-5 (ix),a
	inc	-6 (ix)
	jr	NZ,00179$
	inc	-5 (ix)
00179$:
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-20 (ix), a
	add	a, a
	add	a, a
	ld	h,a
	ld	a,-6 (ix)
	add	a, h
	ld	-6 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	a,(hl)
	ld	-20 (ix), a
	ld	-6 (ix),a
	ld	a,-20 (ix)
	rla
	sbc	a, a
	ld	-5 (ix),a
	ld	a,-13 (ix)
	add	a, -6 (ix)
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a, -5 (ix)
	ld	-12 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,-13 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-12 (ix)
	ld	(hl),a
;src/entities/enemies.c:150: enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
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
;src/entities/enemies.c:151: enemies[i].stage_step++;
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
;src/entities/enemies.c:134: for (i=0;i<MAX_ENEMIES;i++){
	ld	a,-4 (ix)
	add	a, #0x24
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	a,-2 (ix)
	add	a, #0x24
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	inc	-21 (ix)
	ld	a,-21 (ix)
	sub	a, #0x1E
	jp	C,00124$
00112$:
;src/entities/enemies.c:159: if (active_groups>0){
	ld	a,(#_active_groups + 0)
	or	a, a
	jp	Z,00128$
;src/entities/enemies.c:161: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	ld	-21 (ix),#0x00
00126$:
;src/entities/enemies.c:162: if (groups[i].active){
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
;src/entities/enemies.c:163: if (groups[i].sleep==0){
	ld	hl,#0x0007
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00117$
;src/entities/enemies.c:164: groups[i].sleep=ENEMY_GAP;
	ld	(hl),#0x03
;src/entities/enemies.c:165: if (groups[i].num_enemies==0){
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	or	a, a
	jr	NZ,00114$
;src/entities/enemies.c:166: groups[i].active=0;
	xor	a, a
	ld	(de),a
;src/entities/enemies.c:167: active_groups--;
	ld	hl, #_active_groups+0
	dec	(hl)
	jr	00127$
00114$:
;src/entities/enemies.c:169: create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
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
;src/entities/enemies.c:170: groups[i].num_enemies--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	jr	00127$
00117$:
;src/entities/enemies.c:173: groups[i].sleep--;
	add	a,#0xFF
	ld	(hl),a
00127$:
;src/entities/enemies.c:161: for (i=0;i<MAX_ENEMY_GROUPS;i++){
	inc	-21 (ix)
	ld	a,-21 (ix)
	sub	a, #0x04
	jr	C,00126$
00128$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:181: u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
;	---------------------------------
; Function inside_screen
; ---------------------------------
_inside_screen::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/entities/enemies.c:183: return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
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
;src/entities/enemies.c:190: void draw_enemies(u8* screen){
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
;src/entities/enemies.c:195: if (active_enemies>0){
	ld	a,(#_active_enemies + 0)
	or	a, a
	jp	Z,00109$
;src/entities/enemies.c:196: for (k=0;k<MAX_ENEMIES;k++){
	ld	-15 (ix),#0x00
	ld	de,#0x0000
00107$:
;src/entities/enemies.c:197: if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
	ld	hl,#_enemies
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	bc, #0x0017
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jp	Z,00108$
	ld	a,-2 (ix)
	add	a, #0x15
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	a,-2 (ix)
	add	a, #0x14
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	ld	a,-2 (ix)
	add	a, #0x12
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	a,-2 (ix)
	add	a, #0x10
	ld	-12 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	ld	-14 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-13 (ix),a
	push	de
	push	bc
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	_inside_screen
	pop	af
	pop	af
	pop	af
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00108$
;src/entities/enemies.c:198: pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
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
;src/entities/enemies.c:199: cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-14 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-12 (ix),a
	ld	-10 (ix),c
	ld	-9 (ix),b
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	bc, #0x0016
	add	hl, bc
	ld	a,(hl)
	add	a, a
	ld	c,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	h,-14 (ix)
	ld	l,-12 (ix)
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	push	bc
	call	_cpct_drawSprite
	pop	de
00108$:
;src/entities/enemies.c:196: for (k=0;k<MAX_ENEMIES;k++){
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
