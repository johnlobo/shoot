                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:53 2015
                              5 ;--------------------------------------------------------
                              6 	.module shoots
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_explosion
                             13 	.globl _add_score
                             14 	.globl _get_user_max_shoots
                             15 	.globl _check_collision_enemies
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_drawSprite
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
   6A72                      31 _shoots::
   6A72                      32 	.ds 160
   6B12                      33 _active_shoots::
   6B12                      34 	.ds 1
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/entities/shoots.c:13: void init_shoots(){
                             60 ;	---------------------------------
                             61 ; Function init_shoots
                             62 ; ---------------------------------
   357E                      63 _init_shoots::
                             64 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   357E 16 00         [ 7]   65 	ld	d,#0x00
   3580                      66 00102$:
                             67 ;src/entities/shoots.c:16: shoots[k].active=0;
   3580 6A            [ 4]   68 	ld	l,d
   3581 26 00         [ 7]   69 	ld	h,#0x00
   3583 29            [11]   70 	add	hl, hl
   3584 29            [11]   71 	add	hl, hl
   3585 29            [11]   72 	add	hl, hl
   3586 29            [11]   73 	add	hl, hl
   3587 3E 72         [ 7]   74 	ld	a,#<(_shoots)
   3589 85            [ 4]   75 	add	a, l
   358A 4F            [ 4]   76 	ld	c,a
   358B 3E 6A         [ 7]   77 	ld	a,#>(_shoots)
   358D 8C            [ 4]   78 	adc	a, h
   358E 47            [ 4]   79 	ld	b,a
   358F 21 08 00      [10]   80 	ld	hl,#0x0008
   3592 09            [11]   81 	add	hl,bc
   3593 36 00         [10]   82 	ld	(hl),#0x00
                             83 ;src/entities/shoots.c:17: shoots[k].x=0;
   3595 21 04 00      [10]   84 	ld	hl,#0x0004
   3598 09            [11]   85 	add	hl,bc
   3599 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/shoots.c:18: shoots[k].y=0;
   359B 21 05 00      [10]   88 	ld	hl,#0x0005
   359E 09            [11]   89 	add	hl,bc
   359F 36 00         [10]   90 	ld	(hl),#0x00
                             91 ;src/entities/shoots.c:19: shoots[k].w=0;
   35A1 21 06 00      [10]   92 	ld	hl,#0x0006
   35A4 09            [11]   93 	add	hl,bc
   35A5 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/shoots.c:20: shoots[k].h=0;
   35A7 21 07 00      [10]   96 	ld	hl,#0x0007
   35AA 09            [11]   97 	add	hl,bc
   35AB 36 00         [10]   98 	ld	(hl),#0x00
                             99 ;src/entities/shoots.c:21: shoots[k].frame=0;
   35AD 21 0A 00      [10]  100 	ld	hl,#0x000A
   35B0 09            [11]  101 	add	hl,bc
   35B1 36 00         [10]  102 	ld	(hl),#0x00
                            103 ;src/entities/shoots.c:22: shoots[k].lastmoved=0;
   35B3 21 0C 00      [10]  104 	ld	hl,#0x000C
   35B6 09            [11]  105 	add	hl,bc
   35B7 AF            [ 4]  106 	xor	a, a
   35B8 77            [ 7]  107 	ld	(hl), a
   35B9 23            [ 6]  108 	inc	hl
   35BA 77            [ 7]  109 	ld	(hl), a
   35BB 23            [ 6]  110 	inc	hl
   35BC AF            [ 4]  111 	xor	a, a
   35BD 77            [ 7]  112 	ld	(hl), a
   35BE 23            [ 6]  113 	inc	hl
   35BF 77            [ 7]  114 	ld	(hl), a
                            115 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   35C0 14            [ 4]  116 	inc	d
   35C1 7A            [ 4]  117 	ld	a,d
   35C2 D6 0A         [ 7]  118 	sub	a, #0x0A
   35C4 38 BA         [12]  119 	jr	C,00102$
                            120 ;src/entities/shoots.c:24: active_shoots=0;
   35C6 21 12 6B      [10]  121 	ld	hl,#_active_shoots + 0
   35C9 36 00         [10]  122 	ld	(hl), #0x00
   35CB C9            [10]  123 	ret
                            124 ;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
                            125 ;	---------------------------------
                            126 ; Function create_shoot
                            127 ; ---------------------------------
   35CC                     128 _create_shoot::
   35CC DD E5         [15]  129 	push	ix
   35CE DD 21 00 00   [14]  130 	ld	ix,#0
   35D2 DD 39         [15]  131 	add	ix,sp
   35D4 21 F4 FF      [10]  132 	ld	hl,#-12
   35D7 39            [11]  133 	add	hl,sp
   35D8 F9            [ 6]  134 	ld	sp,hl
                            135 ;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
   35D9 CD B2 39      [17]  136 	call	_get_user_max_shoots
   35DC 55            [ 4]  137 	ld	d,l
   35DD 3A 12 6B      [13]  138 	ld	a,(#_active_shoots + 0)
   35E0 92            [ 4]  139 	sub	a, d
   35E1 D2 F7 36      [10]  140 	jp	NC,00109$
                            141 ;src/entities/shoots.c:34: while (shoots[k].active){
   35E4 01 72 6A      [10]  142 	ld	bc,#_shoots+0
   35E7 16 00         [ 7]  143 	ld	d,#0x00
   35E9                     144 00101$:
   35E9 6A            [ 4]  145 	ld	l,d
   35EA 26 00         [ 7]  146 	ld	h,#0x00
   35EC 29            [11]  147 	add	hl, hl
   35ED 29            [11]  148 	add	hl, hl
   35EE 29            [11]  149 	add	hl, hl
   35EF 29            [11]  150 	add	hl, hl
   35F0 09            [11]  151 	add	hl,bc
   35F1 DD 75 FA      [19]  152 	ld	-6 (ix),l
   35F4 DD 74 FB      [19]  153 	ld	-5 (ix),h
   35F7 DD 7E FA      [19]  154 	ld	a,-6 (ix)
   35FA C6 08         [ 7]  155 	add	a, #0x08
   35FC 6F            [ 4]  156 	ld	l,a
   35FD DD 7E FB      [19]  157 	ld	a,-5 (ix)
   3600 CE 00         [ 7]  158 	adc	a, #0x00
   3602 67            [ 4]  159 	ld	h,a
   3603 7E            [ 7]  160 	ld	a,(hl)
   3604 B7            [ 4]  161 	or	a, a
   3605 28 03         [12]  162 	jr	Z,00103$
                            163 ;src/entities/shoots.c:35: k++;
   3607 14            [ 4]  164 	inc	d
   3608 18 DF         [12]  165 	jr	00101$
   360A                     166 00103$:
                            167 ;src/entities/shoots.c:37: shoots[k].active=1;
   360A 36 01         [10]  168 	ld	(hl),#0x01
                            169 ;src/entities/shoots.c:38: shoots[k].frame=0;
   360C DD 7E FA      [19]  170 	ld	a,-6 (ix)
   360F C6 0A         [ 7]  171 	add	a, #0x0A
   3611 6F            [ 4]  172 	ld	l,a
   3612 DD 7E FB      [19]  173 	ld	a,-5 (ix)
   3615 CE 00         [ 7]  174 	adc	a, #0x00
   3617 67            [ 4]  175 	ld	h,a
   3618 36 00         [10]  176 	ld	(hl),#0x00
                            177 ;src/entities/shoots.c:42: shoots[k].x=x;
   361A DD 7E FA      [19]  178 	ld	a,-6 (ix)
   361D C6 04         [ 7]  179 	add	a, #0x04
   361F DD 77 F4      [19]  180 	ld	-12 (ix),a
   3622 DD 7E FB      [19]  181 	ld	a,-5 (ix)
   3625 CE 00         [ 7]  182 	adc	a, #0x00
   3627 DD 77 F5      [19]  183 	ld	-11 (ix),a
                            184 ;src/entities/shoots.c:43: shoots[k].y=y;
   362A DD 7E FA      [19]  185 	ld	a,-6 (ix)
   362D C6 05         [ 7]  186 	add	a, #0x05
   362F DD 77 FC      [19]  187 	ld	-4 (ix),a
   3632 DD 7E FB      [19]  188 	ld	a,-5 (ix)
   3635 CE 00         [ 7]  189 	adc	a, #0x00
   3637 DD 77 FD      [19]  190 	ld	-3 (ix),a
                            191 ;src/entities/shoots.c:44: shoots[k].w=1;
   363A DD 7E FA      [19]  192 	ld	a,-6 (ix)
   363D C6 06         [ 7]  193 	add	a, #0x06
   363F DD 77 FE      [19]  194 	ld	-2 (ix),a
   3642 DD 7E FB      [19]  195 	ld	a,-5 (ix)
   3645 CE 00         [ 7]  196 	adc	a, #0x00
   3647 DD 77 FF      [19]  197 	ld	-1 (ix),a
                            198 ;src/entities/shoots.c:45: shoots[k].h=4;
   364A DD 7E FA      [19]  199 	ld	a,-6 (ix)
   364D C6 07         [ 7]  200 	add	a, #0x07
   364F DD 77 F6      [19]  201 	ld	-10 (ix),a
   3652 DD 7E FB      [19]  202 	ld	a,-5 (ix)
   3655 CE 00         [ 7]  203 	adc	a, #0x00
   3657 DD 77 F7      [19]  204 	ld	-9 (ix),a
                            205 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   365A DD 7E FA      [19]  206 	ld	a,-6 (ix)
   365D C6 09         [ 7]  207 	add	a, #0x09
   365F DD 77 F8      [19]  208 	ld	-8 (ix),a
   3662 DD 7E FB      [19]  209 	ld	a,-5 (ix)
   3665 CE 00         [ 7]  210 	adc	a, #0x00
   3667 DD 77 F9      [19]  211 	ld	-7 (ix),a
                            212 ;src/entities/shoots.c:39: switch (type){
   366A DD 7E 06      [19]  213 	ld	a,6 (ix)
   366D 3D            [ 4]  214 	dec	a
   366E 20 35         [12]  215 	jr	NZ,00105$
                            216 ;src/entities/shoots.c:42: shoots[k].x=x;
   3670 E1            [10]  217 	pop	hl
   3671 E5            [11]  218 	push	hl
   3672 DD 7E 04      [19]  219 	ld	a,4 (ix)
   3675 77            [ 7]  220 	ld	(hl),a
                            221 ;src/entities/shoots.c:43: shoots[k].y=y;
   3676 DD 6E FC      [19]  222 	ld	l,-4 (ix)
   3679 DD 66 FD      [19]  223 	ld	h,-3 (ix)
   367C DD 7E 05      [19]  224 	ld	a,5 (ix)
   367F 77            [ 7]  225 	ld	(hl),a
                            226 ;src/entities/shoots.c:44: shoots[k].w=1;
   3680 DD 6E FE      [19]  227 	ld	l,-2 (ix)
   3683 DD 66 FF      [19]  228 	ld	h,-1 (ix)
   3686 36 01         [10]  229 	ld	(hl),#0x01
                            230 ;src/entities/shoots.c:45: shoots[k].h=4;
   3688 DD 6E F6      [19]  231 	ld	l,-10 (ix)
   368B DD 66 F7      [19]  232 	ld	h,-9 (ix)
   368E 36 04         [10]  233 	ld	(hl),#0x04
                            234 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   3690 DD 6E F8      [19]  235 	ld	l,-8 (ix)
   3693 DD 66 F9      [19]  236 	ld	h,-7 (ix)
   3696 36 01         [10]  237 	ld	(hl),#0x01
                            238 ;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
   3698 DD 6E FA      [19]  239 	ld	l,-6 (ix)
   369B DD 66 FB      [19]  240 	ld	h,-5 (ix)
   369E 36 25         [10]  241 	ld	(hl),#<(_bullet02_0)
   36A0 23            [ 6]  242 	inc	hl
   36A1 36 43         [10]  243 	ld	(hl),#>(_bullet02_0)
                            244 ;src/entities/shoots.c:48: break;
   36A3 18 4E         [12]  245 	jr	00106$
                            246 ;src/entities/shoots.c:49: default:
   36A5                     247 00105$:
                            248 ;src/entities/shoots.c:50: shoots[k].x=x;
   36A5 E1            [10]  249 	pop	hl
   36A6 E5            [11]  250 	push	hl
   36A7 DD 7E 04      [19]  251 	ld	a,4 (ix)
   36AA 77            [ 7]  252 	ld	(hl),a
                            253 ;src/entities/shoots.c:51: shoots[k].y=y;
   36AB DD 6E FC      [19]  254 	ld	l,-4 (ix)
   36AE DD 66 FD      [19]  255 	ld	h,-3 (ix)
   36B1 DD 7E 05      [19]  256 	ld	a,5 (ix)
   36B4 77            [ 7]  257 	ld	(hl),a
                            258 ;src/entities/shoots.c:52: shoots[k].w=1;
   36B5 DD 6E FE      [19]  259 	ld	l,-2 (ix)
   36B8 DD 66 FF      [19]  260 	ld	h,-1 (ix)
   36BB 36 01         [10]  261 	ld	(hl),#0x01
                            262 ;src/entities/shoots.c:53: shoots[k].h=8;
   36BD DD 6E F6      [19]  263 	ld	l,-10 (ix)
   36C0 DD 66 F7      [19]  264 	ld	h,-9 (ix)
   36C3 36 08         [10]  265 	ld	(hl),#0x08
                            266 ;src/entities/shoots.c:54: shoots[k].num_frames=2;
   36C5 DD 6E F8      [19]  267 	ld	l,-8 (ix)
   36C8 DD 66 F9      [19]  268 	ld	h,-7 (ix)
   36CB 36 02         [10]  269 	ld	(hl),#0x02
                            270 ;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
   36CD DD 6E FA      [19]  271 	ld	l,-6 (ix)
   36D0 DD 66 FB      [19]  272 	ld	h,-5 (ix)
   36D3 36 15         [10]  273 	ld	(hl),#<(_bullet01_0)
   36D5 23            [ 6]  274 	inc	hl
   36D6 36 43         [10]  275 	ld	(hl),#>(_bullet01_0)
                            276 ;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
   36D8 DD 7E FA      [19]  277 	ld	a,-6 (ix)
   36DB C6 02         [ 7]  278 	add	a, #0x02
   36DD DD 77 F8      [19]  279 	ld	-8 (ix),a
   36E0 DD 7E FB      [19]  280 	ld	a,-5 (ix)
   36E3 CE 00         [ 7]  281 	adc	a, #0x00
   36E5 DD 77 F9      [19]  282 	ld	-7 (ix),a
   36E8 DD 6E F8      [19]  283 	ld	l,-8 (ix)
   36EB DD 66 F9      [19]  284 	ld	h,-7 (ix)
   36EE 36 1D         [10]  285 	ld	(hl),#<(_bullet01_1)
   36F0 23            [ 6]  286 	inc	hl
   36F1 36 43         [10]  287 	ld	(hl),#>(_bullet01_1)
                            288 ;src/entities/shoots.c:58: }
   36F3                     289 00106$:
                            290 ;src/entities/shoots.c:59: active_shoots++;
   36F3 21 12 6B      [10]  291 	ld	hl, #_active_shoots+0
   36F6 34            [11]  292 	inc	(hl)
   36F7                     293 00109$:
   36F7 DD F9         [10]  294 	ld	sp, ix
   36F9 DD E1         [14]  295 	pop	ix
   36FB C9            [10]  296 	ret
                            297 ;src/entities/shoots.c:68: void update_shoots(){
                            298 ;	---------------------------------
                            299 ; Function update_shoots
                            300 ; ---------------------------------
   36FC                     301 _update_shoots::
   36FC DD E5         [15]  302 	push	ix
   36FE DD 21 00 00   [14]  303 	ld	ix,#0
   3702 DD 39         [15]  304 	add	ix,sp
   3704 21 F7 FF      [10]  305 	ld	hl,#-9
   3707 39            [11]  306 	add	hl,sp
   3708 F9            [ 6]  307 	ld	sp,hl
                            308 ;src/entities/shoots.c:72: if (active_shoots>0){
   3709 3A 12 6B      [13]  309 	ld	a,(#_active_shoots + 0)
   370C B7            [ 4]  310 	or	a, a
   370D CA 0F 38      [10]  311 	jp	Z,00116$
                            312 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   3710 0E 00         [ 7]  313 	ld	c,#0x00
   3712                     314 00114$:
                            315 ;src/entities/shoots.c:74: if (shoots[i].active){
   3712 69            [ 4]  316 	ld	l,c
   3713 26 00         [ 7]  317 	ld	h,#0x00
   3715 29            [11]  318 	add	hl, hl
   3716 29            [11]  319 	add	hl, hl
   3717 29            [11]  320 	add	hl, hl
   3718 29            [11]  321 	add	hl, hl
   3719 3E 72         [ 7]  322 	ld	a,#<(_shoots)
   371B 85            [ 4]  323 	add	a, l
   371C DD 77 F7      [19]  324 	ld	-9 (ix),a
   371F 3E 6A         [ 7]  325 	ld	a,#>(_shoots)
   3721 8C            [ 4]  326 	adc	a, h
   3722 DD 77 F8      [19]  327 	ld	-8 (ix),a
   3725 DD 7E F7      [19]  328 	ld	a,-9 (ix)
   3728 C6 08         [ 7]  329 	add	a, #0x08
   372A DD 77 FC      [19]  330 	ld	-4 (ix),a
   372D DD 7E F8      [19]  331 	ld	a,-8 (ix)
   3730 CE 00         [ 7]  332 	adc	a, #0x00
   3732 DD 77 FD      [19]  333 	ld	-3 (ix),a
   3735 DD 6E FC      [19]  334 	ld	l,-4 (ix)
   3738 DD 66 FD      [19]  335 	ld	h,-3 (ix)
   373B 7E            [ 7]  336 	ld	a,(hl)
   373C B7            [ 4]  337 	or	a, a
   373D CA 08 38      [10]  338 	jp	Z,00115$
                            339 ;src/entities/shoots.c:75: shoots[i].y-=SHOOT_JUMP;
   3740 DD 7E F7      [19]  340 	ld	a,-9 (ix)
   3743 C6 05         [ 7]  341 	add	a, #0x05
   3745 5F            [ 4]  342 	ld	e,a
   3746 DD 7E F8      [19]  343 	ld	a,-8 (ix)
   3749 CE 00         [ 7]  344 	adc	a, #0x00
   374B 57            [ 4]  345 	ld	d,a
   374C 1A            [ 7]  346 	ld	a,(de)
   374D C6 F6         [ 7]  347 	add	a,#0xF6
   374F 47            [ 4]  348 	ld	b,a
   3750 12            [ 7]  349 	ld	(de),a
                            350 ;src/entities/shoots.c:76: if (shoots[i].y<200){
   3751 1A            [ 7]  351 	ld	a,(de)
   3752 DD 77 FB      [19]  352 	ld	-5 (ix),a
   3755 78            [ 4]  353 	ld	a,b
   3756 D6 C8         [ 7]  354 	sub	a, #0xC8
   3758 D2 FC 37      [10]  355 	jp	NC,00107$
                            356 ;src/entities/shoots.c:77: if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
   375B FD E1         [14]  357 	pop	iy
   375D FD E5         [15]  358 	push	iy
   375F FD 7E 07      [19]  359 	ld	a,7 (iy)
   3762 DD 77 FE      [19]  360 	ld	-2 (ix),a
   3765 E1            [10]  361 	pop	hl
   3766 E5            [11]  362 	push	hl
   3767 C5            [11]  363 	push	bc
   3768 01 06 00      [10]  364 	ld	bc, #0x0006
   376B 09            [11]  365 	add	hl, bc
   376C C1            [10]  366 	pop	bc
   376D 46            [ 7]  367 	ld	b,(hl)
   376E DD 7E F7      [19]  368 	ld	a,-9 (ix)
   3771 C6 04         [ 7]  369 	add	a, #0x04
   3773 DD 77 F9      [19]  370 	ld	-7 (ix),a
   3776 DD 7E F8      [19]  371 	ld	a,-8 (ix)
   3779 CE 00         [ 7]  372 	adc	a, #0x00
   377B DD 77 FA      [19]  373 	ld	-6 (ix),a
   377E DD 6E F9      [19]  374 	ld	l,-7 (ix)
   3781 DD 66 FA      [19]  375 	ld	h,-6 (ix)
   3784 7E            [ 7]  376 	ld	a,(hl)
   3785 DD 77 FF      [19]  377 	ld	-1 (ix),a
   3788 C5            [11]  378 	push	bc
   3789 D5            [11]  379 	push	de
   378A DD 7E FE      [19]  380 	ld	a,-2 (ix)
   378D F5            [11]  381 	push	af
   378E 33            [ 6]  382 	inc	sp
   378F C5            [11]  383 	push	bc
   3790 33            [ 6]  384 	inc	sp
   3791 DD 66 FB      [19]  385 	ld	h,-5 (ix)
   3794 DD 6E FF      [19]  386 	ld	l,-1 (ix)
   3797 E5            [11]  387 	push	hl
   3798 CD D2 24      [17]  388 	call	_check_collision_enemies
   379B F1            [10]  389 	pop	af
   379C F1            [10]  390 	pop	af
   379D 7D            [ 4]  391 	ld	a,l
   379E D1            [10]  392 	pop	de
   379F C1            [10]  393 	pop	bc
   37A0 B7            [ 4]  394 	or	a, a
   37A1 28 2F         [12]  395 	jr	Z,00104$
                            396 ;src/entities/shoots.c:78: create_explosion(shoots[i].x,shoots[i].y,0);
   37A3 1A            [ 7]  397 	ld	a,(de)
   37A4 57            [ 4]  398 	ld	d,a
   37A5 DD 6E F9      [19]  399 	ld	l,-7 (ix)
   37A8 DD 66 FA      [19]  400 	ld	h,-6 (ix)
   37AB 46            [ 7]  401 	ld	b,(hl)
   37AC C5            [11]  402 	push	bc
   37AD AF            [ 4]  403 	xor	a, a
   37AE F5            [11]  404 	push	af
   37AF 33            [ 6]  405 	inc	sp
   37B0 D5            [11]  406 	push	de
   37B1 33            [ 6]  407 	inc	sp
   37B2 C5            [11]  408 	push	bc
   37B3 33            [ 6]  409 	inc	sp
   37B4 CD 0F 31      [17]  410 	call	_create_explosion
   37B7 F1            [10]  411 	pop	af
   37B8 33            [ 6]  412 	inc	sp
   37B9 C1            [10]  413 	pop	bc
                            414 ;src/entities/shoots.c:79: shoots[i].active=0;
   37BA DD 6E FC      [19]  415 	ld	l,-4 (ix)
   37BD DD 66 FD      [19]  416 	ld	h,-3 (ix)
   37C0 36 00         [10]  417 	ld	(hl),#0x00
                            418 ;src/entities/shoots.c:80: active_shoots--;
   37C2 21 12 6B      [10]  419 	ld	hl, #_active_shoots+0
   37C5 35            [11]  420 	dec	(hl)
                            421 ;src/entities/shoots.c:81: add_score(10);
   37C6 C5            [11]  422 	push	bc
   37C7 21 0A 00      [10]  423 	ld	hl,#0x000A
   37CA E5            [11]  424 	push	hl
   37CB CD 25 3D      [17]  425 	call	_add_score
   37CE F1            [10]  426 	pop	af
   37CF C1            [10]  427 	pop	bc
   37D0 18 36         [12]  428 	jr	00115$
   37D2                     429 00104$:
                            430 ;src/entities/shoots.c:83: shoots[i].frame++;
   37D2 DD 7E F7      [19]  431 	ld	a,-9 (ix)
   37D5 C6 0A         [ 7]  432 	add	a, #0x0A
   37D7 5F            [ 4]  433 	ld	e,a
   37D8 DD 7E F8      [19]  434 	ld	a,-8 (ix)
   37DB CE 00         [ 7]  435 	adc	a, #0x00
   37DD 57            [ 4]  436 	ld	d,a
   37DE 1A            [ 7]  437 	ld	a,(de)
   37DF 3C            [ 4]  438 	inc	a
   37E0 DD 77 FF      [19]  439 	ld	-1 (ix), a
   37E3 12            [ 7]  440 	ld	(de),a
                            441 ;src/entities/shoots.c:84: if (shoots[i].frame==shoots[i].num_frames)
   37E4 E1            [10]  442 	pop	hl
   37E5 E5            [11]  443 	push	hl
   37E6 C5            [11]  444 	push	bc
   37E7 01 09 00      [10]  445 	ld	bc, #0x0009
   37EA 09            [11]  446 	add	hl, bc
   37EB C1            [10]  447 	pop	bc
   37EC 7E            [ 7]  448 	ld	a,(hl)
   37ED DD 77 F9      [19]  449 	ld	-7 (ix),a
   37F0 DD 7E FF      [19]  450 	ld	a,-1 (ix)
   37F3 DD 96 F9      [19]  451 	sub	a, -7 (ix)
   37F6 20 10         [12]  452 	jr	NZ,00115$
                            453 ;src/entities/shoots.c:85: shoots[i].frame=0;
   37F8 AF            [ 4]  454 	xor	a, a
   37F9 12            [ 7]  455 	ld	(de),a
   37FA 18 0C         [12]  456 	jr	00115$
   37FC                     457 00107$:
                            458 ;src/entities/shoots.c:89: shoots[i].active=0;
   37FC DD 6E FC      [19]  459 	ld	l,-4 (ix)
   37FF DD 66 FD      [19]  460 	ld	h,-3 (ix)
   3802 36 00         [10]  461 	ld	(hl),#0x00
                            462 ;src/entities/shoots.c:90: active_shoots--;
   3804 21 12 6B      [10]  463 	ld	hl, #_active_shoots+0
   3807 35            [11]  464 	dec	(hl)
   3808                     465 00115$:
                            466 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   3808 0C            [ 4]  467 	inc	c
   3809 79            [ 4]  468 	ld	a,c
   380A D6 0A         [ 7]  469 	sub	a, #0x0A
   380C DA 12 37      [10]  470 	jp	C,00114$
   380F                     471 00116$:
   380F DD F9         [10]  472 	ld	sp, ix
   3811 DD E1         [14]  473 	pop	ix
   3813 C9            [10]  474 	ret
                            475 ;src/entities/shoots.c:102: void draw_shoots(u8* screen){
                            476 ;	---------------------------------
                            477 ; Function draw_shoots
                            478 ; ---------------------------------
   3814                     479 _draw_shoots::
   3814 DD E5         [15]  480 	push	ix
   3816 DD 21 00 00   [14]  481 	ld	ix,#0
   381A DD 39         [15]  482 	add	ix,sp
   381C F5            [11]  483 	push	af
   381D F5            [11]  484 	push	af
   381E 3B            [ 6]  485 	dec	sp
                            486 ;src/entities/shoots.c:107: if (active_shoots>0){
   381F 3A 12 6B      [13]  487 	ld	a,(#_active_shoots + 0)
   3822 B7            [ 4]  488 	or	a, a
   3823 CA C9 38      [10]  489 	jp	Z,00108$
                            490 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   3826 0E 00         [ 7]  491 	ld	c,#0x00
   3828                     492 00106$:
                            493 ;src/entities/shoots.c:109: if (shoots[k].active){
   3828 69            [ 4]  494 	ld	l,c
   3829 26 00         [ 7]  495 	ld	h,#0x00
   382B 29            [11]  496 	add	hl, hl
   382C 29            [11]  497 	add	hl, hl
   382D 29            [11]  498 	add	hl, hl
   382E 29            [11]  499 	add	hl, hl
   382F 3E 72         [ 7]  500 	ld	a,#<(_shoots)
   3831 85            [ 4]  501 	add	a, l
   3832 DD 77 FE      [19]  502 	ld	-2 (ix),a
   3835 3E 6A         [ 7]  503 	ld	a,#>(_shoots)
   3837 8C            [ 4]  504 	adc	a, h
   3838 DD 77 FF      [19]  505 	ld	-1 (ix),a
   383B DD 6E FE      [19]  506 	ld	l,-2 (ix)
   383E DD 66 FF      [19]  507 	ld	h,-1 (ix)
   3841 11 08 00      [10]  508 	ld	de, #0x0008
   3844 19            [11]  509 	add	hl, de
   3845 7E            [ 7]  510 	ld	a,(hl)
   3846 B7            [ 4]  511 	or	a, a
   3847 28 79         [12]  512 	jr	Z,00107$
                            513 ;src/entities/shoots.c:110: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   3849 DD 6E FE      [19]  514 	ld	l,-2 (ix)
   384C DD 66 FF      [19]  515 	ld	h,-1 (ix)
   384F 11 05 00      [10]  516 	ld	de, #0x0005
   3852 19            [11]  517 	add	hl, de
   3853 56            [ 7]  518 	ld	d,(hl)
   3854 DD 6E FE      [19]  519 	ld	l,-2 (ix)
   3857 DD 66 FF      [19]  520 	ld	h,-1 (ix)
   385A 23            [ 6]  521 	inc	hl
   385B 23            [ 6]  522 	inc	hl
   385C 23            [ 6]  523 	inc	hl
   385D 23            [ 6]  524 	inc	hl
   385E 5E            [ 7]  525 	ld	e,(hl)
   385F E5            [11]  526 	push	hl
   3860 DD 6E 04      [19]  527 	ld	l,4 (ix)
   3863 DD 66 05      [19]  528 	ld	h,5 (ix)
   3866 E5            [11]  529 	push	hl
   3867 FD E1         [14]  530 	pop	iy
   3869 E1            [10]  531 	pop	hl
   386A C5            [11]  532 	push	bc
   386B D5            [11]  533 	push	de
   386C FD E5         [15]  534 	push	iy
   386E CD 25 56      [17]  535 	call	_cpct_getScreenPtr
   3871 C1            [10]  536 	pop	bc
   3872 5D            [ 4]  537 	ld	e, l
   3873 54            [ 4]  538 	ld	d, h
                            539 ;src/entities/shoots.c:111: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   3874 E5            [11]  540 	push	hl
   3875 DD 6E FE      [19]  541 	ld	l,-2 (ix)
   3878 DD 66 FF      [19]  542 	ld	h,-1 (ix)
   387B E5            [11]  543 	push	hl
   387C FD E1         [14]  544 	pop	iy
   387E E1            [10]  545 	pop	hl
   387F FD 7E 07      [19]  546 	ld	a,7 (iy)
   3882 DD 77 FD      [19]  547 	ld	-3 (ix),a
   3885 DD 6E FE      [19]  548 	ld	l,-2 (ix)
   3888 DD 66 FF      [19]  549 	ld	h,-1 (ix)
   388B C5            [11]  550 	push	bc
   388C 01 06 00      [10]  551 	ld	bc, #0x0006
   388F 09            [11]  552 	add	hl, bc
   3890 C1            [10]  553 	pop	bc
   3891 46            [ 7]  554 	ld	b,(hl)
   3892 33            [ 6]  555 	inc	sp
   3893 33            [ 6]  556 	inc	sp
   3894 D5            [11]  557 	push	de
   3895 DD 6E FE      [19]  558 	ld	l,-2 (ix)
   3898 DD 66 FF      [19]  559 	ld	h,-1 (ix)
   389B 11 0A 00      [10]  560 	ld	de, #0x000A
   389E 19            [11]  561 	add	hl, de
   389F 7E            [ 7]  562 	ld	a,(hl)
   38A0 87            [ 4]  563 	add	a, a
   38A1 5F            [ 4]  564 	ld	e,a
   38A2 DD 6E FE      [19]  565 	ld	l,-2 (ix)
   38A5 DD 66 FF      [19]  566 	ld	h,-1 (ix)
   38A8 16 00         [ 7]  567 	ld	d,#0x00
   38AA 19            [11]  568 	add	hl, de
   38AB 5E            [ 7]  569 	ld	e,(hl)
   38AC 23            [ 6]  570 	inc	hl
   38AD 56            [ 7]  571 	ld	d,(hl)
   38AE C5            [11]  572 	push	bc
   38AF DD 7E FD      [19]  573 	ld	a,-3 (ix)
   38B2 F5            [11]  574 	push	af
   38B3 33            [ 6]  575 	inc	sp
   38B4 C5            [11]  576 	push	bc
   38B5 33            [ 6]  577 	inc	sp
   38B6 DD 6E FB      [19]  578 	ld	l,-5 (ix)
   38B9 DD 66 FC      [19]  579 	ld	h,-4 (ix)
   38BC E5            [11]  580 	push	hl
   38BD D5            [11]  581 	push	de
   38BE CD E0 52      [17]  582 	call	_cpct_drawSprite
   38C1 C1            [10]  583 	pop	bc
   38C2                     584 00107$:
                            585 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   38C2 0C            [ 4]  586 	inc	c
   38C3 79            [ 4]  587 	ld	a,c
   38C4 D6 0A         [ 7]  588 	sub	a, #0x0A
   38C6 DA 28 38      [10]  589 	jp	C,00106$
   38C9                     590 00108$:
   38C9 DD F9         [10]  591 	ld	sp, ix
   38CB DD E1         [14]  592 	pop	ix
   38CD C9            [10]  593 	ret
                            594 	.area _CODE
                            595 	.area _INITIALIZER
                            596 	.area _CABS (ABS)
