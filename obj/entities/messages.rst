                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 17:19:38 2015
                              5 ;--------------------------------------------------------
                              6 	.module messages
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _cpc_SetInkGphStr
                             13 	.globl _cpc_PrintGphStr2X
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
   627C                      35 _messages::
   627C                      36 	.ds 340
   63D0                      37 _active_messages::
   63D0                      38 	.ds 1
   63D1                      39 _aux_txt2::
   63D1                      40 	.ds 40
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
   30C0                      69 _strcpy::
   30C0 DD E5         [15]   70 	push	ix
   30C2 DD 21 00 00   [14]   71 	ld	ix,#0
   30C6 DD 39         [15]   72 	add	ix,sp
                             73 ;src/entities/messages.c:17: while (i){
   30C8 DD 4E 06      [19]   74 	ld	c,6 (ix)
   30CB DD 46 07      [19]   75 	ld	b,7 (ix)
   30CE DD 5E 04      [19]   76 	ld	e,4 (ix)
   30D1 DD 56 05      [19]   77 	ld	d,5 (ix)
   30D4 D5            [11]   78 	push	de
   30D5 FD E1         [14]   79 	pop	iy
   30D7 16 1E         [ 7]   80 	ld	d,#0x1E
   30D9                      81 00101$:
   30D9 7A            [ 4]   82 	ld	a,d
   30DA B7            [ 4]   83 	or	a, a
   30DB 28 0A         [12]   84 	jr	Z,00104$
                             85 ;src/entities/messages.c:18: *to++ = *from++;
   30DD 0A            [ 7]   86 	ld	a,(bc)
   30DE 03            [ 6]   87 	inc	bc
   30DF FD 77 00      [19]   88 	ld	0 (iy), a
   30E2 FD 23         [10]   89 	inc	iy
                             90 ;src/entities/messages.c:19: i--;
   30E4 15            [ 4]   91 	dec	d
   30E5 18 F2         [12]   92 	jr	00101$
   30E7                      93 00104$:
   30E7 DD E1         [14]   94 	pop	ix
   30E9 C9            [10]   95 	ret
                             96 ;src/entities/messages.c:23: u8 strlen(const char *str)
                             97 ;	---------------------------------
                             98 ; Function strlen
                             99 ; ---------------------------------
   30EA                     100 _strlen::
                            101 ;src/entities/messages.c:27: for (s = str; *s; ++s);
   30EA C1            [10]  102 	pop	bc
   30EB D1            [10]  103 	pop	de
   30EC D5            [11]  104 	push	de
   30ED C5            [11]  105 	push	bc
   30EE                     106 00103$:
   30EE 1A            [ 7]  107 	ld	a,(de)
   30EF B7            [ 4]  108 	or	a, a
   30F0 28 03         [12]  109 	jr	Z,00101$
   30F2 13            [ 6]  110 	inc	de
   30F3 18 F9         [12]  111 	jr	00103$
   30F5                     112 00101$:
                            113 ;src/entities/messages.c:28: return(s - str);
   30F5 21 02 00      [10]  114 	ld	hl,#2
   30F8 39            [11]  115 	add	hl,sp
   30F9 7B            [ 4]  116 	ld	a,e
   30FA 96            [ 7]  117 	sub	a, (hl)
   30FB 5F            [ 4]  118 	ld	e,a
   30FC 7A            [ 4]  119 	ld	a,d
   30FD 23            [ 6]  120 	inc	hl
   30FE 9E            [ 7]  121 	sbc	a, (hl)
   30FF 6B            [ 4]  122 	ld	l,e
   3100 C9            [10]  123 	ret
                            124 ;src/entities/messages.c:35: void colour_message (u8 backg, u8 t){
                            125 ;	---------------------------------
                            126 ; Function colour_message
                            127 ; ---------------------------------
   3101                     128 _colour_message::
                            129 ;src/entities/messages.c:36: cpc_SetInkGphStr(0,backg);
   3101 21 02 00      [10]  130 	ld	hl, #2+0
   3104 39            [11]  131 	add	hl, sp
   3105 7E            [ 7]  132 	ld	a, (hl)
   3106 F5            [11]  133 	push	af
   3107 33            [ 6]  134 	inc	sp
   3108 AF            [ 4]  135 	xor	a, a
   3109 F5            [11]  136 	push	af
   310A 33            [ 6]  137 	inc	sp
   310B CD 2B 49      [17]  138 	call	_cpc_SetInkGphStr
   310E F1            [10]  139 	pop	af
                            140 ;src/entities/messages.c:37: cpc_SetInkGphStr(1,t);
   310F 21 03 00      [10]  141 	ld	hl, #3+0
   3112 39            [11]  142 	add	hl, sp
   3113 56            [ 7]  143 	ld	d, (hl)
   3114 1E 01         [ 7]  144 	ld	e,#0x01
   3116 D5            [11]  145 	push	de
   3117 CD 2B 49      [17]  146 	call	_cpc_SetInkGphStr
   311A F1            [10]  147 	pop	af
                            148 ;src/entities/messages.c:38: cpc_SetInkGphStr(2,t);
   311B 21 03 00      [10]  149 	ld	hl, #3+0
   311E 39            [11]  150 	add	hl, sp
   311F 56            [ 7]  151 	ld	d, (hl)
   3120 1E 02         [ 7]  152 	ld	e,#0x02
   3122 D5            [11]  153 	push	de
   3123 CD 2B 49      [17]  154 	call	_cpc_SetInkGphStr
   3126 F1            [10]  155 	pop	af
                            156 ;src/entities/messages.c:39: cpc_SetInkGphStr(3,t);
   3127 21 03 00      [10]  157 	ld	hl, #3+0
   312A 39            [11]  158 	add	hl, sp
   312B 56            [ 7]  159 	ld	d, (hl)
   312C 1E 03         [ 7]  160 	ld	e,#0x03
   312E D5            [11]  161 	push	de
   312F CD 2B 49      [17]  162 	call	_cpc_SetInkGphStr
   3132 F1            [10]  163 	pop	af
   3133 C9            [10]  164 	ret
                            165 ;src/entities/messages.c:45: void red_message(){
                            166 ;	---------------------------------
                            167 ; Function red_message
                            168 ; ---------------------------------
   3134                     169 _red_message::
                            170 ;src/entities/messages.c:47: cpc_SetInkGphStr(0,0);
   3134 21 00 00      [10]  171 	ld	hl,#0x0000
   3137 E5            [11]  172 	push	hl
   3138 CD 2B 49      [17]  173 	call	_cpc_SetInkGphStr
                            174 ;src/entities/messages.c:48: cpc_SetInkGphStr(1,42);
   313B 21 01 2A      [10]  175 	ld	hl, #0x2A01
   313E E3            [19]  176 	ex	(sp),hl
   313F CD 2B 49      [17]  177 	call	_cpc_SetInkGphStr
                            178 ;src/entities/messages.c:49: cpc_SetInkGphStr(2,34);
   3142 21 02 22      [10]  179 	ld	hl, #0x2202
   3145 E3            [19]  180 	ex	(sp),hl
   3146 CD 2B 49      [17]  181 	call	_cpc_SetInkGphStr
                            182 ;src/entities/messages.c:50: cpc_SetInkGphStr(3,42);
   3149 21 03 2A      [10]  183 	ld	hl, #0x2A03
   314C E3            [19]  184 	ex	(sp),hl
   314D CD 2B 49      [17]  185 	call	_cpc_SetInkGphStr
   3150 F1            [10]  186 	pop	af
   3151 C9            [10]  187 	ret
                            188 ;src/entities/messages.c:56: void blue_message(){
                            189 ;	---------------------------------
                            190 ; Function blue_message
                            191 ; ---------------------------------
   3152                     192 _blue_message::
                            193 ;src/entities/messages.c:58: cpc_SetInkGphStr(0,0);
   3152 21 00 00      [10]  194 	ld	hl,#0x0000
   3155 E5            [11]  195 	push	hl
   3156 CD 2B 49      [17]  196 	call	_cpc_SetInkGphStr
                            197 ;src/entities/messages.c:59: cpc_SetInkGphStr(1,40);
   3159 21 01 28      [10]  198 	ld	hl, #0x2801
   315C E3            [19]  199 	ex	(sp),hl
   315D CD 2B 49      [17]  200 	call	_cpc_SetInkGphStr
                            201 ;src/entities/messages.c:60: cpc_SetInkGphStr(2,40);
   3160 21 02 28      [10]  202 	ld	hl, #0x2802
   3163 E3            [19]  203 	ex	(sp),hl
   3164 CD 2B 49      [17]  204 	call	_cpc_SetInkGphStr
                            205 ;src/entities/messages.c:61: cpc_SetInkGphStr(3,10);
   3167 21 03 0A      [10]  206 	ld	hl, #0x0A03
   316A E3            [19]  207 	ex	(sp),hl
   316B CD 2B 49      [17]  208 	call	_cpc_SetInkGphStr
   316E F1            [10]  209 	pop	af
   316F C9            [10]  210 	ret
                            211 ;src/entities/messages.c:64: void init_messages(){
                            212 ;	---------------------------------
                            213 ; Function init_messages
                            214 ; ---------------------------------
   3170                     215 _init_messages::
   3170 DD E5         [15]  216 	push	ix
   3172 DD 21 00 00   [14]  217 	ld	ix,#0
   3176 DD 39         [15]  218 	add	ix,sp
   3178 3B            [ 6]  219 	dec	sp
                            220 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   3179 DD 36 FF 00   [19]  221 	ld	-1 (ix),#0x00
   317D 11 00 00      [10]  222 	ld	de,#0x0000
   3180                     223 00102$:
                            224 ;src/entities/messages.c:68: messages[i].active=0;
   3180 21 7C 62      [10]  225 	ld	hl,#_messages
   3183 19            [11]  226 	add	hl,de
   3184 4D            [ 4]  227 	ld	c,l
   3185 44            [ 4]  228 	ld	b,h
   3186 AF            [ 4]  229 	xor	a, a
   3187 02            [ 7]  230 	ld	(bc),a
                            231 ;src/entities/messages.c:69: messages[i].x=0;
   3188 69            [ 4]  232 	ld	l, c
   3189 60            [ 4]  233 	ld	h, b
   318A 23            [ 6]  234 	inc	hl
   318B 36 00         [10]  235 	ld	(hl),#0x00
                            236 ;src/entities/messages.c:70: messages[i].y=0;
   318D 69            [ 4]  237 	ld	l, c
   318E 60            [ 4]  238 	ld	h, b
   318F 23            [ 6]  239 	inc	hl
   3190 23            [ 6]  240 	inc	hl
   3191 36 00         [10]  241 	ld	(hl),#0x00
                            242 ;src/entities/messages.c:71: messages[i].time=0;
   3193 21 21 00      [10]  243 	ld	hl,#0x0021
   3196 09            [11]  244 	add	hl,bc
   3197 36 00         [10]  245 	ld	(hl),#0x00
                            246 ;src/entities/messages.c:67: for(i=0; i<MAX_MESSAGES; i++){
   3199 21 22 00      [10]  247 	ld	hl,#0x0022
   319C 19            [11]  248 	add	hl,de
   319D EB            [ 4]  249 	ex	de,hl
   319E DD 34 FF      [23]  250 	inc	-1 (ix)
   31A1 DD 7E FF      [19]  251 	ld	a,-1 (ix)
   31A4 D6 0A         [ 7]  252 	sub	a, #0x0A
   31A6 38 D8         [12]  253 	jr	C,00102$
                            254 ;src/entities/messages.c:73: active_messages=0;
   31A8 21 D0 63      [10]  255 	ld	hl,#_active_messages + 0
   31AB 36 00         [10]  256 	ld	(hl), #0x00
   31AD 33            [ 6]  257 	inc	sp
   31AE DD E1         [14]  258 	pop	ix
   31B0 C9            [10]  259 	ret
                            260 ;src/entities/messages.c:76: void create_message(u8 x, u8 y, u8 time, u8 *text){
                            261 ;	---------------------------------
                            262 ; Function create_message
                            263 ; ---------------------------------
   31B1                     264 _create_message::
   31B1 DD E5         [15]  265 	push	ix
   31B3 DD 21 00 00   [14]  266 	ld	ix,#0
   31B7 DD 39         [15]  267 	add	ix,sp
                            268 ;src/entities/messages.c:79: while (messages[i].active==1) { 
   31B9 01 00 00      [10]  269 	ld	bc,#0x0000
   31BC                     270 00101$:
   31BC 21 7C 62      [10]  271 	ld	hl,#_messages
   31BF 09            [11]  272 	add	hl,bc
   31C0 EB            [ 4]  273 	ex	de,hl
   31C1 1A            [ 7]  274 	ld	a,(de)
   31C2 3D            [ 4]  275 	dec	a
   31C3 20 08         [12]  276 	jr	NZ,00103$
                            277 ;src/entities/messages.c:80: i++;
   31C5 21 22 00      [10]  278 	ld	hl,#0x0022
   31C8 09            [11]  279 	add	hl,bc
   31C9 4D            [ 4]  280 	ld	c,l
   31CA 44            [ 4]  281 	ld	b,h
   31CB 18 EF         [12]  282 	jr	00101$
   31CD                     283 00103$:
                            284 ;src/entities/messages.c:82: messages[i].active=1;
   31CD 3E 01         [ 7]  285 	ld	a,#0x01
   31CF 12            [ 7]  286 	ld	(de),a
                            287 ;src/entities/messages.c:83: messages[i].x = x;
   31D0 6B            [ 4]  288 	ld	l, e
   31D1 62            [ 4]  289 	ld	h, d
   31D2 23            [ 6]  290 	inc	hl
   31D3 DD 7E 04      [19]  291 	ld	a,4 (ix)
   31D6 77            [ 7]  292 	ld	(hl),a
                            293 ;src/entities/messages.c:84: messages[i].y = y;
   31D7 6B            [ 4]  294 	ld	l, e
   31D8 62            [ 4]  295 	ld	h, d
   31D9 23            [ 6]  296 	inc	hl
   31DA 23            [ 6]  297 	inc	hl
   31DB DD 7E 05      [19]  298 	ld	a,5 (ix)
   31DE 77            [ 7]  299 	ld	(hl),a
                            300 ;src/entities/messages.c:85: messages[i].time = time;
   31DF 21 21 00      [10]  301 	ld	hl,#0x0021
   31E2 19            [11]  302 	add	hl,de
   31E3 DD 7E 06      [19]  303 	ld	a,6 (ix)
   31E6 77            [ 7]  304 	ld	(hl),a
                            305 ;src/entities/messages.c:86: strcpy(messages[i].text,text);
   31E7 13            [ 6]  306 	inc	de
   31E8 13            [ 6]  307 	inc	de
   31E9 13            [ 6]  308 	inc	de
   31EA DD 6E 07      [19]  309 	ld	l,7 (ix)
   31ED DD 66 08      [19]  310 	ld	h,8 (ix)
   31F0 E5            [11]  311 	push	hl
   31F1 D5            [11]  312 	push	de
   31F2 CD C0 30      [17]  313 	call	_strcpy
   31F5 F1            [10]  314 	pop	af
   31F6 F1            [10]  315 	pop	af
                            316 ;src/entities/messages.c:87: active_messages++;
   31F7 21 D0 63      [10]  317 	ld	hl, #_active_messages+0
   31FA 34            [11]  318 	inc	(hl)
   31FB DD E1         [14]  319 	pop	ix
   31FD C9            [10]  320 	ret
                            321 ;src/entities/messages.c:90: void draw_messages(u8* screen){
                            322 ;	---------------------------------
                            323 ; Function draw_messages
                            324 ; ---------------------------------
   31FE                     325 _draw_messages::
   31FE DD E5         [15]  326 	push	ix
   3200 DD 21 00 00   [14]  327 	ld	ix,#0
   3204 DD 39         [15]  328 	add	ix,sp
   3206 21 F3 FF      [10]  329 	ld	hl,#-13
   3209 39            [11]  330 	add	hl,sp
   320A F9            [ 6]  331 	ld	sp,hl
                            332 ;src/entities/messages.c:94: if (active_messages){
   320B 3A D0 63      [13]  333 	ld	a,(#_active_messages + 0)
   320E B7            [ 4]  334 	or	a, a
   320F CA 24 33      [10]  335 	jp	Z,00110$
                            336 ;src/entities/messages.c:95: blue_message();
   3212 CD 52 31      [17]  337 	call	_blue_message
                            338 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3215 DD 36 F3 00   [19]  339 	ld	-13 (ix),#0x00
   3219 11 00 00      [10]  340 	ld	de,#0x0000
   321C                     341 00108$:
                            342 ;src/entities/messages.c:97: if (messages[i].active){
   321C 21 7C 62      [10]  343 	ld	hl,#_messages
   321F 19            [11]  344 	add	hl,de
   3220 DD 75 FE      [19]  345 	ld	-2 (ix),l
   3223 DD 74 FF      [19]  346 	ld	-1 (ix),h
   3226 DD 6E FE      [19]  347 	ld	l,-2 (ix)
   3229 DD 66 FF      [19]  348 	ld	h,-1 (ix)
   322C 7E            [ 7]  349 	ld	a,(hl)
   322D B7            [ 4]  350 	or	a, a
   322E CA 14 33      [10]  351 	jp	Z,00109$
                            352 ;src/entities/messages.c:98: pscreen = cpct_getScreenPtr(screen, messages[i].x-2, messages[i].y-4);
   3231 DD 7E FE      [19]  353 	ld	a,-2 (ix)
   3234 C6 02         [ 7]  354 	add	a, #0x02
   3236 DD 77 FC      [19]  355 	ld	-4 (ix),a
   3239 DD 7E FF      [19]  356 	ld	a,-1 (ix)
   323C CE 00         [ 7]  357 	adc	a, #0x00
   323E DD 77 FD      [19]  358 	ld	-3 (ix),a
   3241 DD 6E FC      [19]  359 	ld	l,-4 (ix)
   3244 DD 66 FD      [19]  360 	ld	h,-3 (ix)
   3247 7E            [ 7]  361 	ld	a,(hl)
   3248 C6 FC         [ 7]  362 	add	a,#0xFC
   324A 47            [ 4]  363 	ld	b,a
   324B DD 7E FE      [19]  364 	ld	a,-2 (ix)
   324E C6 01         [ 7]  365 	add	a, #0x01
   3250 DD 77 FA      [19]  366 	ld	-6 (ix),a
   3253 DD 7E FF      [19]  367 	ld	a,-1 (ix)
   3256 CE 00         [ 7]  368 	adc	a, #0x00
   3258 DD 77 FB      [19]  369 	ld	-5 (ix),a
   325B DD 6E FA      [19]  370 	ld	l,-6 (ix)
   325E DD 66 FB      [19]  371 	ld	h,-5 (ix)
   3261 4E            [ 7]  372 	ld	c,(hl)
   3262 0D            [ 4]  373 	dec	c
   3263 0D            [ 4]  374 	dec	c
   3264 DD 7E 04      [19]  375 	ld	a,4 (ix)
   3267 DD 77 F8      [19]  376 	ld	-8 (ix),a
   326A DD 7E 05      [19]  377 	ld	a,5 (ix)
   326D DD 77 F9      [19]  378 	ld	-7 (ix),a
   3270 D5            [11]  379 	push	de
   3271 C5            [11]  380 	push	bc
   3272 DD 6E F8      [19]  381 	ld	l,-8 (ix)
   3275 DD 66 F9      [19]  382 	ld	h,-7 (ix)
   3278 E5            [11]  383 	push	hl
   3279 CD A0 4F      [17]  384 	call	_cpct_getScreenPtr
   327C D1            [10]  385 	pop	de
   327D 4D            [ 4]  386 	ld	c, l
   327E 44            [ 4]  387 	ld	b, h
                            388 ;src/entities/messages.c:99: cpct_drawSolidBox(pscreen , cpct_px2byteM0(3, 3), strlen(messages[i].text)*2+4, 18);
   327F DD 7E FE      [19]  389 	ld	a,-2 (ix)
   3282 C6 03         [ 7]  390 	add	a, #0x03
   3284 DD 77 F6      [19]  391 	ld	-10 (ix),a
   3287 DD 7E FF      [19]  392 	ld	a,-1 (ix)
   328A CE 00         [ 7]  393 	adc	a, #0x00
   328C DD 77 F7      [19]  394 	ld	-9 (ix),a
   328F DD 6E F6      [19]  395 	ld	l,-10 (ix)
   3292 DD 66 F7      [19]  396 	ld	h,-9 (ix)
   3295 C5            [11]  397 	push	bc
   3296 D5            [11]  398 	push	de
   3297 E5            [11]  399 	push	hl
   3298 CD EA 30      [17]  400 	call	_strlen
   329B F1            [10]  401 	pop	af
   329C 7D            [ 4]  402 	ld	a,l
   329D D1            [10]  403 	pop	de
   329E C1            [10]  404 	pop	bc
   329F 87            [ 4]  405 	add	a, a
   32A0 C6 04         [ 7]  406 	add	a, #0x04
   32A2 DD 77 F5      [19]  407 	ld	-11 (ix),a
   32A5 C5            [11]  408 	push	bc
   32A6 D5            [11]  409 	push	de
   32A7 21 03 03      [10]  410 	ld	hl,#0x0303
   32AA E5            [11]  411 	push	hl
   32AB CD 9C 4E      [17]  412 	call	_cpct_px2byteM0
   32AE F1            [10]  413 	pop	af
   32AF DD 75 F4      [19]  414 	ld	-12 (ix),l
   32B2 D1            [10]  415 	pop	de
   32B3 C1            [10]  416 	pop	bc
   32B4 D5            [11]  417 	push	de
   32B5 3E 12         [ 7]  418 	ld	a,#0x12
   32B7 F5            [11]  419 	push	af
   32B8 33            [ 6]  420 	inc	sp
   32B9 DD 66 F5      [19]  421 	ld	h,-11 (ix)
   32BC DD 6E F4      [19]  422 	ld	l,-12 (ix)
   32BF E5            [11]  423 	push	hl
   32C0 C5            [11]  424 	push	bc
   32C1 CD BB 4E      [17]  425 	call	_cpct_drawSolidBox
   32C4 F1            [10]  426 	pop	af
   32C5 F1            [10]  427 	pop	af
   32C6 33            [ 6]  428 	inc	sp
   32C7 D1            [10]  429 	pop	de
                            430 ;src/entities/messages.c:100: cpc_PrintGphStr2X(messages[i].text, (int) cpct_getScreenPtr(screen, messages[i].x, messages[i].y));
   32C8 DD 6E FC      [19]  431 	ld	l,-4 (ix)
   32CB DD 66 FD      [19]  432 	ld	h,-3 (ix)
   32CE 7E            [ 7]  433 	ld	a,(hl)
   32CF DD 6E FA      [19]  434 	ld	l,-6 (ix)
   32D2 DD 66 FB      [19]  435 	ld	h,-5 (ix)
   32D5 46            [ 7]  436 	ld	b,(hl)
   32D6 D5            [11]  437 	push	de
   32D7 F5            [11]  438 	push	af
   32D8 33            [ 6]  439 	inc	sp
   32D9 C5            [11]  440 	push	bc
   32DA 33            [ 6]  441 	inc	sp
   32DB DD 6E F8      [19]  442 	ld	l,-8 (ix)
   32DE DD 66 F9      [19]  443 	ld	h,-7 (ix)
   32E1 E5            [11]  444 	push	hl
   32E2 CD A0 4F      [17]  445 	call	_cpct_getScreenPtr
   32E5 D1            [10]  446 	pop	de
   32E6 DD 4E F6      [19]  447 	ld	c,-10 (ix)
   32E9 DD 46 F7      [19]  448 	ld	b,-9 (ix)
   32EC D5            [11]  449 	push	de
   32ED E5            [11]  450 	push	hl
   32EE C5            [11]  451 	push	bc
   32EF CD DA 47      [17]  452 	call	_cpc_PrintGphStr2X
   32F2 F1            [10]  453 	pop	af
   32F3 F1            [10]  454 	pop	af
   32F4 D1            [10]  455 	pop	de
                            456 ;src/entities/messages.c:101: messages[i].time--;
   32F5 DD 7E FE      [19]  457 	ld	a,-2 (ix)
   32F8 C6 21         [ 7]  458 	add	a, #0x21
   32FA 6F            [ 4]  459 	ld	l,a
   32FB DD 7E FF      [19]  460 	ld	a,-1 (ix)
   32FE CE 00         [ 7]  461 	adc	a, #0x00
   3300 67            [ 4]  462 	ld	h,a
   3301 7E            [ 7]  463 	ld	a,(hl)
   3302 C6 FF         [ 7]  464 	add	a,#0xFF
   3304 77            [ 7]  465 	ld	(hl),a
                            466 ;src/entities/messages.c:102: if (!messages[i].time){
   3305 B7            [ 4]  467 	or	a, a
   3306 20 0C         [12]  468 	jr	NZ,00109$
                            469 ;src/entities/messages.c:103: messages[i].active=0;
   3308 DD 6E FE      [19]  470 	ld	l,-2 (ix)
   330B DD 66 FF      [19]  471 	ld	h,-1 (ix)
   330E 36 00         [10]  472 	ld	(hl),#0x00
                            473 ;src/entities/messages.c:104: active_messages--;
   3310 21 D0 63      [10]  474 	ld	hl, #_active_messages+0
   3313 35            [11]  475 	dec	(hl)
   3314                     476 00109$:
                            477 ;src/entities/messages.c:96: for (i=0;i<MAX_MESSAGES;i++){
   3314 21 22 00      [10]  478 	ld	hl,#0x0022
   3317 19            [11]  479 	add	hl,de
   3318 EB            [ 4]  480 	ex	de,hl
   3319 DD 34 F3      [23]  481 	inc	-13 (ix)
   331C DD 7E F3      [19]  482 	ld	a,-13 (ix)
   331F D6 0A         [ 7]  483 	sub	a, #0x0A
   3321 DA 1C 32      [10]  484 	jp	C,00108$
   3324                     485 00110$:
   3324 DD F9         [10]  486 	ld	sp, ix
   3326 DD E1         [14]  487 	pop	ix
   3328 C9            [10]  488 	ret
                            489 	.area _CODE
                            490 	.area _INITIALIZER
                            491 	.area _CABS (ABS)
