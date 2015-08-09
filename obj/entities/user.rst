                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Aug  4 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Aug  7 15:43:54 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_explosion
                             13 	.globl _create_enemy_group
                             14 	.globl _create_enemy
                             15 	.globl _create_shoot
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_drawSprite
                             18 	.globl _cpct_isKeyPressed
                             19 	.globl _cpct_scanKeyboard_f
                             20 	.globl _rand
                             21 	.globl _shoot_type
                             22 	.globl _user
                             23 	.globl _init_user
                             24 	.globl _get_user_max_shoots
                             25 	.globl _update_user
                             26 	.globl _draw_user
                             27 	.globl _set_score
                             28 	.globl _add_score
                             29 	.globl _get_score
                             30 ;--------------------------------------------------------
                             31 ; special function registers
                             32 ;--------------------------------------------------------
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DATA
   649A                      37 _user::
   649A                      38 	.ds 26
   64B4                      39 _shoot_type::
   64B4                      40 	.ds 1
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
                             65 ;src/entities/user.c:9: void init_user(){
                             66 ;	---------------------------------
                             67 ; Function init_user
                             68 ; ---------------------------------
   370C                      69 _init_user::
                             70 ;src/entities/user.c:11: user.w = 4;
   370C 21 A8 64      [10]   71 	ld	hl,#_user + 14
   370F 36 04         [10]   72 	ld	(hl),#0x04
                             73 ;src/entities/user.c:12: user.h = 8;
   3711 FD 21 A9 64   [14]   74 	ld	iy,#_user + 15
   3715 FD 36 00 08   [19]   75 	ld	0 (iy), #0x08
                             76 ;src/entities/user.c:13: user.x = 39-(user.w/2);
   3719 6E            [ 7]   77 	ld	l,(hl)
   371A CB 3D         [ 8]   78 	srl	l
   371C 3E 27         [ 7]   79 	ld	a,#0x27
   371E 95            [ 4]   80 	sub	a, l
   371F 32 A0 64      [13]   81 	ld	(#(_user + 0x0006)),a
                             82 ;src/entities/user.c:14: user.y = 199-(user.h);
   3722 FD 66 00      [19]   83 	ld	h, 0 (iy)
   3725 3E C7         [ 7]   84 	ld	a,#0xC7
   3727 94            [ 4]   85 	sub	a, h
   3728 32 A1 64      [13]   86 	ld	(#(_user + 0x0007)),a
                             87 ;src/entities/user.c:15: user.vx = 0;
   372B 21 A2 64      [10]   88 	ld	hl,#_user + 8
   372E 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/user.c:16: user.vy = 0;
   3730 21 A3 64      [10]   91 	ld	hl,#_user + 9
   3733 36 00         [10]   92 	ld	(hl),#0x00
                             93 ;src/entities/user.c:17: user.topvx = 4;
   3735 21 A4 64      [10]   94 	ld	hl,#_user + 10
   3738 36 04         [10]   95 	ld	(hl),#0x04
                             96 ;src/entities/user.c:18: user.topvy = 5;
   373A 21 A5 64      [10]   97 	ld	hl,#_user + 11
   373D 36 05         [10]   98 	ld	(hl),#0x05
                             99 ;src/entities/user.c:19: user.ax=0;
   373F 21 A6 64      [10]  100 	ld	hl,#_user + 12
   3742 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/user.c:20: user.ay=0;
   3744 21 A7 64      [10]  103 	ld	hl,#_user + 13
   3747 36 00         [10]  104 	ld	(hl),#0x00
                            105 ;src/entities/user.c:21: user.sprite = (u8*) G_ship_00;
   3749 21 DC 41      [10]  106 	ld	hl,#_G_ship_00
   374C 22 9E 64      [16]  107 	ld	((_user + 0x0004)), hl
                            108 ;src/entities/user.c:22: user.score = 0;
   374F 21 00 00      [10]  109 	ld	hl,#0x0000
   3752 22 B0 64      [16]  110 	ld	((_user + 0x0016)),hl
   3755 22 B2 64      [16]  111 	ld	((_user + 0x0016)+2), hl
                            112 ;src/entities/user.c:24: user.max_shoots = 10;
   3758 21 AF 64      [10]  113 	ld	hl,#_user + 21
   375B 36 0A         [10]  114 	ld	(hl),#0x0A
                            115 ;src/entities/user.c:25: shoot_type = 1;
   375D 21 B4 64      [10]  116 	ld	hl,#_shoot_type + 0
   3760 36 01         [10]  117 	ld	(hl), #0x01
   3762 C9            [10]  118 	ret
                            119 ;src/entities/user.c:28: u8 get_user_max_shoots(){
                            120 ;	---------------------------------
                            121 ; Function get_user_max_shoots
                            122 ; ---------------------------------
   3763                     123 _get_user_max_shoots::
                            124 ;src/entities/user.c:29: return user.max_shoots;
   3763 21 AF 64      [10]  125 	ld	hl,#_user+21
   3766 6E            [ 7]  126 	ld	l,(hl)
   3767 C9            [10]  127 	ret
                            128 ;src/entities/user.c:32: void update_user() {
                            129 ;	---------------------------------
                            130 ; Function update_user
                            131 ; ---------------------------------
   3768                     132 _update_user::
   3768 DD E5         [15]  133 	push	ix
   376A DD 21 00 00   [14]  134 	ld	ix,#0
   376E DD 39         [15]  135 	add	ix,sp
   3770 F5            [11]  136 	push	af
   3771 F5            [11]  137 	push	af
                            138 ;src/entities/user.c:35: user.ax=0;
   3772 21 A6 64      [10]  139 	ld	hl,#(_user + 0x000c)
   3775 36 00         [10]  140 	ld	(hl),#0x00
                            141 ;src/entities/user.c:38: cpct_scanKeyboard_f();
   3777 CD 46 4B      [17]  142 	call	_cpct_scanKeyboard_f
                            143 ;src/entities/user.c:45: if ((cpct_isKeyPressed(Key_Q))){ 
   377A 21 08 08      [10]  144 	ld	hl,#0x0808
   377D E5            [11]  145 	push	hl
   377E CD 35 4B      [17]  146 	call	_cpct_isKeyPressed
   3781 F1            [10]  147 	pop	af
                            148 ;src/entities/user.c:46: user.ay = -2;
                            149 ;src/entities/user.c:45: if ((cpct_isKeyPressed(Key_Q))){ 
   3782 7D            [ 4]  150 	ld	a,l
   3783 B7            [ 4]  151 	or	a, a
   3784 28 07         [12]  152 	jr	Z,00104$
                            153 ;src/entities/user.c:46: user.ay = -2;
   3786 21 A7 64      [10]  154 	ld	hl,#(_user + 0x000d)
   3789 36 FE         [10]  155 	ld	(hl),#0xFE
   378B 18 11         [12]  156 	jr	00105$
   378D                     157 00104$:
                            158 ;src/entities/user.c:47: } else if (cpct_isKeyPressed(Key_A)){
   378D 21 08 20      [10]  159 	ld	hl,#0x2008
   3790 E5            [11]  160 	push	hl
   3791 CD 35 4B      [17]  161 	call	_cpct_isKeyPressed
   3794 F1            [10]  162 	pop	af
   3795 7D            [ 4]  163 	ld	a,l
   3796 B7            [ 4]  164 	or	a, a
   3797 28 05         [12]  165 	jr	Z,00105$
                            166 ;src/entities/user.c:48: user.ay=2;    
   3799 21 A7 64      [10]  167 	ld	hl,#(_user + 0x000d)
   379C 36 02         [10]  168 	ld	(hl),#0x02
   379E                     169 00105$:
                            170 ;src/entities/user.c:51: if ((cpct_isKeyPressed(Key_P))){ 
   379E 21 03 08      [10]  171 	ld	hl,#0x0803
   37A1 E5            [11]  172 	push	hl
   37A2 CD 35 4B      [17]  173 	call	_cpct_isKeyPressed
   37A5 F1            [10]  174 	pop	af
   37A6 7D            [ 4]  175 	ld	a,l
   37A7 B7            [ 4]  176 	or	a, a
   37A8 28 07         [12]  177 	jr	Z,00109$
                            178 ;src/entities/user.c:52: user.ax = 2;
   37AA 21 A6 64      [10]  179 	ld	hl,#(_user + 0x000c)
   37AD 36 02         [10]  180 	ld	(hl),#0x02
   37AF 18 11         [12]  181 	jr	00110$
   37B1                     182 00109$:
                            183 ;src/entities/user.c:53: } else if (cpct_isKeyPressed(Key_O)){
   37B1 21 04 04      [10]  184 	ld	hl,#0x0404
   37B4 E5            [11]  185 	push	hl
   37B5 CD 35 4B      [17]  186 	call	_cpct_isKeyPressed
   37B8 F1            [10]  187 	pop	af
   37B9 7D            [ 4]  188 	ld	a,l
   37BA B7            [ 4]  189 	or	a, a
   37BB 28 05         [12]  190 	jr	Z,00110$
                            191 ;src/entities/user.c:54: user.ax=-2;    
   37BD 21 A6 64      [10]  192 	ld	hl,#(_user + 0x000c)
   37C0 36 FE         [10]  193 	ld	(hl),#0xFE
   37C2                     194 00110$:
                            195 ;src/entities/user.c:58: if (cpct_isKeyPressed(Key_D)){
   37C2 21 07 20      [10]  196 	ld	hl,#0x2007
   37C5 E5            [11]  197 	push	hl
   37C6 CD 35 4B      [17]  198 	call	_cpct_isKeyPressed
   37C9 F1            [10]  199 	pop	af
   37CA 7D            [ 4]  200 	ld	a,l
   37CB B7            [ 4]  201 	or	a, a
   37CC 28 1B         [12]  202 	jr	Z,00112$
                            203 ;src/entities/user.c:59: shoot_type=(shoot_type+1)%2;
   37CE FD 21 B4 64   [14]  204 	ld	iy,#_shoot_type
   37D2 FD 6E 00      [19]  205 	ld	l,0 (iy)
   37D5 26 00         [ 7]  206 	ld	h,#0x00
   37D7 23            [ 6]  207 	inc	hl
   37D8 01 02 00      [10]  208 	ld	bc,#0x0002
   37DB C5            [11]  209 	push	bc
   37DC E5            [11]  210 	push	hl
   37DD CD 80 4F      [17]  211 	call	__modsint
   37E0 F1            [10]  212 	pop	af
   37E1 F1            [10]  213 	pop	af
   37E2 FD 21 B4 64   [14]  214 	ld	iy,#_shoot_type
   37E6 FD 75 00      [19]  215 	ld	0 (iy),l
   37E9                     216 00112$:
                            217 ;src/entities/user.c:62: if (cpct_isKeyPressed(Key_H)){
   37E9 21 05 10      [10]  218 	ld	hl,#0x1005
   37EC E5            [11]  219 	push	hl
   37ED CD 35 4B      [17]  220 	call	_cpct_isKeyPressed
   37F0 F1            [10]  221 	pop	af
   37F1 7D            [ 4]  222 	ld	a,l
   37F2 B7            [ 4]  223 	or	a, a
   37F3 28 39         [12]  224 	jr	Z,00114$
                            225 ;src/entities/user.c:63: create_enemy((rand()%80),(rand()%199),(rand()%3));
   37F5 CD D4 4B      [17]  226 	call	_rand
   37F8 01 03 00      [10]  227 	ld	bc,#0x0003
   37FB C5            [11]  228 	push	bc
   37FC E5            [11]  229 	push	hl
   37FD CD 80 4F      [17]  230 	call	__modsint
   3800 F1            [10]  231 	pop	af
   3801 F1            [10]  232 	pop	af
   3802 DD 75 FF      [19]  233 	ld	-1 (ix),l
   3805 CD D4 4B      [17]  234 	call	_rand
   3808 01 C7 00      [10]  235 	ld	bc,#0x00C7
   380B C5            [11]  236 	push	bc
   380C E5            [11]  237 	push	hl
   380D CD 80 4F      [17]  238 	call	__modsint
   3810 F1            [10]  239 	pop	af
   3811 E3            [19]  240 	ex	(sp),hl
   3812 CD D4 4B      [17]  241 	call	_rand
   3815 11 50 00      [10]  242 	ld	de,#0x0050
   3818 D5            [11]  243 	push	de
   3819 E5            [11]  244 	push	hl
   381A CD 80 4F      [17]  245 	call	__modsint
   381D F1            [10]  246 	pop	af
   381E F1            [10]  247 	pop	af
   381F EB            [ 4]  248 	ex	de,hl
   3820 C1            [10]  249 	pop	bc
   3821 DD 7E FF      [19]  250 	ld	a,-1 (ix)
   3824 F5            [11]  251 	push	af
   3825 33            [ 6]  252 	inc	sp
   3826 C5            [11]  253 	push	bc
   3827 D5            [11]  254 	push	de
   3828 CD 45 24      [17]  255 	call	_create_enemy
   382B F1            [10]  256 	pop	af
   382C F1            [10]  257 	pop	af
   382D 33            [ 6]  258 	inc	sp
   382E                     259 00114$:
                            260 ;src/entities/user.c:66: if (cpct_isKeyPressed(Key_J)){
   382E 21 05 20      [10]  261 	ld	hl,#0x2005
   3831 E5            [11]  262 	push	hl
   3832 CD 35 4B      [17]  263 	call	_cpct_isKeyPressed
   3835 F1            [10]  264 	pop	af
   3836 7D            [ 4]  265 	ld	a,l
   3837 B7            [ 4]  266 	or	a, a
   3838 CA CE 38      [10]  267 	jp	Z,00116$
                            268 ;src/entities/user.c:67: x=rand()%80;
   383B CD D4 4B      [17]  269 	call	_rand
   383E 01 50 00      [10]  270 	ld	bc,#0x0050
   3841 C5            [11]  271 	push	bc
   3842 E5            [11]  272 	push	hl
   3843 CD 80 4F      [17]  273 	call	__modsint
   3846 F1            [10]  274 	pop	af
   3847 F1            [10]  275 	pop	af
   3848 DD 75 FC      [19]  276 	ld	-4 (ix),l
                            277 ;src/entities/user.c:68: y=rand()%199;
   384B CD D4 4B      [17]  278 	call	_rand
   384E 01 C7 00      [10]  279 	ld	bc,#0x00C7
   3851 C5            [11]  280 	push	bc
   3852 E5            [11]  281 	push	hl
   3853 CD 80 4F      [17]  282 	call	__modsint
   3856 F1            [10]  283 	pop	af
   3857 F1            [10]  284 	pop	af
   3858 4D            [ 4]  285 	ld	c,l
                            286 ;src/entities/user.c:69: create_enemy(x,y,(rand()%3));
   3859 C5            [11]  287 	push	bc
   385A CD D4 4B      [17]  288 	call	_rand
   385D 11 03 00      [10]  289 	ld	de,#0x0003
   3860 D5            [11]  290 	push	de
   3861 E5            [11]  291 	push	hl
   3862 CD 80 4F      [17]  292 	call	__modsint
   3865 F1            [10]  293 	pop	af
   3866 F1            [10]  294 	pop	af
   3867 C1            [10]  295 	pop	bc
   3868 5D            [ 4]  296 	ld	e,l
   3869 DD 71 FD      [19]  297 	ld	-3 (ix),c
   386C DD 36 FE 00   [19]  298 	ld	-2 (ix),#0x00
   3870 DD 4E FC      [19]  299 	ld	c,-4 (ix)
   3873 06 00         [ 7]  300 	ld	b,#0x00
   3875 C5            [11]  301 	push	bc
   3876 7B            [ 4]  302 	ld	a,e
   3877 F5            [11]  303 	push	af
   3878 33            [ 6]  304 	inc	sp
   3879 DD 6E FD      [19]  305 	ld	l,-3 (ix)
   387C DD 66 FE      [19]  306 	ld	h,-2 (ix)
   387F E5            [11]  307 	push	hl
   3880 C5            [11]  308 	push	bc
   3881 CD 45 24      [17]  309 	call	_create_enemy
   3884 F1            [10]  310 	pop	af
   3885 F1            [10]  311 	pop	af
   3886 33            [ 6]  312 	inc	sp
   3887 CD D4 4B      [17]  313 	call	_rand
   388A 11 03 00      [10]  314 	ld	de,#0x0003
   388D D5            [11]  315 	push	de
   388E E5            [11]  316 	push	hl
   388F CD 80 4F      [17]  317 	call	__modsint
   3892 F1            [10]  318 	pop	af
   3893 F1            [10]  319 	pop	af
   3894 C1            [10]  320 	pop	bc
   3895 5D            [ 4]  321 	ld	e,l
   3896 21 08 00      [10]  322 	ld	hl,#0x0008
   3899 09            [11]  323 	add	hl,bc
   389A C5            [11]  324 	push	bc
   389B 7B            [ 4]  325 	ld	a,e
   389C F5            [11]  326 	push	af
   389D 33            [ 6]  327 	inc	sp
   389E DD 5E FD      [19]  328 	ld	e,-3 (ix)
   38A1 DD 56 FE      [19]  329 	ld	d,-2 (ix)
   38A4 D5            [11]  330 	push	de
   38A5 E5            [11]  331 	push	hl
   38A6 CD 45 24      [17]  332 	call	_create_enemy
   38A9 F1            [10]  333 	pop	af
   38AA F1            [10]  334 	pop	af
   38AB 33            [ 6]  335 	inc	sp
   38AC CD D4 4B      [17]  336 	call	_rand
   38AF 11 03 00      [10]  337 	ld	de,#0x0003
   38B2 D5            [11]  338 	push	de
   38B3 E5            [11]  339 	push	hl
   38B4 CD 80 4F      [17]  340 	call	__modsint
   38B7 F1            [10]  341 	pop	af
   38B8 F1            [10]  342 	pop	af
   38B9 C1            [10]  343 	pop	bc
   38BA 5D            [ 4]  344 	ld	e,l
   38BB 21 10 00      [10]  345 	ld	hl,#0x0010
   38BE 09            [11]  346 	add	hl,bc
   38BF 7B            [ 4]  347 	ld	a,e
   38C0 F5            [11]  348 	push	af
   38C1 33            [ 6]  349 	inc	sp
   38C2 D1            [10]  350 	pop	de
   38C3 C1            [10]  351 	pop	bc
   38C4 C5            [11]  352 	push	bc
   38C5 D5            [11]  353 	push	de
   38C6 C5            [11]  354 	push	bc
   38C7 E5            [11]  355 	push	hl
   38C8 CD 45 24      [17]  356 	call	_create_enemy
   38CB F1            [10]  357 	pop	af
   38CC F1            [10]  358 	pop	af
   38CD 33            [ 6]  359 	inc	sp
   38CE                     360 00116$:
                            361 ;src/entities/user.c:74: if (cpct_isKeyPressed(Key_K)){
   38CE 21 04 20      [10]  362 	ld	hl,#0x2004
   38D1 E5            [11]  363 	push	hl
   38D2 CD 35 4B      [17]  364 	call	_cpct_isKeyPressed
   38D5 F1            [10]  365 	pop	af
   38D6 7D            [ 4]  366 	ld	a,l
   38D7 B7            [ 4]  367 	or	a, a
   38D8 28 44         [12]  368 	jr	Z,00118$
                            369 ;src/entities/user.c:75: create_enemy_group((rand()%10)+5,rand()%40,rand()%3,12);
   38DA CD D4 4B      [17]  370 	call	_rand
   38DD 01 03 00      [10]  371 	ld	bc,#0x0003
   38E0 C5            [11]  372 	push	bc
   38E1 E5            [11]  373 	push	hl
   38E2 CD 80 4F      [17]  374 	call	__modsint
   38E5 F1            [10]  375 	pop	af
   38E6 F1            [10]  376 	pop	af
   38E7 DD 75 FD      [19]  377 	ld	-3 (ix),l
   38EA CD D4 4B      [17]  378 	call	_rand
   38ED 01 28 00      [10]  379 	ld	bc,#0x0028
   38F0 C5            [11]  380 	push	bc
   38F1 E5            [11]  381 	push	hl
   38F2 CD 80 4F      [17]  382 	call	__modsint
   38F5 F1            [10]  383 	pop	af
   38F6 E3            [19]  384 	ex	(sp),hl
   38F7 CD D4 4B      [17]  385 	call	_rand
   38FA 11 0A 00      [10]  386 	ld	de,#0x000A
   38FD D5            [11]  387 	push	de
   38FE E5            [11]  388 	push	hl
   38FF CD 80 4F      [17]  389 	call	__modsint
   3902 F1            [10]  390 	pop	af
   3903 F1            [10]  391 	pop	af
   3904 EB            [ 4]  392 	ex	de,hl
   3905 C1            [10]  393 	pop	bc
   3906 13            [ 6]  394 	inc	de
   3907 13            [ 6]  395 	inc	de
   3908 13            [ 6]  396 	inc	de
   3909 13            [ 6]  397 	inc	de
   390A 13            [ 6]  398 	inc	de
   390B 3E 0C         [ 7]  399 	ld	a,#0x0C
   390D F5            [11]  400 	push	af
   390E 33            [ 6]  401 	inc	sp
   390F DD 7E FD      [19]  402 	ld	a,-3 (ix)
   3912 F5            [11]  403 	push	af
   3913 33            [ 6]  404 	inc	sp
   3914 C5            [11]  405 	push	bc
   3915 D5            [11]  406 	push	de
   3916 CD 84 27      [17]  407 	call	_create_enemy_group
   3919 21 06 00      [10]  408 	ld	hl,#6
   391C 39            [11]  409 	add	hl,sp
   391D F9            [ 6]  410 	ld	sp,hl
   391E                     411 00118$:
                            412 ;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
   391E 21 05 80      [10]  413 	ld	hl,#0x8005
   3921 E5            [11]  414 	push	hl
   3922 CD 35 4B      [17]  415 	call	_cpct_isKeyPressed
   3925 F1            [10]  416 	pop	af
                            417 ;src/entities/user.c:79: create_shoot(user.x+2, user.y, shoot_type);
                            418 ;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
   3926 7D            [ 4]  419 	ld	a,l
   3927 B7            [ 4]  420 	or	a, a
   3928 28 16         [12]  421 	jr	Z,00120$
                            422 ;src/entities/user.c:79: create_shoot(user.x+2, user.y, shoot_type);
   392A 21 A1 64      [10]  423 	ld	hl, #_user + 7
   392D 46            [ 7]  424 	ld	b,(hl)
   392E 3A A0 64      [13]  425 	ld	a, (#(_user + 0x0006) + 0)
   3931 57            [ 4]  426 	ld	d,a
   3932 14            [ 4]  427 	inc	d
   3933 14            [ 4]  428 	inc	d
   3934 3A B4 64      [13]  429 	ld	a,(_shoot_type)
   3937 F5            [11]  430 	push	af
   3938 33            [ 6]  431 	inc	sp
   3939 4A            [ 4]  432 	ld	c, d
   393A C5            [11]  433 	push	bc
   393B CD B9 33      [17]  434 	call	_create_shoot
   393E F1            [10]  435 	pop	af
   393F 33            [ 6]  436 	inc	sp
   3940                     437 00120$:
                            438 ;src/entities/user.c:83: if (cpct_isKeyPressed(Key_L)){
   3940 21 04 10      [10]  439 	ld	hl,#0x1004
   3943 E5            [11]  440 	push	hl
   3944 CD 35 4B      [17]  441 	call	_cpct_isKeyPressed
   3947 F1            [10]  442 	pop	af
   3948 7D            [ 4]  443 	ld	a,l
   3949 B7            [ 4]  444 	or	a, a
   394A 28 43         [12]  445 	jr	Z,00122$
                            446 ;src/entities/user.c:84: create_explosion((rand()%20)+5,(rand()%80)+20,rand()%2);
   394C CD D4 4B      [17]  447 	call	_rand
   394F 01 02 00      [10]  448 	ld	bc,#0x0002
   3952 C5            [11]  449 	push	bc
   3953 E5            [11]  450 	push	hl
   3954 CD 80 4F      [17]  451 	call	__modsint
   3957 F1            [10]  452 	pop	af
   3958 F1            [10]  453 	pop	af
   3959 DD 75 FD      [19]  454 	ld	-3 (ix),l
   395C CD D4 4B      [17]  455 	call	_rand
   395F 01 50 00      [10]  456 	ld	bc,#0x0050
   3962 C5            [11]  457 	push	bc
   3963 E5            [11]  458 	push	hl
   3964 CD 80 4F      [17]  459 	call	__modsint
   3967 F1            [10]  460 	pop	af
   3968 F1            [10]  461 	pop	af
   3969 7D            [ 4]  462 	ld	a,l
   396A C6 14         [ 7]  463 	add	a, #0x14
   396C 5F            [ 4]  464 	ld	e,a
   396D D5            [11]  465 	push	de
   396E CD D4 4B      [17]  466 	call	_rand
   3971 01 14 00      [10]  467 	ld	bc,#0x0014
   3974 C5            [11]  468 	push	bc
   3975 E5            [11]  469 	push	hl
   3976 CD 80 4F      [17]  470 	call	__modsint
   3979 F1            [10]  471 	pop	af
   397A F1            [10]  472 	pop	af
   397B D1            [10]  473 	pop	de
   397C 7D            [ 4]  474 	ld	a,l
   397D C6 05         [ 7]  475 	add	a, #0x05
   397F 57            [ 4]  476 	ld	d,a
   3980 DD 7E FD      [19]  477 	ld	a,-3 (ix)
   3983 F5            [11]  478 	push	af
   3984 33            [ 6]  479 	inc	sp
   3985 7B            [ 4]  480 	ld	a,e
   3986 F5            [11]  481 	push	af
   3987 33            [ 6]  482 	inc	sp
   3988 D5            [11]  483 	push	de
   3989 33            [ 6]  484 	inc	sp
   398A CD 47 2F      [17]  485 	call	_create_explosion
   398D F1            [10]  486 	pop	af
   398E 33            [ 6]  487 	inc	sp
   398F                     488 00122$:
                            489 ;src/entities/user.c:88: if (user.ax!=0){
   398F 21 A6 64      [10]  490 	ld	hl, #(_user + 0x000c) + 0
   3992 56            [ 7]  491 	ld	d,(hl)
                            492 ;src/entities/user.c:89: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
                            493 ;src/entities/user.c:88: if (user.ax!=0){
   3993 7A            [ 4]  494 	ld	a,d
   3994 B7            [ 4]  495 	or	a, a
   3995 28 42         [12]  496 	jr	Z,00129$
                            497 ;src/entities/user.c:89: if ((( user.vx >= 0 ) && (user.vx < user.topvx)) || ((user.vx <= 0 ) && (user.vx > -user.topvx))){
   3997 21 A2 64      [10]  498 	ld	hl, #(_user + 0x0008) + 0
   399A 5E            [ 7]  499 	ld	e,(hl)
   399B 21 A4 64      [10]  500 	ld	hl,#_user + 10
   399E CB 7B         [ 8]  501 	bit	7, e
   39A0 20 0B         [12]  502 	jr	NZ,00127$
   39A2 46            [ 7]  503 	ld	b,(hl)
   39A3 7B            [ 4]  504 	ld	a,e
   39A4 90            [ 4]  505 	sub	a, b
   39A5 E2 AA 39      [10]  506 	jp	PO, 00210$
   39A8 EE 80         [ 7]  507 	xor	a, #0x80
   39AA                     508 00210$:
   39AA FA D4 39      [10]  509 	jp	M,00123$
   39AD                     510 00127$:
   39AD AF            [ 4]  511 	xor	a, a
   39AE 93            [ 4]  512 	sub	a, e
   39AF E2 B4 39      [10]  513 	jp	PO, 00211$
   39B2 EE 80         [ 7]  514 	xor	a, #0x80
   39B4                     515 00211$:
   39B4 FA D9 39      [10]  516 	jp	M,00129$
   39B7 7E            [ 7]  517 	ld	a,(hl)
   39B8 6F            [ 4]  518 	ld	l,a
   39B9 17            [ 4]  519 	rla
   39BA 9F            [ 4]  520 	sbc	a, a
   39BB 67            [ 4]  521 	ld	h,a
   39BC AF            [ 4]  522 	xor	a, a
   39BD 95            [ 4]  523 	sub	a, l
   39BE 6F            [ 4]  524 	ld	l,a
   39BF 3E 00         [ 7]  525 	ld	a, #0x00
   39C1 9C            [ 4]  526 	sbc	a, h
   39C2 67            [ 4]  527 	ld	h,a
   39C3 7B            [ 4]  528 	ld	a,e
   39C4 4F            [ 4]  529 	ld	c,a
   39C5 17            [ 4]  530 	rla
   39C6 9F            [ 4]  531 	sbc	a, a
   39C7 47            [ 4]  532 	ld	b,a
   39C8 7D            [ 4]  533 	ld	a,l
   39C9 91            [ 4]  534 	sub	a, c
   39CA 7C            [ 4]  535 	ld	a,h
   39CB 98            [ 4]  536 	sbc	a, b
   39CC E2 D1 39      [10]  537 	jp	PO, 00212$
   39CF EE 80         [ 7]  538 	xor	a, #0x80
   39D1                     539 00212$:
   39D1 F2 D9 39      [10]  540 	jp	P,00129$
   39D4                     541 00123$:
                            542 ;src/entities/user.c:90: user.vx+=user.ax;
   39D4 7B            [ 4]  543 	ld	a,e
   39D5 82            [ 4]  544 	add	a, d
   39D6 32 A2 64      [13]  545 	ld	(#(_user + 0x0008)),a
   39D9                     546 00129$:
                            547 ;src/entities/user.c:94: if (user.vx>0){
   39D9 21 A2 64      [10]  548 	ld	hl, #(_user + 0x0008) + 0
   39DC 56            [ 7]  549 	ld	d,(hl)
   39DD AF            [ 4]  550 	xor	a, a
   39DE 92            [ 4]  551 	sub	a, d
   39DF E2 E4 39      [10]  552 	jp	PO, 00213$
   39E2 EE 80         [ 7]  553 	xor	a, #0x80
   39E4                     554 00213$:
   39E4 F2 EE 39      [10]  555 	jp	P,00133$
                            556 ;src/entities/user.c:95: user.vx--;
   39E7 15            [ 4]  557 	dec	d
   39E8 21 A2 64      [10]  558 	ld	hl,#(_user + 0x0008)
   39EB 72            [ 7]  559 	ld	(hl),d
   39EC 18 09         [12]  560 	jr	00134$
   39EE                     561 00133$:
                            562 ;src/entities/user.c:96: } else if (user.vx<0){
   39EE CB 7A         [ 8]  563 	bit	7, d
   39F0 28 05         [12]  564 	jr	Z,00134$
                            565 ;src/entities/user.c:97: user.vx++;
   39F2 14            [ 4]  566 	inc	d
   39F3 21 A2 64      [10]  567 	ld	hl,#(_user + 0x0008)
   39F6 72            [ 7]  568 	ld	(hl),d
   39F7                     569 00134$:
                            570 ;src/entities/user.c:100: user.x+=user.vx;
   39F7 21 A0 64      [10]  571 	ld	hl, #(_user + 0x0006) + 0
   39FA 56            [ 7]  572 	ld	d,(hl)
   39FB 21 A2 64      [10]  573 	ld	hl, #(_user + 0x0008) + 0
   39FE 66            [ 7]  574 	ld	h,(hl)
   39FF 7A            [ 4]  575 	ld	a,d
   3A00 84            [ 4]  576 	add	a, h
   3A01 57            [ 4]  577 	ld	d,a
   3A02 21 A0 64      [10]  578 	ld	hl,#(_user + 0x0006)
   3A05 72            [ 7]  579 	ld	(hl),d
                            580 ;src/entities/user.c:102: if (user.x<0)
   3A06 21 A0 64      [10]  581 	ld	hl, #(_user + 0x0006) + 0
   3A09 5E            [ 7]  582 	ld	e,(hl)
   3A0A CB 7A         [ 8]  583 	bit	7, d
   3A0C 28 07         [12]  584 	jr	Z,00138$
                            585 ;src/entities/user.c:103: user.x=0;
   3A0E 21 A0 64      [10]  586 	ld	hl,#(_user + 0x0006)
   3A11 36 00         [10]  587 	ld	(hl),#0x00
   3A13 18 25         [12]  588 	jr	00140$
   3A15                     589 00138$:
                            590 ;src/entities/user.c:104: else if (user.x> 79-user.w){
   3A15 21 A8 64      [10]  591 	ld	hl, #_user + 14
   3A18 66            [ 7]  592 	ld	h,(hl)
   3A19 4C            [ 4]  593 	ld	c,h
   3A1A 06 00         [ 7]  594 	ld	b,#0x00
   3A1C 3E 4F         [ 7]  595 	ld	a,#0x4F
   3A1E 91            [ 4]  596 	sub	a, c
   3A1F 4F            [ 4]  597 	ld	c,a
   3A20 3E 00         [ 7]  598 	ld	a,#0x00
   3A22 98            [ 4]  599 	sbc	a, b
   3A23 47            [ 4]  600 	ld	b,a
   3A24 7B            [ 4]  601 	ld	a,e
   3A25 17            [ 4]  602 	rla
   3A26 9F            [ 4]  603 	sbc	a, a
   3A27 57            [ 4]  604 	ld	d,a
   3A28 79            [ 4]  605 	ld	a,c
   3A29 93            [ 4]  606 	sub	a, e
   3A2A 78            [ 4]  607 	ld	a,b
   3A2B 9A            [ 4]  608 	sbc	a, d
   3A2C E2 31 3A      [10]  609 	jp	PO, 00214$
   3A2F EE 80         [ 7]  610 	xor	a, #0x80
   3A31                     611 00214$:
   3A31 F2 3A 3A      [10]  612 	jp	P,00140$
                            613 ;src/entities/user.c:105: user.x = 79-user.w;
   3A34 3E 4F         [ 7]  614 	ld	a,#0x4F
   3A36 94            [ 4]  615 	sub	a, h
   3A37 32 A0 64      [13]  616 	ld	(#(_user + 0x0006)),a
   3A3A                     617 00140$:
   3A3A DD F9         [10]  618 	ld	sp, ix
   3A3C DD E1         [14]  619 	pop	ix
   3A3E C9            [10]  620 	ret
                            621 ;src/entities/user.c:109: void draw_user(u8* screen){
                            622 ;	---------------------------------
                            623 ; Function draw_user
                            624 ; ---------------------------------
   3A3F                     625 _draw_user::
   3A3F DD E5         [15]  626 	push	ix
   3A41 DD 21 00 00   [14]  627 	ld	ix,#0
   3A45 DD 39         [15]  628 	add	ix,sp
                            629 ;src/entities/user.c:111: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   3A47 21 A1 64      [10]  630 	ld	hl, #_user + 7
   3A4A 4E            [ 7]  631 	ld	c,(hl)
   3A4B 21 A0 64      [10]  632 	ld	hl, #_user + 6
   3A4E 66            [ 7]  633 	ld	h,(hl)
   3A4F DD 5E 04      [19]  634 	ld	e,4 (ix)
   3A52 DD 56 05      [19]  635 	ld	d,5 (ix)
   3A55 79            [ 4]  636 	ld	a,c
   3A56 F5            [11]  637 	push	af
   3A57 33            [ 6]  638 	inc	sp
   3A58 E5            [11]  639 	push	hl
   3A59 33            [ 6]  640 	inc	sp
   3A5A D5            [11]  641 	push	de
   3A5B CD A0 4F      [17]  642 	call	_cpct_getScreenPtr
   3A5E EB            [ 4]  643 	ex	de,hl
                            644 ;src/entities/user.c:112: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   3A5F 21 A9 64      [10]  645 	ld	hl, #_user + 15
   3A62 4E            [ 7]  646 	ld	c,(hl)
   3A63 21 A8 64      [10]  647 	ld	hl, #_user + 14
   3A66 46            [ 7]  648 	ld	b,(hl)
   3A67 2A 9E 64      [16]  649 	ld	hl, (#_user + 4)
   3A6A E5            [11]  650 	push	hl
   3A6B FD E1         [14]  651 	pop	iy
   3A6D 79            [ 4]  652 	ld	a,c
   3A6E F5            [11]  653 	push	af
   3A6F 33            [ 6]  654 	inc	sp
   3A70 C5            [11]  655 	push	bc
   3A71 33            [ 6]  656 	inc	sp
   3A72 D5            [11]  657 	push	de
   3A73 FD E5         [15]  658 	push	iy
   3A75 CD 5B 4C      [17]  659 	call	_cpct_drawSprite
   3A78 DD E1         [14]  660 	pop	ix
   3A7A C9            [10]  661 	ret
                            662 ;src/entities/user.c:115: void set_score(u32 new_score){
                            663 ;	---------------------------------
                            664 ; Function set_score
                            665 ; ---------------------------------
   3A7B                     666 _set_score::
                            667 ;src/entities/user.c:116: user.score = new_score;
   3A7B 11 B0 64      [10]  668 	ld	de,#_user+22
   3A7E 21 02 00      [10]  669 	ld	hl, #0x0002
   3A81 39            [11]  670 	add	hl, sp
   3A82 01 04 00      [10]  671 	ld	bc, #0x0004
   3A85 ED B0         [21]  672 	ldir
   3A87 C9            [10]  673 	ret
                            674 ;src/entities/user.c:118: void add_score(u16 new_add_score){
                            675 ;	---------------------------------
                            676 ; Function add_score
                            677 ; ---------------------------------
   3A88                     678 _add_score::
   3A88 DD E5         [15]  679 	push	ix
   3A8A DD 21 00 00   [14]  680 	ld	ix,#0
   3A8E DD 39         [15]  681 	add	ix,sp
   3A90 F5            [11]  682 	push	af
   3A91 F5            [11]  683 	push	af
                            684 ;src/entities/user.c:119: user.score += new_add_score;
   3A92 11 B0 64      [10]  685 	ld	de,#(_user + 0x0016)
   3A95 21 00 00      [10]  686 	ld	hl, #0x0000
   3A98 39            [11]  687 	add	hl, sp
   3A99 EB            [ 4]  688 	ex	de, hl
   3A9A 01 04 00      [10]  689 	ld	bc, #0x0004
   3A9D ED B0         [21]  690 	ldir
   3A9F DD 6E 04      [19]  691 	ld	l,4 (ix)
   3AA2 DD 66 05      [19]  692 	ld	h,5 (ix)
   3AA5 01 00 00      [10]  693 	ld	bc,#0x0000
   3AA8 DD 7E FC      [19]  694 	ld	a,-4 (ix)
   3AAB 85            [ 4]  695 	add	a, l
   3AAC 5F            [ 4]  696 	ld	e,a
   3AAD DD 7E FD      [19]  697 	ld	a,-3 (ix)
   3AB0 8C            [ 4]  698 	adc	a, h
   3AB1 57            [ 4]  699 	ld	d,a
   3AB2 DD 7E FE      [19]  700 	ld	a,-2 (ix)
   3AB5 89            [ 4]  701 	adc	a, c
   3AB6 4F            [ 4]  702 	ld	c,a
   3AB7 DD 7E FF      [19]  703 	ld	a,-1 (ix)
   3ABA 88            [ 4]  704 	adc	a, b
   3ABB 47            [ 4]  705 	ld	b,a
   3ABC ED 53 B0 64   [20]  706 	ld	((_user + 0x0016)), de
   3AC0 ED 43 B2 64   [20]  707 	ld	((_user + 0x0016)+2), bc
   3AC4 DD F9         [10]  708 	ld	sp, ix
   3AC6 DD E1         [14]  709 	pop	ix
   3AC8 C9            [10]  710 	ret
                            711 ;src/entities/user.c:121: u32 get_score(){
                            712 ;	---------------------------------
                            713 ; Function get_score
                            714 ; ---------------------------------
   3AC9                     715 _get_score::
                            716 ;src/entities/user.c:122: return user.score;
   3AC9 2A B0 64      [16]  717 	ld	hl, (#(_user + 0x0016) + 0)
   3ACC ED 5B B2 64   [20]  718 	ld	de, (#(_user + 0x0016) + 2)
   3AD0 C9            [10]  719 	ret
                            720 	.area _CODE
                            721 	.area _INITIALIZER
                            722 	.area _CABS (ABS)
