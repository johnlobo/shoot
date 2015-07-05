ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   3678                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   3678 32 A5 36      [13]   11 	LD (#inc_ancho+1),A
   367B 7D            [ 4]   12 	LD A,L
   367C CB 3F         [ 8]   13 	SRL A
   367E CB 3F         [ 8]   14 	SRL A
   3680 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   3682 57            [ 4]   17 	LD D,A						;D
   3683 CB 27         [ 8]   18 	SLA A
   3685 CB 27         [ 8]   19 	SLA A
   3687 CB 27         [ 8]   20 	SLA A
   3689 95            [ 4]   21 	SUB L
   368A ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   368C 5F            [ 4]   24 	LD E,A						;E
   368D 6A            [ 4]   25 	LD L,D
   368E 26 00         [ 7]   26 	LD H,#0
   3690 29            [11]   27 	ADD HL,HL
   3691 01 A8 36      [10]   28 	LD BC,#bloques
   3694 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   3695 4E            [ 7]   31 	LD C,(HL)
   3696 23            [ 6]   32 	INC HL
   3697 66            [ 7]   33 	LD H,(HL)
   3698 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   3699 E5            [11]   36 	PUSH HL
   369A 16 00         [ 7]   37 	LD D,#0
   369C 21 DA 36      [10]   38 	LD HL,#sub_bloques
   369F 19            [11]   39 	ADD HL,DE
   36A0 7E            [ 7]   40 	LD A,(HL)
   36A1 E1            [10]   41 	POP HL
   36A2 84            [ 4]   42 	ADD H
   36A3 67            [ 4]   43 	LD H,A
   36A4                      44 inc_ancho:
   36A4 1E 00         [ 7]   45 	LD E,#0
   36A6 19            [11]   46 	ADD HL,DE
   36A7 C9            [10]   47 	RET
                             48 
   36A8                      49 bloques:
   36A8 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
        F0 C0 40 C1 90 C1
        E0 C1 30 C2 80 C2
        D0 C2 20 C3 70 C3
        C0 C3 10 C4 60 C4
        B0 C4 00 C5 50 C5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



        A0 C5 F0 C5 40 C6
        90 C6 E0 C6 30 C7
        80 C7
   36DA                      51 sub_bloques:
   36DA 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
        30 38
                             53 
                             54 
                             55 
                             56 
                             57 ;*************************************
                             58 ; GRAPHIC TEXT
                             59 ;*************************************
                             60 
                             61 .globl _cpc_PrintGphStr2X
                             62 
   36E2                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   36E2 DD 21 02 00   [14]   65 	LD IX,#2
   36E6 DD 39         [15]   66 	ADD IX,SP
   36E8 DD 6E 02      [19]   67 	LD L,2 (IX)
   36EB DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   36EE DD 5E 00      [19]   69    	LD E,0 (IX)
   36F1 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   36F4 3E 01         [ 7]   71 	LD A,#1
   36F6 C3 3D 37      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   36F9                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   36F9 DD 21 02 00   [14]   80 	LD IX,#2
   36FD DD 39         [15]   81 	ADD IX,SP
   36FF DD 6E 03      [19]   82  	LD L,3 (IX)
   3702 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   3705 CD 78 36      [17]   84 	CALL cpc_GetScrAddress0
   3708 DD 5E 00      [19]   85    	LD E,0 (IX)
   370B DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   370E 3E 01         [ 7]   87 	LD A,#1
   3710 C3 3D 37      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   3713                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   3713 DD 21 02 00   [14]   94 	LD IX,#2
   3717 DD 39         [15]   95 	ADD IX,SP
   3719 DD 6E 03      [19]   96  	LD L,3 (IX)
   371C DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   371F CD 78 36      [17]   98 	CALL cpc_GetScrAddress0
   3722 DD 5E 00      [19]   99    	LD E,0 (IX)
   3725 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   3728 C3 3D 37      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   372B                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   372B DD 21 02 00   [14]  108 	LD IX,#2
   372F DD 39         [15]  109 	ADD IX,SP
   3731 DD 6E 02      [19]  110 	LD L,2 (IX)
   3734 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   3737 DD 5E 00      [19]  113    	LD E,0 (IX)
   373A DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   373D                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   373D 32 03 38      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   3740 3A 04 38      [13]  125 	LD A,(#imprimiendo)
   3743 FE 01         [ 7]  126 	CP #1
   3745 CA 62 37      [10]  127 	JP Z,add_elemento
   3748 22 05 38      [16]  128 	LD (#direcc_destino),HL
   374B EB            [ 4]  129 	EX DE,HL
   374C CD B8 37      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   374F                     133 bucle_cola_impresion:
   374F 3A A8 37      [13]  134 	LD A,(#elementos_cola)
   3752 B7            [ 4]  135 	OR A
   3753 CA 5C 37      [10]  136 	JP Z,terminar_impresion
   3756 CD 85 37      [17]  137 	CALL leer_elemento
   3759 C3 4F 37      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   375C                     141 terminar_impresion:
   375C AF            [ 4]  142 	XOR A
   375D 32 04 38      [13]  143 	LD (#imprimiendo),A
   3760 C9            [10]  144 	RET
   3761                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   3761 C9            [10]  147 	RET
   3762                     148 add_elemento:
   3762 F3            [ 4]  149 	DI
   3763 DD 2A AA 37   [20]  150 	LD IX,(#pos_cola)
   3767 DD 75 00      [19]  151 	LD 0 (IX),L
   376A DD 74 01      [19]  152 	LD 1 (IX),H
   376D DD 73 02      [19]  153 	LD 2 (IX),E
   3770 DD 72 03      [19]  154 	LD 3 (IX),D
   3773 DD 23         [10]  155 	INC IX
   3775 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   3777 DD 23         [10]  157 	INC IX
   3779 DD 23         [10]  158 	INC IX
   377B DD 22 AA 37   [20]  159 	LD (#pos_cola),IX
                            160 
   377F 21 A8 37      [10]  161 	LD HL,#elementos_cola
   3782 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   3783 FB            [ 4]  164 	EI
   3784 C9            [10]  165 	RET
   3785                     166 leer_elemento:
   3785 F3            [ 4]  167 	DI
   3786 DD 2A AA 37   [20]  168 	LD IX,(#pos_cola)
   378A DD 6E 00      [19]  169 	LD L,0 (IX)
   378D DD 66 01      [19]  170 	LD H,1 (IX)
   3790 DD 5E 02      [19]  171 	LD E,2 (IX)
   3793 DD 56 04      [19]  172 	LD D,4 (IX)
   3796 DD 2B         [10]  173 	DEC IX
   3798 DD 2B         [10]  174 	DEC IX
   379A DD 2B         [10]  175 	DEC IX
   379C DD 2B         [10]  176 	DEC IX
   379E DD 22 AA 37   [20]  177 	LD (#pos_cola),IX
   37A2 21 A8 37      [10]  178 	LD HL,#elementos_cola
   37A5 35            [11]  179 	DEC (HL)
   37A6 FB            [ 4]  180 	EI
   37A7 C9            [10]  181 	RET
                            182 
   37A8                     183 elementos_cola:
   37A8 00 00               184 	.DW #0				; defw 0
   37AA                     185 pos_cola:
   37AA AC 37               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   37AC                     188 cola_impresion:  		; defs 12
   37AC 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   37B8                     190 bucle_texto0:
   37B8 3E 01         [ 7]  191 	LD A,#1
   37BA 32 04 38      [13]  192 	LD (imprimiendo),A
                            193 
   37BD 3A 21 3A      [13]  194 	LD A,(first_char)
   37C0 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   37C1 7E            [ 7]  197 	LD A,(HL)
   37C2 B7            [ 4]  198 	OR A ;CP 0
   37C3 C8            [11]  199 	RET Z
   37C4 90            [ 4]  200 	SUB B
   37C5 01 22 3A      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   37C8 E5            [11]  202 	PUSH HL
                            203 
   37C9 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   37CA 26 00         [ 7]  205 	LD H,#0
   37CC 29            [11]  206 	ADD HL,HL
   37CD 29            [11]  207 	ADD HL,HL
   37CE 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   37CF 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   37D0 CD 3B 38      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   37D3 3A 03 38      [13]  211 	LD A,(doble)
   37D6 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   37D8 CC 22 38      [17]  214 	CALL Z, doblar_letra
   37DB 2A 05 38      [16]  215 	LD HL,(#direcc_destino)
   37DE 3A 03 38      [13]  216 	LD A,(doble)
   37E1 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   37E3 28 08         [12]  219 	JR Z,cont_doble
   37E5 11 F1 39      [10]  220 	LD DE,#letra_decodificada
   37E8 FD                  221 	.DB #0xfD
   37E9 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   37EB 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   37ED                     226 cont_doble:
   37ED 11 01 3A      [10]  227 	LD DE,#letra_decodificada_tmp
   37F0 FD                  228 	.DB #0xfD
   37F1 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   37F3                     231 cont_tot:
   37F3 CD 07 38      [17]  232 	CALL cpc_PutSp0
   37F6 2A 05 38      [16]  233 	LD HL,(#direcc_destino)
   37F9 23            [ 6]  234 	INC HL
   37FA 23            [ 6]  235 	INC HL
   37FB 22 05 38      [16]  236 	LD (#direcc_destino),HL
   37FE E1            [10]  237 	POP HL
   37FF 23            [ 6]  238 	INC HL
   3800 C3 B8 37      [10]  239 	JP bucle_texto0
                            240 
                            241 
   3803                     242 doble:
   3803 00                  243 	.DB #0
   3804                     244 imprimiendo:
   3804 00                  245 	.DB #0
   3805                     246 direcc_destino:
   3805 00 00               247 	.DW #0
                            248 
                            249 
   3807                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3807 06 07         [ 7]  253 	LD B,#7
   3809 48            [ 4]  254 	LD C,B
   380A                     255 loop_alto_2:
                            256 
   380A                     257 loop_ancho_2:
   380A EB            [ 4]  258 	EX DE,HL
   380B ED A0         [16]  259 	LDI
   380D ED A0         [16]  260 	LDI
   380F FD                  261 	.DB #0XFD
   3810 25            [ 4]  262 	DEC H
   3811 C8            [11]  263 	RET Z
   3812 EB            [ 4]  264 	EX DE,HL
   3813                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   3813 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   3815 09            [11]  267 	ADD HL,BC
   3816 D2 0A 38      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   3819 01 50 C0      [10]  269 	LD BC,#0XC050
   381C 09            [11]  270 	ADD HL,BC
   381D 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   381F C3 0A 38      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   3822                     277 doblar_letra:
   3822 21 F1 39      [10]  278 	LD HL,#letra_decodificada
   3825 11 01 3A      [10]  279 	LD DE,#letra_decodificada_tmp
   3828 06 08         [ 7]  280 	LD B,#8
   382A                     281 buc_doblar_letra:
   382A 7E            [ 7]  282 	LD A,(HL)
   382B 23            [ 6]  283 	INC HL
   382C 12            [ 7]  284 	LD (DE),A
   382D 13            [ 6]  285 	INC DE
   382E 13            [ 6]  286 	INC DE
   382F 12            [ 7]  287 	LD (DE),A
   3830 1B            [ 6]  288 	DEC DE
   3831 7E            [ 7]  289 	LD A,(HL)
   3832 23            [ 6]  290 	INC HL
   3833 12            [ 7]  291 	LD (DE),A
   3834 13            [ 6]  292 	INC DE
   3835 13            [ 6]  293 	INC DE
   3836 12            [ 7]  294 	LD (DE),A
   3837 13            [ 6]  295 	INC DE
   3838 10 F0         [13]  296 	DJNZ buc_doblar_letra
   383A C9            [10]  297 	RET
                            298 
                            299 
   383B                     300 escribe_letra:		; Code by Kevin Thacker
   383B D5            [11]  301 	PUSH DE
   383C FD 21 F1 39   [14]  302 	LD IY,#letra_decodificada
   3840 06 08         [ 7]  303 	LD B,#8
   3842                     304 bucle_alto_letra:
   3842 C5            [11]  305 	PUSH BC
   3843 E5            [11]  306 	PUSH HL
   3844 5E            [ 7]  307 	LD E,(HL)
   3845 CD 5C 38      [17]  308 	CALL op_colores
   3848 FD 72 00      [19]  309 	LD (IY),D
   384B FD 23         [10]  310 	INC IY
   384D CD 5C 38      [17]  311 	CALL op_colores
   3850 FD 72 00      [19]  312 	LD (IY),D
   3853 FD 23         [10]  313 	INC IY
   3855 E1            [10]  314 	POP HL
   3856 23            [ 6]  315 	INC HL
   3857 C1            [10]  316 	POP BC
   3858 10 E8         [13]  317 	DJNZ bucle_alto_letra
   385A D1            [10]  318 	POP DE
   385B C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   385C                     321 op_colores:
   385C 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   385E CD 69 38      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   3861 CB 02         [ 8]  324 	RLC D
   3863 CD 69 38      [17]  325 	CALL op_colores_pixel
   3866 CB 0A         [ 8]  326 	RRC D
   3868 C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   3869                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   3869 CB 03         [ 8]  333 	RLC E
   386B CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   386D 7B            [ 4]  336 	LD A,E
   386E E6 03         [ 7]  337 	AND #0X3
   3870 21 ED 39      [10]  338 	LD HL,#colores_b0
   3873 85            [ 4]  339 	ADD A,L
   3874 6F            [ 4]  340 	LD L,A
   3875 7C            [ 4]  341 	LD A,H
   3876 CE 00         [ 7]  342 	ADC A,#0
   3878 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   3879 7A            [ 4]  345 	LD A,D
   387A B6            [ 7]  346 	OR (HL)
   387B 57            [ 4]  347 	LD D,A
   387C C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   387D                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   387D DD 21 02 00   [14]  355 	LD IX,#2
   3881 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   3883 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   3886 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   3889 21 ED 39      [10]  363 	LD HL,#colores_b0
   388C 06 00         [ 7]  364 	LD B,#0
   388E 09            [11]  365 	ADD HL,BC
   388F 77            [ 7]  366 	LD (HL),A
   3890 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   3891                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   3891 DD 21 02 00   [14]  377 	LD IX,#2
   3895 DD 39         [15]  378 	ADD IX,SP
   3897 DD 6E 03      [19]  379  	LD L,3 (IX)
   389A DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   389D CD 78 36      [17]  381 	CALL cpc_GetScrAddress0
   38A0 DD 5E 00      [19]  382    	LD E,0 (IX)
   38A3 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   38A6 AF            [ 4]  384 	XOR A
   38A7 C3 EE 38      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   38AA                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   38AA DD 21 02 00   [14]  392 	LD IX,#2
   38AE DD 39         [15]  393 	ADD IX,SP
   38B0 DD 6E 03      [19]  394  	LD L,3 (IX)
   38B3 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   38B6 CD 78 36      [17]  396 	CALL cpc_GetScrAddress0
   38B9 DD 5E 00      [19]  397    	LD E,0 (IX)
   38BC DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   38BF 3E 01         [ 7]  399 	LD A,#1
   38C1 C3 EE 38      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   38C4                     407 _cpc_PrintGphStrM12X::
   38C4 DD 21 02 00   [14]  408 	LD IX,#2
   38C8 DD 39         [15]  409 	ADD IX,SP
   38CA DD 6E 02      [19]  410 	LD L,2 (IX)
   38CD DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   38D0 DD 5E 00      [19]  412    	LD E,0 (IX)
   38D3 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   38D6 3E 01         [ 7]  414 	LD A,#1
                            415 
   38D8 C3 EE 38      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   38DB                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   38DB DD 21 02 00   [14]  425 	LD IX,#2
   38DF DD 39         [15]  426 	ADD IX,SP
   38E1 DD 6E 02      [19]  427 	LD L,2 (IX)
   38E4 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   38E7 DD 5E 00      [19]  429    	LD E,0 (IX)
   38EA DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   38ED AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   38EE                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   38EE 32 57 39      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   38F1 3A 04 38      [13]  442 	LD A,(#imprimiendo)
   38F4 FE 01         [ 7]  443 	CP #1
   38F6 CA 62 37      [10]  444 	JP Z,add_elemento
   38F9 22 05 38      [16]  445 	LD (#direcc_destino),HL
   38FC EB            [ 4]  446 	EX DE,HL
   38FD CD 0D 39      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   3900                     449 bucle_cola_impresionM1:
   3900 3A A8 37      [13]  450 	LD A,(#elementos_cola)
   3903 B7            [ 4]  451 	OR A
   3904 CA 5C 37      [10]  452 	JP Z,terminar_impresion
   3907 CD 85 37      [17]  453 	CALL leer_elemento
   390A C3 00 39      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   390D                     460 bucle_texto0M1:
   390D 3E 01         [ 7]  461 	LD A,#1
   390F 32 04 38      [13]  462 	LD (#imprimiendo),A
                            463 
   3912 3A 21 3A      [13]  464 	LD A,(#first_char)
   3915 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   3916 7E            [ 7]  466 	LD A,(HL)
   3917 B7            [ 4]  467 	OR A ;CP 0
   3918 C8            [11]  468 	RET Z
   3919 90            [ 4]  469 	SUB B
   391A 01 22 3A      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   391D E5            [11]  471 	PUSH HL
   391E 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   391F 26 00         [ 7]  473 	LD H,#0
   3921 29            [11]  474 	ADD HL,HL
   3922 29            [11]  475 	ADD HL,HL
   3923 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3924 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3925 CD 82 39      [17]  478 	CALL escribe_letraM1
   3928 3A 57 39      [13]  479 	LD A,(dobleM1)
   392B FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   392D CC 58 39      [17]  482 	CALL Z, doblar_letraM1
   3930 2A 05 38      [16]  483 	LD HL,(direcc_destino)
   3933 3A 57 39      [13]  484 	LD A,(dobleM1)
   3936 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   3938 28 08         [12]  487 	JR Z,cont_dobleM1
   393A 11 F1 39      [10]  488 	LD DE,#letra_decodificada
   393D FD                  489 	.DB #0xfD
   393E 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3940 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   3942                     494 cont_dobleM1:
   3942 11 01 3A      [10]  495 	LD DE,#letra_decodificada_tmp
   3945 FD                  496 	.DB #0XFD
   3946 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3948                     498 cont_totM1:
   3948 CD 69 39      [17]  499 	CALL cpc_PutSp0M1
   394B 2A 05 38      [16]  500 	LD HL,(#direcc_destino)
   394E 23            [ 6]  501 	INC HL
   394F 22 05 38      [16]  502 	LD (#direcc_destino),HL
   3952 E1            [10]  503 	POP HL
   3953 23            [ 6]  504 	INC HL
   3954 C3 0D 39      [10]  505 	JP bucle_texto0M1
                            506 
   3957                     507 dobleM1:
   3957 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   3958                     512 doblar_letraM1:
   3958 21 F1 39      [10]  513 	LD HL,#letra_decodificada
   395B 11 01 3A      [10]  514 	LD DE,#letra_decodificada_tmp
   395E 06 08         [ 7]  515 	LD B,#8
   3960                     516 buc_doblar_letraM1:
   3960 7E            [ 7]  517 	LD A,(HL)
   3961 23            [ 6]  518 	INC HL
   3962 12            [ 7]  519 	LD (DE),A
   3963 13            [ 6]  520 	INC DE
   3964 12            [ 7]  521 	LD (DE),A
   3965 13            [ 6]  522 	INC DE
   3966 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   3968 C9            [10]  524 	RET
                            525 
                            526 
   3969                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3969 06 07         [ 7]  530 	LD B,#7
   396B 48            [ 4]  531 	LD C,B
   396C                     532 loop_alto_2M1:
   396C                     533 loop_ancho_2M1:
   396C EB            [ 4]  534 	EX DE,HL
   396D ED A0         [16]  535 	LDI
   396F FD                  536 	.DB #0XFD
   3970 25            [ 4]  537 	DEC H
   3971 C8            [11]  538 	RET Z
   3972 EB            [ 4]  539 	EX DE,HL
   3973                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   3973 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   3975 09            [11]  542 	ADD HL,BC
   3976 D2 6C 39      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   3979 01 50 C0      [10]  544 	LD BC,#0XC050
   397C 09            [11]  545 	ADD HL,BC
   397D 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   397F C3 6C 39      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   3982                     551 escribe_letraM1:
   3982 FD 21 F1 39   [14]  552 	LD IY,#letra_decodificada
   3986 06 08         [ 7]  553 	LD B,#8
   3988 DD 21 EA 39   [14]  554 	LD IX,#byte_tmp
   398C                     555 bucle_altoM1:
   398C C5            [11]  556 	PUSH BC
   398D E5            [11]  557 	PUSH HL
                            558 
   398E 7E            [ 7]  559 	LD A,(HL)
   398F 21 E9 39      [10]  560 	LD HL,#dato
   3992 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   3993 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   3997 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   3999                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   3999 E5            [11]  570 	PUSH HL
   399A CD B2 39      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   399D E1            [10]  572 	POP HL
   399E CB 3E         [15]  573 	SRL (HL)
   39A0 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   39A2 10 F5         [13]  575 	DJNZ bucle_coloresM1
   39A4 DD 7E 00      [19]  576 	LD A,(IX)
   39A7 FD 77 00      [19]  577 	LD (IY),A
   39AA FD 23         [10]  578 	INC IY
   39AC E1            [10]  579 	POP HL
   39AD 23            [ 6]  580 	INC HL
   39AE C1            [10]  581 	POP BC
   39AF 10 DB         [13]  582 	DJNZ bucle_altoM1
   39B1 C9            [10]  583 	RET
                            584 
                            585 
                            586 ;.rutina
                            587 ;HL tiene la dirección origen de los datos de la letra
                            588 
                            589 ;Se analiza el byte por parejas de bits para saber el color de cada pixel.
                            590 ;ld ix,byte_tmp
                            591 ;ld (ix+0),0
                            592 
                            593 ;LD B,4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
                            594 ;.bucle_colores
                            595 ;roto el byte en (HL)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                            596 ;push hl
                            597 ;call op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
                            598 ;pop hl
                            599 ;sla (HL)
                            600 ;sla (HL)	;voy rotando el byte para mirar los bits por pares.
                            601 
                            602 ;djnz bucle_colores
                            603 
                            604 ;ret
   39B2                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   39B2 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   39B4 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   39B5 21 E5 39      [10]  610 	LD HL,#colores_m1
   39B8 5F            [ 4]  611 	LD E,A
   39B9 16 00         [ 7]  612 	LD D,#0
   39BB 19            [11]  613 	ADD HL,DE
   39BC 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   39BD 78            [ 4]  618 	LD A,B
   39BE 3D            [ 4]  619 	DEC A
   39BF B7            [ 4]  620 	OR A ;CP 0
   39C0 CA C9 39      [10]  621 	JP Z,_sin_rotar
   39C3                     622 rotando:
   39C3 CB 39         [ 8]  623 	SRL C
   39C5 3D            [ 4]  624 	DEC A
   39C6 C2 C3 39      [10]  625 	JP NZ, rotando
   39C9                     626 _sin_rotar:
   39C9 79            [ 4]  627 	LD A,C
   39CA DD B6 00      [19]  628 	OR (IX)
   39CD DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   39D0 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   39D1                     636 _cpc_SetInkGphStrM1::
   39D1 DD 21 02 00   [14]  637 	LD IX,#2
   39D5 DD 39         [15]  638 	ADD IX,SP
   39D7 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   39DA DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   39DD 21 E5 39      [10]  641 	LD HL,#colores_cambM1
   39E0 06 00         [ 7]  642 	LD B,#0
   39E2 09            [11]  643 	ADD HL,BC
   39E3 77            [ 7]  644 	LD (HL),A
   39E4 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   39E5                     649 colores_cambM1:
   39E5                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   39E5 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
                            652 
                            653 ;defb @00000000,  @01010100, @00010000, @00000101  ;@00000001, @00000101, @00010101, @00000000
                            654 
                            655 
                            656 
                            657 ;DEFC direcc_destino0_m1 = direcc_destino
                            658 ;DEFC colores_cambM1 = colores_m1
                            659 
                            660 
                            661 
                            662 
   39E9                     663 dato:
   39E9 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   39EA                     666 byte_tmp:
   39EA 00                  667 	.DB #0
   39EB 00                  668 	.DB #0
   39EC 00                  669 	.DB #0  ;defs 3
   39ED                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   39ED 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   39F1                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   39F1 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   39F9 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3A01                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   3A01 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3A09 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3A11 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3A19 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   3A21                     685 first_char:
   3A21 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   3A22                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   3A22 01                  690 	.DB #0b00000001
   3A23 01                  691 	.DB #0b00000001
   3A24 08                  692 	.DB #0b00001000
   3A25 08                  693 	.DB #0b00001000
   3A26 3C                  694 	.DB #0b00111100
   3A27 30                  695 	.DB #0b00110000
   3A28 30                  696 	.DB #0b00110000
   3A29 00                  697 	.DB #0b00000000
                            698 ;0-9
   3A2A 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   3A2B 44                  700 .db #0b01000100
   3A2C 88                  701 .db #0b10001000
   3A2D 88                  702 .db #0b10001000
   3A2E 88                  703 .db #0b10001000
   3A2F CC                  704 .db #0b11001100
   3A30 FC                  705 .db #0b11111100
   3A31 00                  706 .db #0b00000000
   3A32 10                  707 .db #0b00010000
   3A33 50                  708 .db #0b01010000
   3A34 20                  709 .db #0b00100000
   3A35 20                  710 .db #0b00100000
   3A36 20                  711 .db #0b00100000
   3A37 30                  712 .db #0b00110000
   3A38 FC                  713 .db #0b11111100
   3A39 00                  714 .db #0b00000000
   3A3A 54                  715 .db #0b01010100
   3A3B 44                  716 .db #0b01000100
   3A3C 08                  717 .db #0b00001000
   3A3D A8                  718 .db #0b10101000
   3A3E 80                  719 .db #0b10000000
   3A3F CC                  720 .db #0b11001100
   3A40 FC                  721 .db #0b11111100
   3A41 00                  722 .db #0b00000000
   3A42 54                  723 .db #0b01010100
   3A43 44                  724 .db #0b01000100
   3A44 08                  725 .db #0b00001000
   3A45 28                  726 .db #0b00101000
   3A46 08                  727 .db #0b00001000
   3A47 CC                  728 .db #0b11001100
   3A48 FC                  729 .db #0b11111100
   3A49 00                  730 .db #0b00000000
   3A4A 44                  731 .db #0b01000100
   3A4B 44                  732 .db #0b01000100
   3A4C 88                  733 .db #0b10001000
   3A4D A8                  734 .db #0b10101000
   3A4E 08                  735 .db #0b00001000
   3A4F 0C                  736 .db #0b00001100
   3A50 0C                  737 .db #0b00001100
   3A51 00                  738 .db #0b00000000
   3A52 54                  739 .db #0b01010100
   3A53 44                  740 .db #0b01000100
   3A54 80                  741 .db #0b10000000
   3A55 A8                  742 .db #0b10101000
   3A56 08                  743 .db #0b00001000
   3A57 CC                  744 .db #0b11001100
   3A58 FC                  745 .db #0b11111100
   3A59 00                  746 .db #0b00000000
   3A5A 54                  747 .db #0b01010100
   3A5B 44                  748 .db #0b01000100
   3A5C 80                  749 .db #0b10000000
   3A5D A8                  750 .db #0b10101000
   3A5E 88                  751 .db #0b10001000
   3A5F CC                  752 .db #0b11001100
   3A60 FC                  753 .db #0b11111100
   3A61 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   3A62 54                  755 .db #0b01010100
   3A63 44                  756 .db #0b01000100
   3A64 08                  757 .db #0b00001000
   3A65 08                  758 .db #0b00001000
   3A66 20                  759 .db #0b00100000
   3A67 30                  760 .db #0b00110000
   3A68 30                  761 .db #0b00110000
   3A69 00                  762 .db #0b00000000
   3A6A 54                  763 .db #0b01010100
   3A6B 44                  764 .db #0b01000100
   3A6C 88                  765 .db #0b10001000
   3A6D A8                  766 .db #0b10101000
   3A6E 88                  767 .db #0b10001000
   3A6F CC                  768 .db #0b11001100
   3A70 FC                  769 .db #0b11111100
   3A71 00                  770 .db #0b00000000
   3A72 54                  771 .db #0b01010100
   3A73 44                  772 .db #0b01000100
   3A74 88                  773 .db #0b10001000
   3A75 A8                  774 .db #0b10101000
   3A76 08                  775 .db #0b00001000
   3A77 CC                  776 .db #0b11001100
   3A78 FC                  777 .db #0b11111100
   3A79 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   3A7A 00                  786 	.DB #0b00000000
   3A7B 00                  787 	.DB #0b00000000
   3A7C 20                  788 	.DB #0b00100000
   3A7D 00                  789 	.DB #0b00000000
   3A7E 30                  790 	.DB #0b00110000
   3A7F 00                  791 	.DB #0b00000000
   3A80 00                  792 	.DB #0b00000000
   3A81 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   3A82 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   3A8A 00                  797 	.DB #0b00000000
   3A8B 00                  798 	.DB #0b00000000
   3A8C 00                  799 	.DB #0b00000000
   3A8D 00                  800 	.DB #0b00000000
   3A8E 00                  801 	.DB #0b00000000
   3A8F 00                  802 	.DB #0b00000000
   3A90 C0                  803 	.DB #0b11000000
   3A91 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   3A92 00                  806 .db #0b00000000
   3A93 54                  807 .db #0b01010100
   3A94 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   3A95 A0                  809 .db #0b10100000
   3A96 88                  810 .db #0b10001000
   3A97 CC                  811 .db #0b11001100
   3A98 CC                  812 .db #0b11001100
   3A99 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   3A9A 00                  816 	.DB #0b00000000
   3A9B 10                  817 	.DB #0b00010000
   3A9C 20                  818 	.DB #0b00100000
   3A9D 20                  819 	.DB #0b00100000
   3A9E 30                  820 	.DB #0b00110000
   3A9F 00                  821 	.DB #0b00000000
   3AA0 30                  822 	.DB #0b00110000
   3AA1 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   3AA2 00                  825 	.DB #0b00000000
   3AA3 00                  826 	.DB #0b00000000
   3AA4 80                  827 	.DB #0b10000000
   3AA5 A0                  828 	.DB #0b10100000
   3AA6 FC                  829 	.DB #0b11111100
   3AA7 FC                  830 	.DB #0b11111100
   3AA8 00                  831 	.DB #0b00000000
   3AA9 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   3AAA 00                  834 	.DB #0b00000000
   3AAB 00                  835 	.DB #0b00000000
   3AAC 00                  836 	.DB #0b00000000
   3AAD A8                  837 	.DB #0b10101000
   3AAE FC                  838 	.DB #0b11111100
   3AAF 00                  839 	.DB #0b00000000
   3AB0 00                  840 	.DB #0b00000000
   3AB1 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   3AB2 00                  846 .db #0b00000000
   3AB3 54                  847 .db #0b01010100
   3AB4 88                  848 .db #0b10001000
   3AB5 88                  849 .db #0b10001000
   3AB6 A8                  850 .db #0b10101000
   3AB7 CC                  851 .db #0b11001100
   3AB8 CC                  852 .db #0b11001100
   3AB9 00                  853 .db #0b00000000
   3ABA 00                  854 .db #0b00000000
   3ABB 54                  855 .db #0b01010100
   3ABC 88                  856 .db #0b10001000
   3ABD A8                  857 .db #0b10101000
   3ABE 88                  858 .db #0b10001000
   3ABF CC                  859 .db #0b11001100
   3AC0 FC                  860 .db #0b11111100
   3AC1 00                  861 .db #0b00000000
   3AC2 00                  862 .db #0b00000000
   3AC3 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   3AC4 88                  864 .db #0b10001000
   3AC5 80                  865 .db #0b10000000
   3AC6 88                  866 .db #0b10001000
   3AC7 CC                  867 .db #0b11001100
   3AC8 FC                  868 .db #0b11111100
   3AC9 00                  869 .db #0b00000000
   3ACA 00                  870 .db #0b00000000
   3ACB 54                  871 .db #0b01010100
   3ACC 88                  872 .db #0b10001000
   3ACD 88                  873 .db #0b10001000
   3ACE 88                  874 .db #0b10001000
   3ACF CC                  875 .db #0b11001100
   3AD0 F0                  876 .db #0b11110000
   3AD1 00                  877 .db #0b00000000
   3AD2 00                  878 .db #0b00000000
   3AD3 54                  879 .db #0b01010100
   3AD4 80                  880 .db #0b10000000
   3AD5 A8                  881 .db #0b10101000
   3AD6 80                  882 .db #0b10000000
   3AD7 CC                  883 .db #0b11001100
   3AD8 FC                  884 .db #0b11111100
   3AD9 00                  885 .db #0b00000000
   3ADA 00                  886 .db #0b00000000
   3ADB 54                  887 .db #0b01010100
   3ADC 80                  888 .db #0b10000000
   3ADD A8                  889 .db #0b10101000
   3ADE 80                  890 .db #0b10000000
   3ADF C0                  891 .db #0b11000000
   3AE0 C0                  892 .db #0b11000000
   3AE1 00                  893 .db #0b00000000
   3AE2 00                  894 .db #0b00000000
   3AE3 54                  895 .db #0b01010100
   3AE4 88                  896 .db #0b10001000
   3AE5 80                  897 .db #0b10000000
   3AE6 A8                  898 .db #0b10101000
   3AE7 CC                  899 .db #0b11001100
   3AE8 FC                  900 .db #0b11111100
   3AE9 00                  901 .db #0b00000000
   3AEA 00                  902 .db #0b00000000
   3AEB 44                  903 .db #0b01000100
   3AEC 88                  904 .db #0b10001000
   3AED 88                  905 .db #0b10001000
   3AEE A8                  906 .db #0b10101000
   3AEF CC                  907 .db #0b11001100
   3AF0 CC                  908 .db #0b11001100
   3AF1 00                  909 .db #0b00000000
   3AF2 00                  910 .db #0b00000000
   3AF3 54                  911 .db #0b01010100
   3AF4 20                  912 .db #0b00100000
   3AF5 20                  913 .db #0b00100000
   3AF6 20                  914 .db #0b00100000
   3AF7 30                  915 .db #0b00110000
   3AF8 FC                  916 .db #0b11111100
   3AF9 00                  917 .db #0b00000000
   3AFA 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   3AFB 54                  919 .db #0b01010100
   3AFC A8                  920 .db #0b10101000
   3AFD 08                  921 .db #0b00001000
   3AFE 08                  922 .db #0b00001000
   3AFF CC                  923 .db #0b11001100
   3B00 FC                  924 .db #0b11111100
   3B01 00                  925 .db #0b00000000
   3B02 00                  926 .db #0b00000000
   3B03 44                  927 .db #0b01000100
   3B04 88                  928 .db #0b10001000
   3B05 A0                  929 .db #0b10100000
   3B06 88                  930 .db #0b10001000
   3B07 CC                  931 .db #0b11001100
   3B08 CC                  932 .db #0b11001100
   3B09 00                  933 .db #0b00000000
   3B0A 00                  934 .db #0b00000000
   3B0B 40                  935 .db #0b01000000
   3B0C 80                  936 .db #0b10000000
   3B0D 80                  937 .db #0b10000000
   3B0E 80                  938 .db #0b10000000
   3B0F CC                  939 .db #0b11001100
   3B10 FC                  940 .db #0b11111100
   3B11 00                  941 .db #0b00000000
   3B12 00                  942 .db #0b00000000
   3B13 54                  943 .db #0b01010100
   3B14 A8                  944 .db #0b10101000
   3B15 88                  945 .db #0b10001000
   3B16 88                  946 .db #0b10001000
   3B17 CC                  947 .db #0b11001100
   3B18 CC                  948 .db #0b11001100
   3B19 00                  949 .db #0b00000000
   3B1A 00                  950 .db #0b00000000
   3B1B 50                  951 .db #0b01010000
   3B1C 88                  952 .db #0b10001000
   3B1D 88                  953 .db #0b10001000
   3B1E 88                  954 .db #0b10001000
   3B1F CC                  955 .db #0b11001100
   3B20 CC                  956 .db #0b11001100
   3B21 00                  957 .db #0b00000000
   3B22 00                  958 .db #0b00000000
   3B23 54                  959 .db #0b01010100
   3B24 88                  960 .db #0b10001000
   3B25 88                  961 .db #0b10001000
   3B26 88                  962 .db #0b10001000
   3B27 CC                  963 .db #0b11001100
   3B28 FC                  964 .db #0b11111100
   3B29 00                  965 .db #0b00000000
   3B2A 00                  966 .db #0b00000000
   3B2B 54                  967 .db #0b01010100
   3B2C 88                  968 .db #0b10001000
   3B2D 88                  969 .db #0b10001000
   3B2E A8                  970 .db #0b10101000
   3B2F C0                  971 .db #0b11000000
   3B30 C0                  972 .db #0b11000000
   3B31 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   3B32 00                  974 .db #0b00000000
   3B33 54                  975 .db #0b01010100
   3B34 88                  976 .db #0b10001000
   3B35 88                  977 .db #0b10001000
   3B36 88                  978 .db #0b10001000
   3B37 FC                  979 .db #0b11111100
   3B38 FC                  980 .db #0b11111100
   3B39 00                  981 .db #0b00000000
   3B3A 00                  982 .db #0b00000000
   3B3B 54                  983 .db #0b01010100
   3B3C 88                  984 .db #0b10001000
   3B3D 88                  985 .db #0b10001000
   3B3E A0                  986 .db #0b10100000
   3B3F CC                  987 .db #0b11001100
   3B40 CC                  988 .db #0b11001100
   3B41 00                  989 .db #0b00000000
   3B42 00                  990 .db #0b00000000
   3B43 54                  991 .db #0b01010100
   3B44 80                  992 .db #0b10000000
   3B45 A8                  993 .db #0b10101000
   3B46 08                  994 .db #0b00001000
   3B47 CC                  995 .db #0b11001100
   3B48 FC                  996 .db #0b11111100
   3B49 00                  997 .db #0b00000000
   3B4A 00                  998 .db #0b00000000
   3B4B 54                  999 .db #0b01010100
   3B4C 20                 1000 .db #0b00100000
   3B4D 20                 1001 .db #0b00100000
   3B4E 20                 1002 .db #0b00100000
   3B4F 30                 1003 .db #0b00110000
   3B50 30                 1004 .db #0b00110000
   3B51 00                 1005 .db #0b00000000
   3B52 00                 1006 .db #0b00000000
   3B53 44                 1007 .db #0b01000100
   3B54 88                 1008 .db #0b10001000
   3B55 88                 1009 .db #0b10001000
   3B56 88                 1010 .db #0b10001000
   3B57 CC                 1011 .db #0b11001100
   3B58 FC                 1012 .db #0b11111100
   3B59 00                 1013 .db #0b00000000
   3B5A 00                 1014 .db #0b00000000
   3B5B 44                 1015 .db #0b01000100
   3B5C 88                 1016 .db #0b10001000
   3B5D 88                 1017 .db #0b10001000
   3B5E 88                 1018 .db #0b10001000
   3B5F CC                 1019 .db #0b11001100
   3B60 30                 1020 .db #0b00110000
   3B61 00                 1021 .db #0b00000000
   3B62 00                 1022 .db #0b00000000
   3B63 44                 1023 .db #0b01000100
   3B64 88                 1024 .db #0b10001000
   3B65 88                 1025 .db #0b10001000
   3B66 88                 1026 .db #0b10001000
   3B67 FC                 1027 .db #0b11111100
   3B68 CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   3B69 00                 1029 .db #0b00000000
   3B6A 00                 1030 .db #0b00000000
   3B6B 44                 1031 .db #0b01000100
   3B6C 88                 1032 .db #0b10001000
   3B6D A0                 1033 .db #0b10100000
   3B6E 20                 1034 .db #0b00100000
   3B6F CC                 1035 .db #0b11001100
   3B70 CC                 1036 .db #0b11001100
   3B71 00                 1037 .db #0b00000000
   3B72 00                 1038 .db #0b00000000
   3B73 44                 1039 .db #0b01000100
   3B74 88                 1040 .db #0b10001000
   3B75 88                 1041 .db #0b10001000
   3B76 20                 1042 .db #0b00100000
   3B77 30                 1043 .db #0b00110000
   3B78 30                 1044 .db #0b00110000
   3B79 00                 1045 .db #0b00000000
   3B7A 00                 1046 .db #0b00000000
   3B7B 54                 1047 .db #0b01010100
   3B7C 08                 1048 .db #0b00001000
   3B7D 20                 1049 .db #0b00100000
   3B7E 80                 1050 .db #0b10000000
   3B7F CC                 1051 .db #0b11001100
   3B80 FC                 1052 .db #0b11111100
   3B81 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   3B82 03                 1059 	.DB #0b00000011
   3B83 0F                 1060 	.DB #0b00001111
   3B84 3F                 1061 	.DB #0b00111111
   3B85 FF                 1062 	.DB #0b11111111
   3B86 3F                 1063 	.DB #0b00111111
   3B87 0F                 1064 	.DB #0b00001111
   3B88 03                 1065 	.DB #0b00000011
   3B89 00                 1066 	.DB #0b00000000
