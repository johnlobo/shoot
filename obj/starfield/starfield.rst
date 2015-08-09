                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:54 2015
                              5 ;--------------------------------------------------------
                              6 	.module starfield
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_mode0_pixel_color_byte
                             13 	.globl _cpct_getRandomUniform_u8_f
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _aStars
                             16 	.globl _init_stars
                             17 	.globl _draw_stars
                             18 	.globl _update_stars
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   64B5                      26 _aStars::
   64B5                      27 	.ds 120
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/starfield/starfield.c:12: u8 get_mode0_pixel_color_byte(u8 nColor, u8 nPixel)
                             53 ;	---------------------------------
                             54 ; Function get_mode0_pixel_color_byte
                             55 ; ---------------------------------
   458C                      56 _get_mode0_pixel_color_byte::
   458C 3B            [ 6]   57 	dec	sp
                             58 ;src/starfield/starfield.c:20: if(nColor & 1)
   458D FD 21 03 00   [14]   59 	ld	iy,#3
   4591 FD 39         [15]   60 	add	iy,sp
   4593 FD 7E 00      [19]   61 	ld	a,0 (iy)
   4596 E6 01         [ 7]   62 	and	a, #0x01
   4598 47            [ 4]   63 	ld	b,a
                             64 ;src/starfield/starfield.c:23: if(nColor & 2)
   4599 FD 7E 00      [19]   65 	ld	a,0 (iy)
   459C E6 02         [ 7]   66 	and	a, #0x02
   459E 57            [ 4]   67 	ld	d,a
                             68 ;src/starfield/starfield.c:26: if(nColor & 4)
   459F FD 7E 00      [19]   69 	ld	a,0 (iy)
   45A2 E6 04         [ 7]   70 	and	a, #0x04
   45A4 33            [ 6]   71 	inc	sp
   45A5 F5            [11]   72 	push	af
   45A6 33            [ 6]   73 	inc	sp
                             74 ;src/starfield/starfield.c:29: if(nColor & 8)
   45A7 FD 7E 00      [19]   75 	ld	a,0 (iy)
   45AA E6 08         [ 7]   76 	and	a, #0x08
   45AC 5F            [ 4]   77 	ld	e,a
                             78 ;src/starfield/starfield.c:16: if(nPixel == 0)
   45AD 21 04 00      [10]   79 	ld	hl, #4+0
   45B0 39            [11]   80 	add	hl, sp
   45B1 7E            [ 7]   81 	ld	a, (hl)
                             82 ;src/starfield/starfield.c:18: nByte &= 85;
   45B2 B7            [ 4]   83 	or	a,a
   45B3 20 23         [12]   84 	jr	NZ,00118$
   45B5 6F            [ 4]   85 	ld	l,a
                             86 ;src/starfield/starfield.c:20: if(nColor & 1)
   45B6 78            [ 4]   87 	ld	a,b
   45B7 B7            [ 4]   88 	or	a, a
   45B8 28 02         [12]   89 	jr	Z,00102$
                             90 ;src/starfield/starfield.c:21: nByte |= 128;
   45BA 2E 80         [ 7]   91 	ld	l,#0x80
   45BC                      92 00102$:
                             93 ;src/starfield/starfield.c:23: if(nColor & 2)
   45BC 7A            [ 4]   94 	ld	a,d
   45BD B7            [ 4]   95 	or	a, a
   45BE 28 02         [12]   96 	jr	Z,00104$
                             97 ;src/starfield/starfield.c:24: nByte |= 8;
   45C0 CB DD         [ 8]   98 	set	3, l
   45C2                      99 00104$:
                            100 ;src/starfield/starfield.c:26: if(nColor & 4)
   45C2 FD 21 00 00   [14]  101 	ld	iy,#0
   45C6 FD 39         [15]  102 	add	iy,sp
   45C8 FD 7E 00      [19]  103 	ld	a,0 (iy)
   45CB B7            [ 4]  104 	or	a, a
   45CC 28 02         [12]  105 	jr	Z,00106$
                            106 ;src/starfield/starfield.c:27: nByte |= 32;
   45CE CB ED         [ 8]  107 	set	5, l
   45D0                     108 00106$:
                            109 ;src/starfield/starfield.c:29: if(nColor & 8)
   45D0 7B            [ 4]  110 	ld	a,e
   45D1 B7            [ 4]  111 	or	a, a
   45D2 28 26         [12]  112 	jr	Z,00119$
                            113 ;src/starfield/starfield.c:30: nByte |= 2;
   45D4 CB CD         [ 8]  114 	set	1, l
   45D6 18 22         [12]  115 	jr	00119$
   45D8                     116 00118$:
                            117 ;src/starfield/starfield.c:34: nByte &= 170;
   45D8 2E 00         [ 7]  118 	ld	l,#0x00
                            119 ;src/starfield/starfield.c:36: if(nColor & 1)
   45DA 78            [ 4]  120 	ld	a,b
   45DB B7            [ 4]  121 	or	a, a
   45DC 28 02         [12]  122 	jr	Z,00110$
                            123 ;src/starfield/starfield.c:37: nByte |= 64;
   45DE 2E 40         [ 7]  124 	ld	l,#0x40
   45E0                     125 00110$:
                            126 ;src/starfield/starfield.c:39: if(nColor & 2)
   45E0 7A            [ 4]  127 	ld	a,d
   45E1 B7            [ 4]  128 	or	a, a
   45E2 28 02         [12]  129 	jr	Z,00112$
                            130 ;src/starfield/starfield.c:40: nByte |= 4;
   45E4 CB D5         [ 8]  131 	set	2, l
   45E6                     132 00112$:
                            133 ;src/starfield/starfield.c:42: if(nColor & 4)
   45E6 FD 21 00 00   [14]  134 	ld	iy,#0
   45EA FD 39         [15]  135 	add	iy,sp
   45EC FD 7E 00      [19]  136 	ld	a,0 (iy)
   45EF B7            [ 4]  137 	or	a, a
   45F0 28 02         [12]  138 	jr	Z,00114$
                            139 ;src/starfield/starfield.c:43: nByte |= 16;
   45F2 CB E5         [ 8]  140 	set	4, l
   45F4                     141 00114$:
                            142 ;src/starfield/starfield.c:45: if(nColor & 8)
   45F4 7B            [ 4]  143 	ld	a,e
   45F5 B7            [ 4]  144 	or	a, a
   45F6 28 02         [12]  145 	jr	Z,00119$
                            146 ;src/starfield/starfield.c:46: nByte |= 1;
   45F8 CB C5         [ 8]  147 	set	0, l
   45FA                     148 00119$:
                            149 ;src/starfield/starfield.c:49: return nByte;
   45FA 33            [ 6]  150 	inc	sp
   45FB C9            [10]  151 	ret
                            152 ;src/starfield/starfield.c:56: void init_stars(){
                            153 ;	---------------------------------
                            154 ; Function init_stars
                            155 ; ---------------------------------
   45FC                     156 _init_stars::
   45FC DD E5         [15]  157 	push	ix
   45FE DD 21 00 00   [14]  158 	ld	ix,#0
   4602 DD 39         [15]  159 	add	ix,sp
   4604 F5            [11]  160 	push	af
                            161 ;src/starfield/starfield.c:60: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4605 DD 36 FE 00   [19]  162 	ld	-2 (ix),#0x00
   4609                     163 00102$:
                            164 ;src/starfield/starfield.c:62: aStars[nStar].nX = cpct_getRandomUniform_u8_f(0) % 160;
   4609 DD 6E FE      [19]  165 	ld	l,-2 (ix)
   460C 26 00         [ 7]  166 	ld	h,#0x00
   460E 29            [11]  167 	add	hl, hl
   460F 29            [11]  168 	add	hl, hl
   4610 29            [11]  169 	add	hl, hl
   4611 3E B5         [ 7]  170 	ld	a,#<(_aStars)
   4613 85            [ 4]  171 	add	a, l
   4614 5F            [ 4]  172 	ld	e,a
   4615 3E 64         [ 7]  173 	ld	a,#>(_aStars)
   4617 8C            [ 4]  174 	adc	a, h
   4618 57            [ 4]  175 	ld	d,a
   4619 D5            [11]  176 	push	de
   461A 2E 00         [ 7]  177 	ld	l,#0x00
   461C CD 79 4E      [17]  178 	call	_cpct_getRandomUniform_u8_f
   461F 45            [ 4]  179 	ld	b,l
   4620 3E A0         [ 7]  180 	ld	a,#0xA0
   4622 F5            [11]  181 	push	af
   4623 33            [ 6]  182 	inc	sp
   4624 C5            [11]  183 	push	bc
   4625 33            [ 6]  184 	inc	sp
   4626 CD 00 4D      [17]  185 	call	__moduchar
   4629 F1            [10]  186 	pop	af
   462A 7D            [ 4]  187 	ld	a,l
   462B D1            [10]  188 	pop	de
   462C 12            [ 7]  189 	ld	(de),a
                            190 ;src/starfield/starfield.c:63: aStars[nStar].nY = cpct_getRandomUniform_u8_f(0) % 199;
   462D 4B            [ 4]  191 	ld	c, e
   462E 42            [ 4]  192 	ld	b, d
   462F 03            [ 6]  193 	inc	bc
   4630 C5            [11]  194 	push	bc
   4631 D5            [11]  195 	push	de
   4632 2E 00         [ 7]  196 	ld	l,#0x00
   4634 CD 79 4E      [17]  197 	call	_cpct_getRandomUniform_u8_f
   4637 DD 75 FF      [19]  198 	ld	-1 (ix),l
   463A 3E C7         [ 7]  199 	ld	a,#0xC7
   463C F5            [11]  200 	push	af
   463D 33            [ 6]  201 	inc	sp
   463E DD 7E FF      [19]  202 	ld	a,-1 (ix)
   4641 F5            [11]  203 	push	af
   4642 33            [ 6]  204 	inc	sp
   4643 CD 00 4D      [17]  205 	call	__moduchar
   4646 F1            [10]  206 	pop	af
   4647 7D            [ 4]  207 	ld	a,l
   4648 D1            [10]  208 	pop	de
   4649 C1            [10]  209 	pop	bc
   464A 02            [ 7]  210 	ld	(bc),a
                            211 ;src/starfield/starfield.c:64: aStars[nStar].nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   464B 13            [ 6]  212 	inc	de
   464C 13            [ 6]  213 	inc	de
   464D D5            [11]  214 	push	de
   464E 2E 00         [ 7]  215 	ld	l,#0x00
   4650 CD 79 4E      [17]  216 	call	_cpct_getRandomUniform_u8_f
   4653 45            [ 4]  217 	ld	b,l
   4654 3E 03         [ 7]  218 	ld	a,#0x03
   4656 F5            [11]  219 	push	af
   4657 33            [ 6]  220 	inc	sp
   4658 C5            [11]  221 	push	bc
   4659 33            [ 6]  222 	inc	sp
   465A CD 00 4D      [17]  223 	call	__moduchar
   465D F1            [10]  224 	pop	af
   465E 7D            [ 4]  225 	ld	a,l
   465F D1            [10]  226 	pop	de
   4660 12            [ 7]  227 	ld	(de),a
                            228 ;src/starfield/starfield.c:60: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4661 DD 34 FE      [23]  229 	inc	-2 (ix)
   4664 DD 7E FE      [19]  230 	ld	a,-2 (ix)
   4667 D6 0F         [ 7]  231 	sub	a, #0x0F
   4669 38 9E         [12]  232 	jr	C,00102$
   466B DD F9         [10]  233 	ld	sp, ix
   466D DD E1         [14]  234 	pop	ix
   466F C9            [10]  235 	ret
                            236 ;src/starfield/starfield.c:71: void draw_stars(u8* screen){
                            237 ;	---------------------------------
                            238 ; Function draw_stars
                            239 ; ---------------------------------
   4670                     240 _draw_stars::
   4670 DD E5         [15]  241 	push	ix
   4672 DD 21 00 00   [14]  242 	ld	ix,#0
   4676 DD 39         [15]  243 	add	ix,sp
   4678 F5            [11]  244 	push	af
   4679 F5            [11]  245 	push	af
                            246 ;src/starfield/starfield.c:75: for(nStar = 0; nStar < STARS_NUM; nStar++)
   467A DD 36 FC 00   [19]  247 	ld	-4 (ix),#0x00
   467E                     248 00102$:
                            249 ;src/starfield/starfield.c:77: pStar = &aStars[nStar];
   467E DD 6E FC      [19]  250 	ld	l,-4 (ix)
   4681 26 00         [ 7]  251 	ld	h,#0x00
   4683 29            [11]  252 	add	hl, hl
   4684 29            [11]  253 	add	hl, hl
   4685 29            [11]  254 	add	hl, hl
   4686 11 B5 64      [10]  255 	ld	de,#_aStars
   4689 19            [11]  256 	add	hl,de
   468A 4D            [ 4]  257 	ld	c, l
   468B 44            [ 4]  258 	ld	b, h
                            259 ;src/starfield/starfield.c:79: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   468C 21 06 00      [10]  260 	ld	hl,#0x0006
   468F 09            [11]  261 	add	hl,bc
   4690 DD 75 FE      [19]  262 	ld	-2 (ix),l
   4693 DD 74 FF      [19]  263 	ld	-1 (ix),h
   4696 69            [ 4]  264 	ld	l, c
   4697 60            [ 4]  265 	ld	h, b
   4698 23            [ 6]  266 	inc	hl
   4699 5E            [ 7]  267 	ld	e,(hl)
   469A 0A            [ 7]  268 	ld	a,(bc)
   469B 67            [ 4]  269 	ld	h,a
   469C DD 6E 04      [19]  270 	ld	l,4 (ix)
   469F DD 56 05      [19]  271 	ld	d,5 (ix)
   46A2 C5            [11]  272 	push	bc
   46A3 7B            [ 4]  273 	ld	a,e
   46A4 F5            [11]  274 	push	af
   46A5 33            [ 6]  275 	inc	sp
   46A6 E5            [11]  276 	push	hl
   46A7 33            [ 6]  277 	inc	sp
   46A8 62            [ 4]  278 	ld	h, d
   46A9 E5            [11]  279 	push	hl
   46AA CD A0 4F      [17]  280 	call	_cpct_getScreenPtr
   46AD EB            [ 4]  281 	ex	de,hl
   46AE C1            [10]  282 	pop	bc
   46AF DD 6E FE      [19]  283 	ld	l,-2 (ix)
   46B2 DD 66 FF      [19]  284 	ld	h,-1 (ix)
   46B5 73            [ 7]  285 	ld	(hl),e
   46B6 23            [ 6]  286 	inc	hl
   46B7 72            [ 7]  287 	ld	(hl),d
                            288 ;src/starfield/starfield.c:80: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   46B8 1A            [ 7]  289 	ld	a,(de)
   46B9 DD 77 FE      [19]  290 	ld	-2 (ix),a
   46BC 0A            [ 7]  291 	ld	a,(bc)
   46BD E6 01         [ 7]  292 	and	a, #0x01
   46BF DD 77 FD      [19]  293 	ld	-3 (ix),a
   46C2 69            [ 4]  294 	ld	l, c
   46C3 60            [ 4]  295 	ld	h, b
   46C4 23            [ 6]  296 	inc	hl
   46C5 23            [ 6]  297 	inc	hl
   46C6 46            [ 7]  298 	ld	b,(hl)
   46C7 04            [ 4]  299 	inc	b
   46C8 D5            [11]  300 	push	de
   46C9 DD 7E FD      [19]  301 	ld	a,-3 (ix)
   46CC F5            [11]  302 	push	af
   46CD 33            [ 6]  303 	inc	sp
   46CE C5            [11]  304 	push	bc
   46CF 33            [ 6]  305 	inc	sp
   46D0 CD 8C 45      [17]  306 	call	_get_mode0_pixel_color_byte
   46D3 F1            [10]  307 	pop	af
   46D4 7D            [ 4]  308 	ld	a,l
   46D5 D1            [10]  309 	pop	de
   46D6 DD AE FE      [19]  310 	xor	a, -2 (ix)
   46D9 12            [ 7]  311 	ld	(de),a
                            312 ;src/starfield/starfield.c:75: for(nStar = 0; nStar < STARS_NUM; nStar++)
   46DA DD 34 FC      [23]  313 	inc	-4 (ix)
   46DD DD 7E FC      [19]  314 	ld	a,-4 (ix)
   46E0 D6 0F         [ 7]  315 	sub	a, #0x0F
   46E2 38 9A         [12]  316 	jr	C,00102$
   46E4 DD F9         [10]  317 	ld	sp, ix
   46E6 DD E1         [14]  318 	pop	ix
   46E8 C9            [10]  319 	ret
                            320 ;src/starfield/starfield.c:87: void update_stars(){
                            321 ;	---------------------------------
                            322 ; Function update_stars
                            323 ; ---------------------------------
   46E9                     324 _update_stars::
   46E9 DD E5         [15]  325 	push	ix
   46EB DD 21 00 00   [14]  326 	ld	ix,#0
   46EF DD 39         [15]  327 	add	ix,sp
   46F1 21 FA FF      [10]  328 	ld	hl,#-6
   46F4 39            [11]  329 	add	hl,sp
   46F5 F9            [ 6]  330 	ld	sp,hl
                            331 ;src/starfield/starfield.c:92: for(nStar = 0; nStar < STARS_NUM; nStar++)
   46F6 DD 36 FA 00   [19]  332 	ld	-6 (ix),#0x00
   46FA                     333 00108$:
                            334 ;src/starfield/starfield.c:94: pStar = &aStars[nStar];
   46FA DD 6E FA      [19]  335 	ld	l,-6 (ix)
   46FD 26 00         [ 7]  336 	ld	h,#0x00
   46FF 29            [11]  337 	add	hl, hl
   4700 29            [11]  338 	add	hl, hl
   4701 29            [11]  339 	add	hl, hl
   4702 11 B5 64      [10]  340 	ld	de,#_aStars
   4705 19            [11]  341 	add	hl,de
   4706 4D            [ 4]  342 	ld	c, l
   4707 44            [ 4]  343 	ld	b, h
                            344 ;src/starfield/starfield.c:96: switch(pStar->nStarType)
   4708 21 02 00      [10]  345 	ld	hl,#0x0002
   470B 09            [11]  346 	add	hl,bc
   470C DD 75 FB      [19]  347 	ld	-5 (ix),l
   470F DD 74 FC      [19]  348 	ld	-4 (ix),h
   4712 DD 6E FB      [19]  349 	ld	l,-5 (ix)
   4715 DD 66 FC      [19]  350 	ld	h,-4 (ix)
   4718 7E            [ 7]  351 	ld	a,(hl)
   4719 DD 77 FF      [19]  352 	ld	-1 (ix),a
                            353 ;src/starfield/starfield.c:99: pStar->nY += 1;
   471C 59            [ 4]  354 	ld	e, c
   471D 50            [ 4]  355 	ld	d, b
   471E 13            [ 6]  356 	inc	de
                            357 ;src/starfield/starfield.c:96: switch(pStar->nStarType)
   471F 3E 02         [ 7]  358 	ld	a,#0x02
   4721 DD 96 FF      [19]  359 	sub	a, -1 (ix)
   4724 38 2D         [12]  360 	jr	C,00104$
                            361 ;src/starfield/starfield.c:99: pStar->nY += 1;
   4726 1A            [ 7]  362 	ld	a,(de)
   4727 DD 77 FD      [19]  363 	ld	-3 (ix), a
   472A 3C            [ 4]  364 	inc	a
   472B DD 77 FE      [19]  365 	ld	-2 (ix),a
                            366 ;src/starfield/starfield.c:96: switch(pStar->nStarType)
   472E D5            [11]  367 	push	de
   472F DD 5E FF      [19]  368 	ld	e,-1 (ix)
   4732 16 00         [ 7]  369 	ld	d,#0x00
   4734 21 3B 47      [10]  370 	ld	hl,#00125$
   4737 19            [11]  371 	add	hl,de
   4738 19            [11]  372 	add	hl,de
                            373 ;src/starfield/starfield.c:98: case 0: //slow star
   4739 D1            [10]  374 	pop	de
   473A E9            [ 4]  375 	jp	(hl)
   473B                     376 00125$:
   473B 18 04         [12]  377 	jr	00101$
   473D 18 08         [12]  378 	jr	00102$
   473F 18 0C         [12]  379 	jr	00103$
   4741                     380 00101$:
                            381 ;src/starfield/starfield.c:99: pStar->nY += 1;
   4741 DD 7E FE      [19]  382 	ld	a,-2 (ix)
   4744 12            [ 7]  383 	ld	(de),a
                            384 ;src/starfield/starfield.c:100: break;
   4745 18 0C         [12]  385 	jr	00104$
                            386 ;src/starfield/starfield.c:101: case 1: //medium star
   4747                     387 00102$:
                            388 ;src/starfield/starfield.c:102: pStar->nY += 1;
   4747 DD 7E FE      [19]  389 	ld	a,-2 (ix)
   474A 12            [ 7]  390 	ld	(de),a
                            391 ;src/starfield/starfield.c:103: break;
   474B 18 06         [12]  392 	jr	00104$
                            393 ;src/starfield/starfield.c:104: case 2: //fast star
   474D                     394 00103$:
                            395 ;src/starfield/starfield.c:105: pStar->nY += 2;
   474D DD 7E FD      [19]  396 	ld	a,-3 (ix)
   4750 C6 02         [ 7]  397 	add	a, #0x02
   4752 12            [ 7]  398 	ld	(de),a
                            399 ;src/starfield/starfield.c:107: }
   4753                     400 00104$:
                            401 ;src/starfield/starfield.c:109: if(pStar->nY >= 198)
   4753 1A            [ 7]  402 	ld	a,(de)
   4754 D6 C6         [ 7]  403 	sub	a, #0xC6
   4756 38 2E         [12]  404 	jr	C,00109$
                            405 ;src/starfield/starfield.c:111: pStar->nY = 0;
   4758 AF            [ 4]  406 	xor	a, a
   4759 12            [ 7]  407 	ld	(de),a
                            408 ;src/starfield/starfield.c:112: pStar->nX = cpct_getRandomUniform_u8_f(0) % 160;
   475A C5            [11]  409 	push	bc
   475B 2E 00         [ 7]  410 	ld	l,#0x00
   475D CD 79 4E      [17]  411 	call	_cpct_getRandomUniform_u8_f
   4760 55            [ 4]  412 	ld	d,l
   4761 3E A0         [ 7]  413 	ld	a,#0xA0
   4763 F5            [11]  414 	push	af
   4764 33            [ 6]  415 	inc	sp
   4765 D5            [11]  416 	push	de
   4766 33            [ 6]  417 	inc	sp
   4767 CD 00 4D      [17]  418 	call	__moduchar
   476A F1            [10]  419 	pop	af
   476B 7D            [ 4]  420 	ld	a,l
   476C C1            [10]  421 	pop	bc
   476D 02            [ 7]  422 	ld	(bc),a
                            423 ;src/starfield/starfield.c:113: pStar->nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   476E 2E 00         [ 7]  424 	ld	l,#0x00
   4770 CD 79 4E      [17]  425 	call	_cpct_getRandomUniform_u8_f
   4773 55            [ 4]  426 	ld	d,l
   4774 3E 03         [ 7]  427 	ld	a,#0x03
   4776 F5            [11]  428 	push	af
   4777 33            [ 6]  429 	inc	sp
   4778 D5            [11]  430 	push	de
   4779 33            [ 6]  431 	inc	sp
   477A CD 00 4D      [17]  432 	call	__moduchar
   477D F1            [10]  433 	pop	af
   477E 7D            [ 4]  434 	ld	a,l
   477F DD 6E FB      [19]  435 	ld	l,-5 (ix)
   4782 DD 66 FC      [19]  436 	ld	h,-4 (ix)
   4785 77            [ 7]  437 	ld	(hl),a
   4786                     438 00109$:
                            439 ;src/starfield/starfield.c:92: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4786 DD 34 FA      [23]  440 	inc	-6 (ix)
   4789 DD 7E FA      [19]  441 	ld	a,-6 (ix)
   478C D6 0F         [ 7]  442 	sub	a, #0x0F
   478E DA FA 46      [10]  443 	jp	C,00108$
   4791 DD F9         [10]  444 	ld	sp, ix
   4793 DD E1         [14]  445 	pop	ix
   4795 C9            [10]  446 	ret
                            447 	.area _CODE
                            448 	.area _INITIALIZER
                            449 	.area _CABS (ABS)
