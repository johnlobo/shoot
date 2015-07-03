                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Fri Jul  3 18:17:51 2015
                              5 ;--------------------------------------------------------
                              6 	.module user
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _create_shoot
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSprite
                             15 	.globl _cpct_isKeyPressed
                             16 	.globl _cpct_scanKeyboard_f
                             17 	.globl _shoot_type
                             18 	.globl _user
                             19 	.globl _init_user
                             20 	.globl _get_user_max_shoots
                             21 	.globl _update_user
                             22 	.globl _draw_user
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   3800                      30 _user::
   3800                      31 	.ds 18
   3812                      32 _shoot_type::
   3812                      33 	.ds 1
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/entities/user.c:8: void init_user(){
                             59 ;	---------------------------------
                             60 ; Function init_user
                             61 ; ---------------------------------
   25BA                      62 _init_user::
                             63 ;src/entities/user.c:17: user.w = 6;
   25BA 21 08 38      [10]   64 	ld	hl,#_user + 8
   25BD 36 06         [10]   65 	ld	(hl),#0x06
                             66 ;src/entities/user.c:18: user.h = 16;
   25BF FD 21 09 38   [14]   67 	ld	iy,#_user + 9
   25C3 FD 36 00 10   [19]   68 	ld	0 (iy), #0x10
                             69 ;src/entities/user.c:19: user.x = 39-(user.w/2);
   25C7 6E            [ 7]   70 	ld	l,(hl)
   25C8 CB 3D         [ 8]   71 	srl	l
   25CA 3E 27         [ 7]   72 	ld	a,#0x27
   25CC 95            [ 4]   73 	sub	a, l
   25CD 32 06 38      [13]   74 	ld	(#(_user + 0x0006)),a
                             75 ;src/entities/user.c:20: user.y = 199-(user.h);
   25D0 FD 66 00      [19]   76 	ld	h, 0 (iy)
   25D3 3E C7         [ 7]   77 	ld	a,#0xC7
   25D5 94            [ 4]   78 	sub	a, h
   25D6 32 07 38      [13]   79 	ld	(#(_user + 0x0007)),a
                             80 ;src/entities/user.c:21: user.sprite = (u8*) ship03;
   25D9 21 69 2A      [10]   81 	ld	hl,#_ship03
   25DC 22 04 38      [16]   82 	ld	((_user + 0x0004)), hl
                             83 ;src/entities/user.c:23: user.vx = 2;
   25DF 21 0E 38      [10]   84 	ld	hl,#_user + 14
   25E2 36 02         [10]   85 	ld	(hl),#0x02
                             86 ;src/entities/user.c:24: user.vy = 4;
   25E4 21 0F 38      [10]   87 	ld	hl,#_user + 15
   25E7 36 04         [10]   88 	ld	(hl),#0x04
                             89 ;src/entities/user.c:25: user.max_shoots = 10;
   25E9 21 11 38      [10]   90 	ld	hl,#_user + 17
   25EC 36 0A         [10]   91 	ld	(hl),#0x0A
                             92 ;src/entities/user.c:26: shoot_type = 1;
   25EE 21 12 38      [10]   93 	ld	hl,#_shoot_type + 0
   25F1 36 01         [10]   94 	ld	(hl), #0x01
   25F3 C9            [10]   95 	ret
                             96 ;src/entities/user.c:29: u8 get_user_max_shoots(){
                             97 ;	---------------------------------
                             98 ; Function get_user_max_shoots
                             99 ; ---------------------------------
   25F4                     100 _get_user_max_shoots::
                            101 ;src/entities/user.c:30: return user.max_shoots;
   25F4 21 11 38      [10]  102 	ld	hl,#_user+17
   25F7 6E            [ 7]  103 	ld	l,(hl)
   25F8 C9            [10]  104 	ret
                            105 ;src/entities/user.c:36: void update_user() {
                            106 ;	---------------------------------
                            107 ; Function update_user
                            108 ; ---------------------------------
   25F9                     109 _update_user::
   25F9 DD E5         [15]  110 	push	ix
   25FB DD 21 00 00   [14]  111 	ld	ix,#0
   25FF DD 39         [15]  112 	add	ix,sp
   2601 3B            [ 6]  113 	dec	sp
                            114 ;src/entities/user.c:39: cpct_scanKeyboard_f();
   2602 CD 1F 32      [17]  115 	call	_cpct_scanKeyboard_f
                            116 ;src/entities/user.c:46: if ((cpct_isKeyPressed(Key_Q))){ 
   2605 21 08 08      [10]  117 	ld	hl,#0x0808
   2608 E5            [11]  118 	push	hl
   2609 CD 0E 32      [17]  119 	call	_cpct_isKeyPressed
   260C F1            [10]  120 	pop	af
   260D 7D            [ 4]  121 	ld	a,l
   260E B7            [ 4]  122 	or	a, a
   260F 28 2D         [12]  123 	jr	Z,00105$
                            124 ;src/entities/user.c:47: if ((user.y-user.vy)>0)
   2611 21 07 38      [10]  125 	ld	hl, #(_user + 0x0007) + 0
   2614 5E            [ 7]  126 	ld	e,(hl)
   2615 4B            [ 4]  127 	ld	c,e
   2616 06 00         [ 7]  128 	ld	b,#0x00
   2618 21 0F 38      [10]  129 	ld	hl, #_user + 15
   261B 56            [ 7]  130 	ld	d,(hl)
   261C 7A            [ 4]  131 	ld	a,d
   261D 6F            [ 4]  132 	ld	l,a
   261E 17            [ 4]  133 	rla
   261F 9F            [ 4]  134 	sbc	a, a
   2620 67            [ 4]  135 	ld	h,a
   2621 79            [ 4]  136 	ld	a,c
   2622 95            [ 4]  137 	sub	a, l
   2623 6F            [ 4]  138 	ld	l,a
   2624 78            [ 4]  139 	ld	a,b
   2625 9C            [ 4]  140 	sbc	a, h
   2626 67            [ 4]  141 	ld	h,a
   2627 AF            [ 4]  142 	xor	a, a
   2628 BD            [ 4]  143 	cp	a, l
   2629 9C            [ 4]  144 	sbc	a, h
   262A E2 2F 26      [10]  145 	jp	PO, 00167$
   262D EE 80         [ 7]  146 	xor	a, #0x80
   262F                     147 00167$:
   262F F2 39 26      [10]  148 	jp	P,00102$
                            149 ;src/entities/user.c:48: user.y = user.y - user.vy;
   2632 7B            [ 4]  150 	ld	a,e
   2633 92            [ 4]  151 	sub	a, d
   2634 32 07 38      [13]  152 	ld	(#(_user + 0x0007)),a
   2637 18 05         [12]  153 	jr	00105$
   2639                     154 00102$:
                            155 ;src/entities/user.c:50: user.y = 0;
   2639 21 07 38      [10]  156 	ld	hl,#(_user + 0x0007)
   263C 36 00         [10]  157 	ld	(hl),#0x00
   263E                     158 00105$:
                            159 ;src/entities/user.c:53: if ((cpct_isKeyPressed(Key_P))){ 
   263E 21 03 08      [10]  160 	ld	hl,#0x0803
   2641 E5            [11]  161 	push	hl
   2642 CD 0E 32      [17]  162 	call	_cpct_isKeyPressed
   2645 F1            [10]  163 	pop	af
   2646 7D            [ 4]  164 	ld	a,l
   2647 B7            [ 4]  165 	or	a, a
   2648 28 3F         [12]  166 	jr	Z,00110$
                            167 ;src/entities/user.c:54: if ((user.x+user.vx<(79-user.w)))
   264A 21 06 38      [10]  168 	ld	hl, #(_user + 0x0006) + 0
   264D 5E            [ 7]  169 	ld	e,(hl)
   264E 4B            [ 4]  170 	ld	c,e
   264F 06 00         [ 7]  171 	ld	b,#0x00
   2651 21 0E 38      [10]  172 	ld	hl, #_user + 14
   2654 56            [ 7]  173 	ld	d,(hl)
   2655 7A            [ 4]  174 	ld	a,d
   2656 6F            [ 4]  175 	ld	l,a
   2657 17            [ 4]  176 	rla
   2658 9F            [ 4]  177 	sbc	a, a
   2659 67            [ 4]  178 	ld	h,a
   265A 09            [11]  179 	add	hl,bc
   265B 4D            [ 4]  180 	ld	c,l
   265C 44            [ 4]  181 	ld	b,h
   265D 3A 08 38      [13]  182 	ld	a,(#_user + 8)
   2660 DD 77 FF      [19]  183 	ld	-1 (ix), a
   2663 6F            [ 4]  184 	ld	l, a
   2664 26 00         [ 7]  185 	ld	h,#0x00
   2666 3E 4F         [ 7]  186 	ld	a,#0x4F
   2668 95            [ 4]  187 	sub	a, l
   2669 6F            [ 4]  188 	ld	l,a
   266A 3E 00         [ 7]  189 	ld	a,#0x00
   266C 9C            [ 4]  190 	sbc	a, h
   266D 67            [ 4]  191 	ld	h,a
   266E 79            [ 4]  192 	ld	a,c
   266F 95            [ 4]  193 	sub	a, l
   2670 78            [ 4]  194 	ld	a,b
   2671 9C            [ 4]  195 	sbc	a, h
   2672 E2 77 26      [10]  196 	jp	PO, 00168$
   2675 EE 80         [ 7]  197 	xor	a, #0x80
   2677                     198 00168$:
   2677 F2 81 26      [10]  199 	jp	P,00107$
                            200 ;src/entities/user.c:55: user.x = user.x + user.vx;
   267A 7B            [ 4]  201 	ld	a,e
   267B 82            [ 4]  202 	add	a, d
   267C 32 06 38      [13]  203 	ld	(#(_user + 0x0006)),a
   267F 18 08         [12]  204 	jr	00110$
   2681                     205 00107$:
                            206 ;src/entities/user.c:57: user.x = 79-user.w;
   2681 3E 4F         [ 7]  207 	ld	a,#0x4F
   2683 DD 96 FF      [19]  208 	sub	a, -1 (ix)
   2686 32 06 38      [13]  209 	ld	(#(_user + 0x0006)),a
   2689                     210 00110$:
                            211 ;src/entities/user.c:60: if (cpct_isKeyPressed(Key_O)){
   2689 21 04 04      [10]  212 	ld	hl,#0x0404
   268C E5            [11]  213 	push	hl
   268D CD 0E 32      [17]  214 	call	_cpct_isKeyPressed
   2690 F1            [10]  215 	pop	af
   2691 7D            [ 4]  216 	ld	a,l
   2692 B7            [ 4]  217 	or	a, a
   2693 28 2D         [12]  218 	jr	Z,00115$
                            219 ;src/entities/user.c:61: if ((user.x-user.vx)>0) 
   2695 21 06 38      [10]  220 	ld	hl, #(_user + 0x0006) + 0
   2698 5E            [ 7]  221 	ld	e,(hl)
   2699 4B            [ 4]  222 	ld	c,e
   269A 06 00         [ 7]  223 	ld	b,#0x00
   269C 21 0E 38      [10]  224 	ld	hl, #_user + 14
   269F 56            [ 7]  225 	ld	d,(hl)
   26A0 7A            [ 4]  226 	ld	a,d
   26A1 6F            [ 4]  227 	ld	l,a
   26A2 17            [ 4]  228 	rla
   26A3 9F            [ 4]  229 	sbc	a, a
   26A4 67            [ 4]  230 	ld	h,a
   26A5 79            [ 4]  231 	ld	a,c
   26A6 95            [ 4]  232 	sub	a, l
   26A7 6F            [ 4]  233 	ld	l,a
   26A8 78            [ 4]  234 	ld	a,b
   26A9 9C            [ 4]  235 	sbc	a, h
   26AA 67            [ 4]  236 	ld	h,a
   26AB AF            [ 4]  237 	xor	a, a
   26AC BD            [ 4]  238 	cp	a, l
   26AD 9C            [ 4]  239 	sbc	a, h
   26AE E2 B3 26      [10]  240 	jp	PO, 00169$
   26B1 EE 80         [ 7]  241 	xor	a, #0x80
   26B3                     242 00169$:
   26B3 F2 BD 26      [10]  243 	jp	P,00112$
                            244 ;src/entities/user.c:62: user.x = user.x - user.vx;    
   26B6 7B            [ 4]  245 	ld	a,e
   26B7 92            [ 4]  246 	sub	a, d
   26B8 32 06 38      [13]  247 	ld	(#(_user + 0x0006)),a
   26BB 18 05         [12]  248 	jr	00115$
   26BD                     249 00112$:
                            250 ;src/entities/user.c:64: user.x = 0;
   26BD 21 06 38      [10]  251 	ld	hl,#(_user + 0x0006)
   26C0 36 00         [10]  252 	ld	(hl),#0x00
   26C2                     253 00115$:
                            254 ;src/entities/user.c:67: if (cpct_isKeyPressed(Key_A)){
   26C2 21 08 20      [10]  255 	ld	hl,#0x2008
   26C5 E5            [11]  256 	push	hl
   26C6 CD 0E 32      [17]  257 	call	_cpct_isKeyPressed
   26C9 F1            [10]  258 	pop	af
   26CA 7D            [ 4]  259 	ld	a,l
   26CB B7            [ 4]  260 	or	a, a
   26CC 28 37         [12]  261 	jr	Z,00120$
                            262 ;src/entities/user.c:68: if ((user.y<(199-user.h) ))
   26CE 21 07 38      [10]  263 	ld	hl, #(_user + 0x0007) + 0
   26D1 5E            [ 7]  264 	ld	e,(hl)
   26D2 3A 09 38      [13]  265 	ld	a,(#_user + 9)
   26D5 DD 77 FF      [19]  266 	ld	-1 (ix), a
   26D8 6F            [ 4]  267 	ld	l, a
   26D9 26 00         [ 7]  268 	ld	h,#0x00
   26DB 3E C7         [ 7]  269 	ld	a,#0xC7
   26DD 95            [ 4]  270 	sub	a, l
   26DE 6F            [ 4]  271 	ld	l,a
   26DF 3E 00         [ 7]  272 	ld	a,#0x00
   26E1 9C            [ 4]  273 	sbc	a, h
   26E2 67            [ 4]  274 	ld	h,a
   26E3 4B            [ 4]  275 	ld	c,e
   26E4 16 00         [ 7]  276 	ld	d,#0x00
   26E6 79            [ 4]  277 	ld	a,c
   26E7 95            [ 4]  278 	sub	a, l
   26E8 7A            [ 4]  279 	ld	a,d
   26E9 9C            [ 4]  280 	sbc	a, h
   26EA E2 EF 26      [10]  281 	jp	PO, 00170$
   26ED EE 80         [ 7]  282 	xor	a, #0x80
   26EF                     283 00170$:
   26EF F2 FD 26      [10]  284 	jp	P,00117$
                            285 ;src/entities/user.c:69: user.y = user.y + user.vy;
   26F2 21 0F 38      [10]  286 	ld	hl, #_user + 15
   26F5 6E            [ 7]  287 	ld	l,(hl)
   26F6 7B            [ 4]  288 	ld	a,e
   26F7 85            [ 4]  289 	add	a, l
   26F8 32 07 38      [13]  290 	ld	(#(_user + 0x0007)),a
   26FB 18 08         [12]  291 	jr	00120$
   26FD                     292 00117$:
                            293 ;src/entities/user.c:71: user.y = 199-user.h;
   26FD 3E C7         [ 7]  294 	ld	a,#0xC7
   26FF DD 96 FF      [19]  295 	sub	a, -1 (ix)
   2702 32 07 38      [13]  296 	ld	(#(_user + 0x0007)),a
   2705                     297 00120$:
                            298 ;src/entities/user.c:74: if (cpct_isKeyPressed(Key_D)){
   2705 21 07 20      [10]  299 	ld	hl,#0x2007
   2708 E5            [11]  300 	push	hl
   2709 CD 0E 32      [17]  301 	call	_cpct_isKeyPressed
   270C F1            [10]  302 	pop	af
   270D 7D            [ 4]  303 	ld	a,l
   270E B7            [ 4]  304 	or	a, a
   270F 28 1B         [12]  305 	jr	Z,00122$
                            306 ;src/entities/user.c:75: shoot_type=(shoot_type+1)%2;
   2711 FD 21 12 38   [14]  307 	ld	iy,#_shoot_type
   2715 FD 6E 00      [19]  308 	ld	l,0 (iy)
   2718 26 00         [ 7]  309 	ld	h,#0x00
   271A 23            [ 6]  310 	inc	hl
   271B 01 02 00      [10]  311 	ld	bc,#0x0002
   271E C5            [11]  312 	push	bc
   271F E5            [11]  313 	push	hl
   2720 CD 57 35      [17]  314 	call	__modsint
   2723 F1            [10]  315 	pop	af
   2724 F1            [10]  316 	pop	af
   2725 FD 21 12 38   [14]  317 	ld	iy,#_shoot_type
   2729 FD 75 00      [19]  318 	ld	0 (iy),l
   272C                     319 00122$:
                            320 ;src/entities/user.c:78: if (cpct_isKeyPressed(Key_Space)){
   272C 21 05 80      [10]  321 	ld	hl,#0x8005
   272F E5            [11]  322 	push	hl
   2730 CD 0E 32      [17]  323 	call	_cpct_isKeyPressed
   2733 F1            [10]  324 	pop	af
   2734 7D            [ 4]  325 	ld	a,l
   2735 B7            [ 4]  326 	or	a, a
   2736 28 1B         [12]  327 	jr	Z,00125$
                            328 ;src/entities/user.c:79: create_shoot(user.x+3, user.y-1, shoot_type);
   2738 3A 07 38      [13]  329 	ld	a, (#_user + 7)
   273B 5F            [ 4]  330 	ld	e,a
   273C 1D            [ 4]  331 	dec	e
   273D 3A 06 38      [13]  332 	ld	a, (#_user + 6)
   2740 57            [ 4]  333 	ld	d,a
   2741 14            [ 4]  334 	inc	d
   2742 14            [ 4]  335 	inc	d
   2743 14            [ 4]  336 	inc	d
   2744 3A 12 38      [13]  337 	ld	a,(_shoot_type)
   2747 F5            [11]  338 	push	af
   2748 33            [ 6]  339 	inc	sp
   2749 7B            [ 4]  340 	ld	a,e
   274A F5            [11]  341 	push	af
   274B 33            [ 6]  342 	inc	sp
   274C D5            [11]  343 	push	de
   274D 33            [ 6]  344 	inc	sp
   274E CD 2C 23      [17]  345 	call	_create_shoot
   2751 F1            [10]  346 	pop	af
   2752 33            [ 6]  347 	inc	sp
   2753                     348 00125$:
   2753 33            [ 6]  349 	inc	sp
   2754 DD E1         [14]  350 	pop	ix
   2756 C9            [10]  351 	ret
                            352 ;src/entities/user.c:84: void draw_user(u8* screen){
                            353 ;	---------------------------------
                            354 ; Function draw_user
                            355 ; ---------------------------------
   2757                     356 _draw_user::
   2757 DD E5         [15]  357 	push	ix
   2759 DD 21 00 00   [14]  358 	ld	ix,#0
   275D DD 39         [15]  359 	add	ix,sp
                            360 ;src/entities/user.c:86: pscreen = cpct_getScreenPtr(screen, user.x, user.y);
   275F 21 07 38      [10]  361 	ld	hl, #_user + 7
   2762 4E            [ 7]  362 	ld	c,(hl)
   2763 21 06 38      [10]  363 	ld	hl, #_user + 6
   2766 66            [ 7]  364 	ld	h,(hl)
   2767 DD 5E 04      [19]  365 	ld	e,4 (ix)
   276A DD 56 05      [19]  366 	ld	d,5 (ix)
   276D 79            [ 4]  367 	ld	a,c
   276E F5            [11]  368 	push	af
   276F 33            [ 6]  369 	inc	sp
   2770 E5            [11]  370 	push	hl
   2771 33            [ 6]  371 	inc	sp
   2772 D5            [11]  372 	push	de
   2773 CD 63 35      [17]  373 	call	_cpct_getScreenPtr
   2776 F1            [10]  374 	pop	af
   2777 F1            [10]  375 	pop	af
   2778 EB            [ 4]  376 	ex	de,hl
                            377 ;src/entities/user.c:87: cpct_drawSprite( (u8*) user.sprite,pscreen,user.w,user.h);
   2779 21 09 38      [10]  378 	ld	hl, #_user + 9
   277C 4E            [ 7]  379 	ld	c,(hl)
   277D 21 08 38      [10]  380 	ld	hl, #_user + 8
   2780 46            [ 7]  381 	ld	b,(hl)
   2781 2A 04 38      [16]  382 	ld	hl, (#_user + 4)
   2784 E5            [11]  383 	push	hl
   2785 FD E1         [14]  384 	pop	iy
   2787 79            [ 4]  385 	ld	a,c
   2788 F5            [11]  386 	push	af
   2789 33            [ 6]  387 	inc	sp
   278A C5            [11]  388 	push	bc
   278B 33            [ 6]  389 	inc	sp
   278C D5            [11]  390 	push	de
   278D FD E5         [15]  391 	push	iy
   278F CD 34 33      [17]  392 	call	_cpct_drawSprite
   2792 21 06 00      [10]  393 	ld	hl,#6
   2795 39            [11]  394 	add	hl,sp
   2796 F9            [ 6]  395 	ld	sp,hl
   2797 DD E1         [14]  396 	pop	ix
   2799 C9            [10]  397 	ret
                            398 	.area _CODE
                            399 	.area _INITIALIZER
                            400 	.area _CABS (ABS)
