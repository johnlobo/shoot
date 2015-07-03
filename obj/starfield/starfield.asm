;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
; This file was generated Wed Jul  1 00:32:44 2015
;--------------------------------------------------------
	.module starfield
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_mode0_pixel_color_byte
	.globl _cpct_getScreenPtr
	.globl _rand
	.globl _pixelColors
	.globl _aStars
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
	.ds 120
_pixelColors::
	.ds 3
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
;src/starfield/starfield.c:58: void init_stars(){
;	---------------------------------
; Function init_stars
; ---------------------------------
_init_stars::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-3 (ix),#0x00
00102$:
;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
	ld	l,-3 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a,#<(_aStars)
	add	a, l
	ld	e,a
	ld	a,#>(_aStars)
	adc	a, h
	ld	d,a
	push	de
	call	_rand
	ld	bc,#0x00A0
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	a,l
	ld	(de),a
;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
	ld	hl,#0x0001
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	push	de
	call	_rand
	ld	bc,#0x00C7
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	a,l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
	inc	de
	inc	de
	push	de
	call	_rand
	ld	bc,#0x0003
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	ld	a,l
	ld	(de),a
;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
	inc	-3 (ix)
	ld	a,-3 (ix)
	sub	a, #0x0F
	jr	C,00102$
;src/starfield/starfield.c:68: pixelColors[0]=1;
	ld	hl,#_pixelColors
	ld	(hl),#0x01
;src/starfield/starfield.c:69: pixelColors[1]=2;
	inc	hl
	ld	(hl),#0x02
;src/starfield/starfield.c:70: pixelColors[2]=3;
	ld	hl,#_pixelColors + 2
	ld	(hl),#0x03
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:76: void draw_stars(u8* screen){
;	---------------------------------
; Function draw_stars
; ---------------------------------
_draw_stars::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-4 (ix),#0x00
00102$:
;src/starfield/starfield.c:82: pStar = &aStars[nStar];
	ld	l,-4 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_aStars
	add	hl,de
	ld	c, l
	ld	b, h
;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
	ld	hl,#0x0006
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
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
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
	ld	a,(de)
	ld	-2 (ix),a
	ld	a,(bc)
	and	a, #0x01
	ld	-3 (ix),a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	b,(hl)
	inc	b
	push	de
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_get_mode0_pixel_color_byte
	pop	af
	ld	a,l
	pop	de
	xor	a, -2 (ix)
	ld	(de),a
;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x0F
	jr	C,00102$
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:92: void update_stars(){
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
;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-8 (ix),#0x00
00108$:
;src/starfield/starfield.c:99: pStar = &aStars[nStar];
	ld	l,-8 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_aStars
	add	hl,de
	ld	c, l
	ld	b, h
;src/starfield/starfield.c:101: switch(pStar->nStarType)
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
;src/starfield/starfield.c:104: pStar->nY += 1;
	ld	e, c
	ld	d, b
	inc	de
;src/starfield/starfield.c:101: switch(pStar->nStarType)
	ld	a,#0x02
	sub	a, -3 (ix)
	jr	C,00104$
;src/starfield/starfield.c:104: pStar->nY += 1;
	ld	a,(de)
	ld	-4 (ix), a
	inc	a
	ld	-5 (ix),a
;src/starfield/starfield.c:101: switch(pStar->nStarType)
	push	de
	ld	e,-3 (ix)
	ld	d,#0x00
	ld	hl,#00125$
	add	hl,de
	add	hl,de
;src/starfield/starfield.c:103: case 0: //slow star
	pop	de
	jp	(hl)
00125$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/starfield/starfield.c:104: pStar->nY += 1;
	ld	a,-5 (ix)
	ld	(de),a
;src/starfield/starfield.c:105: break;
	jr	00104$
;src/starfield/starfield.c:106: case 1: //medium star
00102$:
;src/starfield/starfield.c:107: pStar->nY += 1;
	ld	a,-5 (ix)
	ld	(de),a
;src/starfield/starfield.c:108: break;
	jr	00104$
;src/starfield/starfield.c:109: case 2: //fast star
00103$:
;src/starfield/starfield.c:110: pStar->nY += 2;
	ld	a,-4 (ix)
	add	a, #0x02
	ld	(de),a
;src/starfield/starfield.c:112: }
00104$:
;src/starfield/starfield.c:114: if(pStar->nY >= 198)
	ld	a,(de)
	sub	a, #0xC6
	jr	C,00109$
;src/starfield/starfield.c:116: pStar->nY = 0;
	xor	a, a
	ld	(de),a
;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
	push	bc
	call	_rand
	ld	-6 (ix),h
	ld	-7 (ix),l
	ld	hl,#0x00A0
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	ld	(bc),a
;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
	call	_rand
	ld	bc,#0x0003
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	a,l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
00109$:
;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
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
