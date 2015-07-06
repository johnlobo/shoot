                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Jul  3 17:13:19 2015
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
                             15 	.globl _max_baddie_shoots
                             16 	.globl _active_baddie_shoots
                             17 	.globl _baddie_shoots
                             18 	.globl _active_shoots
                             19 	.globl _shoots
                             20 	.globl _init_shoots
                             21 	.globl _create_shoot
                             22 	.globl _update_shoots
                             23 	.globl _draw_shoots
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   46D0                      31 _shoots::
   46D0                      32 	.ds 180
   4784                      33 _active_shoots::
   4784                      34 	.ds 1
   4785                      35 _baddie_shoots::
   4785                      36 	.ds 72
   47CD                      37 _active_baddie_shoots::
   47CD                      38 	.ds 1
   47CE                      39 _max_baddie_shoots::
   47CE                      40 	.ds 1
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
                             65 ;src/entities/shoots.c:15: void init_shoots(){
                             66 ;	---------------------------------
                             67 ; Function init_shoots
                             68 ; ---------------------------------
   2A7B                      69 _init_shoots::
   2A7B DD E5         [15]   70 	push	ix
   2A7D DD 21 00 00   [14]   71 	ld	ix,#0
   2A81 DD 39         [15]   72 	add	ix,sp
   2A83 3B            [ 6]   73 	dec	sp
                             74 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   2A84 DD 36 FF 00   [19]   75 	ld	-1 (ix),#0x00
   2A88 11 00 00      [10]   76 	ld	de,#0x0000
   2A8B                      77 00102$:
                             78 ;src/entities/shoots.c:18: shoots[k].active=0;
   2A8B 21 D0 46      [10]   79 	ld	hl,#_shoots
   2A8E 19            [11]   80 	add	hl,de
   2A8F 4D            [ 4]   81 	ld	c,l
   2A90 44            [ 4]   82 	ld	b,h
   2A91 21 08 00      [10]   83 	ld	hl,#0x0008
   2A94 09            [11]   84 	add	hl,bc
   2A95 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:19: shoots[k].x=0;
   2A97 21 04 00      [10]   87 	ld	hl,#0x0004
   2A9A 09            [11]   88 	add	hl,bc
   2A9B 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:20: shoots[k].y=0;
   2A9D 21 05 00      [10]   91 	ld	hl,#0x0005
   2AA0 09            [11]   92 	add	hl,bc
   2AA1 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:21: shoots[k].w=0;
   2AA3 21 06 00      [10]   95 	ld	hl,#0x0006
   2AA6 09            [11]   96 	add	hl,bc
   2AA7 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:22: shoots[k].h=0;
   2AA9 21 07 00      [10]   99 	ld	hl,#0x0007
   2AAC 09            [11]  100 	add	hl,bc
   2AAD 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:23: shoots[k].frame=0;
   2AAF 21 0A 00      [10]  103 	ld	hl,#0x000A
   2AB2 09            [11]  104 	add	hl,bc
   2AB3 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/shoots.c:24: shoots[k].new=0;
   2AB5 21 0C 00      [10]  107 	ld	hl,#0x000C
   2AB8 09            [11]  108 	add	hl,bc
   2AB9 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/shoots.c:25: shoots[k].dead=0;
   2ABB 21 0D 00      [10]  111 	ld	hl,#0x000D
   2ABE 09            [11]  112 	add	hl,bc
   2ABF 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/shoots.c:26: shoots[k].lastmoved=0;
   2AC1 21 0E 00      [10]  115 	ld	hl,#0x000E
   2AC4 09            [11]  116 	add	hl,bc
   2AC5 AF            [ 4]  117 	xor	a, a
   2AC6 77            [ 7]  118 	ld	(hl), a
   2AC7 23            [ 6]  119 	inc	hl
   2AC8 77            [ 7]  120 	ld	(hl), a
   2AC9 23            [ 6]  121 	inc	hl
   2ACA AF            [ 4]  122 	xor	a, a
   2ACB 77            [ 7]  123 	ld	(hl), a
   2ACC 23            [ 6]  124 	inc	hl
   2ACD 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   2ACE 21 12 00      [10]  127 	ld	hl,#0x0012
   2AD1 19            [11]  128 	add	hl,de
   2AD2 EB            [ 4]  129 	ex	de,hl
   2AD3 DD 34 FF      [23]  130 	inc	-1 (ix)
   2AD6 DD 7E FF      [19]  131 	ld	a,-1 (ix)
   2AD9 D6 0A         [ 7]  132 	sub	a, #0x0A
   2ADB 38 AE         [12]  133 	jr	C,00102$
                            134 ;src/entities/shoots.c:28: active_shoots=0;
   2ADD 21 84 47      [10]  135 	ld	hl,#_active_shoots + 0
   2AE0 36 00         [10]  136 	ld	(hl), #0x00
   2AE2 33            [ 6]  137 	inc	sp
   2AE3 DD E1         [14]  138 	pop	ix
   2AE5 C9            [10]  139 	ret
                            140 ;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_shoot
                            143 ; ---------------------------------
   2AE6                     144 _create_shoot::
   2AE6 DD E5         [15]  145 	push	ix
   2AE8 DD 21 00 00   [14]  146 	ld	ix,#0
   2AEC DD 39         [15]  147 	add	ix,sp
   2AEE 21 F4 FF      [10]  148 	ld	hl,#-12
   2AF1 39            [11]  149 	add	hl,sp
   2AF2 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
   2AF3 CD FF 2D      [17]  152 	call	_get_user_max_shoots
   2AF6 55            [ 4]  153 	ld	d,l
   2AF7 3A 84 47      [13]  154 	ld	a,(#_active_shoots + 0)
   2AFA 92            [ 4]  155 	sub	a, d
   2AFB D2 0B 2C      [10]  156 	jp	NC,00109$
                            157 ;src/entities/shoots.c:38: while (shoots[k].active){
   2AFE 11 00 00      [10]  158 	ld	de,#0x0000
   2B01                     159 00101$:
   2B01 21 D0 46      [10]  160 	ld	hl,#_shoots
   2B04 19            [11]  161 	add	hl,de
   2B05 DD 75 FE      [19]  162 	ld	-2 (ix),l
   2B08 DD 74 FF      [19]  163 	ld	-1 (ix),h
   2B0B DD 7E FE      [19]  164 	ld	a,-2 (ix)
   2B0E C6 08         [ 7]  165 	add	a, #0x08
   2B10 6F            [ 4]  166 	ld	l,a
   2B11 DD 7E FF      [19]  167 	ld	a,-1 (ix)
   2B14 CE 00         [ 7]  168 	adc	a, #0x00
   2B16 67            [ 4]  169 	ld	h,a
   2B17 7E            [ 7]  170 	ld	a,(hl)
   2B18 B7            [ 4]  171 	or	a, a
   2B19 28 07         [12]  172 	jr	Z,00103$
                            173 ;src/entities/shoots.c:39: k++;
   2B1B 21 12 00      [10]  174 	ld	hl,#0x0012
   2B1E 19            [11]  175 	add	hl,de
   2B1F EB            [ 4]  176 	ex	de,hl
   2B20 18 DF         [12]  177 	jr	00101$
   2B22                     178 00103$:
                            179 ;src/entities/shoots.c:41: shoots[k].active=1;
   2B22 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/shoots.c:42: shoots[k].frame=0;
   2B24 DD 7E FE      [19]  182 	ld	a,-2 (ix)
   2B27 C6 0A         [ 7]  183 	add	a, #0x0A
   2B29 6F            [ 4]  184 	ld	l,a
   2B2A DD 7E FF      [19]  185 	ld	a,-1 (ix)
   2B2D CE 00         [ 7]  186 	adc	a, #0x00
   2B2F 67            [ 4]  187 	ld	h,a
   2B30 36 00         [10]  188 	ld	(hl),#0x00
                            189 ;src/entities/shoots.c:46: shoots[k].x=x;
   2B32 DD 7E FE      [19]  190 	ld	a,-2 (ix)
   2B35 C6 04         [ 7]  191 	add	a, #0x04
   2B37 DD 77 FC      [19]  192 	ld	-4 (ix),a
   2B3A DD 7E FF      [19]  193 	ld	a,-1 (ix)
   2B3D CE 00         [ 7]  194 	adc	a, #0x00
   2B3F DD 77 FD      [19]  195 	ld	-3 (ix),a
                            196 ;src/entities/shoots.c:47: shoots[k].y=y;
   2B42 DD 7E FE      [19]  197 	ld	a,-2 (ix)
   2B45 C6 05         [ 7]  198 	add	a, #0x05
   2B47 DD 77 FA      [19]  199 	ld	-6 (ix),a
   2B4A DD 7E FF      [19]  200 	ld	a,-1 (ix)
   2B4D CE 00         [ 7]  201 	adc	a, #0x00
   2B4F DD 77 FB      [19]  202 	ld	-5 (ix),a
                            203 ;src/entities/shoots.c:48: shoots[k].w=1;
   2B52 DD 7E FE      [19]  204 	ld	a,-2 (ix)
   2B55 C6 06         [ 7]  205 	add	a, #0x06
   2B57 DD 77 F8      [19]  206 	ld	-8 (ix),a
   2B5A DD 7E FF      [19]  207 	ld	a,-1 (ix)
   2B5D CE 00         [ 7]  208 	adc	a, #0x00
   2B5F DD 77 F9      [19]  209 	ld	-7 (ix),a
                            210 ;src/entities/shoots.c:49: shoots[k].h=4;
   2B62 DD 7E FE      [19]  211 	ld	a,-2 (ix)
   2B65 C6 07         [ 7]  212 	add	a, #0x07
   2B67 DD 77 F6      [19]  213 	ld	-10 (ix),a
   2B6A DD 7E FF      [19]  214 	ld	a,-1 (ix)
   2B6D CE 00         [ 7]  215 	adc	a, #0x00
   2B6F DD 77 F7      [19]  216 	ld	-9 (ix),a
                            217 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   2B72 DD 7E FE      [19]  218 	ld	a,-2 (ix)
   2B75 C6 09         [ 7]  219 	add	a, #0x09
   2B77 DD 77 F4      [19]  220 	ld	-12 (ix),a
   2B7A DD 7E FF      [19]  221 	ld	a,-1 (ix)
   2B7D CE 00         [ 7]  222 	adc	a, #0x00
   2B7F DD 77 F5      [19]  223 	ld	-11 (ix),a
                            224 ;src/entities/shoots.c:43: switch (type){
   2B82 DD 7E 06      [19]  225 	ld	a,6 (ix)
   2B85 3D            [ 4]  226 	dec	a
   2B86 20 35         [12]  227 	jr	NZ,00105$
                            228 ;src/entities/shoots.c:46: shoots[k].x=x;
   2B88 DD 6E FC      [19]  229 	ld	l,-4 (ix)
   2B8B DD 66 FD      [19]  230 	ld	h,-3 (ix)
   2B8E DD 7E 04      [19]  231 	ld	a,4 (ix)
   2B91 77            [ 7]  232 	ld	(hl),a
                            233 ;src/entities/shoots.c:47: shoots[k].y=y;
   2B92 DD 6E FA      [19]  234 	ld	l,-6 (ix)
   2B95 DD 66 FB      [19]  235 	ld	h,-5 (ix)
   2B98 DD 7E 05      [19]  236 	ld	a,5 (ix)
   2B9B 77            [ 7]  237 	ld	(hl),a
                            238 ;src/entities/shoots.c:48: shoots[k].w=1;
   2B9C DD 6E F8      [19]  239 	ld	l,-8 (ix)
   2B9F DD 66 F9      [19]  240 	ld	h,-7 (ix)
   2BA2 36 01         [10]  241 	ld	(hl),#0x01
                            242 ;src/entities/shoots.c:49: shoots[k].h=4;
   2BA4 DD 6E F6      [19]  243 	ld	l,-10 (ix)
   2BA7 DD 66 F7      [19]  244 	ld	h,-9 (ix)
   2BAA 36 04         [10]  245 	ld	(hl),#0x04
                            246 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   2BAC E1            [10]  247 	pop	hl
   2BAD E5            [11]  248 	push	hl
   2BAE 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
   2BB0 DD 6E FE      [19]  251 	ld	l,-2 (ix)
   2BB3 DD 66 FF      [19]  252 	ld	h,-1 (ix)
   2BB6 36 CA         [10]  253 	ld	(hl),#<(_bullet02_0)
   2BB8 23            [ 6]  254 	inc	hl
   2BB9 36 37         [10]  255 	ld	(hl),#>(_bullet02_0)
                            256 ;src/entities/shoots.c:52: break;
   2BBB 18 4A         [12]  257 	jr	00106$
                            258 ;src/entities/shoots.c:53: default:
   2BBD                     259 00105$:
                            260 ;src/entities/shoots.c:54: shoots[k].x=x;
   2BBD DD 6E FC      [19]  261 	ld	l,-4 (ix)
   2BC0 DD 66 FD      [19]  262 	ld	h,-3 (ix)
   2BC3 DD 7E 04      [19]  263 	ld	a,4 (ix)
   2BC6 77            [ 7]  264 	ld	(hl),a
                            265 ;src/entities/shoots.c:55: shoots[k].y=y;
   2BC7 DD 6E FA      [19]  266 	ld	l,-6 (ix)
   2BCA DD 66 FB      [19]  267 	ld	h,-5 (ix)
   2BCD DD 7E 05      [19]  268 	ld	a,5 (ix)
   2BD0 77            [ 7]  269 	ld	(hl),a
                            270 ;src/entities/shoots.c:56: shoots[k].w=1;
   2BD1 DD 6E F8      [19]  271 	ld	l,-8 (ix)
   2BD4 DD 66 F9      [19]  272 	ld	h,-7 (ix)
   2BD7 36 01         [10]  273 	ld	(hl),#0x01
                            274 ;src/entities/shoots.c:57: shoots[k].h=8;
   2BD9 DD 6E F6      [19]  275 	ld	l,-10 (ix)
   2BDC DD 66 F7      [19]  276 	ld	h,-9 (ix)
   2BDF 36 08         [10]  277 	ld	(hl),#0x08
                            278 ;src/entities/shoots.c:58: shoots[k].num_frames=2;
   2BE1 E1            [10]  279 	pop	hl
   2BE2 E5            [11]  280 	push	hl
   2BE3 36 02         [10]  281 	ld	(hl),#0x02
                            282 ;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
   2BE5 DD 6E FE      [19]  283 	ld	l,-2 (ix)
   2BE8 DD 66 FF      [19]  284 	ld	h,-1 (ix)
   2BEB 36 BA         [10]  285 	ld	(hl),#<(_bullet01_0)
   2BED 23            [ 6]  286 	inc	hl
   2BEE 36 37         [10]  287 	ld	(hl),#>(_bullet01_0)
                            288 ;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
   2BF0 DD 7E FE      [19]  289 	ld	a,-2 (ix)
   2BF3 C6 02         [ 7]  290 	add	a, #0x02
   2BF5 DD 77 F4      [19]  291 	ld	-12 (ix),a
   2BF8 DD 7E FF      [19]  292 	ld	a,-1 (ix)
   2BFB CE 00         [ 7]  293 	adc	a, #0x00
   2BFD DD 77 F5      [19]  294 	ld	-11 (ix),a
   2C00 E1            [10]  295 	pop	hl
   2C01 E5            [11]  296 	push	hl
   2C02 36 C2         [10]  297 	ld	(hl),#<(_bullet01_1)
   2C04 23            [ 6]  298 	inc	hl
   2C05 36 37         [10]  299 	ld	(hl),#>(_bullet01_1)
                            300 ;src/entities/shoots.c:62: }
   2C07                     301 00106$:
                            302 ;src/entities/shoots.c:63: active_shoots++;
   2C07 21 84 47      [10]  303 	ld	hl, #_active_shoots+0
   2C0A 34            [11]  304 	inc	(hl)
   2C0B                     305 00109$:
   2C0B DD F9         [10]  306 	ld	sp, ix
   2C0D DD E1         [14]  307 	pop	ix
   2C0F C9            [10]  308 	ret
                            309 ;src/entities/shoots.c:72: void update_shoots(){
                            310 ;	---------------------------------
                            311 ; Function update_shoots
                            312 ; ---------------------------------
   2C10                     313 _update_shoots::
   2C10 DD E5         [15]  314 	push	ix
   2C12 DD 21 00 00   [14]  315 	ld	ix,#0
   2C16 DD 39         [15]  316 	add	ix,sp
   2C18 F5            [11]  317 	push	af
   2C19 3B            [ 6]  318 	dec	sp
                            319 ;src/entities/shoots.c:75: if (active_shoots>0){
   2C1A 3A 84 47      [13]  320 	ld	a,(#_active_shoots + 0)
   2C1D B7            [ 4]  321 	or	a, a
   2C1E CA A1 2C      [10]  322 	jp	Z,00113$
                            323 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2C21 DD 36 FD 00   [19]  324 	ld	-3 (ix),#0x00
   2C25 11 00 00      [10]  325 	ld	de,#0x0000
   2C28                     326 00111$:
                            327 ;src/entities/shoots.c:77: if (shoots[i].active){
   2C28 21 D0 46      [10]  328 	ld	hl,#_shoots
   2C2B 19            [11]  329 	add	hl,de
   2C2C DD 75 FE      [19]  330 	ld	-2 (ix),l
   2C2F DD 74 FF      [19]  331 	ld	-1 (ix),h
   2C32 DD 7E FE      [19]  332 	ld	a,-2 (ix)
   2C35 C6 08         [ 7]  333 	add	a, #0x08
   2C37 4F            [ 4]  334 	ld	c,a
   2C38 DD 7E FF      [19]  335 	ld	a,-1 (ix)
   2C3B CE 00         [ 7]  336 	adc	a, #0x00
   2C3D 47            [ 4]  337 	ld	b,a
   2C3E 0A            [ 7]  338 	ld	a,(bc)
   2C3F B7            [ 4]  339 	or	a, a
   2C40 28 50         [12]  340 	jr	Z,00112$
                            341 ;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
   2C42 FD 21 05 00   [14]  342 	ld	iy,#0x0005
   2C46 C5            [11]  343 	push	bc
   2C47 DD 4E FE      [19]  344 	ld	c,-2 (ix)
   2C4A DD 46 FF      [19]  345 	ld	b,-1 (ix)
   2C4D FD 09         [15]  346 	add	iy, bc
   2C4F C1            [10]  347 	pop	bc
   2C50 FD 7E 00      [19]  348 	ld	a, 0 (iy)
   2C53 C6 F8         [ 7]  349 	add	a,#0xF8
   2C55 67            [ 4]  350 	ld	h,a
   2C56 FD 74 00      [19]  351 	ld	0 (iy), h
                            352 ;src/entities/shoots.c:79: if (shoots[i].y<200){
   2C59 7C            [ 4]  353 	ld	a,h
   2C5A D6 C8         [ 7]  354 	sub	a, #0xC8
   2C5C 30 2E         [12]  355 	jr	NC,00104$
                            356 ;src/entities/shoots.c:80: shoots[i].frame++;
   2C5E FD 21 0A 00   [14]  357 	ld	iy,#0x000A
   2C62 DD 4E FE      [19]  358 	ld	c,-2 (ix)
   2C65 DD 46 FF      [19]  359 	ld	b,-1 (ix)
   2C68 FD 09         [15]  360 	add	iy, bc
   2C6A FD 34 00      [23]  361 	inc	0 (iy)
   2C6D FD 4E 00      [19]  362 	ld	c, 0 (iy)
                            363 ;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
   2C70 DD 6E FE      [19]  364 	ld	l,-2 (ix)
   2C73 DD 66 FF      [19]  365 	ld	h,-1 (ix)
   2C76 C5            [11]  366 	push	bc
   2C77 01 09 00      [10]  367 	ld	bc, #0x0009
   2C7A 09            [11]  368 	add	hl, bc
   2C7B C1            [10]  369 	pop	bc
   2C7C 7E            [ 7]  370 	ld	a,(hl)
   2C7D DD 77 FE      [19]  371 	ld	-2 (ix),a
   2C80 79            [ 4]  372 	ld	a,c
   2C81 DD 96 FE      [19]  373 	sub	a, -2 (ix)
   2C84 20 0C         [12]  374 	jr	NZ,00112$
                            375 ;src/entities/shoots.c:82: shoots[i].frame=0;
   2C86 FD 36 00 00   [19]  376 	ld	0 (iy), #0x00
   2C8A 18 06         [12]  377 	jr	00112$
   2C8C                     378 00104$:
                            379 ;src/entities/shoots.c:85: shoots[i].active=0;
   2C8C AF            [ 4]  380 	xor	a, a
   2C8D 02            [ 7]  381 	ld	(bc),a
                            382 ;src/entities/shoots.c:86: active_shoots--;
   2C8E 21 84 47      [10]  383 	ld	hl, #_active_shoots+0
   2C91 35            [11]  384 	dec	(hl)
   2C92                     385 00112$:
                            386 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2C92 21 12 00      [10]  387 	ld	hl,#0x0012
   2C95 19            [11]  388 	add	hl,de
   2C96 EB            [ 4]  389 	ex	de,hl
   2C97 DD 34 FD      [23]  390 	inc	-3 (ix)
   2C9A DD 7E FD      [19]  391 	ld	a,-3 (ix)
   2C9D D6 0A         [ 7]  392 	sub	a, #0x0A
   2C9F 38 87         [12]  393 	jr	C,00111$
   2CA1                     394 00113$:
   2CA1 DD F9         [10]  395 	ld	sp, ix
   2CA3 DD E1         [14]  396 	pop	ix
   2CA5 C9            [10]  397 	ret
                            398 ;src/entities/shoots.c:98: void draw_shoots(u8* screen){
                            399 ;	---------------------------------
                            400 ; Function draw_shoots
                            401 ; ---------------------------------
   2CA6                     402 _draw_shoots::
   2CA6 DD E5         [15]  403 	push	ix
   2CA8 DD 21 00 00   [14]  404 	ld	ix,#0
   2CAC DD 39         [15]  405 	add	ix,sp
   2CAE 21 F9 FF      [10]  406 	ld	hl,#-7
   2CB1 39            [11]  407 	add	hl,sp
   2CB2 F9            [ 6]  408 	ld	sp,hl
                            409 ;src/entities/shoots.c:103: if (active_shoots>0){
   2CB3 3A 84 47      [13]  410 	ld	a,(#_active_shoots + 0)
   2CB6 B7            [ 4]  411 	or	a, a
   2CB7 CA 6F 2D      [10]  412 	jp	Z,00108$
                            413 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2CBA DD 36 F9 00   [19]  414 	ld	-7 (ix),#0x00
   2CBE 11 00 00      [10]  415 	ld	de,#0x0000
   2CC1                     416 00106$:
                            417 ;src/entities/shoots.c:105: if (shoots[k].active){
   2CC1 21 D0 46      [10]  418 	ld	hl,#_shoots
   2CC4 19            [11]  419 	add	hl,de
   2CC5 DD 75 FD      [19]  420 	ld	-3 (ix),l
   2CC8 DD 74 FE      [19]  421 	ld	-2 (ix),h
   2CCB DD 6E FD      [19]  422 	ld	l,-3 (ix)
   2CCE DD 66 FE      [19]  423 	ld	h,-2 (ix)
   2CD1 01 08 00      [10]  424 	ld	bc, #0x0008
   2CD4 09            [11]  425 	add	hl, bc
   2CD5 7E            [ 7]  426 	ld	a,(hl)
   2CD6 B7            [ 4]  427 	or	a, a
   2CD7 CA 5F 2D      [10]  428 	jp	Z,00107$
                            429 ;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   2CDA DD 6E FD      [19]  430 	ld	l,-3 (ix)
   2CDD DD 66 FE      [19]  431 	ld	h,-2 (ix)
   2CE0 01 05 00      [10]  432 	ld	bc, #0x0005
   2CE3 09            [11]  433 	add	hl, bc
   2CE4 46            [ 7]  434 	ld	b,(hl)
   2CE5 DD 6E FD      [19]  435 	ld	l,-3 (ix)
   2CE8 DD 66 FE      [19]  436 	ld	h,-2 (ix)
   2CEB 23            [ 6]  437 	inc	hl
   2CEC 23            [ 6]  438 	inc	hl
   2CED 23            [ 6]  439 	inc	hl
   2CEE 23            [ 6]  440 	inc	hl
   2CEF 4E            [ 7]  441 	ld	c,(hl)
   2CF0 E5            [11]  442 	push	hl
   2CF1 DD 6E 04      [19]  443 	ld	l,4 (ix)
   2CF4 DD 66 05      [19]  444 	ld	h,5 (ix)
   2CF7 E5            [11]  445 	push	hl
   2CF8 FD E1         [14]  446 	pop	iy
   2CFA E1            [10]  447 	pop	hl
   2CFB D5            [11]  448 	push	de
   2CFC C5            [11]  449 	push	bc
   2CFD FD E5         [15]  450 	push	iy
   2CFF CD B8 43      [17]  451 	call	_cpct_getScreenPtr
   2D02 F1            [10]  452 	pop	af
   2D03 F1            [10]  453 	pop	af
   2D04 D1            [10]  454 	pop	de
   2D05 45            [ 4]  455 	ld	b,l
   2D06 4C            [ 4]  456 	ld	c,h
                            457 ;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   2D07 DD 6E FD      [19]  458 	ld	l,-3 (ix)
   2D0A DD 66 FE      [19]  459 	ld	h,-2 (ix)
   2D0D C5            [11]  460 	push	bc
   2D0E 01 07 00      [10]  461 	ld	bc, #0x0007
   2D11 09            [11]  462 	add	hl, bc
   2D12 C1            [10]  463 	pop	bc
   2D13 7E            [ 7]  464 	ld	a,(hl)
   2D14 DD 77 FF      [19]  465 	ld	-1 (ix),a
   2D17 DD 6E FD      [19]  466 	ld	l,-3 (ix)
   2D1A DD 66 FE      [19]  467 	ld	h,-2 (ix)
   2D1D C5            [11]  468 	push	bc
   2D1E 01 06 00      [10]  469 	ld	bc, #0x0006
   2D21 09            [11]  470 	add	hl, bc
   2D22 C1            [10]  471 	pop	bc
   2D23 7E            [ 7]  472 	ld	a,(hl)
   2D24 DD 77 FC      [19]  473 	ld	-4 (ix),a
   2D27 DD 70 FA      [19]  474 	ld	-6 (ix),b
   2D2A DD 71 FB      [19]  475 	ld	-5 (ix),c
   2D2D DD 6E FD      [19]  476 	ld	l,-3 (ix)
   2D30 DD 66 FE      [19]  477 	ld	h,-2 (ix)
   2D33 01 0A 00      [10]  478 	ld	bc, #0x000A
   2D36 09            [11]  479 	add	hl, bc
   2D37 7E            [ 7]  480 	ld	a,(hl)
   2D38 87            [ 4]  481 	add	a, a
   2D39 4F            [ 4]  482 	ld	c,a
   2D3A DD 6E FD      [19]  483 	ld	l,-3 (ix)
   2D3D DD 66 FE      [19]  484 	ld	h,-2 (ix)
   2D40 06 00         [ 7]  485 	ld	b,#0x00
   2D42 09            [11]  486 	add	hl, bc
   2D43 4E            [ 7]  487 	ld	c,(hl)
   2D44 23            [ 6]  488 	inc	hl
   2D45 46            [ 7]  489 	ld	b,(hl)
   2D46 D5            [11]  490 	push	de
   2D47 DD 66 FF      [19]  491 	ld	h,-1 (ix)
   2D4A DD 6E FC      [19]  492 	ld	l,-4 (ix)
   2D4D E5            [11]  493 	push	hl
   2D4E DD 6E FA      [19]  494 	ld	l,-6 (ix)
   2D51 DD 66 FB      [19]  495 	ld	h,-5 (ix)
   2D54 E5            [11]  496 	push	hl
   2D55 C5            [11]  497 	push	bc
   2D56 CD 89 41      [17]  498 	call	_cpct_drawSprite
   2D59 21 06 00      [10]  499 	ld	hl,#6
   2D5C 39            [11]  500 	add	hl,sp
   2D5D F9            [ 6]  501 	ld	sp,hl
   2D5E D1            [10]  502 	pop	de
   2D5F                     503 00107$:
                            504 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2D5F 21 12 00      [10]  505 	ld	hl,#0x0012
   2D62 19            [11]  506 	add	hl,de
   2D63 EB            [ 4]  507 	ex	de,hl
   2D64 DD 34 F9      [23]  508 	inc	-7 (ix)
   2D67 DD 7E F9      [19]  509 	ld	a,-7 (ix)
   2D6A D6 0A         [ 7]  510 	sub	a, #0x0A
   2D6C DA C1 2C      [10]  511 	jp	C,00106$
   2D6F                     512 00108$:
   2D6F DD F9         [10]  513 	ld	sp, ix
   2D71 DD E1         [14]  514 	pop	ix
   2D73 C9            [10]  515 	ret
                            516 	.area _CODE
                            517 	.area _INITIALIZER
                            518 	.area _CABS (ABS)
