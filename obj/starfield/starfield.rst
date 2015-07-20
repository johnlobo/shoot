                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 03:16:37 2015
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
   55B7                      27 _aStars::
   55B7                      28 	.ds 120
   562F                      29 _pixelColors::
   562F                      30 	.ds 3
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
   4239                      59 _get_mode0_pixel_color_byte::
   4239 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   423A FD 21 03 00   [14]   62 	ld	iy,#3
   423E FD 39         [15]   63 	add	iy,sp
   4240 FD 7E 00      [19]   64 	ld	a,0 (iy)
   4243 E6 01         [ 7]   65 	and	a, #0x01
   4245 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   4246 FD 7E 00      [19]   68 	ld	a,0 (iy)
   4249 E6 02         [ 7]   69 	and	a, #0x02
   424B 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   424C FD 7E 00      [19]   72 	ld	a,0 (iy)
   424F E6 04         [ 7]   73 	and	a, #0x04
   4251 33            [ 6]   74 	inc	sp
   4252 F5            [11]   75 	push	af
   4253 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   4254 FD 7E 00      [19]   78 	ld	a,0 (iy)
   4257 E6 08         [ 7]   79 	and	a, #0x08
   4259 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   425A 21 04 00      [10]   82 	ld	hl, #4+0
   425D 39            [11]   83 	add	hl, sp
   425E 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   425F B7            [ 4]   86 	or	a,a
   4260 20 23         [12]   87 	jr	NZ,00118$
   4262 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   4263 78            [ 4]   90 	ld	a,b
   4264 B7            [ 4]   91 	or	a, a
   4265 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   4267 2E 80         [ 7]   94 	ld	l,#0x80
   4269                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   4269 7A            [ 4]   97 	ld	a,d
   426A B7            [ 4]   98 	or	a, a
   426B 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   426D CB DD         [ 8]  101 	set	3, l
   426F                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   426F FD 21 00 00   [14]  104 	ld	iy,#0
   4273 FD 39         [15]  105 	add	iy,sp
   4275 FD 7E 00      [19]  106 	ld	a,0 (iy)
   4278 B7            [ 4]  107 	or	a, a
   4279 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   427B CB ED         [ 8]  110 	set	5, l
   427D                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   427D 7B            [ 4]  113 	ld	a,e
   427E B7            [ 4]  114 	or	a, a
   427F 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   4281 CB CD         [ 8]  117 	set	1, l
   4283 18 22         [12]  118 	jr	00119$
   4285                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   4285 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   4287 78            [ 4]  123 	ld	a,b
   4288 B7            [ 4]  124 	or	a, a
   4289 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   428B 2E 40         [ 7]  127 	ld	l,#0x40
   428D                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   428D 7A            [ 4]  130 	ld	a,d
   428E B7            [ 4]  131 	or	a, a
   428F 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   4291 CB D5         [ 8]  134 	set	2, l
   4293                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   4293 FD 21 00 00   [14]  137 	ld	iy,#0
   4297 FD 39         [15]  138 	add	iy,sp
   4299 FD 7E 00      [19]  139 	ld	a,0 (iy)
   429C B7            [ 4]  140 	or	a, a
   429D 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   429F CB E5         [ 8]  143 	set	4, l
   42A1                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   42A1 7B            [ 4]  146 	ld	a,e
   42A2 B7            [ 4]  147 	or	a, a
   42A3 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   42A5 CB C5         [ 8]  150 	set	0, l
   42A7                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   42A7 33            [ 6]  153 	inc	sp
   42A8 C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   42A9                     159 _init_stars::
   42A9 DD E5         [15]  160 	push	ix
   42AB DD 21 00 00   [14]  161 	ld	ix,#0
   42AF DD 39         [15]  162 	add	ix,sp
   42B1 F5            [11]  163 	push	af
   42B2 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   42B3 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   42B7                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   42B7 DD 6E FD      [19]  169 	ld	l,-3 (ix)
   42BA 26 00         [ 7]  170 	ld	h,#0x00
   42BC 29            [11]  171 	add	hl, hl
   42BD 29            [11]  172 	add	hl, hl
   42BE 29            [11]  173 	add	hl, hl
   42BF 3E B7         [ 7]  174 	ld	a,#<(_aStars)
   42C1 85            [ 4]  175 	add	a, l
   42C2 5F            [ 4]  176 	ld	e,a
   42C3 3E 55         [ 7]  177 	ld	a,#>(_aStars)
   42C5 8C            [ 4]  178 	adc	a, h
   42C6 57            [ 4]  179 	ld	d,a
   42C7 D5            [11]  180 	push	de
   42C8 CD 61 4A      [17]  181 	call	_rand
   42CB 01 A0 00      [10]  182 	ld	bc,#0x00A0
   42CE C5            [11]  183 	push	bc
   42CF E5            [11]  184 	push	hl
   42D0 CD F1 4C      [17]  185 	call	__modsint
   42D3 F1            [10]  186 	pop	af
   42D4 F1            [10]  187 	pop	af
   42D5 D1            [10]  188 	pop	de
   42D6 7D            [ 4]  189 	ld	a,l
   42D7 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   42D8 21 01 00      [10]  192 	ld	hl,#0x0001
   42DB 19            [11]  193 	add	hl,de
   42DC DD 75 FE      [19]  194 	ld	-2 (ix),l
   42DF DD 74 FF      [19]  195 	ld	-1 (ix),h
   42E2 D5            [11]  196 	push	de
   42E3 CD 61 4A      [17]  197 	call	_rand
   42E6 01 C7 00      [10]  198 	ld	bc,#0x00C7
   42E9 C5            [11]  199 	push	bc
   42EA E5            [11]  200 	push	hl
   42EB CD F1 4C      [17]  201 	call	__modsint
   42EE F1            [10]  202 	pop	af
   42EF F1            [10]  203 	pop	af
   42F0 D1            [10]  204 	pop	de
   42F1 7D            [ 4]  205 	ld	a,l
   42F2 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   42F5 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   42F8 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   42F9 13            [ 6]  210 	inc	de
   42FA 13            [ 6]  211 	inc	de
   42FB D5            [11]  212 	push	de
   42FC CD 61 4A      [17]  213 	call	_rand
   42FF 01 03 00      [10]  214 	ld	bc,#0x0003
   4302 C5            [11]  215 	push	bc
   4303 E5            [11]  216 	push	hl
   4304 CD F1 4C      [17]  217 	call	__modsint
   4307 F1            [10]  218 	pop	af
   4308 F1            [10]  219 	pop	af
   4309 D1            [10]  220 	pop	de
   430A 7D            [ 4]  221 	ld	a,l
   430B 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   430C DD 34 FD      [23]  224 	inc	-3 (ix)
   430F DD 7E FD      [19]  225 	ld	a,-3 (ix)
   4312 D6 0F         [ 7]  226 	sub	a, #0x0F
   4314 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   4316 21 2F 56      [10]  229 	ld	hl,#_pixelColors
   4319 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   431B 23            [ 6]  232 	inc	hl
   431C 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   431E 21 31 56      [10]  235 	ld	hl,#_pixelColors + 2
   4321 36 03         [10]  236 	ld	(hl),#0x03
   4323 DD F9         [10]  237 	ld	sp, ix
   4325 DD E1         [14]  238 	pop	ix
   4327 C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   4328                     244 _draw_stars::
   4328 DD E5         [15]  245 	push	ix
   432A DD 21 00 00   [14]  246 	ld	ix,#0
   432E DD 39         [15]  247 	add	ix,sp
   4330 F5            [11]  248 	push	af
   4331 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4332 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   4336                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   4336 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   4339 26 00         [ 7]  255 	ld	h,#0x00
   433B 29            [11]  256 	add	hl, hl
   433C 29            [11]  257 	add	hl, hl
   433D 29            [11]  258 	add	hl, hl
   433E 11 B7 55      [10]  259 	ld	de,#_aStars
   4341 19            [11]  260 	add	hl,de
   4342 4D            [ 4]  261 	ld	c, l
   4343 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   4344 21 06 00      [10]  264 	ld	hl,#0x0006
   4347 09            [11]  265 	add	hl,bc
   4348 DD 75 FE      [19]  266 	ld	-2 (ix),l
   434B DD 74 FF      [19]  267 	ld	-1 (ix),h
   434E 69            [ 4]  268 	ld	l, c
   434F 60            [ 4]  269 	ld	h, b
   4350 23            [ 6]  270 	inc	hl
   4351 5E            [ 7]  271 	ld	e,(hl)
   4352 0A            [ 7]  272 	ld	a,(bc)
   4353 67            [ 4]  273 	ld	h,a
   4354 DD 6E 04      [19]  274 	ld	l,4 (ix)
   4357 DD 56 05      [19]  275 	ld	d,5 (ix)
   435A C5            [11]  276 	push	bc
   435B 7B            [ 4]  277 	ld	a,e
   435C F5            [11]  278 	push	af
   435D 33            [ 6]  279 	inc	sp
   435E E5            [11]  280 	push	hl
   435F 33            [ 6]  281 	inc	sp
   4360 62            [ 4]  282 	ld	h, d
   4361 E5            [11]  283 	push	hl
   4362 CD 11 4D      [17]  284 	call	_cpct_getScreenPtr
   4365 F1            [10]  285 	pop	af
   4366 F1            [10]  286 	pop	af
   4367 EB            [ 4]  287 	ex	de,hl
   4368 C1            [10]  288 	pop	bc
   4369 DD 6E FE      [19]  289 	ld	l,-2 (ix)
   436C DD 66 FF      [19]  290 	ld	h,-1 (ix)
   436F 73            [ 7]  291 	ld	(hl),e
   4370 23            [ 6]  292 	inc	hl
   4371 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   4372 1A            [ 7]  295 	ld	a,(de)
   4373 DD 77 FE      [19]  296 	ld	-2 (ix),a
   4376 0A            [ 7]  297 	ld	a,(bc)
   4377 E6 01         [ 7]  298 	and	a, #0x01
   4379 DD 77 FD      [19]  299 	ld	-3 (ix),a
   437C 69            [ 4]  300 	ld	l, c
   437D 60            [ 4]  301 	ld	h, b
   437E 23            [ 6]  302 	inc	hl
   437F 23            [ 6]  303 	inc	hl
   4380 46            [ 7]  304 	ld	b,(hl)
   4381 04            [ 4]  305 	inc	b
   4382 D5            [11]  306 	push	de
   4383 DD 7E FD      [19]  307 	ld	a,-3 (ix)
   4386 F5            [11]  308 	push	af
   4387 33            [ 6]  309 	inc	sp
   4388 C5            [11]  310 	push	bc
   4389 33            [ 6]  311 	inc	sp
   438A CD 39 42      [17]  312 	call	_get_mode0_pixel_color_byte
   438D F1            [10]  313 	pop	af
   438E 7D            [ 4]  314 	ld	a,l
   438F D1            [10]  315 	pop	de
   4390 DD AE FE      [19]  316 	xor	a, -2 (ix)
   4393 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4394 DD 34 FC      [23]  319 	inc	-4 (ix)
   4397 DD 7E FC      [19]  320 	ld	a,-4 (ix)
   439A D6 0F         [ 7]  321 	sub	a, #0x0F
   439C 38 98         [12]  322 	jr	C,00102$
   439E DD F9         [10]  323 	ld	sp, ix
   43A0 DD E1         [14]  324 	pop	ix
   43A2 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   43A3                     330 _update_stars::
   43A3 DD E5         [15]  331 	push	ix
   43A5 DD 21 00 00   [14]  332 	ld	ix,#0
   43A9 DD 39         [15]  333 	add	ix,sp
   43AB 21 F8 FF      [10]  334 	ld	hl,#-8
   43AE 39            [11]  335 	add	hl,sp
   43AF F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   43B0 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   43B4                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   43B4 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   43B7 26 00         [ 7]  342 	ld	h,#0x00
   43B9 29            [11]  343 	add	hl, hl
   43BA 29            [11]  344 	add	hl, hl
   43BB 29            [11]  345 	add	hl, hl
   43BC 11 B7 55      [10]  346 	ld	de,#_aStars
   43BF 19            [11]  347 	add	hl,de
   43C0 4D            [ 4]  348 	ld	c, l
   43C1 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   43C2 21 02 00      [10]  351 	ld	hl,#0x0002
   43C5 09            [11]  352 	add	hl,bc
   43C6 DD 75 F9      [19]  353 	ld	-7 (ix),l
   43C9 DD 74 FA      [19]  354 	ld	-6 (ix),h
   43CC DD 6E F9      [19]  355 	ld	l,-7 (ix)
   43CF DD 66 FA      [19]  356 	ld	h,-6 (ix)
   43D2 7E            [ 7]  357 	ld	a,(hl)
   43D3 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   43D6 59            [ 4]  360 	ld	e, c
   43D7 50            [ 4]  361 	ld	d, b
   43D8 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   43D9 3E 02         [ 7]  364 	ld	a,#0x02
   43DB DD 96 FD      [19]  365 	sub	a, -3 (ix)
   43DE 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   43E0 1A            [ 7]  368 	ld	a,(de)
   43E1 DD 77 FE      [19]  369 	ld	-2 (ix), a
   43E4 3C            [ 4]  370 	inc	a
   43E5 DD 77 FF      [19]  371 	ld	-1 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   43E8 D5            [11]  373 	push	de
   43E9 DD 5E FD      [19]  374 	ld	e,-3 (ix)
   43EC 16 00         [ 7]  375 	ld	d,#0x00
   43EE 21 F5 43      [10]  376 	ld	hl,#00125$
   43F1 19            [11]  377 	add	hl,de
   43F2 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   43F3 D1            [10]  380 	pop	de
   43F4 E9            [ 4]  381 	jp	(hl)
   43F5                     382 00125$:
   43F5 18 04         [12]  383 	jr	00101$
   43F7 18 08         [12]  384 	jr	00102$
   43F9 18 0C         [12]  385 	jr	00103$
   43FB                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   43FB DD 7E FF      [19]  388 	ld	a,-1 (ix)
   43FE 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   43FF 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   4401                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   4401 DD 7E FF      [19]  395 	ld	a,-1 (ix)
   4404 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   4405 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   4407                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   4407 DD 7E FE      [19]  402 	ld	a,-2 (ix)
   440A C6 02         [ 7]  403 	add	a, #0x02
   440C 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   440D                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   440D 1A            [ 7]  408 	ld	a,(de)
   440E D6 C6         [ 7]  409 	sub	a, #0xC6
   4410 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   4412 AF            [ 4]  412 	xor	a, a
   4413 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   4414 C5            [11]  415 	push	bc
   4415 CD 61 4A      [17]  416 	call	_rand
   4418 DD 74 FC      [19]  417 	ld	-4 (ix),h
   441B DD 75 FB      [19]  418 	ld	-5 (ix),l
   441E 21 A0 00      [10]  419 	ld	hl,#0x00A0
   4421 E5            [11]  420 	push	hl
   4422 DD 6E FB      [19]  421 	ld	l,-5 (ix)
   4425 DD 66 FC      [19]  422 	ld	h,-4 (ix)
   4428 E5            [11]  423 	push	hl
   4429 CD F1 4C      [17]  424 	call	__modsint
   442C F1            [10]  425 	pop	af
   442D F1            [10]  426 	pop	af
   442E C1            [10]  427 	pop	bc
   442F 7D            [ 4]  428 	ld	a,l
   4430 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   4431 CD 61 4A      [17]  431 	call	_rand
   4434 01 03 00      [10]  432 	ld	bc,#0x0003
   4437 C5            [11]  433 	push	bc
   4438 E5            [11]  434 	push	hl
   4439 CD F1 4C      [17]  435 	call	__modsint
   443C F1            [10]  436 	pop	af
   443D F1            [10]  437 	pop	af
   443E 7D            [ 4]  438 	ld	a,l
   443F DD 6E F9      [19]  439 	ld	l,-7 (ix)
   4442 DD 66 FA      [19]  440 	ld	h,-6 (ix)
   4445 77            [ 7]  441 	ld	(hl),a
   4446                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   4446 DD 34 F8      [23]  444 	inc	-8 (ix)
   4449 DD 7E F8      [19]  445 	ld	a,-8 (ix)
   444C D6 0F         [ 7]  446 	sub	a, #0x0F
   444E DA B4 43      [10]  447 	jp	C,00108$
   4451 DD F9         [10]  448 	ld	sp, ix
   4453 DD E1         [14]  449 	pop	ix
   4455 C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
