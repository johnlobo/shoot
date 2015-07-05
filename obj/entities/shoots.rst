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
   43C1                      31 _shoots::
   43C1                      32 	.ds 180
   4475                      33 _active_shoots::
   4475                      34 	.ds 1
   4476                      35 _baddie_shoots::
   4476                      36 	.ds 72
   44BE                      37 _active_baddie_shoots::
   44BE                      38 	.ds 1
   44BF                      39 _max_baddie_shoots::
   44BF                      40 	.ds 1
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
   28A8                      69 _init_shoots::
   28A8 DD E5         [15]   70 	push	ix
   28AA DD 21 00 00   [14]   71 	ld	ix,#0
   28AE DD 39         [15]   72 	add	ix,sp
   28B0 3B            [ 6]   73 	dec	sp
                             74 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   28B1 DD 36 FF 00   [19]   75 	ld	-1 (ix),#0x00
   28B5 11 00 00      [10]   76 	ld	de,#0x0000
   28B8                      77 00102$:
                             78 ;src/entities/shoots.c:18: shoots[k].active=0;
   28B8 21 C1 43      [10]   79 	ld	hl,#_shoots
   28BB 19            [11]   80 	add	hl,de
   28BC 4D            [ 4]   81 	ld	c,l
   28BD 44            [ 4]   82 	ld	b,h
   28BE 21 08 00      [10]   83 	ld	hl,#0x0008
   28C1 09            [11]   84 	add	hl,bc
   28C2 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:19: shoots[k].x=0;
   28C4 21 04 00      [10]   87 	ld	hl,#0x0004
   28C7 09            [11]   88 	add	hl,bc
   28C8 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:20: shoots[k].y=0;
   28CA 21 05 00      [10]   91 	ld	hl,#0x0005
   28CD 09            [11]   92 	add	hl,bc
   28CE 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:21: shoots[k].w=0;
   28D0 21 06 00      [10]   95 	ld	hl,#0x0006
   28D3 09            [11]   96 	add	hl,bc
   28D4 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:22: shoots[k].h=0;
   28D6 21 07 00      [10]   99 	ld	hl,#0x0007
   28D9 09            [11]  100 	add	hl,bc
   28DA 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:23: shoots[k].frame=0;
   28DC 21 0A 00      [10]  103 	ld	hl,#0x000A
   28DF 09            [11]  104 	add	hl,bc
   28E0 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/shoots.c:24: shoots[k].new=0;
   28E2 21 0C 00      [10]  107 	ld	hl,#0x000C
   28E5 09            [11]  108 	add	hl,bc
   28E6 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/shoots.c:25: shoots[k].dead=0;
   28E8 21 0D 00      [10]  111 	ld	hl,#0x000D
   28EB 09            [11]  112 	add	hl,bc
   28EC 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/shoots.c:26: shoots[k].lastmoved=0;
   28EE 21 0E 00      [10]  115 	ld	hl,#0x000E
   28F1 09            [11]  116 	add	hl,bc
   28F2 AF            [ 4]  117 	xor	a, a
   28F3 77            [ 7]  118 	ld	(hl), a
   28F4 23            [ 6]  119 	inc	hl
   28F5 77            [ 7]  120 	ld	(hl), a
   28F6 23            [ 6]  121 	inc	hl
   28F7 AF            [ 4]  122 	xor	a, a
   28F8 77            [ 7]  123 	ld	(hl), a
   28F9 23            [ 6]  124 	inc	hl
   28FA 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   28FB 21 12 00      [10]  127 	ld	hl,#0x0012
   28FE 19            [11]  128 	add	hl,de
   28FF EB            [ 4]  129 	ex	de,hl
   2900 DD 34 FF      [23]  130 	inc	-1 (ix)
   2903 DD 7E FF      [19]  131 	ld	a,-1 (ix)
   2906 D6 0A         [ 7]  132 	sub	a, #0x0A
   2908 38 AE         [12]  133 	jr	C,00102$
                            134 ;src/entities/shoots.c:28: active_shoots=0;
   290A 21 75 44      [10]  135 	ld	hl,#_active_shoots + 0
   290D 36 00         [10]  136 	ld	(hl), #0x00
   290F 33            [ 6]  137 	inc	sp
   2910 DD E1         [14]  138 	pop	ix
   2912 C9            [10]  139 	ret
                            140 ;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_shoot
                            143 ; ---------------------------------
   2913                     144 _create_shoot::
   2913 DD E5         [15]  145 	push	ix
   2915 DD 21 00 00   [14]  146 	ld	ix,#0
   2919 DD 39         [15]  147 	add	ix,sp
   291B 21 F4 FF      [10]  148 	ld	hl,#-12
   291E 39            [11]  149 	add	hl,sp
   291F F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
   2920 CD 2C 2C      [17]  152 	call	_get_user_max_shoots
   2923 55            [ 4]  153 	ld	d,l
   2924 3A 75 44      [13]  154 	ld	a,(#_active_shoots + 0)
   2927 92            [ 4]  155 	sub	a, d
   2928 D2 38 2A      [10]  156 	jp	NC,00109$
                            157 ;src/entities/shoots.c:38: while (shoots[k].active){
   292B 11 00 00      [10]  158 	ld	de,#0x0000
   292E                     159 00101$:
   292E 21 C1 43      [10]  160 	ld	hl,#_shoots
   2931 19            [11]  161 	add	hl,de
   2932 DD 75 FE      [19]  162 	ld	-2 (ix),l
   2935 DD 74 FF      [19]  163 	ld	-1 (ix),h
   2938 DD 7E FE      [19]  164 	ld	a,-2 (ix)
   293B C6 08         [ 7]  165 	add	a, #0x08
   293D 6F            [ 4]  166 	ld	l,a
   293E DD 7E FF      [19]  167 	ld	a,-1 (ix)
   2941 CE 00         [ 7]  168 	adc	a, #0x00
   2943 67            [ 4]  169 	ld	h,a
   2944 7E            [ 7]  170 	ld	a,(hl)
   2945 B7            [ 4]  171 	or	a, a
   2946 28 07         [12]  172 	jr	Z,00103$
                            173 ;src/entities/shoots.c:39: k++;
   2948 21 12 00      [10]  174 	ld	hl,#0x0012
   294B 19            [11]  175 	add	hl,de
   294C EB            [ 4]  176 	ex	de,hl
   294D 18 DF         [12]  177 	jr	00101$
   294F                     178 00103$:
                            179 ;src/entities/shoots.c:41: shoots[k].active=1;
   294F 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/shoots.c:42: shoots[k].frame=0;
   2951 DD 7E FE      [19]  182 	ld	a,-2 (ix)
   2954 C6 0A         [ 7]  183 	add	a, #0x0A
   2956 6F            [ 4]  184 	ld	l,a
   2957 DD 7E FF      [19]  185 	ld	a,-1 (ix)
   295A CE 00         [ 7]  186 	adc	a, #0x00
   295C 67            [ 4]  187 	ld	h,a
   295D 36 00         [10]  188 	ld	(hl),#0x00
                            189 ;src/entities/shoots.c:46: shoots[k].x=x;
   295F DD 7E FE      [19]  190 	ld	a,-2 (ix)
   2962 C6 04         [ 7]  191 	add	a, #0x04
   2964 DD 77 FC      [19]  192 	ld	-4 (ix),a
   2967 DD 7E FF      [19]  193 	ld	a,-1 (ix)
   296A CE 00         [ 7]  194 	adc	a, #0x00
   296C DD 77 FD      [19]  195 	ld	-3 (ix),a
                            196 ;src/entities/shoots.c:47: shoots[k].y=y;
   296F DD 7E FE      [19]  197 	ld	a,-2 (ix)
   2972 C6 05         [ 7]  198 	add	a, #0x05
   2974 DD 77 FA      [19]  199 	ld	-6 (ix),a
   2977 DD 7E FF      [19]  200 	ld	a,-1 (ix)
   297A CE 00         [ 7]  201 	adc	a, #0x00
   297C DD 77 FB      [19]  202 	ld	-5 (ix),a
                            203 ;src/entities/shoots.c:48: shoots[k].w=1;
   297F DD 7E FE      [19]  204 	ld	a,-2 (ix)
   2982 C6 06         [ 7]  205 	add	a, #0x06
   2984 DD 77 F8      [19]  206 	ld	-8 (ix),a
   2987 DD 7E FF      [19]  207 	ld	a,-1 (ix)
   298A CE 00         [ 7]  208 	adc	a, #0x00
   298C DD 77 F9      [19]  209 	ld	-7 (ix),a
                            210 ;src/entities/shoots.c:49: shoots[k].h=4;
   298F DD 7E FE      [19]  211 	ld	a,-2 (ix)
   2992 C6 07         [ 7]  212 	add	a, #0x07
   2994 DD 77 F6      [19]  213 	ld	-10 (ix),a
   2997 DD 7E FF      [19]  214 	ld	a,-1 (ix)
   299A CE 00         [ 7]  215 	adc	a, #0x00
   299C DD 77 F7      [19]  216 	ld	-9 (ix),a
                            217 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   299F DD 7E FE      [19]  218 	ld	a,-2 (ix)
   29A2 C6 09         [ 7]  219 	add	a, #0x09
   29A4 DD 77 F4      [19]  220 	ld	-12 (ix),a
   29A7 DD 7E FF      [19]  221 	ld	a,-1 (ix)
   29AA CE 00         [ 7]  222 	adc	a, #0x00
   29AC DD 77 F5      [19]  223 	ld	-11 (ix),a
                            224 ;src/entities/shoots.c:43: switch (type){
   29AF DD 7E 06      [19]  225 	ld	a,6 (ix)
   29B2 3D            [ 4]  226 	dec	a
   29B3 20 35         [12]  227 	jr	NZ,00105$
                            228 ;src/entities/shoots.c:46: shoots[k].x=x;
   29B5 DD 6E FC      [19]  229 	ld	l,-4 (ix)
   29B8 DD 66 FD      [19]  230 	ld	h,-3 (ix)
   29BB DD 7E 04      [19]  231 	ld	a,4 (ix)
   29BE 77            [ 7]  232 	ld	(hl),a
                            233 ;src/entities/shoots.c:47: shoots[k].y=y;
   29BF DD 6E FA      [19]  234 	ld	l,-6 (ix)
   29C2 DD 66 FB      [19]  235 	ld	h,-5 (ix)
   29C5 DD 7E 05      [19]  236 	ld	a,5 (ix)
   29C8 77            [ 7]  237 	ld	(hl),a
                            238 ;src/entities/shoots.c:48: shoots[k].w=1;
   29C9 DD 6E F8      [19]  239 	ld	l,-8 (ix)
   29CC DD 66 F9      [19]  240 	ld	h,-7 (ix)
   29CF 36 01         [10]  241 	ld	(hl),#0x01
                            242 ;src/entities/shoots.c:49: shoots[k].h=4;
   29D1 DD 6E F6      [19]  243 	ld	l,-10 (ix)
   29D4 DD 66 F7      [19]  244 	ld	h,-9 (ix)
   29D7 36 04         [10]  245 	ld	(hl),#0x04
                            246 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   29D9 E1            [10]  247 	pop	hl
   29DA E5            [11]  248 	push	hl
   29DB 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
   29DD DD 6E FE      [19]  251 	ld	l,-2 (ix)
   29E0 DD 66 FF      [19]  252 	ld	h,-1 (ix)
   29E3 36 FE         [10]  253 	ld	(hl),#<(_bullet02_0)
   29E5 23            [ 6]  254 	inc	hl
   29E6 36 34         [10]  255 	ld	(hl),#>(_bullet02_0)
                            256 ;src/entities/shoots.c:52: break;
   29E8 18 4A         [12]  257 	jr	00106$
                            258 ;src/entities/shoots.c:53: default:
   29EA                     259 00105$:
                            260 ;src/entities/shoots.c:54: shoots[k].x=x;
   29EA DD 6E FC      [19]  261 	ld	l,-4 (ix)
   29ED DD 66 FD      [19]  262 	ld	h,-3 (ix)
   29F0 DD 7E 04      [19]  263 	ld	a,4 (ix)
   29F3 77            [ 7]  264 	ld	(hl),a
                            265 ;src/entities/shoots.c:55: shoots[k].y=y;
   29F4 DD 6E FA      [19]  266 	ld	l,-6 (ix)
   29F7 DD 66 FB      [19]  267 	ld	h,-5 (ix)
   29FA DD 7E 05      [19]  268 	ld	a,5 (ix)
   29FD 77            [ 7]  269 	ld	(hl),a
                            270 ;src/entities/shoots.c:56: shoots[k].w=1;
   29FE DD 6E F8      [19]  271 	ld	l,-8 (ix)
   2A01 DD 66 F9      [19]  272 	ld	h,-7 (ix)
   2A04 36 01         [10]  273 	ld	(hl),#0x01
                            274 ;src/entities/shoots.c:57: shoots[k].h=8;
   2A06 DD 6E F6      [19]  275 	ld	l,-10 (ix)
   2A09 DD 66 F7      [19]  276 	ld	h,-9 (ix)
   2A0C 36 08         [10]  277 	ld	(hl),#0x08
                            278 ;src/entities/shoots.c:58: shoots[k].num_frames=2;
   2A0E E1            [10]  279 	pop	hl
   2A0F E5            [11]  280 	push	hl
   2A10 36 02         [10]  281 	ld	(hl),#0x02
                            282 ;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
   2A12 DD 6E FE      [19]  283 	ld	l,-2 (ix)
   2A15 DD 66 FF      [19]  284 	ld	h,-1 (ix)
   2A18 36 EE         [10]  285 	ld	(hl),#<(_bullet01_0)
   2A1A 23            [ 6]  286 	inc	hl
   2A1B 36 34         [10]  287 	ld	(hl),#>(_bullet01_0)
                            288 ;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
   2A1D DD 7E FE      [19]  289 	ld	a,-2 (ix)
   2A20 C6 02         [ 7]  290 	add	a, #0x02
   2A22 DD 77 F4      [19]  291 	ld	-12 (ix),a
   2A25 DD 7E FF      [19]  292 	ld	a,-1 (ix)
   2A28 CE 00         [ 7]  293 	adc	a, #0x00
   2A2A DD 77 F5      [19]  294 	ld	-11 (ix),a
   2A2D E1            [10]  295 	pop	hl
   2A2E E5            [11]  296 	push	hl
   2A2F 36 F6         [10]  297 	ld	(hl),#<(_bullet01_1)
   2A31 23            [ 6]  298 	inc	hl
   2A32 36 34         [10]  299 	ld	(hl),#>(_bullet01_1)
                            300 ;src/entities/shoots.c:62: }
   2A34                     301 00106$:
                            302 ;src/entities/shoots.c:63: active_shoots++;
   2A34 21 75 44      [10]  303 	ld	hl, #_active_shoots+0
   2A37 34            [11]  304 	inc	(hl)
   2A38                     305 00109$:
   2A38 DD F9         [10]  306 	ld	sp, ix
   2A3A DD E1         [14]  307 	pop	ix
   2A3C C9            [10]  308 	ret
                            309 ;src/entities/shoots.c:72: void update_shoots(){
                            310 ;	---------------------------------
                            311 ; Function update_shoots
                            312 ; ---------------------------------
   2A3D                     313 _update_shoots::
   2A3D DD E5         [15]  314 	push	ix
   2A3F DD 21 00 00   [14]  315 	ld	ix,#0
   2A43 DD 39         [15]  316 	add	ix,sp
   2A45 F5            [11]  317 	push	af
   2A46 3B            [ 6]  318 	dec	sp
                            319 ;src/entities/shoots.c:75: if (active_shoots>0){
   2A47 3A 75 44      [13]  320 	ld	a,(#_active_shoots + 0)
   2A4A B7            [ 4]  321 	or	a, a
   2A4B CA CE 2A      [10]  322 	jp	Z,00113$
                            323 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2A4E DD 36 FD 00   [19]  324 	ld	-3 (ix),#0x00
   2A52 11 00 00      [10]  325 	ld	de,#0x0000
   2A55                     326 00111$:
                            327 ;src/entities/shoots.c:77: if (shoots[i].active){
   2A55 21 C1 43      [10]  328 	ld	hl,#_shoots
   2A58 19            [11]  329 	add	hl,de
   2A59 DD 75 FE      [19]  330 	ld	-2 (ix),l
   2A5C DD 74 FF      [19]  331 	ld	-1 (ix),h
   2A5F DD 7E FE      [19]  332 	ld	a,-2 (ix)
   2A62 C6 08         [ 7]  333 	add	a, #0x08
   2A64 4F            [ 4]  334 	ld	c,a
   2A65 DD 7E FF      [19]  335 	ld	a,-1 (ix)
   2A68 CE 00         [ 7]  336 	adc	a, #0x00
   2A6A 47            [ 4]  337 	ld	b,a
   2A6B 0A            [ 7]  338 	ld	a,(bc)
   2A6C B7            [ 4]  339 	or	a, a
   2A6D 28 50         [12]  340 	jr	Z,00112$
                            341 ;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
   2A6F FD 21 05 00   [14]  342 	ld	iy,#0x0005
   2A73 C5            [11]  343 	push	bc
   2A74 DD 4E FE      [19]  344 	ld	c,-2 (ix)
   2A77 DD 46 FF      [19]  345 	ld	b,-1 (ix)
   2A7A FD 09         [15]  346 	add	iy, bc
   2A7C C1            [10]  347 	pop	bc
   2A7D FD 7E 00      [19]  348 	ld	a, 0 (iy)
   2A80 C6 F8         [ 7]  349 	add	a,#0xF8
   2A82 67            [ 4]  350 	ld	h,a
   2A83 FD 74 00      [19]  351 	ld	0 (iy), h
                            352 ;src/entities/shoots.c:79: if (shoots[i].y<200){
   2A86 7C            [ 4]  353 	ld	a,h
   2A87 D6 C8         [ 7]  354 	sub	a, #0xC8
   2A89 30 2E         [12]  355 	jr	NC,00104$
                            356 ;src/entities/shoots.c:80: shoots[i].frame++;
   2A8B FD 21 0A 00   [14]  357 	ld	iy,#0x000A
   2A8F DD 4E FE      [19]  358 	ld	c,-2 (ix)
   2A92 DD 46 FF      [19]  359 	ld	b,-1 (ix)
   2A95 FD 09         [15]  360 	add	iy, bc
   2A97 FD 34 00      [23]  361 	inc	0 (iy)
   2A9A FD 4E 00      [19]  362 	ld	c, 0 (iy)
                            363 ;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
   2A9D DD 6E FE      [19]  364 	ld	l,-2 (ix)
   2AA0 DD 66 FF      [19]  365 	ld	h,-1 (ix)
   2AA3 C5            [11]  366 	push	bc
   2AA4 01 09 00      [10]  367 	ld	bc, #0x0009
   2AA7 09            [11]  368 	add	hl, bc
   2AA8 C1            [10]  369 	pop	bc
   2AA9 7E            [ 7]  370 	ld	a,(hl)
   2AAA DD 77 FE      [19]  371 	ld	-2 (ix),a
   2AAD 79            [ 4]  372 	ld	a,c
   2AAE DD 96 FE      [19]  373 	sub	a, -2 (ix)
   2AB1 20 0C         [12]  374 	jr	NZ,00112$
                            375 ;src/entities/shoots.c:82: shoots[i].frame=0;
   2AB3 FD 36 00 00   [19]  376 	ld	0 (iy), #0x00
   2AB7 18 06         [12]  377 	jr	00112$
   2AB9                     378 00104$:
                            379 ;src/entities/shoots.c:85: shoots[i].active=0;
   2AB9 AF            [ 4]  380 	xor	a, a
   2ABA 02            [ 7]  381 	ld	(bc),a
                            382 ;src/entities/shoots.c:86: active_shoots--;
   2ABB 21 75 44      [10]  383 	ld	hl, #_active_shoots+0
   2ABE 35            [11]  384 	dec	(hl)
   2ABF                     385 00112$:
                            386 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2ABF 21 12 00      [10]  387 	ld	hl,#0x0012
   2AC2 19            [11]  388 	add	hl,de
   2AC3 EB            [ 4]  389 	ex	de,hl
   2AC4 DD 34 FD      [23]  390 	inc	-3 (ix)
   2AC7 DD 7E FD      [19]  391 	ld	a,-3 (ix)
   2ACA D6 0A         [ 7]  392 	sub	a, #0x0A
   2ACC 38 87         [12]  393 	jr	C,00111$
   2ACE                     394 00113$:
   2ACE DD F9         [10]  395 	ld	sp, ix
   2AD0 DD E1         [14]  396 	pop	ix
   2AD2 C9            [10]  397 	ret
                            398 ;src/entities/shoots.c:98: void draw_shoots(u8* screen){
                            399 ;	---------------------------------
                            400 ; Function draw_shoots
                            401 ; ---------------------------------
   2AD3                     402 _draw_shoots::
   2AD3 DD E5         [15]  403 	push	ix
   2AD5 DD 21 00 00   [14]  404 	ld	ix,#0
   2AD9 DD 39         [15]  405 	add	ix,sp
   2ADB 21 F9 FF      [10]  406 	ld	hl,#-7
   2ADE 39            [11]  407 	add	hl,sp
   2ADF F9            [ 6]  408 	ld	sp,hl
                            409 ;src/entities/shoots.c:103: if (active_shoots>0){
   2AE0 3A 75 44      [13]  410 	ld	a,(#_active_shoots + 0)
   2AE3 B7            [ 4]  411 	or	a, a
   2AE4 CA 9C 2B      [10]  412 	jp	Z,00108$
                            413 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2AE7 DD 36 F9 00   [19]  414 	ld	-7 (ix),#0x00
   2AEB 11 00 00      [10]  415 	ld	de,#0x0000
   2AEE                     416 00106$:
                            417 ;src/entities/shoots.c:105: if (shoots[k].active){
   2AEE 21 C1 43      [10]  418 	ld	hl,#_shoots
   2AF1 19            [11]  419 	add	hl,de
   2AF2 DD 75 FD      [19]  420 	ld	-3 (ix),l
   2AF5 DD 74 FE      [19]  421 	ld	-2 (ix),h
   2AF8 DD 6E FD      [19]  422 	ld	l,-3 (ix)
   2AFB DD 66 FE      [19]  423 	ld	h,-2 (ix)
   2AFE 01 08 00      [10]  424 	ld	bc, #0x0008
   2B01 09            [11]  425 	add	hl, bc
   2B02 7E            [ 7]  426 	ld	a,(hl)
   2B03 B7            [ 4]  427 	or	a, a
   2B04 CA 8C 2B      [10]  428 	jp	Z,00107$
                            429 ;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   2B07 DD 6E FD      [19]  430 	ld	l,-3 (ix)
   2B0A DD 66 FE      [19]  431 	ld	h,-2 (ix)
   2B0D 01 05 00      [10]  432 	ld	bc, #0x0005
   2B10 09            [11]  433 	add	hl, bc
   2B11 46            [ 7]  434 	ld	b,(hl)
   2B12 DD 6E FD      [19]  435 	ld	l,-3 (ix)
   2B15 DD 66 FE      [19]  436 	ld	h,-2 (ix)
   2B18 23            [ 6]  437 	inc	hl
   2B19 23            [ 6]  438 	inc	hl
   2B1A 23            [ 6]  439 	inc	hl
   2B1B 23            [ 6]  440 	inc	hl
   2B1C 4E            [ 7]  441 	ld	c,(hl)
   2B1D E5            [11]  442 	push	hl
   2B1E DD 6E 04      [19]  443 	ld	l,4 (ix)
   2B21 DD 66 05      [19]  444 	ld	h,5 (ix)
   2B24 E5            [11]  445 	push	hl
   2B25 FD E1         [14]  446 	pop	iy
   2B27 E1            [10]  447 	pop	hl
   2B28 D5            [11]  448 	push	de
   2B29 C5            [11]  449 	push	bc
   2B2A FD E5         [15]  450 	push	iy
   2B2C CD EC 40      [17]  451 	call	_cpct_getScreenPtr
   2B2F F1            [10]  452 	pop	af
   2B30 F1            [10]  453 	pop	af
   2B31 D1            [10]  454 	pop	de
   2B32 45            [ 4]  455 	ld	b,l
   2B33 4C            [ 4]  456 	ld	c,h
                            457 ;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   2B34 DD 6E FD      [19]  458 	ld	l,-3 (ix)
   2B37 DD 66 FE      [19]  459 	ld	h,-2 (ix)
   2B3A C5            [11]  460 	push	bc
   2B3B 01 07 00      [10]  461 	ld	bc, #0x0007
   2B3E 09            [11]  462 	add	hl, bc
   2B3F C1            [10]  463 	pop	bc
   2B40 7E            [ 7]  464 	ld	a,(hl)
   2B41 DD 77 FF      [19]  465 	ld	-1 (ix),a
   2B44 DD 6E FD      [19]  466 	ld	l,-3 (ix)
   2B47 DD 66 FE      [19]  467 	ld	h,-2 (ix)
   2B4A C5            [11]  468 	push	bc
   2B4B 01 06 00      [10]  469 	ld	bc, #0x0006
   2B4E 09            [11]  470 	add	hl, bc
   2B4F C1            [10]  471 	pop	bc
   2B50 7E            [ 7]  472 	ld	a,(hl)
   2B51 DD 77 FC      [19]  473 	ld	-4 (ix),a
   2B54 DD 70 FA      [19]  474 	ld	-6 (ix),b
   2B57 DD 71 FB      [19]  475 	ld	-5 (ix),c
   2B5A DD 6E FD      [19]  476 	ld	l,-3 (ix)
   2B5D DD 66 FE      [19]  477 	ld	h,-2 (ix)
   2B60 01 0A 00      [10]  478 	ld	bc, #0x000A
   2B63 09            [11]  479 	add	hl, bc
   2B64 7E            [ 7]  480 	ld	a,(hl)
   2B65 87            [ 4]  481 	add	a, a
   2B66 4F            [ 4]  482 	ld	c,a
   2B67 DD 6E FD      [19]  483 	ld	l,-3 (ix)
   2B6A DD 66 FE      [19]  484 	ld	h,-2 (ix)
   2B6D 06 00         [ 7]  485 	ld	b,#0x00
   2B6F 09            [11]  486 	add	hl, bc
   2B70 4E            [ 7]  487 	ld	c,(hl)
   2B71 23            [ 6]  488 	inc	hl
   2B72 46            [ 7]  489 	ld	b,(hl)
   2B73 D5            [11]  490 	push	de
   2B74 DD 66 FF      [19]  491 	ld	h,-1 (ix)
   2B77 DD 6E FC      [19]  492 	ld	l,-4 (ix)
   2B7A E5            [11]  493 	push	hl
   2B7B DD 6E FA      [19]  494 	ld	l,-6 (ix)
   2B7E DD 66 FB      [19]  495 	ld	h,-5 (ix)
   2B81 E5            [11]  496 	push	hl
   2B82 C5            [11]  497 	push	bc
   2B83 CD BD 3E      [17]  498 	call	_cpct_drawSprite
   2B86 21 06 00      [10]  499 	ld	hl,#6
   2B89 39            [11]  500 	add	hl,sp
   2B8A F9            [ 6]  501 	ld	sp,hl
   2B8B D1            [10]  502 	pop	de
   2B8C                     503 00107$:
                            504 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   2B8C 21 12 00      [10]  505 	ld	hl,#0x0012
   2B8F 19            [11]  506 	add	hl,de
   2B90 EB            [ 4]  507 	ex	de,hl
   2B91 DD 34 F9      [23]  508 	inc	-7 (ix)
   2B94 DD 7E F9      [19]  509 	ld	a,-7 (ix)
   2B97 D6 0A         [ 7]  510 	sub	a, #0x0A
   2B99 DA EE 2A      [10]  511 	jp	C,00106$
   2B9C                     512 00108$:
   2B9C DD F9         [10]  513 	ld	sp, ix
   2B9E DD E1         [14]  514 	pop	ix
   2BA0 C9            [10]  515 	ret
                            516 	.area _CODE
                            517 	.area _INITIALIZER
                            518 	.area _CABS (ABS)
