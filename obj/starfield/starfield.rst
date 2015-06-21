                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jun 21 19:57:08 2015
                              5 ;--------------------------------------------------------
                              6 	.module starfield
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _GetMode0PixelColorByte
                             13 	.globl _pixelEstrella
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _rand
                             16 	.globl _aStars
                             17 	.globl _inicializarEstrellas
                             18 	.globl _pintarEstrellas
                             19 	.globl _moverEstrellas
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
   319D                      27 _aStars::
   319D                      28 	.ds 120
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 ;src/starfield/starfield.c:13: u8 pixelEstrella(u8 nPixel){
                             54 ;	---------------------------------
                             55 ; Function pixelEstrella
                             56 ; ---------------------------------
   254C                      57 _pixelEstrella::
                             58 ;src/starfield/starfield.c:16: if(nPixel == 0)
   254C 21 02 00      [10]   59 	ld	hl, #2+0
   254F 39            [11]   60 	add	hl, sp
   2550 7E            [ 7]   61 	ld	a, (hl)
   2551 B7            [ 4]   62 	or	a, a
   2552 20 03         [12]   63 	jr	NZ,00102$
                             64 ;src/starfield/starfield.c:18: nByte = 32;
   2554 2E 20         [ 7]   65 	ld	l,#0x20
   2556 C9            [10]   66 	ret
   2557                      67 00102$:
                             68 ;src/starfield/starfield.c:21: nByte = 16;
   2557 2E 10         [ 7]   69 	ld	l,#0x10
                             70 ;src/starfield/starfield.c:24: return nByte;
   2559 C9            [10]   71 	ret
                             72 ;src/starfield/starfield.c:30: u8 GetMode0PixelColorByte(u8 nColor, u8 nPixel)
                             73 ;	---------------------------------
                             74 ; Function GetMode0PixelColorByte
                             75 ; ---------------------------------
   255A                      76 _GetMode0PixelColorByte::
   255A 3B            [ 6]   77 	dec	sp
                             78 ;src/starfield/starfield.c:38: if(nColor & 1)
   255B FD 21 03 00   [14]   79 	ld	iy,#3
   255F FD 39         [15]   80 	add	iy,sp
   2561 FD 7E 00      [19]   81 	ld	a,0 (iy)
   2564 E6 01         [ 7]   82 	and	a, #0x01
   2566 47            [ 4]   83 	ld	b,a
                             84 ;src/starfield/starfield.c:41: if(nColor & 2)
   2567 FD 7E 00      [19]   85 	ld	a,0 (iy)
   256A E6 02         [ 7]   86 	and	a, #0x02
   256C 57            [ 4]   87 	ld	d,a
                             88 ;src/starfield/starfield.c:44: if(nColor & 4)
   256D FD 7E 00      [19]   89 	ld	a,0 (iy)
   2570 E6 04         [ 7]   90 	and	a, #0x04
   2572 33            [ 6]   91 	inc	sp
   2573 F5            [11]   92 	push	af
   2574 33            [ 6]   93 	inc	sp
                             94 ;src/starfield/starfield.c:47: if(nColor & 8)
   2575 FD 7E 00      [19]   95 	ld	a,0 (iy)
   2578 E6 08         [ 7]   96 	and	a, #0x08
   257A 5F            [ 4]   97 	ld	e,a
                             98 ;src/starfield/starfield.c:34: if(nPixel == 0)
   257B 21 04 00      [10]   99 	ld	hl, #4+0
   257E 39            [11]  100 	add	hl, sp
   257F 7E            [ 7]  101 	ld	a, (hl)
                            102 ;src/starfield/starfield.c:36: nByte &= 85;
   2580 B7            [ 4]  103 	or	a,a
   2581 20 23         [12]  104 	jr	NZ,00118$
   2583 6F            [ 4]  105 	ld	l,a
                            106 ;src/starfield/starfield.c:38: if(nColor & 1)
   2584 78            [ 4]  107 	ld	a,b
   2585 B7            [ 4]  108 	or	a, a
   2586 28 02         [12]  109 	jr	Z,00102$
                            110 ;src/starfield/starfield.c:39: nByte |= 128;
   2588 2E 80         [ 7]  111 	ld	l,#0x80
   258A                     112 00102$:
                            113 ;src/starfield/starfield.c:41: if(nColor & 2)
   258A 7A            [ 4]  114 	ld	a,d
   258B B7            [ 4]  115 	or	a, a
   258C 28 02         [12]  116 	jr	Z,00104$
                            117 ;src/starfield/starfield.c:42: nByte |= 8;
   258E CB DD         [ 8]  118 	set	3, l
   2590                     119 00104$:
                            120 ;src/starfield/starfield.c:44: if(nColor & 4)
   2590 FD 21 00 00   [14]  121 	ld	iy,#0
   2594 FD 39         [15]  122 	add	iy,sp
   2596 FD 7E 00      [19]  123 	ld	a,0 (iy)
   2599 B7            [ 4]  124 	or	a, a
   259A 28 02         [12]  125 	jr	Z,00106$
                            126 ;src/starfield/starfield.c:45: nByte |= 32;
   259C CB ED         [ 8]  127 	set	5, l
   259E                     128 00106$:
                            129 ;src/starfield/starfield.c:47: if(nColor & 8)
   259E 7B            [ 4]  130 	ld	a,e
   259F B7            [ 4]  131 	or	a, a
   25A0 28 26         [12]  132 	jr	Z,00119$
                            133 ;src/starfield/starfield.c:48: nByte |= 2;
   25A2 CB CD         [ 8]  134 	set	1, l
   25A4 18 22         [12]  135 	jr	00119$
   25A6                     136 00118$:
                            137 ;src/starfield/starfield.c:52: nByte &= 170;
   25A6 2E 00         [ 7]  138 	ld	l,#0x00
                            139 ;src/starfield/starfield.c:54: if(nColor & 1)
   25A8 78            [ 4]  140 	ld	a,b
   25A9 B7            [ 4]  141 	or	a, a
   25AA 28 02         [12]  142 	jr	Z,00110$
                            143 ;src/starfield/starfield.c:55: nByte |= 64;
   25AC 2E 40         [ 7]  144 	ld	l,#0x40
   25AE                     145 00110$:
                            146 ;src/starfield/starfield.c:57: if(nColor & 2)
   25AE 7A            [ 4]  147 	ld	a,d
   25AF B7            [ 4]  148 	or	a, a
   25B0 28 02         [12]  149 	jr	Z,00112$
                            150 ;src/starfield/starfield.c:58: nByte |= 4;
   25B2 CB D5         [ 8]  151 	set	2, l
   25B4                     152 00112$:
                            153 ;src/starfield/starfield.c:60: if(nColor & 4)
   25B4 FD 21 00 00   [14]  154 	ld	iy,#0
   25B8 FD 39         [15]  155 	add	iy,sp
   25BA FD 7E 00      [19]  156 	ld	a,0 (iy)
   25BD B7            [ 4]  157 	or	a, a
   25BE 28 02         [12]  158 	jr	Z,00114$
                            159 ;src/starfield/starfield.c:61: nByte |= 16;
   25C0 CB E5         [ 8]  160 	set	4, l
   25C2                     161 00114$:
                            162 ;src/starfield/starfield.c:63: if(nColor & 8)
   25C2 7B            [ 4]  163 	ld	a,e
   25C3 B7            [ 4]  164 	or	a, a
   25C4 28 02         [12]  165 	jr	Z,00119$
                            166 ;src/starfield/starfield.c:64: nByte |= 1;
   25C6 CB C5         [ 8]  167 	set	0, l
   25C8                     168 00119$:
                            169 ;src/starfield/starfield.c:67: return nByte;
   25C8 33            [ 6]  170 	inc	sp
   25C9 C9            [10]  171 	ret
                            172 ;src/starfield/starfield.c:74: void inicializarEstrellas(){
                            173 ;	---------------------------------
                            174 ; Function inicializarEstrellas
                            175 ; ---------------------------------
   25CA                     176 _inicializarEstrellas::
   25CA DD E5         [15]  177 	push	ix
   25CC DD 21 00 00   [14]  178 	ld	ix,#0
   25D0 DD 39         [15]  179 	add	ix,sp
   25D2 F5            [11]  180 	push	af
   25D3 F5            [11]  181 	push	af
   25D4 3B            [ 6]  182 	dec	sp
                            183 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   25D5 DD 36 FB 00   [19]  184 	ld	-5 (ix),#0x00
   25D9                     185 00102$:
                            186 ;src/starfield/starfield.c:80: aStars[nStar].nX = rand() % 160;
   25D9 DD 6E FB      [19]  187 	ld	l,-5 (ix)
   25DC 26 00         [ 7]  188 	ld	h,#0x00
   25DE 29            [11]  189 	add	hl, hl
   25DF 29            [11]  190 	add	hl, hl
   25E0 29            [11]  191 	add	hl, hl
   25E1 3E 9D         [ 7]  192 	ld	a,#<(_aStars)
   25E3 85            [ 4]  193 	add	a, l
   25E4 5F            [ 4]  194 	ld	e,a
   25E5 3E 31         [ 7]  195 	ld	a,#>(_aStars)
   25E7 8C            [ 4]  196 	adc	a, h
   25E8 57            [ 4]  197 	ld	d,a
   25E9 D5            [11]  198 	push	de
   25EA CD 4E 2D      [17]  199 	call	_rand
   25ED 01 A0 00      [10]  200 	ld	bc,#0x00A0
   25F0 C5            [11]  201 	push	bc
   25F1 E5            [11]  202 	push	hl
   25F2 CD E3 2F      [17]  203 	call	__modsint
   25F5 F1            [10]  204 	pop	af
   25F6 F1            [10]  205 	pop	af
   25F7 D1            [10]  206 	pop	de
   25F8 7D            [ 4]  207 	ld	a,l
   25F9 12            [ 7]  208 	ld	(de),a
                            209 ;src/starfield/starfield.c:81: aStars[nStar].nY = rand() % 199;
   25FA 21 01 00      [10]  210 	ld	hl,#0x0001
   25FD 19            [11]  211 	add	hl,de
   25FE DD 75 FE      [19]  212 	ld	-2 (ix),l
   2601 DD 74 FF      [19]  213 	ld	-1 (ix),h
   2604 D5            [11]  214 	push	de
   2605 CD 4E 2D      [17]  215 	call	_rand
   2608 01 C7 00      [10]  216 	ld	bc,#0x00C7
   260B C5            [11]  217 	push	bc
   260C E5            [11]  218 	push	hl
   260D CD E3 2F      [17]  219 	call	__modsint
   2610 F1            [10]  220 	pop	af
   2611 F1            [10]  221 	pop	af
   2612 D1            [10]  222 	pop	de
   2613 7D            [ 4]  223 	ld	a,l
   2614 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   2617 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   261A 77            [ 7]  226 	ld	(hl),a
                            227 ;src/starfield/starfield.c:82: aStars[nStar].nStarType = rand() % 3;
   261B 21 02 00      [10]  228 	ld	hl,#0x0002
   261E 19            [11]  229 	add	hl,de
   261F DD 75 FC      [19]  230 	ld	-4 (ix),l
   2622 DD 74 FD      [19]  231 	ld	-3 (ix),h
   2625 D5            [11]  232 	push	de
   2626 CD 4E 2D      [17]  233 	call	_rand
   2629 01 03 00      [10]  234 	ld	bc,#0x0003
   262C C5            [11]  235 	push	bc
   262D E5            [11]  236 	push	hl
   262E CD E3 2F      [17]  237 	call	__modsint
   2631 F1            [10]  238 	pop	af
   2632 F1            [10]  239 	pop	af
   2633 D1            [10]  240 	pop	de
   2634 7D            [ 4]  241 	ld	a,l
   2635 DD 6E FC      [19]  242 	ld	l,-4 (ix)
   2638 DD 66 FD      [19]  243 	ld	h,-3 (ix)
   263B 77            [ 7]  244 	ld	(hl),a
                            245 ;src/starfield/starfield.c:83: aStars[nStar].columnOffset = aStars[nStar].nY/2;
   263C 13            [ 6]  246 	inc	de
   263D 13            [ 6]  247 	inc	de
   263E 13            [ 6]  248 	inc	de
   263F 13            [ 6]  249 	inc	de
   2640 13            [ 6]  250 	inc	de
   2641 DD 6E FE      [19]  251 	ld	l,-2 (ix)
   2644 DD 66 FF      [19]  252 	ld	h,-1 (ix)
   2647 7E            [ 7]  253 	ld	a,(hl)
   2648 CB 3F         [ 8]  254 	srl	a
   264A 12            [ 7]  255 	ld	(de),a
                            256 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   264B DD 34 FB      [23]  257 	inc	-5 (ix)
   264E DD 7E FB      [19]  258 	ld	a,-5 (ix)
   2651 D6 0F         [ 7]  259 	sub	a, #0x0F
   2653 38 84         [12]  260 	jr	C,00102$
   2655 DD F9         [10]  261 	ld	sp, ix
   2657 DD E1         [14]  262 	pop	ix
   2659 C9            [10]  263 	ret
                            264 ;src/starfield/starfield.c:90: void pintarEstrellas(u8* screen){
                            265 ;	---------------------------------
                            266 ; Function pintarEstrellas
                            267 ; ---------------------------------
   265A                     268 _pintarEstrellas::
   265A DD E5         [15]  269 	push	ix
   265C DD 21 00 00   [14]  270 	ld	ix,#0
   2660 DD 39         [15]  271 	add	ix,sp
   2662 F5            [11]  272 	push	af
   2663 F5            [11]  273 	push	af
                            274 ;src/starfield/starfield.c:94: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2664 DD 36 FC 00   [19]  275 	ld	-4 (ix),#0x00
   2668                     276 00102$:
                            277 ;src/starfield/starfield.c:96: pStar = &aStars[nStar];
   2668 DD 6E FC      [19]  278 	ld	l,-4 (ix)
   266B 26 00         [ 7]  279 	ld	h,#0x00
   266D 29            [11]  280 	add	hl, hl
   266E 29            [11]  281 	add	hl, hl
   266F 29            [11]  282 	add	hl, hl
   2670 11 9D 31      [10]  283 	ld	de,#_aStars
   2673 19            [11]  284 	add	hl,de
   2674 4D            [ 4]  285 	ld	c, l
   2675 44            [ 4]  286 	ld	b, h
                            287 ;src/starfield/starfield.c:98: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   2676 21 06 00      [10]  288 	ld	hl,#0x0006
   2679 09            [11]  289 	add	hl,bc
   267A DD 75 FD      [19]  290 	ld	-3 (ix),l
   267D DD 74 FE      [19]  291 	ld	-2 (ix),h
   2680 69            [ 4]  292 	ld	l, c
   2681 60            [ 4]  293 	ld	h, b
   2682 23            [ 6]  294 	inc	hl
   2683 5E            [ 7]  295 	ld	e,(hl)
   2684 0A            [ 7]  296 	ld	a,(bc)
   2685 67            [ 4]  297 	ld	h,a
   2686 DD 6E 04      [19]  298 	ld	l,4 (ix)
   2689 DD 56 05      [19]  299 	ld	d,5 (ix)
   268C C5            [11]  300 	push	bc
   268D 7B            [ 4]  301 	ld	a,e
   268E F5            [11]  302 	push	af
   268F 33            [ 6]  303 	inc	sp
   2690 E5            [11]  304 	push	hl
   2691 33            [ 6]  305 	inc	sp
   2692 62            [ 4]  306 	ld	h, d
   2693 E5            [11]  307 	push	hl
   2694 CD EF 2F      [17]  308 	call	_cpct_getScreenPtr
   2697 F1            [10]  309 	pop	af
   2698 F1            [10]  310 	pop	af
   2699 EB            [ 4]  311 	ex	de,hl
   269A C1            [10]  312 	pop	bc
   269B DD 6E FD      [19]  313 	ld	l,-3 (ix)
   269E DD 66 FE      [19]  314 	ld	h,-2 (ix)
   26A1 73            [ 7]  315 	ld	(hl),e
   26A2 23            [ 6]  316 	inc	hl
   26A3 72            [ 7]  317 	ld	(hl),d
                            318 ;src/starfield/starfield.c:99: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
   26A4 1A            [ 7]  319 	ld	a,(de)
   26A5 DD 77 FD      [19]  320 	ld	-3 (ix),a
   26A8 0A            [ 7]  321 	ld	a,(bc)
   26A9 E6 01         [ 7]  322 	and	a, #0x01
   26AB DD 77 FF      [19]  323 	ld	-1 (ix),a
   26AE 69            [ 4]  324 	ld	l, c
   26AF 60            [ 4]  325 	ld	h, b
   26B0 23            [ 6]  326 	inc	hl
   26B1 23            [ 6]  327 	inc	hl
   26B2 46            [ 7]  328 	ld	b,(hl)
   26B3 04            [ 4]  329 	inc	b
   26B4 D5            [11]  330 	push	de
   26B5 DD 7E FF      [19]  331 	ld	a,-1 (ix)
   26B8 F5            [11]  332 	push	af
   26B9 33            [ 6]  333 	inc	sp
   26BA C5            [11]  334 	push	bc
   26BB 33            [ 6]  335 	inc	sp
   26BC CD 5A 25      [17]  336 	call	_GetMode0PixelColorByte
   26BF F1            [10]  337 	pop	af
   26C0 7D            [ 4]  338 	ld	a,l
   26C1 D1            [10]  339 	pop	de
   26C2 DD AE FD      [19]  340 	xor	a, -3 (ix)
   26C5 12            [ 7]  341 	ld	(de),a
                            342 ;src/starfield/starfield.c:94: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26C6 DD 34 FC      [23]  343 	inc	-4 (ix)
   26C9 DD 7E FC      [19]  344 	ld	a,-4 (ix)
   26CC D6 0F         [ 7]  345 	sub	a, #0x0F
   26CE 38 98         [12]  346 	jr	C,00102$
   26D0 DD F9         [10]  347 	ld	sp, ix
   26D2 DD E1         [14]  348 	pop	ix
   26D4 C9            [10]  349 	ret
                            350 ;src/starfield/starfield.c:106: void moverEstrellas(){
                            351 ;	---------------------------------
                            352 ; Function moverEstrellas
                            353 ; ---------------------------------
   26D5                     354 _moverEstrellas::
   26D5 DD E5         [15]  355 	push	ix
   26D7 DD 21 00 00   [14]  356 	ld	ix,#0
   26DB DD 39         [15]  357 	add	ix,sp
   26DD 21 F9 FF      [10]  358 	ld	hl,#-7
   26E0 39            [11]  359 	add	hl,sp
   26E1 F9            [ 6]  360 	ld	sp,hl
                            361 ;src/starfield/starfield.c:111: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26E2 DD 36 F9 00   [19]  362 	ld	-7 (ix),#0x00
   26E6                     363 00108$:
                            364 ;src/starfield/starfield.c:113: pStar = &aStars[nStar];
   26E6 DD 6E F9      [19]  365 	ld	l,-7 (ix)
   26E9 26 00         [ 7]  366 	ld	h,#0x00
   26EB 29            [11]  367 	add	hl, hl
   26EC 29            [11]  368 	add	hl, hl
   26ED 29            [11]  369 	add	hl, hl
   26EE 11 9D 31      [10]  370 	ld	de,#_aStars
   26F1 19            [11]  371 	add	hl,de
   26F2 4D            [ 4]  372 	ld	c, l
   26F3 44            [ 4]  373 	ld	b, h
                            374 ;src/starfield/starfield.c:115: switch(pStar->nStarType)
   26F4 21 02 00      [10]  375 	ld	hl,#0x0002
   26F7 09            [11]  376 	add	hl,bc
   26F8 DD 75 FE      [19]  377 	ld	-2 (ix),l
   26FB DD 74 FF      [19]  378 	ld	-1 (ix),h
   26FE DD 6E FE      [19]  379 	ld	l,-2 (ix)
   2701 DD 66 FF      [19]  380 	ld	h,-1 (ix)
   2704 7E            [ 7]  381 	ld	a,(hl)
   2705 DD 77 FD      [19]  382 	ld	-3 (ix),a
                            383 ;src/starfield/starfield.c:118: pStar->nY += 1;
   2708 59            [ 4]  384 	ld	e, c
   2709 50            [ 4]  385 	ld	d, b
   270A 13            [ 6]  386 	inc	de
                            387 ;src/starfield/starfield.c:115: switch(pStar->nStarType)
   270B 3E 02         [ 7]  388 	ld	a,#0x02
   270D DD 96 FD      [19]  389 	sub	a, -3 (ix)
   2710 38 2C         [12]  390 	jr	C,00104$
                            391 ;src/starfield/starfield.c:118: pStar->nY += 1;
   2712 1A            [ 7]  392 	ld	a,(de)
   2713 DD 77 FC      [19]  393 	ld	-4 (ix),a
                            394 ;src/starfield/starfield.c:115: switch(pStar->nStarType)
   2716 D5            [11]  395 	push	de
   2717 DD 5E FD      [19]  396 	ld	e,-3 (ix)
   271A 16 00         [ 7]  397 	ld	d,#0x00
   271C 21 23 27      [10]  398 	ld	hl,#00125$
   271F 19            [11]  399 	add	hl,de
   2720 19            [11]  400 	add	hl,de
                            401 ;src/starfield/starfield.c:117: case 0: //slow star
   2721 D1            [10]  402 	pop	de
   2722 E9            [ 4]  403 	jp	(hl)
   2723                     404 00125$:
   2723 18 04         [12]  405 	jr	00101$
   2725 18 09         [12]  406 	jr	00102$
   2727 18 0F         [12]  407 	jr	00103$
   2729                     408 00101$:
                            409 ;src/starfield/starfield.c:118: pStar->nY += 1;
   2729 DD 7E FC      [19]  410 	ld	a,-4 (ix)
   272C 3C            [ 4]  411 	inc	a
   272D 12            [ 7]  412 	ld	(de),a
                            413 ;src/starfield/starfield.c:119: break;
   272E 18 0E         [12]  414 	jr	00104$
                            415 ;src/starfield/starfield.c:120: case 1: //medium star
   2730                     416 00102$:
                            417 ;src/starfield/starfield.c:121: pStar->nY += 3;
   2730 DD 7E FC      [19]  418 	ld	a,-4 (ix)
   2733 C6 03         [ 7]  419 	add	a, #0x03
   2735 12            [ 7]  420 	ld	(de),a
                            421 ;src/starfield/starfield.c:122: break;
   2736 18 06         [12]  422 	jr	00104$
                            423 ;src/starfield/starfield.c:123: case 2: //fast star
   2738                     424 00103$:
                            425 ;src/starfield/starfield.c:124: pStar->nY += 6;
   2738 DD 7E FC      [19]  426 	ld	a,-4 (ix)
   273B C6 06         [ 7]  427 	add	a, #0x06
   273D 12            [ 7]  428 	ld	(de),a
                            429 ;src/starfield/starfield.c:126: }
   273E                     430 00104$:
                            431 ;src/starfield/starfield.c:128: if(pStar->nY >= 190)
   273E 1A            [ 7]  432 	ld	a,(de)
   273F D6 BE         [ 7]  433 	sub	a, #0xBE
   2741 38 34         [12]  434 	jr	C,00109$
                            435 ;src/starfield/starfield.c:130: pStar->nY = 0;
   2743 AF            [ 4]  436 	xor	a, a
   2744 12            [ 7]  437 	ld	(de),a
                            438 ;src/starfield/starfield.c:131: pStar->nX = rand() % 160;
   2745 C5            [11]  439 	push	bc
   2746 CD 4E 2D      [17]  440 	call	_rand
   2749 DD 74 FB      [19]  441 	ld	-5 (ix),h
   274C DD 75 FA      [19]  442 	ld	-6 (ix),l
   274F 21 A0 00      [10]  443 	ld	hl,#0x00A0
   2752 E5            [11]  444 	push	hl
   2753 DD 6E FA      [19]  445 	ld	l,-6 (ix)
   2756 DD 66 FB      [19]  446 	ld	h,-5 (ix)
   2759 E5            [11]  447 	push	hl
   275A CD E3 2F      [17]  448 	call	__modsint
   275D F1            [10]  449 	pop	af
   275E F1            [10]  450 	pop	af
   275F C1            [10]  451 	pop	bc
   2760 7D            [ 4]  452 	ld	a,l
   2761 02            [ 7]  453 	ld	(bc),a
                            454 ;src/starfield/starfield.c:132: pStar->nStarType = rand() % 3;
   2762 CD 4E 2D      [17]  455 	call	_rand
   2765 01 03 00      [10]  456 	ld	bc,#0x0003
   2768 C5            [11]  457 	push	bc
   2769 E5            [11]  458 	push	hl
   276A CD E3 2F      [17]  459 	call	__modsint
   276D F1            [10]  460 	pop	af
   276E F1            [10]  461 	pop	af
   276F 7D            [ 4]  462 	ld	a,l
   2770 DD 6E FE      [19]  463 	ld	l,-2 (ix)
   2773 DD 66 FF      [19]  464 	ld	h,-1 (ix)
   2776 77            [ 7]  465 	ld	(hl),a
   2777                     466 00109$:
                            467 ;src/starfield/starfield.c:111: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2777 DD 34 F9      [23]  468 	inc	-7 (ix)
   277A DD 7E F9      [19]  469 	ld	a,-7 (ix)
   277D D6 0F         [ 7]  470 	sub	a, #0x0F
   277F DA E6 26      [10]  471 	jp	C,00108$
   2782 DD F9         [10]  472 	ld	sp, ix
   2784 DD E1         [14]  473 	pop	ix
   2786 C9            [10]  474 	ret
                            475 	.area _CODE
                            476 	.area _INITIALIZER
                            477 	.area _CABS (ABS)
