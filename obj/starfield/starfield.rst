                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:52 2015
                              5 ;--------------------------------------------------------
                              6 	.module starfield
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_mode0_pixel_color_byte
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _rand
                             15 	.globl _pixelColors
                             16 	.globl _aStars
                             17 	.globl _init_stars
                             18 	.globl _draw_stars
                             19 	.globl _update_stars
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
   5902                      27 _aStars::
   5902                      28 	.ds 120
   597A                      29 _pixelColors::
   597A                      30 	.ds 3
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/starfield/starfield.c:14: u8 get_mode0_pixel_color_byte(u8 nColor, u8 nPixel)
                             56 ;	---------------------------------
                             57 ; Function get_mode0_pixel_color_byte
                             58 ; ---------------------------------
   447B                      59 _get_mode0_pixel_color_byte::
   447B 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   447C FD 21 03 00   [14]   62 	ld	iy,#3
   4480 FD 39         [15]   63 	add	iy,sp
   4482 FD 7E 00      [19]   64 	ld	a,0 (iy)
   4485 E6 01         [ 7]   65 	and	a, #0x01
   4487 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   4488 FD 7E 00      [19]   68 	ld	a,0 (iy)
   448B E6 02         [ 7]   69 	and	a, #0x02
   448D 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   448E FD 7E 00      [19]   72 	ld	a,0 (iy)
   4491 E6 04         [ 7]   73 	and	a, #0x04
   4493 33            [ 6]   74 	inc	sp
   4494 F5            [11]   75 	push	af
   4495 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   4496 FD 7E 00      [19]   78 	ld	a,0 (iy)
   4499 E6 08         [ 7]   79 	and	a, #0x08
   449B 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   449C 21 04 00      [10]   82 	ld	hl, #4+0
   449F 39            [11]   83 	add	hl, sp
   44A0 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   44A1 B7            [ 4]   86 	or	a,a
   44A2 20 23         [12]   87 	jr	NZ,00118$
   44A4 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   44A5 78            [ 4]   90 	ld	a,b
   44A6 B7            [ 4]   91 	or	a, a
   44A7 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   44A9 2E 80         [ 7]   94 	ld	l,#0x80
   44AB                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   44AB 7A            [ 4]   97 	ld	a,d
   44AC B7            [ 4]   98 	or	a, a
   44AD 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   44AF CB DD         [ 8]  101 	set	3, l
   44B1                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   44B1 FD 21 00 00   [14]  104 	ld	iy,#0
   44B5 FD 39         [15]  105 	add	iy,sp
   44B7 FD 7E 00      [19]  106 	ld	a,0 (iy)
   44BA B7            [ 4]  107 	or	a, a
   44BB 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   44BD CB ED         [ 8]  110 	set	5, l
   44BF                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   44BF 7B            [ 4]  113 	ld	a,e
   44C0 B7            [ 4]  114 	or	a, a
   44C1 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   44C3 CB CD         [ 8]  117 	set	1, l
   44C5 18 22         [12]  118 	jr	00119$
   44C7                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   44C7 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   44C9 78            [ 4]  123 	ld	a,b
   44CA B7            [ 4]  124 	or	a, a
   44CB 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   44CD 2E 40         [ 7]  127 	ld	l,#0x40
   44CF                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   44CF 7A            [ 4]  130 	ld	a,d
   44D0 B7            [ 4]  131 	or	a, a
   44D1 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   44D3 CB D5         [ 8]  134 	set	2, l
   44D5                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   44D5 FD 21 00 00   [14]  137 	ld	iy,#0
   44D9 FD 39         [15]  138 	add	iy,sp
   44DB FD 7E 00      [19]  139 	ld	a,0 (iy)
   44DE B7            [ 4]  140 	or	a, a
   44DF 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   44E1 CB E5         [ 8]  143 	set	4, l
   44E3                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   44E3 7B            [ 4]  146 	ld	a,e
   44E4 B7            [ 4]  147 	or	a, a
   44E5 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   44E7 CB C5         [ 8]  150 	set	0, l
   44E9                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   44E9 33            [ 6]  153 	inc	sp
   44EA C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   44EB                     159 _init_stars::
   44EB DD E5         [15]  160 	push	ix
   44ED DD 21 00 00   [14]  161 	ld	ix,#0
   44F1 DD 39         [15]  162 	add	ix,sp
   44F3 F5            [11]  163 	push	af
   44F4 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   44F5 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   44F9                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   44F9 DD 6E FD      [19]  169 	ld	l,-3 (ix)
   44FC 26 00         [ 7]  170 	ld	h,#0x00
   44FE 29            [11]  171 	add	hl, hl
   44FF 29            [11]  172 	add	hl, hl
   4500 29            [11]  173 	add	hl, hl
   4501 3E 02         [ 7]  174 	ld	a,#<(_aStars)
   4503 85            [ 4]  175 	add	a, l
   4504 5F            [ 4]  176 	ld	e,a
   4505 3E 59         [ 7]  177 	ld	a,#>(_aStars)
   4507 8C            [ 4]  178 	adc	a, h
   4508 57            [ 4]  179 	ld	d,a
   4509 D5            [11]  180 	push	de
   450A CD BF 4D      [17]  181 	call	_rand
   450D 01 A0 00      [10]  182 	ld	bc,#0x00A0
   4510 C5            [11]  183 	push	bc
   4511 E5            [11]  184 	push	hl
   4512 CD 3C 50      [17]  185 	call	__modsint
   4515 F1            [10]  186 	pop	af
   4516 F1            [10]  187 	pop	af
   4517 D1            [10]  188 	pop	de
   4518 7D            [ 4]  189 	ld	a,l
   4519 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   451A 21 01 00      [10]  192 	ld	hl,#0x0001
   451D 19            [11]  193 	add	hl,de
   451E DD 75 FE      [19]  194 	ld	-2 (ix),l
   4521 DD 74 FF      [19]  195 	ld	-1 (ix),h
   4524 D5            [11]  196 	push	de
   4525 CD BF 4D      [17]  197 	call	_rand
   4528 01 C7 00      [10]  198 	ld	bc,#0x00C7
   452B C5            [11]  199 	push	bc
   452C E5            [11]  200 	push	hl
   452D CD 3C 50      [17]  201 	call	__modsint
   4530 F1            [10]  202 	pop	af
   4531 F1            [10]  203 	pop	af
   4532 D1            [10]  204 	pop	de
   4533 7D            [ 4]  205 	ld	a,l
   4534 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   4537 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   453A 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   453B 13            [ 6]  210 	inc	de
   453C 13            [ 6]  211 	inc	de
   453D D5            [11]  212 	push	de
   453E CD BF 4D      [17]  213 	call	_rand
   4541 01 03 00      [10]  214 	ld	bc,#0x0003
   4544 C5            [11]  215 	push	bc
   4545 E5            [11]  216 	push	hl
   4546 CD 3C 50      [17]  217 	call	__modsint
   4549 F1            [10]  218 	pop	af
   454A F1            [10]  219 	pop	af
   454B D1            [10]  220 	pop	de
   454C 7D            [ 4]  221 	ld	a,l
   454D 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   454E DD 34 FD      [23]  224 	inc	-3 (ix)
   4551 DD 7E FD      [19]  225 	ld	a,-3 (ix)
   4554 D6 0F         [ 7]  226 	sub	a, #0x0F
   4556 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   4558 21 7A 59      [10]  229 	ld	hl,#_pixelColors
   455B 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   455D 23            [ 6]  232 	inc	hl
   455E 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   4560 21 7C 59      [10]  235 	ld	hl,#_pixelColors + 2
   4563 36 03         [10]  236 	ld	(hl),#0x03
   4565 DD F9         [10]  237 	ld	sp, ix
   4567 DD E1         [14]  238 	pop	ix
   4569 C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   456A                     244 _draw_stars::
   456A DD E5         [15]  245 	push	ix
   456C DD 21 00 00   [14]  246 	ld	ix,#0
   4570 DD 39         [15]  247 	add	ix,sp
   4572 F5            [11]  248 	push	af
   4573 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4574 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   4578                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   4578 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   457B 26 00         [ 7]  255 	ld	h,#0x00
   457D 29            [11]  256 	add	hl, hl
   457E 29            [11]  257 	add	hl, hl
   457F 29            [11]  258 	add	hl, hl
   4580 11 02 59      [10]  259 	ld	de,#_aStars
   4583 19            [11]  260 	add	hl,de
   4584 4D            [ 4]  261 	ld	c, l
   4585 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   4586 21 06 00      [10]  264 	ld	hl,#0x0006
   4589 09            [11]  265 	add	hl,bc
   458A DD 75 FD      [19]  266 	ld	-3 (ix),l
   458D DD 74 FE      [19]  267 	ld	-2 (ix),h
   4590 69            [ 4]  268 	ld	l, c
   4591 60            [ 4]  269 	ld	h, b
   4592 23            [ 6]  270 	inc	hl
   4593 5E            [ 7]  271 	ld	e,(hl)
   4594 0A            [ 7]  272 	ld	a,(bc)
   4595 67            [ 4]  273 	ld	h,a
   4596 DD 6E 04      [19]  274 	ld	l,4 (ix)
   4599 DD 56 05      [19]  275 	ld	d,5 (ix)
   459C C5            [11]  276 	push	bc
   459D 7B            [ 4]  277 	ld	a,e
   459E F5            [11]  278 	push	af
   459F 33            [ 6]  279 	inc	sp
   45A0 E5            [11]  280 	push	hl
   45A1 33            [ 6]  281 	inc	sp
   45A2 62            [ 4]  282 	ld	h, d
   45A3 E5            [11]  283 	push	hl
   45A4 CD 5C 50      [17]  284 	call	_cpct_getScreenPtr
   45A7 F1            [10]  285 	pop	af
   45A8 F1            [10]  286 	pop	af
   45A9 EB            [ 4]  287 	ex	de,hl
   45AA C1            [10]  288 	pop	bc
   45AB DD 6E FD      [19]  289 	ld	l,-3 (ix)
   45AE DD 66 FE      [19]  290 	ld	h,-2 (ix)
   45B1 73            [ 7]  291 	ld	(hl),e
   45B2 23            [ 6]  292 	inc	hl
   45B3 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   45B4 1A            [ 7]  295 	ld	a,(de)
   45B5 DD 77 FD      [19]  296 	ld	-3 (ix),a
   45B8 0A            [ 7]  297 	ld	a,(bc)
   45B9 E6 01         [ 7]  298 	and	a, #0x01
   45BB DD 77 FF      [19]  299 	ld	-1 (ix),a
   45BE 69            [ 4]  300 	ld	l, c
   45BF 60            [ 4]  301 	ld	h, b
   45C0 23            [ 6]  302 	inc	hl
   45C1 23            [ 6]  303 	inc	hl
   45C2 46            [ 7]  304 	ld	b,(hl)
   45C3 04            [ 4]  305 	inc	b
   45C4 D5            [11]  306 	push	de
   45C5 DD 7E FF      [19]  307 	ld	a,-1 (ix)
   45C8 F5            [11]  308 	push	af
   45C9 33            [ 6]  309 	inc	sp
   45CA C5            [11]  310 	push	bc
   45CB 33            [ 6]  311 	inc	sp
   45CC CD 7B 44      [17]  312 	call	_get_mode0_pixel_color_byte
   45CF F1            [10]  313 	pop	af
   45D0 7D            [ 4]  314 	ld	a,l
   45D1 D1            [10]  315 	pop	de
   45D2 DD AE FD      [19]  316 	xor	a, -3 (ix)
   45D5 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   45D6 DD 34 FC      [23]  319 	inc	-4 (ix)
   45D9 DD 7E FC      [19]  320 	ld	a,-4 (ix)
   45DC D6 0F         [ 7]  321 	sub	a, #0x0F
   45DE 38 98         [12]  322 	jr	C,00102$
   45E0 DD F9         [10]  323 	ld	sp, ix
   45E2 DD E1         [14]  324 	pop	ix
   45E4 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   45E5                     330 _update_stars::
   45E5 DD E5         [15]  331 	push	ix
   45E7 DD 21 00 00   [14]  332 	ld	ix,#0
   45EB DD 39         [15]  333 	add	ix,sp
   45ED 21 F8 FF      [10]  334 	ld	hl,#-8
   45F0 39            [11]  335 	add	hl,sp
   45F1 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   45F2 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   45F6                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   45F6 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   45F9 26 00         [ 7]  342 	ld	h,#0x00
   45FB 29            [11]  343 	add	hl, hl
   45FC 29            [11]  344 	add	hl, hl
   45FD 29            [11]  345 	add	hl, hl
   45FE 11 02 59      [10]  346 	ld	de,#_aStars
   4601 19            [11]  347 	add	hl,de
   4602 4D            [ 4]  348 	ld	c, l
   4603 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   4604 21 02 00      [10]  351 	ld	hl,#0x0002
   4607 09            [11]  352 	add	hl,bc
   4608 DD 75 FE      [19]  353 	ld	-2 (ix),l
   460B DD 74 FF      [19]  354 	ld	-1 (ix),h
   460E DD 6E FE      [19]  355 	ld	l,-2 (ix)
   4611 DD 66 FF      [19]  356 	ld	h,-1 (ix)
   4614 7E            [ 7]  357 	ld	a,(hl)
   4615 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   4618 59            [ 4]  360 	ld	e, c
   4619 50            [ 4]  361 	ld	d, b
   461A 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   461B 3E 02         [ 7]  364 	ld	a,#0x02
   461D DD 96 FD      [19]  365 	sub	a, -3 (ix)
   4620 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   4622 1A            [ 7]  368 	ld	a,(de)
   4623 DD 77 FC      [19]  369 	ld	-4 (ix), a
   4626 3C            [ 4]  370 	inc	a
   4627 DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   462A D5            [11]  373 	push	de
   462B DD 5E FD      [19]  374 	ld	e,-3 (ix)
   462E 16 00         [ 7]  375 	ld	d,#0x00
   4630 21 37 46      [10]  376 	ld	hl,#00125$
   4633 19            [11]  377 	add	hl,de
   4634 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   4635 D1            [10]  380 	pop	de
   4636 E9            [ 4]  381 	jp	(hl)
   4637                     382 00125$:
   4637 18 04         [12]  383 	jr	00101$
   4639 18 08         [12]  384 	jr	00102$
   463B 18 0C         [12]  385 	jr	00103$
   463D                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   463D DD 7E FB      [19]  388 	ld	a,-5 (ix)
   4640 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   4641 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   4643                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   4643 DD 7E FB      [19]  395 	ld	a,-5 (ix)
   4646 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   4647 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   4649                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   4649 DD 7E FC      [19]  402 	ld	a,-4 (ix)
   464C C6 02         [ 7]  403 	add	a, #0x02
   464E 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   464F                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   464F 1A            [ 7]  408 	ld	a,(de)
   4650 D6 C6         [ 7]  409 	sub	a, #0xC6
   4652 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   4654 AF            [ 4]  412 	xor	a, a
   4655 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   4656 C5            [11]  415 	push	bc
   4657 CD BF 4D      [17]  416 	call	_rand
   465A DD 74 FA      [19]  417 	ld	-6 (ix),h
   465D DD 75 F9      [19]  418 	ld	-7 (ix),l
   4660 21 A0 00      [10]  419 	ld	hl,#0x00A0
   4663 E5            [11]  420 	push	hl
   4664 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   4667 DD 66 FA      [19]  422 	ld	h,-6 (ix)
   466A E5            [11]  423 	push	hl
   466B CD 3C 50      [17]  424 	call	__modsint
   466E F1            [10]  425 	pop	af
   466F F1            [10]  426 	pop	af
   4670 C1            [10]  427 	pop	bc
   4671 7D            [ 4]  428 	ld	a,l
   4672 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   4673 CD BF 4D      [17]  431 	call	_rand
   4676 01 03 00      [10]  432 	ld	bc,#0x0003
   4679 C5            [11]  433 	push	bc
   467A E5            [11]  434 	push	hl
   467B CD 3C 50      [17]  435 	call	__modsint
   467E F1            [10]  436 	pop	af
   467F F1            [10]  437 	pop	af
   4680 7D            [ 4]  438 	ld	a,l
   4681 DD 6E FE      [19]  439 	ld	l,-2 (ix)
   4684 DD 66 FF      [19]  440 	ld	h,-1 (ix)
   4687 77            [ 7]  441 	ld	(hl),a
   4688                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4688 DD 34 F8      [23]  444 	inc	-8 (ix)
   468B DD 7E F8      [19]  445 	ld	a,-8 (ix)
   468E D6 0F         [ 7]  446 	sub	a, #0x0F
   4690 DA F6 45      [10]  447 	jp	C,00108$
   4693 DD F9         [10]  448 	ld	sp, ix
   4695 DD E1         [14]  449 	pop	ix
   4697 C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
