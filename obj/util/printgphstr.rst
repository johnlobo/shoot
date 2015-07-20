ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   44A9                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   44A9 32 D6 44      [13]   11 	LD (#inc_ancho+1),A
   44AC 7D            [ 4]   12 	LD A,L
   44AD CB 3F         [ 8]   13 	SRL A
   44AF CB 3F         [ 8]   14 	SRL A
   44B1 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   44B3 57            [ 4]   17 	LD D,A						;D
   44B4 CB 27         [ 8]   18 	SLA A
   44B6 CB 27         [ 8]   19 	SLA A
   44B8 CB 27         [ 8]   20 	SLA A
   44BA 95            [ 4]   21 	SUB L
   44BB ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   44BD 5F            [ 4]   24 	LD E,A						;E
   44BE 6A            [ 4]   25 	LD L,D
   44BF 26 00         [ 7]   26 	LD H,#0
   44C1 29            [11]   27 	ADD HL,HL
   44C2 01 D9 44      [10]   28 	LD BC,#bloques
   44C5 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   44C6 4E            [ 7]   31 	LD C,(HL)
   44C7 23            [ 6]   32 	INC HL
   44C8 66            [ 7]   33 	LD H,(HL)
   44C9 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   44CA E5            [11]   36 	PUSH HL
   44CB 16 00         [ 7]   37 	LD D,#0
   44CD 21 0B 45      [10]   38 	LD HL,#sub_bloques
   44D0 19            [11]   39 	ADD HL,DE
   44D1 7E            [ 7]   40 	LD A,(HL)
   44D2 E1            [10]   41 	POP HL
   44D3 84            [ 4]   42 	ADD H
   44D4 67            [ 4]   43 	LD H,A
   44D5                      44 inc_ancho:
   44D5 1E 00         [ 7]   45 	LD E,#0
   44D7 19            [11]   46 	ADD HL,DE
   44D8 C9            [10]   47 	RET
                             48 
   44D9                      49 bloques:
   44D9 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   450B                      51 sub_bloques:
   450B 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   4513                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   4513 DD 21 02 00   [14]   65 	LD IX,#2
   4517 DD 39         [15]   66 	ADD IX,SP
   4519 DD 6E 02      [19]   67 	LD L,2 (IX)
   451C DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   451F DD 5E 00      [19]   69    	LD E,0 (IX)
   4522 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   4525 3E 01         [ 7]   71 	LD A,#1
   4527 C3 6E 45      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   452A                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   452A DD 21 02 00   [14]   80 	LD IX,#2
   452E DD 39         [15]   81 	ADD IX,SP
   4530 DD 6E 03      [19]   82  	LD L,3 (IX)
   4533 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   4536 CD A9 44      [17]   84 	CALL cpc_GetScrAddress0
   4539 DD 5E 00      [19]   85    	LD E,0 (IX)
   453C DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   453F 3E 01         [ 7]   87 	LD A,#1
   4541 C3 6E 45      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   4544                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   4544 DD 21 02 00   [14]   94 	LD IX,#2
   4548 DD 39         [15]   95 	ADD IX,SP
   454A DD 6E 03      [19]   96  	LD L,3 (IX)
   454D DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   4550 CD A9 44      [17]   98 	CALL cpc_GetScrAddress0
   4553 DD 5E 00      [19]   99    	LD E,0 (IX)
   4556 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   4559 C3 6E 45      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   455C                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   455C DD 21 02 00   [14]  108 	LD IX,#2
   4560 DD 39         [15]  109 	ADD IX,SP
   4562 DD 6E 02      [19]  110 	LD L,2 (IX)
   4565 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   4568 DD 5E 00      [19]  113    	LD E,0 (IX)
   456B DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   456E                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   456E 32 34 46      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   4571 3A 35 46      [13]  125 	LD A,(#imprimiendo)
   4574 FE 01         [ 7]  126 	CP #1
   4576 CA 93 45      [10]  127 	JP Z,add_elemento
   4579 22 36 46      [16]  128 	LD (#direcc_destino),HL
   457C EB            [ 4]  129 	EX DE,HL
   457D CD E9 45      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   4580                     133 bucle_cola_impresion:
   4580 3A D9 45      [13]  134 	LD A,(#elementos_cola)
   4583 B7            [ 4]  135 	OR A
   4584 CA 8D 45      [10]  136 	JP Z,terminar_impresion
   4587 CD B6 45      [17]  137 	CALL leer_elemento
   458A C3 80 45      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   458D                     141 terminar_impresion:
   458D AF            [ 4]  142 	XOR A
   458E 32 35 46      [13]  143 	LD (#imprimiendo),A
   4591 C9            [10]  144 	RET
   4592                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   4592 C9            [10]  147 	RET
   4593                     148 add_elemento:
   4593 F3            [ 4]  149 	DI
   4594 DD 2A DB 45   [20]  150 	LD IX,(#pos_cola)
   4598 DD 75 00      [19]  151 	LD 0 (IX),L
   459B DD 74 01      [19]  152 	LD 1 (IX),H
   459E DD 73 02      [19]  153 	LD 2 (IX),E
   45A1 DD 72 03      [19]  154 	LD 3 (IX),D
   45A4 DD 23         [10]  155 	INC IX
   45A6 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   45A8 DD 23         [10]  157 	INC IX
   45AA DD 23         [10]  158 	INC IX
   45AC DD 22 DB 45   [20]  159 	LD (#pos_cola),IX
                            160 
   45B0 21 D9 45      [10]  161 	LD HL,#elementos_cola
   45B3 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   45B4 FB            [ 4]  164 	EI
   45B5 C9            [10]  165 	RET
   45B6                     166 leer_elemento:
   45B6 F3            [ 4]  167 	DI
   45B7 DD 2A DB 45   [20]  168 	LD IX,(#pos_cola)
   45BB DD 6E 00      [19]  169 	LD L,0 (IX)
   45BE DD 66 01      [19]  170 	LD H,1 (IX)
   45C1 DD 5E 02      [19]  171 	LD E,2 (IX)
   45C4 DD 56 04      [19]  172 	LD D,4 (IX)
   45C7 DD 2B         [10]  173 	DEC IX
   45C9 DD 2B         [10]  174 	DEC IX
   45CB DD 2B         [10]  175 	DEC IX
   45CD DD 2B         [10]  176 	DEC IX
   45CF DD 22 DB 45   [20]  177 	LD (#pos_cola),IX
   45D3 21 D9 45      [10]  178 	LD HL,#elementos_cola
   45D6 35            [11]  179 	DEC (HL)
   45D7 FB            [ 4]  180 	EI
   45D8 C9            [10]  181 	RET
                            182 
   45D9                     183 elementos_cola:
   45D9 00 00               184 	.DW #0				; defw 0
   45DB                     185 pos_cola:
   45DB DD 45               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   45DD                     188 cola_impresion:  		; defs 12
   45DD 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   45E9                     190 bucle_texto0:
   45E9 3E 01         [ 7]  191 	LD A,#1
   45EB 32 35 46      [13]  192 	LD (imprimiendo),A
                            193 
   45EE 3A 52 48      [13]  194 	LD A,(first_char)
   45F1 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   45F2 7E            [ 7]  197 	LD A,(HL)
   45F3 B7            [ 4]  198 	OR A ;CP 0
   45F4 C8            [11]  199 	RET Z
   45F5 90            [ 4]  200 	SUB B
   45F6 01 53 48      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   45F9 E5            [11]  202 	PUSH HL
                            203 
   45FA 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   45FB 26 00         [ 7]  205 	LD H,#0
   45FD 29            [11]  206 	ADD HL,HL
   45FE 29            [11]  207 	ADD HL,HL
   45FF 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4600 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4601 CD 6C 46      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   4604 3A 34 46      [13]  211 	LD A,(doble)
   4607 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   4609 CC 53 46      [17]  214 	CALL Z, doblar_letra
   460C 2A 36 46      [16]  215 	LD HL,(#direcc_destino)
   460F 3A 34 46      [13]  216 	LD A,(doble)
   4612 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   4614 28 08         [12]  219 	JR Z,cont_doble
   4616 11 22 48      [10]  220 	LD DE,#letra_decodificada
   4619 FD                  221 	.DB #0xfD
   461A 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   461C 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   461E                     226 cont_doble:
   461E 11 32 48      [10]  227 	LD DE,#letra_decodificada_tmp
   4621 FD                  228 	.DB #0xfD
   4622 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   4624                     231 cont_tot:
   4624 CD 38 46      [17]  232 	CALL cpc_PutSp0
   4627 2A 36 46      [16]  233 	LD HL,(#direcc_destino)
   462A 23            [ 6]  234 	INC HL
   462B 23            [ 6]  235 	INC HL
   462C 22 36 46      [16]  236 	LD (#direcc_destino),HL
   462F E1            [10]  237 	POP HL
   4630 23            [ 6]  238 	INC HL
   4631 C3 E9 45      [10]  239 	JP bucle_texto0
                            240 
                            241 
   4634                     242 doble:
   4634 00                  243 	.DB #0
   4635                     244 imprimiendo:
   4635 00                  245 	.DB #0
   4636                     246 direcc_destino:
   4636 00 00               247 	.DW #0
                            248 
                            249 
   4638                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4638 06 07         [ 7]  253 	LD B,#7
   463A 48            [ 4]  254 	LD C,B
   463B                     255 loop_alto_2:
                            256 
   463B                     257 loop_ancho_2:
   463B EB            [ 4]  258 	EX DE,HL
   463C ED A0         [16]  259 	LDI
   463E ED A0         [16]  260 	LDI
   4640 FD                  261 	.DB #0XFD
   4641 25            [ 4]  262 	DEC H
   4642 C8            [11]  263 	RET Z
   4643 EB            [ 4]  264 	EX DE,HL
   4644                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   4644 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   4646 09            [11]  267 	ADD HL,BC
   4647 D2 3B 46      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   464A 01 50 C0      [10]  269 	LD BC,#0XC050
   464D 09            [11]  270 	ADD HL,BC
   464E 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   4650 C3 3B 46      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   4653                     277 doblar_letra:
   4653 21 22 48      [10]  278 	LD HL,#letra_decodificada
   4656 11 32 48      [10]  279 	LD DE,#letra_decodificada_tmp
   4659 06 08         [ 7]  280 	LD B,#8
   465B                     281 buc_doblar_letra:
   465B 7E            [ 7]  282 	LD A,(HL)
   465C 23            [ 6]  283 	INC HL
   465D 12            [ 7]  284 	LD (DE),A
   465E 13            [ 6]  285 	INC DE
   465F 13            [ 6]  286 	INC DE
   4660 12            [ 7]  287 	LD (DE),A
   4661 1B            [ 6]  288 	DEC DE
   4662 7E            [ 7]  289 	LD A,(HL)
   4663 23            [ 6]  290 	INC HL
   4664 12            [ 7]  291 	LD (DE),A
   4665 13            [ 6]  292 	INC DE
   4666 13            [ 6]  293 	INC DE
   4667 12            [ 7]  294 	LD (DE),A
   4668 13            [ 6]  295 	INC DE
   4669 10 F0         [13]  296 	DJNZ buc_doblar_letra
   466B C9            [10]  297 	RET
                            298 
                            299 
   466C                     300 escribe_letra:		; Code by Kevin Thacker
   466C D5            [11]  301 	PUSH DE
   466D FD 21 22 48   [14]  302 	LD IY,#letra_decodificada
   4671 06 08         [ 7]  303 	LD B,#8
   4673                     304 bucle_alto_letra:
   4673 C5            [11]  305 	PUSH BC
   4674 E5            [11]  306 	PUSH HL
   4675 5E            [ 7]  307 	LD E,(HL)
   4676 CD 8D 46      [17]  308 	CALL op_colores
   4679 FD 72 00      [19]  309 	LD (IY),D
   467C FD 23         [10]  310 	INC IY
   467E CD 8D 46      [17]  311 	CALL op_colores
   4681 FD 72 00      [19]  312 	LD (IY),D
   4684 FD 23         [10]  313 	INC IY
   4686 E1            [10]  314 	POP HL
   4687 23            [ 6]  315 	INC HL
   4688 C1            [10]  316 	POP BC
   4689 10 E8         [13]  317 	DJNZ bucle_alto_letra
   468B D1            [10]  318 	POP DE
   468C C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   468D                     321 op_colores:
   468D 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   468F CD 9A 46      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   4692 CB 02         [ 8]  324 	RLC D
   4694 CD 9A 46      [17]  325 	CALL op_colores_pixel
   4697 CB 0A         [ 8]  326 	RRC D
   4699 C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   469A                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   469A CB 03         [ 8]  333 	RLC E
   469C CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   469E 7B            [ 4]  336 	LD A,E
   469F E6 03         [ 7]  337 	AND #0X3
   46A1 21 1E 48      [10]  338 	LD HL,#colores_b0
   46A4 85            [ 4]  339 	ADD A,L
   46A5 6F            [ 4]  340 	LD L,A
   46A6 7C            [ 4]  341 	LD A,H
   46A7 CE 00         [ 7]  342 	ADC A,#0
   46A9 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   46AA 7A            [ 4]  345 	LD A,D
   46AB B6            [ 7]  346 	OR (HL)
   46AC 57            [ 4]  347 	LD D,A
   46AD C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   46AE                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   46AE DD 21 02 00   [14]  355 	LD IX,#2
   46B2 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   46B4 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   46B7 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   46BA 21 1E 48      [10]  363 	LD HL,#colores_b0
   46BD 06 00         [ 7]  364 	LD B,#0
   46BF 09            [11]  365 	ADD HL,BC
   46C0 77            [ 7]  366 	LD (HL),A
   46C1 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   46C2                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   46C2 DD 21 02 00   [14]  377 	LD IX,#2
   46C6 DD 39         [15]  378 	ADD IX,SP
   46C8 DD 6E 03      [19]  379  	LD L,3 (IX)
   46CB DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   46CE CD A9 44      [17]  381 	CALL cpc_GetScrAddress0
   46D1 DD 5E 00      [19]  382    	LD E,0 (IX)
   46D4 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   46D7 AF            [ 4]  384 	XOR A
   46D8 C3 1F 47      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   46DB                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   46DB DD 21 02 00   [14]  392 	LD IX,#2
   46DF DD 39         [15]  393 	ADD IX,SP
   46E1 DD 6E 03      [19]  394  	LD L,3 (IX)
   46E4 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   46E7 CD A9 44      [17]  396 	CALL cpc_GetScrAddress0
   46EA DD 5E 00      [19]  397    	LD E,0 (IX)
   46ED DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   46F0 3E 01         [ 7]  399 	LD A,#1
   46F2 C3 1F 47      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   46F5                     407 _cpc_PrintGphStrM12X::
   46F5 DD 21 02 00   [14]  408 	LD IX,#2
   46F9 DD 39         [15]  409 	ADD IX,SP
   46FB DD 6E 02      [19]  410 	LD L,2 (IX)
   46FE DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   4701 DD 5E 00      [19]  412    	LD E,0 (IX)
   4704 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   4707 3E 01         [ 7]  414 	LD A,#1
                            415 
   4709 C3 1F 47      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   470C                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   470C DD 21 02 00   [14]  425 	LD IX,#2
   4710 DD 39         [15]  426 	ADD IX,SP
   4712 DD 6E 02      [19]  427 	LD L,2 (IX)
   4715 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   4718 DD 5E 00      [19]  429    	LD E,0 (IX)
   471B DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   471E AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   471F                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   471F 32 88 47      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   4722 3A 35 46      [13]  442 	LD A,(#imprimiendo)
   4725 FE 01         [ 7]  443 	CP #1
   4727 CA 93 45      [10]  444 	JP Z,add_elemento
   472A 22 36 46      [16]  445 	LD (#direcc_destino),HL
   472D EB            [ 4]  446 	EX DE,HL
   472E CD 3E 47      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   4731                     449 bucle_cola_impresionM1:
   4731 3A D9 45      [13]  450 	LD A,(#elementos_cola)
   4734 B7            [ 4]  451 	OR A
   4735 CA 8D 45      [10]  452 	JP Z,terminar_impresion
   4738 CD B6 45      [17]  453 	CALL leer_elemento
   473B C3 31 47      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   473E                     460 bucle_texto0M1:
   473E 3E 01         [ 7]  461 	LD A,#1
   4740 32 35 46      [13]  462 	LD (#imprimiendo),A
                            463 
   4743 3A 52 48      [13]  464 	LD A,(#first_char)
   4746 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   4747 7E            [ 7]  466 	LD A,(HL)
   4748 B7            [ 4]  467 	OR A ;CP 0
   4749 C8            [11]  468 	RET Z
   474A 90            [ 4]  469 	SUB B
   474B 01 53 48      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   474E E5            [11]  471 	PUSH HL
   474F 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   4750 26 00         [ 7]  473 	LD H,#0
   4752 29            [11]  474 	ADD HL,HL
   4753 29            [11]  475 	ADD HL,HL
   4754 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4755 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4756 CD B3 47      [17]  478 	CALL escribe_letraM1
   4759 3A 88 47      [13]  479 	LD A,(dobleM1)
   475C FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   475E CC 89 47      [17]  482 	CALL Z, doblar_letraM1
   4761 2A 36 46      [16]  483 	LD HL,(direcc_destino)
   4764 3A 88 47      [13]  484 	LD A,(dobleM1)
   4767 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   4769 28 08         [12]  487 	JR Z,cont_dobleM1
   476B 11 22 48      [10]  488 	LD DE,#letra_decodificada
   476E FD                  489 	.DB #0xfD
   476F 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4771 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   4773                     494 cont_dobleM1:
   4773 11 32 48      [10]  495 	LD DE,#letra_decodificada_tmp
   4776 FD                  496 	.DB #0XFD
   4777 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4779                     498 cont_totM1:
   4779 CD 9A 47      [17]  499 	CALL cpc_PutSp0M1
   477C 2A 36 46      [16]  500 	LD HL,(#direcc_destino)
   477F 23            [ 6]  501 	INC HL
   4780 22 36 46      [16]  502 	LD (#direcc_destino),HL
   4783 E1            [10]  503 	POP HL
   4784 23            [ 6]  504 	INC HL
   4785 C3 3E 47      [10]  505 	JP bucle_texto0M1
                            506 
   4788                     507 dobleM1:
   4788 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   4789                     512 doblar_letraM1:
   4789 21 22 48      [10]  513 	LD HL,#letra_decodificada
   478C 11 32 48      [10]  514 	LD DE,#letra_decodificada_tmp
   478F 06 08         [ 7]  515 	LD B,#8
   4791                     516 buc_doblar_letraM1:
   4791 7E            [ 7]  517 	LD A,(HL)
   4792 23            [ 6]  518 	INC HL
   4793 12            [ 7]  519 	LD (DE),A
   4794 13            [ 6]  520 	INC DE
   4795 12            [ 7]  521 	LD (DE),A
   4796 13            [ 6]  522 	INC DE
   4797 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   4799 C9            [10]  524 	RET
                            525 
                            526 
   479A                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   479A 06 07         [ 7]  530 	LD B,#7
   479C 48            [ 4]  531 	LD C,B
   479D                     532 loop_alto_2M1:
   479D                     533 loop_ancho_2M1:
   479D EB            [ 4]  534 	EX DE,HL
   479E ED A0         [16]  535 	LDI
   47A0 FD                  536 	.DB #0XFD
   47A1 25            [ 4]  537 	DEC H
   47A2 C8            [11]  538 	RET Z
   47A3 EB            [ 4]  539 	EX DE,HL
   47A4                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   47A4 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   47A6 09            [11]  542 	ADD HL,BC
   47A7 D2 9D 47      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   47AA 01 50 C0      [10]  544 	LD BC,#0XC050
   47AD 09            [11]  545 	ADD HL,BC
   47AE 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   47B0 C3 9D 47      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   47B3                     551 escribe_letraM1:
   47B3 FD 21 22 48   [14]  552 	LD IY,#letra_decodificada
   47B7 06 08         [ 7]  553 	LD B,#8
   47B9 DD 21 1B 48   [14]  554 	LD IX,#byte_tmp
   47BD                     555 bucle_altoM1:
   47BD C5            [11]  556 	PUSH BC
   47BE E5            [11]  557 	PUSH HL
                            558 
   47BF 7E            [ 7]  559 	LD A,(HL)
   47C0 21 1A 48      [10]  560 	LD HL,#dato
   47C3 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   47C4 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   47C8 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   47CA                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   47CA E5            [11]  570 	PUSH HL
   47CB CD E3 47      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   47CE E1            [10]  572 	POP HL
   47CF CB 3E         [15]  573 	SRL (HL)
   47D1 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   47D3 10 F5         [13]  575 	DJNZ bucle_coloresM1
   47D5 DD 7E 00      [19]  576 	LD A,(IX)
   47D8 FD 77 00      [19]  577 	LD (IY),A
   47DB FD 23         [10]  578 	INC IY
   47DD E1            [10]  579 	POP HL
   47DE 23            [ 6]  580 	INC HL
   47DF C1            [10]  581 	POP BC
   47E0 10 DB         [13]  582 	DJNZ bucle_altoM1
   47E2 C9            [10]  583 	RET
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
   47E3                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   47E3 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   47E5 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   47E6 21 16 48      [10]  610 	LD HL,#colores_m1
   47E9 5F            [ 4]  611 	LD E,A
   47EA 16 00         [ 7]  612 	LD D,#0
   47EC 19            [11]  613 	ADD HL,DE
   47ED 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   47EE 78            [ 4]  618 	LD A,B
   47EF 3D            [ 4]  619 	DEC A
   47F0 B7            [ 4]  620 	OR A ;CP 0
   47F1 CA FA 47      [10]  621 	JP Z,_sin_rotar
   47F4                     622 rotando:
   47F4 CB 39         [ 8]  623 	SRL C
   47F6 3D            [ 4]  624 	DEC A
   47F7 C2 F4 47      [10]  625 	JP NZ, rotando
   47FA                     626 _sin_rotar:
   47FA 79            [ 4]  627 	LD A,C
   47FB DD B6 00      [19]  628 	OR (IX)
   47FE DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   4801 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   4802                     636 _cpc_SetInkGphStrM1::
   4802 DD 21 02 00   [14]  637 	LD IX,#2
   4806 DD 39         [15]  638 	ADD IX,SP
   4808 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   480B DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   480E 21 16 48      [10]  641 	LD HL,#colores_cambM1
   4811 06 00         [ 7]  642 	LD B,#0
   4813 09            [11]  643 	ADD HL,BC
   4814 77            [ 7]  644 	LD (HL),A
   4815 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   4816                     649 colores_cambM1:
   4816                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   4816 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   481A                     663 dato:
   481A 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   481B                     666 byte_tmp:
   481B 00                  667 	.DB #0
   481C 00                  668 	.DB #0
   481D 00                  669 	.DB #0  ;defs 3
   481E                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   481E 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   4822                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   4822 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   482A 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4832                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   4832 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   483A 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4842 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   484A 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   4852                     685 first_char:
   4852 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   4853                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   4853 01                  690 	.DB #0b00000001
   4854 01                  691 	.DB #0b00000001
   4855 08                  692 	.DB #0b00001000
   4856 08                  693 	.DB #0b00001000
   4857 3C                  694 	.DB #0b00111100
   4858 30                  695 	.DB #0b00110000
   4859 30                  696 	.DB #0b00110000
   485A 00                  697 	.DB #0b00000000
                            698 ;0-9
   485B 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   485C 44                  700 .db #0b01000100
   485D 88                  701 .db #0b10001000
   485E 88                  702 .db #0b10001000
   485F 88                  703 .db #0b10001000
   4860 CC                  704 .db #0b11001100
   4861 FC                  705 .db #0b11111100
   4862 00                  706 .db #0b00000000
   4863 10                  707 .db #0b00010000
   4864 50                  708 .db #0b01010000
   4865 20                  709 .db #0b00100000
   4866 20                  710 .db #0b00100000
   4867 20                  711 .db #0b00100000
   4868 30                  712 .db #0b00110000
   4869 FC                  713 .db #0b11111100
   486A 00                  714 .db #0b00000000
   486B 54                  715 .db #0b01010100
   486C 44                  716 .db #0b01000100
   486D 08                  717 .db #0b00001000
   486E A8                  718 .db #0b10101000
   486F 80                  719 .db #0b10000000
   4870 CC                  720 .db #0b11001100
   4871 FC                  721 .db #0b11111100
   4872 00                  722 .db #0b00000000
   4873 54                  723 .db #0b01010100
   4874 44                  724 .db #0b01000100
   4875 08                  725 .db #0b00001000
   4876 28                  726 .db #0b00101000
   4877 08                  727 .db #0b00001000
   4878 CC                  728 .db #0b11001100
   4879 FC                  729 .db #0b11111100
   487A 00                  730 .db #0b00000000
   487B 44                  731 .db #0b01000100
   487C 44                  732 .db #0b01000100
   487D 88                  733 .db #0b10001000
   487E A8                  734 .db #0b10101000
   487F 08                  735 .db #0b00001000
   4880 0C                  736 .db #0b00001100
   4881 0C                  737 .db #0b00001100
   4882 00                  738 .db #0b00000000
   4883 54                  739 .db #0b01010100
   4884 44                  740 .db #0b01000100
   4885 80                  741 .db #0b10000000
   4886 A8                  742 .db #0b10101000
   4887 08                  743 .db #0b00001000
   4888 CC                  744 .db #0b11001100
   4889 FC                  745 .db #0b11111100
   488A 00                  746 .db #0b00000000
   488B 54                  747 .db #0b01010100
   488C 44                  748 .db #0b01000100
   488D 80                  749 .db #0b10000000
   488E A8                  750 .db #0b10101000
   488F 88                  751 .db #0b10001000
   4890 CC                  752 .db #0b11001100
   4891 FC                  753 .db #0b11111100
   4892 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   4893 54                  755 .db #0b01010100
   4894 44                  756 .db #0b01000100
   4895 08                  757 .db #0b00001000
   4896 08                  758 .db #0b00001000
   4897 20                  759 .db #0b00100000
   4898 30                  760 .db #0b00110000
   4899 30                  761 .db #0b00110000
   489A 00                  762 .db #0b00000000
   489B 54                  763 .db #0b01010100
   489C 44                  764 .db #0b01000100
   489D 88                  765 .db #0b10001000
   489E A8                  766 .db #0b10101000
   489F 88                  767 .db #0b10001000
   48A0 CC                  768 .db #0b11001100
   48A1 FC                  769 .db #0b11111100
   48A2 00                  770 .db #0b00000000
   48A3 54                  771 .db #0b01010100
   48A4 44                  772 .db #0b01000100
   48A5 88                  773 .db #0b10001000
   48A6 A8                  774 .db #0b10101000
   48A7 08                  775 .db #0b00001000
   48A8 CC                  776 .db #0b11001100
   48A9 FC                  777 .db #0b11111100
   48AA 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   48AB 00                  786 	.DB #0b00000000
   48AC 00                  787 	.DB #0b00000000
   48AD 20                  788 	.DB #0b00100000
   48AE 00                  789 	.DB #0b00000000
   48AF 30                  790 	.DB #0b00110000
   48B0 00                  791 	.DB #0b00000000
   48B1 00                  792 	.DB #0b00000000
   48B2 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   48B3 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   48BB 00                  797 	.DB #0b00000000
   48BC 00                  798 	.DB #0b00000000
   48BD 00                  799 	.DB #0b00000000
   48BE 00                  800 	.DB #0b00000000
   48BF 00                  801 	.DB #0b00000000
   48C0 00                  802 	.DB #0b00000000
   48C1 C0                  803 	.DB #0b11000000
   48C2 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   48C3 00                  806 .db #0b00000000
   48C4 54                  807 .db #0b01010100
   48C5 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   48C6 A0                  809 .db #0b10100000
   48C7 88                  810 .db #0b10001000
   48C8 CC                  811 .db #0b11001100
   48C9 CC                  812 .db #0b11001100
   48CA 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   48CB 00                  816 	.DB #0b00000000
   48CC 10                  817 	.DB #0b00010000
   48CD 20                  818 	.DB #0b00100000
   48CE 20                  819 	.DB #0b00100000
   48CF 30                  820 	.DB #0b00110000
   48D0 00                  821 	.DB #0b00000000
   48D1 30                  822 	.DB #0b00110000
   48D2 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   48D3 00                  825 	.DB #0b00000000
   48D4 00                  826 	.DB #0b00000000
   48D5 80                  827 	.DB #0b10000000
   48D6 A0                  828 	.DB #0b10100000
   48D7 FC                  829 	.DB #0b11111100
   48D8 FC                  830 	.DB #0b11111100
   48D9 00                  831 	.DB #0b00000000
   48DA 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   48DB 00                  834 	.DB #0b00000000
   48DC 00                  835 	.DB #0b00000000
   48DD 00                  836 	.DB #0b00000000
   48DE A8                  837 	.DB #0b10101000
   48DF FC                  838 	.DB #0b11111100
   48E0 00                  839 	.DB #0b00000000
   48E1 00                  840 	.DB #0b00000000
   48E2 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   48E3 00                  846 .db #0b00000000
   48E4 54                  847 .db #0b01010100
   48E5 88                  848 .db #0b10001000
   48E6 88                  849 .db #0b10001000
   48E7 A8                  850 .db #0b10101000
   48E8 CC                  851 .db #0b11001100
   48E9 CC                  852 .db #0b11001100
   48EA 00                  853 .db #0b00000000
   48EB 00                  854 .db #0b00000000
   48EC 54                  855 .db #0b01010100
   48ED 88                  856 .db #0b10001000
   48EE A8                  857 .db #0b10101000
   48EF 88                  858 .db #0b10001000
   48F0 CC                  859 .db #0b11001100
   48F1 FC                  860 .db #0b11111100
   48F2 00                  861 .db #0b00000000
   48F3 00                  862 .db #0b00000000
   48F4 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   48F5 88                  864 .db #0b10001000
   48F6 80                  865 .db #0b10000000
   48F7 88                  866 .db #0b10001000
   48F8 CC                  867 .db #0b11001100
   48F9 FC                  868 .db #0b11111100
   48FA 00                  869 .db #0b00000000
   48FB 00                  870 .db #0b00000000
   48FC 54                  871 .db #0b01010100
   48FD 88                  872 .db #0b10001000
   48FE 88                  873 .db #0b10001000
   48FF 88                  874 .db #0b10001000
   4900 CC                  875 .db #0b11001100
   4901 F0                  876 .db #0b11110000
   4902 00                  877 .db #0b00000000
   4903 00                  878 .db #0b00000000
   4904 54                  879 .db #0b01010100
   4905 80                  880 .db #0b10000000
   4906 A8                  881 .db #0b10101000
   4907 80                  882 .db #0b10000000
   4908 CC                  883 .db #0b11001100
   4909 FC                  884 .db #0b11111100
   490A 00                  885 .db #0b00000000
   490B 00                  886 .db #0b00000000
   490C 54                  887 .db #0b01010100
   490D 80                  888 .db #0b10000000
   490E A8                  889 .db #0b10101000
   490F 80                  890 .db #0b10000000
   4910 C0                  891 .db #0b11000000
   4911 C0                  892 .db #0b11000000
   4912 00                  893 .db #0b00000000
   4913 00                  894 .db #0b00000000
   4914 54                  895 .db #0b01010100
   4915 88                  896 .db #0b10001000
   4916 80                  897 .db #0b10000000
   4917 A8                  898 .db #0b10101000
   4918 CC                  899 .db #0b11001100
   4919 FC                  900 .db #0b11111100
   491A 00                  901 .db #0b00000000
   491B 00                  902 .db #0b00000000
   491C 44                  903 .db #0b01000100
   491D 88                  904 .db #0b10001000
   491E 88                  905 .db #0b10001000
   491F A8                  906 .db #0b10101000
   4920 CC                  907 .db #0b11001100
   4921 CC                  908 .db #0b11001100
   4922 00                  909 .db #0b00000000
   4923 00                  910 .db #0b00000000
   4924 54                  911 .db #0b01010100
   4925 20                  912 .db #0b00100000
   4926 20                  913 .db #0b00100000
   4927 20                  914 .db #0b00100000
   4928 30                  915 .db #0b00110000
   4929 FC                  916 .db #0b11111100
   492A 00                  917 .db #0b00000000
   492B 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   492C 54                  919 .db #0b01010100
   492D A8                  920 .db #0b10101000
   492E 08                  921 .db #0b00001000
   492F 08                  922 .db #0b00001000
   4930 CC                  923 .db #0b11001100
   4931 FC                  924 .db #0b11111100
   4932 00                  925 .db #0b00000000
   4933 00                  926 .db #0b00000000
   4934 44                  927 .db #0b01000100
   4935 88                  928 .db #0b10001000
   4936 A0                  929 .db #0b10100000
   4937 88                  930 .db #0b10001000
   4938 CC                  931 .db #0b11001100
   4939 CC                  932 .db #0b11001100
   493A 00                  933 .db #0b00000000
   493B 00                  934 .db #0b00000000
   493C 40                  935 .db #0b01000000
   493D 80                  936 .db #0b10000000
   493E 80                  937 .db #0b10000000
   493F 80                  938 .db #0b10000000
   4940 CC                  939 .db #0b11001100
   4941 FC                  940 .db #0b11111100
   4942 00                  941 .db #0b00000000
   4943 00                  942 .db #0b00000000
   4944 54                  943 .db #0b01010100
   4945 A8                  944 .db #0b10101000
   4946 88                  945 .db #0b10001000
   4947 88                  946 .db #0b10001000
   4948 CC                  947 .db #0b11001100
   4949 CC                  948 .db #0b11001100
   494A 00                  949 .db #0b00000000
   494B 00                  950 .db #0b00000000
   494C 50                  951 .db #0b01010000
   494D 88                  952 .db #0b10001000
   494E 88                  953 .db #0b10001000
   494F 88                  954 .db #0b10001000
   4950 CC                  955 .db #0b11001100
   4951 CC                  956 .db #0b11001100
   4952 00                  957 .db #0b00000000
   4953 00                  958 .db #0b00000000
   4954 54                  959 .db #0b01010100
   4955 88                  960 .db #0b10001000
   4956 88                  961 .db #0b10001000
   4957 88                  962 .db #0b10001000
   4958 CC                  963 .db #0b11001100
   4959 FC                  964 .db #0b11111100
   495A 00                  965 .db #0b00000000
   495B 00                  966 .db #0b00000000
   495C 54                  967 .db #0b01010100
   495D 88                  968 .db #0b10001000
   495E 88                  969 .db #0b10001000
   495F A8                  970 .db #0b10101000
   4960 C0                  971 .db #0b11000000
   4961 C0                  972 .db #0b11000000
   4962 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4963 00                  974 .db #0b00000000
   4964 54                  975 .db #0b01010100
   4965 88                  976 .db #0b10001000
   4966 88                  977 .db #0b10001000
   4967 88                  978 .db #0b10001000
   4968 FC                  979 .db #0b11111100
   4969 FC                  980 .db #0b11111100
   496A 00                  981 .db #0b00000000
   496B 00                  982 .db #0b00000000
   496C 54                  983 .db #0b01010100
   496D 88                  984 .db #0b10001000
   496E 88                  985 .db #0b10001000
   496F A0                  986 .db #0b10100000
   4970 CC                  987 .db #0b11001100
   4971 CC                  988 .db #0b11001100
   4972 00                  989 .db #0b00000000
   4973 00                  990 .db #0b00000000
   4974 54                  991 .db #0b01010100
   4975 80                  992 .db #0b10000000
   4976 A8                  993 .db #0b10101000
   4977 08                  994 .db #0b00001000
   4978 CC                  995 .db #0b11001100
   4979 FC                  996 .db #0b11111100
   497A 00                  997 .db #0b00000000
   497B 00                  998 .db #0b00000000
   497C 54                  999 .db #0b01010100
   497D 20                 1000 .db #0b00100000
   497E 20                 1001 .db #0b00100000
   497F 20                 1002 .db #0b00100000
   4980 30                 1003 .db #0b00110000
   4981 30                 1004 .db #0b00110000
   4982 00                 1005 .db #0b00000000
   4983 00                 1006 .db #0b00000000
   4984 44                 1007 .db #0b01000100
   4985 88                 1008 .db #0b10001000
   4986 88                 1009 .db #0b10001000
   4987 88                 1010 .db #0b10001000
   4988 CC                 1011 .db #0b11001100
   4989 FC                 1012 .db #0b11111100
   498A 00                 1013 .db #0b00000000
   498B 00                 1014 .db #0b00000000
   498C 44                 1015 .db #0b01000100
   498D 88                 1016 .db #0b10001000
   498E 88                 1017 .db #0b10001000
   498F 88                 1018 .db #0b10001000
   4990 CC                 1019 .db #0b11001100
   4991 30                 1020 .db #0b00110000
   4992 00                 1021 .db #0b00000000
   4993 00                 1022 .db #0b00000000
   4994 44                 1023 .db #0b01000100
   4995 88                 1024 .db #0b10001000
   4996 88                 1025 .db #0b10001000
   4997 88                 1026 .db #0b10001000
   4998 FC                 1027 .db #0b11111100
   4999 CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   499A 00                 1029 .db #0b00000000
   499B 00                 1030 .db #0b00000000
   499C 44                 1031 .db #0b01000100
   499D 88                 1032 .db #0b10001000
   499E A0                 1033 .db #0b10100000
   499F 20                 1034 .db #0b00100000
   49A0 CC                 1035 .db #0b11001100
   49A1 CC                 1036 .db #0b11001100
   49A2 00                 1037 .db #0b00000000
   49A3 00                 1038 .db #0b00000000
   49A4 44                 1039 .db #0b01000100
   49A5 88                 1040 .db #0b10001000
   49A6 88                 1041 .db #0b10001000
   49A7 20                 1042 .db #0b00100000
   49A8 30                 1043 .db #0b00110000
   49A9 30                 1044 .db #0b00110000
   49AA 00                 1045 .db #0b00000000
   49AB 00                 1046 .db #0b00000000
   49AC 54                 1047 .db #0b01010100
   49AD 08                 1048 .db #0b00001000
   49AE 20                 1049 .db #0b00100000
   49AF 80                 1050 .db #0b10000000
   49B0 CC                 1051 .db #0b11001100
   49B1 FC                 1052 .db #0b11111100
   49B2 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   49B3 03                 1059 	.DB #0b00000011
   49B4 0F                 1060 	.DB #0b00001111
   49B5 3F                 1061 	.DB #0b00111111
   49B6 FF                 1062 	.DB #0b11111111
   49B7 3F                 1063 	.DB #0b00111111
   49B8 0F                 1064 	.DB #0b00001111
   49B9 03                 1065 	.DB #0b00000011
   49BA 00                 1066 	.DB #0b00000000
