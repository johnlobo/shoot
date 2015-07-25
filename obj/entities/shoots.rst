                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:50 2015
                              5 ;--------------------------------------------------------
                              6 	.module shoots
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_explosion
                             13 	.globl _get_user_max_shoots
                             14 	.globl _check_collision_enemies
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_drawSprite
                             17 	.globl _active_shoots
                             18 	.globl _shoots
                             19 	.globl _init_shoots
                             20 	.globl _create_shoot
                             21 	.globl _update_shoots
                             22 	.globl _draw_shoots
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   5849                      30 _shoots::
   5849                      31 	.ds 160
   58E9                      32 _active_shoots::
   58E9                      33 	.ds 1
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/entities/shoots.c:13: void init_shoots(){
                             59 ;	---------------------------------
                             60 ; Function init_shoots
                             61 ; ---------------------------------
   313A                      62 _init_shoots::
                             63 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   313A 16 00         [ 7]   64 	ld	d,#0x00
   313C                      65 00102$:
                             66 ;src/entities/shoots.c:16: shoots[k].active=0;
   313C 6A            [ 4]   67 	ld	l,d
   313D 26 00         [ 7]   68 	ld	h,#0x00
   313F 29            [11]   69 	add	hl, hl
   3140 29            [11]   70 	add	hl, hl
   3141 29            [11]   71 	add	hl, hl
   3142 29            [11]   72 	add	hl, hl
   3143 3E 49         [ 7]   73 	ld	a,#<(_shoots)
   3145 85            [ 4]   74 	add	a, l
   3146 4F            [ 4]   75 	ld	c,a
   3147 3E 58         [ 7]   76 	ld	a,#>(_shoots)
   3149 8C            [ 4]   77 	adc	a, h
   314A 47            [ 4]   78 	ld	b,a
   314B 21 08 00      [10]   79 	ld	hl,#0x0008
   314E 09            [11]   80 	add	hl,bc
   314F 36 00         [10]   81 	ld	(hl),#0x00
                             82 ;src/entities/shoots.c:17: shoots[k].x=0;
   3151 21 04 00      [10]   83 	ld	hl,#0x0004
   3154 09            [11]   84 	add	hl,bc
   3155 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:18: shoots[k].y=0;
   3157 21 05 00      [10]   87 	ld	hl,#0x0005
   315A 09            [11]   88 	add	hl,bc
   315B 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:19: shoots[k].w=0;
   315D 21 06 00      [10]   91 	ld	hl,#0x0006
   3160 09            [11]   92 	add	hl,bc
   3161 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:20: shoots[k].h=0;
   3163 21 07 00      [10]   95 	ld	hl,#0x0007
   3166 09            [11]   96 	add	hl,bc
   3167 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:21: shoots[k].frame=0;
   3169 21 0A 00      [10]   99 	ld	hl,#0x000A
   316C 09            [11]  100 	add	hl,bc
   316D 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:22: shoots[k].lastmoved=0;
   316F 21 0C 00      [10]  103 	ld	hl,#0x000C
   3172 09            [11]  104 	add	hl,bc
   3173 AF            [ 4]  105 	xor	a, a
   3174 77            [ 7]  106 	ld	(hl), a
   3175 23            [ 6]  107 	inc	hl
   3176 77            [ 7]  108 	ld	(hl), a
   3177 23            [ 6]  109 	inc	hl
   3178 AF            [ 4]  110 	xor	a, a
   3179 77            [ 7]  111 	ld	(hl), a
   317A 23            [ 6]  112 	inc	hl
   317B 77            [ 7]  113 	ld	(hl), a
                            114 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   317C 14            [ 4]  115 	inc	d
   317D 7A            [ 4]  116 	ld	a,d
   317E D6 0A         [ 7]  117 	sub	a, #0x0A
   3180 38 BA         [12]  118 	jr	C,00102$
                            119 ;src/entities/shoots.c:24: active_shoots=0;
   3182 21 E9 58      [10]  120 	ld	hl,#_active_shoots + 0
   3185 36 00         [10]  121 	ld	(hl), #0x00
   3187 C9            [10]  122 	ret
                            123 ;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
                            124 ;	---------------------------------
                            125 ; Function create_shoot
                            126 ; ---------------------------------
   3188                     127 _create_shoot::
   3188 DD E5         [15]  128 	push	ix
   318A DD 21 00 00   [14]  129 	ld	ix,#0
   318E DD 39         [15]  130 	add	ix,sp
   3190 21 F4 FF      [10]  131 	ld	hl,#-12
   3193 39            [11]  132 	add	hl,sp
   3194 F9            [ 6]  133 	ld	sp,hl
                            134 ;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
   3195 CD 07 35      [17]  135 	call	_get_user_max_shoots
   3198 55            [ 4]  136 	ld	d,l
   3199 3A E9 58      [13]  137 	ld	a,(#_active_shoots + 0)
   319C 92            [ 4]  138 	sub	a, d
   319D D2 AF 32      [10]  139 	jp	NC,00109$
                            140 ;src/entities/shoots.c:34: while (shoots[k].active){
   31A0 01 49 58      [10]  141 	ld	bc,#_shoots+0
   31A3 16 00         [ 7]  142 	ld	d,#0x00
   31A5                     143 00101$:
   31A5 6A            [ 4]  144 	ld	l,d
   31A6 26 00         [ 7]  145 	ld	h,#0x00
   31A8 29            [11]  146 	add	hl, hl
   31A9 29            [11]  147 	add	hl, hl
   31AA 29            [11]  148 	add	hl, hl
   31AB 29            [11]  149 	add	hl, hl
   31AC 09            [11]  150 	add	hl,bc
   31AD DD 75 FE      [19]  151 	ld	-2 (ix),l
   31B0 DD 74 FF      [19]  152 	ld	-1 (ix),h
   31B3 DD 7E FE      [19]  153 	ld	a,-2 (ix)
   31B6 C6 08         [ 7]  154 	add	a, #0x08
   31B8 6F            [ 4]  155 	ld	l,a
   31B9 DD 7E FF      [19]  156 	ld	a,-1 (ix)
   31BC CE 00         [ 7]  157 	adc	a, #0x00
   31BE 67            [ 4]  158 	ld	h,a
   31BF 7E            [ 7]  159 	ld	a,(hl)
   31C0 B7            [ 4]  160 	or	a, a
   31C1 28 03         [12]  161 	jr	Z,00103$
                            162 ;src/entities/shoots.c:35: k++;
   31C3 14            [ 4]  163 	inc	d
   31C4 18 DF         [12]  164 	jr	00101$
   31C6                     165 00103$:
                            166 ;src/entities/shoots.c:37: shoots[k].active=1;
   31C6 36 01         [10]  167 	ld	(hl),#0x01
                            168 ;src/entities/shoots.c:38: shoots[k].frame=0;
   31C8 DD 7E FE      [19]  169 	ld	a,-2 (ix)
   31CB C6 0A         [ 7]  170 	add	a, #0x0A
   31CD 6F            [ 4]  171 	ld	l,a
   31CE DD 7E FF      [19]  172 	ld	a,-1 (ix)
   31D1 CE 00         [ 7]  173 	adc	a, #0x00
   31D3 67            [ 4]  174 	ld	h,a
   31D4 36 00         [10]  175 	ld	(hl),#0x00
                            176 ;src/entities/shoots.c:42: shoots[k].x=x;
   31D6 DD 7E FE      [19]  177 	ld	a,-2 (ix)
   31D9 C6 04         [ 7]  178 	add	a, #0x04
   31DB DD 77 FC      [19]  179 	ld	-4 (ix),a
   31DE DD 7E FF      [19]  180 	ld	a,-1 (ix)
   31E1 CE 00         [ 7]  181 	adc	a, #0x00
   31E3 DD 77 FD      [19]  182 	ld	-3 (ix),a
                            183 ;src/entities/shoots.c:43: shoots[k].y=y;
   31E6 DD 7E FE      [19]  184 	ld	a,-2 (ix)
   31E9 C6 05         [ 7]  185 	add	a, #0x05
   31EB DD 77 FA      [19]  186 	ld	-6 (ix),a
   31EE DD 7E FF      [19]  187 	ld	a,-1 (ix)
   31F1 CE 00         [ 7]  188 	adc	a, #0x00
   31F3 DD 77 FB      [19]  189 	ld	-5 (ix),a
                            190 ;src/entities/shoots.c:44: shoots[k].w=1;
   31F6 DD 7E FE      [19]  191 	ld	a,-2 (ix)
   31F9 C6 06         [ 7]  192 	add	a, #0x06
   31FB DD 77 F8      [19]  193 	ld	-8 (ix),a
   31FE DD 7E FF      [19]  194 	ld	a,-1 (ix)
   3201 CE 00         [ 7]  195 	adc	a, #0x00
   3203 DD 77 F9      [19]  196 	ld	-7 (ix),a
                            197 ;src/entities/shoots.c:45: shoots[k].h=4;
   3206 DD 7E FE      [19]  198 	ld	a,-2 (ix)
   3209 C6 07         [ 7]  199 	add	a, #0x07
   320B DD 77 F6      [19]  200 	ld	-10 (ix),a
   320E DD 7E FF      [19]  201 	ld	a,-1 (ix)
   3211 CE 00         [ 7]  202 	adc	a, #0x00
   3213 DD 77 F7      [19]  203 	ld	-9 (ix),a
                            204 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   3216 DD 7E FE      [19]  205 	ld	a,-2 (ix)
   3219 C6 09         [ 7]  206 	add	a, #0x09
   321B DD 77 F4      [19]  207 	ld	-12 (ix),a
   321E DD 7E FF      [19]  208 	ld	a,-1 (ix)
   3221 CE 00         [ 7]  209 	adc	a, #0x00
   3223 DD 77 F5      [19]  210 	ld	-11 (ix),a
                            211 ;src/entities/shoots.c:39: switch (type){
   3226 DD 7E 06      [19]  212 	ld	a,6 (ix)
   3229 3D            [ 4]  213 	dec	a
   322A 20 35         [12]  214 	jr	NZ,00105$
                            215 ;src/entities/shoots.c:42: shoots[k].x=x;
   322C DD 6E FC      [19]  216 	ld	l,-4 (ix)
   322F DD 66 FD      [19]  217 	ld	h,-3 (ix)
   3232 DD 7E 04      [19]  218 	ld	a,4 (ix)
   3235 77            [ 7]  219 	ld	(hl),a
                            220 ;src/entities/shoots.c:43: shoots[k].y=y;
   3236 DD 6E FA      [19]  221 	ld	l,-6 (ix)
   3239 DD 66 FB      [19]  222 	ld	h,-5 (ix)
   323C DD 7E 05      [19]  223 	ld	a,5 (ix)
   323F 77            [ 7]  224 	ld	(hl),a
                            225 ;src/entities/shoots.c:44: shoots[k].w=1;
   3240 DD 6E F8      [19]  226 	ld	l,-8 (ix)
   3243 DD 66 F9      [19]  227 	ld	h,-7 (ix)
   3246 36 01         [10]  228 	ld	(hl),#0x01
                            229 ;src/entities/shoots.c:45: shoots[k].h=4;
   3248 DD 6E F6      [19]  230 	ld	l,-10 (ix)
   324B DD 66 F7      [19]  231 	ld	h,-9 (ix)
   324E 36 04         [10]  232 	ld	(hl),#0x04
                            233 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   3250 E1            [10]  234 	pop	hl
   3251 E5            [11]  235 	push	hl
   3252 36 01         [10]  236 	ld	(hl),#0x01
                            237 ;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
   3254 DD 6E FE      [19]  238 	ld	l,-2 (ix)
   3257 DD 66 FF      [19]  239 	ld	h,-1 (ix)
   325A 36 77         [10]  240 	ld	(hl),#<(_bullet02_0)
   325C 23            [ 6]  241 	inc	hl
   325D 36 3F         [10]  242 	ld	(hl),#>(_bullet02_0)
                            243 ;src/entities/shoots.c:48: break;
   325F 18 4A         [12]  244 	jr	00106$
                            245 ;src/entities/shoots.c:49: default:
   3261                     246 00105$:
                            247 ;src/entities/shoots.c:50: shoots[k].x=x;
   3261 DD 6E FC      [19]  248 	ld	l,-4 (ix)
   3264 DD 66 FD      [19]  249 	ld	h,-3 (ix)
   3267 DD 7E 04      [19]  250 	ld	a,4 (ix)
   326A 77            [ 7]  251 	ld	(hl),a
                            252 ;src/entities/shoots.c:51: shoots[k].y=y;
   326B DD 6E FA      [19]  253 	ld	l,-6 (ix)
   326E DD 66 FB      [19]  254 	ld	h,-5 (ix)
   3271 DD 7E 05      [19]  255 	ld	a,5 (ix)
   3274 77            [ 7]  256 	ld	(hl),a
                            257 ;src/entities/shoots.c:52: shoots[k].w=1;
   3275 DD 6E F8      [19]  258 	ld	l,-8 (ix)
   3278 DD 66 F9      [19]  259 	ld	h,-7 (ix)
   327B 36 01         [10]  260 	ld	(hl),#0x01
                            261 ;src/entities/shoots.c:53: shoots[k].h=8;
   327D DD 6E F6      [19]  262 	ld	l,-10 (ix)
   3280 DD 66 F7      [19]  263 	ld	h,-9 (ix)
   3283 36 08         [10]  264 	ld	(hl),#0x08
                            265 ;src/entities/shoots.c:54: shoots[k].num_frames=2;
   3285 E1            [10]  266 	pop	hl
   3286 E5            [11]  267 	push	hl
   3287 36 02         [10]  268 	ld	(hl),#0x02
                            269 ;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
   3289 DD 6E FE      [19]  270 	ld	l,-2 (ix)
   328C DD 66 FF      [19]  271 	ld	h,-1 (ix)
   328F 36 67         [10]  272 	ld	(hl),#<(_bullet01_0)
   3291 23            [ 6]  273 	inc	hl
   3292 36 3F         [10]  274 	ld	(hl),#>(_bullet01_0)
                            275 ;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
   3294 DD 7E FE      [19]  276 	ld	a,-2 (ix)
   3297 C6 02         [ 7]  277 	add	a, #0x02
   3299 DD 77 F4      [19]  278 	ld	-12 (ix),a
   329C DD 7E FF      [19]  279 	ld	a,-1 (ix)
   329F CE 00         [ 7]  280 	adc	a, #0x00
   32A1 DD 77 F5      [19]  281 	ld	-11 (ix),a
   32A4 E1            [10]  282 	pop	hl
   32A5 E5            [11]  283 	push	hl
   32A6 36 6F         [10]  284 	ld	(hl),#<(_bullet01_1)
   32A8 23            [ 6]  285 	inc	hl
   32A9 36 3F         [10]  286 	ld	(hl),#>(_bullet01_1)
                            287 ;src/entities/shoots.c:58: }
   32AB                     288 00106$:
                            289 ;src/entities/shoots.c:59: active_shoots++;
   32AB 21 E9 58      [10]  290 	ld	hl, #_active_shoots+0
   32AE 34            [11]  291 	inc	(hl)
   32AF                     292 00109$:
   32AF DD F9         [10]  293 	ld	sp, ix
   32B1 DD E1         [14]  294 	pop	ix
   32B3 C9            [10]  295 	ret
                            296 ;src/entities/shoots.c:68: void update_shoots(){
                            297 ;	---------------------------------
                            298 ; Function update_shoots
                            299 ; ---------------------------------
   32B4                     300 _update_shoots::
   32B4 DD E5         [15]  301 	push	ix
   32B6 DD 21 00 00   [14]  302 	ld	ix,#0
   32BA DD 39         [15]  303 	add	ix,sp
   32BC 21 F7 FF      [10]  304 	ld	hl,#-9
   32BF 39            [11]  305 	add	hl,sp
   32C0 F9            [ 6]  306 	ld	sp,hl
                            307 ;src/entities/shoots.c:72: if (active_shoots>0){
   32C1 3A E9 58      [13]  308 	ld	a,(#_active_shoots + 0)
   32C4 B7            [ 4]  309 	or	a, a
   32C5 CA C4 33      [10]  310 	jp	Z,00116$
                            311 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   32C8 0E 00         [ 7]  312 	ld	c,#0x00
   32CA                     313 00114$:
                            314 ;src/entities/shoots.c:74: if (shoots[i].active){
   32CA 69            [ 4]  315 	ld	l,c
   32CB 26 00         [ 7]  316 	ld	h,#0x00
   32CD 29            [11]  317 	add	hl, hl
   32CE 29            [11]  318 	add	hl, hl
   32CF 29            [11]  319 	add	hl, hl
   32D0 29            [11]  320 	add	hl, hl
   32D1 3E 49         [ 7]  321 	ld	a,#<(_shoots)
   32D3 85            [ 4]  322 	add	a, l
   32D4 DD 77 F9      [19]  323 	ld	-7 (ix),a
   32D7 3E 58         [ 7]  324 	ld	a,#>(_shoots)
   32D9 8C            [ 4]  325 	adc	a, h
   32DA DD 77 FA      [19]  326 	ld	-6 (ix),a
   32DD DD 7E F9      [19]  327 	ld	a,-7 (ix)
   32E0 C6 08         [ 7]  328 	add	a, #0x08
   32E2 DD 77 FD      [19]  329 	ld	-3 (ix),a
   32E5 DD 7E FA      [19]  330 	ld	a,-6 (ix)
   32E8 CE 00         [ 7]  331 	adc	a, #0x00
   32EA DD 77 FE      [19]  332 	ld	-2 (ix),a
   32ED DD 6E FD      [19]  333 	ld	l,-3 (ix)
   32F0 DD 66 FE      [19]  334 	ld	h,-2 (ix)
   32F3 7E            [ 7]  335 	ld	a,(hl)
   32F4 B7            [ 4]  336 	or	a, a
   32F5 CA BD 33      [10]  337 	jp	Z,00115$
                            338 ;src/entities/shoots.c:75: shoots[i].y-=SHOOT_JUMP;
   32F8 DD 7E F9      [19]  339 	ld	a,-7 (ix)
   32FB C6 05         [ 7]  340 	add	a, #0x05
   32FD 5F            [ 4]  341 	ld	e,a
   32FE DD 7E FA      [19]  342 	ld	a,-6 (ix)
   3301 CE 00         [ 7]  343 	adc	a, #0x00
   3303 57            [ 4]  344 	ld	d,a
   3304 1A            [ 7]  345 	ld	a,(de)
   3305 C6 F6         [ 7]  346 	add	a,#0xF6
   3307 47            [ 4]  347 	ld	b,a
   3308 12            [ 7]  348 	ld	(de),a
                            349 ;src/entities/shoots.c:76: if (shoots[i].y<200){
   3309 1A            [ 7]  350 	ld	a,(de)
   330A DD 77 FB      [19]  351 	ld	-5 (ix),a
   330D 78            [ 4]  352 	ld	a,b
   330E D6 C8         [ 7]  353 	sub	a, #0xC8
   3310 D2 B1 33      [10]  354 	jp	NC,00107$
                            355 ;src/entities/shoots.c:77: if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
   3313 E5            [11]  356 	push	hl
   3314 DD 6E F9      [19]  357 	ld	l,-7 (ix)
   3317 DD 66 FA      [19]  358 	ld	h,-6 (ix)
   331A E5            [11]  359 	push	hl
   331B FD E1         [14]  360 	pop	iy
   331D E1            [10]  361 	pop	hl
   331E FD 7E 07      [19]  362 	ld	a,7 (iy)
   3321 DD 77 FC      [19]  363 	ld	-4 (ix),a
   3324 DD 6E F9      [19]  364 	ld	l,-7 (ix)
   3327 DD 66 FA      [19]  365 	ld	h,-6 (ix)
   332A C5            [11]  366 	push	bc
   332B 01 06 00      [10]  367 	ld	bc, #0x0006
   332E 09            [11]  368 	add	hl, bc
   332F C1            [10]  369 	pop	bc
   3330 46            [ 7]  370 	ld	b,(hl)
   3331 DD 7E F9      [19]  371 	ld	a,-7 (ix)
   3334 C6 04         [ 7]  372 	add	a, #0x04
   3336 DD 77 F7      [19]  373 	ld	-9 (ix),a
   3339 DD 7E FA      [19]  374 	ld	a,-6 (ix)
   333C CE 00         [ 7]  375 	adc	a, #0x00
   333E DD 77 F8      [19]  376 	ld	-8 (ix),a
   3341 E1            [10]  377 	pop	hl
   3342 E5            [11]  378 	push	hl
   3343 7E            [ 7]  379 	ld	a,(hl)
   3344 DD 77 FF      [19]  380 	ld	-1 (ix),a
   3347 C5            [11]  381 	push	bc
   3348 D5            [11]  382 	push	de
   3349 DD 7E FC      [19]  383 	ld	a,-4 (ix)
   334C F5            [11]  384 	push	af
   334D 33            [ 6]  385 	inc	sp
   334E C5            [11]  386 	push	bc
   334F 33            [ 6]  387 	inc	sp
   3350 DD 66 FB      [19]  388 	ld	h,-5 (ix)
   3353 DD 6E FF      [19]  389 	ld	l,-1 (ix)
   3356 E5            [11]  390 	push	hl
   3357 CD 3E 23      [17]  391 	call	_check_collision_enemies
   335A F1            [10]  392 	pop	af
   335B F1            [10]  393 	pop	af
   335C 7D            [ 4]  394 	ld	a,l
   335D D1            [10]  395 	pop	de
   335E C1            [10]  396 	pop	bc
   335F B7            [ 4]  397 	or	a, a
   3360 28 21         [12]  398 	jr	Z,00104$
                            399 ;src/entities/shoots.c:78: create_explosion(shoots[i].x,shoots[i].y,0);
   3362 1A            [ 7]  400 	ld	a,(de)
   3363 57            [ 4]  401 	ld	d,a
   3364 E1            [10]  402 	pop	hl
   3365 E5            [11]  403 	push	hl
   3366 46            [ 7]  404 	ld	b,(hl)
   3367 C5            [11]  405 	push	bc
   3368 AF            [ 4]  406 	xor	a, a
   3369 F5            [11]  407 	push	af
   336A 33            [ 6]  408 	inc	sp
   336B D5            [11]  409 	push	de
   336C 33            [ 6]  410 	inc	sp
   336D C5            [11]  411 	push	bc
   336E 33            [ 6]  412 	inc	sp
   336F CD 7D 2F      [17]  413 	call	_create_explosion
   3372 F1            [10]  414 	pop	af
   3373 33            [ 6]  415 	inc	sp
   3374 C1            [10]  416 	pop	bc
                            417 ;src/entities/shoots.c:79: shoots[i].active=0;
   3375 DD 6E FD      [19]  418 	ld	l,-3 (ix)
   3378 DD 66 FE      [19]  419 	ld	h,-2 (ix)
   337B 36 00         [10]  420 	ld	(hl),#0x00
                            421 ;src/entities/shoots.c:80: active_shoots--;
   337D 21 E9 58      [10]  422 	ld	hl, #_active_shoots+0
   3380 35            [11]  423 	dec	(hl)
   3381 18 3A         [12]  424 	jr	00115$
   3383                     425 00104$:
                            426 ;src/entities/shoots.c:82: shoots[i].frame++;
   3383 DD 7E F9      [19]  427 	ld	a,-7 (ix)
   3386 C6 0A         [ 7]  428 	add	a, #0x0A
   3388 5F            [ 4]  429 	ld	e,a
   3389 DD 7E FA      [19]  430 	ld	a,-6 (ix)
   338C CE 00         [ 7]  431 	adc	a, #0x00
   338E 57            [ 4]  432 	ld	d,a
   338F 1A            [ 7]  433 	ld	a,(de)
   3390 3C            [ 4]  434 	inc	a
   3391 DD 77 FF      [19]  435 	ld	-1 (ix), a
   3394 12            [ 7]  436 	ld	(de),a
                            437 ;src/entities/shoots.c:83: if (shoots[i].frame==shoots[i].num_frames)
   3395 DD 6E F9      [19]  438 	ld	l,-7 (ix)
   3398 DD 66 FA      [19]  439 	ld	h,-6 (ix)
   339B C5            [11]  440 	push	bc
   339C 01 09 00      [10]  441 	ld	bc, #0x0009
   339F 09            [11]  442 	add	hl, bc
   33A0 C1            [10]  443 	pop	bc
   33A1 7E            [ 7]  444 	ld	a,(hl)
   33A2 DD 77 F7      [19]  445 	ld	-9 (ix),a
   33A5 DD 7E FF      [19]  446 	ld	a,-1 (ix)
   33A8 DD 96 F7      [19]  447 	sub	a, -9 (ix)
   33AB 20 10         [12]  448 	jr	NZ,00115$
                            449 ;src/entities/shoots.c:84: shoots[i].frame=0;
   33AD AF            [ 4]  450 	xor	a, a
   33AE 12            [ 7]  451 	ld	(de),a
   33AF 18 0C         [12]  452 	jr	00115$
   33B1                     453 00107$:
                            454 ;src/entities/shoots.c:88: shoots[i].active=0;
   33B1 DD 6E FD      [19]  455 	ld	l,-3 (ix)
   33B4 DD 66 FE      [19]  456 	ld	h,-2 (ix)
   33B7 36 00         [10]  457 	ld	(hl),#0x00
                            458 ;src/entities/shoots.c:89: active_shoots--;
   33B9 21 E9 58      [10]  459 	ld	hl, #_active_shoots+0
   33BC 35            [11]  460 	dec	(hl)
   33BD                     461 00115$:
                            462 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   33BD 0C            [ 4]  463 	inc	c
   33BE 79            [ 4]  464 	ld	a,c
   33BF D6 0A         [ 7]  465 	sub	a, #0x0A
   33C1 DA CA 32      [10]  466 	jp	C,00114$
   33C4                     467 00116$:
   33C4 DD F9         [10]  468 	ld	sp, ix
   33C6 DD E1         [14]  469 	pop	ix
   33C8 C9            [10]  470 	ret
                            471 ;src/entities/shoots.c:101: void draw_shoots(u8* screen){
                            472 ;	---------------------------------
                            473 ; Function draw_shoots
                            474 ; ---------------------------------
   33C9                     475 _draw_shoots::
   33C9 DD E5         [15]  476 	push	ix
   33CB DD 21 00 00   [14]  477 	ld	ix,#0
   33CF DD 39         [15]  478 	add	ix,sp
   33D1 F5            [11]  479 	push	af
   33D2 F5            [11]  480 	push	af
   33D3 3B            [ 6]  481 	dec	sp
                            482 ;src/entities/shoots.c:106: if (active_shoots>0){
   33D4 3A E9 58      [13]  483 	ld	a,(#_active_shoots + 0)
   33D7 B7            [ 4]  484 	or	a, a
   33D8 CA 63 34      [10]  485 	jp	Z,00108$
                            486 ;src/entities/shoots.c:107: for (k=0;k<MAX_SHOOTS;k++){
   33DB 0E 00         [ 7]  487 	ld	c,#0x00
   33DD                     488 00106$:
                            489 ;src/entities/shoots.c:108: if (shoots[k].active){
   33DD 69            [ 4]  490 	ld	l,c
   33DE 26 00         [ 7]  491 	ld	h,#0x00
   33E0 29            [11]  492 	add	hl, hl
   33E1 29            [11]  493 	add	hl, hl
   33E2 29            [11]  494 	add	hl, hl
   33E3 29            [11]  495 	add	hl, hl
   33E4 3E 49         [ 7]  496 	ld	a,#<(_shoots)
   33E6 85            [ 4]  497 	add	a, l
   33E7 DD 77 FB      [19]  498 	ld	-5 (ix),a
   33EA 3E 58         [ 7]  499 	ld	a,#>(_shoots)
   33EC 8C            [ 4]  500 	adc	a, h
   33ED DD 77 FC      [19]  501 	ld	-4 (ix),a
   33F0 E1            [10]  502 	pop	hl
   33F1 E5            [11]  503 	push	hl
   33F2 11 08 00      [10]  504 	ld	de, #0x0008
   33F5 19            [11]  505 	add	hl, de
   33F6 7E            [ 7]  506 	ld	a,(hl)
   33F7 B7            [ 4]  507 	or	a, a
   33F8 28 62         [12]  508 	jr	Z,00107$
                            509 ;src/entities/shoots.c:109: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   33FA E1            [10]  510 	pop	hl
   33FB E5            [11]  511 	push	hl
   33FC 11 05 00      [10]  512 	ld	de, #0x0005
   33FF 19            [11]  513 	add	hl, de
   3400 56            [ 7]  514 	ld	d,(hl)
   3401 E1            [10]  515 	pop	hl
   3402 E5            [11]  516 	push	hl
   3403 23            [ 6]  517 	inc	hl
   3404 23            [ 6]  518 	inc	hl
   3405 23            [ 6]  519 	inc	hl
   3406 23            [ 6]  520 	inc	hl
   3407 5E            [ 7]  521 	ld	e,(hl)
   3408 E5            [11]  522 	push	hl
   3409 DD 6E 04      [19]  523 	ld	l,4 (ix)
   340C DD 66 05      [19]  524 	ld	h,5 (ix)
   340F E5            [11]  525 	push	hl
   3410 FD E1         [14]  526 	pop	iy
   3412 E1            [10]  527 	pop	hl
   3413 C5            [11]  528 	push	bc
   3414 D5            [11]  529 	push	de
   3415 FD E5         [15]  530 	push	iy
   3417 CD 5C 50      [17]  531 	call	_cpct_getScreenPtr
   341A F1            [10]  532 	pop	af
   341B F1            [10]  533 	pop	af
   341C C1            [10]  534 	pop	bc
   341D EB            [ 4]  535 	ex	de,hl
                            536 ;src/entities/shoots.c:110: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   341E FD E1         [14]  537 	pop	iy
   3420 FD E5         [15]  538 	push	iy
   3422 FD 7E 07      [19]  539 	ld	a,7 (iy)
   3425 DD 77 FF      [19]  540 	ld	-1 (ix),a
   3428 E1            [10]  541 	pop	hl
   3429 E5            [11]  542 	push	hl
   342A C5            [11]  543 	push	bc
   342B 01 06 00      [10]  544 	ld	bc, #0x0006
   342E 09            [11]  545 	add	hl, bc
   342F C1            [10]  546 	pop	bc
   3430 46            [ 7]  547 	ld	b,(hl)
   3431 DD 73 FD      [19]  548 	ld	-3 (ix),e
   3434 DD 72 FE      [19]  549 	ld	-2 (ix),d
   3437 E1            [10]  550 	pop	hl
   3438 E5            [11]  551 	push	hl
   3439 11 0A 00      [10]  552 	ld	de, #0x000A
   343C 19            [11]  553 	add	hl, de
   343D 7E            [ 7]  554 	ld	a,(hl)
   343E 87            [ 4]  555 	add	a, a
   343F 5F            [ 4]  556 	ld	e,a
   3440 E1            [10]  557 	pop	hl
   3441 E5            [11]  558 	push	hl
   3442 16 00         [ 7]  559 	ld	d,#0x00
   3444 19            [11]  560 	add	hl, de
   3445 5E            [ 7]  561 	ld	e,(hl)
   3446 23            [ 6]  562 	inc	hl
   3447 56            [ 7]  563 	ld	d,(hl)
   3448 C5            [11]  564 	push	bc
   3449 DD 7E FF      [19]  565 	ld	a,-1 (ix)
   344C F5            [11]  566 	push	af
   344D 33            [ 6]  567 	inc	sp
   344E C5            [11]  568 	push	bc
   344F 33            [ 6]  569 	inc	sp
   3450 DD 6E FD      [19]  570 	ld	l,-3 (ix)
   3453 DD 66 FE      [19]  571 	ld	h,-2 (ix)
   3456 E5            [11]  572 	push	hl
   3457 D5            [11]  573 	push	de
   3458 CD 46 4E      [17]  574 	call	_cpct_drawSprite
   345B C1            [10]  575 	pop	bc
   345C                     576 00107$:
                            577 ;src/entities/shoots.c:107: for (k=0;k<MAX_SHOOTS;k++){
   345C 0C            [ 4]  578 	inc	c
   345D 79            [ 4]  579 	ld	a,c
   345E D6 0A         [ 7]  580 	sub	a, #0x0A
   3460 DA DD 33      [10]  581 	jp	C,00106$
   3463                     582 00108$:
   3463 DD F9         [10]  583 	ld	sp, ix
   3465 DD E1         [14]  584 	pop	ix
   3467 C9            [10]  585 	ret
                            586 	.area _CODE
                            587 	.area _INITIALIZER
                            588 	.area _CABS (ABS)
