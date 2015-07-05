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
   41BB                      31 _shoots::
   41BB                      32 	.ds 180
   426F                      33 _active_shoots::
   426F                      34 	.ds 1
   4270                      35 _baddie_shoots::
   4270                      36 	.ds 72
   42B8                      37 _active_baddie_shoots::
   42B8                      38 	.ds 1
   42B9                      39 _max_baddie_shoots::
   42B9                      40 	.ds 1
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
   26EB                      69 _init_shoots::
   26EB DD E5         [15]   70 	push	ix
   26ED DD 21 00 00   [14]   71 	ld	ix,#0
   26F1 DD 39         [15]   72 	add	ix,sp
   26F3 3B            [ 6]   73 	dec	sp
                             74 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   26F4 DD 36 FF 00   [19]   75 	ld	-1 (ix),#0x00
   26F8 11 00 00      [10]   76 	ld	de,#0x0000
   26FB                      77 00102$:
                             78 ;src/entities/shoots.c:18: shoots[k].active=0;
   26FB 21 BB 41      [10]   79 	ld	hl,#_shoots
   26FE 19            [11]   80 	add	hl,de
   26FF 4D            [ 4]   81 	ld	c,l
   2700 44            [ 4]   82 	ld	b,h
   2701 21 08 00      [10]   83 	ld	hl,#0x0008
   2704 09            [11]   84 	add	hl,bc
   2705 36 00         [10]   85 	ld	(hl),#0x00
                             86 ;src/entities/shoots.c:19: shoots[k].x=0;
   2707 21 04 00      [10]   87 	ld	hl,#0x0004
   270A 09            [11]   88 	add	hl,bc
   270B 36 00         [10]   89 	ld	(hl),#0x00
                             90 ;src/entities/shoots.c:20: shoots[k].y=0;
   270D 21 05 00      [10]   91 	ld	hl,#0x0005
   2710 09            [11]   92 	add	hl,bc
   2711 36 00         [10]   93 	ld	(hl),#0x00
                             94 ;src/entities/shoots.c:21: shoots[k].w=0;
   2713 21 06 00      [10]   95 	ld	hl,#0x0006
   2716 09            [11]   96 	add	hl,bc
   2717 36 00         [10]   97 	ld	(hl),#0x00
                             98 ;src/entities/shoots.c:22: shoots[k].h=0;
   2719 21 07 00      [10]   99 	ld	hl,#0x0007
   271C 09            [11]  100 	add	hl,bc
   271D 36 00         [10]  101 	ld	(hl),#0x00
                            102 ;src/entities/shoots.c:23: shoots[k].frame=0;
   271F 21 0A 00      [10]  103 	ld	hl,#0x000A
   2722 09            [11]  104 	add	hl,bc
   2723 36 00         [10]  105 	ld	(hl),#0x00
                            106 ;src/entities/shoots.c:24: shoots[k].new=0;
   2725 21 0C 00      [10]  107 	ld	hl,#0x000C
   2728 09            [11]  108 	add	hl,bc
   2729 36 00         [10]  109 	ld	(hl),#0x00
                            110 ;src/entities/shoots.c:25: shoots[k].dead=0;
   272B 21 0D 00      [10]  111 	ld	hl,#0x000D
   272E 09            [11]  112 	add	hl,bc
   272F 36 00         [10]  113 	ld	(hl),#0x00
                            114 ;src/entities/shoots.c:26: shoots[k].lastmoved=0;
   2731 21 0E 00      [10]  115 	ld	hl,#0x000E
   2734 09            [11]  116 	add	hl,bc
   2735 AF            [ 4]  117 	xor	a, a
   2736 77            [ 7]  118 	ld	(hl), a
   2737 23            [ 6]  119 	inc	hl
   2738 77            [ 7]  120 	ld	(hl), a
   2739 23            [ 6]  121 	inc	hl
   273A AF            [ 4]  122 	xor	a, a
   273B 77            [ 7]  123 	ld	(hl), a
   273C 23            [ 6]  124 	inc	hl
   273D 77            [ 7]  125 	ld	(hl), a
                            126 ;src/entities/shoots.c:17: for (k=0;k<MAX_SHOOTS;k++){
   273E 21 12 00      [10]  127 	ld	hl,#0x0012
   2741 19            [11]  128 	add	hl,de
   2742 EB            [ 4]  129 	ex	de,hl
   2743 DD 34 FF      [23]  130 	inc	-1 (ix)
   2746 DD 7E FF      [19]  131 	ld	a,-1 (ix)
   2749 D6 0A         [ 7]  132 	sub	a, #0x0A
   274B 38 AE         [12]  133 	jr	C,00102$
                            134 ;src/entities/shoots.c:28: active_shoots=0;
   274D 21 6F 42      [10]  135 	ld	hl,#_active_shoots + 0
   2750 36 00         [10]  136 	ld	(hl), #0x00
   2752 33            [ 6]  137 	inc	sp
   2753 DD E1         [14]  138 	pop	ix
   2755 C9            [10]  139 	ret
                            140 ;src/entities/shoots.c:34: void create_shoot(u8 x, u8 y, u8 type){
                            141 ;	---------------------------------
                            142 ; Function create_shoot
                            143 ; ---------------------------------
   2756                     144 _create_shoot::
   2756 DD E5         [15]  145 	push	ix
   2758 DD 21 00 00   [14]  146 	ld	ix,#0
   275C DD 39         [15]  147 	add	ix,sp
   275E 21 F4 FF      [10]  148 	ld	hl,#-12
   2761 39            [11]  149 	add	hl,sp
   2762 F9            [ 6]  150 	ld	sp,hl
                            151 ;src/entities/shoots.c:36: if (active_shoots < get_user_max_shoots()){
   2763 CD 6F 2A      [17]  152 	call	_get_user_max_shoots
   2766 55            [ 4]  153 	ld	d,l
   2767 3A 6F 42      [13]  154 	ld	a,(#_active_shoots + 0)
   276A 92            [ 4]  155 	sub	a, d
   276B D2 7B 28      [10]  156 	jp	NC,00109$
                            157 ;src/entities/shoots.c:38: while (shoots[k].active){
   276E 11 00 00      [10]  158 	ld	de,#0x0000
   2771                     159 00101$:
   2771 21 BB 41      [10]  160 	ld	hl,#_shoots
   2774 19            [11]  161 	add	hl,de
   2775 DD 75 FE      [19]  162 	ld	-2 (ix),l
   2778 DD 74 FF      [19]  163 	ld	-1 (ix),h
   277B DD 7E FE      [19]  164 	ld	a,-2 (ix)
   277E C6 08         [ 7]  165 	add	a, #0x08
   2780 6F            [ 4]  166 	ld	l,a
   2781 DD 7E FF      [19]  167 	ld	a,-1 (ix)
   2784 CE 00         [ 7]  168 	adc	a, #0x00
   2786 67            [ 4]  169 	ld	h,a
   2787 7E            [ 7]  170 	ld	a,(hl)
   2788 B7            [ 4]  171 	or	a, a
   2789 28 07         [12]  172 	jr	Z,00103$
                            173 ;src/entities/shoots.c:39: k++;
   278B 21 12 00      [10]  174 	ld	hl,#0x0012
   278E 19            [11]  175 	add	hl,de
   278F EB            [ 4]  176 	ex	de,hl
   2790 18 DF         [12]  177 	jr	00101$
   2792                     178 00103$:
                            179 ;src/entities/shoots.c:41: shoots[k].active=1;
   2792 36 01         [10]  180 	ld	(hl),#0x01
                            181 ;src/entities/shoots.c:42: shoots[k].frame=0;
   2794 DD 7E FE      [19]  182 	ld	a,-2 (ix)
   2797 C6 0A         [ 7]  183 	add	a, #0x0A
   2799 6F            [ 4]  184 	ld	l,a
   279A DD 7E FF      [19]  185 	ld	a,-1 (ix)
   279D CE 00         [ 7]  186 	adc	a, #0x00
   279F 67            [ 4]  187 	ld	h,a
   27A0 36 00         [10]  188 	ld	(hl),#0x00
                            189 ;src/entities/shoots.c:46: shoots[k].x=x;
   27A2 DD 7E FE      [19]  190 	ld	a,-2 (ix)
   27A5 C6 04         [ 7]  191 	add	a, #0x04
   27A7 DD 77 FC      [19]  192 	ld	-4 (ix),a
   27AA DD 7E FF      [19]  193 	ld	a,-1 (ix)
   27AD CE 00         [ 7]  194 	adc	a, #0x00
   27AF DD 77 FD      [19]  195 	ld	-3 (ix),a
                            196 ;src/entities/shoots.c:47: shoots[k].y=y;
   27B2 DD 7E FE      [19]  197 	ld	a,-2 (ix)
   27B5 C6 05         [ 7]  198 	add	a, #0x05
   27B7 DD 77 FA      [19]  199 	ld	-6 (ix),a
   27BA DD 7E FF      [19]  200 	ld	a,-1 (ix)
   27BD CE 00         [ 7]  201 	adc	a, #0x00
   27BF DD 77 FB      [19]  202 	ld	-5 (ix),a
                            203 ;src/entities/shoots.c:48: shoots[k].w=1;
   27C2 DD 7E FE      [19]  204 	ld	a,-2 (ix)
   27C5 C6 06         [ 7]  205 	add	a, #0x06
   27C7 DD 77 F8      [19]  206 	ld	-8 (ix),a
   27CA DD 7E FF      [19]  207 	ld	a,-1 (ix)
   27CD CE 00         [ 7]  208 	adc	a, #0x00
   27CF DD 77 F9      [19]  209 	ld	-7 (ix),a
                            210 ;src/entities/shoots.c:49: shoots[k].h=4;
   27D2 DD 7E FE      [19]  211 	ld	a,-2 (ix)
   27D5 C6 07         [ 7]  212 	add	a, #0x07
   27D7 DD 77 F6      [19]  213 	ld	-10 (ix),a
   27DA DD 7E FF      [19]  214 	ld	a,-1 (ix)
   27DD CE 00         [ 7]  215 	adc	a, #0x00
   27DF DD 77 F7      [19]  216 	ld	-9 (ix),a
                            217 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   27E2 DD 7E FE      [19]  218 	ld	a,-2 (ix)
   27E5 C6 09         [ 7]  219 	add	a, #0x09
   27E7 DD 77 F4      [19]  220 	ld	-12 (ix),a
   27EA DD 7E FF      [19]  221 	ld	a,-1 (ix)
   27ED CE 00         [ 7]  222 	adc	a, #0x00
   27EF DD 77 F5      [19]  223 	ld	-11 (ix),a
                            224 ;src/entities/shoots.c:43: switch (type){
   27F2 DD 7E 06      [19]  225 	ld	a,6 (ix)
   27F5 3D            [ 4]  226 	dec	a
   27F6 20 35         [12]  227 	jr	NZ,00105$
                            228 ;src/entities/shoots.c:46: shoots[k].x=x;
   27F8 DD 6E FC      [19]  229 	ld	l,-4 (ix)
   27FB DD 66 FD      [19]  230 	ld	h,-3 (ix)
   27FE DD 7E 04      [19]  231 	ld	a,4 (ix)
   2801 77            [ 7]  232 	ld	(hl),a
                            233 ;src/entities/shoots.c:47: shoots[k].y=y;
   2802 DD 6E FA      [19]  234 	ld	l,-6 (ix)
   2805 DD 66 FB      [19]  235 	ld	h,-5 (ix)
   2808 DD 7E 05      [19]  236 	ld	a,5 (ix)
   280B 77            [ 7]  237 	ld	(hl),a
                            238 ;src/entities/shoots.c:48: shoots[k].w=1;
   280C DD 6E F8      [19]  239 	ld	l,-8 (ix)
   280F DD 66 F9      [19]  240 	ld	h,-7 (ix)
   2812 36 01         [10]  241 	ld	(hl),#0x01
                            242 ;src/entities/shoots.c:49: shoots[k].h=4;
   2814 DD 6E F6      [19]  243 	ld	l,-10 (ix)
   2817 DD 66 F7      [19]  244 	ld	h,-9 (ix)
   281A 36 04         [10]  245 	ld	(hl),#0x04
                            246 ;src/entities/shoots.c:50: shoots[k].num_frames=1;
   281C E1            [10]  247 	pop	hl
   281D E5            [11]  248 	push	hl
   281E 36 01         [10]  249 	ld	(hl),#0x01
                            250 ;src/entities/shoots.c:51: shoots[k].sprite[0]= (u8*) bullet02_0;
   2820 DD 6E FE      [19]  251 	ld	l,-2 (ix)
   2823 DD 66 FF      [19]  252 	ld	h,-1 (ix)
   2826 36 F8         [10]  253 	ld	(hl),#<(_bullet02_0)
   2828 23            [ 6]  254 	inc	hl
   2829 36 32         [10]  255 	ld	(hl),#>(_bullet02_0)
                            256 ;src/entities/shoots.c:52: break;
   282B 18 4A         [12]  257 	jr	00106$
                            258 ;src/entities/shoots.c:53: default:
   282D                     259 00105$:
                            260 ;src/entities/shoots.c:54: shoots[k].x=x;
   282D DD 6E FC      [19]  261 	ld	l,-4 (ix)
   2830 DD 66 FD      [19]  262 	ld	h,-3 (ix)
   2833 DD 7E 04      [19]  263 	ld	a,4 (ix)
   2836 77            [ 7]  264 	ld	(hl),a
                            265 ;src/entities/shoots.c:55: shoots[k].y=y;
   2837 DD 6E FA      [19]  266 	ld	l,-6 (ix)
   283A DD 66 FB      [19]  267 	ld	h,-5 (ix)
   283D DD 7E 05      [19]  268 	ld	a,5 (ix)
   2840 77            [ 7]  269 	ld	(hl),a
                            270 ;src/entities/shoots.c:56: shoots[k].w=1;
   2841 DD 6E F8      [19]  271 	ld	l,-8 (ix)
   2844 DD 66 F9      [19]  272 	ld	h,-7 (ix)
   2847 36 01         [10]  273 	ld	(hl),#0x01
                            274 ;src/entities/shoots.c:57: shoots[k].h=8;
   2849 DD 6E F6      [19]  275 	ld	l,-10 (ix)
   284C DD 66 F7      [19]  276 	ld	h,-9 (ix)
   284F 36 08         [10]  277 	ld	(hl),#0x08
                            278 ;src/entities/shoots.c:58: shoots[k].num_frames=2;
   2851 E1            [10]  279 	pop	hl
   2852 E5            [11]  280 	push	hl
   2853 36 02         [10]  281 	ld	(hl),#0x02
                            282 ;src/entities/shoots.c:59: shoots[k].sprite[0]= (u8*) bullet01_0;
   2855 DD 6E FE      [19]  283 	ld	l,-2 (ix)
   2858 DD 66 FF      [19]  284 	ld	h,-1 (ix)
   285B 36 E8         [10]  285 	ld	(hl),#<(_bullet01_0)
   285D 23            [ 6]  286 	inc	hl
   285E 36 32         [10]  287 	ld	(hl),#>(_bullet01_0)
                            288 ;src/entities/shoots.c:60: shoots[k].sprite[1]= (u8*) bullet01_1;
   2860 DD 7E FE      [19]  289 	ld	a,-2 (ix)
   2863 C6 02         [ 7]  290 	add	a, #0x02
   2865 DD 77 F4      [19]  291 	ld	-12 (ix),a
   2868 DD 7E FF      [19]  292 	ld	a,-1 (ix)
   286B CE 00         [ 7]  293 	adc	a, #0x00
   286D DD 77 F5      [19]  294 	ld	-11 (ix),a
   2870 E1            [10]  295 	pop	hl
   2871 E5            [11]  296 	push	hl
   2872 36 F0         [10]  297 	ld	(hl),#<(_bullet01_1)
   2874 23            [ 6]  298 	inc	hl
   2875 36 32         [10]  299 	ld	(hl),#>(_bullet01_1)
                            300 ;src/entities/shoots.c:62: }
   2877                     301 00106$:
                            302 ;src/entities/shoots.c:63: active_shoots++;
   2877 21 6F 42      [10]  303 	ld	hl, #_active_shoots+0
   287A 34            [11]  304 	inc	(hl)
   287B                     305 00109$:
   287B DD F9         [10]  306 	ld	sp, ix
   287D DD E1         [14]  307 	pop	ix
   287F C9            [10]  308 	ret
                            309 ;src/entities/shoots.c:72: void update_shoots(){
                            310 ;	---------------------------------
                            311 ; Function update_shoots
                            312 ; ---------------------------------
   2880                     313 _update_shoots::
   2880 DD E5         [15]  314 	push	ix
   2882 DD 21 00 00   [14]  315 	ld	ix,#0
   2886 DD 39         [15]  316 	add	ix,sp
   2888 F5            [11]  317 	push	af
   2889 3B            [ 6]  318 	dec	sp
                            319 ;src/entities/shoots.c:75: if (active_shoots>0){
   288A 3A 6F 42      [13]  320 	ld	a,(#_active_shoots + 0)
   288D B7            [ 4]  321 	or	a, a
   288E CA 11 29      [10]  322 	jp	Z,00113$
                            323 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2891 DD 36 FD 00   [19]  324 	ld	-3 (ix),#0x00
   2895 11 00 00      [10]  325 	ld	de,#0x0000
   2898                     326 00111$:
                            327 ;src/entities/shoots.c:77: if (shoots[i].active){
   2898 21 BB 41      [10]  328 	ld	hl,#_shoots
   289B 19            [11]  329 	add	hl,de
   289C DD 75 FE      [19]  330 	ld	-2 (ix),l
   289F DD 74 FF      [19]  331 	ld	-1 (ix),h
   28A2 DD 7E FE      [19]  332 	ld	a,-2 (ix)
   28A5 C6 08         [ 7]  333 	add	a, #0x08
   28A7 4F            [ 4]  334 	ld	c,a
   28A8 DD 7E FF      [19]  335 	ld	a,-1 (ix)
   28AB CE 00         [ 7]  336 	adc	a, #0x00
   28AD 47            [ 4]  337 	ld	b,a
   28AE 0A            [ 7]  338 	ld	a,(bc)
   28AF B7            [ 4]  339 	or	a, a
   28B0 28 50         [12]  340 	jr	Z,00112$
                            341 ;src/entities/shoots.c:78: shoots[i].y-=SHOOT_JUMP;
   28B2 FD 21 05 00   [14]  342 	ld	iy,#0x0005
   28B6 C5            [11]  343 	push	bc
   28B7 DD 4E FE      [19]  344 	ld	c,-2 (ix)
   28BA DD 46 FF      [19]  345 	ld	b,-1 (ix)
   28BD FD 09         [15]  346 	add	iy, bc
   28BF C1            [10]  347 	pop	bc
   28C0 FD 7E 00      [19]  348 	ld	a, 0 (iy)
   28C3 C6 F8         [ 7]  349 	add	a,#0xF8
   28C5 67            [ 4]  350 	ld	h,a
   28C6 FD 74 00      [19]  351 	ld	0 (iy), h
                            352 ;src/entities/shoots.c:79: if (shoots[i].y<200){
   28C9 7C            [ 4]  353 	ld	a,h
   28CA D6 C8         [ 7]  354 	sub	a, #0xC8
   28CC 30 2E         [12]  355 	jr	NC,00104$
                            356 ;src/entities/shoots.c:80: shoots[i].frame++;
   28CE FD 21 0A 00   [14]  357 	ld	iy,#0x000A
   28D2 DD 4E FE      [19]  358 	ld	c,-2 (ix)
   28D5 DD 46 FF      [19]  359 	ld	b,-1 (ix)
   28D8 FD 09         [15]  360 	add	iy, bc
   28DA FD 34 00      [23]  361 	inc	0 (iy)
   28DD FD 4E 00      [19]  362 	ld	c, 0 (iy)
                            363 ;src/entities/shoots.c:81: if (shoots[i].frame==shoots[i].num_frames)
   28E0 DD 6E FE      [19]  364 	ld	l,-2 (ix)
   28E3 DD 66 FF      [19]  365 	ld	h,-1 (ix)
   28E6 C5            [11]  366 	push	bc
   28E7 01 09 00      [10]  367 	ld	bc, #0x0009
   28EA 09            [11]  368 	add	hl, bc
   28EB C1            [10]  369 	pop	bc
   28EC 7E            [ 7]  370 	ld	a,(hl)
   28ED DD 77 FE      [19]  371 	ld	-2 (ix),a
   28F0 79            [ 4]  372 	ld	a,c
   28F1 DD 96 FE      [19]  373 	sub	a, -2 (ix)
   28F4 20 0C         [12]  374 	jr	NZ,00112$
                            375 ;src/entities/shoots.c:82: shoots[i].frame=0;
   28F6 FD 36 00 00   [19]  376 	ld	0 (iy), #0x00
   28FA 18 06         [12]  377 	jr	00112$
   28FC                     378 00104$:
                            379 ;src/entities/shoots.c:85: shoots[i].active=0;
   28FC AF            [ 4]  380 	xor	a, a
   28FD 02            [ 7]  381 	ld	(bc),a
                            382 ;src/entities/shoots.c:86: active_shoots--;
   28FE 21 6F 42      [10]  383 	ld	hl, #_active_shoots+0
   2901 35            [11]  384 	dec	(hl)
   2902                     385 00112$:
                            386 ;src/entities/shoots.c:76: for (i=0;i<MAX_SHOOTS;i++){
   2902 21 12 00      [10]  387 	ld	hl,#0x0012
   2905 19            [11]  388 	add	hl,de
   2906 EB            [ 4]  389 	ex	de,hl
   2907 DD 34 FD      [23]  390 	inc	-3 (ix)
   290A DD 7E FD      [19]  391 	ld	a,-3 (ix)
   290D D6 0A         [ 7]  392 	sub	a, #0x0A
   290F 38 87         [12]  393 	jr	C,00111$
   2911                     394 00113$:
   2911 DD F9         [10]  395 	ld	sp, ix
   2913 DD E1         [14]  396 	pop	ix
   2915 C9            [10]  397 	ret
                            398 ;src/entities/shoots.c:98: void draw_shoots(u8* screen){
                            399 ;	---------------------------------
                            400 ; Function draw_shoots
                            401 ; ---------------------------------
   2916                     402 _draw_shoots::
   2916 DD E5         [15]  403 	push	ix
   2918 DD 21 00 00   [14]  404 	ld	ix,#0
   291C DD 39         [15]  405 	add	ix,sp
   291E 21 F9 FF      [10]  406 	ld	hl,#-7
   2921 39            [11]  407 	add	hl,sp
   2922 F9            [ 6]  408 	ld	sp,hl
                            409 ;src/entities/shoots.c:103: if (active_shoots>0){
   2923 3A 6F 42      [13]  410 	ld	a,(#_active_shoots + 0)
   2926 B7            [ 4]  411 	or	a, a
   2927 CA DF 29      [10]  412 	jp	Z,00108$
                            413 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   292A DD 36 F9 00   [19]  414 	ld	-7 (ix),#0x00
   292E 11 00 00      [10]  415 	ld	de,#0x0000
   2931                     416 00106$:
                            417 ;src/entities/shoots.c:105: if (shoots[k].active){
   2931 21 BB 41      [10]  418 	ld	hl,#_shoots
   2934 19            [11]  419 	add	hl,de
   2935 DD 75 FD      [19]  420 	ld	-3 (ix),l
   2938 DD 74 FE      [19]  421 	ld	-2 (ix),h
   293B DD 6E FD      [19]  422 	ld	l,-3 (ix)
   293E DD 66 FE      [19]  423 	ld	h,-2 (ix)
   2941 01 08 00      [10]  424 	ld	bc, #0x0008
   2944 09            [11]  425 	add	hl, bc
   2945 7E            [ 7]  426 	ld	a,(hl)
   2946 B7            [ 4]  427 	or	a, a
   2947 CA CF 29      [10]  428 	jp	Z,00107$
                            429 ;src/entities/shoots.c:106: pscreen = cpct_getScreenPtr(screen, shoots[k].x, shoots[k].y);
   294A DD 6E FD      [19]  430 	ld	l,-3 (ix)
   294D DD 66 FE      [19]  431 	ld	h,-2 (ix)
   2950 01 05 00      [10]  432 	ld	bc, #0x0005
   2953 09            [11]  433 	add	hl, bc
   2954 46            [ 7]  434 	ld	b,(hl)
   2955 DD 6E FD      [19]  435 	ld	l,-3 (ix)
   2958 DD 66 FE      [19]  436 	ld	h,-2 (ix)
   295B 23            [ 6]  437 	inc	hl
   295C 23            [ 6]  438 	inc	hl
   295D 23            [ 6]  439 	inc	hl
   295E 23            [ 6]  440 	inc	hl
   295F 4E            [ 7]  441 	ld	c,(hl)
   2960 E5            [11]  442 	push	hl
   2961 DD 6E 04      [19]  443 	ld	l,4 (ix)
   2964 DD 66 05      [19]  444 	ld	h,5 (ix)
   2967 E5            [11]  445 	push	hl
   2968 FD E1         [14]  446 	pop	iy
   296A E1            [10]  447 	pop	hl
   296B D5            [11]  448 	push	de
   296C C5            [11]  449 	push	bc
   296D FD E5         [15]  450 	push	iy
   296F CD E6 3E      [17]  451 	call	_cpct_getScreenPtr
   2972 F1            [10]  452 	pop	af
   2973 F1            [10]  453 	pop	af
   2974 D1            [10]  454 	pop	de
   2975 45            [ 4]  455 	ld	b,l
   2976 4C            [ 4]  456 	ld	c,h
                            457 ;src/entities/shoots.c:107: cpct_drawSprite(shoots[k].sprite[shoots[k].frame],pscreen,shoots[k].w,shoots[k].h);
   2977 DD 6E FD      [19]  458 	ld	l,-3 (ix)
   297A DD 66 FE      [19]  459 	ld	h,-2 (ix)
   297D C5            [11]  460 	push	bc
   297E 01 07 00      [10]  461 	ld	bc, #0x0007
   2981 09            [11]  462 	add	hl, bc
   2982 C1            [10]  463 	pop	bc
   2983 7E            [ 7]  464 	ld	a,(hl)
   2984 DD 77 FF      [19]  465 	ld	-1 (ix),a
   2987 DD 6E FD      [19]  466 	ld	l,-3 (ix)
   298A DD 66 FE      [19]  467 	ld	h,-2 (ix)
   298D C5            [11]  468 	push	bc
   298E 01 06 00      [10]  469 	ld	bc, #0x0006
   2991 09            [11]  470 	add	hl, bc
   2992 C1            [10]  471 	pop	bc
   2993 7E            [ 7]  472 	ld	a,(hl)
   2994 DD 77 FC      [19]  473 	ld	-4 (ix),a
   2997 DD 70 FA      [19]  474 	ld	-6 (ix),b
   299A DD 71 FB      [19]  475 	ld	-5 (ix),c
   299D DD 6E FD      [19]  476 	ld	l,-3 (ix)
   29A0 DD 66 FE      [19]  477 	ld	h,-2 (ix)
   29A3 01 0A 00      [10]  478 	ld	bc, #0x000A
   29A6 09            [11]  479 	add	hl, bc
   29A7 7E            [ 7]  480 	ld	a,(hl)
   29A8 87            [ 4]  481 	add	a, a
   29A9 4F            [ 4]  482 	ld	c,a
   29AA DD 6E FD      [19]  483 	ld	l,-3 (ix)
   29AD DD 66 FE      [19]  484 	ld	h,-2 (ix)
   29B0 06 00         [ 7]  485 	ld	b,#0x00
   29B2 09            [11]  486 	add	hl, bc
   29B3 4E            [ 7]  487 	ld	c,(hl)
   29B4 23            [ 6]  488 	inc	hl
   29B5 46            [ 7]  489 	ld	b,(hl)
   29B6 D5            [11]  490 	push	de
   29B7 DD 66 FF      [19]  491 	ld	h,-1 (ix)
   29BA DD 6E FC      [19]  492 	ld	l,-4 (ix)
   29BD E5            [11]  493 	push	hl
   29BE DD 6E FA      [19]  494 	ld	l,-6 (ix)
   29C1 DD 66 FB      [19]  495 	ld	h,-5 (ix)
   29C4 E5            [11]  496 	push	hl
   29C5 C5            [11]  497 	push	bc
   29C6 CD B7 3C      [17]  498 	call	_cpct_drawSprite
   29C9 21 06 00      [10]  499 	ld	hl,#6
   29CC 39            [11]  500 	add	hl,sp
   29CD F9            [ 6]  501 	ld	sp,hl
   29CE D1            [10]  502 	pop	de
   29CF                     503 00107$:
                            504 ;src/entities/shoots.c:104: for (k=0;k<MAX_SHOOTS;k++){
   29CF 21 12 00      [10]  505 	ld	hl,#0x0012
   29D2 19            [11]  506 	add	hl,de
   29D3 EB            [ 4]  507 	ex	de,hl
   29D4 DD 34 F9      [23]  508 	inc	-7 (ix)
   29D7 DD 7E F9      [19]  509 	ld	a,-7 (ix)
   29DA D6 0A         [ 7]  510 	sub	a, #0x0A
   29DC DA 31 29      [10]  511 	jp	C,00106$
   29DF                     512 00108$:
   29DF DD F9         [10]  513 	ld	sp, ix
   29E1 DD E1         [14]  514 	pop	ix
   29E3 C9            [10]  515 	ret
                            516 	.area _CODE
                            517 	.area _INITIALIZER
                            518 	.area _CABS (ABS)
