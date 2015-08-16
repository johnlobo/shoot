                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:00:18 2015
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
   6959                      35 _messages::
   6959                      36 	.ds 340
   6AAD                      37 _active_messages::
   6AAD                      38 	.ds 1
   6AAE                      39 _aux_txt2::
   6AAE                      40 	.ds 40
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
   32CE                      69 _strcpy::
   32CE DD E5         [15]   70 	push	ix
   32D0 DD 21 00 00   [14]   71 	ld	ix,#0
   32D4 DD 39         [15]   72 	add	ix,sp
                             73 ;src/entities/messages.c:17: while (i){
   32D6 DD 4E 06      [19]   74 	ld	c,6 (ix)
   32D9 DD 46 07      [19]   75 	ld	b,7 (ix)
   32DC DD 5E 04      [19]   76 	ld	e,4 (ix)
   32DF DD 56 05      [19]   77 	ld	d,5 (ix)
   32E2 D5            [11]   78 	push	de
   32E3 FD E1         [14]   79 	pop	iy
   32E5 16 1E         [ 7]   80 	ld	d,#0x1E
   32E7                      81 00101$:
   32E7 7A            [ 4]   82 	ld	a,d
   32E8 B7            [ 4]   83 	or	a, a
   32E9 28 0A         [12]   84 	jr	Z,00104$
                             85 ;src/entities/messages.c:18: *to++ = *from++;
   32EB 0A            [ 7]   86 	ld	a,(bc)
   32EC 03            [ 6]   87 	inc	bc
   32ED FD 77 00      [19]   88 	ld	0 (iy), a
   32F0 FD 23         [10]   89 	inc	iy
                             90 ;src/entities/messages.c:19: i--;
   32F2 15            [ 4]   91 	dec	d
   32F3 18 F2         [12]   92 	jr	00101$
   32F5                      93 00104$:
   32F5 DD E1         [14]   94 	pop	ix
   32F7 C9            [10]   95 	ret
                             96 ;src/entities/messages.c:23: u8 strlen(const char *str)
                             97 ;	---------------------------------
                             98 ; Function strlen
                             99 ; ---------------------------------
   32F8                     100 _strlen::
                            101 ;src/entities/messages.c:27: for (s = str; *s; ++s);
   32F8 C1            [10]  102 	pop	bc
   32F9 D1            [10]  103 	pop	de
   32FA D5            [11]  104 	push	de
   32FB C5            [11]  105 	push	bc
   32FC                     106 00103$:
   32FC 1A            [ 7]  107 	ld	a,(de)
   32FD B7            [ 4]  108 	or	a, a
   32FE 28 03         [12]  109 	jr	Z,00101$
   3300 13            [ 6]  110 	inc	de
   3301 18 F9         [12]  111 	jr	00103$
   3303                     112 00101$:
                            113 ;src/entities/messages.c:28: return(s - str);
   3303 21 02 00      [10]  114 	ld	hl,#2
   3306 39            [11]  115 	add	hl,sp
   3307 7B            [ 4]  116 	ld	a,e
   3308 96            [ 7]  117 	sub	a, (hl)
   3309 5F            [ 4]  118 	ld	e,a
   330A 7A            [ 4]  119 	ld	a,d
   330B 23            [ 6]  120 	inc	hl
   330C 9E            [ 7]  121 	sbc	a, (hl)
   330D 6B            [ 4]  122 	ld	l,e
   330E C9            [10]  123 	ret
                            124 ;src/entities/messages.c:35: void colour_message (u8 backg, u8 t){
                            125 ;	---------------------------------
                            126 ; Function colour_message
                            127 ; ---------------------------------
   330F                     128 _colour_message::
                            129 ;src/entities/messages.c:36: cpc_SetInkGphStr(0,backg);
   330F 21 02 00      [10]  130 	ld	hl, #2+0
   3312 39            [11]  131 	add	hl, sp
   3313 7E            [ 7]  132 	ld	a, (hl)
   3314 F5            [11]  133 	push	af
   3315 33            [ 6]  134 	inc	sp
   3316 AF            [ 4]  135 	xor	a, a
   3317 F5            [11]  136 	push	af
   3318 33            [ 6]  137 	inc	sp
   3319 CD 22 50      [17]  138 	call	_cpc_SetInkGphStr
   331C F1            [10]  139 	pop	af
                            140 ;src/entities/messages.c:37: cpc_SetInkGphStr(1,t);
   331D 21 03 00      [10]  141 	ld	hl, #3+0
   3320 39            [11]  142 	add	hl, sp
   3321 56            [ 7]  143 	ld	d, (hl)
   3322 1E 01         [ 7]  144 	ld	e,#0x01
   3324 D5            [11]  145 	push	de
   3325 CD 22 50      [17]  146 	call	_cpc_SetInkGphStr
   3328 F1            [10]  147 	pop	af
                            148 ;src/entities/messages.c:38: cpc_SetInkGphStr(2,t);
   3329 21 03 00      [10]  149 	ld	hl, #3+0
   332C 39            [11]  150 	add	hl, sp
   332D 56            [ 7]  151 	ld	d, (hl)
   332E 1E 02         [ 7]  152 	ld	e,#0x02
   3330 D5            [11]  153 	push	de
   3331 CD 22 50      [17]  154 	call	_cpc_SetInkGphStr
   3334 F1            [10]  155 	pop	af
                            156 ;src/entities/messages.c:39: cpc_SetInkGphStr(3,t);
   3335 21 03 00      [10]  157 	ld	hl, #3+0
   3338 39            [11]  158 	add	hl, sp
   3339 56            [ 7]  159 	ld	d, (hl)
   333A 1E 03         [ 7]  160 	ld	e,#0x03
   333C D5            [11]  161 	push	de
   333D CD 22 50      [17]  162 	call	_cpc_SetInkGphStr
   3340 F1            [10]  163 	pop	af
   3341 C9            [10]  164 	ret
                            165 ;src/entities/messages.c:45: void red_message(){
                            166 ;	---------------------------------
                            167 ; Function red_message
                            168 ; ---------------------------------
   3342                     169 _red_message::
                            170 ;src/entities/messages.c:47: cpc_SetInkGphStr(0,0);
   3342 21 00 00      [10]  171 	ld	hl,#0x0000
   3345 E5            [11]  172 	push	hl
   3346 CD 22 50      [17]  173 	call	_cpc_SetInkGphStr
                            174 ;src/entities/messages.c:48: cpc_SetInkGphStr(1,34);
   3349 21 01 22      [10]  175 	ld	hl, #0x2201
   334C E3            [19]  176 	ex	(sp),hl
   334D CD 22 50      [17]  177 	call	_cpc_SetInkGphStr
                            178 ;src/entities/messages.c:49: cpc_SetInkGphStr(2,42);
   3350 21 02 2A      [10]  179 	ld	hl, #0x2A02
   3353 E3            [19]  180 	ex	(sp),hl
   3354 CD 22 50      [17]  181 	call	_cpc_SetInkGphStr
                            182 ;src/entities/messages.c:50: cpc_SetInkGphStr(3,34);
   3357 21 03 22      [10]  183 	ld	hl, #0x2203
   335A E3            [19]  184 	ex	(sp),hl
   335B CD 22 50      [17]  185 	call	_cpc_SetInkGphStr
   335E F1            [10]  186 	pop	af
   335F C9            [10]  187 	ret
                            188 ;src/entities/messages.c:56: void blue_message(){
                            189 ;	---------------------------------
                            190 ; Function blue_message
                            191 ; ---------------------------------
   3360                     192 _blue_message::
                            193 ;src/entities/messages.c:58: cpc_SetInkGphStr(0,0);
   3360 21 00 00      [10]  194 	ld	hl,#0x0000
   3363 E5            [11]  195 	push	hl
   3364 CD 22 50      [17]  196 	call	_cpc_SetInkGphStr
                            197 ;src/entities/messages.c:59: cpc_SetInkGphStr(1,40);
   3367 21 01 28      [10]  198 	ld	hl, #0x2801
   336A E3            [19]  199 	ex	(sp),hl
   336B CD 22 50      [17]  200 	call	_cpc_SetInkGphStr
                            201 ;src/entities/messages.c:60: cpc_SetInkGphStr(2,40);
   336E 21 02 28      [10]  202 	ld	hl, #0x2802
   3371 E3            [19]  203 	ex	(sp),hl
   3372 CD 22 50      [17]  204 	call	_cpc_SetInkGphStr
                            205 ;src/entities/messages.c:61: cpc_SetInkGphStr(3,10);
   3375 21 03 0A      [10]  206 	ld	hl, #0x0A03
   3378 E3            [19]  207 	ex	(sp),hl
   3379 CD 22 50      [17]  208 	call	_cpc_SetInkGphStr
   337C F1            [10]  209 	pop	af
   337D C9            [10]  210 	ret
                            211 ;src/entities/messages.c:64: void init_messages(){
                            212 ;	---------------------------------
                            213 ; Function init_messages
                            214 ; ---------------------------------
   337E                     215 _init_messages::
   337E DD E5         [15]  216 	push	ix
   3380 DD 21 00 00   [14]  217 	ld	ix,#0
   3384 DD 39         [15]  218 	add	ix,sp
   3386 3B            [ 6]  219 	dec	sp
                            220 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   3387 DD 36 FF 00   [19]  221 	ld	-1 (ix),#0x00
   338B 11 00 00      [10]  222 	ld	de,#0x0000
   338E                     223 00102$:
                            224 ;src/entities/messages.c:68: messages[i].active=0;
   338E 21 59 69      [10]  225 	ld	hl,#_messages
   3391 19            [11]  226 	add	hl,de
   3392 4D            [ 4]  227 	ld	c,l
   3393 44            [ 4]  228 	ld	b,h
   3394 AF            [ 4]  229 	xor	a, a
   3395 02            [ 7]  230 	ld	(bc),a
                            231 ;src/entities/messages.c:69: messages[i].x=0;
   3396 69            [ 4]  232 	ld	l, c
   3397 60            [ 4]  233 	ld	h, b
   3398 23            [ 6]  234 	inc	hl
   3399 36 00         [10]  235 	ld	(hl),#0x00
                            236 ;src/entities/messages.c:70: messages[i].y=0;
   339B 69            [ 4]  237 	ld	l, c
   339C 60            [ 4]  238 	ld	h, b
   339D 23            [ 6]  239 	inc	hl
   339E 23            [ 6]  240 	inc	hl
   339F 36 00         [10]  241 	ld	(hl),#0x00
                            242 ;src/entities/messages.c:71: messages[i].time=0;
   33A1 21 21 00      [10]  243 	ld	hl,#0x0021
   33A4 09            [11]  244 	add	hl,bc
   33A5 36 00         [10]  245 	ld	(hl),#0x00
                            246 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   33A7 21 22 00      [10]  247 	ld	hl,#0x0022
   33AA 19            [11]  248 	add	hl,de
   33AB EB            [ 4]  249 	ex	de,hl
   33AC DD 34 FF      [23]  250 	inc	-1 (ix)
   33AF DD 7E FF      [19]  251 	ld	a,-1 (ix)
   33B2 D6 0A         [ 7]  252 	sub	a, #0x0A
   33B4 38 D8         [12]  253 	jr	C,00102$
                            254 ;src/entities/messages.c:73: active_messages=0;
   33B6 21 AD 6A      [10]  255 	ld	hl,#_active_messages + 0
   33B9 36 00         [10]  256 	ld	(hl), #0x00
   33BB 33            [ 6]  257 	inc	sp
   33BC DD E1         [14]  258 	pop	ix
   33BE C9            [10]  259 	ret
                            260 ;src/entities/messages.c:76: void create_message(u8 x, u8 y, u8 time, u8 *text){
                            261 ;	---------------------------------
                            262 ; Function create_message
                            263 ; ---------------------------------
   33BF                     264 _create_message::
   33BF DD E5         [15]  265 	push	ix
   33C1 DD 21 00 00   [14]  266 	ld	ix,#0
   33C5 DD 39         [15]  267 	add	ix,sp
                            268 ;src/entities/messages.c:79: while (messages[i].active==1) { 
   33C7 01 00 00      [10]  269 	ld	bc,#0x0000
   33CA                     270 00101$:
   33CA 21 59 69      [10]  271 	ld	hl,#_messages
   33CD 09            [11]  272 	add	hl,bc
   33CE EB            [ 4]  273 	ex	de,hl
   33CF 1A            [ 7]  274 	ld	a,(de)
   33D0 3D            [ 4]  275 	dec	a
   33D1 20 08         [12]  276 	jr	NZ,00103$
                            277 ;src/entities/messages.c:80: i++;
   33D3 21 22 00      [10]  278 	ld	hl,#0x0022
   33D6 09            [11]  279 	add	hl,bc
   33D7 4D            [ 4]  280 	ld	c,l
   33D8 44            [ 4]  281 	ld	b,h
   33D9 18 EF         [12]  282 	jr	00101$
   33DB                     283 00103$:
                            284 ;src/entities/messages.c:82: messages[i].active=1;
   33DB 3E 01         [ 7]  285 	ld	a,#0x01
   33DD 12            [ 7]  286 	ld	(de),a
                            287 ;src/entities/messages.c:83: messages[i].x = x;
   33DE 6B            [ 4]  288 	ld	l, e
   33DF 62            [ 4]  289 	ld	h, d
   33E0 23            [ 6]  290 	inc	hl
   33E1 DD 7E 04      [19]  291 	ld	a,4 (ix)
   33E4 77            [ 7]  292 	ld	(hl),a
                            293 ;src/entities/messages.c:84: messages[i].y = y;
   33E5 6B            [ 4]  294 	ld	l, e
   33E6 62            [ 4]  295 	ld	h, d
   33E7 23            [ 6]  296 	inc	hl
   33E8 23            [ 6]  297 	inc	hl
   33E9 DD 7E 05      [19]  298 	ld	a,5 (ix)
   33EC 77            [ 7]  299 	ld	(hl),a
                            300 ;src/entities/messages.c:85: messages[i].time = time;
   33ED 21 21 00      [10]  301 	ld	hl,#0x0021
   33F0 19            [11]  302 	add	hl,de
   33F1 DD 7E 06      [19]  303 	ld	a,6 (ix)
   33F4 77            [ 7]  304 	ld	(hl),a
                            305 ;src/entities/messages.c:86: strcpy(messages[i].text,text);
   33F5 13            [ 6]  306 	inc	de
   33F6 13            [ 6]  307 	inc	de
   33F7 13            [ 6]  308 	inc	de
   33F8 DD 6E 07      [19]  309 	ld	l,7 (ix)
   33FB DD 66 08      [19]  310 	ld	h,8 (ix)
   33FE E5            [11]  311 	push	hl
   33FF D5            [11]  312 	push	de
   3400 CD CE 32      [17]  313 	call	_strcpy
   3403 F1            [10]  314 	pop	af
   3404 F1            [10]  315 	pop	af
                            316 ;src/entities/messages.c:87: active_messages++;
   3405 21 AD 6A      [10]  317 	ld	hl, #_active_messages+0
   3408 34            [11]  318 	inc	(hl)
   3409 DD E1         [14]  319 	pop	ix
   340B C9            [10]  320 	ret
                            321 ;src/entities/messages.c:90: void draw_messages(u8* screen){
                            322 ;	---------------------------------
                            323 ; Function draw_messages
                            324 ; ---------------------------------
   340C                     325 _draw_messages::
   340C DD E5         [15]  326 	push	ix
   340E DD 21 00 00   [14]  327 	ld	ix,#0
   3412 DD 39         [15]  328 	add	ix,sp
   3414 21 F3 FF      [10]  329 	ld	hl,#-13
   3417 39            [11]  330 	add	hl,sp
   3418 F9            [ 6]  331 	ld	sp,hl
                            332 ;src/entities/messages.c:94: if (active_messages){
   3419 3A AD 6A      [13]  333 	ld	a,(#_active_messages + 0)
   341C B7            [ 4]  334 	or	a, a
   341D CA 32 35      [10]  335 	jp	Z,00110$
                            336 ;src/entities/messages.c:95: blue_message();
   3420 CD 60 33      [17]  337 	call	_blue_message
                            338 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3423 DD 36 F3 00   [19]  339 	ld	-13 (ix),#0x00
   3427 11 00 00      [10]  340 	ld	de,#0x0000
   342A                     341 00108$:
                            342 ;src/entities/messages.c:97: if (messages[i].active){
   342A 21 59 69      [10]  343 	ld	hl,#_messages
   342D 19            [11]  344 	add	hl,de
   342E DD 75 F6      [19]  345 	ld	-10 (ix),l
   3431 DD 74 F7      [19]  346 	ld	-9 (ix),h
   3434 DD 6E F6      [19]  347 	ld	l,-10 (ix)
   3437 DD 66 F7      [19]  348 	ld	h,-9 (ix)
   343A 7E            [ 7]  349 	ld	a,(hl)
   343B B7            [ 4]  350 	or	a, a
   343C CA 22 35      [10]  351 	jp	Z,00109$
                            352 ;src/entities/messages.c:98: pscreen = cpct_getScreenPtr(screen, messages[i].x-2, messages[i].y-4);
   343F DD 7E F6      [19]  353 	ld	a,-10 (ix)
   3442 C6 02         [ 7]  354 	add	a, #0x02
   3444 DD 77 F8      [19]  355 	ld	-8 (ix),a
   3447 DD 7E F7      [19]  356 	ld	a,-9 (ix)
   344A CE 00         [ 7]  357 	adc	a, #0x00
   344C DD 77 F9      [19]  358 	ld	-7 (ix),a
   344F DD 6E F8      [19]  359 	ld	l,-8 (ix)
   3452 DD 66 F9      [19]  360 	ld	h,-7 (ix)
   3455 7E            [ 7]  361 	ld	a,(hl)
   3456 C6 FC         [ 7]  362 	add	a,#0xFC
   3458 47            [ 4]  363 	ld	b,a
   3459 DD 7E F6      [19]  364 	ld	a,-10 (ix)
   345C C6 01         [ 7]  365 	add	a, #0x01
   345E DD 77 F4      [19]  366 	ld	-12 (ix),a
   3461 DD 7E F7      [19]  367 	ld	a,-9 (ix)
   3464 CE 00         [ 7]  368 	adc	a, #0x00
   3466 DD 77 F5      [19]  369 	ld	-11 (ix),a
   3469 DD 6E F4      [19]  370 	ld	l,-12 (ix)
   346C DD 66 F5      [19]  371 	ld	h,-11 (ix)
   346F 4E            [ 7]  372 	ld	c,(hl)
   3470 0D            [ 4]  373 	dec	c
   3471 0D            [ 4]  374 	dec	c
   3472 DD 7E 04      [19]  375 	ld	a,4 (ix)
   3475 DD 77 FE      [19]  376 	ld	-2 (ix),a
   3478 DD 7E 05      [19]  377 	ld	a,5 (ix)
   347B DD 77 FF      [19]  378 	ld	-1 (ix),a
   347E D5            [11]  379 	push	de
   347F C5            [11]  380 	push	bc
   3480 DD 6E FE      [19]  381 	ld	l,-2 (ix)
   3483 DD 66 FF      [19]  382 	ld	h,-1 (ix)
   3486 E5            [11]  383 	push	hl
   3487 CD 89 56      [17]  384 	call	_cpct_getScreenPtr
   348A D1            [10]  385 	pop	de
   348B 4D            [ 4]  386 	ld	c, l
   348C 44            [ 4]  387 	ld	b, h
                            388 ;src/entities/messages.c:99: cpct_drawSolidBox(pscreen , cpct_px2byteM0(3, 3), strlen(messages[i].text)*2+4, 18);
   348D DD 7E F6      [19]  389 	ld	a,-10 (ix)
   3490 C6 03         [ 7]  390 	add	a, #0x03
   3492 DD 77 FC      [19]  391 	ld	-4 (ix),a
   3495 DD 7E F7      [19]  392 	ld	a,-9 (ix)
   3498 CE 00         [ 7]  393 	adc	a, #0x00
   349A DD 77 FD      [19]  394 	ld	-3 (ix),a
   349D DD 6E FC      [19]  395 	ld	l,-4 (ix)
   34A0 DD 66 FD      [19]  396 	ld	h,-3 (ix)
   34A3 C5            [11]  397 	push	bc
   34A4 D5            [11]  398 	push	de
   34A5 E5            [11]  399 	push	hl
   34A6 CD F8 32      [17]  400 	call	_strlen
   34A9 F1            [10]  401 	pop	af
   34AA 7D            [ 4]  402 	ld	a,l
   34AB D1            [10]  403 	pop	de
   34AC C1            [10]  404 	pop	bc
   34AD 87            [ 4]  405 	add	a, a
   34AE C6 04         [ 7]  406 	add	a, #0x04
   34B0 DD 77 FB      [19]  407 	ld	-5 (ix),a
   34B3 C5            [11]  408 	push	bc
   34B4 D5            [11]  409 	push	de
   34B5 21 03 03      [10]  410 	ld	hl,#0x0303
   34B8 E5            [11]  411 	push	hl
   34B9 CD 85 55      [17]  412 	call	_cpct_px2byteM0
   34BC F1            [10]  413 	pop	af
   34BD DD 75 FA      [19]  414 	ld	-6 (ix),l
   34C0 D1            [10]  415 	pop	de
   34C1 C1            [10]  416 	pop	bc
   34C2 D5            [11]  417 	push	de
   34C3 3E 12         [ 7]  418 	ld	a,#0x12
   34C5 F5            [11]  419 	push	af
   34C6 33            [ 6]  420 	inc	sp
   34C7 DD 66 FB      [19]  421 	ld	h,-5 (ix)
   34CA DD 6E FA      [19]  422 	ld	l,-6 (ix)
   34CD E5            [11]  423 	push	hl
   34CE C5            [11]  424 	push	bc
   34CF CD B8 55      [17]  425 	call	_cpct_drawSolidBox
   34D2 F1            [10]  426 	pop	af
   34D3 F1            [10]  427 	pop	af
   34D4 33            [ 6]  428 	inc	sp
   34D5 D1            [10]  429 	pop	de
                            430 ;src/entities/messages.c:100: cpc_PrintGphStr(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
   34D6 DD 6E F8      [19]  431 	ld	l,-8 (ix)
   34D9 DD 66 F9      [19]  432 	ld	h,-7 (ix)
   34DC 7E            [ 7]  433 	ld	a,(hl)
   34DD DD 6E F4      [19]  434 	ld	l,-12 (ix)
   34E0 DD 66 F5      [19]  435 	ld	h,-11 (ix)
   34E3 46            [ 7]  436 	ld	b,(hl)
   34E4 D5            [11]  437 	push	de
   34E5 F5            [11]  438 	push	af
   34E6 33            [ 6]  439 	inc	sp
   34E7 C5            [11]  440 	push	bc
   34E8 33            [ 6]  441 	inc	sp
   34E9 DD 6E FE      [19]  442 	ld	l,-2 (ix)
   34EC DD 66 FF      [19]  443 	ld	h,-1 (ix)
   34EF E5            [11]  444 	push	hl
   34F0 CD 89 56      [17]  445 	call	_cpct_getScreenPtr
   34F3 D1            [10]  446 	pop	de
   34F4 DD 4E FC      [19]  447 	ld	c,-4 (ix)
   34F7 DD 46 FD      [19]  448 	ld	b,-3 (ix)
   34FA D5            [11]  449 	push	de
   34FB E5            [11]  450 	push	hl
   34FC C5            [11]  451 	push	bc
   34FD CD DC 4E      [17]  452 	call	_cpc_PrintGphStr
   3500 F1            [10]  453 	pop	af
   3501 F1            [10]  454 	pop	af
   3502 D1            [10]  455 	pop	de
                            456 ;src/entities/messages.c:101: messages[i].time--;
   3503 DD 7E F6      [19]  457 	ld	a,-10 (ix)
   3506 C6 21         [ 7]  458 	add	a, #0x21
   3508 6F            [ 4]  459 	ld	l,a
   3509 DD 7E F7      [19]  460 	ld	a,-9 (ix)
   350C CE 00         [ 7]  461 	adc	a, #0x00
   350E 67            [ 4]  462 	ld	h,a
   350F 7E            [ 7]  463 	ld	a,(hl)
   3510 C6 FF         [ 7]  464 	add	a,#0xFF
   3512 77            [ 7]  465 	ld	(hl),a
                            466 ;src/entities/messages.c:102: if (!messages[i].time){
   3513 B7            [ 4]  467 	or	a, a
   3514 20 0C         [12]  468 	jr	NZ,00109$
                            469 ;src/entities/messages.c:103: messages[i].active=0;
   3516 DD 6E F6      [19]  470 	ld	l,-10 (ix)
   3519 DD 66 F7      [19]  471 	ld	h,-9 (ix)
   351C 36 00         [10]  472 	ld	(hl),#0x00
                            473 ;src/entities/messages.c:104: active_messages--;
   351E 21 AD 6A      [10]  474 	ld	hl, #_active_messages+0
   3521 35            [11]  475 	dec	(hl)
   3522                     476 00109$:
                            477 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3522 21 22 00      [10]  478 	ld	hl,#0x0022
   3525 19            [11]  479 	add	hl,de
   3526 EB            [ 4]  480 	ex	de,hl
   3527 DD 34 F3      [23]  481 	inc	-13 (ix)
   352A DD 7E F3      [19]  482 	ld	a,-13 (ix)
   352D D6 0A         [ 7]  483 	sub	a, #0x0A
   352F DA 2A 34      [10]  484 	jp	C,00108$
   3532                     485 00110$:
   3532 DD F9         [10]  486 	ld	sp, ix
   3534 DD E1         [14]  487 	pop	ix
   3536 C9            [10]  488 	ret
                            489 	.area _CODE
                            490 	.area _INITIALIZER
                            491 	.area _CABS (ABS)
