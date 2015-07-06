ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   3B4A                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   3B4A 32 77 3B      [13]   11 	LD (#inc_ancho+1),A
   3B4D 7D            [ 4]   12 	LD A,L
   3B4E CB 3F         [ 8]   13 	SRL A
   3B50 CB 3F         [ 8]   14 	SRL A
   3B52 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   3B54 57            [ 4]   17 	LD D,A						;D
   3B55 CB 27         [ 8]   18 	SLA A
   3B57 CB 27         [ 8]   19 	SLA A
   3B59 CB 27         [ 8]   20 	SLA A
   3B5B 95            [ 4]   21 	SUB L
   3B5C ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   3B5E 5F            [ 4]   24 	LD E,A						;E
   3B5F 6A            [ 4]   25 	LD L,D
   3B60 26 00         [ 7]   26 	LD H,#0
   3B62 29            [11]   27 	ADD HL,HL
   3B63 01 7A 3B      [10]   28 	LD BC,#bloques
   3B66 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   3B67 4E            [ 7]   31 	LD C,(HL)
   3B68 23            [ 6]   32 	INC HL
   3B69 66            [ 7]   33 	LD H,(HL)
   3B6A 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   3B6B E5            [11]   36 	PUSH HL
   3B6C 16 00         [ 7]   37 	LD D,#0
   3B6E 21 AC 3B      [10]   38 	LD HL,#sub_bloques
   3B71 19            [11]   39 	ADD HL,DE
   3B72 7E            [ 7]   40 	LD A,(HL)
   3B73 E1            [10]   41 	POP HL
   3B74 84            [ 4]   42 	ADD H
   3B75 67            [ 4]   43 	LD H,A
   3B76                      44 inc_ancho:
   3B76 1E 00         [ 7]   45 	LD E,#0
   3B78 19            [11]   46 	ADD HL,DE
   3B79 C9            [10]   47 	RET
                             48 
   3B7A                      49 bloques:
   3B7A 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   3BAC                      51 sub_bloques:
   3BAC 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   3BB4                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   3BB4 DD 21 02 00   [14]   65 	LD IX,#2
   3BB8 DD 39         [15]   66 	ADD IX,SP
   3BBA DD 6E 02      [19]   67 	LD L,2 (IX)
   3BBD DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   3BC0 DD 5E 00      [19]   69    	LD E,0 (IX)
   3BC3 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   3BC6 3E 01         [ 7]   71 	LD A,#1
   3BC8 C3 0F 3C      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   3BCB                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   3BCB DD 21 02 00   [14]   80 	LD IX,#2
   3BCF DD 39         [15]   81 	ADD IX,SP
   3BD1 DD 6E 03      [19]   82  	LD L,3 (IX)
   3BD4 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   3BD7 CD 4A 3B      [17]   84 	CALL cpc_GetScrAddress0
   3BDA DD 5E 00      [19]   85    	LD E,0 (IX)
   3BDD DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   3BE0 3E 01         [ 7]   87 	LD A,#1
   3BE2 C3 0F 3C      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   3BE5                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   3BE5 DD 21 02 00   [14]   94 	LD IX,#2
   3BE9 DD 39         [15]   95 	ADD IX,SP
   3BEB DD 6E 03      [19]   96  	LD L,3 (IX)
   3BEE DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   3BF1 CD 4A 3B      [17]   98 	CALL cpc_GetScrAddress0
   3BF4 DD 5E 00      [19]   99    	LD E,0 (IX)
   3BF7 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   3BFA C3 0F 3C      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   3BFD                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   3BFD DD 21 02 00   [14]  108 	LD IX,#2
   3C01 DD 39         [15]  109 	ADD IX,SP
   3C03 DD 6E 02      [19]  110 	LD L,2 (IX)
   3C06 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   3C09 DD 5E 00      [19]  113    	LD E,0 (IX)
   3C0C DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   3C0F                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   3C0F 32 D5 3C      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   3C12 3A D6 3C      [13]  125 	LD A,(#imprimiendo)
   3C15 FE 01         [ 7]  126 	CP #1
   3C17 CA 34 3C      [10]  127 	JP Z,add_elemento
   3C1A 22 D7 3C      [16]  128 	LD (#direcc_destino),HL
   3C1D EB            [ 4]  129 	EX DE,HL
   3C1E CD 8A 3C      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   3C21                     133 bucle_cola_impresion:
   3C21 3A 7A 3C      [13]  134 	LD A,(#elementos_cola)
   3C24 B7            [ 4]  135 	OR A
   3C25 CA 2E 3C      [10]  136 	JP Z,terminar_impresion
   3C28 CD 57 3C      [17]  137 	CALL leer_elemento
   3C2B C3 21 3C      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   3C2E                     141 terminar_impresion:
   3C2E AF            [ 4]  142 	XOR A
   3C2F 32 D6 3C      [13]  143 	LD (#imprimiendo),A
   3C32 C9            [10]  144 	RET
   3C33                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   3C33 C9            [10]  147 	RET
   3C34                     148 add_elemento:
   3C34 F3            [ 4]  149 	DI
   3C35 DD 2A 7C 3C   [20]  150 	LD IX,(#pos_cola)
   3C39 DD 75 00      [19]  151 	LD 0 (IX),L
   3C3C DD 74 01      [19]  152 	LD 1 (IX),H
   3C3F DD 73 02      [19]  153 	LD 2 (IX),E
   3C42 DD 72 03      [19]  154 	LD 3 (IX),D
   3C45 DD 23         [10]  155 	INC IX
   3C47 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   3C49 DD 23         [10]  157 	INC IX
   3C4B DD 23         [10]  158 	INC IX
   3C4D DD 22 7C 3C   [20]  159 	LD (#pos_cola),IX
                            160 
   3C51 21 7A 3C      [10]  161 	LD HL,#elementos_cola
   3C54 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   3C55 FB            [ 4]  164 	EI
   3C56 C9            [10]  165 	RET
   3C57                     166 leer_elemento:
   3C57 F3            [ 4]  167 	DI
   3C58 DD 2A 7C 3C   [20]  168 	LD IX,(#pos_cola)
   3C5C DD 6E 00      [19]  169 	LD L,0 (IX)
   3C5F DD 66 01      [19]  170 	LD H,1 (IX)
   3C62 DD 5E 02      [19]  171 	LD E,2 (IX)
   3C65 DD 56 04      [19]  172 	LD D,4 (IX)
   3C68 DD 2B         [10]  173 	DEC IX
   3C6A DD 2B         [10]  174 	DEC IX
   3C6C DD 2B         [10]  175 	DEC IX
   3C6E DD 2B         [10]  176 	DEC IX
   3C70 DD 22 7C 3C   [20]  177 	LD (#pos_cola),IX
   3C74 21 7A 3C      [10]  178 	LD HL,#elementos_cola
   3C77 35            [11]  179 	DEC (HL)
   3C78 FB            [ 4]  180 	EI
   3C79 C9            [10]  181 	RET
                            182 
   3C7A                     183 elementos_cola:
   3C7A 00 00               184 	.DW #0				; defw 0
   3C7C                     185 pos_cola:
   3C7C 7E 3C               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   3C7E                     188 cola_impresion:  		; defs 12
   3C7E 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   3C8A                     190 bucle_texto0:
   3C8A 3E 01         [ 7]  191 	LD A,#1
   3C8C 32 D6 3C      [13]  192 	LD (imprimiendo),A
                            193 
   3C8F 3A F3 3E      [13]  194 	LD A,(first_char)
   3C92 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   3C93 7E            [ 7]  197 	LD A,(HL)
   3C94 B7            [ 4]  198 	OR A ;CP 0
   3C95 C8            [11]  199 	RET Z
   3C96 90            [ 4]  200 	SUB B
   3C97 01 F4 3E      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   3C9A E5            [11]  202 	PUSH HL
                            203 
   3C9B 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   3C9C 26 00         [ 7]  205 	LD H,#0
   3C9E 29            [11]  206 	ADD HL,HL
   3C9F 29            [11]  207 	ADD HL,HL
   3CA0 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3CA1 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3CA2 CD 0D 3D      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   3CA5 3A D5 3C      [13]  211 	LD A,(doble)
   3CA8 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   3CAA CC F4 3C      [17]  214 	CALL Z, doblar_letra
   3CAD 2A D7 3C      [16]  215 	LD HL,(#direcc_destino)
   3CB0 3A D5 3C      [13]  216 	LD A,(doble)
   3CB3 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   3CB5 28 08         [12]  219 	JR Z,cont_doble
   3CB7 11 C3 3E      [10]  220 	LD DE,#letra_decodificada
   3CBA FD                  221 	.DB #0xfD
   3CBB 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3CBD 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   3CBF                     226 cont_doble:
   3CBF 11 D3 3E      [10]  227 	LD DE,#letra_decodificada_tmp
   3CC2 FD                  228 	.DB #0xfD
   3CC3 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   3CC5                     231 cont_tot:
   3CC5 CD D9 3C      [17]  232 	CALL cpc_PutSp0
   3CC8 2A D7 3C      [16]  233 	LD HL,(#direcc_destino)
   3CCB 23            [ 6]  234 	INC HL
   3CCC 23            [ 6]  235 	INC HL
   3CCD 22 D7 3C      [16]  236 	LD (#direcc_destino),HL
   3CD0 E1            [10]  237 	POP HL
   3CD1 23            [ 6]  238 	INC HL
   3CD2 C3 8A 3C      [10]  239 	JP bucle_texto0
                            240 
                            241 
   3CD5                     242 doble:
   3CD5 00                  243 	.DB #0
   3CD6                     244 imprimiendo:
   3CD6 00                  245 	.DB #0
   3CD7                     246 direcc_destino:
   3CD7 00 00               247 	.DW #0
                            248 
                            249 
   3CD9                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3CD9 06 07         [ 7]  253 	LD B,#7
   3CDB 48            [ 4]  254 	LD C,B
   3CDC                     255 loop_alto_2:
                            256 
   3CDC                     257 loop_ancho_2:
   3CDC EB            [ 4]  258 	EX DE,HL
   3CDD ED A0         [16]  259 	LDI
   3CDF ED A0         [16]  260 	LDI
   3CE1 FD                  261 	.DB #0XFD
   3CE2 25            [ 4]  262 	DEC H
   3CE3 C8            [11]  263 	RET Z
   3CE4 EB            [ 4]  264 	EX DE,HL
   3CE5                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   3CE5 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   3CE7 09            [11]  267 	ADD HL,BC
   3CE8 D2 DC 3C      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   3CEB 01 50 C0      [10]  269 	LD BC,#0XC050
   3CEE 09            [11]  270 	ADD HL,BC
   3CEF 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   3CF1 C3 DC 3C      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   3CF4                     277 doblar_letra:
   3CF4 21 C3 3E      [10]  278 	LD HL,#letra_decodificada
   3CF7 11 D3 3E      [10]  279 	LD DE,#letra_decodificada_tmp
   3CFA 06 08         [ 7]  280 	LD B,#8
   3CFC                     281 buc_doblar_letra:
   3CFC 7E            [ 7]  282 	LD A,(HL)
   3CFD 23            [ 6]  283 	INC HL
   3CFE 12            [ 7]  284 	LD (DE),A
   3CFF 13            [ 6]  285 	INC DE
   3D00 13            [ 6]  286 	INC DE
   3D01 12            [ 7]  287 	LD (DE),A
   3D02 1B            [ 6]  288 	DEC DE
   3D03 7E            [ 7]  289 	LD A,(HL)
   3D04 23            [ 6]  290 	INC HL
   3D05 12            [ 7]  291 	LD (DE),A
   3D06 13            [ 6]  292 	INC DE
   3D07 13            [ 6]  293 	INC DE
   3D08 12            [ 7]  294 	LD (DE),A
   3D09 13            [ 6]  295 	INC DE
   3D0A 10 F0         [13]  296 	DJNZ buc_doblar_letra
   3D0C C9            [10]  297 	RET
                            298 
                            299 
   3D0D                     300 escribe_letra:		; Code by Kevin Thacker
   3D0D D5            [11]  301 	PUSH DE
   3D0E FD 21 C3 3E   [14]  302 	LD IY,#letra_decodificada
   3D12 06 08         [ 7]  303 	LD B,#8
   3D14                     304 bucle_alto_letra:
   3D14 C5            [11]  305 	PUSH BC
   3D15 E5            [11]  306 	PUSH HL
   3D16 5E            [ 7]  307 	LD E,(HL)
   3D17 CD 2E 3D      [17]  308 	CALL op_colores
   3D1A FD 72 00      [19]  309 	LD (IY),D
   3D1D FD 23         [10]  310 	INC IY
   3D1F CD 2E 3D      [17]  311 	CALL op_colores
   3D22 FD 72 00      [19]  312 	LD (IY),D
   3D25 FD 23         [10]  313 	INC IY
   3D27 E1            [10]  314 	POP HL
   3D28 23            [ 6]  315 	INC HL
   3D29 C1            [10]  316 	POP BC
   3D2A 10 E8         [13]  317 	DJNZ bucle_alto_letra
   3D2C D1            [10]  318 	POP DE
   3D2D C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   3D2E                     321 op_colores:
   3D2E 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   3D30 CD 3B 3D      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   3D33 CB 02         [ 8]  324 	RLC D
   3D35 CD 3B 3D      [17]  325 	CALL op_colores_pixel
   3D38 CB 0A         [ 8]  326 	RRC D
   3D3A C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   3D3B                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   3D3B CB 03         [ 8]  333 	RLC E
   3D3D CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   3D3F 7B            [ 4]  336 	LD A,E
   3D40 E6 03         [ 7]  337 	AND #0X3
   3D42 21 BF 3E      [10]  338 	LD HL,#colores_b0
   3D45 85            [ 4]  339 	ADD A,L
   3D46 6F            [ 4]  340 	LD L,A
   3D47 7C            [ 4]  341 	LD A,H
   3D48 CE 00         [ 7]  342 	ADC A,#0
   3D4A 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   3D4B 7A            [ 4]  345 	LD A,D
   3D4C B6            [ 7]  346 	OR (HL)
   3D4D 57            [ 4]  347 	LD D,A
   3D4E C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   3D4F                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   3D4F DD 21 02 00   [14]  355 	LD IX,#2
   3D53 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   3D55 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   3D58 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   3D5B 21 BF 3E      [10]  363 	LD HL,#colores_b0
   3D5E 06 00         [ 7]  364 	LD B,#0
   3D60 09            [11]  365 	ADD HL,BC
   3D61 77            [ 7]  366 	LD (HL),A
   3D62 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   3D63                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   3D63 DD 21 02 00   [14]  377 	LD IX,#2
   3D67 DD 39         [15]  378 	ADD IX,SP
   3D69 DD 6E 03      [19]  379  	LD L,3 (IX)
   3D6C DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   3D6F CD 4A 3B      [17]  381 	CALL cpc_GetScrAddress0
   3D72 DD 5E 00      [19]  382    	LD E,0 (IX)
   3D75 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   3D78 AF            [ 4]  384 	XOR A
   3D79 C3 C0 3D      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   3D7C                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   3D7C DD 21 02 00   [14]  392 	LD IX,#2
   3D80 DD 39         [15]  393 	ADD IX,SP
   3D82 DD 6E 03      [19]  394  	LD L,3 (IX)
   3D85 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   3D88 CD 4A 3B      [17]  396 	CALL cpc_GetScrAddress0
   3D8B DD 5E 00      [19]  397    	LD E,0 (IX)
   3D8E DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   3D91 3E 01         [ 7]  399 	LD A,#1
   3D93 C3 C0 3D      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   3D96                     407 _cpc_PrintGphStrM12X::
   3D96 DD 21 02 00   [14]  408 	LD IX,#2
   3D9A DD 39         [15]  409 	ADD IX,SP
   3D9C DD 6E 02      [19]  410 	LD L,2 (IX)
   3D9F DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   3DA2 DD 5E 00      [19]  412    	LD E,0 (IX)
   3DA5 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   3DA8 3E 01         [ 7]  414 	LD A,#1
                            415 
   3DAA C3 C0 3D      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   3DAD                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   3DAD DD 21 02 00   [14]  425 	LD IX,#2
   3DB1 DD 39         [15]  426 	ADD IX,SP
   3DB3 DD 6E 02      [19]  427 	LD L,2 (IX)
   3DB6 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   3DB9 DD 5E 00      [19]  429    	LD E,0 (IX)
   3DBC DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   3DBF AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   3DC0                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   3DC0 32 29 3E      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   3DC3 3A D6 3C      [13]  442 	LD A,(#imprimiendo)
   3DC6 FE 01         [ 7]  443 	CP #1
   3DC8 CA 34 3C      [10]  444 	JP Z,add_elemento
   3DCB 22 D7 3C      [16]  445 	LD (#direcc_destino),HL
   3DCE EB            [ 4]  446 	EX DE,HL
   3DCF CD DF 3D      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   3DD2                     449 bucle_cola_impresionM1:
   3DD2 3A 7A 3C      [13]  450 	LD A,(#elementos_cola)
   3DD5 B7            [ 4]  451 	OR A
   3DD6 CA 2E 3C      [10]  452 	JP Z,terminar_impresion
   3DD9 CD 57 3C      [17]  453 	CALL leer_elemento
   3DDC C3 D2 3D      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   3DDF                     460 bucle_texto0M1:
   3DDF 3E 01         [ 7]  461 	LD A,#1
   3DE1 32 D6 3C      [13]  462 	LD (#imprimiendo),A
                            463 
   3DE4 3A F3 3E      [13]  464 	LD A,(#first_char)
   3DE7 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   3DE8 7E            [ 7]  466 	LD A,(HL)
   3DE9 B7            [ 4]  467 	OR A ;CP 0
   3DEA C8            [11]  468 	RET Z
   3DEB 90            [ 4]  469 	SUB B
   3DEC 01 F4 3E      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   3DEF E5            [11]  471 	PUSH HL
   3DF0 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   3DF1 26 00         [ 7]  473 	LD H,#0
   3DF3 29            [11]  474 	ADD HL,HL
   3DF4 29            [11]  475 	ADD HL,HL
   3DF5 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3DF6 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3DF7 CD 54 3E      [17]  478 	CALL escribe_letraM1
   3DFA 3A 29 3E      [13]  479 	LD A,(dobleM1)
   3DFD FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   3DFF CC 2A 3E      [17]  482 	CALL Z, doblar_letraM1
   3E02 2A D7 3C      [16]  483 	LD HL,(direcc_destino)
   3E05 3A 29 3E      [13]  484 	LD A,(dobleM1)
   3E08 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   3E0A 28 08         [12]  487 	JR Z,cont_dobleM1
   3E0C 11 C3 3E      [10]  488 	LD DE,#letra_decodificada
   3E0F FD                  489 	.DB #0xfD
   3E10 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E12 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   3E14                     494 cont_dobleM1:
   3E14 11 D3 3E      [10]  495 	LD DE,#letra_decodificada_tmp
   3E17 FD                  496 	.DB #0XFD
   3E18 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E1A                     498 cont_totM1:
   3E1A CD 3B 3E      [17]  499 	CALL cpc_PutSp0M1
   3E1D 2A D7 3C      [16]  500 	LD HL,(#direcc_destino)
   3E20 23            [ 6]  501 	INC HL
   3E21 22 D7 3C      [16]  502 	LD (#direcc_destino),HL
   3E24 E1            [10]  503 	POP HL
   3E25 23            [ 6]  504 	INC HL
   3E26 C3 DF 3D      [10]  505 	JP bucle_texto0M1
                            506 
   3E29                     507 dobleM1:
   3E29 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   3E2A                     512 doblar_letraM1:
   3E2A 21 C3 3E      [10]  513 	LD HL,#letra_decodificada
   3E2D 11 D3 3E      [10]  514 	LD DE,#letra_decodificada_tmp
   3E30 06 08         [ 7]  515 	LD B,#8
   3E32                     516 buc_doblar_letraM1:
   3E32 7E            [ 7]  517 	LD A,(HL)
   3E33 23            [ 6]  518 	INC HL
   3E34 12            [ 7]  519 	LD (DE),A
   3E35 13            [ 6]  520 	INC DE
   3E36 12            [ 7]  521 	LD (DE),A
   3E37 13            [ 6]  522 	INC DE
   3E38 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   3E3A C9            [10]  524 	RET
                            525 
                            526 
   3E3B                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E3B 06 07         [ 7]  530 	LD B,#7
   3E3D 48            [ 4]  531 	LD C,B
   3E3E                     532 loop_alto_2M1:
   3E3E                     533 loop_ancho_2M1:
   3E3E EB            [ 4]  534 	EX DE,HL
   3E3F ED A0         [16]  535 	LDI
   3E41 FD                  536 	.DB #0XFD
   3E42 25            [ 4]  537 	DEC H
   3E43 C8            [11]  538 	RET Z
   3E44 EB            [ 4]  539 	EX DE,HL
   3E45                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   3E45 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   3E47 09            [11]  542 	ADD HL,BC
   3E48 D2 3E 3E      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   3E4B 01 50 C0      [10]  544 	LD BC,#0XC050
   3E4E 09            [11]  545 	ADD HL,BC
   3E4F 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   3E51 C3 3E 3E      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   3E54                     551 escribe_letraM1:
   3E54 FD 21 C3 3E   [14]  552 	LD IY,#letra_decodificada
   3E58 06 08         [ 7]  553 	LD B,#8
   3E5A DD 21 BC 3E   [14]  554 	LD IX,#byte_tmp
   3E5E                     555 bucle_altoM1:
   3E5E C5            [11]  556 	PUSH BC
   3E5F E5            [11]  557 	PUSH HL
                            558 
   3E60 7E            [ 7]  559 	LD A,(HL)
   3E61 21 BB 3E      [10]  560 	LD HL,#dato
   3E64 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   3E65 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   3E69 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   3E6B                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   3E6B E5            [11]  570 	PUSH HL
   3E6C CD 84 3E      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   3E6F E1            [10]  572 	POP HL
   3E70 CB 3E         [15]  573 	SRL (HL)
   3E72 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   3E74 10 F5         [13]  575 	DJNZ bucle_coloresM1
   3E76 DD 7E 00      [19]  576 	LD A,(IX)
   3E79 FD 77 00      [19]  577 	LD (IY),A
   3E7C FD 23         [10]  578 	INC IY
   3E7E E1            [10]  579 	POP HL
   3E7F 23            [ 6]  580 	INC HL
   3E80 C1            [10]  581 	POP BC
   3E81 10 DB         [13]  582 	DJNZ bucle_altoM1
   3E83 C9            [10]  583 	RET
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
   3E84                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   3E84 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   3E86 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   3E87 21 B7 3E      [10]  610 	LD HL,#colores_m1
   3E8A 5F            [ 4]  611 	LD E,A
   3E8B 16 00         [ 7]  612 	LD D,#0
   3E8D 19            [11]  613 	ADD HL,DE
   3E8E 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   3E8F 78            [ 4]  618 	LD A,B
   3E90 3D            [ 4]  619 	DEC A
   3E91 B7            [ 4]  620 	OR A ;CP 0
   3E92 CA 9B 3E      [10]  621 	JP Z,_sin_rotar
   3E95                     622 rotando:
   3E95 CB 39         [ 8]  623 	SRL C
   3E97 3D            [ 4]  624 	DEC A
   3E98 C2 95 3E      [10]  625 	JP NZ, rotando
   3E9B                     626 _sin_rotar:
   3E9B 79            [ 4]  627 	LD A,C
   3E9C DD B6 00      [19]  628 	OR (IX)
   3E9F DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   3EA2 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   3EA3                     636 _cpc_SetInkGphStrM1::
   3EA3 DD 21 02 00   [14]  637 	LD IX,#2
   3EA7 DD 39         [15]  638 	ADD IX,SP
   3EA9 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   3EAC DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   3EAF 21 B7 3E      [10]  641 	LD HL,#colores_cambM1
   3EB2 06 00         [ 7]  642 	LD B,#0
   3EB4 09            [11]  643 	ADD HL,BC
   3EB5 77            [ 7]  644 	LD (HL),A
   3EB6 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   3EB7                     649 colores_cambM1:
   3EB7                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   3EB7 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   3EBB                     663 dato:
   3EBB 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   3EBC                     666 byte_tmp:
   3EBC 00                  667 	.DB #0
   3EBD 00                  668 	.DB #0
   3EBE 00                  669 	.DB #0  ;defs 3
   3EBF                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   3EBF 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   3EC3                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   3EC3 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3ECB 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3ED3                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   3ED3 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EDB 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EE3 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EEB 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   3EF3                     685 first_char:
   3EF3 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   3EF4                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   3EF4 01                  690 	.DB #0b00000001
   3EF5 01                  691 	.DB #0b00000001
   3EF6 08                  692 	.DB #0b00001000
   3EF7 08                  693 	.DB #0b00001000
   3EF8 3C                  694 	.DB #0b00111100
   3EF9 30                  695 	.DB #0b00110000
   3EFA 30                  696 	.DB #0b00110000
   3EFB 00                  697 	.DB #0b00000000
                            698 ;0-9
   3EFC 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   3EFD 44                  700 .db #0b01000100
   3EFE 88                  701 .db #0b10001000
   3EFF 88                  702 .db #0b10001000
   3F00 88                  703 .db #0b10001000
   3F01 CC                  704 .db #0b11001100
   3F02 FC                  705 .db #0b11111100
   3F03 00                  706 .db #0b00000000
   3F04 10                  707 .db #0b00010000
   3F05 50                  708 .db #0b01010000
   3F06 20                  709 .db #0b00100000
   3F07 20                  710 .db #0b00100000
   3F08 20                  711 .db #0b00100000
   3F09 30                  712 .db #0b00110000
   3F0A FC                  713 .db #0b11111100
   3F0B 00                  714 .db #0b00000000
   3F0C 54                  715 .db #0b01010100
   3F0D 44                  716 .db #0b01000100
   3F0E 08                  717 .db #0b00001000
   3F0F A8                  718 .db #0b10101000
   3F10 80                  719 .db #0b10000000
   3F11 CC                  720 .db #0b11001100
   3F12 FC                  721 .db #0b11111100
   3F13 00                  722 .db #0b00000000
   3F14 54                  723 .db #0b01010100
   3F15 44                  724 .db #0b01000100
   3F16 08                  725 .db #0b00001000
   3F17 28                  726 .db #0b00101000
   3F18 08                  727 .db #0b00001000
   3F19 CC                  728 .db #0b11001100
   3F1A FC                  729 .db #0b11111100
   3F1B 00                  730 .db #0b00000000
   3F1C 44                  731 .db #0b01000100
   3F1D 44                  732 .db #0b01000100
   3F1E 88                  733 .db #0b10001000
   3F1F A8                  734 .db #0b10101000
   3F20 08                  735 .db #0b00001000
   3F21 0C                  736 .db #0b00001100
   3F22 0C                  737 .db #0b00001100
   3F23 00                  738 .db #0b00000000
   3F24 54                  739 .db #0b01010100
   3F25 44                  740 .db #0b01000100
   3F26 80                  741 .db #0b10000000
   3F27 A8                  742 .db #0b10101000
   3F28 08                  743 .db #0b00001000
   3F29 CC                  744 .db #0b11001100
   3F2A FC                  745 .db #0b11111100
   3F2B 00                  746 .db #0b00000000
   3F2C 54                  747 .db #0b01010100
   3F2D 44                  748 .db #0b01000100
   3F2E 80                  749 .db #0b10000000
   3F2F A8                  750 .db #0b10101000
   3F30 88                  751 .db #0b10001000
   3F31 CC                  752 .db #0b11001100
   3F32 FC                  753 .db #0b11111100
   3F33 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   3F34 54                  755 .db #0b01010100
   3F35 44                  756 .db #0b01000100
   3F36 08                  757 .db #0b00001000
   3F37 08                  758 .db #0b00001000
   3F38 20                  759 .db #0b00100000
   3F39 30                  760 .db #0b00110000
   3F3A 30                  761 .db #0b00110000
   3F3B 00                  762 .db #0b00000000
   3F3C 54                  763 .db #0b01010100
   3F3D 44                  764 .db #0b01000100
   3F3E 88                  765 .db #0b10001000
   3F3F A8                  766 .db #0b10101000
   3F40 88                  767 .db #0b10001000
   3F41 CC                  768 .db #0b11001100
   3F42 FC                  769 .db #0b11111100
   3F43 00                  770 .db #0b00000000
   3F44 54                  771 .db #0b01010100
   3F45 44                  772 .db #0b01000100
   3F46 88                  773 .db #0b10001000
   3F47 A8                  774 .db #0b10101000
   3F48 08                  775 .db #0b00001000
   3F49 CC                  776 .db #0b11001100
   3F4A FC                  777 .db #0b11111100
   3F4B 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   3F4C 00                  786 	.DB #0b00000000
   3F4D 00                  787 	.DB #0b00000000
   3F4E 20                  788 	.DB #0b00100000
   3F4F 00                  789 	.DB #0b00000000
   3F50 30                  790 	.DB #0b00110000
   3F51 00                  791 	.DB #0b00000000
   3F52 00                  792 	.DB #0b00000000
   3F53 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   3F54 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   3F5C 00                  797 	.DB #0b00000000
   3F5D 00                  798 	.DB #0b00000000
   3F5E 00                  799 	.DB #0b00000000
   3F5F 00                  800 	.DB #0b00000000
   3F60 00                  801 	.DB #0b00000000
   3F61 00                  802 	.DB #0b00000000
   3F62 C0                  803 	.DB #0b11000000
   3F63 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   3F64 00                  806 .db #0b00000000
   3F65 54                  807 .db #0b01010100
   3F66 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   3F67 A0                  809 .db #0b10100000
   3F68 88                  810 .db #0b10001000
   3F69 CC                  811 .db #0b11001100
   3F6A CC                  812 .db #0b11001100
   3F6B 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   3F6C 00                  816 	.DB #0b00000000
   3F6D 10                  817 	.DB #0b00010000
   3F6E 20                  818 	.DB #0b00100000
   3F6F 20                  819 	.DB #0b00100000
   3F70 30                  820 	.DB #0b00110000
   3F71 00                  821 	.DB #0b00000000
   3F72 30                  822 	.DB #0b00110000
   3F73 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   3F74 00                  825 	.DB #0b00000000
   3F75 00                  826 	.DB #0b00000000
   3F76 80                  827 	.DB #0b10000000
   3F77 A0                  828 	.DB #0b10100000
   3F78 FC                  829 	.DB #0b11111100
   3F79 FC                  830 	.DB #0b11111100
   3F7A 00                  831 	.DB #0b00000000
   3F7B 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   3F7C 00                  834 	.DB #0b00000000
   3F7D 00                  835 	.DB #0b00000000
   3F7E 00                  836 	.DB #0b00000000
   3F7F A8                  837 	.DB #0b10101000
   3F80 FC                  838 	.DB #0b11111100
   3F81 00                  839 	.DB #0b00000000
   3F82 00                  840 	.DB #0b00000000
   3F83 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   3F84 00                  846 .db #0b00000000
   3F85 54                  847 .db #0b01010100
   3F86 88                  848 .db #0b10001000
   3F87 88                  849 .db #0b10001000
   3F88 A8                  850 .db #0b10101000
   3F89 CC                  851 .db #0b11001100
   3F8A CC                  852 .db #0b11001100
   3F8B 00                  853 .db #0b00000000
   3F8C 00                  854 .db #0b00000000
   3F8D 54                  855 .db #0b01010100
   3F8E 88                  856 .db #0b10001000
   3F8F A8                  857 .db #0b10101000
   3F90 88                  858 .db #0b10001000
   3F91 CC                  859 .db #0b11001100
   3F92 FC                  860 .db #0b11111100
   3F93 00                  861 .db #0b00000000
   3F94 00                  862 .db #0b00000000
   3F95 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   3F96 88                  864 .db #0b10001000
   3F97 80                  865 .db #0b10000000
   3F98 88                  866 .db #0b10001000
   3F99 CC                  867 .db #0b11001100
   3F9A FC                  868 .db #0b11111100
   3F9B 00                  869 .db #0b00000000
   3F9C 00                  870 .db #0b00000000
   3F9D 54                  871 .db #0b01010100
   3F9E 88                  872 .db #0b10001000
   3F9F 88                  873 .db #0b10001000
   3FA0 88                  874 .db #0b10001000
   3FA1 CC                  875 .db #0b11001100
   3FA2 F0                  876 .db #0b11110000
   3FA3 00                  877 .db #0b00000000
   3FA4 00                  878 .db #0b00000000
   3FA5 54                  879 .db #0b01010100
   3FA6 80                  880 .db #0b10000000
   3FA7 A8                  881 .db #0b10101000
   3FA8 80                  882 .db #0b10000000
   3FA9 CC                  883 .db #0b11001100
   3FAA FC                  884 .db #0b11111100
   3FAB 00                  885 .db #0b00000000
   3FAC 00                  886 .db #0b00000000
   3FAD 54                  887 .db #0b01010100
   3FAE 80                  888 .db #0b10000000
   3FAF A8                  889 .db #0b10101000
   3FB0 80                  890 .db #0b10000000
   3FB1 C0                  891 .db #0b11000000
   3FB2 C0                  892 .db #0b11000000
   3FB3 00                  893 .db #0b00000000
   3FB4 00                  894 .db #0b00000000
   3FB5 54                  895 .db #0b01010100
   3FB6 88                  896 .db #0b10001000
   3FB7 80                  897 .db #0b10000000
   3FB8 A8                  898 .db #0b10101000
   3FB9 CC                  899 .db #0b11001100
   3FBA FC                  900 .db #0b11111100
   3FBB 00                  901 .db #0b00000000
   3FBC 00                  902 .db #0b00000000
   3FBD 44                  903 .db #0b01000100
   3FBE 88                  904 .db #0b10001000
   3FBF 88                  905 .db #0b10001000
   3FC0 A8                  906 .db #0b10101000
   3FC1 CC                  907 .db #0b11001100
   3FC2 CC                  908 .db #0b11001100
   3FC3 00                  909 .db #0b00000000
   3FC4 00                  910 .db #0b00000000
   3FC5 54                  911 .db #0b01010100
   3FC6 20                  912 .db #0b00100000
   3FC7 20                  913 .db #0b00100000
   3FC8 20                  914 .db #0b00100000
   3FC9 30                  915 .db #0b00110000
   3FCA FC                  916 .db #0b11111100
   3FCB 00                  917 .db #0b00000000
   3FCC 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   3FCD 54                  919 .db #0b01010100
   3FCE A8                  920 .db #0b10101000
   3FCF 08                  921 .db #0b00001000
   3FD0 08                  922 .db #0b00001000
   3FD1 CC                  923 .db #0b11001100
   3FD2 FC                  924 .db #0b11111100
   3FD3 00                  925 .db #0b00000000
   3FD4 00                  926 .db #0b00000000
   3FD5 44                  927 .db #0b01000100
   3FD6 88                  928 .db #0b10001000
   3FD7 A0                  929 .db #0b10100000
   3FD8 88                  930 .db #0b10001000
   3FD9 CC                  931 .db #0b11001100
   3FDA CC                  932 .db #0b11001100
   3FDB 00                  933 .db #0b00000000
   3FDC 00                  934 .db #0b00000000
   3FDD 40                  935 .db #0b01000000
   3FDE 80                  936 .db #0b10000000
   3FDF 80                  937 .db #0b10000000
   3FE0 80                  938 .db #0b10000000
   3FE1 CC                  939 .db #0b11001100
   3FE2 FC                  940 .db #0b11111100
   3FE3 00                  941 .db #0b00000000
   3FE4 00                  942 .db #0b00000000
   3FE5 54                  943 .db #0b01010100
   3FE6 A8                  944 .db #0b10101000
   3FE7 88                  945 .db #0b10001000
   3FE8 88                  946 .db #0b10001000
   3FE9 CC                  947 .db #0b11001100
   3FEA CC                  948 .db #0b11001100
   3FEB 00                  949 .db #0b00000000
   3FEC 00                  950 .db #0b00000000
   3FED 50                  951 .db #0b01010000
   3FEE 88                  952 .db #0b10001000
   3FEF 88                  953 .db #0b10001000
   3FF0 88                  954 .db #0b10001000
   3FF1 CC                  955 .db #0b11001100
   3FF2 CC                  956 .db #0b11001100
   3FF3 00                  957 .db #0b00000000
   3FF4 00                  958 .db #0b00000000
   3FF5 54                  959 .db #0b01010100
   3FF6 88                  960 .db #0b10001000
   3FF7 88                  961 .db #0b10001000
   3FF8 88                  962 .db #0b10001000
   3FF9 CC                  963 .db #0b11001100
   3FFA FC                  964 .db #0b11111100
   3FFB 00                  965 .db #0b00000000
   3FFC 00                  966 .db #0b00000000
   3FFD 54                  967 .db #0b01010100
   3FFE 88                  968 .db #0b10001000
   3FFF 88                  969 .db #0b10001000
   4000 A8                  970 .db #0b10101000
   4001 C0                  971 .db #0b11000000
   4002 C0                  972 .db #0b11000000
   4003 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4004 00                  974 .db #0b00000000
   4005 54                  975 .db #0b01010100
   4006 88                  976 .db #0b10001000
   4007 88                  977 .db #0b10001000
   4008 88                  978 .db #0b10001000
   4009 FC                  979 .db #0b11111100
   400A FC                  980 .db #0b11111100
   400B 00                  981 .db #0b00000000
   400C 00                  982 .db #0b00000000
   400D 54                  983 .db #0b01010100
   400E 88                  984 .db #0b10001000
   400F 88                  985 .db #0b10001000
   4010 A0                  986 .db #0b10100000
   4011 CC                  987 .db #0b11001100
   4012 CC                  988 .db #0b11001100
   4013 00                  989 .db #0b00000000
   4014 00                  990 .db #0b00000000
   4015 54                  991 .db #0b01010100
   4016 80                  992 .db #0b10000000
   4017 A8                  993 .db #0b10101000
   4018 08                  994 .db #0b00001000
   4019 CC                  995 .db #0b11001100
   401A FC                  996 .db #0b11111100
   401B 00                  997 .db #0b00000000
   401C 00                  998 .db #0b00000000
   401D 54                  999 .db #0b01010100
   401E 20                 1000 .db #0b00100000
   401F 20                 1001 .db #0b00100000
   4020 20                 1002 .db #0b00100000
   4021 30                 1003 .db #0b00110000
   4022 30                 1004 .db #0b00110000
   4023 00                 1005 .db #0b00000000
   4024 00                 1006 .db #0b00000000
   4025 44                 1007 .db #0b01000100
   4026 88                 1008 .db #0b10001000
   4027 88                 1009 .db #0b10001000
   4028 88                 1010 .db #0b10001000
   4029 CC                 1011 .db #0b11001100
   402A FC                 1012 .db #0b11111100
   402B 00                 1013 .db #0b00000000
   402C 00                 1014 .db #0b00000000
   402D 44                 1015 .db #0b01000100
   402E 88                 1016 .db #0b10001000
   402F 88                 1017 .db #0b10001000
   4030 88                 1018 .db #0b10001000
   4031 CC                 1019 .db #0b11001100
   4032 30                 1020 .db #0b00110000
   4033 00                 1021 .db #0b00000000
   4034 00                 1022 .db #0b00000000
   4035 44                 1023 .db #0b01000100
   4036 88                 1024 .db #0b10001000
   4037 88                 1025 .db #0b10001000
   4038 88                 1026 .db #0b10001000
   4039 FC                 1027 .db #0b11111100
   403A CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   403B 00                 1029 .db #0b00000000
   403C 00                 1030 .db #0b00000000
   403D 44                 1031 .db #0b01000100
   403E 88                 1032 .db #0b10001000
   403F A0                 1033 .db #0b10100000
   4040 20                 1034 .db #0b00100000
   4041 CC                 1035 .db #0b11001100
   4042 CC                 1036 .db #0b11001100
   4043 00                 1037 .db #0b00000000
   4044 00                 1038 .db #0b00000000
   4045 44                 1039 .db #0b01000100
   4046 88                 1040 .db #0b10001000
   4047 88                 1041 .db #0b10001000
   4048 20                 1042 .db #0b00100000
   4049 30                 1043 .db #0b00110000
   404A 30                 1044 .db #0b00110000
   404B 00                 1045 .db #0b00000000
   404C 00                 1046 .db #0b00000000
   404D 54                 1047 .db #0b01010100
   404E 08                 1048 .db #0b00001000
   404F 20                 1049 .db #0b00100000
   4050 80                 1050 .db #0b10000000
   4051 CC                 1051 .db #0b11001100
   4052 FC                 1052 .db #0b11111100
   4053 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   4054 03                 1059 	.DB #0b00000011
   4055 0F                 1060 	.DB #0b00001111
   4056 3F                 1061 	.DB #0b00111111
   4057 FF                 1062 	.DB #0b11111111
   4058 3F                 1063 	.DB #0b00111111
   4059 0F                 1064 	.DB #0b00001111
   405A 03                 1065 	.DB #0b00000011
   405B 00                 1066 	.DB #0b00000000
