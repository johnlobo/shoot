                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Sun Aug 16 01:47:05 2015
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
   6AD6                      31 _shoots::
   6AD6                      32 	.ds 160
   6B76                      33 _active_shoots::
   6B76                      34 	.ds 1
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
   35F2                      63 _init_shoots::
                             64 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   35F2 16 00         [ 7]   65 	ld	d,#0x00
   35F4                      66 00102$:
                             67 ;src/entities/shoots.c:16: shoots[k].active=0;
   35F4 6A            [ 4]   68 	ld	l,d
   35F5 26 00         [ 7]   69 	ld	h,#0x00
   35F7 29            [11]   70 	add	hl, hl
   35F8 29            [11]   71 	add	hl, hl
   35F9 29            [11]   72 	add	hl, hl
   35FA 29            [11]   73 	add	hl, hl
   35FB 3E D6         [ 7]   74 	ld	a,#<(_shoots)
   35FD 85            [ 4]   75 	add	a, l
   35FE 4F            [ 4]   76 	ld	c,a
   35FF 3E 6A         [ 7]   77 	ld	a,#>(_shoots)
   3601 8C            [ 4]   78 	adc	a, h
   3602 47            [ 4]   79 	ld	b,a
   3603 21 08 00      [10]   80 	ld	hl,#0x0008
   3606 09            [11]   81 	add	hl,bc
   3607 36 00         [10]   82 	ld	(hl),#0x00
                             83 ;src/entities/shoots.c:17: shoots[k].x=0;
   3609 21 04 00      [10]   84 	ld	hl,#0x0004
   360C 09            [11]   85 	add	hl,bc
   360D 36 00         [10]   86 	ld	(hl),#0x00
                             87 ;src/entities/shoots.c:18: shoots[k].y=0;
   360F 21 05 00      [10]   88 	ld	hl,#0x0005
   3612 09            [11]   89 	add	hl,bc
   3613 36 00         [10]   90 	ld	(hl),#0x00
                             91 ;src/entities/shoots.c:19: shoots[k].w=0;
   3615 21 06 00      [10]   92 	ld	hl,#0x0006
   3618 09            [11]   93 	add	hl,bc
   3619 36 00         [10]   94 	ld	(hl),#0x00
                             95 ;src/entities/shoots.c:20: shoots[k].h=0;
   361B 21 07 00      [10]   96 	ld	hl,#0x0007
   361E 09            [11]   97 	add	hl,bc
   361F 36 00         [10]   98 	ld	(hl),#0x00
                             99 ;src/entities/shoots.c:21: shoots[k].frame=0;
   3621 21 0A 00      [10]  100 	ld	hl,#0x000A
   3624 09            [11]  101 	add	hl,bc
   3625 36 00         [10]  102 	ld	(hl),#0x00
                            103 ;src/entities/shoots.c:22: shoots[k].last_moved=0;
   3627 21 0C 00      [10]  104 	ld	hl,#0x000C
   362A 09            [11]  105 	add	hl,bc
   362B AF            [ 4]  106 	xor	a, a
   362C 77            [ 7]  107 	ld	(hl), a
   362D 23            [ 6]  108 	inc	hl
   362E 77            [ 7]  109 	ld	(hl), a
   362F 23            [ 6]  110 	inc	hl
   3630 AF            [ 4]  111 	xor	a, a
   3631 77            [ 7]  112 	ld	(hl), a
   3632 23            [ 6]  113 	inc	hl
   3633 77            [ 7]  114 	ld	(hl), a
                            115 ;src/entities/shoots.c:15: for (k=0;k<MAX_SHOOTS;k++){
   3634 14            [ 4]  116 	inc	d
   3635 7A            [ 4]  117 	ld	a,d
   3636 D6 0A         [ 7]  118 	sub	a, #0x0A
   3638 38 BA         [12]  119 	jr	C,00102$
                            120 ;src/entities/shoots.c:24: active_shoots=0;
   363A 21 76 6B      [10]  121 	ld	hl,#_active_shoots + 0
   363D 36 00         [10]  122 	ld	(hl), #0x00
   363F C9            [10]  123 	ret
                            124 ;src/entities/shoots.c:30: void create_shoot(u8 x, u8 y, u8 type){
                            125 ;	---------------------------------
                            126 ; Function create_shoot
                            127 ; ---------------------------------
   3640                     128 _create_shoot::
   3640 DD E5         [15]  129 	push	ix
   3642 DD 21 00 00   [14]  130 	ld	ix,#0
   3646 DD 39         [15]  131 	add	ix,sp
   3648 21 F4 FF      [10]  132 	ld	hl,#-12
   364B 39            [11]  133 	add	hl,sp
   364C F9            [ 6]  134 	ld	sp,hl
                            135 ;src/entities/shoots.c:32: if (active_shoots < get_user_max_shoots()){
   364D CD 34 3A      [17]  136 	call	_get_user_max_shoots
   3650 55            [ 4]  137 	ld	d,l
   3651 3A 76 6B      [13]  138 	ld	a,(#_active_shoots + 0)
   3654 92            [ 4]  139 	sub	a, d
   3655 D2 67 37      [10]  140 	jp	NC,00109$
                            141 ;src/entities/shoots.c:34: while (shoots[k].active){
   3658 01 D6 6A      [10]  142 	ld	bc,#_shoots+0
   365B 16 00         [ 7]  143 	ld	d,#0x00
   365D                     144 00101$:
   365D 6A            [ 4]  145 	ld	l,d
   365E 26 00         [ 7]  146 	ld	h,#0x00
   3660 29            [11]  147 	add	hl, hl
   3661 29            [11]  148 	add	hl, hl
   3662 29            [11]  149 	add	hl, hl
   3663 29            [11]  150 	add	hl, hl
   3664 09            [11]  151 	add	hl,bc
   3665 DD 75 FC      [19]  152 	ld	-4 (ix),l
   3668 DD 74 FD      [19]  153 	ld	-3 (ix),h
   366B DD 7E FC      [19]  154 	ld	a,-4 (ix)
   366E C6 08         [ 7]  155 	add	a, #0x08
   3670 6F            [ 4]  156 	ld	l,a
   3671 DD 7E FD      [19]  157 	ld	a,-3 (ix)
   3674 CE 00         [ 7]  158 	adc	a, #0x00
   3676 67            [ 4]  159 	ld	h,a
   3677 7E            [ 7]  160 	ld	a,(hl)
   3678 B7            [ 4]  161 	or	a, a
   3679 28 03         [12]  162 	jr	Z,00103$
                            163 ;src/entities/shoots.c:35: k++;
   367B 14            [ 4]  164 	inc	d
   367C 18 DF         [12]  165 	jr	00101$
   367E                     166 00103$:
                            167 ;src/entities/shoots.c:37: shoots[k].active=1;
   367E 36 01         [10]  168 	ld	(hl),#0x01
                            169 ;src/entities/shoots.c:38: shoots[k].frame=0;
   3680 DD 7E FC      [19]  170 	ld	a,-4 (ix)
   3683 C6 0A         [ 7]  171 	add	a, #0x0A
   3685 6F            [ 4]  172 	ld	l,a
   3686 DD 7E FD      [19]  173 	ld	a,-3 (ix)
   3689 CE 00         [ 7]  174 	adc	a, #0x00
   368B 67            [ 4]  175 	ld	h,a
   368C 36 00         [10]  176 	ld	(hl),#0x00
                            177 ;src/entities/shoots.c:42: shoots[k].x=x;
   368E DD 7E FC      [19]  178 	ld	a,-4 (ix)
   3691 C6 04         [ 7]  179 	add	a, #0x04
   3693 DD 77 FE      [19]  180 	ld	-2 (ix),a
   3696 DD 7E FD      [19]  181 	ld	a,-3 (ix)
   3699 CE 00         [ 7]  182 	adc	a, #0x00
   369B DD 77 FF      [19]  183 	ld	-1 (ix),a
                            184 ;src/entities/shoots.c:43: shoots[k].y=y;
   369E DD 7E FC      [19]  185 	ld	a,-4 (ix)
   36A1 C6 05         [ 7]  186 	add	a, #0x05
   36A3 DD 77 FA      [19]  187 	ld	-6 (ix),a
   36A6 DD 7E FD      [19]  188 	ld	a,-3 (ix)
   36A9 CE 00         [ 7]  189 	adc	a, #0x00
   36AB DD 77 FB      [19]  190 	ld	-5 (ix),a
                            191 ;src/entities/shoots.c:44: shoots[k].w=1;
   36AE DD 7E FC      [19]  192 	ld	a,-4 (ix)
   36B1 C6 06         [ 7]  193 	add	a, #0x06
   36B3 DD 77 F8      [19]  194 	ld	-8 (ix),a
   36B6 DD 7E FD      [19]  195 	ld	a,-3 (ix)
   36B9 CE 00         [ 7]  196 	adc	a, #0x00
   36BB DD 77 F9      [19]  197 	ld	-7 (ix),a
                            198 ;src/entities/shoots.c:45: shoots[k].h=4;
   36BE DD 7E FC      [19]  199 	ld	a,-4 (ix)
   36C1 C6 07         [ 7]  200 	add	a, #0x07
   36C3 DD 77 F6      [19]  201 	ld	-10 (ix),a
   36C6 DD 7E FD      [19]  202 	ld	a,-3 (ix)
   36C9 CE 00         [ 7]  203 	adc	a, #0x00
   36CB DD 77 F7      [19]  204 	ld	-9 (ix),a
                            205 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   36CE DD 7E FC      [19]  206 	ld	a,-4 (ix)
   36D1 C6 09         [ 7]  207 	add	a, #0x09
   36D3 DD 77 F4      [19]  208 	ld	-12 (ix),a
   36D6 DD 7E FD      [19]  209 	ld	a,-3 (ix)
   36D9 CE 00         [ 7]  210 	adc	a, #0x00
   36DB DD 77 F5      [19]  211 	ld	-11 (ix),a
                            212 ;src/entities/shoots.c:39: switch (type){
   36DE DD 7E 06      [19]  213 	ld	a,6 (ix)
   36E1 3D            [ 4]  214 	dec	a
   36E2 20 35         [12]  215 	jr	NZ,00105$
                            216 ;src/entities/shoots.c:42: shoots[k].x=x;
   36E4 DD 6E FE      [19]  217 	ld	l,-2 (ix)
   36E7 DD 66 FF      [19]  218 	ld	h,-1 (ix)
   36EA DD 7E 04      [19]  219 	ld	a,4 (ix)
   36ED 77            [ 7]  220 	ld	(hl),a
                            221 ;src/entities/shoots.c:43: shoots[k].y=y;
   36EE DD 6E FA      [19]  222 	ld	l,-6 (ix)
   36F1 DD 66 FB      [19]  223 	ld	h,-5 (ix)
   36F4 DD 7E 05      [19]  224 	ld	a,5 (ix)
   36F7 77            [ 7]  225 	ld	(hl),a
                            226 ;src/entities/shoots.c:44: shoots[k].w=1;
   36F8 DD 6E F8      [19]  227 	ld	l,-8 (ix)
   36FB DD 66 F9      [19]  228 	ld	h,-7 (ix)
   36FE 36 01         [10]  229 	ld	(hl),#0x01
                            230 ;src/entities/shoots.c:45: shoots[k].h=4;
   3700 DD 6E F6      [19]  231 	ld	l,-10 (ix)
   3703 DD 66 F7      [19]  232 	ld	h,-9 (ix)
   3706 36 04         [10]  233 	ld	(hl),#0x04
                            234 ;src/entities/shoots.c:46: shoots[k].num_frames=1;
   3708 E1            [10]  235 	pop	hl
   3709 E5            [11]  236 	push	hl
   370A 36 01         [10]  237 	ld	(hl),#0x01
                            238 ;src/entities/shoots.c:47: shoots[k].sprite[0]= (u8*) bullet02_0;
   370C DD 6E FC      [19]  239 	ld	l,-4 (ix)
   370F DD 66 FD      [19]  240 	ld	h,-3 (ix)
   3712 36 97         [10]  241 	ld	(hl),#<(_bullet02_0)
   3714 23            [ 6]  242 	inc	hl
   3715 36 43         [10]  243 	ld	(hl),#>(_bullet02_0)
                            244 ;src/entities/shoots.c:48: break;
   3717 18 4A         [12]  245 	jr	00106$
                            246 ;src/entities/shoots.c:49: default:
   3719                     247 00105$:
                            248 ;src/entities/shoots.c:50: shoots[k].x=x;
   3719 DD 6E FE      [19]  249 	ld	l,-2 (ix)
   371C DD 66 FF      [19]  250 	ld	h,-1 (ix)
   371F DD 7E 04      [19]  251 	ld	a,4 (ix)
   3722 77            [ 7]  252 	ld	(hl),a
                            253 ;src/entities/shoots.c:51: shoots[k].y=y;
   3723 DD 6E FA      [19]  254 	ld	l,-6 (ix)
   3726 DD 66 FB      [19]  255 	ld	h,-5 (ix)
   3729 DD 7E 05      [19]  256 	ld	a,5 (ix)
   372C 77            [ 7]  257 	ld	(hl),a
                            258 ;src/entities/shoots.c:52: shoots[k].w=1;
   372D DD 6E F8      [19]  259 	ld	l,-8 (ix)
   3730 DD 66 F9      [19]  260 	ld	h,-7 (ix)
   3733 36 01         [10]  261 	ld	(hl),#0x01
                            262 ;src/entities/shoots.c:53: shoots[k].h=8;
   3735 DD 6E F6      [19]  263 	ld	l,-10 (ix)
   3738 DD 66 F7      [19]  264 	ld	h,-9 (ix)
   373B 36 08         [10]  265 	ld	(hl),#0x08
                            266 ;src/entities/shoots.c:54: shoots[k].num_frames=2;
   373D E1            [10]  267 	pop	hl
   373E E5            [11]  268 	push	hl
   373F 36 02         [10]  269 	ld	(hl),#0x02
                            270 ;src/entities/shoots.c:55: shoots[k].sprite[0]= (u8*) bullet01_0;
   3741 DD 6E FC      [19]  271 	ld	l,-4 (ix)
   3744 DD 66 FD      [19]  272 	ld	h,-3 (ix)
   3747 36 87         [10]  273 	ld	(hl),#<(_bullet01_0)
   3749 23            [ 6]  274 	inc	hl
   374A 36 43         [10]  275 	ld	(hl),#>(_bullet01_0)
                            276 ;src/entities/shoots.c:56: shoots[k].sprite[1]= (u8*) bullet01_1;
   374C DD 7E FC      [19]  277 	ld	a,-4 (ix)
   374F C6 02         [ 7]  278 	add	a, #0x02
   3751 DD 77 F4      [19]  279 	ld	-12 (ix),a
   3754 DD 7E FD      [19]  280 	ld	a,-3 (ix)
   3757 CE 00         [ 7]  281 	adc	a, #0x00
   3759 DD 77 F5      [19]  282 	ld	-11 (ix),a
   375C E1            [10]  283 	pop	hl
   375D E5            [11]  284 	push	hl
   375E 36 8F         [10]  285 	ld	(hl),#<(_bullet01_1)
   3760 23            [ 6]  286 	inc	hl
   3761 36 43         [10]  287 	ld	(hl),#>(_bullet01_1)
                            288 ;src/entities/shoots.c:58: }
   3763                     289 00106$:
                            290 ;src/entities/shoots.c:59: active_shoots++;
   3763 21 76 6B      [10]  291 	ld	hl, #_active_shoots+0
   3766 34            [11]  292 	inc	(hl)
   3767                     293 00109$:
   3767 DD F9         [10]  294 	ld	sp, ix
   3769 DD E1         [14]  295 	pop	ix
   376B C9            [10]  296 	ret
                            297 ;src/entities/shoots.c:68: void update_shoots(){
                            298 ;	---------------------------------
                            299 ; Function update_shoots
                            300 ; ---------------------------------
   376C                     301 _update_shoots::
   376C DD E5         [15]  302 	push	ix
   376E DD 21 00 00   [14]  303 	ld	ix,#0
   3772 DD 39         [15]  304 	add	ix,sp
   3774 21 F7 FF      [10]  305 	ld	hl,#-9
   3777 39            [11]  306 	add	hl,sp
   3778 F9            [ 6]  307 	ld	sp,hl
                            308 ;src/entities/shoots.c:72: if (active_shoots>0){
   3779 3A 76 6B      [13]  309 	ld	a,(#_active_shoots + 0)
   377C B7            [ 4]  310 	or	a, a
   377D CA 8E 38      [10]  311 	jp	Z,00116$
                            312 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   3780 0E 00         [ 7]  313 	ld	c,#0x00
   3782                     314 00114$:
                            315 ;src/entities/shoots.c:74: if (shoots[i].active){
   3782 69            [ 4]  316 	ld	l,c
   3783 26 00         [ 7]  317 	ld	h,#0x00
   3785 29            [11]  318 	add	hl, hl
   3786 29            [11]  319 	add	hl, hl
   3787 29            [11]  320 	add	hl, hl
   3788 29            [11]  321 	add	hl, hl
   3789 3E D6         [ 7]  322 	ld	a,#<(_shoots)
   378B 85            [ 4]  323 	add	a, l
   378C DD 77 FE      [19]  324 	ld	-2 (ix),a
   378F 3E 6A         [ 7]  325 	ld	a,#>(_shoots)
   3791 8C            [ 4]  326 	adc	a, h
   3792 DD 77 FF      [19]  327 	ld	-1 (ix),a
   3795 DD 7E FE      [19]  328 	ld	a,-2 (ix)
   3798 C6 08         [ 7]  329 	add	a, #0x08
   379A DD 77 FC      [19]  330 	ld	-4 (ix),a
   379D DD 7E FF      [19]  331 	ld	a,-1 (ix)
   37A0 CE 00         [ 7]  332 	adc	a, #0x00
   37A2 DD 77 FD      [19]  333 	ld	-3 (ix),a
   37A5 DD 6E FC      [19]  334 	ld	l,-4 (ix)
   37A8 DD 66 FD      [19]  335 	ld	h,-3 (ix)
   37AB 7E            [ 7]  336 	ld	a,(hl)
   37AC B7            [ 4]  337 	or	a, a
   37AD CA 87 38      [10]  338 	jp	Z,00115$
                            339 ;src/entities/shoots.c:75: shoots[i].y-=SHOOT_JUMP;
   37B0 DD 7E FE      [19]  340 	ld	a,-2 (ix)
   37B3 C6 05         [ 7]  341 	add	a, #0x05
   37B5 5F            [ 4]  342 	ld	e,a
   37B6 DD 7E FF      [19]  343 	ld	a,-1 (ix)
   37B9 CE 00         [ 7]  344 	adc	a, #0x00
   37BB 57            [ 4]  345 	ld	d,a
   37BC 1A            [ 7]  346 	ld	a,(de)
   37BD C6 F6         [ 7]  347 	add	a,#0xF6
   37BF 47            [ 4]  348 	ld	b,a
   37C0 12            [ 7]  349 	ld	(de),a
                            350 ;src/entities/shoots.c:76: if (shoots[i].y<200){
   37C1 1A            [ 7]  351 	ld	a,(de)
   37C2 DD 77 FB      [19]  352 	ld	-5 (ix),a
   37C5 78            [ 4]  353 	ld	a,b
   37C6 D6 C8         [ 7]  354 	sub	a, #0xC8
   37C8 D2 7B 38      [10]  355 	jp	NC,00107$
                            356 ;src/entities/shoots.c:77: if (check_collision_enemies(shoots[i].x,shoots[i].y,shoots[i].w,shoots[i].h)){
   37CB E5            [11]  357 	push	hl
   37CC DD 6E FE      [19]  358 	ld	l,-2 (ix)
   37CF DD 66 FF      [19]  359 	ld	h,-1 (ix)
   37D2 E5            [11]  360 	push	hl
   37D3 FD E1         [14]  361 	pop	iy
   37D5 E1            [10]  362 	pop	hl
   37D6 FD 7E 07      [19]  363 	ld	a,7 (iy)
   37D9 DD 77 FA      [19]  364 	ld	-6 (ix),a
   37DC DD 6E FE      [19]  365 	ld	l,-2 (ix)
   37DF DD 66 FF      [19]  366 	ld	h,-1 (ix)
   37E2 C5            [11]  367 	push	bc
   37E3 01 06 00      [10]  368 	ld	bc, #0x0006
   37E6 09            [11]  369 	add	hl, bc
   37E7 C1            [10]  370 	pop	bc
   37E8 46            [ 7]  371 	ld	b,(hl)
   37E9 DD 7E FE      [19]  372 	ld	a,-2 (ix)
   37EC C6 04         [ 7]  373 	add	a, #0x04
   37EE DD 77 F8      [19]  374 	ld	-8 (ix),a
   37F1 DD 7E FF      [19]  375 	ld	a,-1 (ix)
   37F4 CE 00         [ 7]  376 	adc	a, #0x00
   37F6 DD 77 F9      [19]  377 	ld	-7 (ix),a
   37F9 DD 6E F8      [19]  378 	ld	l,-8 (ix)
   37FC DD 66 F9      [19]  379 	ld	h,-7 (ix)
   37FF 7E            [ 7]  380 	ld	a,(hl)
   3800 DD 77 F7      [19]  381 	ld	-9 (ix),a
   3803 C5            [11]  382 	push	bc
   3804 D5            [11]  383 	push	de
   3805 DD 7E FA      [19]  384 	ld	a,-6 (ix)
   3808 F5            [11]  385 	push	af
   3809 33            [ 6]  386 	inc	sp
   380A C5            [11]  387 	push	bc
   380B 33            [ 6]  388 	inc	sp
   380C DD 66 FB      [19]  389 	ld	h,-5 (ix)
   380F DD 6E F7      [19]  390 	ld	l,-9 (ix)
   3812 E5            [11]  391 	push	hl
   3813 CD C5 24      [17]  392 	call	_check_collision_enemies
   3816 F1            [10]  393 	pop	af
   3817 F1            [10]  394 	pop	af
   3818 7D            [ 4]  395 	ld	a,l
   3819 D1            [10]  396 	pop	de
   381A C1            [10]  397 	pop	bc
   381B B7            [ 4]  398 	or	a, a
   381C 28 2F         [12]  399 	jr	Z,00104$
                            400 ;src/entities/shoots.c:78: create_explosion(shoots[i].x,shoots[i].y,0);
   381E 1A            [ 7]  401 	ld	a,(de)
   381F 57            [ 4]  402 	ld	d,a
   3820 DD 6E F8      [19]  403 	ld	l,-8 (ix)
   3823 DD 66 F9      [19]  404 	ld	h,-7 (ix)
   3826 46            [ 7]  405 	ld	b,(hl)
   3827 C5            [11]  406 	push	bc
   3828 AF            [ 4]  407 	xor	a, a
   3829 F5            [11]  408 	push	af
   382A 33            [ 6]  409 	inc	sp
   382B D5            [11]  410 	push	de
   382C 33            [ 6]  411 	inc	sp
   382D C5            [11]  412 	push	bc
   382E 33            [ 6]  413 	inc	sp
   382F CD 02 31      [17]  414 	call	_create_explosion
   3832 F1            [10]  415 	pop	af
   3833 33            [ 6]  416 	inc	sp
   3834 C1            [10]  417 	pop	bc
                            418 ;src/entities/shoots.c:79: shoots[i].active=0;
   3835 DD 6E FC      [19]  419 	ld	l,-4 (ix)
   3838 DD 66 FD      [19]  420 	ld	h,-3 (ix)
   383B 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/entities/shoots.c:80: active_shoots--;
   383D 21 76 6B      [10]  423 	ld	hl, #_active_shoots+0
   3840 35            [11]  424 	dec	(hl)
                            425 ;src/entities/shoots.c:81: add_score(10);
   3841 C5            [11]  426 	push	bc
   3842 21 0A 00      [10]  427 	ld	hl,#0x000A
   3845 E5            [11]  428 	push	hl
   3846 CD 97 3D      [17]  429 	call	_add_score
   3849 F1            [10]  430 	pop	af
   384A C1            [10]  431 	pop	bc
   384B 18 3A         [12]  432 	jr	00115$
   384D                     433 00104$:
                            434 ;src/entities/shoots.c:83: shoots[i].frame++;
   384D DD 7E FE      [19]  435 	ld	a,-2 (ix)
   3850 C6 0A         [ 7]  436 	add	a, #0x0A
   3852 5F            [ 4]  437 	ld	e,a
   3853 DD 7E FF      [19]  438 	ld	a,-1 (ix)
   3856 CE 00         [ 7]  439 	adc	a, #0x00
   3858 57            [ 4]  440 	ld	d,a
   3859 1A            [ 7]  441 	ld	a,(de)
   385A 3C            [ 4]  442 	inc	a
   385B DD 77 F7      [19]  443 	ld	-9 (ix), a
   385E 12            [ 7]  444 	ld	(de),a
                            445 ;src/entities/shoots.c:84: if (shoots[i].frame==shoots[i].num_frames)
   385F DD 6E FE      [19]  446 	ld	l,-2 (ix)
   3862 DD 66 FF      [19]  447 	ld	h,-1 (ix)
   3865 C5            [11]  448 	push	bc
   3866 01 09 00      [10]  449 	ld	bc, #0x0009
   3869 09            [11]  450 	add	hl, bc
   386A C1            [10]  451 	pop	bc
   386B 7E            [ 7]  452 	ld	a,(hl)
   386C DD 77 F8      [19]  453 	ld	-8 (ix),a
   386F DD 7E F7      [19]  454 	ld	a,-9 (ix)
   3872 DD 96 F8      [19]  455 	sub	a, -8 (ix)
   3875 20 10         [12]  456 	jr	NZ,00115$
                            457 ;src/entities/shoots.c:85: shoots[i].frame=0;
   3877 AF            [ 4]  458 	xor	a, a
   3878 12            [ 7]  459 	ld	(de),a
   3879 18 0C         [12]  460 	jr	00115$
   387B                     461 00107$:
                            462 ;src/entities/shoots.c:89: shoots[i].active=0;
   387B DD 6E FC      [19]  463 	ld	l,-4 (ix)
   387E DD 66 FD      [19]  464 	ld	h,-3 (ix)
   3881 36 00         [10]  465 	ld	(hl),#0x00
                            466 ;src/entities/shoots.c:90: active_shoots--;
   3883 21 76 6B      [10]  467 	ld	hl, #_active_shoots+0
   3886 35            [11]  468 	dec	(hl)
   3887                     469 00115$:
                            470 ;src/entities/shoots.c:73: for (i=0;i<MAX_SHOOTS;i++){
   3887 0C            [ 4]  471 	inc	c
   3888 79            [ 4]  472 	ld	a,c
   3889 D6 0A         [ 7]  473 	sub	a, #0x0A
   388B DA 82 37      [10]  474 	jp	C,00114$
   388E                     475 00116$:
   388E DD F9         [10]  476 	ld	sp, ix
   3890 DD E1         [14]  477 	pop	ix
   3892 C9            [10]  478 	ret
                            479 ;src/entities/shoots.c:102: void draw_shoots(u8* screen){
                            480 ;	---------------------------------
                            481 ; Function draw_shoots
                            482 ; ---------------------------------
   3893                     483 _draw_shoots::
   3893 DD E5         [15]  484 	push	ix
   3895 DD 21 00 00   [14]  485 	ld	ix,#0
   3899 DD 39         [15]  486 	add	ix,sp
   389B F5            [11]  487 	push	af
   389C F5            [11]  488 	push	af
   389D 3B            [ 6]  489 	dec	sp
                            490 ;src/entities/shoots.c:107: if (active_shoots>0){
   389E 3A 76 6B      [13]  491 	ld	a,(#_active_shoots + 0)
   38A1 B7            [ 4]  492 	or	a, a
   38A2 CA 4B 39      [10]  493 	jp	Z,00108$
                            494 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   38A5 0E 00         [ 7]  495 	ld	c,#0x00
   38A7                     496 00106$:
                            497 ;src/entities/shoots.c:109: if (shoots[k].active){
   38A7 69            [ 4]  498 	ld	l,c
   38A8 26 00         [ 7]  499 	ld	h,#0x00
   38AA 29            [11]  500 	add	hl, hl
   38AB 29            [11]  501 	add	hl, hl
   38AC 29            [11]  502 	add	hl, hl
   38AD 29            [11]  503 	add	hl, hl
   38AE 3E D6         [ 7]  504 	ld	a,#<(_shoots)
   38B0 85            [ 4]  505 	add	a, l
   38B1 DD 77 FE      [19]  506 	ld	-2 (ix),a
   38B4 3E 6A         [ 7]  507 	ld	a,#>(_shoots)
   38B6 8C            [ 4]  508 	adc	a, h
   38B7 DD 77 FF      [19]  509 	ld	-1 (ix),a
   38BA DD 6E FE      [19]  510 	ld	l,-2 (ix)
   38BD DD 66 FF      [19]  511 	ld	h,-1 (ix)
   38C0 11 08 00      [10]  512 	ld	de, #0x0008
   38C3 19            [11]  513 	add	hl, de
   38C4 7E            [ 7]  514 	ld	a,(hl)
   38C5 B7            [ 4]  515 	or	a, a
   38C6 28 7C         [12]  516 	jr	Z,00107$
                            517 ;src/entities/shoots.c:110: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   38C8 DD 6E FE      [19]  518 	ld	l,-2 (ix)
   38CB DD 66 FF      [19]  519 	ld	h,-1 (ix)
   38CE 11 05 00      [10]  520 	ld	de, #0x0005
   38D1 19            [11]  521 	add	hl, de
   38D2 56            [ 7]  522 	ld	d,(hl)
   38D3 DD 6E FE      [19]  523 	ld	l,-2 (ix)
   38D6 DD 66 FF      [19]  524 	ld	h,-1 (ix)
   38D9 23            [ 6]  525 	inc	hl
   38DA 23            [ 6]  526 	inc	hl
   38DB 23            [ 6]  527 	inc	hl
   38DC 23            [ 6]  528 	inc	hl
   38DD 5E            [ 7]  529 	ld	e,(hl)
   38DE E5            [11]  530 	push	hl
   38DF DD 6E 04      [19]  531 	ld	l,4 (ix)
   38E2 DD 66 05      [19]  532 	ld	h,5 (ix)
   38E5 E5            [11]  533 	push	hl
   38E6 FD E1         [14]  534 	pop	iy
   38E8 E1            [10]  535 	pop	hl
   38E9 C5            [11]  536 	push	bc
   38EA D5            [11]  537 	push	de
   38EB FD E5         [15]  538 	push	iy
   38ED CD 89 56      [17]  539 	call	_cpct_getScreenPtr
   38F0 C1            [10]  540 	pop	bc
   38F1 5D            [ 4]  541 	ld	e, l
   38F2 54            [ 4]  542 	ld	d, h
                            543 ;src/entities/shoots.c:111: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   38F3 E5            [11]  544 	push	hl
   38F4 DD 6E FE      [19]  545 	ld	l,-2 (ix)
   38F7 DD 66 FF      [19]  546 	ld	h,-1 (ix)
   38FA E5            [11]  547 	push	hl
   38FB FD E1         [14]  548 	pop	iy
   38FD E1            [10]  549 	pop	hl
   38FE FD 7E 07      [19]  550 	ld	a,7 (iy)
   3901 DD 77 FB      [19]  551 	ld	-5 (ix),a
   3904 DD 6E FE      [19]  552 	ld	l,-2 (ix)
   3907 DD 66 FF      [19]  553 	ld	h,-1 (ix)
   390A C5            [11]  554 	push	bc
   390B 01 06 00      [10]  555 	ld	bc, #0x0006
   390E 09            [11]  556 	add	hl, bc
   390F C1            [10]  557 	pop	bc
   3910 46            [ 7]  558 	ld	b,(hl)
   3911 DD 73 FC      [19]  559 	ld	-4 (ix),e
   3914 DD 72 FD      [19]  560 	ld	-3 (ix),d
   3917 DD 6E FE      [19]  561 	ld	l,-2 (ix)
   391A DD 66 FF      [19]  562 	ld	h,-1 (ix)
   391D 11 0A 00      [10]  563 	ld	de, #0x000A
   3920 19            [11]  564 	add	hl, de
   3921 7E            [ 7]  565 	ld	a,(hl)
   3922 87            [ 4]  566 	add	a, a
   3923 5F            [ 4]  567 	ld	e,a
   3924 DD 6E FE      [19]  568 	ld	l,-2 (ix)
   3927 DD 66 FF      [19]  569 	ld	h,-1 (ix)
   392A 16 00         [ 7]  570 	ld	d,#0x00
   392C 19            [11]  571 	add	hl, de
   392D 5E            [ 7]  572 	ld	e,(hl)
   392E 23            [ 6]  573 	inc	hl
   392F 56            [ 7]  574 	ld	d,(hl)
   3930 C5            [11]  575 	push	bc
   3931 DD 7E FB      [19]  576 	ld	a,-5 (ix)
   3934 F5            [11]  577 	push	af
   3935 33            [ 6]  578 	inc	sp
   3936 C5            [11]  579 	push	bc
   3937 33            [ 6]  580 	inc	sp
   3938 DD 6E FC      [19]  581 	ld	l,-4 (ix)
   393B DD 66 FD      [19]  582 	ld	h,-3 (ix)
   393E E5            [11]  583 	push	hl
   393F D5            [11]  584 	push	de
   3940 CD 49 53      [17]  585 	call	_cpct_drawSprite
   3943 C1            [10]  586 	pop	bc
   3944                     587 00107$:
                            588 ;src/entities/shoots.c:108: for (k=0;k<MAX_SHOOTS;k++){
   3944 0C            [ 4]  589 	inc	c
   3945 79            [ 4]  590 	ld	a,c
   3946 D6 0A         [ 7]  591 	sub	a, #0x0A
   3948 DA A7 38      [10]  592 	jp	C,00106$
   394B                     593 00108$:
   394B DD F9         [10]  594 	ld	sp, ix
   394D DD E1         [14]  595 	pop	ix
   394F C9            [10]  596 	ret
                            597 	.area _CODE
                            598 	.area _INITIALIZER
                            599 	.area _CABS (ABS)
