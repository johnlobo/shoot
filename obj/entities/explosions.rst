                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Aug 10 00:37:25 2015
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
   6700                      30 _explosiones::
   6700                      31 	.ds 480
   68E0                      32 _explosiones_activas::
   68E0                      33 	.ds 1
   68E1                      34 _explosion_sprite::
   68E1                      35 	.ds 16
   68F1                      36 _explosiones_lastUpdated::
   68F1                      37 	.ds 4
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
   308F                      66 _init_explosions::
                             67 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   308F 16 00         [ 7]   68 	ld	d,#0x00
   3091                      69 00102$:
                             70 ;src/entities/explosions.c:24: explosiones[i].activo=0;
   3091 6A            [ 4]   71 	ld	l,d
   3092 26 00         [ 7]   72 	ld	h,#0x00
   3094 29            [11]   73 	add	hl, hl
   3095 29            [11]   74 	add	hl, hl
   3096 29            [11]   75 	add	hl, hl
   3097 29            [11]   76 	add	hl, hl
   3098 3E 00         [ 7]   77 	ld	a,#<(_explosiones)
   309A 85            [ 4]   78 	add	a, l
   309B 4F            [ 4]   79 	ld	c,a
   309C 3E 67         [ 7]   80 	ld	a,#>(_explosiones)
   309E 8C            [ 4]   81 	adc	a, h
   309F 47            [ 4]   82 	ld	b,a
   30A0 69            [ 4]   83 	ld	l, c
   30A1 60            [ 4]   84 	ld	h, b
   30A2 23            [ 6]   85 	inc	hl
   30A3 23            [ 6]   86 	inc	hl
   30A4 36 00         [10]   87 	ld	(hl),#0x00
                             88 ;src/entities/explosions.c:25: explosiones[i].tipo=0;
   30A6 AF            [ 4]   89 	xor	a, a
   30A7 02            [ 7]   90 	ld	(bc),a
                             91 ;src/entities/explosions.c:26: explosiones[i].fase=0;
   30A8 69            [ 4]   92 	ld	l, c
   30A9 60            [ 4]   93 	ld	h, b
   30AA 23            [ 6]   94 	inc	hl
   30AB 36 00         [10]   95 	ld	(hl),#0x00
                             96 ;src/entities/explosions.c:27: explosiones[i].x=0;
   30AD 69            [ 4]   97 	ld	l, c
   30AE 60            [ 4]   98 	ld	h, b
   30AF 23            [ 6]   99 	inc	hl
   30B0 23            [ 6]  100 	inc	hl
   30B1 23            [ 6]  101 	inc	hl
   30B2 36 00         [10]  102 	ld	(hl),#0x00
                            103 ;src/entities/explosions.c:28: explosiones[i].y=0;
   30B4 21 04 00      [10]  104 	ld	hl,#0x0004
   30B7 09            [11]  105 	add	hl,bc
   30B8 36 00         [10]  106 	ld	(hl),#0x00
                            107 ;src/entities/explosions.c:29: explosiones[i].h=0;
   30BA 21 05 00      [10]  108 	ld	hl,#0x0005
   30BD 09            [11]  109 	add	hl,bc
   30BE 36 00         [10]  110 	ld	(hl),#0x00
                            111 ;src/entities/explosions.c:30: explosiones[i].w=0;
   30C0 21 06 00      [10]  112 	ld	hl,#0x0006
   30C3 09            [11]  113 	add	hl,bc
   30C4 36 00         [10]  114 	ld	(hl),#0x00
                            115 ;src/entities/explosions.c:31: explosiones[i].lastmoved=0;
   30C6 21 0C 00      [10]  116 	ld	hl,#0x000C
   30C9 09            [11]  117 	add	hl,bc
   30CA AF            [ 4]  118 	xor	a, a
   30CB 77            [ 7]  119 	ld	(hl), a
   30CC 23            [ 6]  120 	inc	hl
   30CD 77            [ 7]  121 	ld	(hl), a
   30CE 23            [ 6]  122 	inc	hl
   30CF AF            [ 4]  123 	xor	a, a
   30D0 77            [ 7]  124 	ld	(hl), a
   30D1 23            [ 6]  125 	inc	hl
   30D2 77            [ 7]  126 	ld	(hl), a
                            127 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   30D3 14            [ 4]  128 	inc	d
   30D4 7A            [ 4]  129 	ld	a,d
   30D5 D6 1E         [ 7]  130 	sub	a, #0x1E
   30D7 38 B8         [12]  131 	jr	C,00102$
                            132 ;src/entities/explosions.c:33: explosiones_activas=0;
   30D9 21 E0 68      [10]  133 	ld	hl,#_explosiones_activas + 0
   30DC 36 00         [10]  134 	ld	(hl), #0x00
                            135 ;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
   30DE 21 85 46      [10]  136 	ld	hl,#_explosion02000
   30E1 22 E1 68      [16]  137 	ld	(_explosion_sprite), hl
                            138 ;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
   30E4 21 C7 46      [10]  139 	ld	hl,#_explosion02001
   30E7 22 E3 68      [16]  140 	ld	((_explosion_sprite + 0x0002)), hl
                            141 ;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
   30EA 21 09 47      [10]  142 	ld	hl,#_explosion02002
   30ED 22 E5 68      [16]  143 	ld	((_explosion_sprite + 0x0004)), hl
                            144 ;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
   30F0 21 4B 47      [10]  145 	ld	hl,#_explosion02003
   30F3 22 E7 68      [16]  146 	ld	((_explosion_sprite + 0x0006)), hl
                            147 ;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
   30F6 21 CF 47      [10]  148 	ld	hl,#_toque000
   30F9 22 E9 68      [16]  149 	ld	((_explosion_sprite + 0x0008)), hl
                            150 ;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
   30FC 21 E1 47      [10]  151 	ld	hl,#_toque001
   30FF 22 EB 68      [16]  152 	ld	((_explosion_sprite + 0x000a)), hl
                            153 ;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
   3102 21 F3 47      [10]  154 	ld	hl,#_toque002
   3105 22 ED 68      [16]  155 	ld	((_explosion_sprite + 0x000c)), hl
                            156 ;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
   3108 21 05 48      [10]  157 	ld	hl,#_toque003
   310B 22 EF 68      [16]  158 	ld	((_explosion_sprite + 0x000e)), hl
   310E C9            [10]  159 	ret
                            160 ;src/entities/explosions.c:47: void create_explosion(u8 x, u8 y, u8 tipo){
                            161 ;	---------------------------------
                            162 ; Function create_explosion
                            163 ; ---------------------------------
   310F                     164 _create_explosion::
   310F DD E5         [15]  165 	push	ix
   3111 DD 21 00 00   [14]  166 	ld	ix,#0
   3115 DD 39         [15]  167 	add	ix,sp
   3117 F5            [11]  168 	push	af
                            169 ;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
   3118 01 00 67      [10]  170 	ld	bc,#_explosiones+0
   311B 1E 00         [ 7]  171 	ld	e,#0x00
   311D                     172 00101$:
   311D 6B            [ 4]  173 	ld	l,e
   311E 26 00         [ 7]  174 	ld	h,#0x00
   3120 29            [11]  175 	add	hl, hl
   3121 29            [11]  176 	add	hl, hl
   3122 29            [11]  177 	add	hl, hl
   3123 29            [11]  178 	add	hl, hl
   3124 09            [11]  179 	add	hl,bc
   3125 E3            [19]  180 	ex	(sp), hl
   3126 E1            [10]  181 	pop	hl
   3127 E5            [11]  182 	push	hl
   3128 23            [ 6]  183 	inc	hl
   3129 23            [ 6]  184 	inc	hl
   312A 7E            [ 7]  185 	ld	a,(hl)
   312B 3D            [ 4]  186 	dec	a
   312C 20 03         [12]  187 	jr	NZ,00103$
                            188 ;src/entities/explosions.c:51: i++;
   312E 1C            [ 4]  189 	inc	e
   312F 18 EC         [12]  190 	jr	00101$
   3131                     191 00103$:
                            192 ;src/entities/explosions.c:53: explosiones[i].activo=1;
   3131 36 01         [10]  193 	ld	(hl),#0x01
                            194 ;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
   3133 E1            [10]  195 	pop	hl
   3134 E5            [11]  196 	push	hl
   3135 DD 7E 06      [19]  197 	ld	a,6 (ix)
   3138 77            [ 7]  198 	ld	(hl),a
                            199 ;src/entities/explosions.c:55: explosiones[i].fase=0;
   3139 E1            [10]  200 	pop	hl
   313A E5            [11]  201 	push	hl
   313B 23            [ 6]  202 	inc	hl
   313C 36 00         [10]  203 	ld	(hl),#0x00
                            204 ;src/entities/explosions.c:56: explosiones[i].x=x;
   313E E1            [10]  205 	pop	hl
   313F E5            [11]  206 	push	hl
   3140 23            [ 6]  207 	inc	hl
   3141 23            [ 6]  208 	inc	hl
   3142 23            [ 6]  209 	inc	hl
   3143 DD 7E 04      [19]  210 	ld	a,4 (ix)
   3146 77            [ 7]  211 	ld	(hl),a
                            212 ;src/entities/explosions.c:57: explosiones[i].y=y;
   3147 DD 7E FE      [19]  213 	ld	a,-2 (ix)
   314A C6 04         [ 7]  214 	add	a, #0x04
   314C 6F            [ 4]  215 	ld	l,a
   314D DD 7E FF      [19]  216 	ld	a,-1 (ix)
   3150 CE 00         [ 7]  217 	adc	a, #0x00
   3152 67            [ 4]  218 	ld	h,a
   3153 DD 7E 05      [19]  219 	ld	a,5 (ix)
   3156 77            [ 7]  220 	ld	(hl),a
                            221 ;src/entities/explosions.c:60: explosiones[i].h=16;
   3157 DD 7E FE      [19]  222 	ld	a,-2 (ix)
   315A C6 05         [ 7]  223 	add	a, #0x05
   315C 6F            [ 4]  224 	ld	l,a
   315D DD 7E FF      [19]  225 	ld	a,-1 (ix)
   3160 CE 00         [ 7]  226 	adc	a, #0x00
   3162 67            [ 4]  227 	ld	h,a
                            228 ;src/entities/explosions.c:61: explosiones[i].w=4;
   3163 DD 7E FE      [19]  229 	ld	a,-2 (ix)
   3166 C6 06         [ 7]  230 	add	a, #0x06
   3168 5F            [ 4]  231 	ld	e,a
   3169 DD 7E FF      [19]  232 	ld	a,-1 (ix)
   316C CE 00         [ 7]  233 	adc	a, #0x00
   316E 57            [ 4]  234 	ld	d,a
                            235 ;src/entities/explosions.c:59: if (!tipo){
   316F DD 7E 06      [19]  236 	ld	a,6 (ix)
   3172 B7            [ 4]  237 	or	a, a
   3173 20 07         [12]  238 	jr	NZ,00105$
                            239 ;src/entities/explosions.c:60: explosiones[i].h=16;
   3175 36 10         [10]  240 	ld	(hl),#0x10
                            241 ;src/entities/explosions.c:61: explosiones[i].w=4;
   3177 3E 04         [ 7]  242 	ld	a,#0x04
   3179 12            [ 7]  243 	ld	(de),a
   317A 18 05         [12]  244 	jr	00106$
   317C                     245 00105$:
                            246 ;src/entities/explosions.c:63: explosiones[i].h=8;
   317C 36 08         [10]  247 	ld	(hl),#0x08
                            248 ;src/entities/explosions.c:64: explosiones[i].w=2;
   317E 3E 02         [ 7]  249 	ld	a,#0x02
   3180 12            [ 7]  250 	ld	(de),a
   3181                     251 00106$:
                            252 ;src/entities/explosions.c:66: explosiones_activas++;
   3181 21 E0 68      [10]  253 	ld	hl, #_explosiones_activas+0
   3184 34            [11]  254 	inc	(hl)
   3185 DD F9         [10]  255 	ld	sp, ix
   3187 DD E1         [14]  256 	pop	ix
   3189 C9            [10]  257 	ret
                            258 ;src/entities/explosions.c:73: void update_explosions(){
                            259 ;	---------------------------------
                            260 ; Function update_explosions
                            261 ; ---------------------------------
   318A                     262 _update_explosions::
   318A DD E5         [15]  263 	push	ix
   318C DD 21 00 00   [14]  264 	ld	ix,#0
   3190 DD 39         [15]  265 	add	ix,sp
   3192 21 F8 FF      [10]  266 	ld	hl,#-8
   3195 39            [11]  267 	add	hl,sp
   3196 F9            [ 6]  268 	ld	sp,hl
                            269 ;src/entities/explosions.c:75: if ((explosiones_activas>0)&&((get_time()-explosiones_lastUpdated>EXPLOSIONS_SPEED))){
   3197 3A E0 68      [13]  270 	ld	a,(#_explosiones_activas + 0)
   319A B7            [ 4]  271 	or	a, a
   319B CA 1A 32      [10]  272 	jp	Z,00112$
   319E CD 51 4E      [17]  273 	call	_get_time
   31A1 DD 72 FF      [19]  274 	ld	-1 (ix),d
   31A4 DD 73 FE      [19]  275 	ld	-2 (ix),e
   31A7 DD 74 FD      [19]  276 	ld	-3 (ix),h
   31AA DD 75 FC      [19]  277 	ld	-4 (ix),l
   31AD 21 00 00      [10]  278 	ld	hl, #0
   31B0 39            [11]  279 	add	hl, sp
   31B1 EB            [ 4]  280 	ex	de, hl
   31B2 21 F1 68      [10]  281 	ld	hl, #_explosiones_lastUpdated
   31B5 01 04 00      [10]  282 	ld	bc, #4
   31B8 ED B0         [21]  283 	ldir
   31BA DD 7E FC      [19]  284 	ld	a,-4 (ix)
   31BD DD 96 F8      [19]  285 	sub	a, -8 (ix)
   31C0 67            [ 4]  286 	ld	h,a
   31C1 DD 7E FD      [19]  287 	ld	a,-3 (ix)
   31C4 DD 9E F9      [19]  288 	sbc	a, -7 (ix)
   31C7 6F            [ 4]  289 	ld	l,a
   31C8 DD 7E FE      [19]  290 	ld	a,-2 (ix)
   31CB DD 9E FA      [19]  291 	sbc	a, -6 (ix)
   31CE 5F            [ 4]  292 	ld	e,a
   31CF DD 7E FF      [19]  293 	ld	a,-1 (ix)
   31D2 DD 9E FB      [19]  294 	sbc	a, -5 (ix)
   31D5 57            [ 4]  295 	ld	d,a
   31D6 3E 1E         [ 7]  296 	ld	a,#0x1E
   31D8 BC            [ 4]  297 	cp	a, h
   31D9 3E 00         [ 7]  298 	ld	a,#0x00
   31DB 9D            [ 4]  299 	sbc	a, l
   31DC 3E 00         [ 7]  300 	ld	a,#0x00
   31DE 9B            [ 4]  301 	sbc	a, e
   31DF 3E 00         [ 7]  302 	ld	a,#0x00
   31E1 9A            [ 4]  303 	sbc	a, d
   31E2 30 36         [12]  304 	jr	NC,00112$
                            305 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   31E4 0E 00         [ 7]  306 	ld	c,#0x00
   31E6                     307 00110$:
                            308 ;src/entities/explosions.c:77: if (explosiones[i].activo==1){
   31E6 69            [ 4]  309 	ld	l,c
   31E7 26 00         [ 7]  310 	ld	h,#0x00
   31E9 29            [11]  311 	add	hl, hl
   31EA 29            [11]  312 	add	hl, hl
   31EB 29            [11]  313 	add	hl, hl
   31EC 29            [11]  314 	add	hl, hl
   31ED 3E 00         [ 7]  315 	ld	a,#<(_explosiones)
   31EF 85            [ 4]  316 	add	a, l
   31F0 DD 77 F8      [19]  317 	ld	-8 (ix),a
   31F3 3E 67         [ 7]  318 	ld	a,#>(_explosiones)
   31F5 8C            [ 4]  319 	adc	a, h
   31F6 DD 77 F9      [19]  320 	ld	-7 (ix),a
   31F9 D1            [10]  321 	pop	de
   31FA D5            [11]  322 	push	de
   31FB 13            [ 6]  323 	inc	de
   31FC 13            [ 6]  324 	inc	de
   31FD 1A            [ 7]  325 	ld	a,(de)
   31FE 3D            [ 4]  326 	dec	a
   31FF 20 13         [12]  327 	jr	NZ,00111$
                            328 ;src/entities/explosions.c:78: if (explosiones[i].fase<3){
   3201 E1            [10]  329 	pop	hl
   3202 E5            [11]  330 	push	hl
   3203 23            [ 6]  331 	inc	hl
   3204 46            [ 7]  332 	ld	b,(hl)
   3205 78            [ 4]  333 	ld	a,b
   3206 D6 03         [ 7]  334 	sub	a, #0x03
   3208 30 04         [12]  335 	jr	NC,00102$
                            336 ;src/entities/explosions.c:79: explosiones[i].fase++;
   320A 04            [ 4]  337 	inc	b
   320B 70            [ 7]  338 	ld	(hl),b
   320C 18 06         [12]  339 	jr	00111$
   320E                     340 00102$:
                            341 ;src/entities/explosions.c:83: explosiones[i].activo=0;
   320E AF            [ 4]  342 	xor	a, a
   320F 12            [ 7]  343 	ld	(de),a
                            344 ;src/entities/explosions.c:84: explosiones_activas--;
   3210 21 E0 68      [10]  345 	ld	hl, #_explosiones_activas+0
   3213 35            [11]  346 	dec	(hl)
   3214                     347 00111$:
                            348 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   3214 0C            [ 4]  349 	inc	c
   3215 79            [ 4]  350 	ld	a,c
   3216 D6 1E         [ 7]  351 	sub	a, #0x1E
   3218 38 CC         [12]  352 	jr	C,00110$
   321A                     353 00112$:
   321A DD F9         [10]  354 	ld	sp, ix
   321C DD E1         [14]  355 	pop	ix
   321E C9            [10]  356 	ret
                            357 ;src/entities/explosions.c:97: void draw_explosions(u8* screen){
                            358 ;	---------------------------------
                            359 ; Function draw_explosions
                            360 ; ---------------------------------
   321F                     361 _draw_explosions::
   321F DD E5         [15]  362 	push	ix
   3221 DD 21 00 00   [14]  363 	ld	ix,#0
   3225 DD 39         [15]  364 	add	ix,sp
   3227 F5            [11]  365 	push	af
   3228 3B            [ 6]  366 	dec	sp
                            367 ;src/entities/explosions.c:103: if (explosiones_activas>0){
   3229 3A E0 68      [13]  368 	ld	a,(#_explosiones_activas + 0)
   322C B7            [ 4]  369 	or	a, a
   322D CA CE 32      [10]  370 	jp	Z,00108$
                            371 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   3230 0E 00         [ 7]  372 	ld	c,#0x00
   3232                     373 00106$:
                            374 ;src/entities/explosions.c:105: if (explosiones[i].activo==1){
   3232 69            [ 4]  375 	ld	l,c
   3233 26 00         [ 7]  376 	ld	h,#0x00
   3235 29            [11]  377 	add	hl, hl
   3236 29            [11]  378 	add	hl, hl
   3237 29            [11]  379 	add	hl, hl
   3238 29            [11]  380 	add	hl, hl
   3239 3E 00         [ 7]  381 	ld	a,#<(_explosiones)
   323B 85            [ 4]  382 	add	a, l
   323C DD 77 FE      [19]  383 	ld	-2 (ix),a
   323F 3E 67         [ 7]  384 	ld	a,#>(_explosiones)
   3241 8C            [ 4]  385 	adc	a, h
   3242 DD 77 FF      [19]  386 	ld	-1 (ix),a
   3245 DD 6E FE      [19]  387 	ld	l,-2 (ix)
   3248 DD 66 FF      [19]  388 	ld	h,-1 (ix)
   324B 23            [ 6]  389 	inc	hl
   324C 23            [ 6]  390 	inc	hl
   324D 7E            [ 7]  391 	ld	a,(hl)
   324E 3D            [ 4]  392 	dec	a
   324F 20 76         [12]  393 	jr	NZ,00107$
                            394 ;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
   3251 DD 6E FE      [19]  395 	ld	l,-2 (ix)
   3254 DD 66 FF      [19]  396 	ld	h,-1 (ix)
   3257 11 04 00      [10]  397 	ld	de, #0x0004
   325A 19            [11]  398 	add	hl, de
   325B 5E            [ 7]  399 	ld	e,(hl)
   325C DD 6E FE      [19]  400 	ld	l,-2 (ix)
   325F DD 66 FF      [19]  401 	ld	h,-1 (ix)
   3262 23            [ 6]  402 	inc	hl
   3263 23            [ 6]  403 	inc	hl
   3264 23            [ 6]  404 	inc	hl
   3265 66            [ 7]  405 	ld	h,(hl)
   3266 DD 6E 04      [19]  406 	ld	l,4 (ix)
   3269 DD 56 05      [19]  407 	ld	d,5 (ix)
   326C C5            [11]  408 	push	bc
   326D 7B            [ 4]  409 	ld	a,e
   326E F5            [11]  410 	push	af
   326F 33            [ 6]  411 	inc	sp
   3270 E5            [11]  412 	push	hl
   3271 33            [ 6]  413 	inc	sp
   3272 62            [ 4]  414 	ld	h, d
   3273 E5            [11]  415 	push	hl
   3274 CD 25 56      [17]  416 	call	_cpct_getScreenPtr
   3277 C1            [10]  417 	pop	bc
   3278 E5            [11]  418 	push	hl
   3279 FD E1         [14]  419 	pop	iy
                            420 ;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
   327B DD 6E FE      [19]  421 	ld	l,-2 (ix)
   327E DD 66 FF      [19]  422 	ld	h,-1 (ix)
   3281 11 05 00      [10]  423 	ld	de, #0x0005
   3284 19            [11]  424 	add	hl, de
   3285 46            [ 7]  425 	ld	b,(hl)
   3286 DD 6E FE      [19]  426 	ld	l,-2 (ix)
   3289 DD 66 FF      [19]  427 	ld	h,-1 (ix)
   328C 11 06 00      [10]  428 	ld	de, #0x0006
   328F 19            [11]  429 	add	hl, de
   3290 7E            [ 7]  430 	ld	a,(hl)
   3291 DD 77 FD      [19]  431 	ld	-3 (ix),a
   3294 DD 6E FE      [19]  432 	ld	l,-2 (ix)
   3297 DD 66 FF      [19]  433 	ld	h,-1 (ix)
   329A 6E            [ 7]  434 	ld	l,(hl)
   329B 26 00         [ 7]  435 	ld	h,#0x00
   329D 29            [11]  436 	add	hl, hl
   329E 29            [11]  437 	add	hl, hl
   329F 29            [11]  438 	add	hl, hl
   32A0 3E E1         [ 7]  439 	ld	a,#<(_explosion_sprite)
   32A2 85            [ 4]  440 	add	a, l
   32A3 5F            [ 4]  441 	ld	e,a
   32A4 3E 68         [ 7]  442 	ld	a,#>(_explosion_sprite)
   32A6 8C            [ 4]  443 	adc	a, h
   32A7 57            [ 4]  444 	ld	d,a
   32A8 DD 6E FE      [19]  445 	ld	l,-2 (ix)
   32AB DD 66 FF      [19]  446 	ld	h,-1 (ix)
   32AE 23            [ 6]  447 	inc	hl
   32AF 7E            [ 7]  448 	ld	a,(hl)
   32B0 87            [ 4]  449 	add	a, a
   32B1 6F            [ 4]  450 	ld	l,a
   32B2 26 00         [ 7]  451 	ld	h,#0x00
   32B4 19            [11]  452 	add	hl,de
   32B5 5E            [ 7]  453 	ld	e,(hl)
   32B6 23            [ 6]  454 	inc	hl
   32B7 56            [ 7]  455 	ld	d,(hl)
   32B8 C5            [11]  456 	push	bc
   32B9 C5            [11]  457 	push	bc
   32BA 33            [ 6]  458 	inc	sp
   32BB DD 7E FD      [19]  459 	ld	a,-3 (ix)
   32BE F5            [11]  460 	push	af
   32BF 33            [ 6]  461 	inc	sp
   32C0 FD E5         [15]  462 	push	iy
   32C2 D5            [11]  463 	push	de
   32C3 CD E0 52      [17]  464 	call	_cpct_drawSprite
   32C6 C1            [10]  465 	pop	bc
   32C7                     466 00107$:
                            467 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   32C7 0C            [ 4]  468 	inc	c
   32C8 79            [ 4]  469 	ld	a,c
   32C9 D6 1E         [ 7]  470 	sub	a, #0x1E
   32CB DA 32 32      [10]  471 	jp	C,00106$
   32CE                     472 00108$:
   32CE DD F9         [10]  473 	ld	sp, ix
   32D0 DD E1         [14]  474 	pop	ix
   32D2 C9            [10]  475 	ret
                            476 	.area _CODE
                            477 	.area _INITIALIZER
                            478 	.area _CABS (ABS)
