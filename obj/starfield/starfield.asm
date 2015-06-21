;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 21 2015) (Mac OS X x86_64)
; This file was generated Sun Jun 21 19:57:08 2015
;--------------------------------------------------------
	.module starfield
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetMode0PixelColorByte
	.globl _pixelEstrella
	.globl _cpct_getScreenPtr
	.globl _rand
	.globl _aStars
	.globl _inicializarEstrellas
	.globl _pintarEstrellas
	.globl _moverEstrellas
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_aStars::
	.ds 120
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
;src/starfield/starfield.c:13: u8 pixelEstrella(u8 nPixel){
;	---------------------------------
; Function pixelEstrella
; ---------------------------------
_pixelEstrella::
;src/starfield/starfield.c:16: if(nPixel == 0)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	NZ,00102$
;src/starfield/starfield.c:18: nByte = 32;
	ld	l,#0x20
	ret
00102$:
;src/starfield/starfield.c:21: nByte = 16;
	ld	l,#0x10
;src/starfield/starfield.c:24: return nByte;
	ret
;src/starfield/starfield.c:30: u8 GetMode0PixelColorByte(u8 nColor, u8 nPixel)
;	---------------------------------
; Function GetMode0PixelColorByte
; ---------------------------------
_GetMode0PixelColorByte::
	dec	sp
;src/starfield/starfield.c:38: if(nColor & 1)
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	and	a, #0x01
	ld	b,a
;src/starfield/starfield.c:41: if(nColor & 2)
	ld	a,0 (iy)
	and	a, #0x02
	ld	d,a
;src/starfield/starfield.c:44: if(nColor & 4)
	ld	a,0 (iy)
	and	a, #0x04
	inc	sp
	push	af
	inc	sp
;src/starfield/starfield.c:47: if(nColor & 8)
	ld	a,0 (iy)
	and	a, #0x08
	ld	e,a
;src/starfield/starfield.c:34: if(nPixel == 0)
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
;src/starfield/starfield.c:36: nByte &= 85;
	or	a,a
	jr	NZ,00118$
	ld	l,a
;src/starfield/starfield.c:38: if(nColor & 1)
	ld	a,b
	or	a, a
	jr	Z,00102$
;src/starfield/starfield.c:39: nByte |= 128;
	ld	l,#0x80
00102$:
;src/starfield/starfield.c:41: if(nColor & 2)
	ld	a,d
	or	a, a
	jr	Z,00104$
;src/starfield/starfield.c:42: nByte |= 8;
	set	3, l
00104$:
;src/starfield/starfield.c:44: if(nColor & 4)
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	or	a, a
	jr	Z,00106$
;src/starfield/starfield.c:45: nByte |= 32;
	set	5, l
00106$:
;src/starfield/starfield.c:47: if(nColor & 8)
	ld	a,e
	or	a, a
	jr	Z,00119$
;src/starfield/starfield.c:48: nByte |= 2;
	set	1, l
	jr	00119$
00118$:
;src/starfield/starfield.c:52: nByte &= 170;
	ld	l,#0x00
;src/starfield/starfield.c:54: if(nColor & 1)
	ld	a,b
	or	a, a
	jr	Z,00110$
;src/starfield/starfield.c:55: nByte |= 64;
	ld	l,#0x40
00110$:
;src/starfield/starfield.c:57: if(nColor & 2)
	ld	a,d
	or	a, a
	jr	Z,00112$
;src/starfield/starfield.c:58: nByte |= 4;
	set	2, l
00112$:
;src/starfield/starfield.c:60: if(nColor & 4)
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	or	a, a
	jr	Z,00114$
;src/starfield/starfield.c:61: nByte |= 16;
	set	4, l
00114$:
;src/starfield/starfield.c:63: if(nColor & 8)
	ld	a,e
	or	a, a
	jr	Z,00119$
;src/starfield/starfield.c:64: nByte |= 1;
	set	0, l
00119$:
;src/starfield/starfield.c:67: return nByte;
	inc	sp
	ret
;src/starfield/starfield.c:74: void inicializarEstrellas(){
;	---------------------------------
; Function inicializarEstrellas
; ---------------------------------
_inicializarEstrellas::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-5 (ix),#0x00
00102$:
;src/starfield/starfield.c:80: aStars[nStar].nX = rand() % 160;
	ld	l,-5 (ix)
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
;src/starfield/starfield.c:81: aStars[nStar].nY = rand() % 199;
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
;src/starfield/starfield.c:82: aStars[nStar].nStarType = rand() % 3;
	ld	hl,#0x0002
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/starfield/starfield.c:83: aStars[nStar].columnOffset = aStars[nStar].nY/2;
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	srl	a
	ld	(de),a
;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
	inc	-5 (ix)
	ld	a,-5 (ix)
	sub	a, #0x0F
	jr	C,00102$
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:90: void pintarEstrellas(u8* screen){
;	---------------------------------
; Function pintarEstrellas
; ---------------------------------
_pintarEstrellas::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/starfield/starfield.c:94: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-4 (ix),#0x00
00102$:
;src/starfield/starfield.c:96: pStar = &aStars[nStar];
	ld	l,-4 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_aStars
	add	hl,de
	ld	c, l
	ld	b, h
;src/starfield/starfield.c:98: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
	ld	hl,#0x0006
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
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
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/starfield/starfield.c:99: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
	ld	a,(de)
	ld	-3 (ix),a
	ld	a,(bc)
	and	a, #0x01
	ld	-1 (ix),a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	b,(hl)
	inc	b
	push	de
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_GetMode0PixelColorByte
	pop	af
	ld	a,l
	pop	de
	xor	a, -3 (ix)
	ld	(de),a
;src/starfield/starfield.c:94: for(nStar = 0; nStar < STARS_NUM; nStar++)
	inc	-4 (ix)
	ld	a,-4 (ix)
	sub	a, #0x0F
	jr	C,00102$
	ld	sp, ix
	pop	ix
	ret
;src/starfield/starfield.c:106: void moverEstrellas(){
;	---------------------------------
; Function moverEstrellas
; ---------------------------------
_moverEstrellas::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/starfield/starfield.c:111: for(nStar = 0; nStar < STARS_NUM; nStar++)
	ld	-7 (ix),#0x00
00108$:
;src/starfield/starfield.c:113: pStar = &aStars[nStar];
	ld	l,-7 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_aStars
	add	hl,de
	ld	c, l
	ld	b, h
;src/starfield/starfield.c:115: switch(pStar->nStarType)
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
;src/starfield/starfield.c:118: pStar->nY += 1;
	ld	e, c
	ld	d, b
	inc	de
;src/starfield/starfield.c:115: switch(pStar->nStarType)
	ld	a,#0x02
	sub	a, -3 (ix)
	jr	C,00104$
;src/starfield/starfield.c:118: pStar->nY += 1;
	ld	a,(de)
	ld	-4 (ix),a
;src/starfield/starfield.c:115: switch(pStar->nStarType)
	push	de
	ld	e,-3 (ix)
	ld	d,#0x00
	ld	hl,#00125$
	add	hl,de
	add	hl,de
;src/starfield/starfield.c:117: case 0: //slow star
	pop	de
	jp	(hl)
00125$:
	jr	00101$
	jr	00102$
	jr	00103$
00101$:
;src/starfield/starfield.c:118: pStar->nY += 1;
	ld	a,-4 (ix)
	inc	a
	ld	(de),a
;src/starfield/starfield.c:119: break;
	jr	00104$
;src/starfield/starfield.c:120: case 1: //medium star
00102$:
;src/starfield/starfield.c:121: pStar->nY += 3;
	ld	a,-4 (ix)
	add	a, #0x03
	ld	(de),a
;src/starfield/starfield.c:122: break;
	jr	00104$
;src/starfield/starfield.c:123: case 2: //fast star
00103$:
;src/starfield/starfield.c:124: pStar->nY += 6;
	ld	a,-4 (ix)
	add	a, #0x06
	ld	(de),a
;src/starfield/starfield.c:126: }
00104$:
;src/starfield/starfield.c:128: if(pStar->nY >= 190)
	ld	a,(de)
	sub	a, #0xBE
	jr	C,00109$
;src/starfield/starfield.c:130: pStar->nY = 0;
	xor	a, a
	ld	(de),a
;src/starfield/starfield.c:131: pStar->nX = rand() % 160;
	push	bc
	call	_rand
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	hl,#0x00A0
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	ld	(bc),a
;src/starfield/starfield.c:132: pStar->nStarType = rand() % 3;
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
;src/starfield/starfield.c:111: for(nStar = 0; nStar < STARS_NUM; nStar++)
	inc	-7 (ix)
	ld	a,-7 (ix)
	sub	a, #0x0F
	jp	C,00108$
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
