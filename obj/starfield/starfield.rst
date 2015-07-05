                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Wed Jul  1 00:32:44 2015
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
   42CE                      27 _aStars::
   42CE                      28 	.ds 120
   4346                      29 _pixelColors::
   4346                      30 	.ds 3
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
   344C                      59 _get_mode0_pixel_color_byte::
   344C 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   344D FD 21 03 00   [14]   62 	ld	iy,#3
   3451 FD 39         [15]   63 	add	iy,sp
   3453 FD 7E 00      [19]   64 	ld	a,0 (iy)
   3456 E6 01         [ 7]   65 	and	a, #0x01
   3458 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   3459 FD 7E 00      [19]   68 	ld	a,0 (iy)
   345C E6 02         [ 7]   69 	and	a, #0x02
   345E 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   345F FD 7E 00      [19]   72 	ld	a,0 (iy)
   3462 E6 04         [ 7]   73 	and	a, #0x04
   3464 33            [ 6]   74 	inc	sp
   3465 F5            [11]   75 	push	af
   3466 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   3467 FD 7E 00      [19]   78 	ld	a,0 (iy)
   346A E6 08         [ 7]   79 	and	a, #0x08
   346C 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   346D 21 04 00      [10]   82 	ld	hl, #4+0
   3470 39            [11]   83 	add	hl, sp
   3471 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   3472 B7            [ 4]   86 	or	a,a
   3473 20 23         [12]   87 	jr	NZ,00118$
   3475 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   3476 78            [ 4]   90 	ld	a,b
   3477 B7            [ 4]   91 	or	a, a
   3478 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   347A 2E 80         [ 7]   94 	ld	l,#0x80
   347C                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   347C 7A            [ 4]   97 	ld	a,d
   347D B7            [ 4]   98 	or	a, a
   347E 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   3480 CB DD         [ 8]  101 	set	3, l
   3482                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   3482 FD 21 00 00   [14]  104 	ld	iy,#0
   3486 FD 39         [15]  105 	add	iy,sp
   3488 FD 7E 00      [19]  106 	ld	a,0 (iy)
   348B B7            [ 4]  107 	or	a, a
   348C 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   348E CB ED         [ 8]  110 	set	5, l
   3490                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   3490 7B            [ 4]  113 	ld	a,e
   3491 B7            [ 4]  114 	or	a, a
   3492 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   3494 CB CD         [ 8]  117 	set	1, l
   3496 18 22         [12]  118 	jr	00119$
   3498                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   3498 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   349A 78            [ 4]  123 	ld	a,b
   349B B7            [ 4]  124 	or	a, a
   349C 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   349E 2E 40         [ 7]  127 	ld	l,#0x40
   34A0                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   34A0 7A            [ 4]  130 	ld	a,d
   34A1 B7            [ 4]  131 	or	a, a
   34A2 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   34A4 CB D5         [ 8]  134 	set	2, l
   34A6                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   34A6 FD 21 00 00   [14]  137 	ld	iy,#0
   34AA FD 39         [15]  138 	add	iy,sp
   34AC FD 7E 00      [19]  139 	ld	a,0 (iy)
   34AF B7            [ 4]  140 	or	a, a
   34B0 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   34B2 CB E5         [ 8]  143 	set	4, l
   34B4                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   34B4 7B            [ 4]  146 	ld	a,e
   34B5 B7            [ 4]  147 	or	a, a
   34B6 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   34B8 CB C5         [ 8]  150 	set	0, l
   34BA                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   34BA 33            [ 6]  153 	inc	sp
   34BB C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   34BC                     159 _init_stars::
   34BC DD E5         [15]  160 	push	ix
   34BE DD 21 00 00   [14]  161 	ld	ix,#0
   34C2 DD 39         [15]  162 	add	ix,sp
   34C4 F5            [11]  163 	push	af
   34C5 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   34C6 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   34CA                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   34CA DD 6E FD      [19]  169 	ld	l,-3 (ix)
   34CD 26 00         [ 7]  170 	ld	h,#0x00
   34CF 29            [11]  171 	add	hl, hl
   34D0 29            [11]  172 	add	hl, hl
   34D1 29            [11]  173 	add	hl, hl
   34D2 3E CE         [ 7]  174 	ld	a,#<(_aStars)
   34D4 85            [ 4]  175 	add	a, l
   34D5 5F            [ 4]  176 	ld	e,a
   34D6 3E 42         [ 7]  177 	ld	a,#>(_aStars)
   34D8 8C            [ 4]  178 	adc	a, h
   34D9 57            [ 4]  179 	ld	d,a
   34DA D5            [11]  180 	push	de
   34DB CD 30 3C      [17]  181 	call	_rand
   34DE 01 A0 00      [10]  182 	ld	bc,#0x00A0
   34E1 C5            [11]  183 	push	bc
   34E2 E5            [11]  184 	push	hl
   34E3 CD DA 3E      [17]  185 	call	__modsint
   34E6 F1            [10]  186 	pop	af
   34E7 F1            [10]  187 	pop	af
   34E8 D1            [10]  188 	pop	de
   34E9 7D            [ 4]  189 	ld	a,l
   34EA 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   34EB 21 01 00      [10]  192 	ld	hl,#0x0001
   34EE 19            [11]  193 	add	hl,de
   34EF DD 75 FE      [19]  194 	ld	-2 (ix),l
   34F2 DD 74 FF      [19]  195 	ld	-1 (ix),h
   34F5 D5            [11]  196 	push	de
   34F6 CD 30 3C      [17]  197 	call	_rand
   34F9 01 C7 00      [10]  198 	ld	bc,#0x00C7
   34FC C5            [11]  199 	push	bc
   34FD E5            [11]  200 	push	hl
   34FE CD DA 3E      [17]  201 	call	__modsint
   3501 F1            [10]  202 	pop	af
   3502 F1            [10]  203 	pop	af
   3503 D1            [10]  204 	pop	de
   3504 7D            [ 4]  205 	ld	a,l
   3505 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   3508 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   350B 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   350C 13            [ 6]  210 	inc	de
   350D 13            [ 6]  211 	inc	de
   350E D5            [11]  212 	push	de
   350F CD 30 3C      [17]  213 	call	_rand
   3512 01 03 00      [10]  214 	ld	bc,#0x0003
   3515 C5            [11]  215 	push	bc
   3516 E5            [11]  216 	push	hl
   3517 CD DA 3E      [17]  217 	call	__modsint
   351A F1            [10]  218 	pop	af
   351B F1            [10]  219 	pop	af
   351C D1            [10]  220 	pop	de
   351D 7D            [ 4]  221 	ld	a,l
   351E 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   351F DD 34 FD      [23]  224 	inc	-3 (ix)
   3522 DD 7E FD      [19]  225 	ld	a,-3 (ix)
   3525 D6 0F         [ 7]  226 	sub	a, #0x0F
   3527 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   3529 21 46 43      [10]  229 	ld	hl,#_pixelColors
   352C 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   352E 23            [ 6]  232 	inc	hl
   352F 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   3531 21 48 43      [10]  235 	ld	hl,#_pixelColors + 2
   3534 36 03         [10]  236 	ld	(hl),#0x03
   3536 DD F9         [10]  237 	ld	sp, ix
   3538 DD E1         [14]  238 	pop	ix
   353A C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   353B                     244 _draw_stars::
   353B DD E5         [15]  245 	push	ix
   353D DD 21 00 00   [14]  246 	ld	ix,#0
   3541 DD 39         [15]  247 	add	ix,sp
   3543 F5            [11]  248 	push	af
   3544 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3545 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   3549                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   3549 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   354C 26 00         [ 7]  255 	ld	h,#0x00
   354E 29            [11]  256 	add	hl, hl
   354F 29            [11]  257 	add	hl, hl
   3550 29            [11]  258 	add	hl, hl
   3551 11 CE 42      [10]  259 	ld	de,#_aStars
   3554 19            [11]  260 	add	hl,de
   3555 4D            [ 4]  261 	ld	c, l
   3556 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   3557 21 06 00      [10]  264 	ld	hl,#0x0006
   355A 09            [11]  265 	add	hl,bc
   355B DD 75 FE      [19]  266 	ld	-2 (ix),l
   355E DD 74 FF      [19]  267 	ld	-1 (ix),h
   3561 69            [ 4]  268 	ld	l, c
   3562 60            [ 4]  269 	ld	h, b
   3563 23            [ 6]  270 	inc	hl
   3564 5E            [ 7]  271 	ld	e,(hl)
   3565 0A            [ 7]  272 	ld	a,(bc)
   3566 67            [ 4]  273 	ld	h,a
   3567 DD 6E 04      [19]  274 	ld	l,4 (ix)
   356A DD 56 05      [19]  275 	ld	d,5 (ix)
   356D C5            [11]  276 	push	bc
   356E 7B            [ 4]  277 	ld	a,e
   356F F5            [11]  278 	push	af
   3570 33            [ 6]  279 	inc	sp
   3571 E5            [11]  280 	push	hl
   3572 33            [ 6]  281 	inc	sp
   3573 62            [ 4]  282 	ld	h, d
   3574 E5            [11]  283 	push	hl
   3575 CD E6 3E      [17]  284 	call	_cpct_getScreenPtr
   3578 F1            [10]  285 	pop	af
   3579 F1            [10]  286 	pop	af
   357A EB            [ 4]  287 	ex	de,hl
   357B C1            [10]  288 	pop	bc
   357C DD 6E FE      [19]  289 	ld	l,-2 (ix)
   357F DD 66 FF      [19]  290 	ld	h,-1 (ix)
   3582 73            [ 7]  291 	ld	(hl),e
   3583 23            [ 6]  292 	inc	hl
   3584 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   3585 1A            [ 7]  295 	ld	a,(de)
   3586 DD 77 FE      [19]  296 	ld	-2 (ix),a
   3589 0A            [ 7]  297 	ld	a,(bc)
   358A E6 01         [ 7]  298 	and	a, #0x01
   358C DD 77 FD      [19]  299 	ld	-3 (ix),a
   358F 69            [ 4]  300 	ld	l, c
   3590 60            [ 4]  301 	ld	h, b
   3591 23            [ 6]  302 	inc	hl
   3592 23            [ 6]  303 	inc	hl
   3593 46            [ 7]  304 	ld	b,(hl)
   3594 04            [ 4]  305 	inc	b
   3595 D5            [11]  306 	push	de
   3596 DD 7E FD      [19]  307 	ld	a,-3 (ix)
   3599 F5            [11]  308 	push	af
   359A 33            [ 6]  309 	inc	sp
   359B C5            [11]  310 	push	bc
   359C 33            [ 6]  311 	inc	sp
   359D CD 4C 34      [17]  312 	call	_get_mode0_pixel_color_byte
   35A0 F1            [10]  313 	pop	af
   35A1 7D            [ 4]  314 	ld	a,l
   35A2 D1            [10]  315 	pop	de
   35A3 DD AE FE      [19]  316 	xor	a, -2 (ix)
   35A6 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   35A7 DD 34 FC      [23]  319 	inc	-4 (ix)
   35AA DD 7E FC      [19]  320 	ld	a,-4 (ix)
   35AD D6 0F         [ 7]  321 	sub	a, #0x0F
   35AF 38 98         [12]  322 	jr	C,00102$
   35B1 DD F9         [10]  323 	ld	sp, ix
   35B3 DD E1         [14]  324 	pop	ix
   35B5 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   35B6                     330 _update_stars::
   35B6 DD E5         [15]  331 	push	ix
   35B8 DD 21 00 00   [14]  332 	ld	ix,#0
   35BC DD 39         [15]  333 	add	ix,sp
   35BE 21 F8 FF      [10]  334 	ld	hl,#-8
   35C1 39            [11]  335 	add	hl,sp
   35C2 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   35C3 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   35C7                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   35C7 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   35CA 26 00         [ 7]  342 	ld	h,#0x00
   35CC 29            [11]  343 	add	hl, hl
   35CD 29            [11]  344 	add	hl, hl
   35CE 29            [11]  345 	add	hl, hl
   35CF 11 CE 42      [10]  346 	ld	de,#_aStars
   35D2 19            [11]  347 	add	hl,de
   35D3 4D            [ 4]  348 	ld	c, l
   35D4 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   35D5 21 02 00      [10]  351 	ld	hl,#0x0002
   35D8 09            [11]  352 	add	hl,bc
   35D9 DD 75 FE      [19]  353 	ld	-2 (ix),l
   35DC DD 74 FF      [19]  354 	ld	-1 (ix),h
   35DF DD 6E FE      [19]  355 	ld	l,-2 (ix)
   35E2 DD 66 FF      [19]  356 	ld	h,-1 (ix)
   35E5 7E            [ 7]  357 	ld	a,(hl)
   35E6 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   35E9 59            [ 4]  360 	ld	e, c
   35EA 50            [ 4]  361 	ld	d, b
   35EB 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   35EC 3E 02         [ 7]  364 	ld	a,#0x02
   35EE DD 96 FD      [19]  365 	sub	a, -3 (ix)
   35F1 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   35F3 1A            [ 7]  368 	ld	a,(de)
   35F4 DD 77 FC      [19]  369 	ld	-4 (ix), a
   35F7 3C            [ 4]  370 	inc	a
   35F8 DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   35FB D5            [11]  373 	push	de
   35FC DD 5E FD      [19]  374 	ld	e,-3 (ix)
   35FF 16 00         [ 7]  375 	ld	d,#0x00
   3601 21 08 36      [10]  376 	ld	hl,#00125$
   3604 19            [11]  377 	add	hl,de
   3605 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   3606 D1            [10]  380 	pop	de
   3607 E9            [ 4]  381 	jp	(hl)
   3608                     382 00125$:
   3608 18 04         [12]  383 	jr	00101$
   360A 18 08         [12]  384 	jr	00102$
   360C 18 0C         [12]  385 	jr	00103$
   360E                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   360E DD 7E FB      [19]  388 	ld	a,-5 (ix)
   3611 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   3612 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   3614                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   3614 DD 7E FB      [19]  395 	ld	a,-5 (ix)
   3617 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   3618 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   361A                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   361A DD 7E FC      [19]  402 	ld	a,-4 (ix)
   361D C6 02         [ 7]  403 	add	a, #0x02
   361F 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   3620                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   3620 1A            [ 7]  408 	ld	a,(de)
   3621 D6 C6         [ 7]  409 	sub	a, #0xC6
   3623 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   3625 AF            [ 4]  412 	xor	a, a
   3626 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   3627 C5            [11]  415 	push	bc
   3628 CD 30 3C      [17]  416 	call	_rand
   362B DD 74 FA      [19]  417 	ld	-6 (ix),h
   362E DD 75 F9      [19]  418 	ld	-7 (ix),l
   3631 21 A0 00      [10]  419 	ld	hl,#0x00A0
   3634 E5            [11]  420 	push	hl
   3635 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   3638 DD 66 FA      [19]  422 	ld	h,-6 (ix)
   363B E5            [11]  423 	push	hl
   363C CD DA 3E      [17]  424 	call	__modsint
   363F F1            [10]  425 	pop	af
   3640 F1            [10]  426 	pop	af
   3641 C1            [10]  427 	pop	bc
   3642 7D            [ 4]  428 	ld	a,l
   3643 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   3644 CD 30 3C      [17]  431 	call	_rand
   3647 01 03 00      [10]  432 	ld	bc,#0x0003
   364A C5            [11]  433 	push	bc
   364B E5            [11]  434 	push	hl
   364C CD DA 3E      [17]  435 	call	__modsint
   364F F1            [10]  436 	pop	af
   3650 F1            [10]  437 	pop	af
   3651 7D            [ 4]  438 	ld	a,l
   3652 DD 6E FE      [19]  439 	ld	l,-2 (ix)
   3655 DD 66 FF      [19]  440 	ld	h,-1 (ix)
   3658 77            [ 7]  441 	ld	(hl),a
   3659                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3659 DD 34 F8      [23]  444 	inc	-8 (ix)
   365C DD 7E F8      [19]  445 	ld	a,-8 (ix)
   365F D6 0F         [ 7]  446 	sub	a, #0x0F
   3661 DA C7 35      [10]  447 	jp	C,00108$
   3664 DD F9         [10]  448 	ld	sp, ix
   3666 DD E1         [14]  449 	pop	ix
   3668 C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
