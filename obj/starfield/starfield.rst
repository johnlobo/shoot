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
   2D39                      28 _aStars::
   2D39                      29 	.ds 80
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
   25CB                      58 _pixelEstrella::
                             59 ;src/starfield/starfield.c:16: if(nPixel == 0)
   25CB 21 02 00      [10]   60 	ld	hl, #2+0
   25CE 39            [11]   61 	add	hl, sp
   25CF 7E            [ 7]   62 	ld	a, (hl)
   25D0 B7            [ 4]   63 	or	a, a
   25D1 20 03         [12]   64 	jr	NZ,00102$
                             65 ;src/starfield/starfield.c:18: nByte = 32;
   25D3 2E 20         [ 7]   66 	ld	l,#0x20
   25D5 C9            [10]   67 	ret
   25D6                      68 00102$:
                             69 ;src/starfield/starfield.c:21: nByte = 16;
   25D6 2E 10         [ 7]   70 	ld	l,#0x10
                             71 ;src/starfield/starfield.c:24: return nByte;
   25D8 C9            [10]   72 	ret
                             73 ;src/starfield/starfield.c:30: u8 GetMode0PixelColorByte(u8 nColor, u8 nPixel)
                             74 ;	---------------------------------
                             75 ; Function GetMode0PixelColorByte
                             76 ; ---------------------------------
   25D9                      77 _GetMode0PixelColorByte::
   25D9 3B            [ 6]   78 	dec	sp
                             79 ;src/starfield/starfield.c:38: if(nColor & 1)
   25DA FD 21 03 00   [14]   80 	ld	iy,#3
   25DE FD 39         [15]   81 	add	iy,sp
   25E0 FD 7E 00      [19]   82 	ld	a,0 (iy)
   25E3 E6 01         [ 7]   83 	and	a, #0x01
   25E5 47            [ 4]   84 	ld	b,a
                             85 ;src/starfield/starfield.c:41: if(nColor & 2)
   25E6 FD 7E 00      [19]   86 	ld	a,0 (iy)
   25E9 E6 02         [ 7]   87 	and	a, #0x02
   25EB 57            [ 4]   88 	ld	d,a
                             89 ;src/starfield/starfield.c:44: if(nColor & 4)
   25EC FD 7E 00      [19]   90 	ld	a,0 (iy)
   25EF E6 04         [ 7]   91 	and	a, #0x04
   25F1 33            [ 6]   92 	inc	sp
   25F2 F5            [11]   93 	push	af
   25F3 33            [ 6]   94 	inc	sp
                             95 ;src/starfield/starfield.c:47: if(nColor & 8)
   25F4 FD 7E 00      [19]   96 	ld	a,0 (iy)
   25F7 E6 08         [ 7]   97 	and	a, #0x08
   25F9 5F            [ 4]   98 	ld	e,a
                             99 ;src/starfield/starfield.c:34: if(nPixel == 0)
   25FA 21 04 00      [10]  100 	ld	hl, #4+0
   25FD 39            [11]  101 	add	hl, sp
   25FE 7E            [ 7]  102 	ld	a, (hl)
                            103 ;src/starfield/starfield.c:36: nByte &= 85;
   25FF B7            [ 4]  104 	or	a,a
   2600 20 23         [12]  105 	jr	NZ,00118$
   2602 6F            [ 4]  106 	ld	l,a
                            107 ;src/starfield/starfield.c:38: if(nColor & 1)
   2603 78            [ 4]  108 	ld	a,b
   2604 B7            [ 4]  109 	or	a, a
   2605 28 02         [12]  110 	jr	Z,00102$
                            111 ;src/starfield/starfield.c:39: nByte |= 128;
   2607 2E 80         [ 7]  112 	ld	l,#0x80
   2609                     113 00102$:
                            114 ;src/starfield/starfield.c:41: if(nColor & 2)
   2609 7A            [ 4]  115 	ld	a,d
   260A B7            [ 4]  116 	or	a, a
   260B 28 02         [12]  117 	jr	Z,00104$
                            118 ;src/starfield/starfield.c:42: nByte |= 8;
   260D CB DD         [ 8]  119 	set	3, l
   260F                     120 00104$:
                            121 ;src/starfield/starfield.c:44: if(nColor & 4)
   260F FD 21 00 00   [14]  122 	ld	iy,#0
   2613 FD 39         [15]  123 	add	iy,sp
   2615 FD 7E 00      [19]  124 	ld	a,0 (iy)
   2618 B7            [ 4]  125 	or	a, a
   2619 28 02         [12]  126 	jr	Z,00106$
                            127 ;src/starfield/starfield.c:45: nByte |= 32;
   261B CB ED         [ 8]  128 	set	5, l
   261D                     129 00106$:
                            130 ;src/starfield/starfield.c:47: if(nColor & 8)
   261D 7B            [ 4]  131 	ld	a,e
   261E B7            [ 4]  132 	or	a, a
   261F 28 26         [12]  133 	jr	Z,00119$
                            134 ;src/starfield/starfield.c:48: nByte |= 2;
   2621 CB CD         [ 8]  135 	set	1, l
   2623 18 22         [12]  136 	jr	00119$
   2625                     137 00118$:
                            138 ;src/starfield/starfield.c:52: nByte &= 170;
   2625 2E 00         [ 7]  139 	ld	l,#0x00
                            140 ;src/starfield/starfield.c:54: if(nColor & 1)
   2627 78            [ 4]  141 	ld	a,b
   2628 B7            [ 4]  142 	or	a, a
   2629 28 02         [12]  143 	jr	Z,00110$
                            144 ;src/starfield/starfield.c:55: nByte |= 64;
   262B 2E 40         [ 7]  145 	ld	l,#0x40
   262D                     146 00110$:
                            147 ;src/starfield/starfield.c:57: if(nColor & 2)
   262D 7A            [ 4]  148 	ld	a,d
   262E B7            [ 4]  149 	or	a, a
   262F 28 02         [12]  150 	jr	Z,00112$
                            151 ;src/starfield/starfield.c:58: nByte |= 4;
   2631 CB D5         [ 8]  152 	set	2, l
   2633                     153 00112$:
                            154 ;src/starfield/starfield.c:60: if(nColor & 4)
   2633 FD 21 00 00   [14]  155 	ld	iy,#0
   2637 FD 39         [15]  156 	add	iy,sp
   2639 FD 7E 00      [19]  157 	ld	a,0 (iy)
   263C B7            [ 4]  158 	or	a, a
   263D 28 02         [12]  159 	jr	Z,00114$
                            160 ;src/starfield/starfield.c:61: nByte |= 16;
   263F CB E5         [ 8]  161 	set	4, l
   2641                     162 00114$:
                            163 ;src/starfield/starfield.c:63: if(nColor & 8)
   2641 7B            [ 4]  164 	ld	a,e
   2642 B7            [ 4]  165 	or	a, a
   2643 28 02         [12]  166 	jr	Z,00119$
                            167 ;src/starfield/starfield.c:64: nByte |= 1;
   2645 CB C5         [ 8]  168 	set	0, l
   2647                     169 00119$:
                            170 ;src/starfield/starfield.c:67: return nByte;
   2647 33            [ 6]  171 	inc	sp
   2648 C9            [10]  172 	ret
                            173 ;src/starfield/starfield.c:74: void inicializarEstrellas(){
                            174 ;	---------------------------------
                            175 ; Function inicializarEstrellas
                            176 ; ---------------------------------
   2649                     177 _inicializarEstrellas::
   2649 DD E5         [15]  178 	push	ix
   264B DD 21 00 00   [14]  179 	ld	ix,#0
   264F DD 39         [15]  180 	add	ix,sp
   2651 F5            [11]  181 	push	af
   2652 F5            [11]  182 	push	af
   2653 3B            [ 6]  183 	dec	sp
                            184 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2654 DD 36 FB 00   [19]  185 	ld	-5 (ix),#0x00
   2658                     186 00102$:
                            187 ;src/starfield/starfield.c:81: aStars[nStar].nX = rand() % 160;
   2658 DD 6E FB      [19]  188 	ld	l,-5 (ix)
   265B 26 00         [ 7]  189 	ld	h,#0x00
   265D 29            [11]  190 	add	hl, hl
   265E 29            [11]  191 	add	hl, hl
   265F 29            [11]  192 	add	hl, hl
   2660 3E 39         [ 7]  193 	ld	a,#<(_aStars)
   2662 85            [ 4]  194 	add	a, l
   2663 5F            [ 4]  195 	ld	e,a
   2664 3E 2D         [ 7]  196 	ld	a,#>(_aStars)
   2666 8C            [ 4]  197 	adc	a, h
   2667 57            [ 4]  198 	ld	d,a
   2668 D5            [11]  199 	push	de
   2669 CD 12 29      [17]  200 	call	_rand
   266C 01 A0 00      [10]  201 	ld	bc,#0x00A0
   266F C5            [11]  202 	push	bc
   2670 E5            [11]  203 	push	hl
   2671 CD A7 2B      [17]  204 	call	__modsint
   2674 F1            [10]  205 	pop	af
   2675 F1            [10]  206 	pop	af
   2676 D1            [10]  207 	pop	de
   2677 7D            [ 4]  208 	ld	a,l
   2678 12            [ 7]  209 	ld	(de),a
                            210 ;src/starfield/starfield.c:83: aStars[nStar].nY = (rand() % 184)+16;
   2679 21 01 00      [10]  211 	ld	hl,#0x0001
   267C 19            [11]  212 	add	hl,de
   267D DD 75 FE      [19]  213 	ld	-2 (ix),l
   2680 DD 74 FF      [19]  214 	ld	-1 (ix),h
   2683 D5            [11]  215 	push	de
   2684 CD 12 29      [17]  216 	call	_rand
   2687 01 B8 00      [10]  217 	ld	bc,#0x00B8
   268A C5            [11]  218 	push	bc
   268B E5            [11]  219 	push	hl
   268C CD A7 2B      [17]  220 	call	__modsint
   268F F1            [10]  221 	pop	af
   2690 F1            [10]  222 	pop	af
   2691 D1            [10]  223 	pop	de
   2692 7D            [ 4]  224 	ld	a,l
   2693 C6 10         [ 7]  225 	add	a, #0x10
   2695 DD 6E FE      [19]  226 	ld	l,-2 (ix)
   2698 DD 66 FF      [19]  227 	ld	h,-1 (ix)
   269B 77            [ 7]  228 	ld	(hl),a
                            229 ;src/starfield/starfield.c:85: aStars[nStar].nStarType = rand() % 3;
   269C 21 02 00      [10]  230 	ld	hl,#0x0002
   269F 19            [11]  231 	add	hl,de
   26A0 DD 75 FC      [19]  232 	ld	-4 (ix),l
   26A3 DD 74 FD      [19]  233 	ld	-3 (ix),h
   26A6 D5            [11]  234 	push	de
   26A7 CD 12 29      [17]  235 	call	_rand
   26AA 01 03 00      [10]  236 	ld	bc,#0x0003
   26AD C5            [11]  237 	push	bc
   26AE E5            [11]  238 	push	hl
   26AF CD A7 2B      [17]  239 	call	__modsint
   26B2 F1            [10]  240 	pop	af
   26B3 F1            [10]  241 	pop	af
   26B4 D1            [10]  242 	pop	de
   26B5 7D            [ 4]  243 	ld	a,l
   26B6 DD 6E FC      [19]  244 	ld	l,-4 (ix)
   26B9 DD 66 FD      [19]  245 	ld	h,-3 (ix)
   26BC 77            [ 7]  246 	ld	(hl),a
                            247 ;src/starfield/starfield.c:88: aStars[nStar].columnOffset = aStars[nStar].nY/2;
   26BD 13            [ 6]  248 	inc	de
   26BE 13            [ 6]  249 	inc	de
   26BF 13            [ 6]  250 	inc	de
   26C0 13            [ 6]  251 	inc	de
   26C1 13            [ 6]  252 	inc	de
   26C2 DD 6E FE      [19]  253 	ld	l,-2 (ix)
   26C5 DD 66 FF      [19]  254 	ld	h,-1 (ix)
   26C8 7E            [ 7]  255 	ld	a,(hl)
   26C9 CB 3F         [ 8]  256 	srl	a
   26CB 12            [ 7]  257 	ld	(de),a
                            258 ;src/starfield/starfield.c:78: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26CC DD 34 FB      [23]  259 	inc	-5 (ix)
   26CF DD 7E FB      [19]  260 	ld	a,-5 (ix)
   26D2 D6 0A         [ 7]  261 	sub	a, #0x0A
   26D4 38 82         [12]  262 	jr	C,00102$
   26D6 DD F9         [10]  263 	ld	sp, ix
   26D8 DD E1         [14]  264 	pop	ix
   26DA C9            [10]  265 	ret
                            266 ;src/starfield/starfield.c:96: void borrarEstrellas(){
                            267 ;	---------------------------------
                            268 ; Function borrarEstrellas
                            269 ; ---------------------------------
   26DB                     270 _borrarEstrellas::
   26DB DD E5         [15]  271 	push	ix
   26DD DD 21 00 00   [14]  272 	ld	ix,#0
   26E1 DD 39         [15]  273 	add	ix,sp
   26E3 F5            [11]  274 	push	af
   26E4 3B            [ 6]  275 	dec	sp
                            276 ;src/starfield/starfield.c:100: for(nStar = 0; nStar < STARS_NUM; nStar++)
   26E5 1E 00         [ 7]  277 	ld	e,#0x00
   26E7                     278 00102$:
                            279 ;src/starfield/starfield.c:102: pStar = &aStars[nStar];
   26E7 6B            [ 4]  280 	ld	l,e
   26E8 26 00         [ 7]  281 	ld	h,#0x00
   26EA 29            [11]  282 	add	hl, hl
   26EB 29            [11]  283 	add	hl, hl
   26EC 29            [11]  284 	add	hl, hl
   26ED 01 39 2D      [10]  285 	ld	bc,#_aStars
   26F0 09            [11]  286 	add	hl,bc
   26F1 4D            [ 4]  287 	ld	c, l
   26F2 44            [ 4]  288 	ld	b, h
                            289 ;src/starfield/starfield.c:106: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
   26F3 C5            [11]  290 	push	bc
   26F4 FD E1         [14]  291 	pop	iy
   26F6 FD 7E 06      [19]  292 	ld	a,6 (iy)
   26F9 DD 77 FE      [19]  293 	ld	-2 (ix),a
   26FC FD 7E 07      [19]  294 	ld	a,7 (iy)
   26FF DD 77 FF      [19]  295 	ld	-1 (ix),a
   2702 DD 6E FE      [19]  296 	ld	l,-2 (ix)
   2705 DD 66 FF      [19]  297 	ld	h,-1 (ix)
   2708 7E            [ 7]  298 	ld	a,(hl)
   2709 DD 77 FD      [19]  299 	ld	-3 (ix),a
   270C 0A            [ 7]  300 	ld	a,(bc)
   270D E6 01         [ 7]  301 	and	a, #0x01
   270F 57            [ 4]  302 	ld	d,a
   2710 69            [ 4]  303 	ld	l, c
   2711 60            [ 4]  304 	ld	h, b
   2712 23            [ 6]  305 	inc	hl
   2713 23            [ 6]  306 	inc	hl
   2714 46            [ 7]  307 	ld	b,(hl)
   2715 04            [ 4]  308 	inc	b
   2716 D5            [11]  309 	push	de
   2717 D5            [11]  310 	push	de
   2718 33            [ 6]  311 	inc	sp
   2719 C5            [11]  312 	push	bc
   271A 33            [ 6]  313 	inc	sp
   271B CD D9 25      [17]  314 	call	_GetMode0PixelColorByte
   271E F1            [10]  315 	pop	af
   271F 7D            [ 4]  316 	ld	a,l
   2720 D1            [10]  317 	pop	de
   2721 DD AE FD      [19]  318 	xor	a, -3 (ix)
   2724 DD 6E FE      [19]  319 	ld	l,-2 (ix)
   2727 DD 66 FF      [19]  320 	ld	h,-1 (ix)
   272A 77            [ 7]  321 	ld	(hl),a
                            322 ;src/starfield/starfield.c:100: for(nStar = 0; nStar < STARS_NUM; nStar++)
   272B 1C            [ 4]  323 	inc	e
   272C 7B            [ 4]  324 	ld	a,e
   272D D6 0A         [ 7]  325 	sub	a, #0x0A
   272F 38 B6         [12]  326 	jr	C,00102$
   2731 DD F9         [10]  327 	ld	sp, ix
   2733 DD E1         [14]  328 	pop	ix
   2735 C9            [10]  329 	ret
                            330 ;src/starfield/starfield.c:114: void pintarEstrellas(u8* screen){
                            331 ;	---------------------------------
                            332 ; Function pintarEstrellas
                            333 ; ---------------------------------
   2736                     334 _pintarEstrellas::
   2736 DD E5         [15]  335 	push	ix
   2738 DD 21 00 00   [14]  336 	ld	ix,#0
   273C DD 39         [15]  337 	add	ix,sp
   273E F5            [11]  338 	push	af
   273F F5            [11]  339 	push	af
                            340 ;src/starfield/starfield.c:118: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2740 DD 36 FC 00   [19]  341 	ld	-4 (ix),#0x00
   2744                     342 00102$:
                            343 ;src/starfield/starfield.c:120: pStar = &aStars[nStar];
   2744 DD 6E FC      [19]  344 	ld	l,-4 (ix)
   2747 26 00         [ 7]  345 	ld	h,#0x00
   2749 29            [11]  346 	add	hl, hl
   274A 29            [11]  347 	add	hl, hl
   274B 29            [11]  348 	add	hl, hl
   274C 11 39 2D      [10]  349 	ld	de,#_aStars
   274F 19            [11]  350 	add	hl,de
   2750 4D            [ 4]  351 	ld	c, l
   2751 44            [ 4]  352 	ld	b, h
                            353 ;src/starfield/starfield.c:124: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   2752 21 06 00      [10]  354 	ld	hl,#0x0006
   2755 09            [11]  355 	add	hl,bc
   2756 DD 75 FE      [19]  356 	ld	-2 (ix),l
   2759 DD 74 FF      [19]  357 	ld	-1 (ix),h
   275C 69            [ 4]  358 	ld	l, c
   275D 60            [ 4]  359 	ld	h, b
   275E 23            [ 6]  360 	inc	hl
   275F 5E            [ 7]  361 	ld	e,(hl)
   2760 0A            [ 7]  362 	ld	a,(bc)
   2761 67            [ 4]  363 	ld	h,a
   2762 DD 6E 04      [19]  364 	ld	l,4 (ix)
   2765 DD 56 05      [19]  365 	ld	d,5 (ix)
   2768 C5            [11]  366 	push	bc
   2769 7B            [ 4]  367 	ld	a,e
   276A F5            [11]  368 	push	af
   276B 33            [ 6]  369 	inc	sp
   276C E5            [11]  370 	push	hl
   276D 33            [ 6]  371 	inc	sp
   276E 62            [ 4]  372 	ld	h, d
   276F E5            [11]  373 	push	hl
   2770 CD B3 2B      [17]  374 	call	_cpct_getScreenPtr
   2773 F1            [10]  375 	pop	af
   2774 F1            [10]  376 	pop	af
   2775 EB            [ 4]  377 	ex	de,hl
   2776 C1            [10]  378 	pop	bc
   2777 DD 6E FE      [19]  379 	ld	l,-2 (ix)
   277A DD 66 FF      [19]  380 	ld	h,-1 (ix)
   277D 73            [ 7]  381 	ld	(hl),e
   277E 23            [ 6]  382 	inc	hl
   277F 72            [ 7]  383 	ld	(hl),d
                            384 ;src/starfield/starfield.c:126: *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
   2780 1A            [ 7]  385 	ld	a,(de)
   2781 DD 77 FE      [19]  386 	ld	-2 (ix),a
   2784 0A            [ 7]  387 	ld	a,(bc)
   2785 E6 01         [ 7]  388 	and	a, #0x01
   2787 DD 77 FD      [19]  389 	ld	-3 (ix),a
   278A 69            [ 4]  390 	ld	l, c
   278B 60            [ 4]  391 	ld	h, b
   278C 23            [ 6]  392 	inc	hl
   278D 23            [ 6]  393 	inc	hl
   278E 46            [ 7]  394 	ld	b,(hl)
   278F 04            [ 4]  395 	inc	b
   2790 D5            [11]  396 	push	de
   2791 DD 7E FD      [19]  397 	ld	a,-3 (ix)
   2794 F5            [11]  398 	push	af
   2795 33            [ 6]  399 	inc	sp
   2796 C5            [11]  400 	push	bc
   2797 33            [ 6]  401 	inc	sp
   2798 CD D9 25      [17]  402 	call	_GetMode0PixelColorByte
   279B F1            [10]  403 	pop	af
   279C 7D            [ 4]  404 	ld	a,l
   279D D1            [10]  405 	pop	de
   279E DD AE FE      [19]  406 	xor	a, -2 (ix)
   27A1 12            [ 7]  407 	ld	(de),a
                            408 ;src/starfield/starfield.c:118: for(nStar = 0; nStar < STARS_NUM; nStar++)
   27A2 DD 34 FC      [23]  409 	inc	-4 (ix)
   27A5 DD 7E FC      [19]  410 	ld	a,-4 (ix)
   27A8 D6 0A         [ 7]  411 	sub	a, #0x0A
   27AA 38 98         [12]  412 	jr	C,00102$
   27AC DD F9         [10]  413 	ld	sp, ix
   27AE DD E1         [14]  414 	pop	ix
   27B0 C9            [10]  415 	ret
                            416 ;src/starfield/starfield.c:136: void moverEstrellas(){
                            417 ;	---------------------------------
                            418 ; Function moverEstrellas
                            419 ; ---------------------------------
   27B1                     420 _moverEstrellas::
   27B1 DD E5         [15]  421 	push	ix
   27B3 DD 21 00 00   [14]  422 	ld	ix,#0
   27B7 DD 39         [15]  423 	add	ix,sp
   27B9 21 F9 FF      [10]  424 	ld	hl,#-7
   27BC 39            [11]  425 	add	hl,sp
   27BD F9            [ 6]  426 	ld	sp,hl
                            427 ;src/starfield/starfield.c:141: for(nStar = 0; nStar < STARS_NUM; nStar++)
   27BE DD 36 F9 00   [19]  428 	ld	-7 (ix),#0x00
   27C2                     429 00108$:
                            430 ;src/starfield/starfield.c:143: pStar = &aStars[nStar];
   27C2 DD 6E F9      [19]  431 	ld	l,-7 (ix)
   27C5 26 00         [ 7]  432 	ld	h,#0x00
   27C7 29            [11]  433 	add	hl, hl
   27C8 29            [11]  434 	add	hl, hl
   27C9 29            [11]  435 	add	hl, hl
   27CA 11 39 2D      [10]  436 	ld	de,#_aStars
   27CD 19            [11]  437 	add	hl,de
   27CE 4D            [ 4]  438 	ld	c, l
   27CF 44            [ 4]  439 	ld	b, h
                            440 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27D0 21 02 00      [10]  441 	ld	hl,#0x0002
   27D3 09            [11]  442 	add	hl,bc
   27D4 DD 75 FA      [19]  443 	ld	-6 (ix),l
   27D7 DD 74 FB      [19]  444 	ld	-5 (ix),h
   27DA DD 6E FA      [19]  445 	ld	l,-6 (ix)
   27DD DD 66 FB      [19]  446 	ld	h,-5 (ix)
   27E0 7E            [ 7]  447 	ld	a,(hl)
   27E1 DD 77 FF      [19]  448 	ld	-1 (ix),a
                            449 ;src/starfield/starfield.c:148: pStar->nY += 1;
   27E4 59            [ 4]  450 	ld	e, c
   27E5 50            [ 4]  451 	ld	d, b
   27E6 13            [ 6]  452 	inc	de
                            453 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27E7 3E 02         [ 7]  454 	ld	a,#0x02
   27E9 DD 96 FF      [19]  455 	sub	a, -1 (ix)
   27EC 38 2C         [12]  456 	jr	C,00104$
                            457 ;src/starfield/starfield.c:148: pStar->nY += 1;
   27EE 1A            [ 7]  458 	ld	a,(de)
   27EF DD 77 FE      [19]  459 	ld	-2 (ix),a
                            460 ;src/starfield/starfield.c:145: switch(pStar->nStarType)
   27F2 D5            [11]  461 	push	de
   27F3 DD 5E FF      [19]  462 	ld	e,-1 (ix)
   27F6 16 00         [ 7]  463 	ld	d,#0x00
   27F8 21 FF 27      [10]  464 	ld	hl,#00125$
   27FB 19            [11]  465 	add	hl,de
   27FC 19            [11]  466 	add	hl,de
                            467 ;src/starfield/starfield.c:147: case 0: //slow star
   27FD D1            [10]  468 	pop	de
   27FE E9            [ 4]  469 	jp	(hl)
   27FF                     470 00125$:
   27FF 18 04         [12]  471 	jr	00101$
   2801 18 09         [12]  472 	jr	00102$
   2803 18 0F         [12]  473 	jr	00103$
   2805                     474 00101$:
                            475 ;src/starfield/starfield.c:148: pStar->nY += 1;
   2805 DD 7E FE      [19]  476 	ld	a,-2 (ix)
   2808 3C            [ 4]  477 	inc	a
   2809 12            [ 7]  478 	ld	(de),a
                            479 ;src/starfield/starfield.c:149: break;
   280A 18 0E         [12]  480 	jr	00104$
                            481 ;src/starfield/starfield.c:150: case 1: //medium star
   280C                     482 00102$:
                            483 ;src/starfield/starfield.c:151: pStar->nY += 3;
   280C DD 7E FE      [19]  484 	ld	a,-2 (ix)
   280F C6 03         [ 7]  485 	add	a, #0x03
   2811 12            [ 7]  486 	ld	(de),a
                            487 ;src/starfield/starfield.c:152: break;
   2812 18 06         [12]  488 	jr	00104$
                            489 ;src/starfield/starfield.c:153: case 2: //fast star
   2814                     490 00103$:
                            491 ;src/starfield/starfield.c:154: pStar->nY += 6;
   2814 DD 7E FE      [19]  492 	ld	a,-2 (ix)
   2817 C6 06         [ 7]  493 	add	a, #0x06
   2819 12            [ 7]  494 	ld	(de),a
                            495 ;src/starfield/starfield.c:156: }
   281A                     496 00104$:
                            497 ;src/starfield/starfield.c:158: if(pStar->nY >= 200)
   281A 1A            [ 7]  498 	ld	a,(de)
   281B D6 C8         [ 7]  499 	sub	a, #0xC8
   281D 38 35         [12]  500 	jr	C,00109$
                            501 ;src/starfield/starfield.c:160: pStar->nY = 16;
   281F 3E 10         [ 7]  502 	ld	a,#0x10
   2821 12            [ 7]  503 	ld	(de),a
                            504 ;src/starfield/starfield.c:161: pStar->nX = rand() % 160;
   2822 C5            [11]  505 	push	bc
   2823 CD 12 29      [17]  506 	call	_rand
   2826 DD 74 FD      [19]  507 	ld	-3 (ix),h
   2829 DD 75 FC      [19]  508 	ld	-4 (ix),l
   282C 21 A0 00      [10]  509 	ld	hl,#0x00A0
   282F E5            [11]  510 	push	hl
   2830 DD 6E FC      [19]  511 	ld	l,-4 (ix)
   2833 DD 66 FD      [19]  512 	ld	h,-3 (ix)
   2836 E5            [11]  513 	push	hl
   2837 CD A7 2B      [17]  514 	call	__modsint
   283A F1            [10]  515 	pop	af
   283B F1            [10]  516 	pop	af
   283C C1            [10]  517 	pop	bc
   283D 7D            [ 4]  518 	ld	a,l
   283E 02            [ 7]  519 	ld	(bc),a
                            520 ;src/starfield/starfield.c:162: pStar->nStarType = rand() % 3;
   283F CD 12 29      [17]  521 	call	_rand
   2842 01 03 00      [10]  522 	ld	bc,#0x0003
   2845 C5            [11]  523 	push	bc
   2846 E5            [11]  524 	push	hl
   2847 CD A7 2B      [17]  525 	call	__modsint
   284A F1            [10]  526 	pop	af
   284B F1            [10]  527 	pop	af
   284C 7D            [ 4]  528 	ld	a,l
   284D DD 6E FA      [19]  529 	ld	l,-6 (ix)
   2850 DD 66 FB      [19]  530 	ld	h,-5 (ix)
   2853 77            [ 7]  531 	ld	(hl),a
   2854                     532 00109$:
                            533 ;src/starfield/starfield.c:141: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2854 DD 34 F9      [23]  534 	inc	-7 (ix)
   2857 DD 7E F9      [19]  535 	ld	a,-7 (ix)
   285A D6 0A         [ 7]  536 	sub	a, #0x0A
   285C DA C2 27      [10]  537 	jp	C,00108$
   285F DD F9         [10]  538 	ld	sp, ix
   2861 DD E1         [14]  539 	pop	ix
   2863 C9            [10]  540 	ret
                            541 	.area _CODE
                            542 	.area _INITIALIZER
                            543 	.area _CABS (ABS)
