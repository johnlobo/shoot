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
   47E3                      27 _aStars::
   47E3                      28 	.ds 120
   485B                      29 _pixelColors::
   485B                      30 	.ds 3
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
   391E                      59 _get_mode0_pixel_color_byte::
   391E 3B            [ 6]   60 	dec	sp
                             61 ;src/starfield/starfield.c:22: if(nColor & 1)
   391F FD 21 03 00   [14]   62 	ld	iy,#3
   3923 FD 39         [15]   63 	add	iy,sp
   3925 FD 7E 00      [19]   64 	ld	a,0 (iy)
   3928 E6 01         [ 7]   65 	and	a, #0x01
   392A 47            [ 4]   66 	ld	b,a
                             67 ;src/starfield/starfield.c:25: if(nColor & 2)
   392B FD 7E 00      [19]   68 	ld	a,0 (iy)
   392E E6 02         [ 7]   69 	and	a, #0x02
   3930 57            [ 4]   70 	ld	d,a
                             71 ;src/starfield/starfield.c:28: if(nColor & 4)
   3931 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3934 E6 04         [ 7]   73 	and	a, #0x04
   3936 33            [ 6]   74 	inc	sp
   3937 F5            [11]   75 	push	af
   3938 33            [ 6]   76 	inc	sp
                             77 ;src/starfield/starfield.c:31: if(nColor & 8)
   3939 FD 7E 00      [19]   78 	ld	a,0 (iy)
   393C E6 08         [ 7]   79 	and	a, #0x08
   393E 5F            [ 4]   80 	ld	e,a
                             81 ;src/starfield/starfield.c:18: if(nPixel == 0)
   393F 21 04 00      [10]   82 	ld	hl, #4+0
   3942 39            [11]   83 	add	hl, sp
   3943 7E            [ 7]   84 	ld	a, (hl)
                             85 ;src/starfield/starfield.c:20: nByte &= 85;
   3944 B7            [ 4]   86 	or	a,a
   3945 20 23         [12]   87 	jr	NZ,00118$
   3947 6F            [ 4]   88 	ld	l,a
                             89 ;src/starfield/starfield.c:22: if(nColor & 1)
   3948 78            [ 4]   90 	ld	a,b
   3949 B7            [ 4]   91 	or	a, a
   394A 28 02         [12]   92 	jr	Z,00102$
                             93 ;src/starfield/starfield.c:23: nByte |= 128;
   394C 2E 80         [ 7]   94 	ld	l,#0x80
   394E                      95 00102$:
                             96 ;src/starfield/starfield.c:25: if(nColor & 2)
   394E 7A            [ 4]   97 	ld	a,d
   394F B7            [ 4]   98 	or	a, a
   3950 28 02         [12]   99 	jr	Z,00104$
                            100 ;src/starfield/starfield.c:26: nByte |= 8;
   3952 CB DD         [ 8]  101 	set	3, l
   3954                     102 00104$:
                            103 ;src/starfield/starfield.c:28: if(nColor & 4)
   3954 FD 21 00 00   [14]  104 	ld	iy,#0
   3958 FD 39         [15]  105 	add	iy,sp
   395A FD 7E 00      [19]  106 	ld	a,0 (iy)
   395D B7            [ 4]  107 	or	a, a
   395E 28 02         [12]  108 	jr	Z,00106$
                            109 ;src/starfield/starfield.c:29: nByte |= 32;
   3960 CB ED         [ 8]  110 	set	5, l
   3962                     111 00106$:
                            112 ;src/starfield/starfield.c:31: if(nColor & 8)
   3962 7B            [ 4]  113 	ld	a,e
   3963 B7            [ 4]  114 	or	a, a
   3964 28 26         [12]  115 	jr	Z,00119$
                            116 ;src/starfield/starfield.c:32: nByte |= 2;
   3966 CB CD         [ 8]  117 	set	1, l
   3968 18 22         [12]  118 	jr	00119$
   396A                     119 00118$:
                            120 ;src/starfield/starfield.c:36: nByte &= 170;
   396A 2E 00         [ 7]  121 	ld	l,#0x00
                            122 ;src/starfield/starfield.c:38: if(nColor & 1)
   396C 78            [ 4]  123 	ld	a,b
   396D B7            [ 4]  124 	or	a, a
   396E 28 02         [12]  125 	jr	Z,00110$
                            126 ;src/starfield/starfield.c:39: nByte |= 64;
   3970 2E 40         [ 7]  127 	ld	l,#0x40
   3972                     128 00110$:
                            129 ;src/starfield/starfield.c:41: if(nColor & 2)
   3972 7A            [ 4]  130 	ld	a,d
   3973 B7            [ 4]  131 	or	a, a
   3974 28 02         [12]  132 	jr	Z,00112$
                            133 ;src/starfield/starfield.c:42: nByte |= 4;
   3976 CB D5         [ 8]  134 	set	2, l
   3978                     135 00112$:
                            136 ;src/starfield/starfield.c:44: if(nColor & 4)
   3978 FD 21 00 00   [14]  137 	ld	iy,#0
   397C FD 39         [15]  138 	add	iy,sp
   397E FD 7E 00      [19]  139 	ld	a,0 (iy)
   3981 B7            [ 4]  140 	or	a, a
   3982 28 02         [12]  141 	jr	Z,00114$
                            142 ;src/starfield/starfield.c:45: nByte |= 16;
   3984 CB E5         [ 8]  143 	set	4, l
   3986                     144 00114$:
                            145 ;src/starfield/starfield.c:47: if(nColor & 8)
   3986 7B            [ 4]  146 	ld	a,e
   3987 B7            [ 4]  147 	or	a, a
   3988 28 02         [12]  148 	jr	Z,00119$
                            149 ;src/starfield/starfield.c:48: nByte |= 1;
   398A CB C5         [ 8]  150 	set	0, l
   398C                     151 00119$:
                            152 ;src/starfield/starfield.c:51: return nByte;
   398C 33            [ 6]  153 	inc	sp
   398D C9            [10]  154 	ret
                            155 ;src/starfield/starfield.c:58: void init_stars(){
                            156 ;	---------------------------------
                            157 ; Function init_stars
                            158 ; ---------------------------------
   398E                     159 _init_stars::
   398E DD E5         [15]  160 	push	ix
   3990 DD 21 00 00   [14]  161 	ld	ix,#0
   3994 DD 39         [15]  162 	add	ix,sp
   3996 F5            [11]  163 	push	af
   3997 3B            [ 6]  164 	dec	sp
                            165 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3998 DD 36 FD 00   [19]  166 	ld	-3 (ix),#0x00
   399C                     167 00102$:
                            168 ;src/starfield/starfield.c:64: aStars[nStar].nX = rand() % 160;
   399C DD 6E FD      [19]  169 	ld	l,-3 (ix)
   399F 26 00         [ 7]  170 	ld	h,#0x00
   39A1 29            [11]  171 	add	hl, hl
   39A2 29            [11]  172 	add	hl, hl
   39A3 29            [11]  173 	add	hl, hl
   39A4 3E E3         [ 7]  174 	ld	a,#<(_aStars)
   39A6 85            [ 4]  175 	add	a, l
   39A7 5F            [ 4]  176 	ld	e,a
   39A8 3E 47         [ 7]  177 	ld	a,#>(_aStars)
   39AA 8C            [ 4]  178 	adc	a, h
   39AB 57            [ 4]  179 	ld	d,a
   39AC D5            [11]  180 	push	de
   39AD CD 02 41      [17]  181 	call	_rand
   39B0 01 A0 00      [10]  182 	ld	bc,#0x00A0
   39B3 C5            [11]  183 	push	bc
   39B4 E5            [11]  184 	push	hl
   39B5 CD AC 43      [17]  185 	call	__modsint
   39B8 F1            [10]  186 	pop	af
   39B9 F1            [10]  187 	pop	af
   39BA D1            [10]  188 	pop	de
   39BB 7D            [ 4]  189 	ld	a,l
   39BC 12            [ 7]  190 	ld	(de),a
                            191 ;src/starfield/starfield.c:65: aStars[nStar].nY = rand() % 199;
   39BD 21 01 00      [10]  192 	ld	hl,#0x0001
   39C0 19            [11]  193 	add	hl,de
   39C1 DD 75 FE      [19]  194 	ld	-2 (ix),l
   39C4 DD 74 FF      [19]  195 	ld	-1 (ix),h
   39C7 D5            [11]  196 	push	de
   39C8 CD 02 41      [17]  197 	call	_rand
   39CB 01 C7 00      [10]  198 	ld	bc,#0x00C7
   39CE C5            [11]  199 	push	bc
   39CF E5            [11]  200 	push	hl
   39D0 CD AC 43      [17]  201 	call	__modsint
   39D3 F1            [10]  202 	pop	af
   39D4 F1            [10]  203 	pop	af
   39D5 D1            [10]  204 	pop	de
   39D6 7D            [ 4]  205 	ld	a,l
   39D7 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   39DA DD 66 FF      [19]  207 	ld	h,-1 (ix)
   39DD 77            [ 7]  208 	ld	(hl),a
                            209 ;src/starfield/starfield.c:66: aStars[nStar].nStarType = rand() % 3;
   39DE 13            [ 6]  210 	inc	de
   39DF 13            [ 6]  211 	inc	de
   39E0 D5            [11]  212 	push	de
   39E1 CD 02 41      [17]  213 	call	_rand
   39E4 01 03 00      [10]  214 	ld	bc,#0x0003
   39E7 C5            [11]  215 	push	bc
   39E8 E5            [11]  216 	push	hl
   39E9 CD AC 43      [17]  217 	call	__modsint
   39EC F1            [10]  218 	pop	af
   39ED F1            [10]  219 	pop	af
   39EE D1            [10]  220 	pop	de
   39EF 7D            [ 4]  221 	ld	a,l
   39F0 12            [ 7]  222 	ld	(de),a
                            223 ;src/starfield/starfield.c:62: for(nStar = 0; nStar < STARS_NUM; nStar++)
   39F1 DD 34 FD      [23]  224 	inc	-3 (ix)
   39F4 DD 7E FD      [19]  225 	ld	a,-3 (ix)
   39F7 D6 0F         [ 7]  226 	sub	a, #0x0F
   39F9 38 A1         [12]  227 	jr	C,00102$
                            228 ;src/starfield/starfield.c:68: pixelColors[0]=1;
   39FB 21 5B 48      [10]  229 	ld	hl,#_pixelColors
   39FE 36 01         [10]  230 	ld	(hl),#0x01
                            231 ;src/starfield/starfield.c:69: pixelColors[1]=2;
   3A00 23            [ 6]  232 	inc	hl
   3A01 36 02         [10]  233 	ld	(hl),#0x02
                            234 ;src/starfield/starfield.c:70: pixelColors[2]=3;
   3A03 21 5D 48      [10]  235 	ld	hl,#_pixelColors + 2
   3A06 36 03         [10]  236 	ld	(hl),#0x03
   3A08 DD F9         [10]  237 	ld	sp, ix
   3A0A DD E1         [14]  238 	pop	ix
   3A0C C9            [10]  239 	ret
                            240 ;src/starfield/starfield.c:76: void draw_stars(u8* screen){
                            241 ;	---------------------------------
                            242 ; Function draw_stars
                            243 ; ---------------------------------
   3A0D                     244 _draw_stars::
   3A0D DD E5         [15]  245 	push	ix
   3A0F DD 21 00 00   [14]  246 	ld	ix,#0
   3A13 DD 39         [15]  247 	add	ix,sp
   3A15 F5            [11]  248 	push	af
   3A16 F5            [11]  249 	push	af
                            250 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3A17 DD 36 FC 00   [19]  251 	ld	-4 (ix),#0x00
   3A1B                     252 00102$:
                            253 ;src/starfield/starfield.c:82: pStar = &aStars[nStar];
   3A1B DD 6E FC      [19]  254 	ld	l,-4 (ix)
   3A1E 26 00         [ 7]  255 	ld	h,#0x00
   3A20 29            [11]  256 	add	hl, hl
   3A21 29            [11]  257 	add	hl, hl
   3A22 29            [11]  258 	add	hl, hl
   3A23 11 E3 47      [10]  259 	ld	de,#_aStars
   3A26 19            [11]  260 	add	hl,de
   3A27 4D            [ 4]  261 	ld	c, l
   3A28 44            [ 4]  262 	ld	b, h
                            263 ;src/starfield/starfield.c:84: pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
   3A29 21 06 00      [10]  264 	ld	hl,#0x0006
   3A2C 09            [11]  265 	add	hl,bc
   3A2D DD 75 FE      [19]  266 	ld	-2 (ix),l
   3A30 DD 74 FF      [19]  267 	ld	-1 (ix),h
   3A33 69            [ 4]  268 	ld	l, c
   3A34 60            [ 4]  269 	ld	h, b
   3A35 23            [ 6]  270 	inc	hl
   3A36 5E            [ 7]  271 	ld	e,(hl)
   3A37 0A            [ 7]  272 	ld	a,(bc)
   3A38 67            [ 4]  273 	ld	h,a
   3A39 DD 6E 04      [19]  274 	ld	l,4 (ix)
   3A3C DD 56 05      [19]  275 	ld	d,5 (ix)
   3A3F C5            [11]  276 	push	bc
   3A40 7B            [ 4]  277 	ld	a,e
   3A41 F5            [11]  278 	push	af
   3A42 33            [ 6]  279 	inc	sp
   3A43 E5            [11]  280 	push	hl
   3A44 33            [ 6]  281 	inc	sp
   3A45 62            [ 4]  282 	ld	h, d
   3A46 E5            [11]  283 	push	hl
   3A47 CD B8 43      [17]  284 	call	_cpct_getScreenPtr
   3A4A F1            [10]  285 	pop	af
   3A4B F1            [10]  286 	pop	af
   3A4C EB            [ 4]  287 	ex	de,hl
   3A4D C1            [10]  288 	pop	bc
   3A4E DD 6E FE      [19]  289 	ld	l,-2 (ix)
   3A51 DD 66 FF      [19]  290 	ld	h,-1 (ix)
   3A54 73            [ 7]  291 	ld	(hl),e
   3A55 23            [ 6]  292 	inc	hl
   3A56 72            [ 7]  293 	ld	(hl),d
                            294 ;src/starfield/starfield.c:85: *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   3A57 1A            [ 7]  295 	ld	a,(de)
   3A58 DD 77 FE      [19]  296 	ld	-2 (ix),a
   3A5B 0A            [ 7]  297 	ld	a,(bc)
   3A5C E6 01         [ 7]  298 	and	a, #0x01
   3A5E DD 77 FD      [19]  299 	ld	-3 (ix),a
   3A61 69            [ 4]  300 	ld	l, c
   3A62 60            [ 4]  301 	ld	h, b
   3A63 23            [ 6]  302 	inc	hl
   3A64 23            [ 6]  303 	inc	hl
   3A65 46            [ 7]  304 	ld	b,(hl)
   3A66 04            [ 4]  305 	inc	b
   3A67 D5            [11]  306 	push	de
   3A68 DD 7E FD      [19]  307 	ld	a,-3 (ix)
   3A6B F5            [11]  308 	push	af
   3A6C 33            [ 6]  309 	inc	sp
   3A6D C5            [11]  310 	push	bc
   3A6E 33            [ 6]  311 	inc	sp
   3A6F CD 1E 39      [17]  312 	call	_get_mode0_pixel_color_byte
   3A72 F1            [10]  313 	pop	af
   3A73 7D            [ 4]  314 	ld	a,l
   3A74 D1            [10]  315 	pop	de
   3A75 DD AE FE      [19]  316 	xor	a, -2 (ix)
   3A78 12            [ 7]  317 	ld	(de),a
                            318 ;src/starfield/starfield.c:80: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3A79 DD 34 FC      [23]  319 	inc	-4 (ix)
   3A7C DD 7E FC      [19]  320 	ld	a,-4 (ix)
   3A7F D6 0F         [ 7]  321 	sub	a, #0x0F
   3A81 38 98         [12]  322 	jr	C,00102$
   3A83 DD F9         [10]  323 	ld	sp, ix
   3A85 DD E1         [14]  324 	pop	ix
   3A87 C9            [10]  325 	ret
                            326 ;src/starfield/starfield.c:92: void update_stars(){
                            327 ;	---------------------------------
                            328 ; Function update_stars
                            329 ; ---------------------------------
   3A88                     330 _update_stars::
   3A88 DD E5         [15]  331 	push	ix
   3A8A DD 21 00 00   [14]  332 	ld	ix,#0
   3A8E DD 39         [15]  333 	add	ix,sp
   3A90 21 F8 FF      [10]  334 	ld	hl,#-8
   3A93 39            [11]  335 	add	hl,sp
   3A94 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3A95 DD 36 F8 00   [19]  338 	ld	-8 (ix),#0x00
   3A99                     339 00108$:
                            340 ;src/starfield/starfield.c:99: pStar = &aStars[nStar];
   3A99 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   3A9C 26 00         [ 7]  342 	ld	h,#0x00
   3A9E 29            [11]  343 	add	hl, hl
   3A9F 29            [11]  344 	add	hl, hl
   3AA0 29            [11]  345 	add	hl, hl
   3AA1 11 E3 47      [10]  346 	ld	de,#_aStars
   3AA4 19            [11]  347 	add	hl,de
   3AA5 4D            [ 4]  348 	ld	c, l
   3AA6 44            [ 4]  349 	ld	b, h
                            350 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3AA7 21 02 00      [10]  351 	ld	hl,#0x0002
   3AAA 09            [11]  352 	add	hl,bc
   3AAB DD 75 FE      [19]  353 	ld	-2 (ix),l
   3AAE DD 74 FF      [19]  354 	ld	-1 (ix),h
   3AB1 DD 6E FE      [19]  355 	ld	l,-2 (ix)
   3AB4 DD 66 FF      [19]  356 	ld	h,-1 (ix)
   3AB7 7E            [ 7]  357 	ld	a,(hl)
   3AB8 DD 77 FD      [19]  358 	ld	-3 (ix),a
                            359 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3ABB 59            [ 4]  360 	ld	e, c
   3ABC 50            [ 4]  361 	ld	d, b
   3ABD 13            [ 6]  362 	inc	de
                            363 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3ABE 3E 02         [ 7]  364 	ld	a,#0x02
   3AC0 DD 96 FD      [19]  365 	sub	a, -3 (ix)
   3AC3 38 2D         [12]  366 	jr	C,00104$
                            367 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3AC5 1A            [ 7]  368 	ld	a,(de)
   3AC6 DD 77 FC      [19]  369 	ld	-4 (ix), a
   3AC9 3C            [ 4]  370 	inc	a
   3ACA DD 77 FB      [19]  371 	ld	-5 (ix),a
                            372 ;src/starfield/starfield.c:101: switch(pStar->nStarType)
   3ACD D5            [11]  373 	push	de
   3ACE DD 5E FD      [19]  374 	ld	e,-3 (ix)
   3AD1 16 00         [ 7]  375 	ld	d,#0x00
   3AD3 21 DA 3A      [10]  376 	ld	hl,#00125$
   3AD6 19            [11]  377 	add	hl,de
   3AD7 19            [11]  378 	add	hl,de
                            379 ;src/starfield/starfield.c:103: case 0: //slow star
   3AD8 D1            [10]  380 	pop	de
   3AD9 E9            [ 4]  381 	jp	(hl)
   3ADA                     382 00125$:
   3ADA 18 04         [12]  383 	jr	00101$
   3ADC 18 08         [12]  384 	jr	00102$
   3ADE 18 0C         [12]  385 	jr	00103$
   3AE0                     386 00101$:
                            387 ;src/starfield/starfield.c:104: pStar->nY += 1;
   3AE0 DD 7E FB      [19]  388 	ld	a,-5 (ix)
   3AE3 12            [ 7]  389 	ld	(de),a
                            390 ;src/starfield/starfield.c:105: break;
   3AE4 18 0C         [12]  391 	jr	00104$
                            392 ;src/starfield/starfield.c:106: case 1: //medium star
   3AE6                     393 00102$:
                            394 ;src/starfield/starfield.c:107: pStar->nY += 1;
   3AE6 DD 7E FB      [19]  395 	ld	a,-5 (ix)
   3AE9 12            [ 7]  396 	ld	(de),a
                            397 ;src/starfield/starfield.c:108: break;
   3AEA 18 06         [12]  398 	jr	00104$
                            399 ;src/starfield/starfield.c:109: case 2: //fast star
   3AEC                     400 00103$:
                            401 ;src/starfield/starfield.c:110: pStar->nY += 2;
   3AEC DD 7E FC      [19]  402 	ld	a,-4 (ix)
   3AEF C6 02         [ 7]  403 	add	a, #0x02
   3AF1 12            [ 7]  404 	ld	(de),a
                            405 ;src/starfield/starfield.c:112: }
   3AF2                     406 00104$:
                            407 ;src/starfield/starfield.c:114: if(pStar->nY >= 198)
   3AF2 1A            [ 7]  408 	ld	a,(de)
   3AF3 D6 C6         [ 7]  409 	sub	a, #0xC6
   3AF5 38 34         [12]  410 	jr	C,00109$
                            411 ;src/starfield/starfield.c:116: pStar->nY = 0;
   3AF7 AF            [ 4]  412 	xor	a, a
   3AF8 12            [ 7]  413 	ld	(de),a
                            414 ;src/starfield/starfield.c:117: pStar->nX = rand() % 160;
   3AF9 C5            [11]  415 	push	bc
   3AFA CD 02 41      [17]  416 	call	_rand
   3AFD DD 74 FA      [19]  417 	ld	-6 (ix),h
   3B00 DD 75 F9      [19]  418 	ld	-7 (ix),l
   3B03 21 A0 00      [10]  419 	ld	hl,#0x00A0
   3B06 E5            [11]  420 	push	hl
   3B07 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   3B0A DD 66 FA      [19]  422 	ld	h,-6 (ix)
   3B0D E5            [11]  423 	push	hl
   3B0E CD AC 43      [17]  424 	call	__modsint
   3B11 F1            [10]  425 	pop	af
   3B12 F1            [10]  426 	pop	af
   3B13 C1            [10]  427 	pop	bc
   3B14 7D            [ 4]  428 	ld	a,l
   3B15 02            [ 7]  429 	ld	(bc),a
                            430 ;src/starfield/starfield.c:118: pStar->nStarType = rand() % 3;
   3B16 CD 02 41      [17]  431 	call	_rand
   3B19 01 03 00      [10]  432 	ld	bc,#0x0003
   3B1C C5            [11]  433 	push	bc
   3B1D E5            [11]  434 	push	hl
   3B1E CD AC 43      [17]  435 	call	__modsint
   3B21 F1            [10]  436 	pop	af
   3B22 F1            [10]  437 	pop	af
   3B23 7D            [ 4]  438 	ld	a,l
   3B24 DD 6E FE      [19]  439 	ld	l,-2 (ix)
   3B27 DD 66 FF      [19]  440 	ld	h,-1 (ix)
   3B2A 77            [ 7]  441 	ld	(hl),a
   3B2B                     442 00109$:
                            443 ;src/starfield/starfield.c:97: for(nStar = 0; nStar < STARS_NUM; nStar++)
   3B2B DD 34 F8      [23]  444 	inc	-8 (ix)
   3B2E DD 7E F8      [19]  445 	ld	a,-8 (ix)
   3B31 D6 0F         [ 7]  446 	sub	a, #0x0F
   3B33 DA 99 3A      [10]  447 	jp	C,00108$
   3B36 DD F9         [10]  448 	ld	sp, ix
   3B38 DD E1         [14]  449 	pop	ix
   3B3A C9            [10]  450 	ret
                            451 	.area _CODE
                            452 	.area _INITIALIZER
                            453 	.area _CABS (ABS)
