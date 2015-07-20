                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 03:16:35 2015
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
                             15 	.globl _active_shoots
                             16 	.globl _shoots
                             17 	.globl _init_shoots
                             18 	.globl _create_shoot
                             19 	.globl _update_shoots
                             20 	.globl _draw_shoots
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   54FE                      28 _shoots::
   54FE                      29 	.ds 160
   559E                      30 _active_shoots::
   559E                      31 	.ds 1
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/entities/shoots.c:13: void init_shoots(){
                             57 ;	---------------------------------
                             58 ; Function init_shoots
                             59 ; ---------------------------------
   2FE2                      60 _init_shoots::
                             61 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   2FE2 16 00         [ 7]   62 	ld	d,#0x00
   2FE4                      63 00102$:
                             64 ;src/entities/shoots.c:16: shoots[k].active=0;
   2FE4 6A            [ 4]   65 	ld	l,d
   2FE5 26 00         [ 7]   66 	ld	h,#0x00
   2FE7 29            [11]   67 	add	hl, hl
   2FE8 29            [11]   68 	add	hl, hl
   2FE9 29            [11]   69 	add	hl, hl
   2FEA 29            [11]   70 	add	hl, hl
   2FEB 3E FE         [ 7]   71 	ld	a,#<(_shoots)
   2FED 85            [ 4]   72 	add	a, l
   2FEE 4F            [ 4]   73 	ld	c,a
   2FEF 3E 54         [ 7]   74 	ld	a,#>(_shoots)
   2FF1 8C            [ 4]   75 	adc	a, h
   2FF2 47            [ 4]   76 	ld	b,a
   2FF3 21 08 00      [10]   77 	ld	hl,#0x0008
   2FF6 09            [11]   78 	add	hl,bc
   2FF7 36 00         [10]   79 	ld	(hl),#0x00
                             80 ;src/entities/shoots.c:17: shoots[k].x=0;
   2FF9 21 04 00      [10]   81 	ld	hl,#0x0004
   2FFC 09            [11]   82 	add	hl,bc
   2FFD 36 00         [10]   83 	ld	(hl),#0x00
                             84 ;src/entities/shoots.c:18: shoots[k].y=0;
   2FFF 21 05 00      [10]   85 	ld	hl,#0x0005
   3002 09            [11]   86 	add	hl,bc
   3003 36 00         [10]   87 	ld	(hl),#0x00
                             88 ;src/entities/shoots.c:19: shoots[k].w=0;
   3005 21 06 00      [10]   89 	ld	hl,#0x0006
   3008 09            [11]   90 	add	hl,bc
   3009 36 00         [10]   91 	ld	(hl),#0x00
                             92 ;src/entities/shoots.c:20: shoots[k].h=0;
   300B 21 07 00      [10]   93 	ld	hl,#0x0007
   300E 09            [11]   94 	add	hl,bc
   300F 36 00         [10]   95 	ld	(hl),#0x00
                             96 ;src/entities/shoots.c:21: shoots[k].frame=0;
   3011 21 0A 00      [10]   97 	ld	hl,#0x000A
   3014 09            [11]   98 	add	hl,bc
   3015 36 00         [10]   99 	ld	(hl),#0x00
                            100 ;src/entities/shoots.c:22: shoots[k].lastmoved=0;
   3017 21 0C 00      [10]  101 	ld	hl,#0x000C
   301A 09            [11]  102 	add	hl,bc
   301B AF            [ 4]  103 	xor	a, a
   301C 77            [ 7]  104 	ld	(hl), a
   301D 23            [ 6]  105 	inc	hl
   301E 77            [ 7]  106 	ld	(hl), a
   301F 23            [ 6]  107 	inc	hl
   3020 AF            [ 4]  108 	xor	a, a
   3021 77            [ 7]  109 	ld	(hl), a
   3022 23            [ 6]  110 	inc	hl
   3023 77            [ 7]  111 	ld	(hl), a
                            112 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   3024 14            [ 4]  113 	inc	d
   3025 7A            [ 4]  114 	ld	a,d
   3026 D6 0A         [ 7]  115 	sub	a, #0x0A
   3028 38 BA         [12]  116 	jr	C,00102$
                            117 ;src/entities/shoots.c:24: active_shoots=0;
   302A 21 9E 55      [10]  118 	ld	hl,#_active_shoots + 0
   302D 36 00         [10]  119 	ld	(hl), #0x00
   302F C9            [10]  120 	ret
                            121 ;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
                            122 ;	---------------------------------
                            123 ; Function create_shoot
                            124 ; ---------------------------------
   3030                     125 _create_shoot::
   3030 DD E5         [15]  126 	push	ix
   3032 DD 21 00 00   [14]  127 	ld	ix,#0
   3036 DD 39         [15]  128 	add	ix,sp
   3038 21 F4 FF      [10]  129 	ld	hl,#-12
   303B 39            [11]  130 	add	hl,sp
   303C F9            [ 6]  131 	ld	sp,hl
                            132 ;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
   303D CD 1D 33      [17]  133 	call	_get_user_max_shoots
   3040 55            [ 4]  134 	ld	d,l
   3041 FD 21 9E 55   [14]  135 	ld	iy,#_active_shoots
   3045 FD 7E 00      [19]  136 	ld	a,0 (iy)
   3048 92            [ 4]  137 	sub	a, d
   3049 D2 5A 31      [10]  138 	jp	NC,00109$
                            139 ;src/entities/shoots.c:34: while (shoots[k].active){
   304C 01 FE 54      [10]  140 	ld	bc,#_shoots+0
   304F 16 00         [ 7]  141 	ld	d,#0x00
   3051                     142 00101$:
   3051 6A            [ 4]  143 	ld	l,d
   3052 26 00         [ 7]  144 	ld	h,#0x00
   3054 29            [11]  145 	add	hl, hl
   3055 29            [11]  146 	add	hl, hl
   3056 29            [11]  147 	add	hl, hl
   3057 29            [11]  148 	add	hl, hl
   3058 09            [11]  149 	add	hl,bc
   3059 E3            [19]  150 	ex	(sp), hl
   305A DD 7E F4      [19]  151 	ld	a,-12 (ix)
   305D C6 08         [ 7]  152 	add	a, #0x08
   305F 6F            [ 4]  153 	ld	l,a
   3060 DD 7E F5      [19]  154 	ld	a,-11 (ix)
   3063 CE 00         [ 7]  155 	adc	a, #0x00
   3065 67            [ 4]  156 	ld	h,a
   3066 7E            [ 7]  157 	ld	a,(hl)
   3067 B7            [ 4]  158 	or	a, a
   3068 28 03         [12]  159 	jr	Z,00103$
                            160 ;src/entities/shoots.c:35: k++;
   306A 14            [ 4]  161 	inc	d
   306B 18 E4         [12]  162 	jr	00101$
   306D                     163 00103$:
                            164 ;src/entities/shoots.c:37: shoots[k].active=1;
   306D 36 01         [10]  165 	ld	(hl),#0x01
                            166 ;src/entities/shoots.c:38: shoots[k].frame=0;
   306F DD 7E F4      [19]  167 	ld	a,-12 (ix)
   3072 C6 0A         [ 7]  168 	add	a, #0x0A
   3074 6F            [ 4]  169 	ld	l,a
   3075 DD 7E F5      [19]  170 	ld	a,-11 (ix)
   3078 CE 00         [ 7]  171 	adc	a, #0x00
   307A 67            [ 4]  172 	ld	h,a
   307B 36 00         [10]  173 	ld	(hl),#0x00
                            174 ;src/entities/shoots.c:42: shoots[k].x=x;
   307D DD 7E F4      [19]  175 	ld	a,-12 (ix)
   3080 C6 04         [ 7]  176 	add	a, #0x04
   3082 DD 77 FE      [19]  177 	ld	-2 (ix),a
   3085 DD 7E F5      [19]  178 	ld	a,-11 (ix)
   3088 CE 00         [ 7]  179 	adc	a, #0x00
   308A DD 77 FF      [19]  180 	ld	-1 (ix),a
                            181 ;src/entities/shoots.c:43: shoots[k].y=y;
   308D DD 7E F4      [19]  182 	ld	a,-12 (ix)
   3090 C6 05         [ 7]  183 	add	a, #0x05
   3092 DD 77 FC      [19]  184 	ld	-4 (ix),a
   3095 DD 7E F5      [19]  185 	ld	a,-11 (ix)
   3098 CE 00         [ 7]  186 	adc	a, #0x00
   309A DD 77 FD      [19]  187 	ld	-3 (ix),a
                            188 ;src/entities/shoots.c:44: shoots[k].w=1;
   309D DD 7E F4      [19]  189 	ld	a,-12 (ix)
   30A0 C6 06         [ 7]  190 	add	a, #0x06
   30A2 DD 77 FA      [19]  191 	ld	-6 (ix),a
   30A5 DD 7E F5      [19]  192 	ld	a,-11 (ix)
   30A8 CE 00         [ 7]  193 	adc	a, #0x00
   30AA DD 77 FB      [19]  194 	ld	-5 (ix),a
                            195 ;src/entities/shoots.c:45: shoots[k].h=4;
   30AD DD 7E F4      [19]  196 	ld	a,-12 (ix)
   30B0 C6 07         [ 7]  197 	add	a, #0x07
   30B2 DD 77 F8      [19]  198 	ld	-8 (ix),a
   30B5 DD 7E F5      [19]  199 	ld	a,-11 (ix)
   30B8 CE 00         [ 7]  200 	adc	a, #0x00
   30BA DD 77 F9      [19]  201 	ld	-7 (ix),a
                            202 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   30BD DD 7E F4      [19]  203 	ld	a,-12 (ix)
   30C0 C6 09         [ 7]  204 	add	a, #0x09
   30C2 DD 77 F6      [19]  205 	ld	-10 (ix),a
   30C5 DD 7E F5      [19]  206 	ld	a,-11 (ix)
   30C8 CE 00         [ 7]  207 	adc	a, #0x00
   30CA DD 77 F7      [19]  208 	ld	-9 (ix),a
                            209 ;src/entities/shoots.c:39: switch (type){
   30CD DD 7E 06      [19]  210 	ld	a,6 (ix)
   30D0 3D            [ 4]  211 	dec	a
   30D1 20 35         [12]  212 	jr	NZ,00105$
                            213 ;src/entities/shoots.c:42: shoots[k].x=x;
   30D3 DD 6E FE      [19]  214 	ld	l,-2 (ix)
   30D6 DD 66 FF      [19]  215 	ld	h,-1 (ix)
   30D9 DD 7E 04      [19]  216 	ld	a,4 (ix)
   30DC 77            [ 7]  217 	ld	(hl),a
                            218 ;src/entities/shoots.c:43: shoots[k].y=y;
   30DD DD 6E FC      [19]  219 	ld	l,-4 (ix)
   30E0 DD 66 FD      [19]  220 	ld	h,-3 (ix)
   30E3 DD 7E 05      [19]  221 	ld	a,5 (ix)
   30E6 77            [ 7]  222 	ld	(hl),a
                            223 ;src/entities/shoots.c:44: shoots[k].w=1;
   30E7 DD 6E FA      [19]  224 	ld	l,-6 (ix)
   30EA DD 66 FB      [19]  225 	ld	h,-5 (ix)
   30ED 36 01         [10]  226 	ld	(hl),#0x01
                            227 ;src/entities/shoots.c:45: shoots[k].h=4;
   30EF DD 6E F8      [19]  228 	ld	l,-8 (ix)
   30F2 DD 66 F9      [19]  229 	ld	h,-7 (ix)
   30F5 36 04         [10]  230 	ld	(hl),#0x04
                            231 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   30F7 DD 6E F6      [19]  232 	ld	l,-10 (ix)
   30FA DD 66 F7      [19]  233 	ld	h,-9 (ix)
   30FD 36 01         [10]  234 	ld	(hl),#0x01
                            235 ;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
   30FF E1            [10]  236 	pop	hl
   3100 E5            [11]  237 	push	hl
   3101 36 35         [10]  238 	ld	(hl),#<(_bullet02_0)
   3103 23            [ 6]  239 	inc	hl
   3104 36 3D         [10]  240 	ld	(hl),#>(_bullet02_0)
                            241 ;src/entities/shoots.c:48: break;
   3106 18 4E         [12]  242 	jr	00106$
                            243 ;src/entities/shoots.c:49: default:
   3108                     244 00105$:
                            245 ;src/entities/shoots.c:50: shoots[k].x=x;
   3108 DD 6E FE      [19]  246 	ld	l,-2 (ix)
   310B DD 66 FF      [19]  247 	ld	h,-1 (ix)
   310E DD 7E 04      [19]  248 	ld	a,4 (ix)
   3111 77            [ 7]  249 	ld	(hl),a
                            250 ;src/entities/shoots.c:51: shoots[k].y=y;
   3112 DD 6E FC      [19]  251 	ld	l,-4 (ix)
   3115 DD 66 FD      [19]  252 	ld	h,-3 (ix)
   3118 DD 7E 05      [19]  253 	ld	a,5 (ix)
   311B 77            [ 7]  254 	ld	(hl),a
                            255 ;src/entities/shoots.c:52: shoots[k].w=1;
   311C DD 6E FA      [19]  256 	ld	l,-6 (ix)
   311F DD 66 FB      [19]  257 	ld	h,-5 (ix)
   3122 36 01         [10]  258 	ld	(hl),#0x01
                            259 ;src/entities/shoots.c:53: shoots[k].h=8;
   3124 DD 6E F8      [19]  260 	ld	l,-8 (ix)
   3127 DD 66 F9      [19]  261 	ld	h,-7 (ix)
   312A 36 08         [10]  262 	ld	(hl),#0x08
                            263 ;src/entities/shoots.c:54: shoots[k].num_frames=2;
   312C DD 6E F6      [19]  264 	ld	l,-10 (ix)
   312F DD 66 F7      [19]  265 	ld	h,-9 (ix)
   3132 36 02         [10]  266 	ld	(hl),#0x02
                            267 ;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
   3134 E1            [10]  268 	pop	hl
   3135 E5            [11]  269 	push	hl
   3136 36 25         [10]  270 	ld	(hl),#<(_bullet01_0)
   3138 23            [ 6]  271 	inc	hl
   3139 36 3D         [10]  272 	ld	(hl),#>(_bullet01_0)
                            273 ;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
   313B DD 7E F4      [19]  274 	ld	a,-12 (ix)
   313E C6 02         [ 7]  275 	add	a, #0x02
   3140 DD 77 F6      [19]  276 	ld	-10 (ix),a
   3143 DD 7E F5      [19]  277 	ld	a,-11 (ix)
   3146 CE 00         [ 7]  278 	adc	a, #0x00
   3148 DD 77 F7      [19]  279 	ld	-9 (ix),a
   314B DD 6E F6      [19]  280 	ld	l,-10 (ix)
   314E DD 66 F7      [19]  281 	ld	h,-9 (ix)
   3151 36 2D         [10]  282 	ld	(hl),#<(_bullet01_1)
   3153 23            [ 6]  283 	inc	hl
   3154 36 3D         [10]  284 	ld	(hl),#>(_bullet01_1)
                            285 ;src/entities/shoots.c:58: }
   3156                     286 00106$:
                            287 ;src/entities/shoots.c:59: active_shoots++;
   3156 21 9E 55      [10]  288 	ld	hl, #_active_shoots+0
   3159 34            [11]  289 	inc	(hl)
   315A                     290 00109$:
   315A DD F9         [10]  291 	ld	sp, ix
   315C DD E1         [14]  292 	pop	ix
   315E C9            [10]  293 	ret
                            294 ;src/entities/shoots.c:68: void update_shoots(){
                            295 ;	---------------------------------
                            296 ; Function update_shoots
                            297 ; ---------------------------------
   315F                     298 _update_shoots::
   315F DD E5         [15]  299 	push	ix
   3161 DD 21 00 00   [14]  300 	ld	ix,#0
   3165 DD 39         [15]  301 	add	ix,sp
   3167 F5            [11]  302 	push	af
                            303 ;src/entities/shoots.c:71: if (active_shoots>0){
   3168 3A 9E 55      [13]  304 	ld	a,(#_active_shoots + 0)
   316B B7            [ 4]  305 	or	a, a
   316C 28 6C         [12]  306 	jr	Z,00113$
                            307 ;src/entities/shoots.c:72: for (i=0;i<MAX_SHOOTS;i++){
   316E 0E 00         [ 7]  308 	ld	c,#0x00
   3170                     309 00111$:
                            310 ;src/entities/shoots.c:73: if (shoots[i].active){
   3170 69            [ 4]  311 	ld	l,c
   3171 26 00         [ 7]  312 	ld	h,#0x00
   3173 29            [11]  313 	add	hl, hl
   3174 29            [11]  314 	add	hl, hl
   3175 29            [11]  315 	add	hl, hl
   3176 29            [11]  316 	add	hl, hl
   3177 3E FE         [ 7]  317 	ld	a,#<(_shoots)
   3179 85            [ 4]  318 	add	a, l
   317A DD 77 FE      [19]  319 	ld	-2 (ix),a
   317D 3E 54         [ 7]  320 	ld	a,#>(_shoots)
   317F 8C            [ 4]  321 	adc	a, h
   3180 DD 77 FF      [19]  322 	ld	-1 (ix),a
   3183 DD 7E FE      [19]  323 	ld	a,-2 (ix)
   3186 C6 08         [ 7]  324 	add	a, #0x08
   3188 5F            [ 4]  325 	ld	e,a
   3189 DD 7E FF      [19]  326 	ld	a,-1 (ix)
   318C CE 00         [ 7]  327 	adc	a, #0x00
   318E 57            [ 4]  328 	ld	d,a
   318F 1A            [ 7]  329 	ld	a,(de)
   3190 B7            [ 4]  330 	or	a, a
   3191 28 41         [12]  331 	jr	Z,00112$
                            332 ;src/entities/shoots.c:74: shoots[i].y-=SHOOT_JUMP;
   3193 DD 7E FE      [19]  333 	ld	a,-2 (ix)
   3196 C6 05         [ 7]  334 	add	a, #0x05
   3198 6F            [ 4]  335 	ld	l,a
   3199 DD 7E FF      [19]  336 	ld	a,-1 (ix)
   319C CE 00         [ 7]  337 	adc	a, #0x00
   319E 67            [ 4]  338 	ld	h,a
   319F 7E            [ 7]  339 	ld	a,(hl)
   31A0 C6 F6         [ 7]  340 	add	a,#0xF6
   31A2 47            [ 4]  341 	ld	b,a
   31A3 70            [ 7]  342 	ld	(hl),b
                            343 ;src/entities/shoots.c:75: if (shoots[i].y<200){
   31A4 78            [ 4]  344 	ld	a,b
   31A5 D6 C8         [ 7]  345 	sub	a, #0xC8
   31A7 30 25         [12]  346 	jr	NC,00104$
                            347 ;src/entities/shoots.c:76: shoots[i].frame++;
   31A9 DD 7E FE      [19]  348 	ld	a,-2 (ix)
   31AC C6 0A         [ 7]  349 	add	a, #0x0A
   31AE 5F            [ 4]  350 	ld	e,a
   31AF DD 7E FF      [19]  351 	ld	a,-1 (ix)
   31B2 CE 00         [ 7]  352 	adc	a, #0x00
   31B4 57            [ 4]  353 	ld	d,a
   31B5 1A            [ 7]  354 	ld	a,(de)
   31B6 47            [ 4]  355 	ld	b,a
   31B7 04            [ 4]  356 	inc	b
   31B8 78            [ 4]  357 	ld	a,b
   31B9 12            [ 7]  358 	ld	(de),a
                            359 ;src/entities/shoots.c:77: if (shoots[i].frame==shoots[i].num_frames)
   31BA FD E1         [14]  360 	pop	iy
   31BC FD E5         [15]  361 	push	iy
   31BE FD 7E 09      [19]  362 	ld	a,9 (iy)
   31C1 DD 77 FE      [19]  363 	ld	-2 (ix),a
   31C4 78            [ 4]  364 	ld	a,b
   31C5 DD 96 FE      [19]  365 	sub	a, -2 (ix)
   31C8 20 0A         [12]  366 	jr	NZ,00112$
                            367 ;src/entities/shoots.c:78: shoots[i].frame=0;
   31CA AF            [ 4]  368 	xor	a, a
   31CB 12            [ 7]  369 	ld	(de),a
   31CC 18 06         [12]  370 	jr	00112$
   31CE                     371 00104$:
                            372 ;src/entities/shoots.c:81: shoots[i].active=0;
   31CE AF            [ 4]  373 	xor	a, a
   31CF 12            [ 7]  374 	ld	(de),a
                            375 ;src/entities/shoots.c:82: active_shoots--;
   31D0 21 9E 55      [10]  376 	ld	hl, #_active_shoots+0
   31D3 35            [11]  377 	dec	(hl)
   31D4                     378 00112$:
                            379 ;src/entities/shoots.c:72: for (i=0;i<MAX_SHOOTS;i++){
   31D4 0C            [ 4]  380 	inc	c
   31D5 79            [ 4]  381 	ld	a,c
   31D6 D6 0A         [ 7]  382 	sub	a, #0x0A
   31D8 38 96         [12]  383 	jr	C,00111$
   31DA                     384 00113$:
   31DA DD F9         [10]  385 	ld	sp, ix
   31DC DD E1         [14]  386 	pop	ix
   31DE C9            [10]  387 	ret
                            388 ;src/entities/shoots.c:94: void draw_shoots(u8* screen){
                            389 ;	---------------------------------
                            390 ; Function draw_shoots
                            391 ; ---------------------------------
   31DF                     392 _draw_shoots::
   31DF DD E5         [15]  393 	push	ix
   31E1 DD 21 00 00   [14]  394 	ld	ix,#0
   31E5 DD 39         [15]  395 	add	ix,sp
   31E7 F5            [11]  396 	push	af
   31E8 F5            [11]  397 	push	af
   31E9 3B            [ 6]  398 	dec	sp
                            399 ;src/entities/shoots.c:99: if (active_shoots>0){
   31EA 3A 9E 55      [13]  400 	ld	a,(#_active_shoots + 0)
   31ED B7            [ 4]  401 	or	a, a
   31EE CA 79 32      [10]  402 	jp	Z,00108$
                            403 ;src/entities/shoots.c:100: for (k=0;k<MAX_SHOOTS;k++){
   31F1 0E 00         [ 7]  404 	ld	c,#0x00
   31F3                     405 00106$:
                            406 ;src/entities/shoots.c:101: if (shoots[k].active){
   31F3 69            [ 4]  407 	ld	l,c
   31F4 26 00         [ 7]  408 	ld	h,#0x00
   31F6 29            [11]  409 	add	hl, hl
   31F7 29            [11]  410 	add	hl, hl
   31F8 29            [11]  411 	add	hl, hl
   31F9 29            [11]  412 	add	hl, hl
   31FA 3E FE         [ 7]  413 	ld	a,#<(_shoots)
   31FC 85            [ 4]  414 	add	a, l
   31FD DD 77 FB      [19]  415 	ld	-5 (ix),a
   3200 3E 54         [ 7]  416 	ld	a,#>(_shoots)
   3202 8C            [ 4]  417 	adc	a, h
   3203 DD 77 FC      [19]  418 	ld	-4 (ix),a
   3206 E1            [10]  419 	pop	hl
   3207 E5            [11]  420 	push	hl
   3208 11 08 00      [10]  421 	ld	de, #0x0008
   320B 19            [11]  422 	add	hl, de
   320C 7E            [ 7]  423 	ld	a,(hl)
   320D B7            [ 4]  424 	or	a, a
   320E 28 62         [12]  425 	jr	Z,00107$
                            426 ;src/entities/shoots.c:102: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   3210 E1            [10]  427 	pop	hl
   3211 E5            [11]  428 	push	hl
   3212 11 05 00      [10]  429 	ld	de, #0x0005
   3215 19            [11]  430 	add	hl, de
   3216 56            [ 7]  431 	ld	d,(hl)
   3217 E1            [10]  432 	pop	hl
   3218 E5            [11]  433 	push	hl
   3219 23            [ 6]  434 	inc	hl
   321A 23            [ 6]  435 	inc	hl
   321B 23            [ 6]  436 	inc	hl
   321C 23            [ 6]  437 	inc	hl
   321D 5E            [ 7]  438 	ld	e,(hl)
   321E E5            [11]  439 	push	hl
   321F DD 6E 04      [19]  440 	ld	l,4 (ix)
   3222 DD 66 05      [19]  441 	ld	h,5 (ix)
   3225 E5            [11]  442 	push	hl
   3226 FD E1         [14]  443 	pop	iy
   3228 E1            [10]  444 	pop	hl
   3229 C5            [11]  445 	push	bc
   322A D5            [11]  446 	push	de
   322B FD E5         [15]  447 	push	iy
   322D CD 11 4D      [17]  448 	call	_cpct_getScreenPtr
   3230 F1            [10]  449 	pop	af
   3231 F1            [10]  450 	pop	af
   3232 C1            [10]  451 	pop	bc
   3233 EB            [ 4]  452 	ex	de,hl
                            453 ;src/entities/shoots.c:103: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   3234 FD E1         [14]  454 	pop	iy
   3236 FD E5         [15]  455 	push	iy
   3238 FD 7E 07      [19]  456 	ld	a,7 (iy)
   323B DD 77 FD      [19]  457 	ld	-3 (ix),a
   323E E1            [10]  458 	pop	hl
   323F E5            [11]  459 	push	hl
   3240 C5            [11]  460 	push	bc
   3241 01 06 00      [10]  461 	ld	bc, #0x0006
   3244 09            [11]  462 	add	hl, bc
   3245 C1            [10]  463 	pop	bc
   3246 46            [ 7]  464 	ld	b,(hl)
   3247 DD 73 FE      [19]  465 	ld	-2 (ix),e
   324A DD 72 FF      [19]  466 	ld	-1 (ix),d
   324D E1            [10]  467 	pop	hl
   324E E5            [11]  468 	push	hl
   324F 11 0A 00      [10]  469 	ld	de, #0x000A
   3252 19            [11]  470 	add	hl, de
   3253 7E            [ 7]  471 	ld	a,(hl)
   3254 87            [ 4]  472 	add	a, a
   3255 5F            [ 4]  473 	ld	e,a
   3256 E1            [10]  474 	pop	hl
   3257 E5            [11]  475 	push	hl
   3258 16 00         [ 7]  476 	ld	d,#0x00
   325A 19            [11]  477 	add	hl, de
   325B 5E            [ 7]  478 	ld	e,(hl)
   325C 23            [ 6]  479 	inc	hl
   325D 56            [ 7]  480 	ld	d,(hl)
   325E C5            [11]  481 	push	bc
   325F DD 7E FD      [19]  482 	ld	a,-3 (ix)
   3262 F5            [11]  483 	push	af
   3263 33            [ 6]  484 	inc	sp
   3264 C5            [11]  485 	push	bc
   3265 33            [ 6]  486 	inc	sp
   3266 DD 6E FE      [19]  487 	ld	l,-2 (ix)
   3269 DD 66 FF      [19]  488 	ld	h,-1 (ix)
   326C E5            [11]  489 	push	hl
   326D D5            [11]  490 	push	de
   326E CD E8 4A      [17]  491 	call	_cpct_drawSprite
   3271 C1            [10]  492 	pop	bc
   3272                     493 00107$:
                            494 ;src/entities/shoots.c:100: for (k=0;k<MAX_SHOOTS;k++){
   3272 0C            [ 4]  495 	inc	c
   3273 79            [ 4]  496 	ld	a,c
   3274 D6 0A         [ 7]  497 	sub	a, #0x0A
   3276 DA F3 31      [10]  498 	jp	C,00106$
   3279                     499 00108$:
   3279 DD F9         [10]  500 	ld	sp, ix
   327B DD E1         [14]  501 	pop	ix
   327D C9            [10]  502 	ret
                            503 	.area _CODE
                            504 	.area _INITIALIZER
                            505 	.area _CABS (ABS)
