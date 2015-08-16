                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:00:18 2015
                              5 ;--------------------------------------------------------
                              6 	.module explosions
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _get_time
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _explosiones_lastUpdated
                             16 	.globl _explosion_sprite
                             17 	.globl _explosiones_activas
                             18 	.globl _explosiones
                             19 	.globl _init_explosions
                             20 	.globl _create_explosion
                             21 	.globl _update_explosions
                             22 	.globl _draw_explosions
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   6764                      30 _explosiones::
   6764                      31 	.ds 480
   6944                      32 _explosiones_activas::
   6944                      33 	.ds 1
   6945                      34 _explosion_sprite::
   6945                      35 	.ds 16
   6955                      36 _explosiones_lastUpdated::
   6955                      37 	.ds 4
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
                             42 ;--------------------------------------------------------
                             43 ; absolute external ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DABS (ABS)
                             46 ;--------------------------------------------------------
                             47 ; global & static initialisations
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _GSINIT
                             51 	.area _GSFINAL
                             52 	.area _GSINIT
                             53 ;--------------------------------------------------------
                             54 ; Home
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _HOME
                             58 ;--------------------------------------------------------
                             59 ; code
                             60 ;--------------------------------------------------------
                             61 	.area _CODE
                             62 ;src/entities/explosions.c:20: void init_explosions(){
                             63 ;	---------------------------------
                             64 ; Function init_explosions
                             65 ; ---------------------------------
   3082                      66 _init_explosions::
                             67 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   3082 16 00         [ 7]   68 	ld	d,#0x00
   3084                      69 00102$:
                             70 ;src/entities/explosions.c:24: explosiones[i].activo=0;
   3084 6A            [ 4]   71 	ld	l,d
   3085 26 00         [ 7]   72 	ld	h,#0x00
   3087 29            [11]   73 	add	hl, hl
   3088 29            [11]   74 	add	hl, hl
   3089 29            [11]   75 	add	hl, hl
   308A 29            [11]   76 	add	hl, hl
   308B 3E 64         [ 7]   77 	ld	a,#<(_explosiones)
   308D 85            [ 4]   78 	add	a, l
   308E 4F            [ 4]   79 	ld	c,a
   308F 3E 67         [ 7]   80 	ld	a,#>(_explosiones)
   3091 8C            [ 4]   81 	adc	a, h
   3092 47            [ 4]   82 	ld	b,a
   3093 69            [ 4]   83 	ld	l, c
   3094 60            [ 4]   84 	ld	h, b
   3095 23            [ 6]   85 	inc	hl
   3096 23            [ 6]   86 	inc	hl
   3097 36 00         [10]   87 	ld	(hl),#0x00
                             88 ;src/entities/explosions.c:25: explosiones[i].tipo=0;
   3099 AF            [ 4]   89 	xor	a, a
   309A 02            [ 7]   90 	ld	(bc),a
                             91 ;src/entities/explosions.c:26: explosiones[i].fase=0;
   309B 69            [ 4]   92 	ld	l, c
   309C 60            [ 4]   93 	ld	h, b
   309D 23            [ 6]   94 	inc	hl
   309E 36 00         [10]   95 	ld	(hl),#0x00
                             96 ;src/entities/explosions.c:27: explosiones[i].x=0;
   30A0 69            [ 4]   97 	ld	l, c
   30A1 60            [ 4]   98 	ld	h, b
   30A2 23            [ 6]   99 	inc	hl
   30A3 23            [ 6]  100 	inc	hl
   30A4 23            [ 6]  101 	inc	hl
   30A5 36 00         [10]  102 	ld	(hl),#0x00
                            103 ;src/entities/explosions.c:28: explosiones[i].y=0;
   30A7 21 04 00      [10]  104 	ld	hl,#0x0004
   30AA 09            [11]  105 	add	hl,bc
   30AB 36 00         [10]  106 	ld	(hl),#0x00
                            107 ;src/entities/explosions.c:29: explosiones[i].h=0;
   30AD 21 05 00      [10]  108 	ld	hl,#0x0005
   30B0 09            [11]  109 	add	hl,bc
   30B1 36 00         [10]  110 	ld	(hl),#0x00
                            111 ;src/entities/explosions.c:30: explosiones[i].w=0;
   30B3 21 06 00      [10]  112 	ld	hl,#0x0006
   30B6 09            [11]  113 	add	hl,bc
   30B7 36 00         [10]  114 	ld	(hl),#0x00
                            115 ;src/entities/explosions.c:31: explosiones[i].last_moved=0;
   30B9 21 0C 00      [10]  116 	ld	hl,#0x000C
   30BC 09            [11]  117 	add	hl,bc
   30BD AF            [ 4]  118 	xor	a, a
   30BE 77            [ 7]  119 	ld	(hl), a
   30BF 23            [ 6]  120 	inc	hl
   30C0 77            [ 7]  121 	ld	(hl), a
   30C1 23            [ 6]  122 	inc	hl
   30C2 AF            [ 4]  123 	xor	a, a
   30C3 77            [ 7]  124 	ld	(hl), a
   30C4 23            [ 6]  125 	inc	hl
   30C5 77            [ 7]  126 	ld	(hl), a
                            127 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   30C6 14            [ 4]  128 	inc	d
   30C7 7A            [ 4]  129 	ld	a,d
   30C8 D6 1E         [ 7]  130 	sub	a, #0x1E
   30CA 38 B8         [12]  131 	jr	C,00102$
                            132 ;src/entities/explosions.c:33: explosiones_activas=0;
   30CC 21 44 69      [10]  133 	ld	hl,#_explosiones_activas + 0
   30CF 36 00         [10]  134 	ld	(hl), #0x00
                            135 ;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
   30D1 21 F7 46      [10]  136 	ld	hl,#_explosion02000
   30D4 22 45 69      [16]  137 	ld	(_explosion_sprite), hl
                            138 ;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
   30D7 21 39 47      [10]  139 	ld	hl,#_explosion02001
   30DA 22 47 69      [16]  140 	ld	((_explosion_sprite + 0x0002)), hl
                            141 ;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
   30DD 21 7B 47      [10]  142 	ld	hl,#_explosion02002
   30E0 22 49 69      [16]  143 	ld	((_explosion_sprite + 0x0004)), hl
                            144 ;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
   30E3 21 BD 47      [10]  145 	ld	hl,#_explosion02003
   30E6 22 4B 69      [16]  146 	ld	((_explosion_sprite + 0x0006)), hl
                            147 ;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
   30E9 21 41 48      [10]  148 	ld	hl,#_toque000
   30EC 22 4D 69      [16]  149 	ld	((_explosion_sprite + 0x0008)), hl
                            150 ;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
   30EF 21 53 48      [10]  151 	ld	hl,#_toque001
   30F2 22 4F 69      [16]  152 	ld	((_explosion_sprite + 0x000a)), hl
                            153 ;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
   30F5 21 65 48      [10]  154 	ld	hl,#_toque002
   30F8 22 51 69      [16]  155 	ld	((_explosion_sprite + 0x000c)), hl
                            156 ;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
   30FB 21 77 48      [10]  157 	ld	hl,#_toque003
   30FE 22 53 69      [16]  158 	ld	((_explosion_sprite + 0x000e)), hl
   3101 C9            [10]  159 	ret
                            160 ;src/entities/explosions.c:47: void create_explosion(u8 x, u8 y, u8 tipo){
                            161 ;	---------------------------------
                            162 ; Function create_explosion
                            163 ; ---------------------------------
   3102                     164 _create_explosion::
   3102 DD E5         [15]  165 	push	ix
   3104 DD 21 00 00   [14]  166 	ld	ix,#0
   3108 DD 39         [15]  167 	add	ix,sp
   310A F5            [11]  168 	push	af
                            169 ;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
   310B 01 64 67      [10]  170 	ld	bc,#_explosiones+0
   310E 1E 00         [ 7]  171 	ld	e,#0x00
   3110                     172 00101$:
   3110 6B            [ 4]  173 	ld	l,e
   3111 26 00         [ 7]  174 	ld	h,#0x00
   3113 29            [11]  175 	add	hl, hl
   3114 29            [11]  176 	add	hl, hl
   3115 29            [11]  177 	add	hl, hl
   3116 29            [11]  178 	add	hl, hl
   3117 09            [11]  179 	add	hl,bc
   3118 E3            [19]  180 	ex	(sp), hl
   3119 E1            [10]  181 	pop	hl
   311A E5            [11]  182 	push	hl
   311B 23            [ 6]  183 	inc	hl
   311C 23            [ 6]  184 	inc	hl
   311D 7E            [ 7]  185 	ld	a,(hl)
   311E 3D            [ 4]  186 	dec	a
   311F 20 03         [12]  187 	jr	NZ,00103$
                            188 ;src/entities/explosions.c:51: i++;
   3121 1C            [ 4]  189 	inc	e
   3122 18 EC         [12]  190 	jr	00101$
   3124                     191 00103$:
                            192 ;src/entities/explosions.c:53: explosiones[i].activo=1;
   3124 36 01         [10]  193 	ld	(hl),#0x01
                            194 ;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
   3126 E1            [10]  195 	pop	hl
   3127 E5            [11]  196 	push	hl
   3128 DD 7E 06      [19]  197 	ld	a,6 (ix)
   312B 77            [ 7]  198 	ld	(hl),a
                            199 ;src/entities/explosions.c:55: explosiones[i].fase=0;
   312C E1            [10]  200 	pop	hl
   312D E5            [11]  201 	push	hl
   312E 23            [ 6]  202 	inc	hl
   312F 36 00         [10]  203 	ld	(hl),#0x00
                            204 ;src/entities/explosions.c:56: explosiones[i].x=x;
   3131 E1            [10]  205 	pop	hl
   3132 E5            [11]  206 	push	hl
   3133 23            [ 6]  207 	inc	hl
   3134 23            [ 6]  208 	inc	hl
   3135 23            [ 6]  209 	inc	hl
   3136 DD 7E 04      [19]  210 	ld	a,4 (ix)
   3139 77            [ 7]  211 	ld	(hl),a
                            212 ;src/entities/explosions.c:57: explosiones[i].y=y;
   313A DD 7E FE      [19]  213 	ld	a,-2 (ix)
   313D C6 04         [ 7]  214 	add	a, #0x04
   313F 6F            [ 4]  215 	ld	l,a
   3140 DD 7E FF      [19]  216 	ld	a,-1 (ix)
   3143 CE 00         [ 7]  217 	adc	a, #0x00
   3145 67            [ 4]  218 	ld	h,a
   3146 DD 7E 05      [19]  219 	ld	a,5 (ix)
   3149 77            [ 7]  220 	ld	(hl),a
                            221 ;src/entities/explosions.c:60: explosiones[i].h=16;
   314A DD 7E FE      [19]  222 	ld	a,-2 (ix)
   314D C6 05         [ 7]  223 	add	a, #0x05
   314F 6F            [ 4]  224 	ld	l,a
   3150 DD 7E FF      [19]  225 	ld	a,-1 (ix)
   3153 CE 00         [ 7]  226 	adc	a, #0x00
   3155 67            [ 4]  227 	ld	h,a
                            228 ;src/entities/explosions.c:61: explosiones[i].w=4;
   3156 DD 7E FE      [19]  229 	ld	a,-2 (ix)
   3159 C6 06         [ 7]  230 	add	a, #0x06
   315B 5F            [ 4]  231 	ld	e,a
   315C DD 7E FF      [19]  232 	ld	a,-1 (ix)
   315F CE 00         [ 7]  233 	adc	a, #0x00
   3161 57            [ 4]  234 	ld	d,a
                            235 ;src/entities/explosions.c:59: if (!tipo){
   3162 DD 7E 06      [19]  236 	ld	a,6 (ix)
   3165 B7            [ 4]  237 	or	a, a
   3166 20 07         [12]  238 	jr	NZ,00105$
                            239 ;src/entities/explosions.c:60: explosiones[i].h=16;
   3168 36 10         [10]  240 	ld	(hl),#0x10
                            241 ;src/entities/explosions.c:61: explosiones[i].w=4;
   316A 3E 04         [ 7]  242 	ld	a,#0x04
   316C 12            [ 7]  243 	ld	(de),a
   316D 18 05         [12]  244 	jr	00106$
   316F                     245 00105$:
                            246 ;src/entities/explosions.c:63: explosiones[i].h=8;
   316F 36 08         [10]  247 	ld	(hl),#0x08
                            248 ;src/entities/explosions.c:64: explosiones[i].w=2;
   3171 3E 02         [ 7]  249 	ld	a,#0x02
   3173 12            [ 7]  250 	ld	(de),a
   3174                     251 00106$:
                            252 ;src/entities/explosions.c:66: explosiones_activas++;
   3174 21 44 69      [10]  253 	ld	hl, #_explosiones_activas+0
   3177 34            [11]  254 	inc	(hl)
   3178 DD F9         [10]  255 	ld	sp, ix
   317A DD E1         [14]  256 	pop	ix
   317C C9            [10]  257 	ret
                            258 ;src/entities/explosions.c:73: void update_explosions(){
                            259 ;	---------------------------------
                            260 ; Function update_explosions
                            261 ; ---------------------------------
   317D                     262 _update_explosions::
   317D DD E5         [15]  263 	push	ix
   317F DD 21 00 00   [14]  264 	ld	ix,#0
   3183 DD 39         [15]  265 	add	ix,sp
   3185 21 F8 FF      [10]  266 	ld	hl,#-8
   3188 39            [11]  267 	add	hl,sp
   3189 F9            [ 6]  268 	ld	sp,hl
                            269 ;src/entities/explosions.c:75: if ((explosiones_activas>0)&&((get_time()-explosiones_lastUpdated>EXPLOSIONS_SPEED))){
   318A 3A 44 69      [13]  270 	ld	a,(#_explosiones_activas + 0)
   318D B7            [ 4]  271 	or	a, a
   318E CA 15 32      [10]  272 	jp	Z,00112$
   3191 CD C3 4E      [17]  273 	call	_get_time
   3194 DD 72 FB      [19]  274 	ld	-5 (ix),d
   3197 DD 73 FA      [19]  275 	ld	-6 (ix),e
   319A DD 74 F9      [19]  276 	ld	-7 (ix),h
   319D DD 75 F8      [19]  277 	ld	-8 (ix),l
   31A0 21 04 00      [10]  278 	ld	hl, #4
   31A3 39            [11]  279 	add	hl, sp
   31A4 EB            [ 4]  280 	ex	de, hl
   31A5 21 55 69      [10]  281 	ld	hl, #_explosiones_lastUpdated
   31A8 01 04 00      [10]  282 	ld	bc, #4
   31AB ED B0         [21]  283 	ldir
   31AD DD 7E F8      [19]  284 	ld	a,-8 (ix)
   31B0 DD 96 FC      [19]  285 	sub	a, -4 (ix)
   31B3 67            [ 4]  286 	ld	h,a
   31B4 DD 7E F9      [19]  287 	ld	a,-7 (ix)
   31B7 DD 9E FD      [19]  288 	sbc	a, -3 (ix)
   31BA 6F            [ 4]  289 	ld	l,a
   31BB DD 7E FA      [19]  290 	ld	a,-6 (ix)
   31BE DD 9E FE      [19]  291 	sbc	a, -2 (ix)
   31C1 5F            [ 4]  292 	ld	e,a
   31C2 DD 7E FB      [19]  293 	ld	a,-5 (ix)
   31C5 DD 9E FF      [19]  294 	sbc	a, -1 (ix)
   31C8 57            [ 4]  295 	ld	d,a
   31C9 3E 1E         [ 7]  296 	ld	a,#0x1E
   31CB BC            [ 4]  297 	cp	a, h
   31CC 3E 00         [ 7]  298 	ld	a,#0x00
   31CE 9D            [ 4]  299 	sbc	a, l
   31CF 3E 00         [ 7]  300 	ld	a,#0x00
   31D1 9B            [ 4]  301 	sbc	a, e
   31D2 3E 00         [ 7]  302 	ld	a,#0x00
   31D4 9A            [ 4]  303 	sbc	a, d
   31D5 30 3E         [12]  304 	jr	NC,00112$
                            305 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   31D7 0E 00         [ 7]  306 	ld	c,#0x00
   31D9                     307 00110$:
                            308 ;src/entities/explosions.c:77: if (explosiones[i].activo==1){
   31D9 69            [ 4]  309 	ld	l,c
   31DA 26 00         [ 7]  310 	ld	h,#0x00
   31DC 29            [11]  311 	add	hl, hl
   31DD 29            [11]  312 	add	hl, hl
   31DE 29            [11]  313 	add	hl, hl
   31DF 29            [11]  314 	add	hl, hl
   31E0 3E 64         [ 7]  315 	ld	a,#<(_explosiones)
   31E2 85            [ 4]  316 	add	a, l
   31E3 DD 77 FC      [19]  317 	ld	-4 (ix),a
   31E6 3E 67         [ 7]  318 	ld	a,#>(_explosiones)
   31E8 8C            [ 4]  319 	adc	a, h
   31E9 DD 77 FD      [19]  320 	ld	-3 (ix),a
   31EC DD 5E FC      [19]  321 	ld	e,-4 (ix)
   31EF DD 56 FD      [19]  322 	ld	d,-3 (ix)
   31F2 13            [ 6]  323 	inc	de
   31F3 13            [ 6]  324 	inc	de
   31F4 1A            [ 7]  325 	ld	a,(de)
   31F5 3D            [ 4]  326 	dec	a
   31F6 20 17         [12]  327 	jr	NZ,00111$
                            328 ;src/entities/explosions.c:78: if (explosiones[i].fase<3){
   31F8 DD 6E FC      [19]  329 	ld	l,-4 (ix)
   31FB DD 66 FD      [19]  330 	ld	h,-3 (ix)
   31FE 23            [ 6]  331 	inc	hl
   31FF 46            [ 7]  332 	ld	b,(hl)
   3200 78            [ 4]  333 	ld	a,b
   3201 D6 03         [ 7]  334 	sub	a, #0x03
   3203 30 04         [12]  335 	jr	NC,00102$
                            336 ;src/entities/explosions.c:79: explosiones[i].fase++;
   3205 04            [ 4]  337 	inc	b
   3206 70            [ 7]  338 	ld	(hl),b
   3207 18 06         [12]  339 	jr	00111$
   3209                     340 00102$:
                            341 ;src/entities/explosions.c:83: explosiones[i].activo=0;
   3209 AF            [ 4]  342 	xor	a, a
   320A 12            [ 7]  343 	ld	(de),a
                            344 ;src/entities/explosions.c:84: explosiones_activas--;
   320B 21 44 69      [10]  345 	ld	hl, #_explosiones_activas+0
   320E 35            [11]  346 	dec	(hl)
   320F                     347 00111$:
                            348 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   320F 0C            [ 4]  349 	inc	c
   3210 79            [ 4]  350 	ld	a,c
   3211 D6 1E         [ 7]  351 	sub	a, #0x1E
   3213 38 C4         [12]  352 	jr	C,00110$
   3215                     353 00112$:
   3215 DD F9         [10]  354 	ld	sp, ix
   3217 DD E1         [14]  355 	pop	ix
   3219 C9            [10]  356 	ret
                            357 ;src/entities/explosions.c:97: void draw_explosions(u8* screen){
                            358 ;	---------------------------------
                            359 ; Function draw_explosions
                            360 ; ---------------------------------
   321A                     361 _draw_explosions::
   321A DD E5         [15]  362 	push	ix
   321C DD 21 00 00   [14]  363 	ld	ix,#0
   3220 DD 39         [15]  364 	add	ix,sp
   3222 F5            [11]  365 	push	af
   3223 3B            [ 6]  366 	dec	sp
                            367 ;src/entities/explosions.c:103: if (explosiones_activas>0){
   3224 3A 44 69      [13]  368 	ld	a,(#_explosiones_activas + 0)
   3227 B7            [ 4]  369 	or	a, a
   3228 CA C9 32      [10]  370 	jp	Z,00108$
                            371 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   322B 0E 00         [ 7]  372 	ld	c,#0x00
   322D                     373 00106$:
                            374 ;src/entities/explosions.c:105: if (explosiones[i].activo==1){
   322D 69            [ 4]  375 	ld	l,c
   322E 26 00         [ 7]  376 	ld	h,#0x00
   3230 29            [11]  377 	add	hl, hl
   3231 29            [11]  378 	add	hl, hl
   3232 29            [11]  379 	add	hl, hl
   3233 29            [11]  380 	add	hl, hl
   3234 3E 64         [ 7]  381 	ld	a,#<(_explosiones)
   3236 85            [ 4]  382 	add	a, l
   3237 DD 77 FE      [19]  383 	ld	-2 (ix),a
   323A 3E 67         [ 7]  384 	ld	a,#>(_explosiones)
   323C 8C            [ 4]  385 	adc	a, h
   323D DD 77 FF      [19]  386 	ld	-1 (ix),a
   3240 DD 6E FE      [19]  387 	ld	l,-2 (ix)
   3243 DD 66 FF      [19]  388 	ld	h,-1 (ix)
   3246 23            [ 6]  389 	inc	hl
   3247 23            [ 6]  390 	inc	hl
   3248 7E            [ 7]  391 	ld	a,(hl)
   3249 3D            [ 4]  392 	dec	a
   324A 20 76         [12]  393 	jr	NZ,00107$
                            394 ;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
   324C DD 6E FE      [19]  395 	ld	l,-2 (ix)
   324F DD 66 FF      [19]  396 	ld	h,-1 (ix)
   3252 11 04 00      [10]  397 	ld	de, #0x0004
   3255 19            [11]  398 	add	hl, de
   3256 5E            [ 7]  399 	ld	e,(hl)
   3257 DD 6E FE      [19]  400 	ld	l,-2 (ix)
   325A DD 66 FF      [19]  401 	ld	h,-1 (ix)
   325D 23            [ 6]  402 	inc	hl
   325E 23            [ 6]  403 	inc	hl
   325F 23            [ 6]  404 	inc	hl
   3260 66            [ 7]  405 	ld	h,(hl)
   3261 DD 6E 04      [19]  406 	ld	l,4 (ix)
   3264 DD 56 05      [19]  407 	ld	d,5 (ix)
   3267 C5            [11]  408 	push	bc
   3268 7B            [ 4]  409 	ld	a,e
   3269 F5            [11]  410 	push	af
   326A 33            [ 6]  411 	inc	sp
   326B E5            [11]  412 	push	hl
   326C 33            [ 6]  413 	inc	sp
   326D 62            [ 4]  414 	ld	h, d
   326E E5            [11]  415 	push	hl
   326F CD 89 56      [17]  416 	call	_cpct_getScreenPtr
   3272 C1            [10]  417 	pop	bc
   3273 E5            [11]  418 	push	hl
   3274 FD E1         [14]  419 	pop	iy
                            420 ;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
   3276 DD 6E FE      [19]  421 	ld	l,-2 (ix)
   3279 DD 66 FF      [19]  422 	ld	h,-1 (ix)
   327C 11 05 00      [10]  423 	ld	de, #0x0005
   327F 19            [11]  424 	add	hl, de
   3280 46            [ 7]  425 	ld	b,(hl)
   3281 DD 6E FE      [19]  426 	ld	l,-2 (ix)
   3284 DD 66 FF      [19]  427 	ld	h,-1 (ix)
   3287 11 06 00      [10]  428 	ld	de, #0x0006
   328A 19            [11]  429 	add	hl, de
   328B 7E            [ 7]  430 	ld	a,(hl)
   328C DD 77 FD      [19]  431 	ld	-3 (ix),a
   328F DD 6E FE      [19]  432 	ld	l,-2 (ix)
   3292 DD 66 FF      [19]  433 	ld	h,-1 (ix)
   3295 6E            [ 7]  434 	ld	l,(hl)
   3296 26 00         [ 7]  435 	ld	h,#0x00
   3298 29            [11]  436 	add	hl, hl
   3299 29            [11]  437 	add	hl, hl
   329A 29            [11]  438 	add	hl, hl
   329B 3E 45         [ 7]  439 	ld	a,#<(_explosion_sprite)
   329D 85            [ 4]  440 	add	a, l
   329E 5F            [ 4]  441 	ld	e,a
   329F 3E 69         [ 7]  442 	ld	a,#>(_explosion_sprite)
   32A1 8C            [ 4]  443 	adc	a, h
   32A2 57            [ 4]  444 	ld	d,a
   32A3 DD 6E FE      [19]  445 	ld	l,-2 (ix)
   32A6 DD 66 FF      [19]  446 	ld	h,-1 (ix)
   32A9 23            [ 6]  447 	inc	hl
   32AA 7E            [ 7]  448 	ld	a,(hl)
   32AB 87            [ 4]  449 	add	a, a
   32AC 6F            [ 4]  450 	ld	l,a
   32AD 26 00         [ 7]  451 	ld	h,#0x00
   32AF 19            [11]  452 	add	hl,de
   32B0 5E            [ 7]  453 	ld	e,(hl)
   32B1 23            [ 6]  454 	inc	hl
   32B2 56            [ 7]  455 	ld	d,(hl)
   32B3 C5            [11]  456 	push	bc
   32B4 C5            [11]  457 	push	bc
   32B5 33            [ 6]  458 	inc	sp
   32B6 DD 7E FD      [19]  459 	ld	a,-3 (ix)
   32B9 F5            [11]  460 	push	af
   32BA 33            [ 6]  461 	inc	sp
   32BB FD E5         [15]  462 	push	iy
   32BD D5            [11]  463 	push	de
   32BE CD 49 53      [17]  464 	call	_cpct_drawSprite
   32C1 C1            [10]  465 	pop	bc
   32C2                     466 00107$:
                            467 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   32C2 0C            [ 4]  468 	inc	c
   32C3 79            [ 4]  469 	ld	a,c
   32C4 D6 1E         [ 7]  470 	sub	a, #0x1E
   32C6 DA 2D 32      [10]  471 	jp	C,00106$
   32C9                     472 00108$:
   32C9 DD F9         [10]  473 	ld	sp, ix
   32CB DD E1         [14]  474 	pop	ix
   32CD C9            [10]  475 	ret
                            476 	.area _CODE
                            477 	.area _INITIALIZER
                            478 	.area _CABS (ABS)
