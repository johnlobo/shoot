                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:53 2015
                              5 ;--------------------------------------------------------
                              6 	.module shoots
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_explosion
                             13 	.globl _add_score
                             14 	.globl _get_user_max_shoots
                             15 	.globl _check_collision_enemies
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_drawSprite
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
   63F9                      31 _shoots::
   63F9                      32 	.ds 160
   6499                      33 _active_shoots::
   6499                      34 	.ds 1
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/entities/shoots.c:13: void init_shoots(){
                             60 ;	---------------------------------
                             61 ; Function init_shoots
                             62 ; ---------------------------------
   336B                      63 _init_shoots::
                             64 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   336B 16 00         [ 7]   65 	ld	d,#0x00
   336D                      66 00102$:
                             67 ;src/entities/shoots.c:16: shoots[k].active=0;
   336D 6A            [ 4]   68 	ld	l,d
   336E 26 00         [ 7]   69 	ld	h,#0x00
   3370 29            [11]   70 	add	hl, hl
   3371 29            [11]   71 	add	hl, hl
   3372 29            [11]   72 	add	hl, hl
   3373 29            [11]   73 	add	hl, hl
   3374 3E F9         [ 7]   74 	ld	a,#<(_shoots)
   3376 85            [ 4]   75 	add	a, l
   3377 4F            [ 4]   76 	ld	c,a
   3378 3E 63         [ 7]   77 	ld	a,#>(_shoots)
   337A 8C            [ 4]   78 	adc	a, h
   337B 47            [ 4]   79 	ld	b,a
   337C 21 08 00      [10]   80 	ld	hl,#0x0008
   337F 09            [11]   81 	add	hl,bc
   3380 36 00         [10]   82 	ld	(hl),#0x00
                             83 ;src/entities/shoots.c:17: shoots[k].x=0;
   3382 21 04 00      [10]   84 	ld	hl,#0x0004
   3385 09            [11]   85 	add	hl,bc
   3386 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/shoots.c:18: shoots[k].y=0;
   3388 21 05 00      [10]   88 	ld	hl,#0x0005
   338B 09            [11]   89 	add	hl,bc
   338C 36 00         [10]   90 	ld	(hl),#0x00
                             91 ;src/entities/shoots.c:19: shoots[k].w=0;
   338E 21 06 00      [10]   92 	ld	hl,#0x0006
   3391 09            [11]   93 	add	hl,bc
   3392 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/shoots.c:20: shoots[k].h=0;
   3394 21 07 00      [10]   96 	ld	hl,#0x0007
   3397 09            [11]   97 	add	hl,bc
   3398 36 00         [10]   98 	ld	(hl),#0x00
                             99 ;src/entities/shoots.c:21: shoots[k].frame=0;
   339A 21 0A 00      [10]  100 	ld	hl,#0x000A
   339D 09            [11]  101 	add	hl,bc
   339E 36 00         [10]  102 	ld	(hl),#0x00
                            103 ;src/entities/shoots.c:22: shoots[k].lastmoved=0;
   33A0 21 0C 00      [10]  104 	ld	hl,#0x000C
   33A3 09            [11]  105 	add	hl,bc
   33A4 AF            [ 4]  106 	xor	a, a
   33A5 77            [ 7]  107 	ld	(hl), a
   33A6 23            [ 6]  108 	inc	hl
   33A7 77            [ 7]  109 	ld	(hl), a
   33A8 23            [ 6]  110 	inc	hl
   33A9 AF            [ 4]  111 	xor	a, a
   33AA 77            [ 7]  112 	ld	(hl), a
   33AB 23            [ 6]  113 	inc	hl
   33AC 77            [ 7]  114 	ld	(hl), a
                            115 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   33AD 14            [ 4]  116 	inc	d
   33AE 7A            [ 4]  117 	ld	a,d
   33AF D6 0A         [ 7]  118 	sub	a, #0x0A
   33B1 38 BA         [12]  119 	jr	C,00102$
                            120 ;src/entities/shoots.c:24: active_shoots=0;
   33B3 21 99 64      [10]  121 	ld	hl,#_active_shoots + 0
   33B6 36 00         [10]  122 	ld	(hl), #0x00
   33B8 C9            [10]  123 	ret
                            124 ;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
                            125 ;	---------------------------------
                            126 ; Function create_shoot
                            127 ; ---------------------------------
   33B9                     128 _create_shoot::
   33B9 DD E5         [15]  129 	push	ix
   33BB DD 21 00 00   [14]  130 	ld	ix,#0
   33BF DD 39         [15]  131 	add	ix,sp
   33C1 21 F4 FF      [10]  132 	ld	hl,#-12
   33C4 39            [11]  133 	add	hl,sp
   33C5 F9            [ 6]  134 	ld	sp,hl
                            135 ;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
   33C6 CD 63 37      [17]  136 	call	_get_user_max_shoots
   33C9 55            [ 4]  137 	ld	d,l
   33CA 3A 99 64      [13]  138 	ld	a,(#_active_shoots + 0)
   33CD 92            [ 4]  139 	sub	a, d
   33CE D2 E4 34      [10]  140 	jp	NC,00109$
                            141 ;src/entities/shoots.c:34: while (shoots[k].active){
   33D1 01 F9 63      [10]  142 	ld	bc,#_shoots+0
   33D4 16 00         [ 7]  143 	ld	d,#0x00
   33D6                     144 00101$:
   33D6 6A            [ 4]  145 	ld	l,d
   33D7 26 00         [ 7]  146 	ld	h,#0x00
   33D9 29            [11]  147 	add	hl, hl
   33DA 29            [11]  148 	add	hl, hl
   33DB 29            [11]  149 	add	hl, hl
   33DC 29            [11]  150 	add	hl, hl
   33DD 09            [11]  151 	add	hl,bc
   33DE DD 75 FA      [19]  152 	ld	-6 (ix),l
   33E1 DD 74 FB      [19]  153 	ld	-5 (ix),h
   33E4 DD 7E FA      [19]  154 	ld	a,-6 (ix)
   33E7 C6 08         [ 7]  155 	add	a, #0x08
   33E9 6F            [ 4]  156 	ld	l,a
   33EA DD 7E FB      [19]  157 	ld	a,-5 (ix)
   33ED CE 00         [ 7]  158 	adc	a, #0x00
   33EF 67            [ 4]  159 	ld	h,a
   33F0 7E            [ 7]  160 	ld	a,(hl)
   33F1 B7            [ 4]  161 	or	a, a
   33F2 28 03         [12]  162 	jr	Z,00103$
                            163 ;src/entities/shoots.c:35: k++;
   33F4 14            [ 4]  164 	inc	d
   33F5 18 DF         [12]  165 	jr	00101$
   33F7                     166 00103$:
                            167 ;src/entities/shoots.c:37: shoots[k].active=1;
   33F7 36 01         [10]  168 	ld	(hl),#0x01
                            169 ;src/entities/shoots.c:38: shoots[k].frame=0;
   33F9 DD 7E FA      [19]  170 	ld	a,-6 (ix)
   33FC C6 0A         [ 7]  171 	add	a, #0x0A
   33FE 6F            [ 4]  172 	ld	l,a
   33FF DD 7E FB      [19]  173 	ld	a,-5 (ix)
   3402 CE 00         [ 7]  174 	adc	a, #0x00
   3404 67            [ 4]  175 	ld	h,a
   3405 36 00         [10]  176 	ld	(hl),#0x00
                            177 ;src/entities/shoots.c:42: shoots[k].x=x;
   3407 DD 7E FA      [19]  178 	ld	a,-6 (ix)
   340A C6 04         [ 7]  179 	add	a, #0x04
   340C DD 77 F4      [19]  180 	ld	-12 (ix),a
   340F DD 7E FB      [19]  181 	ld	a,-5 (ix)
   3412 CE 00         [ 7]  182 	adc	a, #0x00
   3414 DD 77 F5      [19]  183 	ld	-11 (ix),a
                            184 ;src/entities/shoots.c:43: shoots[k].y=y;
   3417 DD 7E FA      [19]  185 	ld	a,-6 (ix)
   341A C6 05         [ 7]  186 	add	a, #0x05
   341C DD 77 FC      [19]  187 	ld	-4 (ix),a
   341F DD 7E FB      [19]  188 	ld	a,-5 (ix)
   3422 CE 00         [ 7]  189 	adc	a, #0x00
   3424 DD 77 FD      [19]  190 	ld	-3 (ix),a
                            191 ;src/entities/shoots.c:44: shoots[k].w=1;
   3427 DD 7E FA      [19]  192 	ld	a,-6 (ix)
   342A C6 06         [ 7]  193 	add	a, #0x06
   342C DD 77 FE      [19]  194 	ld	-2 (ix),a
   342F DD 7E FB      [19]  195 	ld	a,-5 (ix)
   3432 CE 00         [ 7]  196 	adc	a, #0x00
   3434 DD 77 FF      [19]  197 	ld	-1 (ix),a
                            198 ;src/entities/shoots.c:45: shoots[k].h=4;
   3437 DD 7E FA      [19]  199 	ld	a,-6 (ix)
   343A C6 07         [ 7]  200 	add	a, #0x07
   343C DD 77 F6      [19]  201 	ld	-10 (ix),a
   343F DD 7E FB      [19]  202 	ld	a,-5 (ix)
   3442 CE 00         [ 7]  203 	adc	a, #0x00
   3444 DD 77 F7      [19]  204 	ld	-9 (ix),a
                            205 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   3447 DD 7E FA      [19]  206 	ld	a,-6 (ix)
   344A C6 09         [ 7]  207 	add	a, #0x09
   344C DD 77 F8      [19]  208 	ld	-8 (ix),a
   344F DD 7E FB      [19]  209 	ld	a,-5 (ix)
   3452 CE 00         [ 7]  210 	adc	a, #0x00
   3454 DD 77 F9      [19]  211 	ld	-7 (ix),a
                            212 ;src/entities/shoots.c:39: switch (type){
   3457 DD 7E 06      [19]  213 	ld	a,6 (ix)
   345A 3D            [ 4]  214 	dec	a
   345B 20 35         [12]  215 	jr	NZ,00105$
                            216 ;src/entities/shoots.c:42: shoots[k].x=x;
   345D E1            [10]  217 	pop	hl
   345E E5            [11]  218 	push	hl
   345F DD 7E 04      [19]  219 	ld	a,4 (ix)
   3462 77            [ 7]  220 	ld	(hl),a
                            221 ;src/entities/shoots.c:43: shoots[k].y=y;
   3463 DD 6E FC      [19]  222 	ld	l,-4 (ix)
   3466 DD 66 FD      [19]  223 	ld	h,-3 (ix)
   3469 DD 7E 05      [19]  224 	ld	a,5 (ix)
   346C 77            [ 7]  225 	ld	(hl),a
                            226 ;src/entities/shoots.c:44: shoots[k].w=1;
   346D DD 6E FE      [19]  227 	ld	l,-2 (ix)
   3470 DD 66 FF      [19]  228 	ld	h,-1 (ix)
   3473 36 01         [10]  229 	ld	(hl),#0x01
                            230 ;src/entities/shoots.c:45: shoots[k].h=4;
   3475 DD 6E F6      [19]  231 	ld	l,-10 (ix)
   3478 DD 66 F7      [19]  232 	ld	h,-9 (ix)
   347B 36 04         [10]  233 	ld	(hl),#0x04
                            234 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   347D DD 6E F8      [19]  235 	ld	l,-8 (ix)
   3480 DD 66 F9      [19]  236 	ld	h,-7 (ix)
   3483 36 01         [10]  237 	ld	(hl),#0x01
                            238 ;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
   3485 DD 6E FA      [19]  239 	ld	l,-6 (ix)
   3488 DD 66 FB      [19]  240 	ld	h,-5 (ix)
   348B 36 88         [10]  241 	ld	(hl),#<(_bullet02_0)
   348D 23            [ 6]  242 	inc	hl
   348E 36 40         [10]  243 	ld	(hl),#>(_bullet02_0)
                            244 ;src/entities/shoots.c:48: break;
   3490 18 4E         [12]  245 	jr	00106$
                            246 ;src/entities/shoots.c:49: default:
   3492                     247 00105$:
                            248 ;src/entities/shoots.c:50: shoots[k].x=x;
   3492 E1            [10]  249 	pop	hl
   3493 E5            [11]  250 	push	hl
   3494 DD 7E 04      [19]  251 	ld	a,4 (ix)
   3497 77            [ 7]  252 	ld	(hl),a
                            253 ;src/entities/shoots.c:51: shoots[k].y=y;
   3498 DD 6E FC      [19]  254 	ld	l,-4 (ix)
   349B DD 66 FD      [19]  255 	ld	h,-3 (ix)
   349E DD 7E 05      [19]  256 	ld	a,5 (ix)
   34A1 77            [ 7]  257 	ld	(hl),a
                            258 ;src/entities/shoots.c:52: shoots[k].w=1;
   34A2 DD 6E FE      [19]  259 	ld	l,-2 (ix)
   34A5 DD 66 FF      [19]  260 	ld	h,-1 (ix)
   34A8 36 01         [10]  261 	ld	(hl),#0x01
                            262 ;src/entities/shoots.c:53: shoots[k].h=8;
   34AA DD 6E F6      [19]  263 	ld	l,-10 (ix)
   34AD DD 66 F7      [19]  264 	ld	h,-9 (ix)
   34B0 36 08         [10]  265 	ld	(hl),#0x08
                            266 ;src/entities/shoots.c:54: shoots[k].num_frames=2;
   34B2 DD 6E F8      [19]  267 	ld	l,-8 (ix)
   34B5 DD 66 F9      [19]  268 	ld	h,-7 (ix)
   34B8 36 02         [10]  269 	ld	(hl),#0x02
                            270 ;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
   34BA DD 6E FA      [19]  271 	ld	l,-6 (ix)
   34BD DD 66 FB      [19]  272 	ld	h,-5 (ix)
   34C0 36 78         [10]  273 	ld	(hl),#<(_bullet01_0)
   34C2 23            [ 6]  274 	inc	hl
   34C3 36 40         [10]  275 	ld	(hl),#>(_bullet01_0)
                            276 ;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
   34C5 DD 7E FA      [19]  277 	ld	a,-6 (ix)
   34C8 C6 02         [ 7]  278 	add	a, #0x02
   34CA DD 77 F8      [19]  279 	ld	-8 (ix),a
   34CD DD 7E FB      [19]  280 	ld	a,-5 (ix)
   34D0 CE 00         [ 7]  281 	adc	a, #0x00
   34D2 DD 77 F9      [19]  282 	ld	-7 (ix),a
   34D5 DD 6E F8      [19]  283 	ld	l,-8 (ix)
   34D8 DD 66 F9      [19]  284 	ld	h,-7 (ix)
   34DB 36 80         [10]  285 	ld	(hl),#<(_bullet01_1)
   34DD 23            [ 6]  286 	inc	hl
   34DE 36 40         [10]  287 	ld	(hl),#>(_bullet01_1)
                            288 ;src/entities/shoots.c:58: }
   34E0                     289 00106$:
                            290 ;src/entities/shoots.c:59: active_shoots++;
   34E0 21 99 64      [10]  291 	ld	hl, #_active_shoots+0
   34E3 34            [11]  292 	inc	(hl)
   34E4                     293 00109$:
   34E4 DD F9         [10]  294 	ld	sp, ix
   34E6 DD E1         [14]  295 	pop	ix
   34E8 C9            [10]  296 	ret
                            297 ;src/entities/shoots.c:68: void update_shoots(){
                            298 ;	---------------------------------
                            299 ; Function update_shoots
                            300 ; ---------------------------------
   34E9                     301 _update_shoots::
   34E9 DD E5         [15]  302 	push	ix
   34EB DD 21 00 00   [14]  303 	ld	ix,#0
   34EF DD 39         [15]  304 	add	ix,sp
   34F1 21 F7 FF      [10]  305 	ld	hl,#-9
   34F4 39            [11]  306 	add	hl,sp
   34F5 F9            [ 6]  307 	ld	sp,hl
                            308 ;src/entities/shoots.c:72: if (active_shoots>0){
   34F6 3A 99 64      [13]  309 	ld	a,(#_active_shoots + 0)
   34F9 B7            [ 4]  310 	or	a, a
   34FA CA FC 35      [10]  311 	jp	Z,00116$
                            312 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   34FD 0E 00         [ 7]  313 	ld	c,#0x00
   34FF                     314 00114$:
                            315 ;src/entities/shoots.c:74: if (shoots[i].active){
   34FF 69            [ 4]  316 	ld	l,c
   3500 26 00         [ 7]  317 	ld	h,#0x00
   3502 29            [11]  318 	add	hl, hl
   3503 29            [11]  319 	add	hl, hl
   3504 29            [11]  320 	add	hl, hl
   3505 29            [11]  321 	add	hl, hl
   3506 3E F9         [ 7]  322 	ld	a,#<(_shoots)
   3508 85            [ 4]  323 	add	a, l
   3509 DD 77 F7      [19]  324 	ld	-9 (ix),a
   350C 3E 63         [ 7]  325 	ld	a,#>(_shoots)
   350E 8C            [ 4]  326 	adc	a, h
   350F DD 77 F8      [19]  327 	ld	-8 (ix),a
   3512 DD 7E F7      [19]  328 	ld	a,-9 (ix)
   3515 C6 08         [ 7]  329 	add	a, #0x08
   3517 DD 77 FC      [19]  330 	ld	-4 (ix),a
   351A DD 7E F8      [19]  331 	ld	a,-8 (ix)
   351D CE 00         [ 7]  332 	adc	a, #0x00
   351F DD 77 FD      [19]  333 	ld	-3 (ix),a
   3522 DD 6E FC      [19]  334 	ld	l,-4 (ix)
   3525 DD 66 FD      [19]  335 	ld	h,-3 (ix)
   3528 7E            [ 7]  336 	ld	a,(hl)
   3529 B7            [ 4]  337 	or	a, a
   352A CA F5 35      [10]  338 	jp	Z,00115$
                            339 ;src/entities/shoots.c:75: shoots[i].y-=SHOOT_JUMP;
   352D DD 7E F7      [19]  340 	ld	a,-9 (ix)
   3530 C6 05         [ 7]  341 	add	a, #0x05
   3532 5F            [ 4]  342 	ld	e,a
   3533 DD 7E F8      [19]  343 	ld	a,-8 (ix)
   3536 CE 00         [ 7]  344 	adc	a, #0x00
   3538 57            [ 4]  345 	ld	d,a
   3539 1A            [ 7]  346 	ld	a,(de)
   353A C6 F6         [ 7]  347 	add	a,#0xF6
   353C 47            [ 4]  348 	ld	b,a
   353D 12            [ 7]  349 	ld	(de),a
                            350 ;src/entities/shoots.c:76: if (shoots[i].y<200){
   353E 1A            [ 7]  351 	ld	a,(de)
   353F DD 77 FB      [19]  352 	ld	-5 (ix),a
   3542 78            [ 4]  353 	ld	a,b
   3543 D6 C8         [ 7]  354 	sub	a, #0xC8
   3545 D2 E9 35      [10]  355 	jp	NC,00107$
                            356 ;src/entities/shoots.c:77: if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
   3548 FD E1         [14]  357 	pop	iy
   354A FD E5         [15]  358 	push	iy
   354C FD 7E 07      [19]  359 	ld	a,7 (iy)
   354F DD 77 FE      [19]  360 	ld	-2 (ix),a
   3552 E1            [10]  361 	pop	hl
   3553 E5            [11]  362 	push	hl
   3554 C5            [11]  363 	push	bc
   3555 01 06 00      [10]  364 	ld	bc, #0x0006
   3558 09            [11]  365 	add	hl, bc
   3559 C1            [10]  366 	pop	bc
   355A 46            [ 7]  367 	ld	b,(hl)
   355B DD 7E F7      [19]  368 	ld	a,-9 (ix)
   355E C6 04         [ 7]  369 	add	a, #0x04
   3560 DD 77 F9      [19]  370 	ld	-7 (ix),a
   3563 DD 7E F8      [19]  371 	ld	a,-8 (ix)
   3566 CE 00         [ 7]  372 	adc	a, #0x00
   3568 DD 77 FA      [19]  373 	ld	-6 (ix),a
   356B DD 6E F9      [19]  374 	ld	l,-7 (ix)
   356E DD 66 FA      [19]  375 	ld	h,-6 (ix)
   3571 7E            [ 7]  376 	ld	a,(hl)
   3572 DD 77 FF      [19]  377 	ld	-1 (ix),a
   3575 C5            [11]  378 	push	bc
   3576 D5            [11]  379 	push	de
   3577 DD 7E FE      [19]  380 	ld	a,-2 (ix)
   357A F5            [11]  381 	push	af
   357B 33            [ 6]  382 	inc	sp
   357C C5            [11]  383 	push	bc
   357D 33            [ 6]  384 	inc	sp
   357E DD 66 FB      [19]  385 	ld	h,-5 (ix)
   3581 DD 6E FF      [19]  386 	ld	l,-1 (ix)
   3584 E5            [11]  387 	push	hl
   3585 CD 0A 23      [17]  388 	call	_check_collision_enemies
   3588 F1            [10]  389 	pop	af
   3589 F1            [10]  390 	pop	af
   358A 7D            [ 4]  391 	ld	a,l
   358B D1            [10]  392 	pop	de
   358C C1            [10]  393 	pop	bc
   358D B7            [ 4]  394 	or	a, a
   358E 28 2F         [12]  395 	jr	Z,00104$
                            396 ;src/entities/shoots.c:78: create_explosion(shoots[i].x,shoots[i].y,0);
   3590 1A            [ 7]  397 	ld	a,(de)
   3591 57            [ 4]  398 	ld	d,a
   3592 DD 6E F9      [19]  399 	ld	l,-7 (ix)
   3595 DD 66 FA      [19]  400 	ld	h,-6 (ix)
   3598 46            [ 7]  401 	ld	b,(hl)
   3599 C5            [11]  402 	push	bc
   359A AF            [ 4]  403 	xor	a, a
   359B F5            [11]  404 	push	af
   359C 33            [ 6]  405 	inc	sp
   359D D5            [11]  406 	push	de
   359E 33            [ 6]  407 	inc	sp
   359F C5            [11]  408 	push	bc
   35A0 33            [ 6]  409 	inc	sp
   35A1 CD 47 2F      [17]  410 	call	_create_explosion
   35A4 F1            [10]  411 	pop	af
   35A5 33            [ 6]  412 	inc	sp
   35A6 C1            [10]  413 	pop	bc
                            414 ;src/entities/shoots.c:79: shoots[i].active=0;
   35A7 DD 6E FC      [19]  415 	ld	l,-4 (ix)
   35AA DD 66 FD      [19]  416 	ld	h,-3 (ix)
   35AD 36 00         [10]  417 	ld	(hl),#0x00
                            418 ;src/entities/shoots.c:80: active_shoots--;
   35AF 21 99 64      [10]  419 	ld	hl, #_active_shoots+0
   35B2 35            [11]  420 	dec	(hl)
                            421 ;src/entities/shoots.c:81: add_score(10);
   35B3 C5            [11]  422 	push	bc
   35B4 21 0A 00      [10]  423 	ld	hl,#0x000A
   35B7 E5            [11]  424 	push	hl
   35B8 CD 88 3A      [17]  425 	call	_add_score
   35BB F1            [10]  426 	pop	af
   35BC C1            [10]  427 	pop	bc
   35BD 18 36         [12]  428 	jr	00115$
   35BF                     429 00104$:
                            430 ;src/entities/shoots.c:83: shoots[i].frame++;
   35BF DD 7E F7      [19]  431 	ld	a,-9 (ix)
   35C2 C6 0A         [ 7]  432 	add	a, #0x0A
   35C4 5F            [ 4]  433 	ld	e,a
   35C5 DD 7E F8      [19]  434 	ld	a,-8 (ix)
   35C8 CE 00         [ 7]  435 	adc	a, #0x00
   35CA 57            [ 4]  436 	ld	d,a
   35CB 1A            [ 7]  437 	ld	a,(de)
   35CC 3C            [ 4]  438 	inc	a
   35CD DD 77 FF      [19]  439 	ld	-1 (ix), a
   35D0 12            [ 7]  440 	ld	(de),a
                            441 ;src/entities/shoots.c:84: if (shoots[i].frame==shoots[i].num_frames)
   35D1 E1            [10]  442 	pop	hl
   35D2 E5            [11]  443 	push	hl
   35D3 C5            [11]  444 	push	bc
   35D4 01 09 00      [10]  445 	ld	bc, #0x0009
   35D7 09            [11]  446 	add	hl, bc
   35D8 C1            [10]  447 	pop	bc
   35D9 7E            [ 7]  448 	ld	a,(hl)
   35DA DD 77 F9      [19]  449 	ld	-7 (ix),a
   35DD DD 7E FF      [19]  450 	ld	a,-1 (ix)
   35E0 DD 96 F9      [19]  451 	sub	a, -7 (ix)
   35E3 20 10         [12]  452 	jr	NZ,00115$
                            453 ;src/entities/shoots.c:85: shoots[i].frame=0;
   35E5 AF            [ 4]  454 	xor	a, a
   35E6 12            [ 7]  455 	ld	(de),a
   35E7 18 0C         [12]  456 	jr	00115$
   35E9                     457 00107$:
                            458 ;src/entities/shoots.c:89: shoots[i].active=0;
   35E9 DD 6E FC      [19]  459 	ld	l,-4 (ix)
   35EC DD 66 FD      [19]  460 	ld	h,-3 (ix)
   35EF 36 00         [10]  461 	ld	(hl),#0x00
                            462 ;src/entities/shoots.c:90: active_shoots--;
   35F1 21 99 64      [10]  463 	ld	hl, #_active_shoots+0
   35F4 35            [11]  464 	dec	(hl)
   35F5                     465 00115$:
                            466 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   35F5 0C            [ 4]  467 	inc	c
   35F6 79            [ 4]  468 	ld	a,c
   35F7 D6 0A         [ 7]  469 	sub	a, #0x0A
   35F9 DA FF 34      [10]  470 	jp	C,00114$
   35FC                     471 00116$:
   35FC DD F9         [10]  472 	ld	sp, ix
   35FE DD E1         [14]  473 	pop	ix
   3600 C9            [10]  474 	ret
                            475 ;src/entities/shoots.c:102: void draw_shoots(u8* screen){
                            476 ;	---------------------------------
                            477 ; Function draw_shoots
                            478 ; ---------------------------------
   3601                     479 _draw_shoots::
   3601 DD E5         [15]  480 	push	ix
   3603 DD 21 00 00   [14]  481 	ld	ix,#0
   3607 DD 39         [15]  482 	add	ix,sp
   3609 F5            [11]  483 	push	af
   360A F5            [11]  484 	push	af
   360B 3B            [ 6]  485 	dec	sp
                            486 ;src/entities/shoots.c:107: if (active_shoots>0){
   360C 3A 99 64      [13]  487 	ld	a,(#_active_shoots + 0)
   360F B7            [ 4]  488 	or	a, a
   3610 CA B6 36      [10]  489 	jp	Z,00108$
                            490 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   3613 0E 00         [ 7]  491 	ld	c,#0x00
   3615                     492 00106$:
                            493 ;src/entities/shoots.c:109: if (shoots[k].active){
   3615 69            [ 4]  494 	ld	l,c
   3616 26 00         [ 7]  495 	ld	h,#0x00
   3618 29            [11]  496 	add	hl, hl
   3619 29            [11]  497 	add	hl, hl
   361A 29            [11]  498 	add	hl, hl
   361B 29            [11]  499 	add	hl, hl
   361C 3E F9         [ 7]  500 	ld	a,#<(_shoots)
   361E 85            [ 4]  501 	add	a, l
   361F DD 77 FE      [19]  502 	ld	-2 (ix),a
   3622 3E 63         [ 7]  503 	ld	a,#>(_shoots)
   3624 8C            [ 4]  504 	adc	a, h
   3625 DD 77 FF      [19]  505 	ld	-1 (ix),a
   3628 DD 6E FE      [19]  506 	ld	l,-2 (ix)
   362B DD 66 FF      [19]  507 	ld	h,-1 (ix)
   362E 11 08 00      [10]  508 	ld	de, #0x0008
   3631 19            [11]  509 	add	hl, de
   3632 7E            [ 7]  510 	ld	a,(hl)
   3633 B7            [ 4]  511 	or	a, a
   3634 28 79         [12]  512 	jr	Z,00107$
                            513 ;src/entities/shoots.c:110: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   3636 DD 6E FE      [19]  514 	ld	l,-2 (ix)
   3639 DD 66 FF      [19]  515 	ld	h,-1 (ix)
   363C 11 05 00      [10]  516 	ld	de, #0x0005
   363F 19            [11]  517 	add	hl, de
   3640 56            [ 7]  518 	ld	d,(hl)
   3641 DD 6E FE      [19]  519 	ld	l,-2 (ix)
   3644 DD 66 FF      [19]  520 	ld	h,-1 (ix)
   3647 23            [ 6]  521 	inc	hl
   3648 23            [ 6]  522 	inc	hl
   3649 23            [ 6]  523 	inc	hl
   364A 23            [ 6]  524 	inc	hl
   364B 5E            [ 7]  525 	ld	e,(hl)
   364C E5            [11]  526 	push	hl
   364D DD 6E 04      [19]  527 	ld	l,4 (ix)
   3650 DD 66 05      [19]  528 	ld	h,5 (ix)
   3653 E5            [11]  529 	push	hl
   3654 FD E1         [14]  530 	pop	iy
   3656 E1            [10]  531 	pop	hl
   3657 C5            [11]  532 	push	bc
   3658 D5            [11]  533 	push	de
   3659 FD E5         [15]  534 	push	iy
   365B CD A0 4F      [17]  535 	call	_cpct_getScreenPtr
   365E C1            [10]  536 	pop	bc
   365F 5D            [ 4]  537 	ld	e, l
   3660 54            [ 4]  538 	ld	d, h
                            539 ;src/entities/shoots.c:111: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   3661 E5            [11]  540 	push	hl
   3662 DD 6E FE      [19]  541 	ld	l,-2 (ix)
   3665 DD 66 FF      [19]  542 	ld	h,-1 (ix)
   3668 E5            [11]  543 	push	hl
   3669 FD E1         [14]  544 	pop	iy
   366B E1            [10]  545 	pop	hl
   366C FD 7E 07      [19]  546 	ld	a,7 (iy)
   366F DD 77 FD      [19]  547 	ld	-3 (ix),a
   3672 DD 6E FE      [19]  548 	ld	l,-2 (ix)
   3675 DD 66 FF      [19]  549 	ld	h,-1 (ix)
   3678 C5            [11]  550 	push	bc
   3679 01 06 00      [10]  551 	ld	bc, #0x0006
   367C 09            [11]  552 	add	hl, bc
   367D C1            [10]  553 	pop	bc
   367E 46            [ 7]  554 	ld	b,(hl)
   367F 33            [ 6]  555 	inc	sp
   3680 33            [ 6]  556 	inc	sp
   3681 D5            [11]  557 	push	de
   3682 DD 6E FE      [19]  558 	ld	l,-2 (ix)
   3685 DD 66 FF      [19]  559 	ld	h,-1 (ix)
   3688 11 0A 00      [10]  560 	ld	de, #0x000A
   368B 19            [11]  561 	add	hl, de
   368C 7E            [ 7]  562 	ld	a,(hl)
   368D 87            [ 4]  563 	add	a, a
   368E 5F            [ 4]  564 	ld	e,a
   368F DD 6E FE      [19]  565 	ld	l,-2 (ix)
   3692 DD 66 FF      [19]  566 	ld	h,-1 (ix)
   3695 16 00         [ 7]  567 	ld	d,#0x00
   3697 19            [11]  568 	add	hl, de
   3698 5E            [ 7]  569 	ld	e,(hl)
   3699 23            [ 6]  570 	inc	hl
   369A 56            [ 7]  571 	ld	d,(hl)
   369B C5            [11]  572 	push	bc
   369C DD 7E FD      [19]  573 	ld	a,-3 (ix)
   369F F5            [11]  574 	push	af
   36A0 33            [ 6]  575 	inc	sp
   36A1 C5            [11]  576 	push	bc
   36A2 33            [ 6]  577 	inc	sp
   36A3 DD 6E FB      [19]  578 	ld	l,-5 (ix)
   36A6 DD 66 FC      [19]  579 	ld	h,-4 (ix)
   36A9 E5            [11]  580 	push	hl
   36AA D5            [11]  581 	push	de
   36AB CD 5B 4C      [17]  582 	call	_cpct_drawSprite
   36AE C1            [10]  583 	pop	bc
   36AF                     584 00107$:
                            585 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   36AF 0C            [ 4]  586 	inc	c
   36B0 79            [ 4]  587 	ld	a,c
   36B1 D6 0A         [ 7]  588 	sub	a, #0x0A
   36B3 DA 15 36      [10]  589 	jp	C,00106$
   36B6                     590 00108$:
   36B6 DD F9         [10]  591 	ld	sp, ix
   36B8 DD E1         [14]  592 	pop	ix
   36BA C9            [10]  593 	ret
                            594 	.area _CODE
                            595 	.area _INITIALIZER
                            596 	.area _CABS (ABS)
