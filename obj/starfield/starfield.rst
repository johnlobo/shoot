                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 00:50:09 2015
                              5 ;--------------------------------------------------------
                              6 	.module starfield
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_mode0_pixel_color_byte
                             13 	.globl _get_time
                             14 	.globl _cpct_getRandomUniform_u8_f
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _last_moved_stars
                             17 	.globl _aStars
                             18 	.globl _get_last_moved_stars
                             19 	.globl _init_stars
                             20 	.globl _draw_stars
                             21 	.globl _update_stars
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   6B31                      29 _aStars::
   6B31                      30 	.ds 105
   6B9A                      31 _last_moved_stars::
   6B9A                      32 	.ds 4
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/starfield/starfield.c:14: u8 get_mode0_pixel_color_byte(u8 nColor, u8 nPixel)
                             58 ;	---------------------------------
                             59 ; Function get_mode0_pixel_color_byte
                             60 ; ---------------------------------
   4B88                      61 _get_mode0_pixel_color_byte::
   4B88 3B            [ 6]   62 	dec	sp
                             63 ;src/starfield/starfield.c:22: if(nColor & 1)
   4B89 FD 21 03 00   [14]   64 	ld	iy,#3
   4B8D FD 39         [15]   65 	add	iy,sp
   4B8F FD 7E 00      [19]   66 	ld	a,0 (iy)
   4B92 E6 01         [ 7]   67 	and	a, #0x01
   4B94 47            [ 4]   68 	ld	b,a
                             69 ;src/starfield/starfield.c:25: if(nColor & 2)
   4B95 FD 7E 00      [19]   70 	ld	a,0 (iy)
   4B98 E6 02         [ 7]   71 	and	a, #0x02
   4B9A 57            [ 4]   72 	ld	d,a
                             73 ;src/starfield/starfield.c:28: if(nColor & 4)
   4B9B FD 7E 00      [19]   74 	ld	a,0 (iy)
   4B9E E6 04         [ 7]   75 	and	a, #0x04
   4BA0 33            [ 6]   76 	inc	sp
   4BA1 F5            [11]   77 	push	af
   4BA2 33            [ 6]   78 	inc	sp
                             79 ;src/starfield/starfield.c:31: if(nColor & 8)
   4BA3 FD 7E 00      [19]   80 	ld	a,0 (iy)
   4BA6 E6 08         [ 7]   81 	and	a, #0x08
   4BA8 5F            [ 4]   82 	ld	e,a
                             83 ;src/starfield/starfield.c:18: if(nPixel == 0)
   4BA9 21 04 00      [10]   84 	ld	hl, #4+0
   4BAC 39            [11]   85 	add	hl, sp
   4BAD 7E            [ 7]   86 	ld	a, (hl)
                             87 ;src/starfield/starfield.c:20: nByte &= 85;
   4BAE B7            [ 4]   88 	or	a,a
   4BAF 20 23         [12]   89 	jr	NZ,00118$
   4BB1 6F            [ 4]   90 	ld	l,a
                             91 ;src/starfield/starfield.c:22: if(nColor & 1)
   4BB2 78            [ 4]   92 	ld	a,b
   4BB3 B7            [ 4]   93 	or	a, a
   4BB4 28 02         [12]   94 	jr	Z,00102$
                             95 ;src/starfield/starfield.c:23: nByte |= 128;
   4BB6 2E 80         [ 7]   96 	ld	l,#0x80
   4BB8                      97 00102$:
                             98 ;src/starfield/starfield.c:25: if(nColor & 2)
   4BB8 7A            [ 4]   99 	ld	a,d
   4BB9 B7            [ 4]  100 	or	a, a
   4BBA 28 02         [12]  101 	jr	Z,00104$
                            102 ;src/starfield/starfield.c:26: nByte |= 8;
   4BBC CB DD         [ 8]  103 	set	3, l
   4BBE                     104 00104$:
                            105 ;src/starfield/starfield.c:28: if(nColor & 4)
   4BBE FD 21 00 00   [14]  106 	ld	iy,#0
   4BC2 FD 39         [15]  107 	add	iy,sp
   4BC4 FD 7E 00      [19]  108 	ld	a,0 (iy)
   4BC7 B7            [ 4]  109 	or	a, a
   4BC8 28 02         [12]  110 	jr	Z,00106$
                            111 ;src/starfield/starfield.c:29: nByte |= 32;
   4BCA CB ED         [ 8]  112 	set	5, l
   4BCC                     113 00106$:
                            114 ;src/starfield/starfield.c:31: if(nColor & 8)
   4BCC 7B            [ 4]  115 	ld	a,e
   4BCD B7            [ 4]  116 	or	a, a
   4BCE 28 26         [12]  117 	jr	Z,00119$
                            118 ;src/starfield/starfield.c:32: nByte |= 2;
   4BD0 CB CD         [ 8]  119 	set	1, l
   4BD2 18 22         [12]  120 	jr	00119$
   4BD4                     121 00118$:
                            122 ;src/starfield/starfield.c:36: nByte &= 170;
   4BD4 2E 00         [ 7]  123 	ld	l,#0x00
                            124 ;src/starfield/starfield.c:38: if(nColor & 1)
   4BD6 78            [ 4]  125 	ld	a,b
   4BD7 B7            [ 4]  126 	or	a, a
   4BD8 28 02         [12]  127 	jr	Z,00110$
                            128 ;src/starfield/starfield.c:39: nByte |= 64;
   4BDA 2E 40         [ 7]  129 	ld	l,#0x40
   4BDC                     130 00110$:
                            131 ;src/starfield/starfield.c:41: if(nColor & 2)
   4BDC 7A            [ 4]  132 	ld	a,d
   4BDD B7            [ 4]  133 	or	a, a
   4BDE 28 02         [12]  134 	jr	Z,00112$
                            135 ;src/starfield/starfield.c:42: nByte |= 4;
   4BE0 CB D5         [ 8]  136 	set	2, l
   4BE2                     137 00112$:
                            138 ;src/starfield/starfield.c:44: if(nColor & 4)
   4BE2 FD 21 00 00   [14]  139 	ld	iy,#0
   4BE6 FD 39         [15]  140 	add	iy,sp
   4BE8 FD 7E 00      [19]  141 	ld	a,0 (iy)
   4BEB B7            [ 4]  142 	or	a, a
   4BEC 28 02         [12]  143 	jr	Z,00114$
                            144 ;src/starfield/starfield.c:45: nByte |= 16;
   4BEE CB E5         [ 8]  145 	set	4, l
   4BF0                     146 00114$:
                            147 ;src/starfield/starfield.c:47: if(nColor & 8)
   4BF0 7B            [ 4]  148 	ld	a,e
   4BF1 B7            [ 4]  149 	or	a, a
   4BF2 28 02         [12]  150 	jr	Z,00119$
                            151 ;src/starfield/starfield.c:48: nByte |= 1;
   4BF4 CB C5         [ 8]  152 	set	0, l
   4BF6                     153 00119$:
                            154 ;src/starfield/starfield.c:51: return nByte;
   4BF6 33            [ 6]  155 	inc	sp
   4BF7 C9            [10]  156 	ret
                            157 ;src/starfield/starfield.c:58: long get_last_moved_stars(){
                            158 ;	---------------------------------
                            159 ; Function get_last_moved_stars
                            160 ; ---------------------------------
   4BF8                     161 _get_last_moved_stars::
                            162 ;src/starfield/starfield.c:59: return last_moved_stars;
   4BF8 FD 21 9A 6B   [14]  163 	ld	iy,#_last_moved_stars
   4BFC FD 6E 00      [19]  164 	ld	l,0 (iy)
   4BFF FD 21 9A 6B   [14]  165 	ld	iy,#_last_moved_stars
   4C03 FD 66 01      [19]  166 	ld	h,1 (iy)
   4C06 FD 21 9A 6B   [14]  167 	ld	iy,#_last_moved_stars
   4C0A FD 5E 02      [19]  168 	ld	e,2 (iy)
   4C0D FD 21 9A 6B   [14]  169 	ld	iy,#_last_moved_stars
   4C11 FD 56 03      [19]  170 	ld	d,3 (iy)
   4C14 C9            [10]  171 	ret
                            172 ;src/starfield/starfield.c:66: void init_stars(){
                            173 ;	---------------------------------
                            174 ; Function init_stars
                            175 ; ---------------------------------
   4C15                     176 _init_stars::
   4C15 DD E5         [15]  177 	push	ix
   4C17 DD 21 00 00   [14]  178 	ld	ix,#0
   4C1B DD 39         [15]  179 	add	ix,sp
   4C1D F5            [11]  180 	push	af
   4C1E F5            [11]  181 	push	af
                            182 ;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4C1F DD 36 FC 00   [19]  183 	ld	-4 (ix),#0x00
   4C23 DD 36 FD 00   [19]  184 	ld	-3 (ix),#0x00
   4C27 DD 36 FE 00   [19]  185 	ld	-2 (ix),#0x00
   4C2B                     186 00102$:
                            187 ;src/starfield/starfield.c:72: aStars[nStar].nX = cpct_getRandomUniform_u8_f(0) % 160;
   4C2B 3E 31         [ 7]  188 	ld	a,#<(_aStars)
   4C2D DD 86 FD      [19]  189 	add	a, -3 (ix)
   4C30 5F            [ 4]  190 	ld	e,a
   4C31 3E 6B         [ 7]  191 	ld	a,#>(_aStars)
   4C33 DD 8E FE      [19]  192 	adc	a, -2 (ix)
   4C36 57            [ 4]  193 	ld	d,a
   4C37 D5            [11]  194 	push	de
   4C38 2E 00         [ 7]  195 	ld	l,#0x00
   4C3A CD FE 54      [17]  196 	call	_cpct_getRandomUniform_u8_f
   4C3D 45            [ 4]  197 	ld	b,l
   4C3E 3E A0         [ 7]  198 	ld	a,#0xA0
   4C40 F5            [11]  199 	push	af
   4C41 33            [ 6]  200 	inc	sp
   4C42 C5            [11]  201 	push	bc
   4C43 33            [ 6]  202 	inc	sp
   4C44 CD 85 53      [17]  203 	call	__moduchar
   4C47 F1            [10]  204 	pop	af
   4C48 7D            [ 4]  205 	ld	a,l
   4C49 D1            [10]  206 	pop	de
   4C4A 12            [ 7]  207 	ld	(de),a
                            208 ;src/starfield/starfield.c:73: aStars[nStar].nY = cpct_getRandomUniform_u8_f(0) % 199;
   4C4B 4B            [ 4]  209 	ld	c, e
   4C4C 42            [ 4]  210 	ld	b, d
   4C4D 03            [ 6]  211 	inc	bc
   4C4E C5            [11]  212 	push	bc
   4C4F D5            [11]  213 	push	de
   4C50 2E 00         [ 7]  214 	ld	l,#0x00
   4C52 CD FE 54      [17]  215 	call	_cpct_getRandomUniform_u8_f
   4C55 DD 75 FF      [19]  216 	ld	-1 (ix),l
   4C58 3E C7         [ 7]  217 	ld	a,#0xC7
   4C5A F5            [11]  218 	push	af
   4C5B 33            [ 6]  219 	inc	sp
   4C5C DD 7E FF      [19]  220 	ld	a,-1 (ix)
   4C5F F5            [11]  221 	push	af
   4C60 33            [ 6]  222 	inc	sp
   4C61 CD 85 53      [17]  223 	call	__moduchar
   4C64 F1            [10]  224 	pop	af
   4C65 7D            [ 4]  225 	ld	a,l
   4C66 D1            [10]  226 	pop	de
   4C67 C1            [10]  227 	pop	bc
   4C68 02            [ 7]  228 	ld	(bc),a
                            229 ;src/starfield/starfield.c:74: aStars[nStar].nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   4C69 13            [ 6]  230 	inc	de
   4C6A 13            [ 6]  231 	inc	de
   4C6B D5            [11]  232 	push	de
   4C6C 2E 00         [ 7]  233 	ld	l,#0x00
   4C6E CD FE 54      [17]  234 	call	_cpct_getRandomUniform_u8_f
   4C71 45            [ 4]  235 	ld	b,l
   4C72 3E 03         [ 7]  236 	ld	a,#0x03
   4C74 F5            [11]  237 	push	af
   4C75 33            [ 6]  238 	inc	sp
   4C76 C5            [11]  239 	push	bc
   4C77 33            [ 6]  240 	inc	sp
   4C78 CD 85 53      [17]  241 	call	__moduchar
   4C7B F1            [10]  242 	pop	af
   4C7C 7D            [ 4]  243 	ld	a,l
   4C7D D1            [10]  244 	pop	de
   4C7E 12            [ 7]  245 	ld	(de),a
                            246 ;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4C7F DD 7E FD      [19]  247 	ld	a,-3 (ix)
   4C82 C6 07         [ 7]  248 	add	a, #0x07
   4C84 DD 77 FD      [19]  249 	ld	-3 (ix),a
   4C87 DD 7E FE      [19]  250 	ld	a,-2 (ix)
   4C8A CE 00         [ 7]  251 	adc	a, #0x00
   4C8C DD 77 FE      [19]  252 	ld	-2 (ix),a
   4C8F DD 34 FC      [23]  253 	inc	-4 (ix)
   4C92 DD 7E FC      [19]  254 	ld	a,-4 (ix)
   4C95 D6 0F         [ 7]  255 	sub	a, #0x0F
   4C97 38 92         [12]  256 	jr	C,00102$
                            257 ;src/starfield/starfield.c:76: last_moved_stars = 0;
   4C99 AF            [ 4]  258 	xor	a, a
   4C9A 32 9A 6B      [13]  259 	ld	(#_last_moved_stars + 0),a
   4C9D 32 9B 6B      [13]  260 	ld	(#_last_moved_stars + 1),a
   4CA0 32 9C 6B      [13]  261 	ld	(#_last_moved_stars + 2),a
   4CA3 32 9D 6B      [13]  262 	ld	(#_last_moved_stars + 3),a
   4CA6 DD F9         [10]  263 	ld	sp, ix
   4CA8 DD E1         [14]  264 	pop	ix
   4CAA C9            [10]  265 	ret
                            266 ;src/starfield/starfield.c:82: void draw_stars(u8* screen){
                            267 ;	---------------------------------
                            268 ; Function draw_stars
                            269 ; ---------------------------------
   4CAB                     270 _draw_stars::
   4CAB DD E5         [15]  271 	push	ix
   4CAD DD 21 00 00   [14]  272 	ld	ix,#0
   4CB1 DD 39         [15]  273 	add	ix,sp
   4CB3 21 F6 FF      [10]  274 	ld	hl,#-10
   4CB6 39            [11]  275 	add	hl,sp
   4CB7 F9            [ 6]  276 	ld	sp,hl
                            277 ;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4CB8 DD 36 F6 00   [19]  278 	ld	-10 (ix),#0x00
   4CBC DD 36 FE 00   [19]  279 	ld	-2 (ix),#0x00
   4CC0 DD 36 FF 00   [19]  280 	ld	-1 (ix),#0x00
   4CC4                     281 00102$:
                            282 ;src/starfield/starfield.c:88: pStar = &aStars[nStar];
   4CC4 3E 31         [ 7]  283 	ld	a,#<(_aStars)
   4CC6 DD 86 FE      [19]  284 	add	a, -2 (ix)
   4CC9 4F            [ 4]  285 	ld	c,a
   4CCA 3E 6B         [ 7]  286 	ld	a,#>(_aStars)
   4CCC DD 8E FF      [19]  287 	adc	a, -1 (ix)
   4CCF 47            [ 4]  288 	ld	b,a
                            289 ;src/starfield/starfield.c:90: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   4CD0 21 05 00      [10]  290 	ld	hl,#0x0005
   4CD3 09            [11]  291 	add	hl,bc
   4CD4 DD 75 FC      [19]  292 	ld	-4 (ix),l
   4CD7 DD 74 FD      [19]  293 	ld	-3 (ix),h
   4CDA 69            [ 4]  294 	ld	l, c
   4CDB 60            [ 4]  295 	ld	h, b
   4CDC 23            [ 6]  296 	inc	hl
   4CDD 5E            [ 7]  297 	ld	e,(hl)
   4CDE 0A            [ 7]  298 	ld	a,(bc)
   4CDF 67            [ 4]  299 	ld	h,a
   4CE0 DD 6E 04      [19]  300 	ld	l,4 (ix)
   4CE3 DD 56 05      [19]  301 	ld	d,5 (ix)
   4CE6 C5            [11]  302 	push	bc
   4CE7 7B            [ 4]  303 	ld	a,e
   4CE8 F5            [11]  304 	push	af
   4CE9 33            [ 6]  305 	inc	sp
   4CEA E5            [11]  306 	push	hl
   4CEB 33            [ 6]  307 	inc	sp
   4CEC 62            [ 4]  308 	ld	h, d
   4CED E5            [11]  309 	push	hl
   4CEE CD 25 56      [17]  310 	call	_cpct_getScreenPtr
   4CF1 EB            [ 4]  311 	ex	de,hl
   4CF2 C1            [10]  312 	pop	bc
   4CF3 DD 6E FC      [19]  313 	ld	l,-4 (ix)
   4CF6 DD 66 FD      [19]  314 	ld	h,-3 (ix)
   4CF9 73            [ 7]  315 	ld	(hl),e
   4CFA 23            [ 6]  316 	inc	hl
   4CFB 72            [ 7]  317 	ld	(hl),d
                            318 ;src/starfield/starfield.c:91: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   4CFC 1A            [ 7]  319 	ld	a,(de)
   4CFD DD 77 FC      [19]  320 	ld	-4 (ix),a
   4D00 0A            [ 7]  321 	ld	a,(bc)
   4D01 E6 01         [ 7]  322 	and	a, #0x01
   4D03 DD 77 FB      [19]  323 	ld	-5 (ix),a
   4D06 69            [ 4]  324 	ld	l, c
   4D07 60            [ 4]  325 	ld	h, b
   4D08 23            [ 6]  326 	inc	hl
   4D09 23            [ 6]  327 	inc	hl
   4D0A 46            [ 7]  328 	ld	b,(hl)
   4D0B 04            [ 4]  329 	inc	b
   4D0C D5            [11]  330 	push	de
   4D0D DD 7E FB      [19]  331 	ld	a,-5 (ix)
   4D10 F5            [11]  332 	push	af
   4D11 33            [ 6]  333 	inc	sp
   4D12 C5            [11]  334 	push	bc
   4D13 33            [ 6]  335 	inc	sp
   4D14 CD 88 4B      [17]  336 	call	_get_mode0_pixel_color_byte
   4D17 F1            [10]  337 	pop	af
   4D18 7D            [ 4]  338 	ld	a,l
   4D19 D1            [10]  339 	pop	de
   4D1A DD AE FC      [19]  340 	xor	a, -4 (ix)
   4D1D 12            [ 7]  341 	ld	(de),a
                            342 ;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4D1E DD 7E FE      [19]  343 	ld	a,-2 (ix)
   4D21 C6 07         [ 7]  344 	add	a, #0x07
   4D23 DD 77 FE      [19]  345 	ld	-2 (ix),a
   4D26 DD 7E FF      [19]  346 	ld	a,-1 (ix)
   4D29 CE 00         [ 7]  347 	adc	a, #0x00
   4D2B DD 77 FF      [19]  348 	ld	-1 (ix),a
   4D2E DD 34 F6      [23]  349 	inc	-10 (ix)
   4D31 DD 7E F6      [19]  350 	ld	a,-10 (ix)
   4D34 D6 0F         [ 7]  351 	sub	a, #0x0F
   4D36 38 8C         [12]  352 	jr	C,00102$
                            353 ;src/starfield/starfield.c:93: last_moved_stars = get_time();
   4D38 CD 51 4E      [17]  354 	call	_get_time
   4D3B DD 72 FA      [19]  355 	ld	-6 (ix),d
   4D3E DD 73 F9      [19]  356 	ld	-7 (ix),e
   4D41 DD 74 F8      [19]  357 	ld	-8 (ix),h
   4D44 DD 75 F7      [19]  358 	ld	-9 (ix),l
   4D47 11 9A 6B      [10]  359 	ld	de, #_last_moved_stars
   4D4A 21 01 00      [10]  360 	ld	hl, #1
   4D4D 39            [11]  361 	add	hl, sp
   4D4E 01 04 00      [10]  362 	ld	bc, #4
   4D51 ED B0         [21]  363 	ldir
   4D53 DD F9         [10]  364 	ld	sp, ix
   4D55 DD E1         [14]  365 	pop	ix
   4D57 C9            [10]  366 	ret
                            367 ;src/starfield/starfield.c:99: void update_stars(){
                            368 ;	---------------------------------
                            369 ; Function update_stars
                            370 ; ---------------------------------
   4D58                     371 _update_stars::
   4D58 DD E5         [15]  372 	push	ix
   4D5A DD 21 00 00   [14]  373 	ld	ix,#0
   4D5E DD 39         [15]  374 	add	ix,sp
   4D60 21 F8 FF      [10]  375 	ld	hl,#-8
   4D63 39            [11]  376 	add	hl,sp
   4D64 F9            [ 6]  377 	ld	sp,hl
                            378 ;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4D65 DD 36 F8 00   [19]  379 	ld	-8 (ix),#0x00
   4D69 DD 36 FE 00   [19]  380 	ld	-2 (ix),#0x00
   4D6D DD 36 FF 00   [19]  381 	ld	-1 (ix),#0x00
   4D71                     382 00108$:
                            383 ;src/starfield/starfield.c:106: pStar = &aStars[nStar];
   4D71 3E 31         [ 7]  384 	ld	a,#<(_aStars)
   4D73 DD 86 FE      [19]  385 	add	a, -2 (ix)
   4D76 4F            [ 4]  386 	ld	c,a
   4D77 3E 6B         [ 7]  387 	ld	a,#>(_aStars)
   4D79 DD 8E FF      [19]  388 	adc	a, -1 (ix)
   4D7C 47            [ 4]  389 	ld	b,a
                            390 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4D7D 21 02 00      [10]  391 	ld	hl,#0x0002
   4D80 09            [11]  392 	add	hl,bc
   4D81 DD 75 FC      [19]  393 	ld	-4 (ix),l
   4D84 DD 74 FD      [19]  394 	ld	-3 (ix),h
   4D87 DD 6E FC      [19]  395 	ld	l,-4 (ix)
   4D8A DD 66 FD      [19]  396 	ld	h,-3 (ix)
   4D8D 7E            [ 7]  397 	ld	a,(hl)
   4D8E DD 77 FB      [19]  398 	ld	-5 (ix),a
                            399 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4D91 59            [ 4]  400 	ld	e, c
   4D92 50            [ 4]  401 	ld	d, b
   4D93 13            [ 6]  402 	inc	de
                            403 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4D94 3E 02         [ 7]  404 	ld	a,#0x02
   4D96 DD 96 FB      [19]  405 	sub	a, -5 (ix)
   4D99 38 2D         [12]  406 	jr	C,00104$
                            407 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4D9B 1A            [ 7]  408 	ld	a,(de)
   4D9C DD 77 FA      [19]  409 	ld	-6 (ix), a
   4D9F 3C            [ 4]  410 	inc	a
   4DA0 DD 77 F9      [19]  411 	ld	-7 (ix),a
                            412 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4DA3 D5            [11]  413 	push	de
   4DA4 DD 5E FB      [19]  414 	ld	e,-5 (ix)
   4DA7 16 00         [ 7]  415 	ld	d,#0x00
   4DA9 21 B0 4D      [10]  416 	ld	hl,#00125$
   4DAC 19            [11]  417 	add	hl,de
   4DAD 19            [11]  418 	add	hl,de
                            419 ;src/starfield/starfield.c:110: case 0: //slow star
   4DAE D1            [10]  420 	pop	de
   4DAF E9            [ 4]  421 	jp	(hl)
   4DB0                     422 00125$:
   4DB0 18 04         [12]  423 	jr	00101$
   4DB2 18 08         [12]  424 	jr	00102$
   4DB4 18 0C         [12]  425 	jr	00103$
   4DB6                     426 00101$:
                            427 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4DB6 DD 7E F9      [19]  428 	ld	a,-7 (ix)
   4DB9 12            [ 7]  429 	ld	(de),a
                            430 ;src/starfield/starfield.c:112: break;
   4DBA 18 0C         [12]  431 	jr	00104$
                            432 ;src/starfield/starfield.c:113: case 1: //medium star
   4DBC                     433 00102$:
                            434 ;src/starfield/starfield.c:114: pStar->nY += 1;
   4DBC DD 7E F9      [19]  435 	ld	a,-7 (ix)
   4DBF 12            [ 7]  436 	ld	(de),a
                            437 ;src/starfield/starfield.c:115: break;
   4DC0 18 06         [12]  438 	jr	00104$
                            439 ;src/starfield/starfield.c:116: case 2: //fast star
   4DC2                     440 00103$:
                            441 ;src/starfield/starfield.c:117: pStar->nY += 2;
   4DC2 DD 7E FA      [19]  442 	ld	a,-6 (ix)
   4DC5 C6 02         [ 7]  443 	add	a, #0x02
   4DC7 12            [ 7]  444 	ld	(de),a
                            445 ;src/starfield/starfield.c:119: }
   4DC8                     446 00104$:
                            447 ;src/starfield/starfield.c:121: if(pStar->nY >= 198)
   4DC8 1A            [ 7]  448 	ld	a,(de)
   4DC9 D6 C6         [ 7]  449 	sub	a, #0xC6
   4DCB 38 2E         [12]  450 	jr	C,00109$
                            451 ;src/starfield/starfield.c:123: pStar->nY = 0;
   4DCD AF            [ 4]  452 	xor	a, a
   4DCE 12            [ 7]  453 	ld	(de),a
                            454 ;src/starfield/starfield.c:124: pStar->nX = cpct_getRandomUniform_u8_f(0) % 160;
   4DCF C5            [11]  455 	push	bc
   4DD0 2E 00         [ 7]  456 	ld	l,#0x00
   4DD2 CD FE 54      [17]  457 	call	_cpct_getRandomUniform_u8_f
   4DD5 55            [ 4]  458 	ld	d,l
   4DD6 3E A0         [ 7]  459 	ld	a,#0xA0
   4DD8 F5            [11]  460 	push	af
   4DD9 33            [ 6]  461 	inc	sp
   4DDA D5            [11]  462 	push	de
   4DDB 33            [ 6]  463 	inc	sp
   4DDC CD 85 53      [17]  464 	call	__moduchar
   4DDF F1            [10]  465 	pop	af
   4DE0 7D            [ 4]  466 	ld	a,l
   4DE1 C1            [10]  467 	pop	bc
   4DE2 02            [ 7]  468 	ld	(bc),a
                            469 ;src/starfield/starfield.c:125: pStar->nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   4DE3 2E 00         [ 7]  470 	ld	l,#0x00
   4DE5 CD FE 54      [17]  471 	call	_cpct_getRandomUniform_u8_f
   4DE8 55            [ 4]  472 	ld	d,l
   4DE9 3E 03         [ 7]  473 	ld	a,#0x03
   4DEB F5            [11]  474 	push	af
   4DEC 33            [ 6]  475 	inc	sp
   4DED D5            [11]  476 	push	de
   4DEE 33            [ 6]  477 	inc	sp
   4DEF CD 85 53      [17]  478 	call	__moduchar
   4DF2 F1            [10]  479 	pop	af
   4DF3 7D            [ 4]  480 	ld	a,l
   4DF4 DD 6E FC      [19]  481 	ld	l,-4 (ix)
   4DF7 DD 66 FD      [19]  482 	ld	h,-3 (ix)
   4DFA 77            [ 7]  483 	ld	(hl),a
   4DFB                     484 00109$:
                            485 ;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4DFB DD 7E FE      [19]  486 	ld	a,-2 (ix)
   4DFE C6 07         [ 7]  487 	add	a, #0x07
   4E00 DD 77 FE      [19]  488 	ld	-2 (ix),a
   4E03 DD 7E FF      [19]  489 	ld	a,-1 (ix)
   4E06 CE 00         [ 7]  490 	adc	a, #0x00
   4E08 DD 77 FF      [19]  491 	ld	-1 (ix),a
   4E0B DD 34 F8      [23]  492 	inc	-8 (ix)
   4E0E DD 7E F8      [19]  493 	ld	a,-8 (ix)
   4E11 D6 0F         [ 7]  494 	sub	a, #0x0F
   4E13 DA 71 4D      [10]  495 	jp	C,00108$
   4E16 DD F9         [10]  496 	ld	sp, ix
   4E18 DD E1         [14]  497 	pop	ix
   4E1A C9            [10]  498 	ret
                            499 	.area _CODE
                            500 	.area _INITIALIZER
                            501 	.area _CABS (ABS)
