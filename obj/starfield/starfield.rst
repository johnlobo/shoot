                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:47:07 2015
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
   6B95                      29 _aStars::
   6B95                      30 	.ds 105
   6BFE                      31 _last_moved_stars::
   6BFE                      32 	.ds 4
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
   4BFA                      61 _get_mode0_pixel_color_byte::
   4BFA 3B            [ 6]   62 	dec	sp
                             63 ;src/starfield/starfield.c:22: if(nColor & 1)
   4BFB FD 21 03 00   [14]   64 	ld	iy,#3
   4BFF FD 39         [15]   65 	add	iy,sp
   4C01 FD 7E 00      [19]   66 	ld	a,0 (iy)
   4C04 E6 01         [ 7]   67 	and	a, #0x01
   4C06 47            [ 4]   68 	ld	b,a
                             69 ;src/starfield/starfield.c:25: if(nColor & 2)
   4C07 FD 7E 00      [19]   70 	ld	a,0 (iy)
   4C0A E6 02         [ 7]   71 	and	a, #0x02
   4C0C 57            [ 4]   72 	ld	d,a
                             73 ;src/starfield/starfield.c:28: if(nColor & 4)
   4C0D FD 7E 00      [19]   74 	ld	a,0 (iy)
   4C10 E6 04         [ 7]   75 	and	a, #0x04
   4C12 33            [ 6]   76 	inc	sp
   4C13 F5            [11]   77 	push	af
   4C14 33            [ 6]   78 	inc	sp
                             79 ;src/starfield/starfield.c:31: if(nColor & 8)
   4C15 FD 7E 00      [19]   80 	ld	a,0 (iy)
   4C18 E6 08         [ 7]   81 	and	a, #0x08
   4C1A 5F            [ 4]   82 	ld	e,a
                             83 ;src/starfield/starfield.c:18: if(nPixel == 0)
   4C1B 21 04 00      [10]   84 	ld	hl, #4+0
   4C1E 39            [11]   85 	add	hl, sp
   4C1F 7E            [ 7]   86 	ld	a, (hl)
                             87 ;src/starfield/starfield.c:20: nByte &= 85;
   4C20 B7            [ 4]   88 	or	a,a
   4C21 20 23         [12]   89 	jr	NZ,00118$
   4C23 6F            [ 4]   90 	ld	l,a
                             91 ;src/starfield/starfield.c:22: if(nColor & 1)
   4C24 78            [ 4]   92 	ld	a,b
   4C25 B7            [ 4]   93 	or	a, a
   4C26 28 02         [12]   94 	jr	Z,00102$
                             95 ;src/starfield/starfield.c:23: nByte |= 128;
   4C28 2E 80         [ 7]   96 	ld	l,#0x80
   4C2A                      97 00102$:
                             98 ;src/starfield/starfield.c:25: if(nColor & 2)
   4C2A 7A            [ 4]   99 	ld	a,d
   4C2B B7            [ 4]  100 	or	a, a
   4C2C 28 02         [12]  101 	jr	Z,00104$
                            102 ;src/starfield/starfield.c:26: nByte |= 8;
   4C2E CB DD         [ 8]  103 	set	3, l
   4C30                     104 00104$:
                            105 ;src/starfield/starfield.c:28: if(nColor & 4)
   4C30 FD 21 00 00   [14]  106 	ld	iy,#0
   4C34 FD 39         [15]  107 	add	iy,sp
   4C36 FD 7E 00      [19]  108 	ld	a,0 (iy)
   4C39 B7            [ 4]  109 	or	a, a
   4C3A 28 02         [12]  110 	jr	Z,00106$
                            111 ;src/starfield/starfield.c:29: nByte |= 32;
   4C3C CB ED         [ 8]  112 	set	5, l
   4C3E                     113 00106$:
                            114 ;src/starfield/starfield.c:31: if(nColor & 8)
   4C3E 7B            [ 4]  115 	ld	a,e
   4C3F B7            [ 4]  116 	or	a, a
   4C40 28 26         [12]  117 	jr	Z,00119$
                            118 ;src/starfield/starfield.c:32: nByte |= 2;
   4C42 CB CD         [ 8]  119 	set	1, l
   4C44 18 22         [12]  120 	jr	00119$
   4C46                     121 00118$:
                            122 ;src/starfield/starfield.c:36: nByte &= 170;
   4C46 2E 00         [ 7]  123 	ld	l,#0x00
                            124 ;src/starfield/starfield.c:38: if(nColor & 1)
   4C48 78            [ 4]  125 	ld	a,b
   4C49 B7            [ 4]  126 	or	a, a
   4C4A 28 02         [12]  127 	jr	Z,00110$
                            128 ;src/starfield/starfield.c:39: nByte |= 64;
   4C4C 2E 40         [ 7]  129 	ld	l,#0x40
   4C4E                     130 00110$:
                            131 ;src/starfield/starfield.c:41: if(nColor & 2)
   4C4E 7A            [ 4]  132 	ld	a,d
   4C4F B7            [ 4]  133 	or	a, a
   4C50 28 02         [12]  134 	jr	Z,00112$
                            135 ;src/starfield/starfield.c:42: nByte |= 4;
   4C52 CB D5         [ 8]  136 	set	2, l
   4C54                     137 00112$:
                            138 ;src/starfield/starfield.c:44: if(nColor & 4)
   4C54 FD 21 00 00   [14]  139 	ld	iy,#0
   4C58 FD 39         [15]  140 	add	iy,sp
   4C5A FD 7E 00      [19]  141 	ld	a,0 (iy)
   4C5D B7            [ 4]  142 	or	a, a
   4C5E 28 02         [12]  143 	jr	Z,00114$
                            144 ;src/starfield/starfield.c:45: nByte |= 16;
   4C60 CB E5         [ 8]  145 	set	4, l
   4C62                     146 00114$:
                            147 ;src/starfield/starfield.c:47: if(nColor & 8)
   4C62 7B            [ 4]  148 	ld	a,e
   4C63 B7            [ 4]  149 	or	a, a
   4C64 28 02         [12]  150 	jr	Z,00119$
                            151 ;src/starfield/starfield.c:48: nByte |= 1;
   4C66 CB C5         [ 8]  152 	set	0, l
   4C68                     153 00119$:
                            154 ;src/starfield/starfield.c:51: return nByte;
   4C68 33            [ 6]  155 	inc	sp
   4C69 C9            [10]  156 	ret
                            157 ;src/starfield/starfield.c:58: long get_last_moved_stars(){
                            158 ;	---------------------------------
                            159 ; Function get_last_moved_stars
                            160 ; ---------------------------------
   4C6A                     161 _get_last_moved_stars::
                            162 ;src/starfield/starfield.c:59: return last_moved_stars;
   4C6A FD 21 FE 6B   [14]  163 	ld	iy,#_last_moved_stars
   4C6E FD 6E 00      [19]  164 	ld	l,0 (iy)
   4C71 FD 21 FE 6B   [14]  165 	ld	iy,#_last_moved_stars
   4C75 FD 66 01      [19]  166 	ld	h,1 (iy)
   4C78 FD 21 FE 6B   [14]  167 	ld	iy,#_last_moved_stars
   4C7C FD 5E 02      [19]  168 	ld	e,2 (iy)
   4C7F FD 21 FE 6B   [14]  169 	ld	iy,#_last_moved_stars
   4C83 FD 56 03      [19]  170 	ld	d,3 (iy)
   4C86 C9            [10]  171 	ret
                            172 ;src/starfield/starfield.c:66: void init_stars(){
                            173 ;	---------------------------------
                            174 ; Function init_stars
                            175 ; ---------------------------------
   4C87                     176 _init_stars::
   4C87 DD E5         [15]  177 	push	ix
   4C89 DD 21 00 00   [14]  178 	ld	ix,#0
   4C8D DD 39         [15]  179 	add	ix,sp
   4C8F F5            [11]  180 	push	af
   4C90 F5            [11]  181 	push	af
                            182 ;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4C91 DD 36 FC 00   [19]  183 	ld	-4 (ix),#0x00
   4C95 DD 36 FD 00   [19]  184 	ld	-3 (ix),#0x00
   4C99 DD 36 FE 00   [19]  185 	ld	-2 (ix),#0x00
   4C9D                     186 00102$:
                            187 ;src/starfield/starfield.c:72: aStars[nStar].nX = cpct_getRandomUniform_u8_f(0) % 160;
   4C9D 3E 95         [ 7]  188 	ld	a,#<(_aStars)
   4C9F DD 86 FD      [19]  189 	add	a, -3 (ix)
   4CA2 5F            [ 4]  190 	ld	e,a
   4CA3 3E 6B         [ 7]  191 	ld	a,#>(_aStars)
   4CA5 DD 8E FE      [19]  192 	adc	a, -2 (ix)
   4CA8 57            [ 4]  193 	ld	d,a
   4CA9 D5            [11]  194 	push	de
   4CAA 2E 00         [ 7]  195 	ld	l,#0x00
   4CAC CD 62 55      [17]  196 	call	_cpct_getRandomUniform_u8_f
   4CAF 45            [ 4]  197 	ld	b,l
   4CB0 3E A0         [ 7]  198 	ld	a,#0xA0
   4CB2 F5            [11]  199 	push	af
   4CB3 33            [ 6]  200 	inc	sp
   4CB4 C5            [11]  201 	push	bc
   4CB5 33            [ 6]  202 	inc	sp
   4CB6 CD EE 53      [17]  203 	call	__moduchar
   4CB9 F1            [10]  204 	pop	af
   4CBA 7D            [ 4]  205 	ld	a,l
   4CBB D1            [10]  206 	pop	de
   4CBC 12            [ 7]  207 	ld	(de),a
                            208 ;src/starfield/starfield.c:73: aStars[nStar].nY = cpct_getRandomUniform_u8_f(0) % 199;
   4CBD 4B            [ 4]  209 	ld	c, e
   4CBE 42            [ 4]  210 	ld	b, d
   4CBF 03            [ 6]  211 	inc	bc
   4CC0 C5            [11]  212 	push	bc
   4CC1 D5            [11]  213 	push	de
   4CC2 2E 00         [ 7]  214 	ld	l,#0x00
   4CC4 CD 62 55      [17]  215 	call	_cpct_getRandomUniform_u8_f
   4CC7 DD 75 FF      [19]  216 	ld	-1 (ix),l
   4CCA 3E C7         [ 7]  217 	ld	a,#0xC7
   4CCC F5            [11]  218 	push	af
   4CCD 33            [ 6]  219 	inc	sp
   4CCE DD 7E FF      [19]  220 	ld	a,-1 (ix)
   4CD1 F5            [11]  221 	push	af
   4CD2 33            [ 6]  222 	inc	sp
   4CD3 CD EE 53      [17]  223 	call	__moduchar
   4CD6 F1            [10]  224 	pop	af
   4CD7 7D            [ 4]  225 	ld	a,l
   4CD8 D1            [10]  226 	pop	de
   4CD9 C1            [10]  227 	pop	bc
   4CDA 02            [ 7]  228 	ld	(bc),a
                            229 ;src/starfield/starfield.c:74: aStars[nStar].nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   4CDB 13            [ 6]  230 	inc	de
   4CDC 13            [ 6]  231 	inc	de
   4CDD D5            [11]  232 	push	de
   4CDE 2E 00         [ 7]  233 	ld	l,#0x00
   4CE0 CD 62 55      [17]  234 	call	_cpct_getRandomUniform_u8_f
   4CE3 45            [ 4]  235 	ld	b,l
   4CE4 3E 03         [ 7]  236 	ld	a,#0x03
   4CE6 F5            [11]  237 	push	af
   4CE7 33            [ 6]  238 	inc	sp
   4CE8 C5            [11]  239 	push	bc
   4CE9 33            [ 6]  240 	inc	sp
   4CEA CD EE 53      [17]  241 	call	__moduchar
   4CED F1            [10]  242 	pop	af
   4CEE 7D            [ 4]  243 	ld	a,l
   4CEF D1            [10]  244 	pop	de
   4CF0 12            [ 7]  245 	ld	(de),a
                            246 ;src/starfield/starfield.c:70: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4CF1 DD 7E FD      [19]  247 	ld	a,-3 (ix)
   4CF4 C6 07         [ 7]  248 	add	a, #0x07
   4CF6 DD 77 FD      [19]  249 	ld	-3 (ix),a
   4CF9 DD 7E FE      [19]  250 	ld	a,-2 (ix)
   4CFC CE 00         [ 7]  251 	adc	a, #0x00
   4CFE DD 77 FE      [19]  252 	ld	-2 (ix),a
   4D01 DD 34 FC      [23]  253 	inc	-4 (ix)
   4D04 DD 7E FC      [19]  254 	ld	a,-4 (ix)
   4D07 D6 0F         [ 7]  255 	sub	a, #0x0F
   4D09 38 92         [12]  256 	jr	C,00102$
                            257 ;src/starfield/starfield.c:76: last_moved_stars = 0;
   4D0B AF            [ 4]  258 	xor	a, a
   4D0C 32 FE 6B      [13]  259 	ld	(#_last_moved_stars + 0),a
   4D0F 32 FF 6B      [13]  260 	ld	(#_last_moved_stars + 1),a
   4D12 32 00 6C      [13]  261 	ld	(#_last_moved_stars + 2),a
   4D15 32 01 6C      [13]  262 	ld	(#_last_moved_stars + 3),a
   4D18 DD F9         [10]  263 	ld	sp, ix
   4D1A DD E1         [14]  264 	pop	ix
   4D1C C9            [10]  265 	ret
                            266 ;src/starfield/starfield.c:82: void draw_stars(u8* screen){
                            267 ;	---------------------------------
                            268 ; Function draw_stars
                            269 ; ---------------------------------
   4D1D                     270 _draw_stars::
   4D1D DD E5         [15]  271 	push	ix
   4D1F DD 21 00 00   [14]  272 	ld	ix,#0
   4D23 DD 39         [15]  273 	add	ix,sp
   4D25 21 F6 FF      [10]  274 	ld	hl,#-10
   4D28 39            [11]  275 	add	hl,sp
   4D29 F9            [ 6]  276 	ld	sp,hl
                            277 ;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4D2A DD 36 F6 00   [19]  278 	ld	-10 (ix),#0x00
   4D2E DD 36 FE 00   [19]  279 	ld	-2 (ix),#0x00
   4D32 DD 36 FF 00   [19]  280 	ld	-1 (ix),#0x00
   4D36                     281 00102$:
                            282 ;src/starfield/starfield.c:88: pStar = &aStars[nStar];
   4D36 3E 95         [ 7]  283 	ld	a,#<(_aStars)
   4D38 DD 86 FE      [19]  284 	add	a, -2 (ix)
   4D3B 4F            [ 4]  285 	ld	c,a
   4D3C 3E 6B         [ 7]  286 	ld	a,#>(_aStars)
   4D3E DD 8E FF      [19]  287 	adc	a, -1 (ix)
   4D41 47            [ 4]  288 	ld	b,a
                            289 ;src/starfield/starfield.c:90: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   4D42 21 05 00      [10]  290 	ld	hl,#0x0005
   4D45 09            [11]  291 	add	hl,bc
   4D46 DD 75 FC      [19]  292 	ld	-4 (ix),l
   4D49 DD 74 FD      [19]  293 	ld	-3 (ix),h
   4D4C 69            [ 4]  294 	ld	l, c
   4D4D 60            [ 4]  295 	ld	h, b
   4D4E 23            [ 6]  296 	inc	hl
   4D4F 5E            [ 7]  297 	ld	e,(hl)
   4D50 0A            [ 7]  298 	ld	a,(bc)
   4D51 67            [ 4]  299 	ld	h,a
   4D52 DD 6E 04      [19]  300 	ld	l,4 (ix)
   4D55 DD 56 05      [19]  301 	ld	d,5 (ix)
   4D58 C5            [11]  302 	push	bc
   4D59 7B            [ 4]  303 	ld	a,e
   4D5A F5            [11]  304 	push	af
   4D5B 33            [ 6]  305 	inc	sp
   4D5C E5            [11]  306 	push	hl
   4D5D 33            [ 6]  307 	inc	sp
   4D5E 62            [ 4]  308 	ld	h, d
   4D5F E5            [11]  309 	push	hl
   4D60 CD 89 56      [17]  310 	call	_cpct_getScreenPtr
   4D63 EB            [ 4]  311 	ex	de,hl
   4D64 C1            [10]  312 	pop	bc
   4D65 DD 6E FC      [19]  313 	ld	l,-4 (ix)
   4D68 DD 66 FD      [19]  314 	ld	h,-3 (ix)
   4D6B 73            [ 7]  315 	ld	(hl),e
   4D6C 23            [ 6]  316 	inc	hl
   4D6D 72            [ 7]  317 	ld	(hl),d
                            318 ;src/starfield/starfield.c:91: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   4D6E 1A            [ 7]  319 	ld	a,(de)
   4D6F DD 77 FC      [19]  320 	ld	-4 (ix),a
   4D72 0A            [ 7]  321 	ld	a,(bc)
   4D73 E6 01         [ 7]  322 	and	a, #0x01
   4D75 DD 77 FB      [19]  323 	ld	-5 (ix),a
   4D78 69            [ 4]  324 	ld	l, c
   4D79 60            [ 4]  325 	ld	h, b
   4D7A 23            [ 6]  326 	inc	hl
   4D7B 23            [ 6]  327 	inc	hl
   4D7C 46            [ 7]  328 	ld	b,(hl)
   4D7D 04            [ 4]  329 	inc	b
   4D7E D5            [11]  330 	push	de
   4D7F DD 7E FB      [19]  331 	ld	a,-5 (ix)
   4D82 F5            [11]  332 	push	af
   4D83 33            [ 6]  333 	inc	sp
   4D84 C5            [11]  334 	push	bc
   4D85 33            [ 6]  335 	inc	sp
   4D86 CD FA 4B      [17]  336 	call	_get_mode0_pixel_color_byte
   4D89 F1            [10]  337 	pop	af
   4D8A 7D            [ 4]  338 	ld	a,l
   4D8B D1            [10]  339 	pop	de
   4D8C DD AE FC      [19]  340 	xor	a, -4 (ix)
   4D8F 12            [ 7]  341 	ld	(de),a
                            342 ;src/starfield/starfield.c:86: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4D90 DD 7E FE      [19]  343 	ld	a,-2 (ix)
   4D93 C6 07         [ 7]  344 	add	a, #0x07
   4D95 DD 77 FE      [19]  345 	ld	-2 (ix),a
   4D98 DD 7E FF      [19]  346 	ld	a,-1 (ix)
   4D9B CE 00         [ 7]  347 	adc	a, #0x00
   4D9D DD 77 FF      [19]  348 	ld	-1 (ix),a
   4DA0 DD 34 F6      [23]  349 	inc	-10 (ix)
   4DA3 DD 7E F6      [19]  350 	ld	a,-10 (ix)
   4DA6 D6 0F         [ 7]  351 	sub	a, #0x0F
   4DA8 38 8C         [12]  352 	jr	C,00102$
                            353 ;src/starfield/starfield.c:93: last_moved_stars = get_time();
   4DAA CD C3 4E      [17]  354 	call	_get_time
   4DAD DD 72 FA      [19]  355 	ld	-6 (ix),d
   4DB0 DD 73 F9      [19]  356 	ld	-7 (ix),e
   4DB3 DD 74 F8      [19]  357 	ld	-8 (ix),h
   4DB6 DD 75 F7      [19]  358 	ld	-9 (ix),l
   4DB9 11 FE 6B      [10]  359 	ld	de, #_last_moved_stars
   4DBC 21 01 00      [10]  360 	ld	hl, #1
   4DBF 39            [11]  361 	add	hl, sp
   4DC0 01 04 00      [10]  362 	ld	bc, #4
   4DC3 ED B0         [21]  363 	ldir
   4DC5 DD F9         [10]  364 	ld	sp, ix
   4DC7 DD E1         [14]  365 	pop	ix
   4DC9 C9            [10]  366 	ret
                            367 ;src/starfield/starfield.c:99: void update_stars(){
                            368 ;	---------------------------------
                            369 ; Function update_stars
                            370 ; ---------------------------------
   4DCA                     371 _update_stars::
   4DCA DD E5         [15]  372 	push	ix
   4DCC DD 21 00 00   [14]  373 	ld	ix,#0
   4DD0 DD 39         [15]  374 	add	ix,sp
   4DD2 21 F8 FF      [10]  375 	ld	hl,#-8
   4DD5 39            [11]  376 	add	hl,sp
   4DD6 F9            [ 6]  377 	ld	sp,hl
                            378 ;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4DD7 DD 36 F8 00   [19]  379 	ld	-8 (ix),#0x00
   4DDB DD 36 FE 00   [19]  380 	ld	-2 (ix),#0x00
   4DDF DD 36 FF 00   [19]  381 	ld	-1 (ix),#0x00
   4DE3                     382 00108$:
                            383 ;src/starfield/starfield.c:106: pStar = &aStars[nStar];
   4DE3 3E 95         [ 7]  384 	ld	a,#<(_aStars)
   4DE5 DD 86 FE      [19]  385 	add	a, -2 (ix)
   4DE8 4F            [ 4]  386 	ld	c,a
   4DE9 3E 6B         [ 7]  387 	ld	a,#>(_aStars)
   4DEB DD 8E FF      [19]  388 	adc	a, -1 (ix)
   4DEE 47            [ 4]  389 	ld	b,a
                            390 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4DEF 21 02 00      [10]  391 	ld	hl,#0x0002
   4DF2 09            [11]  392 	add	hl,bc
   4DF3 DD 75 FC      [19]  393 	ld	-4 (ix),l
   4DF6 DD 74 FD      [19]  394 	ld	-3 (ix),h
   4DF9 DD 6E FC      [19]  395 	ld	l,-4 (ix)
   4DFC DD 66 FD      [19]  396 	ld	h,-3 (ix)
   4DFF 7E            [ 7]  397 	ld	a,(hl)
   4E00 DD 77 FB      [19]  398 	ld	-5 (ix),a
                            399 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4E03 59            [ 4]  400 	ld	e, c
   4E04 50            [ 4]  401 	ld	d, b
   4E05 13            [ 6]  402 	inc	de
                            403 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4E06 3E 02         [ 7]  404 	ld	a,#0x02
   4E08 DD 96 FB      [19]  405 	sub	a, -5 (ix)
   4E0B 38 2D         [12]  406 	jr	C,00104$
                            407 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4E0D 1A            [ 7]  408 	ld	a,(de)
   4E0E DD 77 FA      [19]  409 	ld	-6 (ix), a
   4E11 3C            [ 4]  410 	inc	a
   4E12 DD 77 F9      [19]  411 	ld	-7 (ix),a
                            412 ;src/starfield/starfield.c:108: switch(pStar->nStarType)
   4E15 D5            [11]  413 	push	de
   4E16 DD 5E FB      [19]  414 	ld	e,-5 (ix)
   4E19 16 00         [ 7]  415 	ld	d,#0x00
   4E1B 21 22 4E      [10]  416 	ld	hl,#00125$
   4E1E 19            [11]  417 	add	hl,de
   4E1F 19            [11]  418 	add	hl,de
                            419 ;src/starfield/starfield.c:110: case 0: //slow star
   4E20 D1            [10]  420 	pop	de
   4E21 E9            [ 4]  421 	jp	(hl)
   4E22                     422 00125$:
   4E22 18 04         [12]  423 	jr	00101$
   4E24 18 08         [12]  424 	jr	00102$
   4E26 18 0C         [12]  425 	jr	00103$
   4E28                     426 00101$:
                            427 ;src/starfield/starfield.c:111: pStar->nY += 1;
   4E28 DD 7E F9      [19]  428 	ld	a,-7 (ix)
   4E2B 12            [ 7]  429 	ld	(de),a
                            430 ;src/starfield/starfield.c:112: break;
   4E2C 18 0C         [12]  431 	jr	00104$
                            432 ;src/starfield/starfield.c:113: case 1: //medium star
   4E2E                     433 00102$:
                            434 ;src/starfield/starfield.c:114: pStar->nY += 1;
   4E2E DD 7E F9      [19]  435 	ld	a,-7 (ix)
   4E31 12            [ 7]  436 	ld	(de),a
                            437 ;src/starfield/starfield.c:115: break;
   4E32 18 06         [12]  438 	jr	00104$
                            439 ;src/starfield/starfield.c:116: case 2: //fast star
   4E34                     440 00103$:
                            441 ;src/starfield/starfield.c:117: pStar->nY += 2;
   4E34 DD 7E FA      [19]  442 	ld	a,-6 (ix)
   4E37 C6 02         [ 7]  443 	add	a, #0x02
   4E39 12            [ 7]  444 	ld	(de),a
                            445 ;src/starfield/starfield.c:119: }
   4E3A                     446 00104$:
                            447 ;src/starfield/starfield.c:121: if(pStar->nY >= 198)
   4E3A 1A            [ 7]  448 	ld	a,(de)
   4E3B D6 C6         [ 7]  449 	sub	a, #0xC6
   4E3D 38 2E         [12]  450 	jr	C,00109$
                            451 ;src/starfield/starfield.c:123: pStar->nY = 0;
   4E3F AF            [ 4]  452 	xor	a, a
   4E40 12            [ 7]  453 	ld	(de),a
                            454 ;src/starfield/starfield.c:124: pStar->nX = cpct_getRandomUniform_u8_f(0) % 160;
   4E41 C5            [11]  455 	push	bc
   4E42 2E 00         [ 7]  456 	ld	l,#0x00
   4E44 CD 62 55      [17]  457 	call	_cpct_getRandomUniform_u8_f
   4E47 55            [ 4]  458 	ld	d,l
   4E48 3E A0         [ 7]  459 	ld	a,#0xA0
   4E4A F5            [11]  460 	push	af
   4E4B 33            [ 6]  461 	inc	sp
   4E4C D5            [11]  462 	push	de
   4E4D 33            [ 6]  463 	inc	sp
   4E4E CD EE 53      [17]  464 	call	__moduchar
   4E51 F1            [10]  465 	pop	af
   4E52 7D            [ 4]  466 	ld	a,l
   4E53 C1            [10]  467 	pop	bc
   4E54 02            [ 7]  468 	ld	(bc),a
                            469 ;src/starfield/starfield.c:125: pStar->nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   4E55 2E 00         [ 7]  470 	ld	l,#0x00
   4E57 CD 62 55      [17]  471 	call	_cpct_getRandomUniform_u8_f
   4E5A 55            [ 4]  472 	ld	d,l
   4E5B 3E 03         [ 7]  473 	ld	a,#0x03
   4E5D F5            [11]  474 	push	af
   4E5E 33            [ 6]  475 	inc	sp
   4E5F D5            [11]  476 	push	de
   4E60 33            [ 6]  477 	inc	sp
   4E61 CD EE 53      [17]  478 	call	__moduchar
   4E64 F1            [10]  479 	pop	af
   4E65 7D            [ 4]  480 	ld	a,l
   4E66 DD 6E FC      [19]  481 	ld	l,-4 (ix)
   4E69 DD 66 FD      [19]  482 	ld	h,-3 (ix)
   4E6C 77            [ 7]  483 	ld	(hl),a
   4E6D                     484 00109$:
                            485 ;src/starfield/starfield.c:104: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4E6D DD 7E FE      [19]  486 	ld	a,-2 (ix)
   4E70 C6 07         [ 7]  487 	add	a, #0x07
   4E72 DD 77 FE      [19]  488 	ld	-2 (ix),a
   4E75 DD 7E FF      [19]  489 	ld	a,-1 (ix)
   4E78 CE 00         [ 7]  490 	adc	a, #0x00
   4E7A DD 77 FF      [19]  491 	ld	-1 (ix),a
   4E7D DD 34 F8      [23]  492 	inc	-8 (ix)
   4E80 DD 7E F8      [19]  493 	ld	a,-8 (ix)
   4E83 D6 0F         [ 7]  494 	sub	a, #0x0F
   4E85 DA E3 4D      [10]  495 	jp	C,00108$
   4E88 DD F9         [10]  496 	ld	sp, ix
   4E8A DD E1         [14]  497 	pop	ix
   4E8C C9            [10]  498 	ret
                            499 	.area _CODE
                            500 	.area _INITIALIZER
                            501 	.area _CABS (ABS)
