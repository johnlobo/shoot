;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
; This file was generated Sun Aug 16 01:47:07 2015
;--------------------------------------------------------
	.module starfield
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_mode0_pixel_color_byte
	.globl _get_time
	.globl _cpct_getRandomUniform_u8_f
	.globl _cpct_getScreenPtr
	.globl _last_moved_stars
	.globl _aStars
	.globl _get_last_moved_stars
	.globl _init_stars
	.globl _draw_stars
	.globl _update_stars
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_aStars::
	.ds 105
_last_moved_stars::
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
;src/starfield/starfield.c:14: u8 get_mode0_pixel_color_byte(u8 nColor, u8 nPixel)
;	---------------------------------
; Function get_mode0_pixel_color_byte
; ---------------------------------
_get_mode0_pixel_color_byte::
	dec	sp
;src/starfield/starfield.c:22: if(nColor & 1)
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	and	a, #0x01
	ld	b,a
;src/starfield/starfield.c:25: if(nColor & 2)
	ld	a,0 (iy)
	and	a, #0x02
	ld	d,a
;src/starfield/starfield.c:28: if(nColor & 4)
	ld	a,0 (iy)
	and	a, #0x04
	inc	sp
	push	af
	inc	sp
;src/starfield/starfield.c:31: if(nColor & 8)
	ld	a,0 (iy)
	and	a, #0x08
	ld	e,a
;src/starfield/starfield.c:18: if(nPixel == 0)
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
;src/starfield/starfield.c:20: nByte &= 85;
	or	a,a
	jr	NZ,00118$
	ld	l,a
;src/starfield/starfield.c:22: if(nColor & 1)
	ld	a,b
	or	a, a
	jr	Z,00102$
;src/starfield/starfield.c:23: nByte |= 128;
	ld	l,#0x80
00102$:
;src/starfield/starfield.c:25: if(nColor & 2)
	ld	a,d
	or	a, a
	jr	Z,00104$
;src/starfield/starfield.c:26: nByte |= 8;
	set	3, l
00104$:
;src/starfield/starfield.c:28: if(nColor & 4)
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	or	a, a
	jr	Z,00106$
;src/starfield/starfield.c:29: nByte |= 32;
	set	5, l
00106$:
;src/starfield/starfield.c:31: if(nColor & 8)
	ld	a,e
	or	a, a
	jr	Z,00119$
;src/starfield/starfield.c:32: nByte |= 2;
	set	1, l
	jr	00119$
00118$:
;src/starfield/starfield.c:36: nByte &= 170;
	ld	l,#0x00
;src/starfield/starfield.c:38: if(nColor & 1)
	ld	a,b
	or	a, a
	jr	Z,00110$
;src/starfield/starfield.c:39: nByte |= 64;
	ld	l,#0x40
00110$:
;src/starfield/starfield.c:41: if(nColor & 2)
	ld	a,d
	or	a, a
	jr	Z,00112$
;src/starfield/starfield.c:42: nByte |= 4;
	set	2, l
00112$:
;src/starfield/starfield.c:44: if(nColor & 4)
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	or	a, a
	jr	Z,00114$
;src/starfield/starfield.c:45: nByte |= 16;
	set	4, l
00114$:
;src/starfield/starfield.c:47: if(nColor & 8)
	ld	a,e
	or	a, a
	jr	Z,00119$
;src/starfield/starfield.c:48: nByte |= 1;
	set	0, l
00119$:
;src/starfield/starfield.c:51: return nByte;
	inc	sp
	ret
;src/starfield/starfield.c:58: long get_last_moved_stars(){
;	---------------------------------
; Function get_last_moved_stars
; ---------------------------------
_get_last_moved_stars::
;src/starfield/starfield.c:59: return last_moved_stars;
	ld	iy,#_last_moved_stars
	ld	l,0 (iy)
	ld	iy,#_last_moved_stars
	ld	h,1 (iy)
	ld	iy,#_last_moved_stars
	ld	e,2 (iy)
	ld	iy,#_last_moved_stars
	ld	d,3 (iy)
	ret
;src/starfield/starfield.c:66: void init_stars(){
;	---------------------------------
; Function init_stars
; ---------------------------------
_init_stars::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
00102$:
;src/starfield/starfield.c:72: aStars[nStar].nX = cpct_getRandomUniform_u8_f(0) % 160;
	ld	a,#<(_aStars)
	add	a, -3 (ix)
	ld	e,a
	ld	a,#>(_aStars)
	adc	a, -2 (ix)
	ld	d,a
	push	de
	ld	l,#0x00
	call	_cpct_getRandomUniform_u8_f
	ld	b,l
	ld	a,#0xA0
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	pop	de
	ld	(de),a
;src/starfield/starfield.c:73: aStars[nStar].nY = cpct_getRandomUniform_u8_f(0) % 199;
	ld	c, e
	ld	b, d
	inc	bc
	push	bc
	push	de
	ld	l,#0x00
	call	_cpct_getRandomUniform_u8_f
	ld	-1 (ix),l
	ld	a,#0xC7
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	pop	de
	pop	bc
	ld	(bc),a
;src/starfield/starfield.c:74: aStars[nStar].nStarType = cpct_getRandomUniform_u8_f(0) % 3;
	inc	de
	inc	de
	push	de
	ld	l,#0x00
	call	_cpct_getRandomUniform_u8_f
	ld	b,l
	ld	a,#0x03
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	pop	de
	ld	(de),a
;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	a,-3 (ix)
	add	a, #0x07
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x0F
	jr	C,00102$
;src/starfield/starfield.c:76: last_moved_stars = 0;
	xor	a, a
	ld	(#_last_moved_stars + 0),a
	ld	(#_last_moved_stars + 1),a
	ld	(#_last_moved_stars + 2),a
	ld	(#_last_moved_stars + 3),a
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:82: void draw_stars(u8* screen){
;	---------------------------------
; Function draw_stars
; ---------------------------------
_draw_stars::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-10 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00102$:
;src/starfield/starfield.c:88: pStar = &aStars[nStar];
	ld	a,#<(_aStars)
	add	a, -2 (ix)
	ld	c,a
	ld	a,#>(_aStars)
	adc	a, -1 (ix)
	ld	b,a
;src/starfield/starfield.c:90: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
	ld	hl,#0x0005
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	ld	a,(bc)
	ld	h,a
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
	ex	de,hl
	pop	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/starfield/starfield.c:91: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
	ld	a,(de)
	ld	-4 (ix),a
	ld	a,(bc)
	and	a, #0x01
	ld	-5 (ix),a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	b,(hl)
	inc	b
	push	de
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_get_mode0_pixel_color_byte
	pop	af
	ld	a,l
	pop	de
	xor	a, -4 (ix)
	ld	(de),a
;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	a,-2 (ix)
	add	a, #0x07
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	inc	-10 (ix)
	ld	a,-10 (ix)
	sub	a, #0x0F
	jr	C,00102$
;src/starfield/starfield.c:93: last_moved_stars = get_time();
	call	_get_time
	ld	-6 (ix),d
	ld	-7 (ix),e
	ld	-8 (ix),h
	ld	-9 (ix),l
	ld	de, #_last_moved_stars
	ld	hl, #1
	add	hl, sp
	ld	bc, #4
	ldir
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:99: void update_stars(){
;	---------------------------------
; Function update_stars
; ---------------------------------
_update_stars::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-8 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00108$:
;src/starfield/starfield.c:106: pStar = &aStars[nStar];
	ld	a,#<(_aStars)
	add	a, -2 (ix)
	ld	c,a
	ld	a,#>(_aStars)
	adc	a, -1 (ix)
	ld	b,a
;src/starfield/starfield.c:108: switch(pStar->nStarType)
	ld	hl,#0x0002
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
;src/starfield/starfield.c:111: pStar->nY += 1;
	ld	e, c
	ld	d, b
	inc	de
;src/starfield/starfield.c:108: switch(pStar->nStarType)
	ld	a,#0x02
	sub	a, -5 (ix)
	jr	C,00104$
;src/starfield/starfield.c:111: pStar->nY += 1;
	ld	a,(de)
	ld	-6 (ix), a
	inc	a
	ld	-7 (ix),a
;src/starfield/starfield.c:108: switch(pStar->nStarType)
	push	de
	ld	e,-5 (ix)
	ld	d,#0x00
	ld	hl,#00125$
	add	hl,de
	add	hl,de
;src/starfield/starfield.c:110: case 0: //slow star
	pop	de
	jp	(hl)
00125$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/starfield/starfield.c:111: pStar->nY += 1;
	ld	a,-7 (ix)
	ld	(de),a
;src/starfield/starfield.c:112: break;
	jr	00104$
;src/starfield/starfield.c:113: case 1: //medium star
00102$:
;src/starfield/starfield.c:114: pStar->nY += 1;
	ld	a,-7 (ix)
	ld	(de),a
;src/starfield/starfield.c:115: break;
	jr	00104$
;src/starfield/starfield.c:116: case 2: //fast star
00103$:
;src/starfield/starfield.c:117: pStar->nY += 2;
	ld	a,-6 (ix)
	add	a, #0x02
	ld	(de),a
;src/starfield/starfield.c:119: }
00104$:
;src/starfield/starfield.c:121: if(pStar->nY >= 198)
	ld	a,(de)
	sub	a, #0xC6
	jr	C,00109$
;src/starfield/starfield.c:123: pStar->nY = 0;
	xor	a, a
	ld	(de),a
;src/starfield/starfield.c:124: pStar->nX = cpct_getRandomUniform_u8_f(0) % 160;
	push	bc
	ld	l,#0x00
	call	_cpct_getRandomUniform_u8_f
	ld	d,l
	ld	a,#0xA0
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	pop	bc
	ld	(bc),a
;src/starfield/starfield.c:125: pStar->nStarType = cpct_getRandomUniform_u8_f(0) % 3;
	ld	l,#0x00
	call	_cpct_getRandomUniform_u8_f
	ld	d,l
	ld	a,#0x03
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	a,l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
00109$:
;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	a,-2 (ix)
	add	a, #0x07
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	inc	-8 (ix)
	ld	a,-8 (ix)
	sub	a, #0x0F
	jp	C,00108$
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
