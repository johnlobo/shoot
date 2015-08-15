                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 01:34:09 2015
                              5 ;--------------------------------------------------------
                              6 	.module messages
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _cpc_SetInkGphStr
                             13 	.globl _cpc_PrintGphStr
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_drawSolidBox
                             16 	.globl _cpct_px2byteM0
                             17 	.globl _aux_txt2
                             18 	.globl _active_messages
                             19 	.globl _messages
                             20 	.globl _strcpy
                             21 	.globl _strlen
                             22 	.globl _colour_message
                             23 	.globl _red_message
                             24 	.globl _blue_message
                             25 	.globl _init_messages
                             26 	.globl _create_message
                             27 	.globl _draw_messages
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
   68F5                      35 _messages::
   68F5                      36 	.ds 340
   6A49                      37 _active_messages::
   6A49                      38 	.ds 1
   6A4A                      39 _aux_txt2::
   6A4A                      40 	.ds 40
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
                             65 ;src/entities/messages.c:14: void strcpy(i8* to, const i8* from){
                             66 ;	---------------------------------
                             67 ; Function strcpy
                             68 ; ---------------------------------
   32D3                      69 _strcpy::
   32D3 DD E5         [15]   70 	push	ix
   32D5 DD 21 00 00   [14]   71 	ld	ix,#0
   32D9 DD 39         [15]   72 	add	ix,sp
                             73 ;src/entities/messages.c:17: while (i){
   32DB DD 4E 06      [19]   74 	ld	c,6 (ix)
   32DE DD 46 07      [19]   75 	ld	b,7 (ix)
   32E1 DD 5E 04      [19]   76 	ld	e,4 (ix)
   32E4 DD 56 05      [19]   77 	ld	d,5 (ix)
   32E7 D5            [11]   78 	push	de
   32E8 FD E1         [14]   79 	pop	iy
   32EA 16 1E         [ 7]   80 	ld	d,#0x1E
   32EC                      81 00101$:
   32EC 7A            [ 4]   82 	ld	a,d
   32ED B7            [ 4]   83 	or	a, a
   32EE 28 0A         [12]   84 	jr	Z,00104$
                             85 ;src/entities/messages.c:18: *to++ = *from++;
   32F0 0A            [ 7]   86 	ld	a,(bc)
   32F1 03            [ 6]   87 	inc	bc
   32F2 FD 77 00      [19]   88 	ld	0 (iy), a
   32F5 FD 23         [10]   89 	inc	iy
                             90 ;src/entities/messages.c:19: i--;
   32F7 15            [ 4]   91 	dec	d
   32F8 18 F2         [12]   92 	jr	00101$
   32FA                      93 00104$:
   32FA DD E1         [14]   94 	pop	ix
   32FC C9            [10]   95 	ret
                             96 ;src/entities/messages.c:23: u8 strlen(const char *str)
                             97 ;	---------------------------------
                             98 ; Function strlen
                             99 ; ---------------------------------
   32FD                     100 _strlen::
                            101 ;src/entities/messages.c:27: for (s = str; *s; ++s);
   32FD C1            [10]  102 	pop	bc
   32FE D1            [10]  103 	pop	de
   32FF D5            [11]  104 	push	de
   3300 C5            [11]  105 	push	bc
   3301                     106 00103$:
   3301 1A            [ 7]  107 	ld	a,(de)
   3302 B7            [ 4]  108 	or	a, a
   3303 28 03         [12]  109 	jr	Z,00101$
   3305 13            [ 6]  110 	inc	de
   3306 18 F9         [12]  111 	jr	00103$
   3308                     112 00101$:
                            113 ;src/entities/messages.c:28: return(s - str);
   3308 21 02 00      [10]  114 	ld	hl,#2
   330B 39            [11]  115 	add	hl,sp
   330C 7B            [ 4]  116 	ld	a,e
   330D 96            [ 7]  117 	sub	a, (hl)
   330E 5F            [ 4]  118 	ld	e,a
   330F 7A            [ 4]  119 	ld	a,d
   3310 23            [ 6]  120 	inc	hl
   3311 9E            [ 7]  121 	sbc	a, (hl)
   3312 6B            [ 4]  122 	ld	l,e
   3313 C9            [10]  123 	ret
                            124 ;src/entities/messages.c:35: void colour_message (u8 backg, u8 t){
                            125 ;	---------------------------------
                            126 ; Function colour_message
                            127 ; ---------------------------------
   3314                     128 _colour_message::
                            129 ;src/entities/messages.c:36: cpc_SetInkGphStr(0,backg);
   3314 21 02 00      [10]  130 	ld	hl, #2+0
   3317 39            [11]  131 	add	hl, sp
   3318 7E            [ 7]  132 	ld	a, (hl)
   3319 F5            [11]  133 	push	af
   331A 33            [ 6]  134 	inc	sp
   331B AF            [ 4]  135 	xor	a, a
   331C F5            [11]  136 	push	af
   331D 33            [ 6]  137 	inc	sp
   331E CD B0 4F      [17]  138 	call	_cpc_SetInkGphStr
   3321 F1            [10]  139 	pop	af
                            140 ;src/entities/messages.c:37: cpc_SetInkGphStr(1,t);
   3322 21 03 00      [10]  141 	ld	hl, #3+0
   3325 39            [11]  142 	add	hl, sp
   3326 56            [ 7]  143 	ld	d, (hl)
   3327 1E 01         [ 7]  144 	ld	e,#0x01
   3329 D5            [11]  145 	push	de
   332A CD B0 4F      [17]  146 	call	_cpc_SetInkGphStr
   332D F1            [10]  147 	pop	af
                            148 ;src/entities/messages.c:38: cpc_SetInkGphStr(2,t);
   332E 21 03 00      [10]  149 	ld	hl, #3+0
   3331 39            [11]  150 	add	hl, sp
   3332 56            [ 7]  151 	ld	d, (hl)
   3333 1E 02         [ 7]  152 	ld	e,#0x02
   3335 D5            [11]  153 	push	de
   3336 CD B0 4F      [17]  154 	call	_cpc_SetInkGphStr
   3339 F1            [10]  155 	pop	af
                            156 ;src/entities/messages.c:39: cpc_SetInkGphStr(3,t);
   333A 21 03 00      [10]  157 	ld	hl, #3+0
   333D 39            [11]  158 	add	hl, sp
   333E 56            [ 7]  159 	ld	d, (hl)
   333F 1E 03         [ 7]  160 	ld	e,#0x03
   3341 D5            [11]  161 	push	de
   3342 CD B0 4F      [17]  162 	call	_cpc_SetInkGphStr
   3345 F1            [10]  163 	pop	af
   3346 C9            [10]  164 	ret
                            165 ;src/entities/messages.c:45: void red_message(){
                            166 ;	---------------------------------
                            167 ; Function red_message
                            168 ; ---------------------------------
   3347                     169 _red_message::
                            170 ;src/entities/messages.c:47: cpc_SetInkGphStr(0,0);
   3347 21 00 00      [10]  171 	ld	hl,#0x0000
   334A E5            [11]  172 	push	hl
   334B CD B0 4F      [17]  173 	call	_cpc_SetInkGphStr
                            174 ;src/entities/messages.c:48: cpc_SetInkGphStr(1,34);
   334E 21 01 22      [10]  175 	ld	hl, #0x2201
   3351 E3            [19]  176 	ex	(sp),hl
   3352 CD B0 4F      [17]  177 	call	_cpc_SetInkGphStr
                            178 ;src/entities/messages.c:49: cpc_SetInkGphStr(2,42);
   3355 21 02 2A      [10]  179 	ld	hl, #0x2A02
   3358 E3            [19]  180 	ex	(sp),hl
   3359 CD B0 4F      [17]  181 	call	_cpc_SetInkGphStr
                            182 ;src/entities/messages.c:50: cpc_SetInkGphStr(3,34);
   335C 21 03 22      [10]  183 	ld	hl, #0x2203
   335F E3            [19]  184 	ex	(sp),hl
   3360 CD B0 4F      [17]  185 	call	_cpc_SetInkGphStr
   3363 F1            [10]  186 	pop	af
   3364 C9            [10]  187 	ret
                            188 ;src/entities/messages.c:56: void blue_message(){
                            189 ;	---------------------------------
                            190 ; Function blue_message
                            191 ; ---------------------------------
   3365                     192 _blue_message::
                            193 ;src/entities/messages.c:58: cpc_SetInkGphStr(0,0);
   3365 21 00 00      [10]  194 	ld	hl,#0x0000
   3368 E5            [11]  195 	push	hl
   3369 CD B0 4F      [17]  196 	call	_cpc_SetInkGphStr
                            197 ;src/entities/messages.c:59: cpc_SetInkGphStr(1,40);
   336C 21 01 28      [10]  198 	ld	hl, #0x2801
   336F E3            [19]  199 	ex	(sp),hl
   3370 CD B0 4F      [17]  200 	call	_cpc_SetInkGphStr
                            201 ;src/entities/messages.c:60: cpc_SetInkGphStr(2,40);
   3373 21 02 28      [10]  202 	ld	hl, #0x2802
   3376 E3            [19]  203 	ex	(sp),hl
   3377 CD B0 4F      [17]  204 	call	_cpc_SetInkGphStr
                            205 ;src/entities/messages.c:61: cpc_SetInkGphStr(3,10);
   337A 21 03 0A      [10]  206 	ld	hl, #0x0A03
   337D E3            [19]  207 	ex	(sp),hl
   337E CD B0 4F      [17]  208 	call	_cpc_SetInkGphStr
   3381 F1            [10]  209 	pop	af
   3382 C9            [10]  210 	ret
                            211 ;src/entities/messages.c:64: void init_messages(){
                            212 ;	---------------------------------
                            213 ; Function init_messages
                            214 ; ---------------------------------
   3383                     215 _init_messages::
   3383 DD E5         [15]  216 	push	ix
   3385 DD 21 00 00   [14]  217 	ld	ix,#0
   3389 DD 39         [15]  218 	add	ix,sp
   338B 3B            [ 6]  219 	dec	sp
                            220 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   338C DD 36 FF 00   [19]  221 	ld	-1 (ix),#0x00
   3390 11 00 00      [10]  222 	ld	de,#0x0000
   3393                     223 00102$:
                            224 ;src/entities/messages.c:68: messages[i].active=0;
   3393 21 F5 68      [10]  225 	ld	hl,#_messages
   3396 19            [11]  226 	add	hl,de
   3397 4D            [ 4]  227 	ld	c,l
   3398 44            [ 4]  228 	ld	b,h
   3399 AF            [ 4]  229 	xor	a, a
   339A 02            [ 7]  230 	ld	(bc),a
                            231 ;src/entities/messages.c:69: messages[i].x=0;
   339B 69            [ 4]  232 	ld	l, c
   339C 60            [ 4]  233 	ld	h, b
   339D 23            [ 6]  234 	inc	hl
   339E 36 00         [10]  235 	ld	(hl),#0x00
                            236 ;src/entities/messages.c:70: messages[i].y=0;
   33A0 69            [ 4]  237 	ld	l, c
   33A1 60            [ 4]  238 	ld	h, b
   33A2 23            [ 6]  239 	inc	hl
   33A3 23            [ 6]  240 	inc	hl
   33A4 36 00         [10]  241 	ld	(hl),#0x00
                            242 ;src/entities/messages.c:71: messages[i].time=0;
   33A6 21 21 00      [10]  243 	ld	hl,#0x0021
   33A9 09            [11]  244 	add	hl,bc
   33AA 36 00         [10]  245 	ld	(hl),#0x00
                            246 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   33AC 21 22 00      [10]  247 	ld	hl,#0x0022
   33AF 19            [11]  248 	add	hl,de
   33B0 EB            [ 4]  249 	ex	de,hl
   33B1 DD 34 FF      [23]  250 	inc	-1 (ix)
   33B4 DD 7E FF      [19]  251 	ld	a,-1 (ix)
   33B7 D6 0A         [ 7]  252 	sub	a, #0x0A
   33B9 38 D8         [12]  253 	jr	C,00102$
                            254 ;src/entities/messages.c:73: active_messages=0;
   33BB 21 49 6A      [10]  255 	ld	hl,#_active_messages + 0
   33BE 36 00         [10]  256 	ld	(hl), #0x00
   33C0 33            [ 6]  257 	inc	sp
   33C1 DD E1         [14]  258 	pop	ix
   33C3 C9            [10]  259 	ret
                            260 ;src/entities/messages.c:76: void create_message(u8 x, u8 y, u8 time, u8 *text){
                            261 ;	---------------------------------
                            262 ; Function create_message
                            263 ; ---------------------------------
   33C4                     264 _create_message::
   33C4 DD E5         [15]  265 	push	ix
   33C6 DD 21 00 00   [14]  266 	ld	ix,#0
   33CA DD 39         [15]  267 	add	ix,sp
                            268 ;src/entities/messages.c:79: while (messages[i].active==1) { 
   33CC 01 00 00      [10]  269 	ld	bc,#0x0000
   33CF                     270 00101$:
   33CF 21 F5 68      [10]  271 	ld	hl,#_messages
   33D2 09            [11]  272 	add	hl,bc
   33D3 EB            [ 4]  273 	ex	de,hl
   33D4 1A            [ 7]  274 	ld	a,(de)
   33D5 3D            [ 4]  275 	dec	a
   33D6 20 08         [12]  276 	jr	NZ,00103$
                            277 ;src/entities/messages.c:80: i++;
   33D8 21 22 00      [10]  278 	ld	hl,#0x0022
   33DB 09            [11]  279 	add	hl,bc
   33DC 4D            [ 4]  280 	ld	c,l
   33DD 44            [ 4]  281 	ld	b,h
   33DE 18 EF         [12]  282 	jr	00101$
   33E0                     283 00103$:
                            284 ;src/entities/messages.c:82: messages[i].active=1;
   33E0 3E 01         [ 7]  285 	ld	a,#0x01
   33E2 12            [ 7]  286 	ld	(de),a
                            287 ;src/entities/messages.c:83: messages[i].x = x;
   33E3 6B            [ 4]  288 	ld	l, e
   33E4 62            [ 4]  289 	ld	h, d
   33E5 23            [ 6]  290 	inc	hl
   33E6 DD 7E 04      [19]  291 	ld	a,4 (ix)
   33E9 77            [ 7]  292 	ld	(hl),a
                            293 ;src/entities/messages.c:84: messages[i].y = y;
   33EA 6B            [ 4]  294 	ld	l, e
   33EB 62            [ 4]  295 	ld	h, d
   33EC 23            [ 6]  296 	inc	hl
   33ED 23            [ 6]  297 	inc	hl
   33EE DD 7E 05      [19]  298 	ld	a,5 (ix)
   33F1 77            [ 7]  299 	ld	(hl),a
                            300 ;src/entities/messages.c:85: messages[i].time = time;
   33F2 21 21 00      [10]  301 	ld	hl,#0x0021
   33F5 19            [11]  302 	add	hl,de
   33F6 DD 7E 06      [19]  303 	ld	a,6 (ix)
   33F9 77            [ 7]  304 	ld	(hl),a
                            305 ;src/entities/messages.c:86: strcpy(messages[i].text,text);
   33FA 13            [ 6]  306 	inc	de
   33FB 13            [ 6]  307 	inc	de
   33FC 13            [ 6]  308 	inc	de
   33FD DD 6E 07      [19]  309 	ld	l,7 (ix)
   3400 DD 66 08      [19]  310 	ld	h,8 (ix)
   3403 E5            [11]  311 	push	hl
   3404 D5            [11]  312 	push	de
   3405 CD D3 32      [17]  313 	call	_strcpy
   3408 F1            [10]  314 	pop	af
   3409 F1            [10]  315 	pop	af
                            316 ;src/entities/messages.c:87: active_messages++;
   340A 21 49 6A      [10]  317 	ld	hl, #_active_messages+0
   340D 34            [11]  318 	inc	(hl)
   340E DD E1         [14]  319 	pop	ix
   3410 C9            [10]  320 	ret
                            321 ;src/entities/messages.c:90: void draw_messages(u8* screen){
                            322 ;	---------------------------------
                            323 ; Function draw_messages
                            324 ; ---------------------------------
   3411                     325 _draw_messages::
   3411 DD E5         [15]  326 	push	ix
   3413 DD 21 00 00   [14]  327 	ld	ix,#0
   3417 DD 39         [15]  328 	add	ix,sp
   3419 21 F3 FF      [10]  329 	ld	hl,#-13
   341C 39            [11]  330 	add	hl,sp
   341D F9            [ 6]  331 	ld	sp,hl
                            332 ;src/entities/messages.c:94: if (active_messages){
   341E 3A 49 6A      [13]  333 	ld	a,(#_active_messages + 0)
   3421 B7            [ 4]  334 	or	a, a
   3422 CA 37 35      [10]  335 	jp	Z,00110$
                            336 ;src/entities/messages.c:95: blue_message();
   3425 CD 65 33      [17]  337 	call	_blue_message
                            338 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3428 DD 36 F3 00   [19]  339 	ld	-13 (ix),#0x00
   342C 11 00 00      [10]  340 	ld	de,#0x0000
   342F                     341 00108$:
                            342 ;src/entities/messages.c:97: if (messages[i].active){
   342F 21 F5 68      [10]  343 	ld	hl,#_messages
   3432 19            [11]  344 	add	hl,de
   3433 DD 75 FE      [19]  345 	ld	-2 (ix),l
   3436 DD 74 FF      [19]  346 	ld	-1 (ix),h
   3439 DD 6E FE      [19]  347 	ld	l,-2 (ix)
   343C DD 66 FF      [19]  348 	ld	h,-1 (ix)
   343F 7E            [ 7]  349 	ld	a,(hl)
   3440 B7            [ 4]  350 	or	a, a
   3441 CA 27 35      [10]  351 	jp	Z,00109$
                            352 ;src/entities/messages.c:98: pscreen = cpct_getScreenPtr(screen, messages[i].x-2, messages[i].y-4);
   3444 DD 7E FE      [19]  353 	ld	a,-2 (ix)
   3447 C6 02         [ 7]  354 	add	a, #0x02
   3449 DD 77 FA      [19]  355 	ld	-6 (ix),a
   344C DD 7E FF      [19]  356 	ld	a,-1 (ix)
   344F CE 00         [ 7]  357 	adc	a, #0x00
   3451 DD 77 FB      [19]  358 	ld	-5 (ix),a
   3454 DD 6E FA      [19]  359 	ld	l,-6 (ix)
   3457 DD 66 FB      [19]  360 	ld	h,-5 (ix)
   345A 7E            [ 7]  361 	ld	a,(hl)
   345B C6 FC         [ 7]  362 	add	a,#0xFC
   345D 47            [ 4]  363 	ld	b,a
   345E DD 7E FE      [19]  364 	ld	a,-2 (ix)
   3461 C6 01         [ 7]  365 	add	a, #0x01
   3463 DD 77 FC      [19]  366 	ld	-4 (ix),a
   3466 DD 7E FF      [19]  367 	ld	a,-1 (ix)
   3469 CE 00         [ 7]  368 	adc	a, #0x00
   346B DD 77 FD      [19]  369 	ld	-3 (ix),a
   346E DD 6E FC      [19]  370 	ld	l,-4 (ix)
   3471 DD 66 FD      [19]  371 	ld	h,-3 (ix)
   3474 4E            [ 7]  372 	ld	c,(hl)
   3475 0D            [ 4]  373 	dec	c
   3476 0D            [ 4]  374 	dec	c
   3477 DD 7E 04      [19]  375 	ld	a,4 (ix)
   347A DD 77 F8      [19]  376 	ld	-8 (ix),a
   347D DD 7E 05      [19]  377 	ld	a,5 (ix)
   3480 DD 77 F9      [19]  378 	ld	-7 (ix),a
   3483 D5            [11]  379 	push	de
   3484 C5            [11]  380 	push	bc
   3485 DD 6E F8      [19]  381 	ld	l,-8 (ix)
   3488 DD 66 F9      [19]  382 	ld	h,-7 (ix)
   348B E5            [11]  383 	push	hl
   348C CD 25 56      [17]  384 	call	_cpct_getScreenPtr
   348F D1            [10]  385 	pop	de
   3490 4D            [ 4]  386 	ld	c, l
   3491 44            [ 4]  387 	ld	b, h
                            388 ;src/entities/messages.c:99: cpct_drawSolidBox(pscreen , cpct_px2byteM0(3, 3), strlen(messages[i].text)*2+4, 18);
   3492 DD 7E FE      [19]  389 	ld	a,-2 (ix)
   3495 C6 03         [ 7]  390 	add	a, #0x03
   3497 DD 77 F6      [19]  391 	ld	-10 (ix),a
   349A DD 7E FF      [19]  392 	ld	a,-1 (ix)
   349D CE 00         [ 7]  393 	adc	a, #0x00
   349F DD 77 F7      [19]  394 	ld	-9 (ix),a
   34A2 DD 6E F6      [19]  395 	ld	l,-10 (ix)
   34A5 DD 66 F7      [19]  396 	ld	h,-9 (ix)
   34A8 C5            [11]  397 	push	bc
   34A9 D5            [11]  398 	push	de
   34AA E5            [11]  399 	push	hl
   34AB CD FD 32      [17]  400 	call	_strlen
   34AE F1            [10]  401 	pop	af
   34AF 7D            [ 4]  402 	ld	a,l
   34B0 D1            [10]  403 	pop	de
   34B1 C1            [10]  404 	pop	bc
   34B2 87            [ 4]  405 	add	a, a
   34B3 C6 04         [ 7]  406 	add	a, #0x04
   34B5 DD 77 F5      [19]  407 	ld	-11 (ix),a
   34B8 C5            [11]  408 	push	bc
   34B9 D5            [11]  409 	push	de
   34BA 21 03 03      [10]  410 	ld	hl,#0x0303
   34BD E5            [11]  411 	push	hl
   34BE CD 21 55      [17]  412 	call	_cpct_px2byteM0
   34C1 F1            [10]  413 	pop	af
   34C2 DD 75 F4      [19]  414 	ld	-12 (ix),l
   34C5 D1            [10]  415 	pop	de
   34C6 C1            [10]  416 	pop	bc
   34C7 D5            [11]  417 	push	de
   34C8 3E 12         [ 7]  418 	ld	a,#0x12
   34CA F5            [11]  419 	push	af
   34CB 33            [ 6]  420 	inc	sp
   34CC DD 66 F5      [19]  421 	ld	h,-11 (ix)
   34CF DD 6E F4      [19]  422 	ld	l,-12 (ix)
   34D2 E5            [11]  423 	push	hl
   34D3 C5            [11]  424 	push	bc
   34D4 CD 54 55      [17]  425 	call	_cpct_drawSolidBox
   34D7 F1            [10]  426 	pop	af
   34D8 F1            [10]  427 	pop	af
   34D9 33            [ 6]  428 	inc	sp
   34DA D1            [10]  429 	pop	de
                            430 ;src/entities/messages.c:100: cpc_PrintGphStr(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
   34DB DD 6E FA      [19]  431 	ld	l,-6 (ix)
   34DE DD 66 FB      [19]  432 	ld	h,-5 (ix)
   34E1 7E            [ 7]  433 	ld	a,(hl)
   34E2 DD 6E FC      [19]  434 	ld	l,-4 (ix)
   34E5 DD 66 FD      [19]  435 	ld	h,-3 (ix)
   34E8 46            [ 7]  436 	ld	b,(hl)
   34E9 D5            [11]  437 	push	de
   34EA F5            [11]  438 	push	af
   34EB 33            [ 6]  439 	inc	sp
   34EC C5            [11]  440 	push	bc
   34ED 33            [ 6]  441 	inc	sp
   34EE DD 6E F8      [19]  442 	ld	l,-8 (ix)
   34F1 DD 66 F9      [19]  443 	ld	h,-7 (ix)
   34F4 E5            [11]  444 	push	hl
   34F5 CD 25 56      [17]  445 	call	_cpct_getScreenPtr
   34F8 D1            [10]  446 	pop	de
   34F9 DD 4E F6      [19]  447 	ld	c,-10 (ix)
   34FC DD 46 F7      [19]  448 	ld	b,-9 (ix)
   34FF D5            [11]  449 	push	de
   3500 E5            [11]  450 	push	hl
   3501 C5            [11]  451 	push	bc
   3502 CD 6A 4E      [17]  452 	call	_cpc_PrintGphStr
   3505 F1            [10]  453 	pop	af
   3506 F1            [10]  454 	pop	af
   3507 D1            [10]  455 	pop	de
                            456 ;src/entities/messages.c:101: messages[i].time--;
   3508 DD 7E FE      [19]  457 	ld	a,-2 (ix)
   350B C6 21         [ 7]  458 	add	a, #0x21
   350D 6F            [ 4]  459 	ld	l,a
   350E DD 7E FF      [19]  460 	ld	a,-1 (ix)
   3511 CE 00         [ 7]  461 	adc	a, #0x00
   3513 67            [ 4]  462 	ld	h,a
   3514 7E            [ 7]  463 	ld	a,(hl)
   3515 C6 FF         [ 7]  464 	add	a,#0xFF
   3517 77            [ 7]  465 	ld	(hl),a
                            466 ;src/entities/messages.c:102: if (!messages[i].time){
   3518 B7            [ 4]  467 	or	a, a
   3519 20 0C         [12]  468 	jr	NZ,00109$
                            469 ;src/entities/messages.c:103: messages[i].active=0;
   351B DD 6E FE      [19]  470 	ld	l,-2 (ix)
   351E DD 66 FF      [19]  471 	ld	h,-1 (ix)
   3521 36 00         [10]  472 	ld	(hl),#0x00
                            473 ;src/entities/messages.c:104: active_messages--;
   3523 21 49 6A      [10]  474 	ld	hl, #_active_messages+0
   3526 35            [11]  475 	dec	(hl)
   3527                     476 00109$:
                            477 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3527 21 22 00      [10]  478 	ld	hl,#0x0022
   352A 19            [11]  479 	add	hl,de
   352B EB            [ 4]  480 	ex	de,hl
   352C DD 34 F3      [23]  481 	inc	-13 (ix)
   352F DD 7E F3      [19]  482 	ld	a,-13 (ix)
   3532 D6 0A         [ 7]  483 	sub	a, #0x0A
   3534 DA 2F 34      [10]  484 	jp	C,00108$
   3537                     485 00110$:
   3537 DD F9         [10]  486 	ld	sp, ix
   3539 DD E1         [14]  487 	pop	ix
   353B C9            [10]  488 	ret
                            489 	.area _CODE
                            490 	.area _INITIALIZER
                            491 	.area _CABS (ABS)
