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
   46DE                      31 _shoots::
   46DE                      32 	.ds 180
   4792                      33 _active_shoots::
   4792                      34 	.ds 1
   4793                      35 _baddie_shoots::
   4793                      36 	.ds 72
   47DB                      37 _active_baddie_shoots::
   47DB                      38 	.ds 1
   47DC                      39 _max_baddie_shoots::
   47DC                      40 	.ds 1
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
   2A86                      69 _init_shoots::
   2A86 DD E5         [15]   70 	push	ix
   2A88 DD 21 00 00   [14]   71 	ld	ix,#0
   2A8C DD 39         [15]   72 	add	ix,sp
   2A8E 3B            [ 6]   73 	dec	sp
                             74 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   2A8F DD 36 FF 00   [19]   75 	ld	-1 (ix),#0x00
   2A93 11 00 00      [10]   76 	ld	de,#0x0000
   2A96                      77 00102$:
                             78 ;src/entities/shoots.c:18: shoots[k].active=0;
   2A96 21 DE 46      [10]   79 	ld	hl,#_shoots
   2A99 19            [11]   80 	add	hl,de
   2A9A 4D            [ 4]   81 	ld	c,l
   2A9B 44            [ 4]   82 	ld	b,h
   2A9C 21 08 00      [10]   83 	ld	hl,#0x0008
   2A9F 09            [11]   84 	add	hl,bc
   2AA0 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:19: shoots[k].x=0;
   2AA2 21 04 00      [10]   87 	ld	hl,#0x0004
   2AA5 09            [11]   88 	add	hl,bc
   2AA6 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:20: shoots[k].y=0;
   2AA8 21 05 00      [10]   91 	ld	hl,#0x0005
   2AAB 09            [11]   92 	add	hl,bc
   2AAC 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:21: shoots[k].w=0;
   2AAE 21 06 00      [10]   95 	ld	hl,#0x0006
   2AB1 09            [11]   96 	add	hl,bc
   2AB2 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:22: shoots[k].h=0;
   2AB4 21 07 00      [10]   99 	ld	hl,#0x0007
   2AB7 09            [11]  100 	add	hl,bc
   2AB8 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:23: shoots[k].frame=0;
   2ABA 21 0A 00      [10]  103 	ld	hl,#0x000A
   2ABD 09            [11]  104 	add	hl,bc
   2ABE 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/shoots.c:24: shoots[k].new=0;
   2AC0 21 0C 00      [10]  107 	ld	hl,#0x000C
   2AC3 09            [11]  108 	add	hl,bc
   2AC4 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/shoots.c:25: shoots[k].dead=0;
   2AC6 21 0D 00      [10]  111 	ld	hl,#0x000D
   2AC9 09            [11]  112 	add	hl,bc
   2ACA 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/shoots.c:26: shoots[k].lastmoved=0;
   2ACC 21 0E 00      [10]  115 	ld	hl,#0x000E
   2ACF 09            [11]  116 	add	hl,bc
   2AD0 AF            [ 4]  117 	xor	a, a
   2AD1 77            [ 7]  118 	ld	(hl), a
   2AD2 23            [ 6]  119 	inc	hl
   2AD3 77            [ 7]  120 	ld	(hl), a
   2AD4 23            [ 6]  121 	inc	hl
   2AD5 AF            [ 4]  122 	xor	a, a
   2AD6 77            [ 7]  123 	ld	(hl), a
   2AD7 23            [ 6]  124 	inc	hl
   2AD8 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   2AD9 21 12 00      [10]  127 	ld	hl,#0x0012
   2ADC 19            [11]  128 	add	hl,de
   2ADD EB            [ 4]  129 	ex	de,hl
   2ADE DD 34 FF      [23]  130 	inc	-1 (ix)
   2AE1 DD 7E FF      [19]  131 	ld	a,-1 (ix)
   2AE4 D6 0A         [ 7]  132 	sub	a, #0x0A
   2AE6 38 AE         [12]  133 	jr	C,00102$
                            134 ;src/entities/shoots.c:28: active_shoots=0;
   2AE8 21 92 47      [10]  135 	ld	hl,#_active_shoots + 0
   2AEB 36 00         [10]  136 	ld	(hl), #0x00
   2AED 33            [ 6]  137 	inc	sp
   2AEE DD E1         [14]  138 	pop	ix
   2AF0 C9            [10]  139 	ret
                            140 ;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_shoot
                            143 ; ---------------------------------
   2AF1                     144 _create_shoot::
   2AF1 DD E5         [15]  145 	push	ix
   2AF3 DD 21 00 00   [14]  146 	ld	ix,#0
   2AF7 DD 39         [15]  147 	add	ix,sp
   2AF9 21 F4 FF      [10]  148 	ld	hl,#-12
   2AFC 39            [11]  149 	add	hl,sp
   2AFD F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
   2AFE CD 0A 2E      [17]  152 	call	_get_user_max_shoots
   2B01 55            [ 4]  153 	ld	d,l
   2B02 3A 92 47      [13]  154 	ld	a,(#_active_shoots + 0)
   2B05 92            [ 4]  155 	sub	a, d
   2B06 D2 16 2C      [10]  156 	jp	NC,00109$
                            157 ;src/entities/shoots.c:38: while (shoots[k].active){
   2B09 11 00 00      [10]  158 	ld	de,#0x0000
   2B0C                     159 00101$:
   2B0C 21 DE 46      [10]  160 	ld	hl,#_shoots
   2B0F 19            [11]  161 	add	hl,de
   2B10 DD 75 FE      [19]  162 	ld	-2 (ix),l
   2B13 DD 74 FF      [19]  163 	ld	-1 (ix),h
   2B16 DD 7E FE      [19]  164 	ld	a,-2 (ix)
   2B19 C6 08         [ 7]  165 	add	a, #0x08
   2B1B 6F            [ 4]  166 	ld	l,a
   2B1C DD 7E FF      [19]  167 	ld	a,-1 (ix)
   2B1F CE 00         [ 7]  168 	adc	a, #0x00
   2B21 67            [ 4]  169 	ld	h,a
   2B22 7E            [ 7]  170 	ld	a,(hl)
   2B23 B7            [ 4]  171 	or	a, a
   2B24 28 07         [12]  172 	jr	Z,00103$
                            173 ;src/entities/shoots.c:39: k++;
   2B26 21 12 00      [10]  174 	ld	hl,#0x0012
   2B29 19            [11]  175 	add	hl,de
   2B2A EB            [ 4]  176 	ex	de,hl
   2B2B 18 DF         [12]  177 	jr	00101$
   2B2D                     178 00103$:
                            179 ;src/entities/shoots.c:41: shoots[k].active=1;
   2B2D 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/shoots.c:42: shoots[k].frame=0;
   2B2F DD 7E FE      [19]  182 	ld	a,-2 (ix)
   2B32 C6 0A         [ 7]  183 	add	a, #0x0A
   2B34 6F            [ 4]  184 	ld	l,a
   2B35 DD 7E FF      [19]  185 	ld	a,-1 (ix)
   2B38 CE 00         [ 7]  186 	adc	a, #0x00
   2B3A 67            [ 4]  187 	ld	h,a
   2B3B 36 00         [10]  188 	ld	(hl),#0x00
                            189 ;src/entities/shoots.c:46: shoots[k].x=x;
   2B3D DD 7E FE      [19]  190 	ld	a,-2 (ix)
   2B40 C6 04         [ 7]  191 	add	a, #0x04
   2B42 DD 77 FC      [19]  192 	ld	-4 (ix),a
   2B45 DD 7E FF      [19]  193 	ld	a,-1 (ix)
   2B48 CE 00         [ 7]  194 	adc	a, #0x00
   2B4A DD 77 FD      [19]  195 	ld	-3 (ix),a
                            196 ;src/entities/shoots.c:47: shoots[k].y=y;
   2B4D DD 7E FE      [19]  197 	ld	a,-2 (ix)
   2B50 C6 05         [ 7]  198 	add	a, #0x05
   2B52 DD 77 FA      [19]  199 	ld	-6 (ix),a
   2B55 DD 7E FF      [19]  200 	ld	a,-1 (ix)
   2B58 CE 00         [ 7]  201 	adc	a, #0x00
   2B5A DD 77 FB      [19]  202 	ld	-5 (ix),a
                            203 ;src/entities/shoots.c:48: shoots[k].w=1;
   2B5D DD 7E FE      [19]  204 	ld	a,-2 (ix)
   2B60 C6 06         [ 7]  205 	add	a, #0x06
   2B62 DD 77 F8      [19]  206 	ld	-8 (ix),a
   2B65 DD 7E FF      [19]  207 	ld	a,-1 (ix)
   2B68 CE 00         [ 7]  208 	adc	a, #0x00
   2B6A DD 77 F9      [19]  209 	ld	-7 (ix),a
                            210 ;src/entities/shoots.c:49: shoots[k].h=4;
   2B6D DD 7E FE      [19]  211 	ld	a,-2 (ix)
   2B70 C6 07         [ 7]  212 	add	a, #0x07
   2B72 DD 77 F6      [19]  213 	ld	-10 (ix),a
   2B75 DD 7E FF      [19]  214 	ld	a,-1 (ix)
   2B78 CE 00         [ 7]  215 	adc	a, #0x00
   2B7A DD 77 F7      [19]  216 	ld	-9 (ix),a
                            217 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   2B7D DD 7E FE      [19]  218 	ld	a,-2 (ix)
   2B80 C6 09         [ 7]  219 	add	a, #0x09
   2B82 DD 77 F4      [19]  220 	ld	-12 (ix),a
   2B85 DD 7E FF      [19]  221 	ld	a,-1 (ix)
   2B88 CE 00         [ 7]  222 	adc	a, #0x00
   2B8A DD 77 F5      [19]  223 	ld	-11 (ix),a
                            224 ;src/entities/shoots.c:43: switch (type){
   2B8D DD 7E 06      [19]  225 	ld	a,6 (ix)
   2B90 3D            [ 4]  226 	dec	a
   2B91 20 35         [12]  227 	jr	NZ,00105$
                            228 ;src/entities/shoots.c:46: shoots[k].x=x;
   2B93 DD 6E FC      [19]  229 	ld	l,-4 (ix)
   2B96 DD 66 FD      [19]  230 	ld	h,-3 (ix)
   2B99 DD 7E 04      [19]  231 	ld	a,4 (ix)
   2B9C 77            [ 7]  232 	ld	(hl),a
                            233 ;src/entities/shoots.c:47: shoots[k].y=y;
   2B9D DD 6E FA      [19]  234 	ld	l,-6 (ix)
   2BA0 DD 66 FB      [19]  235 	ld	h,-5 (ix)
   2BA3 DD 7E 05      [19]  236 	ld	a,5 (ix)
   2BA6 77            [ 7]  237 	ld	(hl),a
                            238 ;src/entities/shoots.c:48: shoots[k].w=1;
   2BA7 DD 6E F8      [19]  239 	ld	l,-8 (ix)
   2BAA DD 66 F9      [19]  240 	ld	h,-7 (ix)
   2BAD 36 01         [10]  241 	ld	(hl),#0x01
                            242 ;src/entities/shoots.c:49: shoots[k].h=4;
   2BAF DD 6E F6      [19]  243 	ld	l,-10 (ix)
   2BB2 DD 66 F7      [19]  244 	ld	h,-9 (ix)
   2BB5 36 04         [10]  245 	ld	(hl),#0x04
                            246 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   2BB7 E1            [10]  247 	pop	hl
   2BB8 E5            [11]  248 	push	hl
   2BB9 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
   2BBB DD 6E FE      [19]  251 	ld	l,-2 (ix)
   2BBE DD 66 FF      [19]  252 	ld	h,-1 (ix)
   2BC1 36 D8         [10]  253 	ld	(hl),#<(_bullet02_0)
   2BC3 23            [ 6]  254 	inc	hl
   2BC4 36 37         [10]  255 	ld	(hl),#>(_bullet02_0)
                            256 ;src/entities/shoots.c:52: break;
   2BC6 18 4A         [12]  257 	jr	00106$
                            258 ;src/entities/shoots.c:53: default:
   2BC8                     259 00105$:
                            260 ;src/entities/shoots.c:54: shoots[k].x=x;
   2BC8 DD 6E FC      [19]  261 	ld	l,-4 (ix)
   2BCB DD 66 FD      [19]  262 	ld	h,-3 (ix)
   2BCE DD 7E 04      [19]  263 	ld	a,4 (ix)
   2BD1 77            [ 7]  264 	ld	(hl),a
                            265 ;src/entities/shoots.c:55: shoots[k].y=y;
   2BD2 DD 6E FA      [19]  266 	ld	l,-6 (ix)
   2BD5 DD 66 FB      [19]  267 	ld	h,-5 (ix)
   2BD8 DD 7E 05      [19]  268 	ld	a,5 (ix)
   2BDB 77            [ 7]  269 	ld	(hl),a
                            270 ;src/entities/shoots.c:56: shoots[k].w=1;
   2BDC DD 6E F8      [19]  271 	ld	l,-8 (ix)
   2BDF DD 66 F9      [19]  272 	ld	h,-7 (ix)
   2BE2 36 01         [10]  273 	ld	(hl),#0x01
                            274 ;src/entities/shoots.c:57: shoots[k].h=8;
   2BE4 DD 6E F6      [19]  275 	ld	l,-10 (ix)
   2BE7 DD 66 F7      [19]  276 	ld	h,-9 (ix)
   2BEA 36 08         [10]  277 	ld	(hl),#0x08
                            278 ;src/entities/shoots.c:58: shoots[k].num_frames=2;
   2BEC E1            [10]  279 	pop	hl
   2BED E5            [11]  280 	push	hl
   2BEE 36 02         [10]  281 	ld	(hl),#0x02
                            282 ;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
   2BF0 DD 6E FE      [19]  283 	ld	l,-2 (ix)
   2BF3 DD 66 FF      [19]  284 	ld	h,-1 (ix)
   2BF6 36 C8         [10]  285 	ld	(hl),#<(_bullet01_0)
   2BF8 23            [ 6]  286 	inc	hl
   2BF9 36 37         [10]  287 	ld	(hl),#>(_bullet01_0)
                            288 ;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
   2BFB DD 7E FE      [19]  289 	ld	a,-2 (ix)
   2BFE C6 02         [ 7]  290 	add	a, #0x02
   2C00 DD 77 F4      [19]  291 	ld	-12 (ix),a
   2C03 DD 7E FF      [19]  292 	ld	a,-1 (ix)
   2C06 CE 00         [ 7]  293 	adc	a, #0x00
   2C08 DD 77 F5      [19]  294 	ld	-11 (ix),a
   2C0B E1            [10]  295 	pop	hl
   2C0C E5            [11]  296 	push	hl
   2C0D 36 D0         [10]  297 	ld	(hl),#<(_bullet01_1)
   2C0F 23            [ 6]  298 	inc	hl
   2C10 36 37         [10]  299 	ld	(hl),#>(_bullet01_1)
                            300 ;src/entities/shoots.c:62: }
   2C12                     301 00106$:
                            302 ;src/entities/shoots.c:63: active_shoots++;
   2C12 21 92 47      [10]  303 	ld	hl, #_active_shoots+0
   2C15 34            [11]  304 	inc	(hl)
   2C16                     305 00109$:
   2C16 DD F9         [10]  306 	ld	sp, ix
   2C18 DD E1         [14]  307 	pop	ix
   2C1A C9            [10]  308 	ret
                            309 ;src/entities/shoots.c:72: void update_shoots(){
                            310 ;	---------------------------------
                            311 ; Function update_shoots
                            312 ; ---------------------------------
   2C1B                     313 _update_shoots::
   2C1B DD E5         [15]  314 	push	ix
   2C1D DD 21 00 00   [14]  315 	ld	ix,#0
   2C21 DD 39         [15]  316 	add	ix,sp
   2C23 F5            [11]  317 	push	af
   2C24 3B            [ 6]  318 	dec	sp
                            319 ;src/entities/shoots.c:75: if (active_shoots>0){
   2C25 3A 92 47      [13]  320 	ld	a,(#_active_shoots + 0)
   2C28 B7            [ 4]  321 	or	a, a
   2C29 CA AC 2C      [10]  322 	jp	Z,00113$
                            323 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2C2C DD 36 FD 00   [19]  324 	ld	-3 (ix),#0x00
   2C30 11 00 00      [10]  325 	ld	de,#0x0000
   2C33                     326 00111$:
                            327 ;src/entities/shoots.c:77: if (shoots[i].active){
   2C33 21 DE 46      [10]  328 	ld	hl,#_shoots
   2C36 19            [11]  329 	add	hl,de
   2C37 DD 75 FE      [19]  330 	ld	-2 (ix),l
   2C3A DD 74 FF      [19]  331 	ld	-1 (ix),h
   2C3D DD 7E FE      [19]  332 	ld	a,-2 (ix)
   2C40 C6 08         [ 7]  333 	add	a, #0x08
   2C42 4F            [ 4]  334 	ld	c,a
   2C43 DD 7E FF      [19]  335 	ld	a,-1 (ix)
   2C46 CE 00         [ 7]  336 	adc	a, #0x00
   2C48 47            [ 4]  337 	ld	b,a
   2C49 0A            [ 7]  338 	ld	a,(bc)
   2C4A B7            [ 4]  339 	or	a, a
   2C4B 28 50         [12]  340 	jr	Z,00112$
                            341 ;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
   2C4D FD 21 05 00   [14]  342 	ld	iy,#0x0005
   2C51 C5            [11]  343 	push	bc
   2C52 DD 4E FE      [19]  344 	ld	c,-2 (ix)
   2C55 DD 46 FF      [19]  345 	ld	b,-1 (ix)
   2C58 FD 09         [15]  346 	add	iy, bc
   2C5A C1            [10]  347 	pop	bc
   2C5B FD 7E 00      [19]  348 	ld	a, 0 (iy)
   2C5E C6 F8         [ 7]  349 	add	a,#0xF8
   2C60 67            [ 4]  350 	ld	h,a
   2C61 FD 74 00      [19]  351 	ld	0 (iy), h
                            352 ;src/entities/shoots.c:79: if (shoots[i].y<200){
   2C64 7C            [ 4]  353 	ld	a,h
   2C65 D6 C8         [ 7]  354 	sub	a, #0xC8
   2C67 30 2E         [12]  355 	jr	NC,00104$
                            356 ;src/entities/shoots.c:80: shoots[i].frame++;
   2C69 FD 21 0A 00   [14]  357 	ld	iy,#0x000A
   2C6D DD 4E FE      [19]  358 	ld	c,-2 (ix)
   2C70 DD 46 FF      [19]  359 	ld	b,-1 (ix)
   2C73 FD 09         [15]  360 	add	iy, bc
   2C75 FD 34 00      [23]  361 	inc	0 (iy)
   2C78 FD 4E 00      [19]  362 	ld	c, 0 (iy)
                            363 ;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
   2C7B DD 6E FE      [19]  364 	ld	l,-2 (ix)
   2C7E DD 66 FF      [19]  365 	ld	h,-1 (ix)
   2C81 C5            [11]  366 	push	bc
   2C82 01 09 00      [10]  367 	ld	bc, #0x0009
   2C85 09            [11]  368 	add	hl, bc
   2C86 C1            [10]  369 	pop	bc
   2C87 7E            [ 7]  370 	ld	a,(hl)
   2C88 DD 77 FE      [19]  371 	ld	-2 (ix),a
   2C8B 79            [ 4]  372 	ld	a,c
   2C8C DD 96 FE      [19]  373 	sub	a, -2 (ix)
   2C8F 20 0C         [12]  374 	jr	NZ,00112$
                            375 ;src/entities/shoots.c:82: shoots[i].frame=0;
   2C91 FD 36 00 00   [19]  376 	ld	0 (iy), #0x00
   2C95 18 06         [12]  377 	jr	00112$
   2C97                     378 00104$:
                            379 ;src/entities/shoots.c:85: shoots[i].active=0;
   2C97 AF            [ 4]  380 	xor	a, a
   2C98 02            [ 7]  381 	ld	(bc),a
                            382 ;src/entities/shoots.c:86: active_shoots--;
   2C99 21 92 47      [10]  383 	ld	hl, #_active_shoots+0
   2C9C 35            [11]  384 	dec	(hl)
   2C9D                     385 00112$:
                            386 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2C9D 21 12 00      [10]  387 	ld	hl,#0x0012
   2CA0 19            [11]  388 	add	hl,de
   2CA1 EB            [ 4]  389 	ex	de,hl
   2CA2 DD 34 FD      [23]  390 	inc	-3 (ix)
   2CA5 DD 7E FD      [19]  391 	ld	a,-3 (ix)
   2CA8 D6 0A         [ 7]  392 	sub	a, #0x0A
   2CAA 38 87         [12]  393 	jr	C,00111$
   2CAC                     394 00113$:
   2CAC DD F9         [10]  395 	ld	sp, ix
   2CAE DD E1         [14]  396 	pop	ix
   2CB0 C9            [10]  397 	ret
                            398 ;src/entities/shoots.c:98: void draw_shoots(u8* screen){
                            399 ;	---------------------------------
                            400 ; Function draw_shoots
                            401 ; ---------------------------------
   2CB1                     402 _draw_shoots::
   2CB1 DD E5         [15]  403 	push	ix
   2CB3 DD 21 00 00   [14]  404 	ld	ix,#0
   2CB7 DD 39         [15]  405 	add	ix,sp
   2CB9 21 F9 FF      [10]  406 	ld	hl,#-7
   2CBC 39            [11]  407 	add	hl,sp
   2CBD F9            [ 6]  408 	ld	sp,hl
                            409 ;src/entities/shoots.c:103: if (active_shoots>0){
   2CBE 3A 92 47      [13]  410 	ld	a,(#_active_shoots + 0)
   2CC1 B7            [ 4]  411 	or	a, a
   2CC2 CA 7A 2D      [10]  412 	jp	Z,00108$
                            413 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2CC5 DD 36 F9 00   [19]  414 	ld	-7 (ix),#0x00
   2CC9 11 00 00      [10]  415 	ld	de,#0x0000
   2CCC                     416 00106$:
                            417 ;src/entities/shoots.c:105: if (shoots[k].active){
   2CCC 21 DE 46      [10]  418 	ld	hl,#_shoots
   2CCF 19            [11]  419 	add	hl,de
   2CD0 DD 75 FD      [19]  420 	ld	-3 (ix),l
   2CD3 DD 74 FE      [19]  421 	ld	-2 (ix),h
   2CD6 DD 6E FD      [19]  422 	ld	l,-3 (ix)
   2CD9 DD 66 FE      [19]  423 	ld	h,-2 (ix)
   2CDC 01 08 00      [10]  424 	ld	bc, #0x0008
   2CDF 09            [11]  425 	add	hl, bc
   2CE0 7E            [ 7]  426 	ld	a,(hl)
   2CE1 B7            [ 4]  427 	or	a, a
   2CE2 CA 6A 2D      [10]  428 	jp	Z,00107$
                            429 ;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   2CE5 DD 6E FD      [19]  430 	ld	l,-3 (ix)
   2CE8 DD 66 FE      [19]  431 	ld	h,-2 (ix)
   2CEB 01 05 00      [10]  432 	ld	bc, #0x0005
   2CEE 09            [11]  433 	add	hl, bc
   2CEF 46            [ 7]  434 	ld	b,(hl)
   2CF0 DD 6E FD      [19]  435 	ld	l,-3 (ix)
   2CF3 DD 66 FE      [19]  436 	ld	h,-2 (ix)
   2CF6 23            [ 6]  437 	inc	hl
   2CF7 23            [ 6]  438 	inc	hl
   2CF8 23            [ 6]  439 	inc	hl
   2CF9 23            [ 6]  440 	inc	hl
   2CFA 4E            [ 7]  441 	ld	c,(hl)
   2CFB E5            [11]  442 	push	hl
   2CFC DD 6E 04      [19]  443 	ld	l,4 (ix)
   2CFF DD 66 05      [19]  444 	ld	h,5 (ix)
   2D02 E5            [11]  445 	push	hl
   2D03 FD E1         [14]  446 	pop	iy
   2D05 E1            [10]  447 	pop	hl
   2D06 D5            [11]  448 	push	de
   2D07 C5            [11]  449 	push	bc
   2D08 FD E5         [15]  450 	push	iy
   2D0A CD C6 43      [17]  451 	call	_cpct_getScreenPtr
   2D0D F1            [10]  452 	pop	af
   2D0E F1            [10]  453 	pop	af
   2D0F D1            [10]  454 	pop	de
   2D10 45            [ 4]  455 	ld	b,l
   2D11 4C            [ 4]  456 	ld	c,h
                            457 ;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   2D12 DD 6E FD      [19]  458 	ld	l,-3 (ix)
   2D15 DD 66 FE      [19]  459 	ld	h,-2 (ix)
   2D18 C5            [11]  460 	push	bc
   2D19 01 07 00      [10]  461 	ld	bc, #0x0007
   2D1C 09            [11]  462 	add	hl, bc
   2D1D C1            [10]  463 	pop	bc
   2D1E 7E            [ 7]  464 	ld	a,(hl)
   2D1F DD 77 FF      [19]  465 	ld	-1 (ix),a
   2D22 DD 6E FD      [19]  466 	ld	l,-3 (ix)
   2D25 DD 66 FE      [19]  467 	ld	h,-2 (ix)
   2D28 C5            [11]  468 	push	bc
   2D29 01 06 00      [10]  469 	ld	bc, #0x0006
   2D2C 09            [11]  470 	add	hl, bc
   2D2D C1            [10]  471 	pop	bc
   2D2E 7E            [ 7]  472 	ld	a,(hl)
   2D2F DD 77 FC      [19]  473 	ld	-4 (ix),a
   2D32 DD 70 FA      [19]  474 	ld	-6 (ix),b
   2D35 DD 71 FB      [19]  475 	ld	-5 (ix),c
   2D38 DD 6E FD      [19]  476 	ld	l,-3 (ix)
   2D3B DD 66 FE      [19]  477 	ld	h,-2 (ix)
   2D3E 01 0A 00      [10]  478 	ld	bc, #0x000A
   2D41 09            [11]  479 	add	hl, bc
   2D42 7E            [ 7]  480 	ld	a,(hl)
   2D43 87            [ 4]  481 	add	a, a
   2D44 4F            [ 4]  482 	ld	c,a
   2D45 DD 6E FD      [19]  483 	ld	l,-3 (ix)
   2D48 DD 66 FE      [19]  484 	ld	h,-2 (ix)
   2D4B 06 00         [ 7]  485 	ld	b,#0x00
   2D4D 09            [11]  486 	add	hl, bc
   2D4E 4E            [ 7]  487 	ld	c,(hl)
   2D4F 23            [ 6]  488 	inc	hl
   2D50 46            [ 7]  489 	ld	b,(hl)
   2D51 D5            [11]  490 	push	de
   2D52 DD 66 FF      [19]  491 	ld	h,-1 (ix)
   2D55 DD 6E FC      [19]  492 	ld	l,-4 (ix)
   2D58 E5            [11]  493 	push	hl
   2D59 DD 6E FA      [19]  494 	ld	l,-6 (ix)
   2D5C DD 66 FB      [19]  495 	ld	h,-5 (ix)
   2D5F E5            [11]  496 	push	hl
   2D60 C5            [11]  497 	push	bc
   2D61 CD 97 41      [17]  498 	call	_cpct_drawSprite
   2D64 21 06 00      [10]  499 	ld	hl,#6
   2D67 39            [11]  500 	add	hl,sp
   2D68 F9            [ 6]  501 	ld	sp,hl
   2D69 D1            [10]  502 	pop	de
   2D6A                     503 00107$:
                            504 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2D6A 21 12 00      [10]  505 	ld	hl,#0x0012
   2D6D 19            [11]  506 	add	hl,de
   2D6E EB            [ 4]  507 	ex	de,hl
   2D6F DD 34 F9      [23]  508 	inc	-7 (ix)
   2D72 DD 7E F9      [19]  509 	ld	a,-7 (ix)
   2D75 D6 0A         [ 7]  510 	sub	a, #0x0A
   2D77 DA CC 2C      [10]  511 	jp	C,00106$
   2D7A                     512 00108$:
   2D7A DD F9         [10]  513 	ld	sp, ix
   2D7C DD E1         [14]  514 	pop	ix
   2D7E C9            [10]  515 	ret
                            516 	.area _CODE
                            517 	.area _INITIALIZER
                            518 	.area _CABS (ABS)
