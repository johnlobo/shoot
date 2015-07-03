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
   3814                      27 _aStars::
   3814                      28 	.ds 120
   388C                      29 _pixelColors::
   388C                      30 	.ds 3
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
   2AC9                      59 _get_mode0_pixel_color_byte::
   2AC9 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   2ACA FD 21 03 00   [14]   62 	ld	iy,#3
   2ACE FD 39         [15]   63 	add	iy,sp
   2AD0 FD 7E 00      [19]   64 	ld	a,0 (iy)
   2AD3 E6 01         [ 7]   65 	and	a, #0x01
   2AD5 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   2AD6 FD 7E 00      [19]   68 	ld	a,0 (iy)
   2AD9 E6 02         [ 7]   69 	and	a, #0x02
   2ADB 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   2ADC FD 7E 00      [19]   72 	ld	a,0 (iy)
   2ADF E6 04         [ 7]   73 	and	a, #0x04
   2AE1 33            [ 6]   74 	inc	sp
   2AE2 F5            [11]   75 	push	af
   2AE3 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   2AE4 FD 7E 00      [19]   78 	ld	a,0 (iy)
   2AE7 E6 08         [ 7]   79 	and	a, #0x08
   2AE9 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   2AEA 21 04 00      [10]   82 	ld	hl, #4+0
   2AED 39            [11]   83 	add	hl, sp
   2AEE 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   2AEF B7            [ 4]   86 	or	a,a
   2AF0 20 23         [12]   87 	jr	NZ,00118$
   2AF2 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   2AF3 78            [ 4]   90 	ld	a,b
   2AF4 B7            [ 4]   91 	or	a, a
   2AF5 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   2AF7 2E 80         [ 7]   94 	ld	l,#0x80
   2AF9                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   2AF9 7A            [ 4]   97 	ld	a,d
   2AFA B7            [ 4]   98 	or	a, a
   2AFB 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   2AFD CB DD         [ 8]  101 	set	3, l
   2AFF                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   2AFF FD 21 00 00   [14]  104 	ld	iy,#0
   2B03 FD 39         [15]  105 	add	iy,sp
   2B05 FD 7E 00      [19]  106 	ld	a,0 (iy)
   2B08 B7            [ 4]  107 	or	a, a
   2B09 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   2B0B CB ED         [ 8]  110 	set	5, l
   2B0D                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   2B0D 7B            [ 4]  113 	ld	a,e
   2B0E B7            [ 4]  114 	or	a, a
   2B0F 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   2B11 CB CD         [ 8]  117 	set	1, l
   2B13 18 22         [12]  118 	jr	00119$
   2B15                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   2B15 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   2B17 78            [ 4]  123 	ld	a,b
   2B18 B7            [ 4]  124 	or	a, a
   2B19 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   2B1B 2E 40         [ 7]  127 	ld	l,#0x40
   2B1D                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   2B1D 7A            [ 4]  130 	ld	a,d
   2B1E B7            [ 4]  131 	or	a, a
   2B1F 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   2B21 CB D5         [ 8]  134 	set	2, l
   2B23                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   2B23 FD 21 00 00   [14]  137 	ld	iy,#0
   2B27 FD 39         [15]  138 	add	iy,sp
   2B29 FD 7E 00      [19]  139 	ld	a,0 (iy)
   2B2C B7            [ 4]  140 	or	a, a
   2B2D 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   2B2F CB E5         [ 8]  143 	set	4, l
   2B31                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   2B31 7B            [ 4]  146 	ld	a,e
   2B32 B7            [ 4]  147 	or	a, a
   2B33 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   2B35 CB C5         [ 8]  150 	set	0, l
   2B37                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   2B37 33            [ 6]  153 	inc	sp
   2B38 C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   2B39                     159 _init_stars::
   2B39 DD E5         [15]  160 	push	ix
   2B3B DD 21 00 00   [14]  161 	ld	ix,#0
   2B3F DD 39         [15]  162 	add	ix,sp
   2B41 F5            [11]  163 	push	af
   2B42 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2B43 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   2B47                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   2B47 DD 6E FD      [19]  169 	ld	l,-3 (ix)
   2B4A 26 00         [ 7]  170 	ld	h,#0x00
   2B4C 29            [11]  171 	add	hl, hl
   2B4D 29            [11]  172 	add	hl, hl
   2B4E 29            [11]  173 	add	hl, hl
   2B4F 3E 14         [ 7]  174 	ld	a,#<(_aStars)
   2B51 85            [ 4]  175 	add	a, l
   2B52 5F            [ 4]  176 	ld	e,a
   2B53 3E 38         [ 7]  177 	ld	a,#>(_aStars)
   2B55 8C            [ 4]  178 	adc	a, h
   2B56 57            [ 4]  179 	ld	d,a
   2B57 D5            [11]  180 	push	de
   2B58 CD AD 32      [17]  181 	call	_rand
   2B5B 01 A0 00      [10]  182 	ld	bc,#0x00A0
   2B5E C5            [11]  183 	push	bc
   2B5F E5            [11]  184 	push	hl
   2B60 CD 57 35      [17]  185 	call	__modsint
   2B63 F1            [10]  186 	pop	af
   2B64 F1            [10]  187 	pop	af
   2B65 D1            [10]  188 	pop	de
   2B66 7D            [ 4]  189 	ld	a,l
   2B67 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   2B68 21 01 00      [10]  192 	ld	hl,#0x0001
   2B6B 19            [11]  193 	add	hl,de
   2B6C DD 75 FE      [19]  194 	ld	-2 (ix),l
   2B6F DD 74 FF      [19]  195 	ld	-1 (ix),h
   2B72 D5            [11]  196 	push	de
   2B73 CD AD 32      [17]  197 	call	_rand
   2B76 01 C7 00      [10]  198 	ld	bc,#0x00C7
   2B79 C5            [11]  199 	push	bc
   2B7A E5            [11]  200 	push	hl
   2B7B CD 57 35      [17]  201 	call	__modsint
   2B7E F1            [10]  202 	pop	af
   2B7F F1            [10]  203 	pop	af
   2B80 D1            [10]  204 	pop	de
   2B81 7D            [ 4]  205 	ld	a,l
   2B82 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   2B85 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   2B88 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   2B89 13            [ 6]  210 	inc	de
   2B8A 13            [ 6]  211 	inc	de
   2B8B D5            [11]  212 	push	de
   2B8C CD AD 32      [17]  213 	call	_rand
   2B8F 01 03 00      [10]  214 	ld	bc,#0x0003
   2B92 C5            [11]  215 	push	bc
   2B93 E5            [11]  216 	push	hl
   2B94 CD 57 35      [17]  217 	call	__modsint
   2B97 F1            [10]  218 	pop	af
   2B98 F1            [10]  219 	pop	af
   2B99 D1            [10]  220 	pop	de
   2B9A 7D            [ 4]  221 	ld	a,l
   2B9B 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2B9C DD 34 FD      [23]  224 	inc	-3 (ix)
   2B9F DD 7E FD      [19]  225 	ld	a,-3 (ix)
   2BA2 D6 0F         [ 7]  226 	sub	a, #0x0F
   2BA4 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   2BA6 21 8C 38      [10]  229 	ld	hl,#_pixelColors
   2BA9 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   2BAB 23            [ 6]  232 	inc	hl
   2BAC 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   2BAE 21 8E 38      [10]  235 	ld	hl,#_pixelColors + 2
   2BB1 36 03         [10]  236 	ld	(hl),#0x03
   2BB3 DD F9         [10]  237 	ld	sp, ix
   2BB5 DD E1         [14]  238 	pop	ix
   2BB7 C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   2BB8                     244 _draw_stars::
   2BB8 DD E5         [15]  245 	push	ix
   2BBA DD 21 00 00   [14]  246 	ld	ix,#0
   2BBE DD 39         [15]  247 	add	ix,sp
   2BC0 F5            [11]  248 	push	af
   2BC1 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2BC2 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   2BC6                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   2BC6 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   2BC9 26 00         [ 7]  255 	ld	h,#0x00
   2BCB 29            [11]  256 	add	hl, hl
   2BCC 29            [11]  257 	add	hl, hl
   2BCD 29            [11]  258 	add	hl, hl
   2BCE 11 14 38      [10]  259 	ld	de,#_aStars
   2BD1 19            [11]  260 	add	hl,de
   2BD2 4D            [ 4]  261 	ld	c, l
   2BD3 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   2BD4 21 06 00      [10]  264 	ld	hl,#0x0006
   2BD7 09            [11]  265 	add	hl,bc
   2BD8 DD 75 FE      [19]  266 	ld	-2 (ix),l
   2BDB DD 74 FF      [19]  267 	ld	-1 (ix),h
   2BDE 69            [ 4]  268 	ld	l, c
   2BDF 60            [ 4]  269 	ld	h, b
   2BE0 23            [ 6]  270 	inc	hl
   2BE1 5E            [ 7]  271 	ld	e,(hl)
   2BE2 0A            [ 7]  272 	ld	a,(bc)
   2BE3 67            [ 4]  273 	ld	h,a
   2BE4 DD 6E 04      [19]  274 	ld	l,4 (ix)
   2BE7 DD 56 05      [19]  275 	ld	d,5 (ix)
   2BEA C5            [11]  276 	push	bc
   2BEB 7B            [ 4]  277 	ld	a,e
   2BEC F5            [11]  278 	push	af
   2BED 33            [ 6]  279 	inc	sp
   2BEE E5            [11]  280 	push	hl
   2BEF 33            [ 6]  281 	inc	sp
   2BF0 62            [ 4]  282 	ld	h, d
   2BF1 E5            [11]  283 	push	hl
   2BF2 CD 63 35      [17]  284 	call	_cpct_getScreenPtr
   2BF5 F1            [10]  285 	pop	af
   2BF6 F1            [10]  286 	pop	af
   2BF7 EB            [ 4]  287 	ex	de,hl
   2BF8 C1            [10]  288 	pop	bc
   2BF9 DD 6E FE      [19]  289 	ld	l,-2 (ix)
   2BFC DD 66 FF      [19]  290 	ld	h,-1 (ix)
   2BFF 73            [ 7]  291 	ld	(hl),e
   2C00 23            [ 6]  292 	inc	hl
   2C01 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   2C02 1A            [ 7]  295 	ld	a,(de)
   2C03 DD 77 FE      [19]  296 	ld	-2 (ix),a
   2C06 0A            [ 7]  297 	ld	a,(bc)
   2C07 E6 01         [ 7]  298 	and	a, #0x01
   2C09 DD 77 FD      [19]  299 	ld	-3 (ix),a
   2C0C 69            [ 4]  300 	ld	l, c
   2C0D 60            [ 4]  301 	ld	h, b
   2C0E 23            [ 6]  302 	inc	hl
   2C0F 23            [ 6]  303 	inc	hl
   2C10 46            [ 7]  304 	ld	b,(hl)
   2C11 04            [ 4]  305 	inc	b
   2C12 D5            [11]  306 	push	de
   2C13 DD 7E FD      [19]  307 	ld	a,-3 (ix)
   2C16 F5            [11]  308 	push	af
   2C17 33            [ 6]  309 	inc	sp
   2C18 C5            [11]  310 	push	bc
   2C19 33            [ 6]  311 	inc	sp
   2C1A CD C9 2A      [17]  312 	call	_get_mode0_pixel_color_byte
   2C1D F1            [10]  313 	pop	af
   2C1E 7D            [ 4]  314 	ld	a,l
   2C1F D1            [10]  315 	pop	de
   2C20 DD AE FE      [19]  316 	xor	a, -2 (ix)
   2C23 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2C24 DD 34 FC      [23]  319 	inc	-4 (ix)
   2C27 DD 7E FC      [19]  320 	ld	a,-4 (ix)
   2C2A D6 0F         [ 7]  321 	sub	a, #0x0F
   2C2C 38 98         [12]  322 	jr	C,00102$
   2C2E DD F9         [10]  323 	ld	sp, ix
   2C30 DD E1         [14]  324 	pop	ix
   2C32 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   2C33                     330 _update_stars::
   2C33 DD E5         [15]  331 	push	ix
   2C35 DD 21 00 00   [14]  332 	ld	ix,#0
   2C39 DD 39         [15]  333 	add	ix,sp
   2C3B 21 F8 FF      [10]  334 	ld	hl,#-8
   2C3E 39            [11]  335 	add	hl,sp
   2C3F F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2C40 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   2C44                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   2C44 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   2C47 26 00         [ 7]  342 	ld	h,#0x00
   2C49 29            [11]  343 	add	hl, hl
   2C4A 29            [11]  344 	add	hl, hl
   2C4B 29            [11]  345 	add	hl, hl
   2C4C 11 14 38      [10]  346 	ld	de,#_aStars
   2C4F 19            [11]  347 	add	hl,de
   2C50 4D            [ 4]  348 	ld	c, l
   2C51 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   2C52 21 02 00      [10]  351 	ld	hl,#0x0002
   2C55 09            [11]  352 	add	hl,bc
   2C56 DD 75 FE      [19]  353 	ld	-2 (ix),l
   2C59 DD 74 FF      [19]  354 	ld	-1 (ix),h
   2C5C DD 6E FE      [19]  355 	ld	l,-2 (ix)
   2C5F DD 66 FF      [19]  356 	ld	h,-1 (ix)
   2C62 7E            [ 7]  357 	ld	a,(hl)
   2C63 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   2C66 59            [ 4]  360 	ld	e, c
   2C67 50            [ 4]  361 	ld	d, b
   2C68 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   2C69 3E 02         [ 7]  364 	ld	a,#0x02
   2C6B DD 96 FD      [19]  365 	sub	a, -3 (ix)
   2C6E 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   2C70 1A            [ 7]  368 	ld	a,(de)
   2C71 DD 77 FC      [19]  369 	ld	-4 (ix), a
   2C74 3C            [ 4]  370 	inc	a
   2C75 DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   2C78 D5            [11]  373 	push	de
   2C79 DD 5E FD      [19]  374 	ld	e,-3 (ix)
   2C7C 16 00         [ 7]  375 	ld	d,#0x00
   2C7E 21 85 2C      [10]  376 	ld	hl,#00125$
   2C81 19            [11]  377 	add	hl,de
   2C82 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   2C83 D1            [10]  380 	pop	de
   2C84 E9            [ 4]  381 	jp	(hl)
   2C85                     382 00125$:
   2C85 18 04         [12]  383 	jr	00101$
   2C87 18 08         [12]  384 	jr	00102$
   2C89 18 0C         [12]  385 	jr	00103$
   2C8B                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   2C8B DD 7E FB      [19]  388 	ld	a,-5 (ix)
   2C8E 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   2C8F 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   2C91                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   2C91 DD 7E FB      [19]  395 	ld	a,-5 (ix)
   2C94 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   2C95 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   2C97                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   2C97 DD 7E FC      [19]  402 	ld	a,-4 (ix)
   2C9A C6 02         [ 7]  403 	add	a, #0x02
   2C9C 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   2C9D                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   2C9D 1A            [ 7]  408 	ld	a,(de)
   2C9E D6 C6         [ 7]  409 	sub	a, #0xC6
   2CA0 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   2CA2 AF            [ 4]  412 	xor	a, a
   2CA3 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   2CA4 C5            [11]  415 	push	bc
   2CA5 CD AD 32      [17]  416 	call	_rand
   2CA8 DD 74 FA      [19]  417 	ld	-6 (ix),h
   2CAB DD 75 F9      [19]  418 	ld	-7 (ix),l
   2CAE 21 A0 00      [10]  419 	ld	hl,#0x00A0
   2CB1 E5            [11]  420 	push	hl
   2CB2 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   2CB5 DD 66 FA      [19]  422 	ld	h,-6 (ix)
   2CB8 E5            [11]  423 	push	hl
   2CB9 CD 57 35      [17]  424 	call	__modsint
   2CBC F1            [10]  425 	pop	af
   2CBD F1            [10]  426 	pop	af
   2CBE C1            [10]  427 	pop	bc
   2CBF 7D            [ 4]  428 	ld	a,l
   2CC0 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   2CC1 CD AD 32      [17]  431 	call	_rand
   2CC4 01 03 00      [10]  432 	ld	bc,#0x0003
   2CC7 C5            [11]  433 	push	bc
   2CC8 E5            [11]  434 	push	hl
   2CC9 CD 57 35      [17]  435 	call	__modsint
   2CCC F1            [10]  436 	pop	af
   2CCD F1            [10]  437 	pop	af
   2CCE 7D            [ 4]  438 	ld	a,l
   2CCF DD 6E FE      [19]  439 	ld	l,-2 (ix)
   2CD2 DD 66 FF      [19]  440 	ld	h,-1 (ix)
   2CD5 77            [ 7]  441 	ld	(hl),a
   2CD6                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   2CD6 DD 34 F8      [23]  444 	inc	-8 (ix)
   2CD9 DD 7E F8      [19]  445 	ld	a,-8 (ix)
   2CDC D6 0F         [ 7]  446 	sub	a, #0x0F
   2CDE DA 44 2C      [10]  447 	jp	C,00108$
   2CE1 DD F9         [10]  448 	ld	sp, ix
   2CE3 DD E1         [14]  449 	pop	ix
   2CE5 C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
