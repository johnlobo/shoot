                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Jun 14 16:46:15 2015
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
                             18 	.globl _borrarEstrellas
                             19 	.globl _pintarEstrellas
                             20 	.globl _moverEstrellas
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   2D29                      28 _aStars::
   2D29                      29 	.ds 80
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/starfield/starfield.c:13: u8 pixelEstrella(u8 nPixel){
                             55 ;	---------------------------------
                             56 ; Function pixelEstrella
                             57 ; ---------------------------------
   25BB                      58 _pixelEstrella::
                             59 ;src/starfield/starfield.c:16: if(nPixel == 0)
   25BB 21 02 00      [10]   60 	ld	hl, #2+0
   25BE 39            [11]   61 	add	hl, sp
   25BF 7E            [ 7]   62 	ld	a, (hl)
   25C0 B7            [ 4]   63 	or	a, a
   25C1 20 03         [12]   64 	jr	NZ,00102$
                             65 ;src/starfield/starfield.c:18: nByte = 32;
   25C3 2E 20         [ 7]   66 	ld	l,#0x20
   25C5 C9            [10]   67 	ret
   25C6                      68 00102$:
                             69 ;src/starfield/starfield.c:21: nByte = 16;
   25C6 2E 10         [ 7]   70 	ld	l,#0x10
                             71 ;src/starfield/starfield.c:24: return nByte;
   25C8 C9            [10]   72 	ret
                             73 ;src/starfield/starfield.c:30: u8 GetMode0PixelColorByte(u8 nColor, u8 nPixel)
                             74 ;	---------------------------------
                             75 ; Function GetMode0PixelColorByte
                             76 ; ---------------------------------
   25C9                      77 _GetMode0PixelColorByte::
   25C9 3B            [ 6]   78 	dec	sp
                             79 ;src/starfield/starfield.c:38: if(nColor & 1)
   25CA FD 21 03 00   [14]   80 	ld	iy,#3
   25CE FD 39         [15]   81 	add	iy,sp
   25D0 FD 7E 00      [19]   82 	ld	a,0 (iy)
   25D3 E6 01         [ 7]   83 	and	a, #0x01
   25D5 47            [ 4]   84 	ld	b,a
                             85 ;src/starfield/starfield.c:41: if(nColor & 2)
   25D6 FD 7E 00      [19]   86 	ld	a,0 (iy)
   25D9 E6 02         [ 7]   87 	and	a, #0x02
   25DB 57            [ 4]   88 	ld	d,a
                             89 ;src/starfield/starfield.c:44: if(nColor & 4)
   25DC FD 7E 00      [19]   90 	ld	a,0 (iy)
   25DF E6 04         [ 7]   91 	and	a, #0x04
   25E1 33            [ 6]   92 	inc	sp
   25E2 F5            [11]   93 	push	af
   25E3 33            [ 6]   94 	inc	sp
                             95 ;src/starfield/starfield.c:47: if(nColor & 8)
   25E4 FD 7E 00      [19]   96 	ld	a,0 (iy)
   25E7 E6 08         [ 7]   97 	and	a, #0x08
   25E9 5F            [ 4]   98 	ld	e,a
                             99 ;src/starfield/starfield.c:34: if(nPixel == 0)
   25EA 21 04 00      [10]  100 	ld	hl, #4+0
   25ED 39            [11]  101 	add	hl, sp
   25EE 7E            [ 7]  102 	ld	a, (hl)
                            103 ;src/starfield/starfield.c:36: nByte &= 85;
   25EF B7            [ 4]  104 	or	a,a
   25F0 20 23         [12]  105 	jr	NZ,00118$
   25F2 6F            [ 4]  106 	ld	l,a
                            107 ;src/starfield/starfield.c:38: if(nColor & 1)
   25F3 78            [ 4]  108 	ld	a,b
   25F4 B7            [ 4]  109 	or	a, a
   25F5 28 02         [12]  110 	jr	Z,00102$
                            111 ;src/starfield/starfield.c:39: nByte |= 128;
   25F7 2E 80         [ 7]  112 	ld	l,#0x80
   25F9                     113 00102$:
                            114 ;src/starfield/starfield.c:41: if(nColor & 2)
   25F9 7A            [ 4]  115 	ld	a,d
   25FA B7            [ 4]  116 	or	a, a
   25FB 28 02         [12]  117 	jr	Z,00104$
                            118 ;src/starfield/starfield.c:42: nByte |= 8;
   25FD CB DD         [ 8]  119 	set	3, l
   25FF                     120 00104$:
                            121 ;src/starfield/starfield.c:44: if(nColor & 4)
   25FF FD 21 00 00   [14]  122 	ld	iy,#0
   2603 FD 39         [15]  123 	add	iy,sp
   2605 FD 7E 00      [19]  124 	ld	a,0 (iy)
   2608 B7            [ 4]  125 	or	a, a
   2609 28 02         [12]  126 	jr	Z,00106$
                            127 ;src/starfield/starfield.c:45: nByte |= 32;
   260B CB ED         [ 8]  128 	set	5, l
   260D                     129 00106$:
                            130 ;src/starfield/starfield.c:47: if(nColor & 8)
   260D 7B            [ 4]  131 	ld	a,e
   260E B7            [ 4]  132 	or	a, a
   260F 28 26         [12]  133 	jr	Z,00119$
                            134 ;src/starfield/starfield.c:48: nByte |= 2;
   2611 CB CD         [ 8]  135 	set	1, l
   2613 18 22         [12]  136 	jr	00119$
   2615                     137 00118$:
                            138 ;src/starfield/starfield.c:52: nByte &= 170;
   2615 2E 00         [ 7]  139 	ld	l,#0x00
                            140 ;src/starfield/starfield.c:54: if(nColor & 1)
   2617 78            [ 4]  141 	ld	a,b
   2618 B7            [ 4]  142 	or	a, a
   2619 28 02         [12]  143 	jr	Z,00110$
                            144 ;src/starfield/starfield.c:55: nByte |= 64;
   261B 2E 40         [ 7]  145 	ld	l,#0x40
   261D                     146 00110$:
                            147 ;src/starfield/starfield.c:57: if(nColor & 2)
   261D 7A            [ 4]  148 	ld	a,d
   261E B7            [ 4]  149 	or	a, a
   261F 28 02         [12]  150 	jr	Z,00112$
                            151 ;src/starfield/starfield.c:58: nByte |= 4;
   2621 CB D5         [ 8]  152 	set	2, l
   2623                     153 00112$:
                            154 ;src/starfield/starfield.c:60: if(nColor & 4)
   2623 FD 21 00 00   [14]  155 	ld	iy,#0
   2627 FD 39         [15]  156 	add	iy,sp
   2629 FD 7E 00      [19]  157 	ld	a,0 (iy)
   262C B7            [ 4]  158 	or	a, a
   262D 28 02         [12]  159 	jr	Z,00114$
                            160 ;src/starfield/starfield.c:61: nByte |= 16;
   262F CB E5         [ 8]  161 	set	4, l
   2631                     162 00114$:
                            163 ;src/starfield/starfield.c:63: if(nColor & 8)
   2631 7B            [ 4]  164 	ld	a,e
   2632 B7            [ 4]  165 	or	a, a
   2633 28 02         [12]  166 	jr	Z,00119$
                            167 ;src/starfield/starfield.c:64: nByte |= 1;
   2635 CB C5         [ 8]  168 	set	0, l
   2637                     169 00119$:
                            170 ;src/starfield/starfield.c:67: return nByte;
   2637 33            [ 6]  171 	inc	sp
   2638 C9            [10]  172 	ret
                            173 ;src/starfield/starfield.c:74: void inicializarEstrellas(){
                            174 ;	---------------------------------
                            175 ; Function inicializarEstrellas
                            176 ; ---------------------------------
   2639                     177 _inicializarEstrellas::
   2639 DD E5         [15]  178 	push	ix
   263B DD 21 00 00   [14]  179 	ld	ix,#0
   263F DD 39         [15]  180 	add	ix,sp
   2641 F5            [11]  181 	push	af
   2642 F5            [11]  182 	push	af
   2643 3B            [ 6]  183 	dec	sp
                            184 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2644 DD 36 FB 00   [19]  185 	ld	-5 (ix),#0x00
   2648                     186 00102$:
                            187 ;src/starfield/starfield.c:81: aStars[nStar].nX = rand() % 160;
   2648 DD 6E FB      [19]  188 	ld	l,-5 (ix)
   264B 26 00         [ 7]  189 	ld	h,#0x00
   264D 29            [11]  190 	add	hl, hl
   264E 29            [11]  191 	add	hl, hl
   264F 29            [11]  192 	add	hl, hl
   2650 3E 29         [ 7]  193 	ld	a,#<(_aStars)
   2652 85            [ 4]  194 	add	a, l
   2653 5F            [ 4]  195 	ld	e,a
   2654 3E 2D         [ 7]  196 	ld	a,#>(_aStars)
   2656 8C            [ 4]  197 	adc	a, h
   2657 57            [ 4]  198 	ld	d,a
   2658 D5            [11]  199 	push	de
   2659 CD 02 29      [17]  200 	call	_rand
   265C 01 A0 00      [10]  201 	ld	bc,#0x00A0
   265F C5            [11]  202 	push	bc
   2660 E5            [11]  203 	push	hl
   2661 CD 97 2B      [17]  204 	call	__modsint
   2664 F1            [10]  205 	pop	af
   2665 F1            [10]  206 	pop	af
   2666 D1            [10]  207 	pop	de
   2667 7D            [ 4]  208 	ld	a,l
   2668 12            [ 7]  209 	ld	(de),a
                            210 ;src/starfield/starfield.c:83: aStars[nStar].nY = (rand() % 184)+16;
   2669 21 01 00      [10]  211 	ld	hl,#0x0001
   266C 19            [11]  212 	add	hl,de
   266D DD 75 FE      [19]  213 	ld	-2 (ix),l
   2670 DD 74 FF      [19]  214 	ld	-1 (ix),h
   2673 D5            [11]  215 	push	de
   2674 CD 02 29      [17]  216 	call	_rand
   2677 01 B8 00      [10]  217 	ld	bc,#0x00B8
   267A C5            [11]  218 	push	bc
   267B E5            [11]  219 	push	hl
   267C CD 97 2B      [17]  220 	call	__modsint
   267F F1            [10]  221 	pop	af
   2680 F1            [10]  222 	pop	af
   2681 D1            [10]  223 	pop	de
   2682 7D            [ 4]  224 	ld	a,l
   2683 C6 10         [ 7]  225 	add	a, #0x10
   2685 DD 6E FE      [19]  226 	ld	l,-2 (ix)
   2688 DD 66 FF      [19]  227 	ld	h,-1 (ix)
   268B 77            [ 7]  228 	ld	(hl),a
                            229 ;src/starfield/starfield.c:85: aStars[nStar].nStarType = rand() % 3;
   268C 21 02 00      [10]  230 	ld	hl,#0x0002
   268F 19            [11]  231 	add	hl,de
   2690 DD 75 FC      [19]  232 	ld	-4 (ix),l
   2693 DD 74 FD      [19]  233 	ld	-3 (ix),h
   2696 D5            [11]  234 	push	de
   2697 CD 02 29      [17]  235 	call	_rand
   269A 01 03 00      [10]  236 	ld	bc,#0x0003
   269D C5            [11]  237 	push	bc
   269E E5            [11]  238 	push	hl
   269F CD 97 2B      [17]  239 	call	__modsint
   26A2 F1            [10]  240 	pop	af
   26A3 F1            [10]  241 	pop	af
   26A4 D1            [10]  242 	pop	de
   26A5 7D            [ 4]  243 	ld	a,l
   26A6 DD 6E FC      [19]  244 	ld	l,-4 (ix)
   26A9 DD 66 FD      [19]  245 	ld	h,-3 (ix)
   26AC 77            [ 7]  246 	ld	(hl),a
                            247 ;src/starfield/starfield.c:88: aStars[nStar].columnOffset = aStars[nStar].nY/2;
   26AD 13            [ 6]  248 	inc	de
   26AE 13            [ 6]  249 	inc	de
   26AF 13            [ 6]  250 	inc	de
   26B0 13            [ 6]  251 	inc	de
   26B1 13            [ 6]  252 	inc	de
   26B2 DD 6E FE      [19]  253 	ld	l,-2 (ix)
   26B5 DD 66 FF      [19]  254 	ld	h,-1 (ix)
   26B8 7E            [ 7]  255 	ld	a,(hl)
   26B9 CB 3F         [ 8]  256 	srl	a
   26BB 12            [ 7]  257 	ld	(de),a
                            258 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26BC DD 34 FB      [23]  259 	inc	-5 (ix)
   26BF DD 7E FB      [19]  260 	ld	a,-5 (ix)
   26C2 D6 0A         [ 7]  261 	sub	a, #0x0A
   26C4 38 82         [12]  262 	jr	C,00102$
   26C6 DD F9         [10]  263 	ld	sp, ix
   26C8 DD E1         [14]  264 	pop	ix
   26CA C9            [10]  265 	ret
                            266 ;src/starfield/starfield.c:96: void borrarEstrellas(){
                            267 ;	---------------------------------
                            268 ; Function borrarEstrellas
                            269 ; ---------------------------------
   26CB                     270 _borrarEstrellas::
   26CB DD E5         [15]  271 	push	ix
   26CD DD 21 00 00   [14]  272 	ld	ix,#0
   26D1 DD 39         [15]  273 	add	ix,sp
   26D3 F5            [11]  274 	push	af
   26D4 3B            [ 6]  275 	dec	sp
                            276 ;src/starfield/starfield.c:100: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26D5 1E 00         [ 7]  277 	ld	e,#0x00
   26D7                     278 00102$:
                            279 ;src/starfield/starfield.c:102: pStar = &aStars[nStar];
   26D7 6B            [ 4]  280 	ld	l,e
   26D8 26 00         [ 7]  281 	ld	h,#0x00
   26DA 29            [11]  282 	add	hl, hl
   26DB 29            [11]  283 	add	hl, hl
   26DC 29            [11]  284 	add	hl, hl
   26DD 01 29 2D      [10]  285 	ld	bc,#_aStars
   26E0 09            [11]  286 	add	hl,bc
   26E1 4D            [ 4]  287 	ld	c, l
   26E2 44            [ 4]  288 	ld	b, h
                            289 ;src/starfield/starfield.c:106: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
   26E3 C5            [11]  290 	push	bc
   26E4 FD E1         [14]  291 	pop	iy
   26E6 FD 7E 06      [19]  292 	ld	a,6 (iy)
   26E9 DD 77 FE      [19]  293 	ld	-2 (ix),a
   26EC FD 7E 07      [19]  294 	ld	a,7 (iy)
   26EF DD 77 FF      [19]  295 	ld	-1 (ix),a
   26F2 DD 6E FE      [19]  296 	ld	l,-2 (ix)
   26F5 DD 66 FF      [19]  297 	ld	h,-1 (ix)
   26F8 7E            [ 7]  298 	ld	a,(hl)
   26F9 DD 77 FD      [19]  299 	ld	-3 (ix),a
   26FC 0A            [ 7]  300 	ld	a,(bc)
   26FD E6 01         [ 7]  301 	and	a, #0x01
   26FF 57            [ 4]  302 	ld	d,a
   2700 69            [ 4]  303 	ld	l, c
   2701 60            [ 4]  304 	ld	h, b
   2702 23            [ 6]  305 	inc	hl
   2703 23            [ 6]  306 	inc	hl
   2704 46            [ 7]  307 	ld	b,(hl)
   2705 04            [ 4]  308 	inc	b
   2706 D5            [11]  309 	push	de
   2707 D5            [11]  310 	push	de
   2708 33            [ 6]  311 	inc	sp
   2709 C5            [11]  312 	push	bc
   270A 33            [ 6]  313 	inc	sp
   270B CD C9 25      [17]  314 	call	_GetMode0PixelColorByte
   270E F1            [10]  315 	pop	af
   270F 7D            [ 4]  316 	ld	a,l
   2710 D1            [10]  317 	pop	de
   2711 DD AE FD      [19]  318 	xor	a, -3 (ix)
   2714 DD 6E FE      [19]  319 	ld	l,-2 (ix)
   2717 DD 66 FF      [19]  320 	ld	h,-1 (ix)
   271A 77            [ 7]  321 	ld	(hl),a
                            322 ;src/starfield/starfield.c:100: for(nStar = 0; nStar < STARS_NUM; nStar++)
   271B 1C            [ 4]  323 	inc	e
   271C 7B            [ 4]  324 	ld	a,e
   271D D6 0A         [ 7]  325 	sub	a, #0x0A
   271F 38 B6         [12]  326 	jr	C,00102$
   2721 DD F9         [10]  327 	ld	sp, ix
   2723 DD E1         [14]  328 	pop	ix
   2725 C9            [10]  329 	ret
                            330 ;src/starfield/starfield.c:114: void pintarEstrellas(u8* screen){
                            331 ;	---------------------------------
                            332 ; Function pintarEstrellas
                            333 ; ---------------------------------
   2726                     334 _pintarEstrellas::
   2726 DD E5         [15]  335 	push	ix
   2728 DD 21 00 00   [14]  336 	ld	ix,#0
   272C DD 39         [15]  337 	add	ix,sp
   272E F5            [11]  338 	push	af
   272F F5            [11]  339 	push	af
                            340 ;src/starfield/starfield.c:118: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2730 DD 36 FC 00   [19]  341 	ld	-4 (ix),#0x00
   2734                     342 00102$:
                            343 ;src/starfield/starfield.c:120: pStar = &aStars[nStar];
   2734 DD 6E FC      [19]  344 	ld	l,-4 (ix)
   2737 26 00         [ 7]  345 	ld	h,#0x00
   2739 29            [11]  346 	add	hl, hl
   273A 29            [11]  347 	add	hl, hl
   273B 29            [11]  348 	add	hl, hl
   273C 11 29 2D      [10]  349 	ld	de,#_aStars
   273F 19            [11]  350 	add	hl,de
   2740 4D            [ 4]  351 	ld	c, l
   2741 44            [ 4]  352 	ld	b, h
                            353 ;src/starfield/starfield.c:124: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   2742 21 06 00      [10]  354 	ld	hl,#0x0006
   2745 09            [11]  355 	add	hl,bc
   2746 DD 75 FE      [19]  356 	ld	-2 (ix),l
   2749 DD 74 FF      [19]  357 	ld	-1 (ix),h
   274C 69            [ 4]  358 	ld	l, c
   274D 60            [ 4]  359 	ld	h, b
   274E 23            [ 6]  360 	inc	hl
   274F 5E            [ 7]  361 	ld	e,(hl)
   2750 0A            [ 7]  362 	ld	a,(bc)
   2751 67            [ 4]  363 	ld	h,a
   2752 DD 6E 04      [19]  364 	ld	l,4 (ix)
   2755 DD 56 05      [19]  365 	ld	d,5 (ix)
   2758 C5            [11]  366 	push	bc
   2759 7B            [ 4]  367 	ld	a,e
   275A F5            [11]  368 	push	af
   275B 33            [ 6]  369 	inc	sp
   275C E5            [11]  370 	push	hl
   275D 33            [ 6]  371 	inc	sp
   275E 62            [ 4]  372 	ld	h, d
   275F E5            [11]  373 	push	hl
   2760 CD A3 2B      [17]  374 	call	_cpct_getScreenPtr
   2763 F1            [10]  375 	pop	af
   2764 F1            [10]  376 	pop	af
   2765 EB            [ 4]  377 	ex	de,hl
   2766 C1            [10]  378 	pop	bc
   2767 DD 6E FE      [19]  379 	ld	l,-2 (ix)
   276A DD 66 FF      [19]  380 	ld	h,-1 (ix)
   276D 73            [ 7]  381 	ld	(hl),e
   276E 23            [ 6]  382 	inc	hl
   276F 72            [ 7]  383 	ld	(hl),d
                            384 ;src/starfield/starfield.c:126: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
   2770 1A            [ 7]  385 	ld	a,(de)
   2771 DD 77 FE      [19]  386 	ld	-2 (ix),a
   2774 0A            [ 7]  387 	ld	a,(bc)
   2775 E6 01         [ 7]  388 	and	a, #0x01
   2777 DD 77 FD      [19]  389 	ld	-3 (ix),a
   277A 69            [ 4]  390 	ld	l, c
   277B 60            [ 4]  391 	ld	h, b
   277C 23            [ 6]  392 	inc	hl
   277D 23            [ 6]  393 	inc	hl
   277E 46            [ 7]  394 	ld	b,(hl)
   277F 04            [ 4]  395 	inc	b
   2780 D5            [11]  396 	push	de
   2781 DD 7E FD      [19]  397 	ld	a,-3 (ix)
   2784 F5            [11]  398 	push	af
   2785 33            [ 6]  399 	inc	sp
   2786 C5            [11]  400 	push	bc
   2787 33            [ 6]  401 	inc	sp
   2788 CD C9 25      [17]  402 	call	_GetMode0PixelColorByte
   278B F1            [10]  403 	pop	af
   278C 7D            [ 4]  404 	ld	a,l
   278D D1            [10]  405 	pop	de
   278E DD AE FE      [19]  406 	xor	a, -2 (ix)
   2791 12            [ 7]  407 	ld	(de),a
                            408 ;src/starfield/starfield.c:118: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2792 DD 34 FC      [23]  409 	inc	-4 (ix)
   2795 DD 7E FC      [19]  410 	ld	a,-4 (ix)
   2798 D6 0A         [ 7]  411 	sub	a, #0x0A
   279A 38 98         [12]  412 	jr	C,00102$
   279C DD F9         [10]  413 	ld	sp, ix
   279E DD E1         [14]  414 	pop	ix
   27A0 C9            [10]  415 	ret
                            416 ;src/starfield/starfield.c:136: void moverEstrellas(){
                            417 ;	---------------------------------
                            418 ; Function moverEstrellas
                            419 ; ---------------------------------
   27A1                     420 _moverEstrellas::
   27A1 DD E5         [15]  421 	push	ix
   27A3 DD 21 00 00   [14]  422 	ld	ix,#0
   27A7 DD 39         [15]  423 	add	ix,sp
   27A9 21 F9 FF      [10]  424 	ld	hl,#-7
   27AC 39            [11]  425 	add	hl,sp
   27AD F9            [ 6]  426 	ld	sp,hl
                            427 ;src/starfield/starfield.c:141: for(nStar = 0; nStar < STARS_NUM; nStar++)
   27AE DD 36 F9 00   [19]  428 	ld	-7 (ix),#0x00
   27B2                     429 00108$:
                            430 ;src/starfield/starfield.c:143: pStar = &aStars[nStar];
   27B2 DD 6E F9      [19]  431 	ld	l,-7 (ix)
   27B5 26 00         [ 7]  432 	ld	h,#0x00
   27B7 29            [11]  433 	add	hl, hl
   27B8 29            [11]  434 	add	hl, hl
   27B9 29            [11]  435 	add	hl, hl
   27BA 11 29 2D      [10]  436 	ld	de,#_aStars
   27BD 19            [11]  437 	add	hl,de
   27BE 4D            [ 4]  438 	ld	c, l
   27BF 44            [ 4]  439 	ld	b, h
                            440 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27C0 21 02 00      [10]  441 	ld	hl,#0x0002
   27C3 09            [11]  442 	add	hl,bc
   27C4 DD 75 FA      [19]  443 	ld	-6 (ix),l
   27C7 DD 74 FB      [19]  444 	ld	-5 (ix),h
   27CA DD 6E FA      [19]  445 	ld	l,-6 (ix)
   27CD DD 66 FB      [19]  446 	ld	h,-5 (ix)
   27D0 7E            [ 7]  447 	ld	a,(hl)
   27D1 DD 77 FF      [19]  448 	ld	-1 (ix),a
                            449 ;src/starfield/starfield.c:148: pStar->nY += 1;
   27D4 59            [ 4]  450 	ld	e, c
   27D5 50            [ 4]  451 	ld	d, b
   27D6 13            [ 6]  452 	inc	de
                            453 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27D7 3E 02         [ 7]  454 	ld	a,#0x02
   27D9 DD 96 FF      [19]  455 	sub	a, -1 (ix)
   27DC 38 2C         [12]  456 	jr	C,00104$
                            457 ;src/starfield/starfield.c:148: pStar->nY += 1;
   27DE 1A            [ 7]  458 	ld	a,(de)
   27DF DD 77 FE      [19]  459 	ld	-2 (ix),a
                            460 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27E2 D5            [11]  461 	push	de
   27E3 DD 5E FF      [19]  462 	ld	e,-1 (ix)
   27E6 16 00         [ 7]  463 	ld	d,#0x00
   27E8 21 EF 27      [10]  464 	ld	hl,#00125$
   27EB 19            [11]  465 	add	hl,de
   27EC 19            [11]  466 	add	hl,de
                            467 ;src/starfield/starfield.c:147: case 0: //slow star
   27ED D1            [10]  468 	pop	de
   27EE E9            [ 4]  469 	jp	(hl)
   27EF                     470 00125$:
   27EF 18 04         [12]  471 	jr	00101$
   27F1 18 09         [12]  472 	jr	00102$
   27F3 18 0F         [12]  473 	jr	00103$
   27F5                     474 00101$:
                            475 ;src/starfield/starfield.c:148: pStar->nY += 1;
   27F5 DD 7E FE      [19]  476 	ld	a,-2 (ix)
   27F8 3C            [ 4]  477 	inc	a
   27F9 12            [ 7]  478 	ld	(de),a
                            479 ;src/starfield/starfield.c:149: break;
   27FA 18 0E         [12]  480 	jr	00104$
                            481 ;src/starfield/starfield.c:150: case 1: //medium star
   27FC                     482 00102$:
                            483 ;src/starfield/starfield.c:151: pStar->nY += 3;
   27FC DD 7E FE      [19]  484 	ld	a,-2 (ix)
   27FF C6 03         [ 7]  485 	add	a, #0x03
   2801 12            [ 7]  486 	ld	(de),a
                            487 ;src/starfield/starfield.c:152: break;
   2802 18 06         [12]  488 	jr	00104$
                            489 ;src/starfield/starfield.c:153: case 2: //fast star
   2804                     490 00103$:
                            491 ;src/starfield/starfield.c:154: pStar->nY += 6;
   2804 DD 7E FE      [19]  492 	ld	a,-2 (ix)
   2807 C6 06         [ 7]  493 	add	a, #0x06
   2809 12            [ 7]  494 	ld	(de),a
                            495 ;src/starfield/starfield.c:156: }
   280A                     496 00104$:
                            497 ;src/starfield/starfield.c:158: if(pStar->nY >= 200)
   280A 1A            [ 7]  498 	ld	a,(de)
   280B D6 C8         [ 7]  499 	sub	a, #0xC8
   280D 38 35         [12]  500 	jr	C,00109$
                            501 ;src/starfield/starfield.c:160: pStar->nY = 16;
   280F 3E 10         [ 7]  502 	ld	a,#0x10
   2811 12            [ 7]  503 	ld	(de),a
                            504 ;src/starfield/starfield.c:161: pStar->nX = rand() % 160;
   2812 C5            [11]  505 	push	bc
   2813 CD 02 29      [17]  506 	call	_rand
   2816 DD 74 FD      [19]  507 	ld	-3 (ix),h
   2819 DD 75 FC      [19]  508 	ld	-4 (ix),l
   281C 21 A0 00      [10]  509 	ld	hl,#0x00A0
   281F E5            [11]  510 	push	hl
   2820 DD 6E FC      [19]  511 	ld	l,-4 (ix)
   2823 DD 66 FD      [19]  512 	ld	h,-3 (ix)
   2826 E5            [11]  513 	push	hl
   2827 CD 97 2B      [17]  514 	call	__modsint
   282A F1            [10]  515 	pop	af
   282B F1            [10]  516 	pop	af
   282C C1            [10]  517 	pop	bc
   282D 7D            [ 4]  518 	ld	a,l
   282E 02            [ 7]  519 	ld	(bc),a
                            520 ;src/starfield/starfield.c:162: pStar->nStarType = rand() % 3;
   282F CD 02 29      [17]  521 	call	_rand
   2832 01 03 00      [10]  522 	ld	bc,#0x0003
   2835 C5            [11]  523 	push	bc
   2836 E5            [11]  524 	push	hl
   2837 CD 97 2B      [17]  525 	call	__modsint
   283A F1            [10]  526 	pop	af
   283B F1            [10]  527 	pop	af
   283C 7D            [ 4]  528 	ld	a,l
   283D DD 6E FA      [19]  529 	ld	l,-6 (ix)
   2840 DD 66 FB      [19]  530 	ld	h,-5 (ix)
   2843 77            [ 7]  531 	ld	(hl),a
   2844                     532 00109$:
                            533 ;src/starfield/starfield.c:141: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2844 DD 34 F9      [23]  534 	inc	-7 (ix)
   2847 DD 7E F9      [19]  535 	ld	a,-7 (ix)
   284A D6 0A         [ 7]  536 	sub	a, #0x0A
   284C DA B2 27      [10]  537 	jp	C,00108$
   284F DD F9         [10]  538 	ld	sp, ix
   2851 DD E1         [14]  539 	pop	ix
   2853 C9            [10]  540 	ret
                            541 	.area _CODE
                            542 	.area _INITIALIZER
                            543 	.area _CABS (ABS)
