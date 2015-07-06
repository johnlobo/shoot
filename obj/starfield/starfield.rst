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
   47F1                      27 _aStars::
   47F1                      28 	.ds 120
   4869                      29 _pixelColors::
   4869                      30 	.ds 3
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
   392C                      59 _get_mode0_pixel_color_byte::
   392C 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   392D FD 21 03 00   [14]   62 	ld	iy,#3
   3931 FD 39         [15]   63 	add	iy,sp
   3933 FD 7E 00      [19]   64 	ld	a,0 (iy)
   3936 E6 01         [ 7]   65 	and	a, #0x01
   3938 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   3939 FD 7E 00      [19]   68 	ld	a,0 (iy)
   393C E6 02         [ 7]   69 	and	a, #0x02
   393E 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   393F FD 7E 00      [19]   72 	ld	a,0 (iy)
   3942 E6 04         [ 7]   73 	and	a, #0x04
   3944 33            [ 6]   74 	inc	sp
   3945 F5            [11]   75 	push	af
   3946 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   3947 FD 7E 00      [19]   78 	ld	a,0 (iy)
   394A E6 08         [ 7]   79 	and	a, #0x08
   394C 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   394D 21 04 00      [10]   82 	ld	hl, #4+0
   3950 39            [11]   83 	add	hl, sp
   3951 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   3952 B7            [ 4]   86 	or	a,a
   3953 20 23         [12]   87 	jr	NZ,00118$
   3955 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   3956 78            [ 4]   90 	ld	a,b
   3957 B7            [ 4]   91 	or	a, a
   3958 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   395A 2E 80         [ 7]   94 	ld	l,#0x80
   395C                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   395C 7A            [ 4]   97 	ld	a,d
   395D B7            [ 4]   98 	or	a, a
   395E 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   3960 CB DD         [ 8]  101 	set	3, l
   3962                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   3962 FD 21 00 00   [14]  104 	ld	iy,#0
   3966 FD 39         [15]  105 	add	iy,sp
   3968 FD 7E 00      [19]  106 	ld	a,0 (iy)
   396B B7            [ 4]  107 	or	a, a
   396C 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   396E CB ED         [ 8]  110 	set	5, l
   3970                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   3970 7B            [ 4]  113 	ld	a,e
   3971 B7            [ 4]  114 	or	a, a
   3972 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   3974 CB CD         [ 8]  117 	set	1, l
   3976 18 22         [12]  118 	jr	00119$
   3978                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   3978 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   397A 78            [ 4]  123 	ld	a,b
   397B B7            [ 4]  124 	or	a, a
   397C 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   397E 2E 40         [ 7]  127 	ld	l,#0x40
   3980                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   3980 7A            [ 4]  130 	ld	a,d
   3981 B7            [ 4]  131 	or	a, a
   3982 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   3984 CB D5         [ 8]  134 	set	2, l
   3986                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   3986 FD 21 00 00   [14]  137 	ld	iy,#0
   398A FD 39         [15]  138 	add	iy,sp
   398C FD 7E 00      [19]  139 	ld	a,0 (iy)
   398F B7            [ 4]  140 	or	a, a
   3990 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   3992 CB E5         [ 8]  143 	set	4, l
   3994                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   3994 7B            [ 4]  146 	ld	a,e
   3995 B7            [ 4]  147 	or	a, a
   3996 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   3998 CB C5         [ 8]  150 	set	0, l
   399A                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   399A 33            [ 6]  153 	inc	sp
   399B C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   399C                     159 _init_stars::
   399C DD E5         [15]  160 	push	ix
   399E DD 21 00 00   [14]  161 	ld	ix,#0
   39A2 DD 39         [15]  162 	add	ix,sp
   39A4 F5            [11]  163 	push	af
   39A5 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   39A6 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   39AA                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   39AA DD 6E FD      [19]  169 	ld	l,-3 (ix)
   39AD 26 00         [ 7]  170 	ld	h,#0x00
   39AF 29            [11]  171 	add	hl, hl
   39B0 29            [11]  172 	add	hl, hl
   39B1 29            [11]  173 	add	hl, hl
   39B2 3E F1         [ 7]  174 	ld	a,#<(_aStars)
   39B4 85            [ 4]  175 	add	a, l
   39B5 5F            [ 4]  176 	ld	e,a
   39B6 3E 47         [ 7]  177 	ld	a,#>(_aStars)
   39B8 8C            [ 4]  178 	adc	a, h
   39B9 57            [ 4]  179 	ld	d,a
   39BA D5            [11]  180 	push	de
   39BB CD 10 41      [17]  181 	call	_rand
   39BE 01 A0 00      [10]  182 	ld	bc,#0x00A0
   39C1 C5            [11]  183 	push	bc
   39C2 E5            [11]  184 	push	hl
   39C3 CD BA 43      [17]  185 	call	__modsint
   39C6 F1            [10]  186 	pop	af
   39C7 F1            [10]  187 	pop	af
   39C8 D1            [10]  188 	pop	de
   39C9 7D            [ 4]  189 	ld	a,l
   39CA 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   39CB 21 01 00      [10]  192 	ld	hl,#0x0001
   39CE 19            [11]  193 	add	hl,de
   39CF DD 75 FE      [19]  194 	ld	-2 (ix),l
   39D2 DD 74 FF      [19]  195 	ld	-1 (ix),h
   39D5 D5            [11]  196 	push	de
   39D6 CD 10 41      [17]  197 	call	_rand
   39D9 01 C7 00      [10]  198 	ld	bc,#0x00C7
   39DC C5            [11]  199 	push	bc
   39DD E5            [11]  200 	push	hl
   39DE CD BA 43      [17]  201 	call	__modsint
   39E1 F1            [10]  202 	pop	af
   39E2 F1            [10]  203 	pop	af
   39E3 D1            [10]  204 	pop	de
   39E4 7D            [ 4]  205 	ld	a,l
   39E5 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   39E8 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   39EB 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   39EC 13            [ 6]  210 	inc	de
   39ED 13            [ 6]  211 	inc	de
   39EE D5            [11]  212 	push	de
   39EF CD 10 41      [17]  213 	call	_rand
   39F2 01 03 00      [10]  214 	ld	bc,#0x0003
   39F5 C5            [11]  215 	push	bc
   39F6 E5            [11]  216 	push	hl
   39F7 CD BA 43      [17]  217 	call	__modsint
   39FA F1            [10]  218 	pop	af
   39FB F1            [10]  219 	pop	af
   39FC D1            [10]  220 	pop	de
   39FD 7D            [ 4]  221 	ld	a,l
   39FE 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   39FF DD 34 FD      [23]  224 	inc	-3 (ix)
   3A02 DD 7E FD      [19]  225 	ld	a,-3 (ix)
   3A05 D6 0F         [ 7]  226 	sub	a, #0x0F
   3A07 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   3A09 21 69 48      [10]  229 	ld	hl,#_pixelColors
   3A0C 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   3A0E 23            [ 6]  232 	inc	hl
   3A0F 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   3A11 21 6B 48      [10]  235 	ld	hl,#_pixelColors + 2
   3A14 36 03         [10]  236 	ld	(hl),#0x03
   3A16 DD F9         [10]  237 	ld	sp, ix
   3A18 DD E1         [14]  238 	pop	ix
   3A1A C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   3A1B                     244 _draw_stars::
   3A1B DD E5         [15]  245 	push	ix
   3A1D DD 21 00 00   [14]  246 	ld	ix,#0
   3A21 DD 39         [15]  247 	add	ix,sp
   3A23 F5            [11]  248 	push	af
   3A24 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3A25 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   3A29                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   3A29 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   3A2C 26 00         [ 7]  255 	ld	h,#0x00
   3A2E 29            [11]  256 	add	hl, hl
   3A2F 29            [11]  257 	add	hl, hl
   3A30 29            [11]  258 	add	hl, hl
   3A31 11 F1 47      [10]  259 	ld	de,#_aStars
   3A34 19            [11]  260 	add	hl,de
   3A35 4D            [ 4]  261 	ld	c, l
   3A36 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   3A37 21 06 00      [10]  264 	ld	hl,#0x0006
   3A3A 09            [11]  265 	add	hl,bc
   3A3B DD 75 FE      [19]  266 	ld	-2 (ix),l
   3A3E DD 74 FF      [19]  267 	ld	-1 (ix),h
   3A41 69            [ 4]  268 	ld	l, c
   3A42 60            [ 4]  269 	ld	h, b
   3A43 23            [ 6]  270 	inc	hl
   3A44 5E            [ 7]  271 	ld	e,(hl)
   3A45 0A            [ 7]  272 	ld	a,(bc)
   3A46 67            [ 4]  273 	ld	h,a
   3A47 DD 6E 04      [19]  274 	ld	l,4 (ix)
   3A4A DD 56 05      [19]  275 	ld	d,5 (ix)
   3A4D C5            [11]  276 	push	bc
   3A4E 7B            [ 4]  277 	ld	a,e
   3A4F F5            [11]  278 	push	af
   3A50 33            [ 6]  279 	inc	sp
   3A51 E5            [11]  280 	push	hl
   3A52 33            [ 6]  281 	inc	sp
   3A53 62            [ 4]  282 	ld	h, d
   3A54 E5            [11]  283 	push	hl
   3A55 CD C6 43      [17]  284 	call	_cpct_getScreenPtr
   3A58 F1            [10]  285 	pop	af
   3A59 F1            [10]  286 	pop	af
   3A5A EB            [ 4]  287 	ex	de,hl
   3A5B C1            [10]  288 	pop	bc
   3A5C DD 6E FE      [19]  289 	ld	l,-2 (ix)
   3A5F DD 66 FF      [19]  290 	ld	h,-1 (ix)
   3A62 73            [ 7]  291 	ld	(hl),e
   3A63 23            [ 6]  292 	inc	hl
   3A64 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   3A65 1A            [ 7]  295 	ld	a,(de)
   3A66 DD 77 FE      [19]  296 	ld	-2 (ix),a
   3A69 0A            [ 7]  297 	ld	a,(bc)
   3A6A E6 01         [ 7]  298 	and	a, #0x01
   3A6C DD 77 FD      [19]  299 	ld	-3 (ix),a
   3A6F 69            [ 4]  300 	ld	l, c
   3A70 60            [ 4]  301 	ld	h, b
   3A71 23            [ 6]  302 	inc	hl
   3A72 23            [ 6]  303 	inc	hl
   3A73 46            [ 7]  304 	ld	b,(hl)
   3A74 04            [ 4]  305 	inc	b
   3A75 D5            [11]  306 	push	de
   3A76 DD 7E FD      [19]  307 	ld	a,-3 (ix)
   3A79 F5            [11]  308 	push	af
   3A7A 33            [ 6]  309 	inc	sp
   3A7B C5            [11]  310 	push	bc
   3A7C 33            [ 6]  311 	inc	sp
   3A7D CD 2C 39      [17]  312 	call	_get_mode0_pixel_color_byte
   3A80 F1            [10]  313 	pop	af
   3A81 7D            [ 4]  314 	ld	a,l
   3A82 D1            [10]  315 	pop	de
   3A83 DD AE FE      [19]  316 	xor	a, -2 (ix)
   3A86 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3A87 DD 34 FC      [23]  319 	inc	-4 (ix)
   3A8A DD 7E FC      [19]  320 	ld	a,-4 (ix)
   3A8D D6 0F         [ 7]  321 	sub	a, #0x0F
   3A8F 38 98         [12]  322 	jr	C,00102$
   3A91 DD F9         [10]  323 	ld	sp, ix
   3A93 DD E1         [14]  324 	pop	ix
   3A95 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   3A96                     330 _update_stars::
   3A96 DD E5         [15]  331 	push	ix
   3A98 DD 21 00 00   [14]  332 	ld	ix,#0
   3A9C DD 39         [15]  333 	add	ix,sp
   3A9E 21 F8 FF      [10]  334 	ld	hl,#-8
   3AA1 39            [11]  335 	add	hl,sp
   3AA2 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3AA3 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   3AA7                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   3AA7 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   3AAA 26 00         [ 7]  342 	ld	h,#0x00
   3AAC 29            [11]  343 	add	hl, hl
   3AAD 29            [11]  344 	add	hl, hl
   3AAE 29            [11]  345 	add	hl, hl
   3AAF 11 F1 47      [10]  346 	ld	de,#_aStars
   3AB2 19            [11]  347 	add	hl,de
   3AB3 4D            [ 4]  348 	ld	c, l
   3AB4 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3AB5 21 02 00      [10]  351 	ld	hl,#0x0002
   3AB8 09            [11]  352 	add	hl,bc
   3AB9 DD 75 FE      [19]  353 	ld	-2 (ix),l
   3ABC DD 74 FF      [19]  354 	ld	-1 (ix),h
   3ABF DD 6E FE      [19]  355 	ld	l,-2 (ix)
   3AC2 DD 66 FF      [19]  356 	ld	h,-1 (ix)
   3AC5 7E            [ 7]  357 	ld	a,(hl)
   3AC6 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3AC9 59            [ 4]  360 	ld	e, c
   3ACA 50            [ 4]  361 	ld	d, b
   3ACB 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3ACC 3E 02         [ 7]  364 	ld	a,#0x02
   3ACE DD 96 FD      [19]  365 	sub	a, -3 (ix)
   3AD1 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3AD3 1A            [ 7]  368 	ld	a,(de)
   3AD4 DD 77 FC      [19]  369 	ld	-4 (ix), a
   3AD7 3C            [ 4]  370 	inc	a
   3AD8 DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3ADB D5            [11]  373 	push	de
   3ADC DD 5E FD      [19]  374 	ld	e,-3 (ix)
   3ADF 16 00         [ 7]  375 	ld	d,#0x00
   3AE1 21 E8 3A      [10]  376 	ld	hl,#00125$
   3AE4 19            [11]  377 	add	hl,de
   3AE5 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   3AE6 D1            [10]  380 	pop	de
   3AE7 E9            [ 4]  381 	jp	(hl)
   3AE8                     382 00125$:
   3AE8 18 04         [12]  383 	jr	00101$
   3AEA 18 08         [12]  384 	jr	00102$
   3AEC 18 0C         [12]  385 	jr	00103$
   3AEE                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3AEE DD 7E FB      [19]  388 	ld	a,-5 (ix)
   3AF1 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   3AF2 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   3AF4                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   3AF4 DD 7E FB      [19]  395 	ld	a,-5 (ix)
   3AF7 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   3AF8 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   3AFA                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   3AFA DD 7E FC      [19]  402 	ld	a,-4 (ix)
   3AFD C6 02         [ 7]  403 	add	a, #0x02
   3AFF 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   3B00                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   3B00 1A            [ 7]  408 	ld	a,(de)
   3B01 D6 C6         [ 7]  409 	sub	a, #0xC6
   3B03 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   3B05 AF            [ 4]  412 	xor	a, a
   3B06 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   3B07 C5            [11]  415 	push	bc
   3B08 CD 10 41      [17]  416 	call	_rand
   3B0B DD 74 FA      [19]  417 	ld	-6 (ix),h
   3B0E DD 75 F9      [19]  418 	ld	-7 (ix),l
   3B11 21 A0 00      [10]  419 	ld	hl,#0x00A0
   3B14 E5            [11]  420 	push	hl
   3B15 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   3B18 DD 66 FA      [19]  422 	ld	h,-6 (ix)
   3B1B E5            [11]  423 	push	hl
   3B1C CD BA 43      [17]  424 	call	__modsint
   3B1F F1            [10]  425 	pop	af
   3B20 F1            [10]  426 	pop	af
   3B21 C1            [10]  427 	pop	bc
   3B22 7D            [ 4]  428 	ld	a,l
   3B23 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   3B24 CD 10 41      [17]  431 	call	_rand
   3B27 01 03 00      [10]  432 	ld	bc,#0x0003
   3B2A C5            [11]  433 	push	bc
   3B2B E5            [11]  434 	push	hl
   3B2C CD BA 43      [17]  435 	call	__modsint
   3B2F F1            [10]  436 	pop	af
   3B30 F1            [10]  437 	pop	af
   3B31 7D            [ 4]  438 	ld	a,l
   3B32 DD 6E FE      [19]  439 	ld	l,-2 (ix)
   3B35 DD 66 FF      [19]  440 	ld	h,-1 (ix)
   3B38 77            [ 7]  441 	ld	(hl),a
   3B39                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3B39 DD 34 F8      [23]  444 	inc	-8 (ix)
   3B3C DD 7E F8      [19]  445 	ld	a,-8 (ix)
   3B3F D6 0F         [ 7]  446 	sub	a, #0x0F
   3B41 DA A7 3A      [10]  447 	jp	C,00108$
   3B44 DD F9         [10]  448 	ld	sp, ix
   3B46 DD E1         [14]  449 	pop	ix
   3B48 C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
