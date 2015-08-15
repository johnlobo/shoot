;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Mon Aug 10 00:37:25 2015
;--------------------------------------------------------
	.module explosions
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_time
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _explosiones_lastUpdated
	.globl _explosion_sprite
	.globl _explosiones_activas
	.globl _explosiones
	.globl _init_explosions
	.globl _create_explosion
	.globl _update_explosions
	.globl _draw_explosions
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_explosiones::
	.ds 480
_explosiones_activas::
	.ds 1
_explosion_sprite::
	.ds 16
_explosiones_lastUpdated::
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
;src/entities/explosions.c:20: void init_explosions(){
;	---------------------------------
; Function init_explosions
; ---------------------------------
_init_explosions::
;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
	ld	d,#0x00
00102$:
;src/entities/explosions.c:24: explosiones[i].activo=0;
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_explosiones)
	add	a, l
	ld	c,a
	ld	a,#>(_explosiones)
	adc	a, h
	ld	b,a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl),#0x00
;src/entities/explosions.c:25: explosiones[i].tipo=0;
	xor	a, a
	ld	(bc),a
;src/entities/explosions.c:26: explosiones[i].fase=0;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl),#0x00
;src/entities/explosions.c:27: explosiones[i].x=0;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x00
;src/entities/explosions.c:28: explosiones[i].y=0;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x00
;src/entities/explosions.c:29: explosiones[i].h=0;
	ld	hl,#0x0005
	add	hl,bc
	ld	(hl),#0x00
;src/entities/explosions.c:30: explosiones[i].w=0;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/entities/explosions.c:31: explosiones[i].lastmoved=0;
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
;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
	inc	d
	ld	a,d
	sub	a, #0x1E
	jr	C,00102$
;src/entities/explosions.c:33: explosiones_activas=0;
	ld	hl,#_explosiones_activas + 0
	ld	(hl), #0x00
;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
	ld	hl,#_explosion02000
	ld	(_explosion_sprite), hl
;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
	ld	hl,#_explosion02001
	ld	((_explosion_sprite + 0x0002)), hl
;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
	ld	hl,#_explosion02002
	ld	((_explosion_sprite + 0x0004)), hl
;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
	ld	hl,#_explosion02003
	ld	((_explosion_sprite + 0x0006)), hl
;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
	ld	hl,#_toque000
	ld	((_explosion_sprite + 0x0008)), hl
;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
	ld	hl,#_toque001
	ld	((_explosion_sprite + 0x000a)), hl
;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
	ld	hl,#_toque002
	ld	((_explosion_sprite + 0x000c)), hl
;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
	ld	hl,#_toque003
	ld	((_explosion_sprite + 0x000e)), hl
	ret
;src/entities/explosions.c:47: void create_explosion(u8 x, u8 y, u8 tipo){
;	---------------------------------
; Function create_explosion
; ---------------------------------
_create_explosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
	ld	bc,#_explosiones+0
	ld	e,#0x00
00101$:
	ld	l,e
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	a
	jr	NZ,00103$
;src/entities/explosions.c:51: i++;
	inc	e
	jr	00101$
00103$:
;src/entities/explosions.c:53: explosiones[i].activo=1;
	ld	(hl),#0x01
;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
	pop	hl
	push	hl
	ld	a,6 (ix)
	ld	(hl),a
;src/entities/explosions.c:55: explosiones[i].fase=0;
	pop	hl
	push	hl
	inc	hl
	ld	(hl),#0x00
;src/entities/explosions.c:56: explosiones[i].x=x;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,4 (ix)
	ld	(hl),a
;src/entities/explosions.c:57: explosiones[i].y=y;
	ld	a,-2 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,5 (ix)
	ld	(hl),a
;src/entities/explosions.c:60: explosiones[i].h=16;
	ld	a,-2 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
;src/entities/explosions.c:61: explosiones[i].w=4;
	ld	a,-2 (ix)
	add	a, #0x06
	ld	e,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	d,a
;src/entities/explosions.c:59: if (!tipo){
	ld	a,6 (ix)
	or	a, a
	jr	NZ,00105$
;src/entities/explosions.c:60: explosiones[i].h=16;
	ld	(hl),#0x10
;src/entities/explosions.c:61: explosiones[i].w=4;
	ld	a,#0x04
	ld	(de),a
	jr	00106$
00105$:
;src/entities/explosions.c:63: explosiones[i].h=8;
	ld	(hl),#0x08
;src/entities/explosions.c:64: explosiones[i].w=2;
	ld	a,#0x02
	ld	(de),a
00106$:
;src/entities/explosions.c:66: explosiones_activas++;
	ld	hl, #_explosiones_activas+0
	inc	(hl)
	ld	sp, ix
	pop	ix
	ret
;src/entities/explosions.c:73: void update_explosions(){
;	---------------------------------
; Function update_explosions
; ---------------------------------
_update_explosions::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/entities/explosions.c:75: if ((explosiones_activas>0)&&((get_time()-explosiones_lastUpdated>EXPLOSIONS_SPEED))){
	ld	a,(#_explosiones_activas + 0)
	or	a, a
	jp	Z,00112$
	call	_get_time
	ld	-1 (ix),d
	ld	-2 (ix),e
	ld	-3 (ix),h
	ld	-4 (ix),l
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_explosiones_lastUpdated
	ld	bc, #4
	ldir
	ld	a,-4 (ix)
	sub	a, -8 (ix)
	ld	h,a
	ld	a,-3 (ix)
	sbc	a, -7 (ix)
	ld	l,a
	ld	a,-2 (ix)
	sbc	a, -6 (ix)
	ld	e,a
	ld	a,-1 (ix)
	sbc	a, -5 (ix)
	ld	d,a
	ld	a,#0x1E
	cp	a, h
	ld	a,#0x00
	sbc	a, l
	ld	a,#0x00
	sbc	a, e
	ld	a,#0x00
	sbc	a, d
	jr	NC,00112$
;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
	ld	c,#0x00
00110$:
;src/entities/explosions.c:77: if (explosiones[i].activo==1){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_explosiones)
	add	a, l
	ld	-8 (ix),a
	ld	a,#>(_explosiones)
	adc	a, h
	ld	-7 (ix),a
	pop	de
	push	de
	inc	de
	inc	de
	ld	a,(de)
	dec	a
	jr	NZ,00111$
;src/entities/explosions.c:78: if (explosiones[i].fase<3){
	pop	hl
	push	hl
	inc	hl
	ld	b,(hl)
	ld	a,b
	sub	a, #0x03
	jr	NC,00102$
;src/entities/explosions.c:79: explosiones[i].fase++;
	inc	b
	ld	(hl),b
	jr	00111$
00102$:
;src/entities/explosions.c:83: explosiones[i].activo=0;
	xor	a, a
	ld	(de),a
;src/entities/explosions.c:84: explosiones_activas--;
	ld	hl, #_explosiones_activas+0
	dec	(hl)
00111$:
;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
	inc	c
	ld	a,c
	sub	a, #0x1E
	jr	C,00110$
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/entities/explosions.c:97: void draw_explosions(u8* screen){
;	---------------------------------
; Function draw_explosions
; ---------------------------------
_draw_explosions::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/entities/explosions.c:103: if (explosiones_activas>0){
	ld	a,(#_explosiones_activas + 0)
	or	a, a
	jp	Z,00108$
;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
	ld	c,#0x00
00106$:
;src/entities/explosions.c:105: if (explosiones[i].activo==1){
	ld	l,c
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_explosiones)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_explosiones)
	adc	a, h
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	a
	jr	NZ,00107$
;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h,(hl)
	ld	l,4 (ix)
	ld	d,5 (ix)
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	h, d
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	push	hl
	pop	iy
;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a,(hl)
	ld	-3 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_explosion_sprite)
	add	a, l
	ld	e,a
	ld	a,#>(_explosion_sprite)
	adc	a, h
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a,(hl)
	add	a, a
	ld	l,a
	ld	h,#0x00
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	bc
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
00107$:
;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
	inc	c
	ld	a,c
	sub	a, #0x1E
	jp	C,00106$
00108$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
