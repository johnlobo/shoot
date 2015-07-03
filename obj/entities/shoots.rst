                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Jul  3 17:13:19 2015
                              5 ;--------------------------------------------------------
                              6 	.module shoots
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_user_max_shoots
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _max_baddie_shoots
                             16 	.globl _active_baddie_shoots
                             17 	.globl _baddie_shoots
                             18 	.globl _active_shoots
                             19 	.globl _shoots
                             20 	.globl _init_shoots
                             21 	.globl _create_shoot
                             22 	.globl _update_shoots
                             23 	.globl _draw_shoots
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   3701                      31 _shoots::
   3701                      32 	.ds 180
   37B5                      33 _active_shoots::
   37B5                      34 	.ds 1
   37B6                      35 _baddie_shoots::
   37B6                      36 	.ds 72
   37FE                      37 _active_baddie_shoots::
   37FE                      38 	.ds 1
   37FF                      39 _max_baddie_shoots::
   37FF                      40 	.ds 1
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/entities/shoots.c:15: void init_shoots(){
                             66 ;	---------------------------------
                             67 ; Function init_shoots
                             68 ; ---------------------------------
   22C1                      69 _init_shoots::
   22C1 DD E5         [15]   70 	push	ix
   22C3 DD 21 00 00   [14]   71 	ld	ix,#0
   22C7 DD 39         [15]   72 	add	ix,sp
   22C9 3B            [ 6]   73 	dec	sp
                             74 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   22CA DD 36 FF 00   [19]   75 	ld	-1 (ix),#0x00
   22CE 11 00 00      [10]   76 	ld	de,#0x0000
   22D1                      77 00102$:
                             78 ;src/entities/shoots.c:18: shoots[k].active=0;
   22D1 21 01 37      [10]   79 	ld	hl,#_shoots
   22D4 19            [11]   80 	add	hl,de
   22D5 4D            [ 4]   81 	ld	c,l
   22D6 44            [ 4]   82 	ld	b,h
   22D7 21 08 00      [10]   83 	ld	hl,#0x0008
   22DA 09            [11]   84 	add	hl,bc
   22DB 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:19: shoots[k].x=0;
   22DD 21 04 00      [10]   87 	ld	hl,#0x0004
   22E0 09            [11]   88 	add	hl,bc
   22E1 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:20: shoots[k].y=0;
   22E3 21 05 00      [10]   91 	ld	hl,#0x0005
   22E6 09            [11]   92 	add	hl,bc
   22E7 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:21: shoots[k].w=0;
   22E9 21 06 00      [10]   95 	ld	hl,#0x0006
   22EC 09            [11]   96 	add	hl,bc
   22ED 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:22: shoots[k].h=0;
   22EF 21 07 00      [10]   99 	ld	hl,#0x0007
   22F2 09            [11]  100 	add	hl,bc
   22F3 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:23: shoots[k].frame=0;
   22F5 21 0A 00      [10]  103 	ld	hl,#0x000A
   22F8 09            [11]  104 	add	hl,bc
   22F9 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/shoots.c:24: shoots[k].new=0;
   22FB 21 0C 00      [10]  107 	ld	hl,#0x000C
   22FE 09            [11]  108 	add	hl,bc
   22FF 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/shoots.c:25: shoots[k].dead=0;
   2301 21 0D 00      [10]  111 	ld	hl,#0x000D
   2304 09            [11]  112 	add	hl,bc
   2305 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/shoots.c:26: shoots[k].lastmoved=0;
   2307 21 0E 00      [10]  115 	ld	hl,#0x000E
   230A 09            [11]  116 	add	hl,bc
   230B AF            [ 4]  117 	xor	a, a
   230C 77            [ 7]  118 	ld	(hl), a
   230D 23            [ 6]  119 	inc	hl
   230E 77            [ 7]  120 	ld	(hl), a
   230F 23            [ 6]  121 	inc	hl
   2310 AF            [ 4]  122 	xor	a, a
   2311 77            [ 7]  123 	ld	(hl), a
   2312 23            [ 6]  124 	inc	hl
   2313 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   2314 21 12 00      [10]  127 	ld	hl,#0x0012
   2317 19            [11]  128 	add	hl,de
   2318 EB            [ 4]  129 	ex	de,hl
   2319 DD 34 FF      [23]  130 	inc	-1 (ix)
   231C DD 7E FF      [19]  131 	ld	a,-1 (ix)
   231F D6 0A         [ 7]  132 	sub	a, #0x0A
   2321 38 AE         [12]  133 	jr	C,00102$
                            134 ;src/entities/shoots.c:28: active_shoots=0;
   2323 21 B5 37      [10]  135 	ld	hl,#_active_shoots + 0
   2326 36 00         [10]  136 	ld	(hl), #0x00
   2328 33            [ 6]  137 	inc	sp
   2329 DD E1         [14]  138 	pop	ix
   232B C9            [10]  139 	ret
                            140 ;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_shoot
                            143 ; ---------------------------------
   232C                     144 _create_shoot::
   232C DD E5         [15]  145 	push	ix
   232E DD 21 00 00   [14]  146 	ld	ix,#0
   2332 DD 39         [15]  147 	add	ix,sp
   2334 21 F4 FF      [10]  148 	ld	hl,#-12
   2337 39            [11]  149 	add	hl,sp
   2338 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
   2339 CD F4 25      [17]  152 	call	_get_user_max_shoots
   233C 55            [ 4]  153 	ld	d,l
   233D 3A B5 37      [13]  154 	ld	a,(#_active_shoots + 0)
   2340 92            [ 4]  155 	sub	a, d
   2341 D2 51 24      [10]  156 	jp	NC,00109$
                            157 ;src/entities/shoots.c:38: while (shoots[k].active){
   2344 11 00 00      [10]  158 	ld	de,#0x0000
   2347                     159 00101$:
   2347 21 01 37      [10]  160 	ld	hl,#_shoots
   234A 19            [11]  161 	add	hl,de
   234B DD 75 FE      [19]  162 	ld	-2 (ix),l
   234E DD 74 FF      [19]  163 	ld	-1 (ix),h
   2351 DD 7E FE      [19]  164 	ld	a,-2 (ix)
   2354 C6 08         [ 7]  165 	add	a, #0x08
   2356 6F            [ 4]  166 	ld	l,a
   2357 DD 7E FF      [19]  167 	ld	a,-1 (ix)
   235A CE 00         [ 7]  168 	adc	a, #0x00
   235C 67            [ 4]  169 	ld	h,a
   235D 7E            [ 7]  170 	ld	a,(hl)
   235E B7            [ 4]  171 	or	a, a
   235F 28 07         [12]  172 	jr	Z,00103$
                            173 ;src/entities/shoots.c:39: k++;
   2361 21 12 00      [10]  174 	ld	hl,#0x0012
   2364 19            [11]  175 	add	hl,de
   2365 EB            [ 4]  176 	ex	de,hl
   2366 18 DF         [12]  177 	jr	00101$
   2368                     178 00103$:
                            179 ;src/entities/shoots.c:41: shoots[k].active=1;
   2368 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/shoots.c:42: shoots[k].frame=0;
   236A DD 7E FE      [19]  182 	ld	a,-2 (ix)
   236D C6 0A         [ 7]  183 	add	a, #0x0A
   236F 6F            [ 4]  184 	ld	l,a
   2370 DD 7E FF      [19]  185 	ld	a,-1 (ix)
   2373 CE 00         [ 7]  186 	adc	a, #0x00
   2375 67            [ 4]  187 	ld	h,a
   2376 36 00         [10]  188 	ld	(hl),#0x00
                            189 ;src/entities/shoots.c:46: shoots[k].x=x;
   2378 DD 7E FE      [19]  190 	ld	a,-2 (ix)
   237B C6 04         [ 7]  191 	add	a, #0x04
   237D DD 77 FC      [19]  192 	ld	-4 (ix),a
   2380 DD 7E FF      [19]  193 	ld	a,-1 (ix)
   2383 CE 00         [ 7]  194 	adc	a, #0x00
   2385 DD 77 FD      [19]  195 	ld	-3 (ix),a
                            196 ;src/entities/shoots.c:47: shoots[k].y=y;
   2388 DD 7E FE      [19]  197 	ld	a,-2 (ix)
   238B C6 05         [ 7]  198 	add	a, #0x05
   238D DD 77 FA      [19]  199 	ld	-6 (ix),a
   2390 DD 7E FF      [19]  200 	ld	a,-1 (ix)
   2393 CE 00         [ 7]  201 	adc	a, #0x00
   2395 DD 77 FB      [19]  202 	ld	-5 (ix),a
                            203 ;src/entities/shoots.c:48: shoots[k].w=1;
   2398 DD 7E FE      [19]  204 	ld	a,-2 (ix)
   239B C6 06         [ 7]  205 	add	a, #0x06
   239D DD 77 F8      [19]  206 	ld	-8 (ix),a
   23A0 DD 7E FF      [19]  207 	ld	a,-1 (ix)
   23A3 CE 00         [ 7]  208 	adc	a, #0x00
   23A5 DD 77 F9      [19]  209 	ld	-7 (ix),a
                            210 ;src/entities/shoots.c:49: shoots[k].h=4;
   23A8 DD 7E FE      [19]  211 	ld	a,-2 (ix)
   23AB C6 07         [ 7]  212 	add	a, #0x07
   23AD DD 77 F6      [19]  213 	ld	-10 (ix),a
   23B0 DD 7E FF      [19]  214 	ld	a,-1 (ix)
   23B3 CE 00         [ 7]  215 	adc	a, #0x00
   23B5 DD 77 F7      [19]  216 	ld	-9 (ix),a
                            217 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   23B8 DD 7E FE      [19]  218 	ld	a,-2 (ix)
   23BB C6 09         [ 7]  219 	add	a, #0x09
   23BD DD 77 F4      [19]  220 	ld	-12 (ix),a
   23C0 DD 7E FF      [19]  221 	ld	a,-1 (ix)
   23C3 CE 00         [ 7]  222 	adc	a, #0x00
   23C5 DD 77 F5      [19]  223 	ld	-11 (ix),a
                            224 ;src/entities/shoots.c:43: switch (type){
   23C8 DD 7E 06      [19]  225 	ld	a,6 (ix)
   23CB 3D            [ 4]  226 	dec	a
   23CC 20 35         [12]  227 	jr	NZ,00105$
                            228 ;src/entities/shoots.c:46: shoots[k].x=x;
   23CE DD 6E FC      [19]  229 	ld	l,-4 (ix)
   23D1 DD 66 FD      [19]  230 	ld	h,-3 (ix)
   23D4 DD 7E 04      [19]  231 	ld	a,4 (ix)
   23D7 77            [ 7]  232 	ld	(hl),a
                            233 ;src/entities/shoots.c:47: shoots[k].y=y;
   23D8 DD 6E FA      [19]  234 	ld	l,-6 (ix)
   23DB DD 66 FB      [19]  235 	ld	h,-5 (ix)
   23DE DD 7E 05      [19]  236 	ld	a,5 (ix)
   23E1 77            [ 7]  237 	ld	(hl),a
                            238 ;src/entities/shoots.c:48: shoots[k].w=1;
   23E2 DD 6E F8      [19]  239 	ld	l,-8 (ix)
   23E5 DD 66 F9      [19]  240 	ld	h,-7 (ix)
   23E8 36 01         [10]  241 	ld	(hl),#0x01
                            242 ;src/entities/shoots.c:49: shoots[k].h=4;
   23EA DD 6E F6      [19]  243 	ld	l,-10 (ix)
   23ED DD 66 F7      [19]  244 	ld	h,-9 (ix)
   23F0 36 04         [10]  245 	ld	(hl),#0x04
                            246 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   23F2 E1            [10]  247 	pop	hl
   23F3 E5            [11]  248 	push	hl
   23F4 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
   23F6 DD 6E FE      [19]  251 	ld	l,-2 (ix)
   23F9 DD 66 FF      [19]  252 	ld	h,-1 (ix)
   23FC 36 75         [10]  253 	ld	(hl),#<(_bullet02_0)
   23FE 23            [ 6]  254 	inc	hl
   23FF 36 29         [10]  255 	ld	(hl),#>(_bullet02_0)
                            256 ;src/entities/shoots.c:52: break;
   2401 18 4A         [12]  257 	jr	00106$
                            258 ;src/entities/shoots.c:53: default:
   2403                     259 00105$:
                            260 ;src/entities/shoots.c:54: shoots[k].x=x;
   2403 DD 6E FC      [19]  261 	ld	l,-4 (ix)
   2406 DD 66 FD      [19]  262 	ld	h,-3 (ix)
   2409 DD 7E 04      [19]  263 	ld	a,4 (ix)
   240C 77            [ 7]  264 	ld	(hl),a
                            265 ;src/entities/shoots.c:55: shoots[k].y=y;
   240D DD 6E FA      [19]  266 	ld	l,-6 (ix)
   2410 DD 66 FB      [19]  267 	ld	h,-5 (ix)
   2413 DD 7E 05      [19]  268 	ld	a,5 (ix)
   2416 77            [ 7]  269 	ld	(hl),a
                            270 ;src/entities/shoots.c:56: shoots[k].w=1;
   2417 DD 6E F8      [19]  271 	ld	l,-8 (ix)
   241A DD 66 F9      [19]  272 	ld	h,-7 (ix)
   241D 36 01         [10]  273 	ld	(hl),#0x01
                            274 ;src/entities/shoots.c:57: shoots[k].h=8;
   241F DD 6E F6      [19]  275 	ld	l,-10 (ix)
   2422 DD 66 F7      [19]  276 	ld	h,-9 (ix)
   2425 36 08         [10]  277 	ld	(hl),#0x08
                            278 ;src/entities/shoots.c:58: shoots[k].num_frames=2;
   2427 E1            [10]  279 	pop	hl
   2428 E5            [11]  280 	push	hl
   2429 36 02         [10]  281 	ld	(hl),#0x02
                            282 ;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
   242B DD 6E FE      [19]  283 	ld	l,-2 (ix)
   242E DD 66 FF      [19]  284 	ld	h,-1 (ix)
   2431 36 65         [10]  285 	ld	(hl),#<(_bullet01_0)
   2433 23            [ 6]  286 	inc	hl
   2434 36 29         [10]  287 	ld	(hl),#>(_bullet01_0)
                            288 ;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
   2436 DD 7E FE      [19]  289 	ld	a,-2 (ix)
   2439 C6 02         [ 7]  290 	add	a, #0x02
   243B DD 77 F4      [19]  291 	ld	-12 (ix),a
   243E DD 7E FF      [19]  292 	ld	a,-1 (ix)
   2441 CE 00         [ 7]  293 	adc	a, #0x00
   2443 DD 77 F5      [19]  294 	ld	-11 (ix),a
   2446 E1            [10]  295 	pop	hl
   2447 E5            [11]  296 	push	hl
   2448 36 6D         [10]  297 	ld	(hl),#<(_bullet01_1)
   244A 23            [ 6]  298 	inc	hl
   244B 36 29         [10]  299 	ld	(hl),#>(_bullet01_1)
                            300 ;src/entities/shoots.c:62: }
   244D                     301 00106$:
                            302 ;src/entities/shoots.c:63: active_shoots++;
   244D 21 B5 37      [10]  303 	ld	hl, #_active_shoots+0
   2450 34            [11]  304 	inc	(hl)
   2451                     305 00109$:
   2451 DD F9         [10]  306 	ld	sp, ix
   2453 DD E1         [14]  307 	pop	ix
   2455 C9            [10]  308 	ret
                            309 ;src/entities/shoots.c:72: void update_shoots(){
                            310 ;	---------------------------------
                            311 ; Function update_shoots
                            312 ; ---------------------------------
   2456                     313 _update_shoots::
   2456 DD E5         [15]  314 	push	ix
   2458 DD 21 00 00   [14]  315 	ld	ix,#0
   245C DD 39         [15]  316 	add	ix,sp
   245E F5            [11]  317 	push	af
   245F 3B            [ 6]  318 	dec	sp
                            319 ;src/entities/shoots.c:75: if (active_shoots>0){
   2460 3A B5 37      [13]  320 	ld	a,(#_active_shoots + 0)
   2463 B7            [ 4]  321 	or	a, a
   2464 CA E7 24      [10]  322 	jp	Z,00113$
                            323 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2467 DD 36 FD 00   [19]  324 	ld	-3 (ix),#0x00
   246B 11 00 00      [10]  325 	ld	de,#0x0000
   246E                     326 00111$:
                            327 ;src/entities/shoots.c:77: if (shoots[i].active){
   246E 21 01 37      [10]  328 	ld	hl,#_shoots
   2471 19            [11]  329 	add	hl,de
   2472 DD 75 FE      [19]  330 	ld	-2 (ix),l
   2475 DD 74 FF      [19]  331 	ld	-1 (ix),h
   2478 DD 7E FE      [19]  332 	ld	a,-2 (ix)
   247B C6 08         [ 7]  333 	add	a, #0x08
   247D 4F            [ 4]  334 	ld	c,a
   247E DD 7E FF      [19]  335 	ld	a,-1 (ix)
   2481 CE 00         [ 7]  336 	adc	a, #0x00
   2483 47            [ 4]  337 	ld	b,a
   2484 0A            [ 7]  338 	ld	a,(bc)
   2485 B7            [ 4]  339 	or	a, a
   2486 28 50         [12]  340 	jr	Z,00112$
                            341 ;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
   2488 FD 21 05 00   [14]  342 	ld	iy,#0x0005
   248C C5            [11]  343 	push	bc
   248D DD 4E FE      [19]  344 	ld	c,-2 (ix)
   2490 DD 46 FF      [19]  345 	ld	b,-1 (ix)
   2493 FD 09         [15]  346 	add	iy, bc
   2495 C1            [10]  347 	pop	bc
   2496 FD 7E 00      [19]  348 	ld	a, 0 (iy)
   2499 C6 F8         [ 7]  349 	add	a,#0xF8
   249B 67            [ 4]  350 	ld	h,a
   249C FD 74 00      [19]  351 	ld	0 (iy), h
                            352 ;src/entities/shoots.c:79: if (shoots[i].y<200){
   249F 7C            [ 4]  353 	ld	a,h
   24A0 D6 C8         [ 7]  354 	sub	a, #0xC8
   24A2 30 2E         [12]  355 	jr	NC,00104$
                            356 ;src/entities/shoots.c:80: shoots[i].frame++;
   24A4 FD 21 0A 00   [14]  357 	ld	iy,#0x000A
   24A8 DD 4E FE      [19]  358 	ld	c,-2 (ix)
   24AB DD 46 FF      [19]  359 	ld	b,-1 (ix)
   24AE FD 09         [15]  360 	add	iy, bc
   24B0 FD 34 00      [23]  361 	inc	0 (iy)
   24B3 FD 4E 00      [19]  362 	ld	c, 0 (iy)
                            363 ;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
   24B6 DD 6E FE      [19]  364 	ld	l,-2 (ix)
   24B9 DD 66 FF      [19]  365 	ld	h,-1 (ix)
   24BC C5            [11]  366 	push	bc
   24BD 01 09 00      [10]  367 	ld	bc, #0x0009
   24C0 09            [11]  368 	add	hl, bc
   24C1 C1            [10]  369 	pop	bc
   24C2 7E            [ 7]  370 	ld	a,(hl)
   24C3 DD 77 FE      [19]  371 	ld	-2 (ix),a
   24C6 79            [ 4]  372 	ld	a,c
   24C7 DD 96 FE      [19]  373 	sub	a, -2 (ix)
   24CA 20 0C         [12]  374 	jr	NZ,00112$
                            375 ;src/entities/shoots.c:82: shoots[i].frame=0;
   24CC FD 36 00 00   [19]  376 	ld	0 (iy), #0x00
   24D0 18 06         [12]  377 	jr	00112$
   24D2                     378 00104$:
                            379 ;src/entities/shoots.c:85: shoots[i].active=0;
   24D2 AF            [ 4]  380 	xor	a, a
   24D3 02            [ 7]  381 	ld	(bc),a
                            382 ;src/entities/shoots.c:86: active_shoots--;
   24D4 21 B5 37      [10]  383 	ld	hl, #_active_shoots+0
   24D7 35            [11]  384 	dec	(hl)
   24D8                     385 00112$:
                            386 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   24D8 21 12 00      [10]  387 	ld	hl,#0x0012
   24DB 19            [11]  388 	add	hl,de
   24DC EB            [ 4]  389 	ex	de,hl
   24DD DD 34 FD      [23]  390 	inc	-3 (ix)
   24E0 DD 7E FD      [19]  391 	ld	a,-3 (ix)
   24E3 D6 0A         [ 7]  392 	sub	a, #0x0A
   24E5 38 87         [12]  393 	jr	C,00111$
   24E7                     394 00113$:
   24E7 DD F9         [10]  395 	ld	sp, ix
   24E9 DD E1         [14]  396 	pop	ix
   24EB C9            [10]  397 	ret
                            398 ;src/entities/shoots.c:98: void draw_shoots(u8* screen){
                            399 ;	---------------------------------
                            400 ; Function draw_shoots
                            401 ; ---------------------------------
   24EC                     402 _draw_shoots::
   24EC DD E5         [15]  403 	push	ix
   24EE DD 21 00 00   [14]  404 	ld	ix,#0
   24F2 DD 39         [15]  405 	add	ix,sp
   24F4 21 F9 FF      [10]  406 	ld	hl,#-7
   24F7 39            [11]  407 	add	hl,sp
   24F8 F9            [ 6]  408 	ld	sp,hl
                            409 ;src/entities/shoots.c:103: if (active_shoots>0){
   24F9 3A B5 37      [13]  410 	ld	a,(#_active_shoots + 0)
   24FC B7            [ 4]  411 	or	a, a
   24FD CA B5 25      [10]  412 	jp	Z,00108$
                            413 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2500 DD 36 F9 00   [19]  414 	ld	-7 (ix),#0x00
   2504 11 00 00      [10]  415 	ld	de,#0x0000
   2507                     416 00106$:
                            417 ;src/entities/shoots.c:105: if (shoots[k].active){
   2507 21 01 37      [10]  418 	ld	hl,#_shoots
   250A 19            [11]  419 	add	hl,de
   250B DD 75 FD      [19]  420 	ld	-3 (ix),l
   250E DD 74 FE      [19]  421 	ld	-2 (ix),h
   2511 DD 6E FD      [19]  422 	ld	l,-3 (ix)
   2514 DD 66 FE      [19]  423 	ld	h,-2 (ix)
   2517 01 08 00      [10]  424 	ld	bc, #0x0008
   251A 09            [11]  425 	add	hl, bc
   251B 7E            [ 7]  426 	ld	a,(hl)
   251C B7            [ 4]  427 	or	a, a
   251D CA A5 25      [10]  428 	jp	Z,00107$
                            429 ;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   2520 DD 6E FD      [19]  430 	ld	l,-3 (ix)
   2523 DD 66 FE      [19]  431 	ld	h,-2 (ix)
   2526 01 05 00      [10]  432 	ld	bc, #0x0005
   2529 09            [11]  433 	add	hl, bc
   252A 46            [ 7]  434 	ld	b,(hl)
   252B DD 6E FD      [19]  435 	ld	l,-3 (ix)
   252E DD 66 FE      [19]  436 	ld	h,-2 (ix)
   2531 23            [ 6]  437 	inc	hl
   2532 23            [ 6]  438 	inc	hl
   2533 23            [ 6]  439 	inc	hl
   2534 23            [ 6]  440 	inc	hl
   2535 4E            [ 7]  441 	ld	c,(hl)
   2536 E5            [11]  442 	push	hl
   2537 DD 6E 04      [19]  443 	ld	l,4 (ix)
   253A DD 66 05      [19]  444 	ld	h,5 (ix)
   253D E5            [11]  445 	push	hl
   253E FD E1         [14]  446 	pop	iy
   2540 E1            [10]  447 	pop	hl
   2541 D5            [11]  448 	push	de
   2542 C5            [11]  449 	push	bc
   2543 FD E5         [15]  450 	push	iy
   2545 CD 63 35      [17]  451 	call	_cpct_getScreenPtr
   2548 F1            [10]  452 	pop	af
   2549 F1            [10]  453 	pop	af
   254A D1            [10]  454 	pop	de
   254B 45            [ 4]  455 	ld	b,l
   254C 4C            [ 4]  456 	ld	c,h
                            457 ;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   254D DD 6E FD      [19]  458 	ld	l,-3 (ix)
   2550 DD 66 FE      [19]  459 	ld	h,-2 (ix)
   2553 C5            [11]  460 	push	bc
   2554 01 07 00      [10]  461 	ld	bc, #0x0007
   2557 09            [11]  462 	add	hl, bc
   2558 C1            [10]  463 	pop	bc
   2559 7E            [ 7]  464 	ld	a,(hl)
   255A DD 77 FF      [19]  465 	ld	-1 (ix),a
   255D DD 6E FD      [19]  466 	ld	l,-3 (ix)
   2560 DD 66 FE      [19]  467 	ld	h,-2 (ix)
   2563 C5            [11]  468 	push	bc
   2564 01 06 00      [10]  469 	ld	bc, #0x0006
   2567 09            [11]  470 	add	hl, bc
   2568 C1            [10]  471 	pop	bc
   2569 7E            [ 7]  472 	ld	a,(hl)
   256A DD 77 FC      [19]  473 	ld	-4 (ix),a
   256D DD 70 FA      [19]  474 	ld	-6 (ix),b
   2570 DD 71 FB      [19]  475 	ld	-5 (ix),c
   2573 DD 6E FD      [19]  476 	ld	l,-3 (ix)
   2576 DD 66 FE      [19]  477 	ld	h,-2 (ix)
   2579 01 0A 00      [10]  478 	ld	bc, #0x000A
   257C 09            [11]  479 	add	hl, bc
   257D 7E            [ 7]  480 	ld	a,(hl)
   257E 87            [ 4]  481 	add	a, a
   257F 4F            [ 4]  482 	ld	c,a
   2580 DD 6E FD      [19]  483 	ld	l,-3 (ix)
   2583 DD 66 FE      [19]  484 	ld	h,-2 (ix)
   2586 06 00         [ 7]  485 	ld	b,#0x00
   2588 09            [11]  486 	add	hl, bc
   2589 4E            [ 7]  487 	ld	c,(hl)
   258A 23            [ 6]  488 	inc	hl
   258B 46            [ 7]  489 	ld	b,(hl)
   258C D5            [11]  490 	push	de
   258D DD 66 FF      [19]  491 	ld	h,-1 (ix)
   2590 DD 6E FC      [19]  492 	ld	l,-4 (ix)
   2593 E5            [11]  493 	push	hl
   2594 DD 6E FA      [19]  494 	ld	l,-6 (ix)
   2597 DD 66 FB      [19]  495 	ld	h,-5 (ix)
   259A E5            [11]  496 	push	hl
   259B C5            [11]  497 	push	bc
   259C CD 34 33      [17]  498 	call	_cpct_drawSprite
   259F 21 06 00      [10]  499 	ld	hl,#6
   25A2 39            [11]  500 	add	hl,sp
   25A3 F9            [ 6]  501 	ld	sp,hl
   25A4 D1            [10]  502 	pop	de
   25A5                     503 00107$:
                            504 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   25A5 21 12 00      [10]  505 	ld	hl,#0x0012
   25A8 19            [11]  506 	add	hl,de
   25A9 EB            [ 4]  507 	ex	de,hl
   25AA DD 34 F9      [23]  508 	inc	-7 (ix)
   25AD DD 7E F9      [19]  509 	ld	a,-7 (ix)
   25B0 D6 0A         [ 7]  510 	sub	a, #0x0A
   25B2 DA 07 25      [10]  511 	jp	C,00106$
   25B5                     512 00108$:
   25B5 DD F9         [10]  513 	ld	sp, ix
   25B7 DD E1         [14]  514 	pop	ix
   25B9 C9            [10]  515 	ret
                            516 	.area _CODE
                            517 	.area _INITIALIZER
                            518 	.area _CABS (ABS)
