                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
                              4 ; This file was generated Mon Jul 20 23:41:04 2015
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
   5309                      29 _explosiones::
   5309                      30 	.ds 480
   54E9                      31 _explosiones_activas::
   54E9                      32 	.ds 1
   54EA                      33 _explosion_sprite::
   54EA                      34 	.ds 16
   54FA                      35 _explosiones_lastUpdated::
   54FA                      36 	.ds 4
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
   2DC1                      65 _init_explosions::
                             66 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2DC1 16 00         [ 7]   67 	ld	d,#0x00
   2DC3                      68 00102$:
                             69 ;src/entities/explosions.c:24: explosiones[i].activo=0;
   2DC3 6A            [ 4]   70 	ld	l,d
   2DC4 26 00         [ 7]   71 	ld	h,#0x00
   2DC6 29            [11]   72 	add	hl, hl
   2DC7 29            [11]   73 	add	hl, hl
   2DC8 29            [11]   74 	add	hl, hl
   2DC9 29            [11]   75 	add	hl, hl
   2DCA 3E 09         [ 7]   76 	ld	a,#<(_explosiones)
   2DCC 85            [ 4]   77 	add	a, l
   2DCD 4F            [ 4]   78 	ld	c,a
   2DCE 3E 53         [ 7]   79 	ld	a,#>(_explosiones)
   2DD0 8C            [ 4]   80 	adc	a, h
   2DD1 47            [ 4]   81 	ld	b,a
   2DD2 69            [ 4]   82 	ld	l, c
   2DD3 60            [ 4]   83 	ld	h, b
   2DD4 23            [ 6]   84 	inc	hl
   2DD5 23            [ 6]   85 	inc	hl
   2DD6 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/explosions.c:25: explosiones[i].tipo=0;
   2DD8 AF            [ 4]   88 	xor	a, a
   2DD9 02            [ 7]   89 	ld	(bc),a
                             90 ;src/entities/explosions.c:26: explosiones[i].fase=0;
   2DDA 69            [ 4]   91 	ld	l, c
   2DDB 60            [ 4]   92 	ld	h, b
   2DDC 23            [ 6]   93 	inc	hl
   2DDD 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/explosions.c:27: explosiones[i].x=0;
   2DDF 69            [ 4]   96 	ld	l, c
   2DE0 60            [ 4]   97 	ld	h, b
   2DE1 23            [ 6]   98 	inc	hl
   2DE2 23            [ 6]   99 	inc	hl
   2DE3 23            [ 6]  100 	inc	hl
   2DE4 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/explosions.c:28: explosiones[i].y=0;
   2DE6 21 04 00      [10]  103 	ld	hl,#0x0004
   2DE9 09            [11]  104 	add	hl,bc
   2DEA 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/explosions.c:29: explosiones[i].h=0;
   2DEC 21 05 00      [10]  107 	ld	hl,#0x0005
   2DEF 09            [11]  108 	add	hl,bc
   2DF0 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/explosions.c:30: explosiones[i].w=0;
   2DF2 21 06 00      [10]  111 	ld	hl,#0x0006
   2DF5 09            [11]  112 	add	hl,bc
   2DF6 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/explosions.c:31: explosiones[i].lastmoved=0;
   2DF8 21 0C 00      [10]  115 	ld	hl,#0x000C
   2DFB 09            [11]  116 	add	hl,bc
   2DFC AF            [ 4]  117 	xor	a, a
   2DFD 77            [ 7]  118 	ld	(hl), a
   2DFE 23            [ 6]  119 	inc	hl
   2DFF 77            [ 7]  120 	ld	(hl), a
   2E00 23            [ 6]  121 	inc	hl
   2E01 AF            [ 4]  122 	xor	a, a
   2E02 77            [ 7]  123 	ld	(hl), a
   2E03 23            [ 6]  124 	inc	hl
   2E04 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/explosions.c:23: for (i=0;i<MAX_EXPLOSIONES;i++){
   2E05 14            [ 4]  127 	inc	d
   2E06 7A            [ 4]  128 	ld	a,d
   2E07 D6 1E         [ 7]  129 	sub	a, #0x1E
   2E09 38 B8         [12]  130 	jr	C,00102$
                            131 ;src/entities/explosions.c:33: explosiones_activas=0;
   2E0B 21 E9 54      [10]  132 	ld	hl,#_explosiones_activas + 0
   2E0E 36 00         [10]  133 	ld	(hl), #0x00
                            134 ;src/entities/explosions.c:34: explosion_sprite[0][0]= (u8*) explosion02000;
   2E10 21 95 40      [10]  135 	ld	hl,#_explosion02000
   2E13 22 EA 54      [16]  136 	ld	(_explosion_sprite), hl
                            137 ;src/entities/explosions.c:35: explosion_sprite[0][1]= (u8*) explosion02001;
   2E16 21 D7 40      [10]  138 	ld	hl,#_explosion02001
   2E19 22 EC 54      [16]  139 	ld	((_explosion_sprite + 0x0002)), hl
                            140 ;src/entities/explosions.c:36: explosion_sprite[0][2]= (u8*) explosion02002;
   2E1C 21 19 41      [10]  141 	ld	hl,#_explosion02002
   2E1F 22 EE 54      [16]  142 	ld	((_explosion_sprite + 0x0004)), hl
                            143 ;src/entities/explosions.c:37: explosion_sprite[0][3]= (u8*) explosion02003;
   2E22 21 5B 41      [10]  144 	ld	hl,#_explosion02003
   2E25 22 F0 54      [16]  145 	ld	((_explosion_sprite + 0x0006)), hl
                            146 ;src/entities/explosions.c:38: explosion_sprite[1][0]= (u8*) toque000;
   2E28 21 DF 41      [10]  147 	ld	hl,#_toque000
   2E2B 22 F2 54      [16]  148 	ld	((_explosion_sprite + 0x0008)), hl
                            149 ;src/entities/explosions.c:39: explosion_sprite[1][1]= (u8*) toque001;
   2E2E 21 F1 41      [10]  150 	ld	hl,#_toque001
   2E31 22 F4 54      [16]  151 	ld	((_explosion_sprite + 0x000a)), hl
                            152 ;src/entities/explosions.c:40: explosion_sprite[1][2]= (u8*) toque002;
   2E34 21 03 42      [10]  153 	ld	hl,#_toque002
   2E37 22 F6 54      [16]  154 	ld	((_explosion_sprite + 0x000c)), hl
                            155 ;src/entities/explosions.c:41: explosion_sprite[1][3]= (u8*) toque003;
   2E3A 21 15 42      [10]  156 	ld	hl,#_toque003
   2E3D 22 F8 54      [16]  157 	ld	((_explosion_sprite + 0x000e)), hl
   2E40 C9            [10]  158 	ret
                            159 ;src/entities/explosions.c:47: void create_explosion(u8 tipo, u8 x, u8 y){
                            160 ;	---------------------------------
                            161 ; Function create_explosion
                            162 ; ---------------------------------
   2E41                     163 _create_explosion::
   2E41 DD E5         [15]  164 	push	ix
   2E43 DD 21 00 00   [14]  165 	ld	ix,#0
   2E47 DD 39         [15]  166 	add	ix,sp
   2E49 F5            [11]  167 	push	af
                            168 ;src/entities/explosions.c:50: while (explosiones[i].activo==1) { 
   2E4A 01 09 53      [10]  169 	ld	bc,#_explosiones+0
   2E4D 1E 00         [ 7]  170 	ld	e,#0x00
   2E4F                     171 00101$:
   2E4F 6B            [ 4]  172 	ld	l,e
   2E50 26 00         [ 7]  173 	ld	h,#0x00
   2E52 29            [11]  174 	add	hl, hl
   2E53 29            [11]  175 	add	hl, hl
   2E54 29            [11]  176 	add	hl, hl
   2E55 29            [11]  177 	add	hl, hl
   2E56 09            [11]  178 	add	hl,bc
   2E57 E3            [19]  179 	ex	(sp), hl
   2E58 E1            [10]  180 	pop	hl
   2E59 E5            [11]  181 	push	hl
   2E5A 23            [ 6]  182 	inc	hl
   2E5B 23            [ 6]  183 	inc	hl
   2E5C 7E            [ 7]  184 	ld	a,(hl)
   2E5D 3D            [ 4]  185 	dec	a
   2E5E 20 03         [12]  186 	jr	NZ,00103$
                            187 ;src/entities/explosions.c:51: i++;
   2E60 1C            [ 4]  188 	inc	e
   2E61 18 EC         [12]  189 	jr	00101$
   2E63                     190 00103$:
                            191 ;src/entities/explosions.c:53: explosiones[i].activo=1;
   2E63 36 01         [10]  192 	ld	(hl),#0x01
                            193 ;src/entities/explosions.c:54: explosiones[i].tipo=tipo;
   2E65 E1            [10]  194 	pop	hl
   2E66 E5            [11]  195 	push	hl
   2E67 DD 7E 04      [19]  196 	ld	a,4 (ix)
   2E6A 77            [ 7]  197 	ld	(hl),a
                            198 ;src/entities/explosions.c:55: explosiones[i].fase=0;
   2E6B E1            [10]  199 	pop	hl
   2E6C E5            [11]  200 	push	hl
   2E6D 23            [ 6]  201 	inc	hl
   2E6E 36 00         [10]  202 	ld	(hl),#0x00
                            203 ;src/entities/explosions.c:56: explosiones[i].x=x;
   2E70 E1            [10]  204 	pop	hl
   2E71 E5            [11]  205 	push	hl
   2E72 23            [ 6]  206 	inc	hl
   2E73 23            [ 6]  207 	inc	hl
   2E74 23            [ 6]  208 	inc	hl
   2E75 DD 7E 05      [19]  209 	ld	a,5 (ix)
   2E78 77            [ 7]  210 	ld	(hl),a
                            211 ;src/entities/explosions.c:57: explosiones[i].y=y;
   2E79 DD 7E FE      [19]  212 	ld	a,-2 (ix)
   2E7C C6 04         [ 7]  213 	add	a, #0x04
   2E7E 6F            [ 4]  214 	ld	l,a
   2E7F DD 7E FF      [19]  215 	ld	a,-1 (ix)
   2E82 CE 00         [ 7]  216 	adc	a, #0x00
   2E84 67            [ 4]  217 	ld	h,a
   2E85 DD 7E 06      [19]  218 	ld	a,6 (ix)
   2E88 77            [ 7]  219 	ld	(hl),a
                            220 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2E89 DD 7E FE      [19]  221 	ld	a,-2 (ix)
   2E8C C6 05         [ 7]  222 	add	a, #0x05
   2E8E 6F            [ 4]  223 	ld	l,a
   2E8F DD 7E FF      [19]  224 	ld	a,-1 (ix)
   2E92 CE 00         [ 7]  225 	adc	a, #0x00
   2E94 67            [ 4]  226 	ld	h,a
                            227 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2E95 DD 7E FE      [19]  228 	ld	a,-2 (ix)
   2E98 C6 06         [ 7]  229 	add	a, #0x06
   2E9A 5F            [ 4]  230 	ld	e,a
   2E9B DD 7E FF      [19]  231 	ld	a,-1 (ix)
   2E9E CE 00         [ 7]  232 	adc	a, #0x00
   2EA0 57            [ 4]  233 	ld	d,a
                            234 ;src/entities/explosions.c:59: if (!tipo){
   2EA1 DD 7E 04      [19]  235 	ld	a,4 (ix)
   2EA4 B7            [ 4]  236 	or	a, a
   2EA5 20 07         [12]  237 	jr	NZ,00105$
                            238 ;src/entities/explosions.c:60: explosiones[i].h=16;
   2EA7 36 10         [10]  239 	ld	(hl),#0x10
                            240 ;src/entities/explosions.c:61: explosiones[i].w=4;
   2EA9 3E 04         [ 7]  241 	ld	a,#0x04
   2EAB 12            [ 7]  242 	ld	(de),a
   2EAC 18 05         [12]  243 	jr	00106$
   2EAE                     244 00105$:
                            245 ;src/entities/explosions.c:63: explosiones[i].h=8;
   2EAE 36 08         [10]  246 	ld	(hl),#0x08
                            247 ;src/entities/explosions.c:64: explosiones[i].w=2;
   2EB0 3E 02         [ 7]  248 	ld	a,#0x02
   2EB2 12            [ 7]  249 	ld	(de),a
   2EB3                     250 00106$:
                            251 ;src/entities/explosions.c:66: explosiones_activas++;
   2EB3 21 E9 54      [10]  252 	ld	hl, #_explosiones_activas+0
   2EB6 34            [11]  253 	inc	(hl)
   2EB7 DD F9         [10]  254 	ld	sp, ix
   2EB9 DD E1         [14]  255 	pop	ix
   2EBB C9            [10]  256 	ret
                            257 ;src/entities/explosions.c:73: void update_explosions(){
                            258 ;	---------------------------------
                            259 ; Function update_explosions
                            260 ; ---------------------------------
   2EBC                     261 _update_explosions::
   2EBC DD E5         [15]  262 	push	ix
   2EBE DD 21 00 00   [14]  263 	ld	ix,#0
   2EC2 DD 39         [15]  264 	add	ix,sp
   2EC4 F5            [11]  265 	push	af
                            266 ;src/entities/explosions.c:75: if (explosiones_activas>0){
   2EC5 3A E9 54      [13]  267 	ld	a,(#_explosiones_activas + 0)
   2EC8 B7            [ 4]  268 	or	a, a
   2EC9 28 36         [12]  269 	jr	Z,00111$
                            270 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   2ECB 0E 00         [ 7]  271 	ld	c,#0x00
   2ECD                     272 00109$:
                            273 ;src/entities/explosions.c:77: if (explosiones[i].activo==1){
   2ECD 69            [ 4]  274 	ld	l,c
   2ECE 26 00         [ 7]  275 	ld	h,#0x00
   2ED0 29            [11]  276 	add	hl, hl
   2ED1 29            [11]  277 	add	hl, hl
   2ED2 29            [11]  278 	add	hl, hl
   2ED3 29            [11]  279 	add	hl, hl
   2ED4 3E 09         [ 7]  280 	ld	a,#<(_explosiones)
   2ED6 85            [ 4]  281 	add	a, l
   2ED7 DD 77 FE      [19]  282 	ld	-2 (ix),a
   2EDA 3E 53         [ 7]  283 	ld	a,#>(_explosiones)
   2EDC 8C            [ 4]  284 	adc	a, h
   2EDD DD 77 FF      [19]  285 	ld	-1 (ix),a
   2EE0 D1            [10]  286 	pop	de
   2EE1 D5            [11]  287 	push	de
   2EE2 13            [ 6]  288 	inc	de
   2EE3 13            [ 6]  289 	inc	de
   2EE4 1A            [ 7]  290 	ld	a,(de)
   2EE5 3D            [ 4]  291 	dec	a
   2EE6 20 13         [12]  292 	jr	NZ,00110$
                            293 ;src/entities/explosions.c:78: if (explosiones[i].fase<3){
   2EE8 E1            [10]  294 	pop	hl
   2EE9 E5            [11]  295 	push	hl
   2EEA 23            [ 6]  296 	inc	hl
   2EEB 46            [ 7]  297 	ld	b,(hl)
   2EEC 78            [ 4]  298 	ld	a,b
   2EED D6 03         [ 7]  299 	sub	a, #0x03
   2EEF 30 04         [12]  300 	jr	NC,00102$
                            301 ;src/entities/explosions.c:79: explosiones[i].fase++;
   2EF1 04            [ 4]  302 	inc	b
   2EF2 70            [ 7]  303 	ld	(hl),b
   2EF3 18 06         [12]  304 	jr	00110$
   2EF5                     305 00102$:
                            306 ;src/entities/explosions.c:83: explosiones[i].activo=0;
   2EF5 AF            [ 4]  307 	xor	a, a
   2EF6 12            [ 7]  308 	ld	(de),a
                            309 ;src/entities/explosions.c:84: explosiones_activas--;
   2EF7 21 E9 54      [10]  310 	ld	hl, #_explosiones_activas+0
   2EFA 35            [11]  311 	dec	(hl)
   2EFB                     312 00110$:
                            313 ;src/entities/explosions.c:76: for (i=0;i<MAX_EXPLOSIONES;i++){
   2EFB 0C            [ 4]  314 	inc	c
   2EFC 79            [ 4]  315 	ld	a,c
   2EFD D6 1E         [ 7]  316 	sub	a, #0x1E
   2EFF 38 CC         [12]  317 	jr	C,00109$
   2F01                     318 00111$:
   2F01 DD F9         [10]  319 	ld	sp, ix
   2F03 DD E1         [14]  320 	pop	ix
   2F05 C9            [10]  321 	ret
                            322 ;src/entities/explosions.c:97: void draw_explosions(u8* screen){
                            323 ;	---------------------------------
                            324 ; Function draw_explosions
                            325 ; ---------------------------------
   2F06                     326 _draw_explosions::
   2F06 DD E5         [15]  327 	push	ix
   2F08 DD 21 00 00   [14]  328 	ld	ix,#0
   2F0C DD 39         [15]  329 	add	ix,sp
   2F0E F5            [11]  330 	push	af
   2F0F 3B            [ 6]  331 	dec	sp
                            332 ;src/entities/explosions.c:103: if (explosiones_activas>0){
   2F10 3A E9 54      [13]  333 	ld	a,(#_explosiones_activas + 0)
   2F13 B7            [ 4]  334 	or	a, a
   2F14 CA 9B 2F      [10]  335 	jp	Z,00108$
                            336 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   2F17 0E 00         [ 7]  337 	ld	c,#0x00
   2F19                     338 00106$:
                            339 ;src/entities/explosions.c:105: if (explosiones[i].activo==1){
   2F19 69            [ 4]  340 	ld	l,c
   2F1A 26 00         [ 7]  341 	ld	h,#0x00
   2F1C 29            [11]  342 	add	hl, hl
   2F1D 29            [11]  343 	add	hl, hl
   2F1E 29            [11]  344 	add	hl, hl
   2F1F 29            [11]  345 	add	hl, hl
   2F20 3E 09         [ 7]  346 	ld	a,#<(_explosiones)
   2F22 85            [ 4]  347 	add	a, l
   2F23 DD 77 FD      [19]  348 	ld	-3 (ix),a
   2F26 3E 53         [ 7]  349 	ld	a,#>(_explosiones)
   2F28 8C            [ 4]  350 	adc	a, h
   2F29 DD 77 FE      [19]  351 	ld	-2 (ix),a
   2F2C E1            [10]  352 	pop	hl
   2F2D E5            [11]  353 	push	hl
   2F2E 23            [ 6]  354 	inc	hl
   2F2F 23            [ 6]  355 	inc	hl
   2F30 7E            [ 7]  356 	ld	a,(hl)
   2F31 3D            [ 4]  357 	dec	a
   2F32 20 60         [12]  358 	jr	NZ,00107$
                            359 ;src/entities/explosions.c:106: pscreen = cpct_getScreenPtr(screen, explosiones[i].x, explosiones[i].y);
   2F34 E1            [10]  360 	pop	hl
   2F35 E5            [11]  361 	push	hl
   2F36 11 04 00      [10]  362 	ld	de, #0x0004
   2F39 19            [11]  363 	add	hl, de
   2F3A 5E            [ 7]  364 	ld	e,(hl)
   2F3B E1            [10]  365 	pop	hl
   2F3C E5            [11]  366 	push	hl
   2F3D 23            [ 6]  367 	inc	hl
   2F3E 23            [ 6]  368 	inc	hl
   2F3F 23            [ 6]  369 	inc	hl
   2F40 66            [ 7]  370 	ld	h,(hl)
   2F41 DD 6E 04      [19]  371 	ld	l,4 (ix)
   2F44 DD 56 05      [19]  372 	ld	d,5 (ix)
   2F47 C5            [11]  373 	push	bc
   2F48 7B            [ 4]  374 	ld	a,e
   2F49 F5            [11]  375 	push	af
   2F4A 33            [ 6]  376 	inc	sp
   2F4B E5            [11]  377 	push	hl
   2F4C 33            [ 6]  378 	inc	sp
   2F4D 62            [ 4]  379 	ld	h, d
   2F4E E5            [11]  380 	push	hl
   2F4F CD 11 4D      [17]  381 	call	_cpct_getScreenPtr
   2F52 F1            [10]  382 	pop	af
   2F53 F1            [10]  383 	pop	af
   2F54 C1            [10]  384 	pop	bc
   2F55 E5            [11]  385 	push	hl
   2F56 FD E1         [14]  386 	pop	iy
                            387 ;src/entities/explosions.c:107: cpct_drawSprite(explosion_sprite[explosiones[i].tipo][explosiones[i].fase],pscreen,explosiones[i].w,explosiones[i].h);
   2F58 E1            [10]  388 	pop	hl
   2F59 E5            [11]  389 	push	hl
   2F5A 11 05 00      [10]  390 	ld	de, #0x0005
   2F5D 19            [11]  391 	add	hl, de
   2F5E 46            [ 7]  392 	ld	b,(hl)
   2F5F E1            [10]  393 	pop	hl
   2F60 E5            [11]  394 	push	hl
   2F61 11 06 00      [10]  395 	ld	de, #0x0006
   2F64 19            [11]  396 	add	hl, de
   2F65 7E            [ 7]  397 	ld	a,(hl)
   2F66 DD 77 FF      [19]  398 	ld	-1 (ix),a
   2F69 E1            [10]  399 	pop	hl
   2F6A E5            [11]  400 	push	hl
   2F6B 6E            [ 7]  401 	ld	l,(hl)
   2F6C 26 00         [ 7]  402 	ld	h,#0x00
   2F6E 29            [11]  403 	add	hl, hl
   2F6F 29            [11]  404 	add	hl, hl
   2F70 29            [11]  405 	add	hl, hl
   2F71 3E EA         [ 7]  406 	ld	a,#<(_explosion_sprite)
   2F73 85            [ 4]  407 	add	a, l
   2F74 5F            [ 4]  408 	ld	e,a
   2F75 3E 54         [ 7]  409 	ld	a,#>(_explosion_sprite)
   2F77 8C            [ 4]  410 	adc	a, h
   2F78 57            [ 4]  411 	ld	d,a
   2F79 E1            [10]  412 	pop	hl
   2F7A E5            [11]  413 	push	hl
   2F7B 23            [ 6]  414 	inc	hl
   2F7C 7E            [ 7]  415 	ld	a,(hl)
   2F7D 87            [ 4]  416 	add	a, a
   2F7E 6F            [ 4]  417 	ld	l,a
   2F7F 26 00         [ 7]  418 	ld	h,#0x00
   2F81 19            [11]  419 	add	hl,de
   2F82 5E            [ 7]  420 	ld	e,(hl)
   2F83 23            [ 6]  421 	inc	hl
   2F84 56            [ 7]  422 	ld	d,(hl)
   2F85 C5            [11]  423 	push	bc
   2F86 C5            [11]  424 	push	bc
   2F87 33            [ 6]  425 	inc	sp
   2F88 DD 7E FF      [19]  426 	ld	a,-1 (ix)
   2F8B F5            [11]  427 	push	af
   2F8C 33            [ 6]  428 	inc	sp
   2F8D FD E5         [15]  429 	push	iy
   2F8F D5            [11]  430 	push	de
   2F90 CD E8 4A      [17]  431 	call	_cpct_drawSprite
   2F93 C1            [10]  432 	pop	bc
   2F94                     433 00107$:
                            434 ;src/entities/explosions.c:104: for (i=0;i<MAX_EXPLOSIONES;i++){
   2F94 0C            [ 4]  435 	inc	c
   2F95 79            [ 4]  436 	ld	a,c
   2F96 D6 1E         [ 7]  437 	sub	a, #0x1E
   2F98 DA 19 2F      [10]  438 	jp	C,00106$
   2F9B                     439 00108$:
   2F9B DD F9         [10]  440 	ld	sp, ix
   2F9D DD E1         [14]  441 	pop	ix
   2F9F C9            [10]  442 	ret
                            443 	.area _CODE
                            444 	.area _INITIALIZER
                            445 	.area _CABS (ABS)
