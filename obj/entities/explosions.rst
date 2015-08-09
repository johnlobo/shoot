                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:52 2015
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
   6087                      29 _explosiones::
   6087                      30 	.ds 480
   6267                      31 _explosiones_activas::
   6267                      32 	.ds 1
   6268                      33 _explosion_sprite::
   6268                      34 	.ds 16
   6278                      35 _explosiones_lastUpdated::
   6278                      36 	.ds 4
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
   2EC7                      65 _init_explosions::
                             66 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2EC7 16 00         [ 7]   67 	ld	d,#0x00
   2EC9                      68 00102$:
                             69 ;src/entities/explosions.c:24: explosiones[i].activo=0;
   2EC9 6A            [ 4]   70 	ld	l,d
   2ECA 26 00         [ 7]   71 	ld	h,#0x00
   2ECC 29            [11]   72 	add	hl, hl
   2ECD 29            [11]   73 	add	hl, hl
   2ECE 29            [11]   74 	add	hl, hl
   2ECF 29            [11]   75 	add	hl, hl
   2ED0 3E 87         [ 7]   76 	ld	a,#<(_explosiones)
   2ED2 85            [ 4]   77 	add	a, l
   2ED3 4F            [ 4]   78 	ld	c,a
   2ED4 3E 60         [ 7]   79 	ld	a,#>(_explosiones)
   2ED6 8C            [ 4]   80 	adc	a, h
   2ED7 47            [ 4]   81 	ld	b,a
   2ED8 69            [ 4]   82 	ld	l, c
   2ED9 60            [ 4]   83 	ld	h, b
   2EDA 23            [ 6]   84 	inc	hl
   2EDB 23            [ 6]   85 	inc	hl
   2EDC 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/explosions.c:25: explosiones[i].tipo=0;
   2EDE AF            [ 4]   88 	xor	a, a
   2EDF 02            [ 7]   89 	ld	(bc),a
                             90 ;src/entities/explosions.c:26: explosiones[i].fase=0;
   2EE0 69            [ 4]   91 	ld	l, c
   2EE1 60            [ 4]   92 	ld	h, b
   2EE2 23            [ 6]   93 	inc	hl
   2EE3 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/explosions.c:27: explosiones[i].x=0;
   2EE5 69            [ 4]   96 	ld	l, c
   2EE6 60            [ 4]   97 	ld	h, b
   2EE7 23            [ 6]   98 	inc	hl
   2EE8 23            [ 6]   99 	inc	hl
   2EE9 23            [ 6]  100 	inc	hl
   2EEA 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/explosions.c:28: explosiones[i].y=0;
   2EEC 21 04 00      [10]  103 	ld	hl,#0x0004
   2EEF 09            [11]  104 	add	hl,bc
   2EF0 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/explosions.c:29: explosiones[i].h=0;
   2EF2 21 05 00      [10]  107 	ld	hl,#0x0005
   2EF5 09            [11]  108 	add	hl,bc
   2EF6 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/explosions.c:30: explosiones[i].w=0;
   2EF8 21 06 00      [10]  111 	ld	hl,#0x0006
   2EFB 09            [11]  112 	add	hl,bc
   2EFC 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/explosions.c:31: explosiones[i].lastmoved=0;
   2EFE 21 0C 00      [10]  115 	ld	hl,#0x000C
   2F01 09            [11]  116 	add	hl,bc
   2F02 AF            [ 4]  117 	xor	a, a
   2F03 77            [ 7]  118 	ld	(hl), a
   2F04 23            [ 6]  119 	inc	hl
   2F05 77            [ 7]  120 	ld	(hl), a
   2F06 23            [ 6]  121 	inc	hl
   2F07 AF            [ 4]  122 	xor	a, a
   2F08 77            [ 7]  123 	ld	(hl), a
   2F09 23            [ 6]  124 	inc	hl
   2F0A 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2F0B 14            [ 4]  127 	inc	d
   2F0C 7A            [ 4]  128 	ld	a,d
   2F0D D6 1E         [ 7]  129 	sub	a, #0x1E
   2F0F 38 B8         [12]  130 	jr	C,00102$
                            131 ;src/entities/explosions.c:33: explosiones_activas=0;
   2F11 21 67 62      [10]  132 	ld	hl,#_explosiones_activas + 0
   2F14 36 00         [10]  133 	ld	(hl), #0x00
                            134 ;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
   2F16 21 E8 43      [10]  135 	ld	hl,#_explosion02000
   2F19 22 68 62      [16]  136 	ld	(_explosion_sprite), hl
                            137 ;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
   2F1C 21 2A 44      [10]  138 	ld	hl,#_explosion02001
   2F1F 22 6A 62      [16]  139 	ld	((_explosion_sprite + 0x0002)), hl
                            140 ;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
   2F22 21 6C 44      [10]  141 	ld	hl,#_explosion02002
   2F25 22 6C 62      [16]  142 	ld	((_explosion_sprite + 0x0004)), hl
                            143 ;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
   2F28 21 AE 44      [10]  144 	ld	hl,#_explosion02003
   2F2B 22 6E 62      [16]  145 	ld	((_explosion_sprite + 0x0006)), hl
                            146 ;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
   2F2E 21 32 45      [10]  147 	ld	hl,#_toque000
   2F31 22 70 62      [16]  148 	ld	((_explosion_sprite + 0x0008)), hl
                            149 ;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
   2F34 21 44 45      [10]  150 	ld	hl,#_toque001
   2F37 22 72 62      [16]  151 	ld	((_explosion_sprite + 0x000a)), hl
                            152 ;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
   2F3A 21 56 45      [10]  153 	ld	hl,#_toque002
   2F3D 22 74 62      [16]  154 	ld	((_explosion_sprite + 0x000c)), hl
                            155 ;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
   2F40 21 68 45      [10]  156 	ld	hl,#_toque003
   2F43 22 76 62      [16]  157 	ld	((_explosion_sprite + 0x000e)), hl
   2F46 C9            [10]  158 	ret
                            159 ;src/entities/explosions.c:47: void create_explosion(u8 x, u8 y, u8 tipo){
                            160 ;	---------------------------------
                            161 ; Function create_explosion
                            162 ; ---------------------------------
   2F47                     163 _create_explosion::
   2F47 DD E5         [15]  164 	push	ix
   2F49 DD 21 00 00   [14]  165 	ld	ix,#0
   2F4D DD 39         [15]  166 	add	ix,sp
   2F4F F5            [11]  167 	push	af
                            168 ;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
   2F50 01 87 60      [10]  169 	ld	bc,#_explosiones+0
   2F53 1E 00         [ 7]  170 	ld	e,#0x00
   2F55                     171 00101$:
   2F55 6B            [ 4]  172 	ld	l,e
   2F56 26 00         [ 7]  173 	ld	h,#0x00
   2F58 29            [11]  174 	add	hl, hl
   2F59 29            [11]  175 	add	hl, hl
   2F5A 29            [11]  176 	add	hl, hl
   2F5B 29            [11]  177 	add	hl, hl
   2F5C 09            [11]  178 	add	hl,bc
   2F5D E3            [19]  179 	ex	(sp), hl
   2F5E E1            [10]  180 	pop	hl
   2F5F E5            [11]  181 	push	hl
   2F60 23            [ 6]  182 	inc	hl
   2F61 23            [ 6]  183 	inc	hl
   2F62 7E            [ 7]  184 	ld	a,(hl)
   2F63 3D            [ 4]  185 	dec	a
   2F64 20 03         [12]  186 	jr	NZ,00103$
                            187 ;src/entities/explosions.c:51: i++;
   2F66 1C            [ 4]  188 	inc	e
   2F67 18 EC         [12]  189 	jr	00101$
   2F69                     190 00103$:
                            191 ;src/entities/explosions.c:53: explosiones[i].activo=1;
   2F69 36 01         [10]  192 	ld	(hl),#0x01
                            193 ;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
   2F6B E1            [10]  194 	pop	hl
   2F6C E5            [11]  195 	push	hl
   2F6D DD 7E 06      [19]  196 	ld	a,6 (ix)
   2F70 77            [ 7]  197 	ld	(hl),a
                            198 ;src/entities/explosions.c:55: explosiones[i].fase=0;
   2F71 E1            [10]  199 	pop	hl
   2F72 E5            [11]  200 	push	hl
   2F73 23            [ 6]  201 	inc	hl
   2F74 36 00         [10]  202 	ld	(hl),#0x00
                            203 ;src/entities/explosions.c:56: explosiones[i].x=x;
   2F76 E1            [10]  204 	pop	hl
   2F77 E5            [11]  205 	push	hl
   2F78 23            [ 6]  206 	inc	hl
   2F79 23            [ 6]  207 	inc	hl
   2F7A 23            [ 6]  208 	inc	hl
   2F7B DD 7E 04      [19]  209 	ld	a,4 (ix)
   2F7E 77            [ 7]  210 	ld	(hl),a
                            211 ;src/entities/explosions.c:57: explosiones[i].y=y;
   2F7F DD 7E FE      [19]  212 	ld	a,-2 (ix)
   2F82 C6 04         [ 7]  213 	add	a, #0x04
   2F84 6F            [ 4]  214 	ld	l,a
   2F85 DD 7E FF      [19]  215 	ld	a,-1 (ix)
   2F88 CE 00         [ 7]  216 	adc	a, #0x00
   2F8A 67            [ 4]  217 	ld	h,a
   2F8B DD 7E 05      [19]  218 	ld	a,5 (ix)
   2F8E 77            [ 7]  219 	ld	(hl),a
                            220 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2F8F DD 7E FE      [19]  221 	ld	a,-2 (ix)
   2F92 C6 05         [ 7]  222 	add	a, #0x05
   2F94 6F            [ 4]  223 	ld	l,a
   2F95 DD 7E FF      [19]  224 	ld	a,-1 (ix)
   2F98 CE 00         [ 7]  225 	adc	a, #0x00
   2F9A 67            [ 4]  226 	ld	h,a
                            227 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2F9B DD 7E FE      [19]  228 	ld	a,-2 (ix)
   2F9E C6 06         [ 7]  229 	add	a, #0x06
   2FA0 5F            [ 4]  230 	ld	e,a
   2FA1 DD 7E FF      [19]  231 	ld	a,-1 (ix)
   2FA4 CE 00         [ 7]  232 	adc	a, #0x00
   2FA6 57            [ 4]  233 	ld	d,a
                            234 ;src/entities/explosions.c:59: if (!tipo){
   2FA7 DD 7E 06      [19]  235 	ld	a,6 (ix)
   2FAA B7            [ 4]  236 	or	a, a
   2FAB 20 07         [12]  237 	jr	NZ,00105$
                            238 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2FAD 36 10         [10]  239 	ld	(hl),#0x10
                            240 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2FAF 3E 04         [ 7]  241 	ld	a,#0x04
   2FB1 12            [ 7]  242 	ld	(de),a
   2FB2 18 05         [12]  243 	jr	00106$
   2FB4                     244 00105$:
                            245 ;src/entities/explosions.c:63: explosiones[i].h=8;
   2FB4 36 08         [10]  246 	ld	(hl),#0x08
                            247 ;src/entities/explosions.c:64: explosiones[i].w=2;
   2FB6 3E 02         [ 7]  248 	ld	a,#0x02
   2FB8 12            [ 7]  249 	ld	(de),a
   2FB9                     250 00106$:
                            251 ;src/entities/explosions.c:66: explosiones_activas++;
   2FB9 21 67 62      [10]  252 	ld	hl, #_explosiones_activas+0
   2FBC 34            [11]  253 	inc	(hl)
   2FBD DD F9         [10]  254 	ld	sp, ix
   2FBF DD E1         [14]  255 	pop	ix
   2FC1 C9            [10]  256 	ret
                            257 ;src/entities/explosions.c:73: void update_explosions(){
                            258 ;	---------------------------------
                            259 ; Function update_explosions
                            260 ; ---------------------------------
   2FC2                     261 _update_explosions::
   2FC2 DD E5         [15]  262 	push	ix
   2FC4 DD 21 00 00   [14]  263 	ld	ix,#0
   2FC8 DD 39         [15]  264 	add	ix,sp
   2FCA F5            [11]  265 	push	af
                            266 ;src/entities/explosions.c:75: if (explosiones_activas>0){
   2FCB 3A 67 62      [13]  267 	ld	a,(#_explosiones_activas + 0)
   2FCE B7            [ 4]  268 	or	a, a
   2FCF 28 36         [12]  269 	jr	Z,00111$
                            270 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   2FD1 0E 00         [ 7]  271 	ld	c,#0x00
   2FD3                     272 00109$:
                            273 ;src/entities/explosions.c:77: if (explosiones[i].activo==1){
   2FD3 69            [ 4]  274 	ld	l,c
   2FD4 26 00         [ 7]  275 	ld	h,#0x00
   2FD6 29            [11]  276 	add	hl, hl
   2FD7 29            [11]  277 	add	hl, hl
   2FD8 29            [11]  278 	add	hl, hl
   2FD9 29            [11]  279 	add	hl, hl
   2FDA 3E 87         [ 7]  280 	ld	a,#<(_explosiones)
   2FDC 85            [ 4]  281 	add	a, l
   2FDD DD 77 FE      [19]  282 	ld	-2 (ix),a
   2FE0 3E 60         [ 7]  283 	ld	a,#>(_explosiones)
   2FE2 8C            [ 4]  284 	adc	a, h
   2FE3 DD 77 FF      [19]  285 	ld	-1 (ix),a
   2FE6 D1            [10]  286 	pop	de
   2FE7 D5            [11]  287 	push	de
   2FE8 13            [ 6]  288 	inc	de
   2FE9 13            [ 6]  289 	inc	de
   2FEA 1A            [ 7]  290 	ld	a,(de)
   2FEB 3D            [ 4]  291 	dec	a
   2FEC 20 13         [12]  292 	jr	NZ,00110$
                            293 ;src/entities/explosions.c:78: if (explosiones[i].fase<3){
   2FEE E1            [10]  294 	pop	hl
   2FEF E5            [11]  295 	push	hl
   2FF0 23            [ 6]  296 	inc	hl
   2FF1 46            [ 7]  297 	ld	b,(hl)
   2FF2 78            [ 4]  298 	ld	a,b
   2FF3 D6 03         [ 7]  299 	sub	a, #0x03
   2FF5 30 04         [12]  300 	jr	NC,00102$
                            301 ;src/entities/explosions.c:79: explosiones[i].fase++;
   2FF7 04            [ 4]  302 	inc	b
   2FF8 70            [ 7]  303 	ld	(hl),b
   2FF9 18 06         [12]  304 	jr	00110$
   2FFB                     305 00102$:
                            306 ;src/entities/explosions.c:83: explosiones[i].activo=0;
   2FFB AF            [ 4]  307 	xor	a, a
   2FFC 12            [ 7]  308 	ld	(de),a
                            309 ;src/entities/explosions.c:84: explosiones_activas--;
   2FFD 21 67 62      [10]  310 	ld	hl, #_explosiones_activas+0
   3000 35            [11]  311 	dec	(hl)
   3001                     312 00110$:
                            313 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   3001 0C            [ 4]  314 	inc	c
   3002 79            [ 4]  315 	ld	a,c
   3003 D6 1E         [ 7]  316 	sub	a, #0x1E
   3005 38 CC         [12]  317 	jr	C,00109$
   3007                     318 00111$:
   3007 DD F9         [10]  319 	ld	sp, ix
   3009 DD E1         [14]  320 	pop	ix
   300B C9            [10]  321 	ret
                            322 ;src/entities/explosions.c:97: void draw_explosions(u8* screen){
                            323 ;	---------------------------------
                            324 ; Function draw_explosions
                            325 ; ---------------------------------
   300C                     326 _draw_explosions::
   300C DD E5         [15]  327 	push	ix
   300E DD 21 00 00   [14]  328 	ld	ix,#0
   3012 DD 39         [15]  329 	add	ix,sp
   3014 F5            [11]  330 	push	af
   3015 3B            [ 6]  331 	dec	sp
                            332 ;src/entities/explosions.c:103: if (explosiones_activas>0){
   3016 3A 67 62      [13]  333 	ld	a,(#_explosiones_activas + 0)
   3019 B7            [ 4]  334 	or	a, a
   301A CA BB 30      [10]  335 	jp	Z,00108$
                            336 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   301D 0E 00         [ 7]  337 	ld	c,#0x00
   301F                     338 00106$:
                            339 ;src/entities/explosions.c:105: if (explosiones[i].activo==1){
   301F 69            [ 4]  340 	ld	l,c
   3020 26 00         [ 7]  341 	ld	h,#0x00
   3022 29            [11]  342 	add	hl, hl
   3023 29            [11]  343 	add	hl, hl
   3024 29            [11]  344 	add	hl, hl
   3025 29            [11]  345 	add	hl, hl
   3026 3E 87         [ 7]  346 	ld	a,#<(_explosiones)
   3028 85            [ 4]  347 	add	a, l
   3029 DD 77 FE      [19]  348 	ld	-2 (ix),a
   302C 3E 60         [ 7]  349 	ld	a,#>(_explosiones)
   302E 8C            [ 4]  350 	adc	a, h
   302F DD 77 FF      [19]  351 	ld	-1 (ix),a
   3032 DD 6E FE      [19]  352 	ld	l,-2 (ix)
   3035 DD 66 FF      [19]  353 	ld	h,-1 (ix)
   3038 23            [ 6]  354 	inc	hl
   3039 23            [ 6]  355 	inc	hl
   303A 7E            [ 7]  356 	ld	a,(hl)
   303B 3D            [ 4]  357 	dec	a
   303C 20 76         [12]  358 	jr	NZ,00107$
                            359 ;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
   303E DD 6E FE      [19]  360 	ld	l,-2 (ix)
   3041 DD 66 FF      [19]  361 	ld	h,-1 (ix)
   3044 11 04 00      [10]  362 	ld	de, #0x0004
   3047 19            [11]  363 	add	hl, de
   3048 5E            [ 7]  364 	ld	e,(hl)
   3049 DD 6E FE      [19]  365 	ld	l,-2 (ix)
   304C DD 66 FF      [19]  366 	ld	h,-1 (ix)
   304F 23            [ 6]  367 	inc	hl
   3050 23            [ 6]  368 	inc	hl
   3051 23            [ 6]  369 	inc	hl
   3052 66            [ 7]  370 	ld	h,(hl)
   3053 DD 6E 04      [19]  371 	ld	l,4 (ix)
   3056 DD 56 05      [19]  372 	ld	d,5 (ix)
   3059 C5            [11]  373 	push	bc
   305A 7B            [ 4]  374 	ld	a,e
   305B F5            [11]  375 	push	af
   305C 33            [ 6]  376 	inc	sp
   305D E5            [11]  377 	push	hl
   305E 33            [ 6]  378 	inc	sp
   305F 62            [ 4]  379 	ld	h, d
   3060 E5            [11]  380 	push	hl
   3061 CD A0 4F      [17]  381 	call	_cpct_getScreenPtr
   3064 C1            [10]  382 	pop	bc
   3065 E5            [11]  383 	push	hl
   3066 FD E1         [14]  384 	pop	iy
                            385 ;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
   3068 DD 6E FE      [19]  386 	ld	l,-2 (ix)
   306B DD 66 FF      [19]  387 	ld	h,-1 (ix)
   306E 11 05 00      [10]  388 	ld	de, #0x0005
   3071 19            [11]  389 	add	hl, de
   3072 46            [ 7]  390 	ld	b,(hl)
   3073 DD 6E FE      [19]  391 	ld	l,-2 (ix)
   3076 DD 66 FF      [19]  392 	ld	h,-1 (ix)
   3079 11 06 00      [10]  393 	ld	de, #0x0006
   307C 19            [11]  394 	add	hl, de
   307D 7E            [ 7]  395 	ld	a,(hl)
   307E DD 77 FD      [19]  396 	ld	-3 (ix),a
   3081 DD 6E FE      [19]  397 	ld	l,-2 (ix)
   3084 DD 66 FF      [19]  398 	ld	h,-1 (ix)
   3087 6E            [ 7]  399 	ld	l,(hl)
   3088 26 00         [ 7]  400 	ld	h,#0x00
   308A 29            [11]  401 	add	hl, hl
   308B 29            [11]  402 	add	hl, hl
   308C 29            [11]  403 	add	hl, hl
   308D 3E 68         [ 7]  404 	ld	a,#<(_explosion_sprite)
   308F 85            [ 4]  405 	add	a, l
   3090 5F            [ 4]  406 	ld	e,a
   3091 3E 62         [ 7]  407 	ld	a,#>(_explosion_sprite)
   3093 8C            [ 4]  408 	adc	a, h
   3094 57            [ 4]  409 	ld	d,a
   3095 DD 6E FE      [19]  410 	ld	l,-2 (ix)
   3098 DD 66 FF      [19]  411 	ld	h,-1 (ix)
   309B 23            [ 6]  412 	inc	hl
   309C 7E            [ 7]  413 	ld	a,(hl)
   309D 87            [ 4]  414 	add	a, a
   309E 6F            [ 4]  415 	ld	l,a
   309F 26 00         [ 7]  416 	ld	h,#0x00
   30A1 19            [11]  417 	add	hl,de
   30A2 5E            [ 7]  418 	ld	e,(hl)
   30A3 23            [ 6]  419 	inc	hl
   30A4 56            [ 7]  420 	ld	d,(hl)
   30A5 C5            [11]  421 	push	bc
   30A6 C5            [11]  422 	push	bc
   30A7 33            [ 6]  423 	inc	sp
   30A8 DD 7E FD      [19]  424 	ld	a,-3 (ix)
   30AB F5            [11]  425 	push	af
   30AC 33            [ 6]  426 	inc	sp
   30AD FD E5         [15]  427 	push	iy
   30AF D5            [11]  428 	push	de
   30B0 CD 5B 4C      [17]  429 	call	_cpct_drawSprite
   30B3 C1            [10]  430 	pop	bc
   30B4                     431 00107$:
                            432 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   30B4 0C            [ 4]  433 	inc	c
   30B5 79            [ 4]  434 	ld	a,c
   30B6 D6 1E         [ 7]  435 	sub	a, #0x1E
   30B8 DA 1F 30      [10]  436 	jp	C,00106$
   30BB                     437 00108$:
   30BB DD F9         [10]  438 	ld	sp, ix
   30BD DD E1         [14]  439 	pop	ix
   30BF C9            [10]  440 	ret
                            441 	.area _CODE
                            442 	.area _INITIALIZER
                            443 	.area _CABS (ABS)
