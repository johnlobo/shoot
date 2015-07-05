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
   44D4                      27 _aStars::
   44D4                      28 	.ds 120
   454C                      29 _pixelColors::
   454C                      30 	.ds 3
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
   3652                      59 _get_mode0_pixel_color_byte::
   3652 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   3653 FD 21 03 00   [14]   62 	ld	iy,#3
   3657 FD 39         [15]   63 	add	iy,sp
   3659 FD 7E 00      [19]   64 	ld	a,0 (iy)
   365C E6 01         [ 7]   65 	and	a, #0x01
   365E 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   365F FD 7E 00      [19]   68 	ld	a,0 (iy)
   3662 E6 02         [ 7]   69 	and	a, #0x02
   3664 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   3665 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3668 E6 04         [ 7]   73 	and	a, #0x04
   366A 33            [ 6]   74 	inc	sp
   366B F5            [11]   75 	push	af
   366C 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   366D FD 7E 00      [19]   78 	ld	a,0 (iy)
   3670 E6 08         [ 7]   79 	and	a, #0x08
   3672 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   3673 21 04 00      [10]   82 	ld	hl, #4+0
   3676 39            [11]   83 	add	hl, sp
   3677 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   3678 B7            [ 4]   86 	or	a,a
   3679 20 23         [12]   87 	jr	NZ,00118$
   367B 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   367C 78            [ 4]   90 	ld	a,b
   367D B7            [ 4]   91 	or	a, a
   367E 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   3680 2E 80         [ 7]   94 	ld	l,#0x80
   3682                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   3682 7A            [ 4]   97 	ld	a,d
   3683 B7            [ 4]   98 	or	a, a
   3684 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   3686 CB DD         [ 8]  101 	set	3, l
   3688                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   3688 FD 21 00 00   [14]  104 	ld	iy,#0
   368C FD 39         [15]  105 	add	iy,sp
   368E FD 7E 00      [19]  106 	ld	a,0 (iy)
   3691 B7            [ 4]  107 	or	a, a
   3692 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   3694 CB ED         [ 8]  110 	set	5, l
   3696                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   3696 7B            [ 4]  113 	ld	a,e
   3697 B7            [ 4]  114 	or	a, a
   3698 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   369A CB CD         [ 8]  117 	set	1, l
   369C 18 22         [12]  118 	jr	00119$
   369E                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   369E 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   36A0 78            [ 4]  123 	ld	a,b
   36A1 B7            [ 4]  124 	or	a, a
   36A2 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   36A4 2E 40         [ 7]  127 	ld	l,#0x40
   36A6                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   36A6 7A            [ 4]  130 	ld	a,d
   36A7 B7            [ 4]  131 	or	a, a
   36A8 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   36AA CB D5         [ 8]  134 	set	2, l
   36AC                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   36AC FD 21 00 00   [14]  137 	ld	iy,#0
   36B0 FD 39         [15]  138 	add	iy,sp
   36B2 FD 7E 00      [19]  139 	ld	a,0 (iy)
   36B5 B7            [ 4]  140 	or	a, a
   36B6 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   36B8 CB E5         [ 8]  143 	set	4, l
   36BA                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   36BA 7B            [ 4]  146 	ld	a,e
   36BB B7            [ 4]  147 	or	a, a
   36BC 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   36BE CB C5         [ 8]  150 	set	0, l
   36C0                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   36C0 33            [ 6]  153 	inc	sp
   36C1 C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   36C2                     159 _init_stars::
   36C2 DD E5         [15]  160 	push	ix
   36C4 DD 21 00 00   [14]  161 	ld	ix,#0
   36C8 DD 39         [15]  162 	add	ix,sp
   36CA F5            [11]  163 	push	af
   36CB 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   36CC DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   36D0                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   36D0 DD 6E FD      [19]  169 	ld	l,-3 (ix)
   36D3 26 00         [ 7]  170 	ld	h,#0x00
   36D5 29            [11]  171 	add	hl, hl
   36D6 29            [11]  172 	add	hl, hl
   36D7 29            [11]  173 	add	hl, hl
   36D8 3E D4         [ 7]  174 	ld	a,#<(_aStars)
   36DA 85            [ 4]  175 	add	a, l
   36DB 5F            [ 4]  176 	ld	e,a
   36DC 3E 44         [ 7]  177 	ld	a,#>(_aStars)
   36DE 8C            [ 4]  178 	adc	a, h
   36DF 57            [ 4]  179 	ld	d,a
   36E0 D5            [11]  180 	push	de
   36E1 CD 36 3E      [17]  181 	call	_rand
   36E4 01 A0 00      [10]  182 	ld	bc,#0x00A0
   36E7 C5            [11]  183 	push	bc
   36E8 E5            [11]  184 	push	hl
   36E9 CD E0 40      [17]  185 	call	__modsint
   36EC F1            [10]  186 	pop	af
   36ED F1            [10]  187 	pop	af
   36EE D1            [10]  188 	pop	de
   36EF 7D            [ 4]  189 	ld	a,l
   36F0 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   36F1 21 01 00      [10]  192 	ld	hl,#0x0001
   36F4 19            [11]  193 	add	hl,de
   36F5 DD 75 FE      [19]  194 	ld	-2 (ix),l
   36F8 DD 74 FF      [19]  195 	ld	-1 (ix),h
   36FB D5            [11]  196 	push	de
   36FC CD 36 3E      [17]  197 	call	_rand
   36FF 01 C7 00      [10]  198 	ld	bc,#0x00C7
   3702 C5            [11]  199 	push	bc
   3703 E5            [11]  200 	push	hl
   3704 CD E0 40      [17]  201 	call	__modsint
   3707 F1            [10]  202 	pop	af
   3708 F1            [10]  203 	pop	af
   3709 D1            [10]  204 	pop	de
   370A 7D            [ 4]  205 	ld	a,l
   370B DD 6E FE      [19]  206 	ld	l,-2 (ix)
   370E DD 66 FF      [19]  207 	ld	h,-1 (ix)
   3711 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   3712 13            [ 6]  210 	inc	de
   3713 13            [ 6]  211 	inc	de
   3714 D5            [11]  212 	push	de
   3715 CD 36 3E      [17]  213 	call	_rand
   3718 01 03 00      [10]  214 	ld	bc,#0x0003
   371B C5            [11]  215 	push	bc
   371C E5            [11]  216 	push	hl
   371D CD E0 40      [17]  217 	call	__modsint
   3720 F1            [10]  218 	pop	af
   3721 F1            [10]  219 	pop	af
   3722 D1            [10]  220 	pop	de
   3723 7D            [ 4]  221 	ld	a,l
   3724 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3725 DD 34 FD      [23]  224 	inc	-3 (ix)
   3728 DD 7E FD      [19]  225 	ld	a,-3 (ix)
   372B D6 0F         [ 7]  226 	sub	a, #0x0F
   372D 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   372F 21 4C 45      [10]  229 	ld	hl,#_pixelColors
   3732 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   3734 23            [ 6]  232 	inc	hl
   3735 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   3737 21 4E 45      [10]  235 	ld	hl,#_pixelColors + 2
   373A 36 03         [10]  236 	ld	(hl),#0x03
   373C DD F9         [10]  237 	ld	sp, ix
   373E DD E1         [14]  238 	pop	ix
   3740 C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   3741                     244 _draw_stars::
   3741 DD E5         [15]  245 	push	ix
   3743 DD 21 00 00   [14]  246 	ld	ix,#0
   3747 DD 39         [15]  247 	add	ix,sp
   3749 F5            [11]  248 	push	af
   374A F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   374B DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   374F                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   374F DD 6E FC      [19]  254 	ld	l,-4 (ix)
   3752 26 00         [ 7]  255 	ld	h,#0x00
   3754 29            [11]  256 	add	hl, hl
   3755 29            [11]  257 	add	hl, hl
   3756 29            [11]  258 	add	hl, hl
   3757 11 D4 44      [10]  259 	ld	de,#_aStars
   375A 19            [11]  260 	add	hl,de
   375B 4D            [ 4]  261 	ld	c, l
   375C 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   375D 21 06 00      [10]  264 	ld	hl,#0x0006
   3760 09            [11]  265 	add	hl,bc
   3761 DD 75 FE      [19]  266 	ld	-2 (ix),l
   3764 DD 74 FF      [19]  267 	ld	-1 (ix),h
   3767 69            [ 4]  268 	ld	l, c
   3768 60            [ 4]  269 	ld	h, b
   3769 23            [ 6]  270 	inc	hl
   376A 5E            [ 7]  271 	ld	e,(hl)
   376B 0A            [ 7]  272 	ld	a,(bc)
   376C 67            [ 4]  273 	ld	h,a
   376D DD 6E 04      [19]  274 	ld	l,4 (ix)
   3770 DD 56 05      [19]  275 	ld	d,5 (ix)
   3773 C5            [11]  276 	push	bc
   3774 7B            [ 4]  277 	ld	a,e
   3775 F5            [11]  278 	push	af
   3776 33            [ 6]  279 	inc	sp
   3777 E5            [11]  280 	push	hl
   3778 33            [ 6]  281 	inc	sp
   3779 62            [ 4]  282 	ld	h, d
   377A E5            [11]  283 	push	hl
   377B CD EC 40      [17]  284 	call	_cpct_getScreenPtr
   377E F1            [10]  285 	pop	af
   377F F1            [10]  286 	pop	af
   3780 EB            [ 4]  287 	ex	de,hl
   3781 C1            [10]  288 	pop	bc
   3782 DD 6E FE      [19]  289 	ld	l,-2 (ix)
   3785 DD 66 FF      [19]  290 	ld	h,-1 (ix)
   3788 73            [ 7]  291 	ld	(hl),e
   3789 23            [ 6]  292 	inc	hl
   378A 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   378B 1A            [ 7]  295 	ld	a,(de)
   378C DD 77 FE      [19]  296 	ld	-2 (ix),a
   378F 0A            [ 7]  297 	ld	a,(bc)
   3790 E6 01         [ 7]  298 	and	a, #0x01
   3792 DD 77 FD      [19]  299 	ld	-3 (ix),a
   3795 69            [ 4]  300 	ld	l, c
   3796 60            [ 4]  301 	ld	h, b
   3797 23            [ 6]  302 	inc	hl
   3798 23            [ 6]  303 	inc	hl
   3799 46            [ 7]  304 	ld	b,(hl)
   379A 04            [ 4]  305 	inc	b
   379B D5            [11]  306 	push	de
   379C DD 7E FD      [19]  307 	ld	a,-3 (ix)
   379F F5            [11]  308 	push	af
   37A0 33            [ 6]  309 	inc	sp
   37A1 C5            [11]  310 	push	bc
   37A2 33            [ 6]  311 	inc	sp
   37A3 CD 52 36      [17]  312 	call	_get_mode0_pixel_color_byte
   37A6 F1            [10]  313 	pop	af
   37A7 7D            [ 4]  314 	ld	a,l
   37A8 D1            [10]  315 	pop	de
   37A9 DD AE FE      [19]  316 	xor	a, -2 (ix)
   37AC 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   37AD DD 34 FC      [23]  319 	inc	-4 (ix)
   37B0 DD 7E FC      [19]  320 	ld	a,-4 (ix)
   37B3 D6 0F         [ 7]  321 	sub	a, #0x0F
   37B5 38 98         [12]  322 	jr	C,00102$
   37B7 DD F9         [10]  323 	ld	sp, ix
   37B9 DD E1         [14]  324 	pop	ix
   37BB C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   37BC                     330 _update_stars::
   37BC DD E5         [15]  331 	push	ix
   37BE DD 21 00 00   [14]  332 	ld	ix,#0
   37C2 DD 39         [15]  333 	add	ix,sp
   37C4 21 F8 FF      [10]  334 	ld	hl,#-8
   37C7 39            [11]  335 	add	hl,sp
   37C8 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   37C9 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   37CD                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   37CD DD 6E F8      [19]  341 	ld	l,-8 (ix)
   37D0 26 00         [ 7]  342 	ld	h,#0x00
   37D2 29            [11]  343 	add	hl, hl
   37D3 29            [11]  344 	add	hl, hl
   37D4 29            [11]  345 	add	hl, hl
   37D5 11 D4 44      [10]  346 	ld	de,#_aStars
   37D8 19            [11]  347 	add	hl,de
   37D9 4D            [ 4]  348 	ld	c, l
   37DA 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   37DB 21 02 00      [10]  351 	ld	hl,#0x0002
   37DE 09            [11]  352 	add	hl,bc
   37DF DD 75 FE      [19]  353 	ld	-2 (ix),l
   37E2 DD 74 FF      [19]  354 	ld	-1 (ix),h
   37E5 DD 6E FE      [19]  355 	ld	l,-2 (ix)
   37E8 DD 66 FF      [19]  356 	ld	h,-1 (ix)
   37EB 7E            [ 7]  357 	ld	a,(hl)
   37EC DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   37EF 59            [ 4]  360 	ld	e, c
   37F0 50            [ 4]  361 	ld	d, b
   37F1 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   37F2 3E 02         [ 7]  364 	ld	a,#0x02
   37F4 DD 96 FD      [19]  365 	sub	a, -3 (ix)
   37F7 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   37F9 1A            [ 7]  368 	ld	a,(de)
   37FA DD 77 FC      [19]  369 	ld	-4 (ix), a
   37FD 3C            [ 4]  370 	inc	a
   37FE DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3801 D5            [11]  373 	push	de
   3802 DD 5E FD      [19]  374 	ld	e,-3 (ix)
   3805 16 00         [ 7]  375 	ld	d,#0x00
   3807 21 0E 38      [10]  376 	ld	hl,#00125$
   380A 19            [11]  377 	add	hl,de
   380B 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   380C D1            [10]  380 	pop	de
   380D E9            [ 4]  381 	jp	(hl)
   380E                     382 00125$:
   380E 18 04         [12]  383 	jr	00101$
   3810 18 08         [12]  384 	jr	00102$
   3812 18 0C         [12]  385 	jr	00103$
   3814                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3814 DD 7E FB      [19]  388 	ld	a,-5 (ix)
   3817 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   3818 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   381A                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   381A DD 7E FB      [19]  395 	ld	a,-5 (ix)
   381D 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   381E 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   3820                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   3820 DD 7E FC      [19]  402 	ld	a,-4 (ix)
   3823 C6 02         [ 7]  403 	add	a, #0x02
   3825 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   3826                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   3826 1A            [ 7]  408 	ld	a,(de)
   3827 D6 C6         [ 7]  409 	sub	a, #0xC6
   3829 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   382B AF            [ 4]  412 	xor	a, a
   382C 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   382D C5            [11]  415 	push	bc
   382E CD 36 3E      [17]  416 	call	_rand
   3831 DD 74 FA      [19]  417 	ld	-6 (ix),h
   3834 DD 75 F9      [19]  418 	ld	-7 (ix),l
   3837 21 A0 00      [10]  419 	ld	hl,#0x00A0
   383A E5            [11]  420 	push	hl
   383B DD 6E F9      [19]  421 	ld	l,-7 (ix)
   383E DD 66 FA      [19]  422 	ld	h,-6 (ix)
   3841 E5            [11]  423 	push	hl
   3842 CD E0 40      [17]  424 	call	__modsint
   3845 F1            [10]  425 	pop	af
   3846 F1            [10]  426 	pop	af
   3847 C1            [10]  427 	pop	bc
   3848 7D            [ 4]  428 	ld	a,l
   3849 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   384A CD 36 3E      [17]  431 	call	_rand
   384D 01 03 00      [10]  432 	ld	bc,#0x0003
   3850 C5            [11]  433 	push	bc
   3851 E5            [11]  434 	push	hl
   3852 CD E0 40      [17]  435 	call	__modsint
   3855 F1            [10]  436 	pop	af
   3856 F1            [10]  437 	pop	af
   3857 7D            [ 4]  438 	ld	a,l
   3858 DD 6E FE      [19]  439 	ld	l,-2 (ix)
   385B DD 66 FF      [19]  440 	ld	h,-1 (ix)
   385E 77            [ 7]  441 	ld	(hl),a
   385F                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   385F DD 34 F8      [23]  444 	inc	-8 (ix)
   3862 DD 7E F8      [19]  445 	ld	a,-8 (ix)
   3865 D6 0F         [ 7]  446 	sub	a, #0x0F
   3867 DA CD 37      [10]  447 	jp	C,00108$
   386A DD F9         [10]  448 	ld	sp, ix
   386C DD E1         [14]  449 	pop	ix
   386E C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
