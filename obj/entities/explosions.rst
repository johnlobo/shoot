                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul 21 2015) (Mac OS X x86_64)
                              4 ; This file was generated Thu Jul 23 01:06:49 2015
                              5 ;--------------------------------------------------------
                              6 	.module explosions
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _explosiones_lastUpdated
                             15 	.globl _explosion_sprite
                             16 	.globl _explosiones_activas
                             17 	.globl _explosiones
                             18 	.globl _init_explosions
                             19 	.globl _create_explosion
                             20 	.globl _update_explosions
                             21 	.globl _draw_explosions
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   5654                      29 _explosiones::
   5654                      30 	.ds 480
   5834                      31 _explosiones_activas::
   5834                      32 	.ds 1
   5835                      33 _explosion_sprite::
   5835                      34 	.ds 16
   5845                      35 _explosiones_lastUpdated::
   5845                      36 	.ds 4
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/entities/explosions.c:20: void init_explosions(){
                             62 ;	---------------------------------
                             63 ; Function init_explosions
                             64 ; ---------------------------------
   2EFD                      65 _init_explosions::
                             66 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2EFD 16 00         [ 7]   67 	ld	d,#0x00
   2EFF                      68 00102$:
                             69 ;src/entities/explosions.c:24: explosiones[i].activo=0;
   2EFF 6A            [ 4]   70 	ld	l,d
   2F00 26 00         [ 7]   71 	ld	h,#0x00
   2F02 29            [11]   72 	add	hl, hl
   2F03 29            [11]   73 	add	hl, hl
   2F04 29            [11]   74 	add	hl, hl
   2F05 29            [11]   75 	add	hl, hl
   2F06 3E 54         [ 7]   76 	ld	a,#<(_explosiones)
   2F08 85            [ 4]   77 	add	a, l
   2F09 4F            [ 4]   78 	ld	c,a
   2F0A 3E 56         [ 7]   79 	ld	a,#>(_explosiones)
   2F0C 8C            [ 4]   80 	adc	a, h
   2F0D 47            [ 4]   81 	ld	b,a
   2F0E 69            [ 4]   82 	ld	l, c
   2F0F 60            [ 4]   83 	ld	h, b
   2F10 23            [ 6]   84 	inc	hl
   2F11 23            [ 6]   85 	inc	hl
   2F12 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/explosions.c:25: explosiones[i].tipo=0;
   2F14 AF            [ 4]   88 	xor	a, a
   2F15 02            [ 7]   89 	ld	(bc),a
                             90 ;src/entities/explosions.c:26: explosiones[i].fase=0;
   2F16 69            [ 4]   91 	ld	l, c
   2F17 60            [ 4]   92 	ld	h, b
   2F18 23            [ 6]   93 	inc	hl
   2F19 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/explosions.c:27: explosiones[i].x=0;
   2F1B 69            [ 4]   96 	ld	l, c
   2F1C 60            [ 4]   97 	ld	h, b
   2F1D 23            [ 6]   98 	inc	hl
   2F1E 23            [ 6]   99 	inc	hl
   2F1F 23            [ 6]  100 	inc	hl
   2F20 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/explosions.c:28: explosiones[i].y=0;
   2F22 21 04 00      [10]  103 	ld	hl,#0x0004
   2F25 09            [11]  104 	add	hl,bc
   2F26 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/explosions.c:29: explosiones[i].h=0;
   2F28 21 05 00      [10]  107 	ld	hl,#0x0005
   2F2B 09            [11]  108 	add	hl,bc
   2F2C 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/explosions.c:30: explosiones[i].w=0;
   2F2E 21 06 00      [10]  111 	ld	hl,#0x0006
   2F31 09            [11]  112 	add	hl,bc
   2F32 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/explosions.c:31: explosiones[i].lastmoved=0;
   2F34 21 0C 00      [10]  115 	ld	hl,#0x000C
   2F37 09            [11]  116 	add	hl,bc
   2F38 AF            [ 4]  117 	xor	a, a
   2F39 77            [ 7]  118 	ld	(hl), a
   2F3A 23            [ 6]  119 	inc	hl
   2F3B 77            [ 7]  120 	ld	(hl), a
   2F3C 23            [ 6]  121 	inc	hl
   2F3D AF            [ 4]  122 	xor	a, a
   2F3E 77            [ 7]  123 	ld	(hl), a
   2F3F 23            [ 6]  124 	inc	hl
   2F40 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2F41 14            [ 4]  127 	inc	d
   2F42 7A            [ 4]  128 	ld	a,d
   2F43 D6 1E         [ 7]  129 	sub	a, #0x1E
   2F45 38 B8         [12]  130 	jr	C,00102$
                            131 ;src/entities/explosions.c:33: explosiones_activas=0;
   2F47 21 34 58      [10]  132 	ld	hl,#_explosiones_activas + 0
   2F4A 36 00         [10]  133 	ld	(hl), #0x00
                            134 ;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
   2F4C 21 D7 42      [10]  135 	ld	hl,#_explosion02000
   2F4F 22 35 58      [16]  136 	ld	(_explosion_sprite), hl
                            137 ;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
   2F52 21 19 43      [10]  138 	ld	hl,#_explosion02001
   2F55 22 37 58      [16]  139 	ld	((_explosion_sprite + 0x0002)), hl
                            140 ;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
   2F58 21 5B 43      [10]  141 	ld	hl,#_explosion02002
   2F5B 22 39 58      [16]  142 	ld	((_explosion_sprite + 0x0004)), hl
                            143 ;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
   2F5E 21 9D 43      [10]  144 	ld	hl,#_explosion02003
   2F61 22 3B 58      [16]  145 	ld	((_explosion_sprite + 0x0006)), hl
                            146 ;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
   2F64 21 21 44      [10]  147 	ld	hl,#_toque000
   2F67 22 3D 58      [16]  148 	ld	((_explosion_sprite + 0x0008)), hl
                            149 ;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
   2F6A 21 33 44      [10]  150 	ld	hl,#_toque001
   2F6D 22 3F 58      [16]  151 	ld	((_explosion_sprite + 0x000a)), hl
                            152 ;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
   2F70 21 45 44      [10]  153 	ld	hl,#_toque002
   2F73 22 41 58      [16]  154 	ld	((_explosion_sprite + 0x000c)), hl
                            155 ;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
   2F76 21 57 44      [10]  156 	ld	hl,#_toque003
   2F79 22 43 58      [16]  157 	ld	((_explosion_sprite + 0x000e)), hl
   2F7C C9            [10]  158 	ret
                            159 ;src/entities/explosions.c:47: void create_explosion(u8 x, u8 y, u8 tipo){
                            160 ;	---------------------------------
                            161 ; Function create_explosion
                            162 ; ---------------------------------
   2F7D                     163 _create_explosion::
   2F7D DD E5         [15]  164 	push	ix
   2F7F DD 21 00 00   [14]  165 	ld	ix,#0
   2F83 DD 39         [15]  166 	add	ix,sp
   2F85 F5            [11]  167 	push	af
                            168 ;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
   2F86 01 54 56      [10]  169 	ld	bc,#_explosiones+0
   2F89 1E 00         [ 7]  170 	ld	e,#0x00
   2F8B                     171 00101$:
   2F8B 6B            [ 4]  172 	ld	l,e
   2F8C 26 00         [ 7]  173 	ld	h,#0x00
   2F8E 29            [11]  174 	add	hl, hl
   2F8F 29            [11]  175 	add	hl, hl
   2F90 29            [11]  176 	add	hl, hl
   2F91 29            [11]  177 	add	hl, hl
   2F92 09            [11]  178 	add	hl,bc
   2F93 E3            [19]  179 	ex	(sp), hl
   2F94 E1            [10]  180 	pop	hl
   2F95 E5            [11]  181 	push	hl
   2F96 23            [ 6]  182 	inc	hl
   2F97 23            [ 6]  183 	inc	hl
   2F98 7E            [ 7]  184 	ld	a,(hl)
   2F99 3D            [ 4]  185 	dec	a
   2F9A 20 03         [12]  186 	jr	NZ,00103$
                            187 ;src/entities/explosions.c:51: i++;
   2F9C 1C            [ 4]  188 	inc	e
   2F9D 18 EC         [12]  189 	jr	00101$
   2F9F                     190 00103$:
                            191 ;src/entities/explosions.c:53: explosiones[i].activo=1;
   2F9F 36 01         [10]  192 	ld	(hl),#0x01
                            193 ;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
   2FA1 E1            [10]  194 	pop	hl
   2FA2 E5            [11]  195 	push	hl
   2FA3 DD 7E 06      [19]  196 	ld	a,6 (ix)
   2FA6 77            [ 7]  197 	ld	(hl),a
                            198 ;src/entities/explosions.c:55: explosiones[i].fase=0;
   2FA7 E1            [10]  199 	pop	hl
   2FA8 E5            [11]  200 	push	hl
   2FA9 23            [ 6]  201 	inc	hl
   2FAA 36 00         [10]  202 	ld	(hl),#0x00
                            203 ;src/entities/explosions.c:56: explosiones[i].x=x;
   2FAC E1            [10]  204 	pop	hl
   2FAD E5            [11]  205 	push	hl
   2FAE 23            [ 6]  206 	inc	hl
   2FAF 23            [ 6]  207 	inc	hl
   2FB0 23            [ 6]  208 	inc	hl
   2FB1 DD 7E 04      [19]  209 	ld	a,4 (ix)
   2FB4 77            [ 7]  210 	ld	(hl),a
                            211 ;src/entities/explosions.c:57: explosiones[i].y=y;
   2FB5 DD 7E FE      [19]  212 	ld	a,-2 (ix)
   2FB8 C6 04         [ 7]  213 	add	a, #0x04
   2FBA 6F            [ 4]  214 	ld	l,a
   2FBB DD 7E FF      [19]  215 	ld	a,-1 (ix)
   2FBE CE 00         [ 7]  216 	adc	a, #0x00
   2FC0 67            [ 4]  217 	ld	h,a
   2FC1 DD 7E 05      [19]  218 	ld	a,5 (ix)
   2FC4 77            [ 7]  219 	ld	(hl),a
                            220 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2FC5 DD 7E FE      [19]  221 	ld	a,-2 (ix)
   2FC8 C6 05         [ 7]  222 	add	a, #0x05
   2FCA 6F            [ 4]  223 	ld	l,a
   2FCB DD 7E FF      [19]  224 	ld	a,-1 (ix)
   2FCE CE 00         [ 7]  225 	adc	a, #0x00
   2FD0 67            [ 4]  226 	ld	h,a
                            227 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2FD1 DD 7E FE      [19]  228 	ld	a,-2 (ix)
   2FD4 C6 06         [ 7]  229 	add	a, #0x06
   2FD6 5F            [ 4]  230 	ld	e,a
   2FD7 DD 7E FF      [19]  231 	ld	a,-1 (ix)
   2FDA CE 00         [ 7]  232 	adc	a, #0x00
   2FDC 57            [ 4]  233 	ld	d,a
                            234 ;src/entities/explosions.c:59: if (!tipo){
   2FDD DD 7E 06      [19]  235 	ld	a,6 (ix)
   2FE0 B7            [ 4]  236 	or	a, a
   2FE1 20 07         [12]  237 	jr	NZ,00105$
                            238 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2FE3 36 10         [10]  239 	ld	(hl),#0x10
                            240 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2FE5 3E 04         [ 7]  241 	ld	a,#0x04
   2FE7 12            [ 7]  242 	ld	(de),a
   2FE8 18 05         [12]  243 	jr	00106$
   2FEA                     244 00105$:
                            245 ;src/entities/explosions.c:63: explosiones[i].h=8;
   2FEA 36 08         [10]  246 	ld	(hl),#0x08
                            247 ;src/entities/explosions.c:64: explosiones[i].w=2;
   2FEC 3E 02         [ 7]  248 	ld	a,#0x02
   2FEE 12            [ 7]  249 	ld	(de),a
   2FEF                     250 00106$:
                            251 ;src/entities/explosions.c:66: explosiones_activas++;
   2FEF 21 34 58      [10]  252 	ld	hl, #_explosiones_activas+0
   2FF2 34            [11]  253 	inc	(hl)
   2FF3 DD F9         [10]  254 	ld	sp, ix
   2FF5 DD E1         [14]  255 	pop	ix
   2FF7 C9            [10]  256 	ret
                            257 ;src/entities/explosions.c:73: void update_explosions(){
                            258 ;	---------------------------------
                            259 ; Function update_explosions
                            260 ; ---------------------------------
   2FF8                     261 _update_explosions::
   2FF8 DD E5         [15]  262 	push	ix
   2FFA DD 21 00 00   [14]  263 	ld	ix,#0
   2FFE DD 39         [15]  264 	add	ix,sp
   3000 F5            [11]  265 	push	af
                            266 ;src/entities/explosions.c:75: if (explosiones_activas>0){
   3001 3A 34 58      [13]  267 	ld	a,(#_explosiones_activas + 0)
   3004 B7            [ 4]  268 	or	a, a
   3005 28 36         [12]  269 	jr	Z,00111$
                            270 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   3007 0E 00         [ 7]  271 	ld	c,#0x00
   3009                     272 00109$:
                            273 ;src/entities/explosions.c:77: if (explosiones[i].activo==1){
   3009 69            [ 4]  274 	ld	l,c
   300A 26 00         [ 7]  275 	ld	h,#0x00
   300C 29            [11]  276 	add	hl, hl
   300D 29            [11]  277 	add	hl, hl
   300E 29            [11]  278 	add	hl, hl
   300F 29            [11]  279 	add	hl, hl
   3010 3E 54         [ 7]  280 	ld	a,#<(_explosiones)
   3012 85            [ 4]  281 	add	a, l
   3013 DD 77 FE      [19]  282 	ld	-2 (ix),a
   3016 3E 56         [ 7]  283 	ld	a,#>(_explosiones)
   3018 8C            [ 4]  284 	adc	a, h
   3019 DD 77 FF      [19]  285 	ld	-1 (ix),a
   301C D1            [10]  286 	pop	de
   301D D5            [11]  287 	push	de
   301E 13            [ 6]  288 	inc	de
   301F 13            [ 6]  289 	inc	de
   3020 1A            [ 7]  290 	ld	a,(de)
   3021 3D            [ 4]  291 	dec	a
   3022 20 13         [12]  292 	jr	NZ,00110$
                            293 ;src/entities/explosions.c:78: if (explosiones[i].fase<3){
   3024 E1            [10]  294 	pop	hl
   3025 E5            [11]  295 	push	hl
   3026 23            [ 6]  296 	inc	hl
   3027 46            [ 7]  297 	ld	b,(hl)
   3028 78            [ 4]  298 	ld	a,b
   3029 D6 03         [ 7]  299 	sub	a, #0x03
   302B 30 04         [12]  300 	jr	NC,00102$
                            301 ;src/entities/explosions.c:79: explosiones[i].fase++;
   302D 04            [ 4]  302 	inc	b
   302E 70            [ 7]  303 	ld	(hl),b
   302F 18 06         [12]  304 	jr	00110$
   3031                     305 00102$:
                            306 ;src/entities/explosions.c:83: explosiones[i].activo=0;
   3031 AF            [ 4]  307 	xor	a, a
   3032 12            [ 7]  308 	ld	(de),a
                            309 ;src/entities/explosions.c:84: explosiones_activas--;
   3033 21 34 58      [10]  310 	ld	hl, #_explosiones_activas+0
   3036 35            [11]  311 	dec	(hl)
   3037                     312 00110$:
                            313 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   3037 0C            [ 4]  314 	inc	c
   3038 79            [ 4]  315 	ld	a,c
   3039 D6 1E         [ 7]  316 	sub	a, #0x1E
   303B 38 CC         [12]  317 	jr	C,00109$
   303D                     318 00111$:
   303D DD F9         [10]  319 	ld	sp, ix
   303F DD E1         [14]  320 	pop	ix
   3041 C9            [10]  321 	ret
                            322 ;src/entities/explosions.c:97: void draw_explosions(u8* screen){
                            323 ;	---------------------------------
                            324 ; Function draw_explosions
                            325 ; ---------------------------------
   3042                     326 _draw_explosions::
   3042 DD E5         [15]  327 	push	ix
   3044 DD 21 00 00   [14]  328 	ld	ix,#0
   3048 DD 39         [15]  329 	add	ix,sp
   304A F5            [11]  330 	push	af
   304B 3B            [ 6]  331 	dec	sp
                            332 ;src/entities/explosions.c:103: if (explosiones_activas>0){
   304C 3A 34 58      [13]  333 	ld	a,(#_explosiones_activas + 0)
   304F B7            [ 4]  334 	or	a, a
   3050 CA F3 30      [10]  335 	jp	Z,00108$
                            336 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   3053 0E 00         [ 7]  337 	ld	c,#0x00
   3055                     338 00106$:
                            339 ;src/entities/explosions.c:105: if (explosiones[i].activo==1){
   3055 69            [ 4]  340 	ld	l,c
   3056 26 00         [ 7]  341 	ld	h,#0x00
   3058 29            [11]  342 	add	hl, hl
   3059 29            [11]  343 	add	hl, hl
   305A 29            [11]  344 	add	hl, hl
   305B 29            [11]  345 	add	hl, hl
   305C 3E 54         [ 7]  346 	ld	a,#<(_explosiones)
   305E 85            [ 4]  347 	add	a, l
   305F DD 77 FE      [19]  348 	ld	-2 (ix),a
   3062 3E 56         [ 7]  349 	ld	a,#>(_explosiones)
   3064 8C            [ 4]  350 	adc	a, h
   3065 DD 77 FF      [19]  351 	ld	-1 (ix),a
   3068 DD 6E FE      [19]  352 	ld	l,-2 (ix)
   306B DD 66 FF      [19]  353 	ld	h,-1 (ix)
   306E 23            [ 6]  354 	inc	hl
   306F 23            [ 6]  355 	inc	hl
   3070 7E            [ 7]  356 	ld	a,(hl)
   3071 3D            [ 4]  357 	dec	a
   3072 20 78         [12]  358 	jr	NZ,00107$
                            359 ;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
   3074 DD 6E FE      [19]  360 	ld	l,-2 (ix)
   3077 DD 66 FF      [19]  361 	ld	h,-1 (ix)
   307A 11 04 00      [10]  362 	ld	de, #0x0004
   307D 19            [11]  363 	add	hl, de
   307E 5E            [ 7]  364 	ld	e,(hl)
   307F DD 6E FE      [19]  365 	ld	l,-2 (ix)
   3082 DD 66 FF      [19]  366 	ld	h,-1 (ix)
   3085 23            [ 6]  367 	inc	hl
   3086 23            [ 6]  368 	inc	hl
   3087 23            [ 6]  369 	inc	hl
   3088 66            [ 7]  370 	ld	h,(hl)
   3089 DD 6E 04      [19]  371 	ld	l,4 (ix)
   308C DD 56 05      [19]  372 	ld	d,5 (ix)
   308F C5            [11]  373 	push	bc
   3090 7B            [ 4]  374 	ld	a,e
   3091 F5            [11]  375 	push	af
   3092 33            [ 6]  376 	inc	sp
   3093 E5            [11]  377 	push	hl
   3094 33            [ 6]  378 	inc	sp
   3095 62            [ 4]  379 	ld	h, d
   3096 E5            [11]  380 	push	hl
   3097 CD 5C 50      [17]  381 	call	_cpct_getScreenPtr
   309A F1            [10]  382 	pop	af
   309B F1            [10]  383 	pop	af
   309C C1            [10]  384 	pop	bc
   309D E5            [11]  385 	push	hl
   309E FD E1         [14]  386 	pop	iy
                            387 ;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
   30A0 DD 6E FE      [19]  388 	ld	l,-2 (ix)
   30A3 DD 66 FF      [19]  389 	ld	h,-1 (ix)
   30A6 11 05 00      [10]  390 	ld	de, #0x0005
   30A9 19            [11]  391 	add	hl, de
   30AA 46            [ 7]  392 	ld	b,(hl)
   30AB DD 6E FE      [19]  393 	ld	l,-2 (ix)
   30AE DD 66 FF      [19]  394 	ld	h,-1 (ix)
   30B1 11 06 00      [10]  395 	ld	de, #0x0006
   30B4 19            [11]  396 	add	hl, de
   30B5 7E            [ 7]  397 	ld	a,(hl)
   30B6 DD 77 FD      [19]  398 	ld	-3 (ix),a
   30B9 DD 6E FE      [19]  399 	ld	l,-2 (ix)
   30BC DD 66 FF      [19]  400 	ld	h,-1 (ix)
   30BF 6E            [ 7]  401 	ld	l,(hl)
   30C0 26 00         [ 7]  402 	ld	h,#0x00
   30C2 29            [11]  403 	add	hl, hl
   30C3 29            [11]  404 	add	hl, hl
   30C4 29            [11]  405 	add	hl, hl
   30C5 3E 35         [ 7]  406 	ld	a,#<(_explosion_sprite)
   30C7 85            [ 4]  407 	add	a, l
   30C8 5F            [ 4]  408 	ld	e,a
   30C9 3E 58         [ 7]  409 	ld	a,#>(_explosion_sprite)
   30CB 8C            [ 4]  410 	adc	a, h
   30CC 57            [ 4]  411 	ld	d,a
   30CD DD 6E FE      [19]  412 	ld	l,-2 (ix)
   30D0 DD 66 FF      [19]  413 	ld	h,-1 (ix)
   30D3 23            [ 6]  414 	inc	hl
   30D4 7E            [ 7]  415 	ld	a,(hl)
   30D5 87            [ 4]  416 	add	a, a
   30D6 6F            [ 4]  417 	ld	l,a
   30D7 26 00         [ 7]  418 	ld	h,#0x00
   30D9 19            [11]  419 	add	hl,de
   30DA 5E            [ 7]  420 	ld	e,(hl)
   30DB 23            [ 6]  421 	inc	hl
   30DC 56            [ 7]  422 	ld	d,(hl)
   30DD C5            [11]  423 	push	bc
   30DE C5            [11]  424 	push	bc
   30DF 33            [ 6]  425 	inc	sp
   30E0 DD 7E FD      [19]  426 	ld	a,-3 (ix)
   30E3 F5            [11]  427 	push	af
   30E4 33            [ 6]  428 	inc	sp
   30E5 FD E5         [15]  429 	push	iy
   30E7 D5            [11]  430 	push	de
   30E8 CD 46 4E      [17]  431 	call	_cpct_drawSprite
   30EB C1            [10]  432 	pop	bc
   30EC                     433 00107$:
                            434 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   30EC 0C            [ 4]  435 	inc	c
   30ED 79            [ 4]  436 	ld	a,c
   30EE D6 1E         [ 7]  437 	sub	a, #0x1E
   30F0 DA 55 30      [10]  438 	jp	C,00106$
   30F3                     439 00108$:
   30F3 DD F9         [10]  440 	ld	sp, ix
   30F5 DD E1         [14]  441 	pop	ix
   30F7 C9            [10]  442 	ret
                            443 	.area _CODE
                            444 	.area _INITIALIZER
                            445 	.area _CABS (ABS)
