ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   3B58                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   3B58 32 85 3B      [13]   11 	LD (#inc_ancho+1),A
   3B5B 7D            [ 4]   12 	LD A,L
   3B5C CB 3F         [ 8]   13 	SRL A
   3B5E CB 3F         [ 8]   14 	SRL A
   3B60 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   3B62 57            [ 4]   17 	LD D,A						;D
   3B63 CB 27         [ 8]   18 	SLA A
   3B65 CB 27         [ 8]   19 	SLA A
   3B67 CB 27         [ 8]   20 	SLA A
   3B69 95            [ 4]   21 	SUB L
   3B6A ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   3B6C 5F            [ 4]   24 	LD E,A						;E
   3B6D 6A            [ 4]   25 	LD L,D
   3B6E 26 00         [ 7]   26 	LD H,#0
   3B70 29            [11]   27 	ADD HL,HL
   3B71 01 88 3B      [10]   28 	LD BC,#bloques
   3B74 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   3B75 4E            [ 7]   31 	LD C,(HL)
   3B76 23            [ 6]   32 	INC HL
   3B77 66            [ 7]   33 	LD H,(HL)
   3B78 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   3B79 E5            [11]   36 	PUSH HL
   3B7A 16 00         [ 7]   37 	LD D,#0
   3B7C 21 BA 3B      [10]   38 	LD HL,#sub_bloques
   3B7F 19            [11]   39 	ADD HL,DE
   3B80 7E            [ 7]   40 	LD A,(HL)
   3B81 E1            [10]   41 	POP HL
   3B82 84            [ 4]   42 	ADD H
   3B83 67            [ 4]   43 	LD H,A
   3B84                      44 inc_ancho:
   3B84 1E 00         [ 7]   45 	LD E,#0
   3B86 19            [11]   46 	ADD HL,DE
   3B87 C9            [10]   47 	RET
                             48 
   3B88                      49 bloques:
   3B88 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   3BBA                      51 sub_bloques:
   3BBA 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   3BC2                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   3BC2 DD 21 02 00   [14]   65 	LD IX,#2
   3BC6 DD 39         [15]   66 	ADD IX,SP
   3BC8 DD 6E 02      [19]   67 	LD L,2 (IX)
   3BCB DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   3BCE DD 5E 00      [19]   69    	LD E,0 (IX)
   3BD1 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   3BD4 3E 01         [ 7]   71 	LD A,#1
   3BD6 C3 1D 3C      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   3BD9                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   3BD9 DD 21 02 00   [14]   80 	LD IX,#2
   3BDD DD 39         [15]   81 	ADD IX,SP
   3BDF DD 6E 03      [19]   82  	LD L,3 (IX)
   3BE2 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   3BE5 CD 58 3B      [17]   84 	CALL cpc_GetScrAddress0
   3BE8 DD 5E 00      [19]   85    	LD E,0 (IX)
   3BEB DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   3BEE 3E 01         [ 7]   87 	LD A,#1
   3BF0 C3 1D 3C      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   3BF3                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   3BF3 DD 21 02 00   [14]   94 	LD IX,#2
   3BF7 DD 39         [15]   95 	ADD IX,SP
   3BF9 DD 6E 03      [19]   96  	LD L,3 (IX)
   3BFC DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   3BFF CD 58 3B      [17]   98 	CALL cpc_GetScrAddress0
   3C02 DD 5E 00      [19]   99    	LD E,0 (IX)
   3C05 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   3C08 C3 1D 3C      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   3C0B                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   3C0B DD 21 02 00   [14]  108 	LD IX,#2
   3C0F DD 39         [15]  109 	ADD IX,SP
   3C11 DD 6E 02      [19]  110 	LD L,2 (IX)
   3C14 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   3C17 DD 5E 00      [19]  113    	LD E,0 (IX)
   3C1A DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   3C1D                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   3C1D 32 E3 3C      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   3C20 3A E4 3C      [13]  125 	LD A,(#imprimiendo)
   3C23 FE 01         [ 7]  126 	CP #1
   3C25 CA 42 3C      [10]  127 	JP Z,add_elemento
   3C28 22 E5 3C      [16]  128 	LD (#direcc_destino),HL
   3C2B EB            [ 4]  129 	EX DE,HL
   3C2C CD 98 3C      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   3C2F                     133 bucle_cola_impresion:
   3C2F 3A 88 3C      [13]  134 	LD A,(#elementos_cola)
   3C32 B7            [ 4]  135 	OR A
   3C33 CA 3C 3C      [10]  136 	JP Z,terminar_impresion
   3C36 CD 65 3C      [17]  137 	CALL leer_elemento
   3C39 C3 2F 3C      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   3C3C                     141 terminar_impresion:
   3C3C AF            [ 4]  142 	XOR A
   3C3D 32 E4 3C      [13]  143 	LD (#imprimiendo),A
   3C40 C9            [10]  144 	RET
   3C41                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   3C41 C9            [10]  147 	RET
   3C42                     148 add_elemento:
   3C42 F3            [ 4]  149 	DI
   3C43 DD 2A 8A 3C   [20]  150 	LD IX,(#pos_cola)
   3C47 DD 75 00      [19]  151 	LD 0 (IX),L
   3C4A DD 74 01      [19]  152 	LD 1 (IX),H
   3C4D DD 73 02      [19]  153 	LD 2 (IX),E
   3C50 DD 72 03      [19]  154 	LD 3 (IX),D
   3C53 DD 23         [10]  155 	INC IX
   3C55 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   3C57 DD 23         [10]  157 	INC IX
   3C59 DD 23         [10]  158 	INC IX
   3C5B DD 22 8A 3C   [20]  159 	LD (#pos_cola),IX
                            160 
   3C5F 21 88 3C      [10]  161 	LD HL,#elementos_cola
   3C62 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   3C63 FB            [ 4]  164 	EI
   3C64 C9            [10]  165 	RET
   3C65                     166 leer_elemento:
   3C65 F3            [ 4]  167 	DI
   3C66 DD 2A 8A 3C   [20]  168 	LD IX,(#pos_cola)
   3C6A DD 6E 00      [19]  169 	LD L,0 (IX)
   3C6D DD 66 01      [19]  170 	LD H,1 (IX)
   3C70 DD 5E 02      [19]  171 	LD E,2 (IX)
   3C73 DD 56 04      [19]  172 	LD D,4 (IX)
   3C76 DD 2B         [10]  173 	DEC IX
   3C78 DD 2B         [10]  174 	DEC IX
   3C7A DD 2B         [10]  175 	DEC IX
   3C7C DD 2B         [10]  176 	DEC IX
   3C7E DD 22 8A 3C   [20]  177 	LD (#pos_cola),IX
   3C82 21 88 3C      [10]  178 	LD HL,#elementos_cola
   3C85 35            [11]  179 	DEC (HL)
   3C86 FB            [ 4]  180 	EI
   3C87 C9            [10]  181 	RET
                            182 
   3C88                     183 elementos_cola:
   3C88 00 00               184 	.DW #0				; defw 0
   3C8A                     185 pos_cola:
   3C8A 8C 3C               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   3C8C                     188 cola_impresion:  		; defs 12
   3C8C 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   3C98                     190 bucle_texto0:
   3C98 3E 01         [ 7]  191 	LD A,#1
   3C9A 32 E4 3C      [13]  192 	LD (imprimiendo),A
                            193 
   3C9D 3A 01 3F      [13]  194 	LD A,(first_char)
   3CA0 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   3CA1 7E            [ 7]  197 	LD A,(HL)
   3CA2 B7            [ 4]  198 	OR A ;CP 0
   3CA3 C8            [11]  199 	RET Z
   3CA4 90            [ 4]  200 	SUB B
   3CA5 01 02 3F      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   3CA8 E5            [11]  202 	PUSH HL
                            203 
   3CA9 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   3CAA 26 00         [ 7]  205 	LD H,#0
   3CAC 29            [11]  206 	ADD HL,HL
   3CAD 29            [11]  207 	ADD HL,HL
   3CAE 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3CAF 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3CB0 CD 1B 3D      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   3CB3 3A E3 3C      [13]  211 	LD A,(doble)
   3CB6 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   3CB8 CC 02 3D      [17]  214 	CALL Z, doblar_letra
   3CBB 2A E5 3C      [16]  215 	LD HL,(#direcc_destino)
   3CBE 3A E3 3C      [13]  216 	LD A,(doble)
   3CC1 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   3CC3 28 08         [12]  219 	JR Z,cont_doble
   3CC5 11 D1 3E      [10]  220 	LD DE,#letra_decodificada
   3CC8 FD                  221 	.DB #0xfD
   3CC9 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3CCB 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   3CCD                     226 cont_doble:
   3CCD 11 E1 3E      [10]  227 	LD DE,#letra_decodificada_tmp
   3CD0 FD                  228 	.DB #0xfD
   3CD1 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   3CD3                     231 cont_tot:
   3CD3 CD E7 3C      [17]  232 	CALL cpc_PutSp0
   3CD6 2A E5 3C      [16]  233 	LD HL,(#direcc_destino)
   3CD9 23            [ 6]  234 	INC HL
   3CDA 23            [ 6]  235 	INC HL
   3CDB 22 E5 3C      [16]  236 	LD (#direcc_destino),HL
   3CDE E1            [10]  237 	POP HL
   3CDF 23            [ 6]  238 	INC HL
   3CE0 C3 98 3C      [10]  239 	JP bucle_texto0
                            240 
                            241 
   3CE3                     242 doble:
   3CE3 00                  243 	.DB #0
   3CE4                     244 imprimiendo:
   3CE4 00                  245 	.DB #0
   3CE5                     246 direcc_destino:
   3CE5 00 00               247 	.DW #0
                            248 
                            249 
   3CE7                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3CE7 06 07         [ 7]  253 	LD B,#7
   3CE9 48            [ 4]  254 	LD C,B
   3CEA                     255 loop_alto_2:
                            256 
   3CEA                     257 loop_ancho_2:
   3CEA EB            [ 4]  258 	EX DE,HL
   3CEB ED A0         [16]  259 	LDI
   3CED ED A0         [16]  260 	LDI
   3CEF FD                  261 	.DB #0XFD
   3CF0 25            [ 4]  262 	DEC H
   3CF1 C8            [11]  263 	RET Z
   3CF2 EB            [ 4]  264 	EX DE,HL
   3CF3                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   3CF3 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   3CF5 09            [11]  267 	ADD HL,BC
   3CF6 D2 EA 3C      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   3CF9 01 50 C0      [10]  269 	LD BC,#0XC050
   3CFC 09            [11]  270 	ADD HL,BC
   3CFD 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   3CFF C3 EA 3C      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   3D02                     277 doblar_letra:
   3D02 21 D1 3E      [10]  278 	LD HL,#letra_decodificada
   3D05 11 E1 3E      [10]  279 	LD DE,#letra_decodificada_tmp
   3D08 06 08         [ 7]  280 	LD B,#8
   3D0A                     281 buc_doblar_letra:
   3D0A 7E            [ 7]  282 	LD A,(HL)
   3D0B 23            [ 6]  283 	INC HL
   3D0C 12            [ 7]  284 	LD (DE),A
   3D0D 13            [ 6]  285 	INC DE
   3D0E 13            [ 6]  286 	INC DE
   3D0F 12            [ 7]  287 	LD (DE),A
   3D10 1B            [ 6]  288 	DEC DE
   3D11 7E            [ 7]  289 	LD A,(HL)
   3D12 23            [ 6]  290 	INC HL
   3D13 12            [ 7]  291 	LD (DE),A
   3D14 13            [ 6]  292 	INC DE
   3D15 13            [ 6]  293 	INC DE
   3D16 12            [ 7]  294 	LD (DE),A
   3D17 13            [ 6]  295 	INC DE
   3D18 10 F0         [13]  296 	DJNZ buc_doblar_letra
   3D1A C9            [10]  297 	RET
                            298 
                            299 
   3D1B                     300 escribe_letra:		; Code by Kevin Thacker
   3D1B D5            [11]  301 	PUSH DE
   3D1C FD 21 D1 3E   [14]  302 	LD IY,#letra_decodificada
   3D20 06 08         [ 7]  303 	LD B,#8
   3D22                     304 bucle_alto_letra:
   3D22 C5            [11]  305 	PUSH BC
   3D23 E5            [11]  306 	PUSH HL
   3D24 5E            [ 7]  307 	LD E,(HL)
   3D25 CD 3C 3D      [17]  308 	CALL op_colores
   3D28 FD 72 00      [19]  309 	LD (IY),D
   3D2B FD 23         [10]  310 	INC IY
   3D2D CD 3C 3D      [17]  311 	CALL op_colores
   3D30 FD 72 00      [19]  312 	LD (IY),D
   3D33 FD 23         [10]  313 	INC IY
   3D35 E1            [10]  314 	POP HL
   3D36 23            [ 6]  315 	INC HL
   3D37 C1            [10]  316 	POP BC
   3D38 10 E8         [13]  317 	DJNZ bucle_alto_letra
   3D3A D1            [10]  318 	POP DE
   3D3B C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   3D3C                     321 op_colores:
   3D3C 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   3D3E CD 49 3D      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   3D41 CB 02         [ 8]  324 	RLC D
   3D43 CD 49 3D      [17]  325 	CALL op_colores_pixel
   3D46 CB 0A         [ 8]  326 	RRC D
   3D48 C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   3D49                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   3D49 CB 03         [ 8]  333 	RLC E
   3D4B CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   3D4D 7B            [ 4]  336 	LD A,E
   3D4E E6 03         [ 7]  337 	AND #0X3
   3D50 21 CD 3E      [10]  338 	LD HL,#colores_b0
   3D53 85            [ 4]  339 	ADD A,L
   3D54 6F            [ 4]  340 	LD L,A
   3D55 7C            [ 4]  341 	LD A,H
   3D56 CE 00         [ 7]  342 	ADC A,#0
   3D58 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   3D59 7A            [ 4]  345 	LD A,D
   3D5A B6            [ 7]  346 	OR (HL)
   3D5B 57            [ 4]  347 	LD D,A
   3D5C C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   3D5D                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   3D5D DD 21 02 00   [14]  355 	LD IX,#2
   3D61 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   3D63 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   3D66 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   3D69 21 CD 3E      [10]  363 	LD HL,#colores_b0
   3D6C 06 00         [ 7]  364 	LD B,#0
   3D6E 09            [11]  365 	ADD HL,BC
   3D6F 77            [ 7]  366 	LD (HL),A
   3D70 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   3D71                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   3D71 DD 21 02 00   [14]  377 	LD IX,#2
   3D75 DD 39         [15]  378 	ADD IX,SP
   3D77 DD 6E 03      [19]  379  	LD L,3 (IX)
   3D7A DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   3D7D CD 58 3B      [17]  381 	CALL cpc_GetScrAddress0
   3D80 DD 5E 00      [19]  382    	LD E,0 (IX)
   3D83 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   3D86 AF            [ 4]  384 	XOR A
   3D87 C3 CE 3D      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   3D8A                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   3D8A DD 21 02 00   [14]  392 	LD IX,#2
   3D8E DD 39         [15]  393 	ADD IX,SP
   3D90 DD 6E 03      [19]  394  	LD L,3 (IX)
   3D93 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   3D96 CD 58 3B      [17]  396 	CALL cpc_GetScrAddress0
   3D99 DD 5E 00      [19]  397    	LD E,0 (IX)
   3D9C DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   3D9F 3E 01         [ 7]  399 	LD A,#1
   3DA1 C3 CE 3D      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   3DA4                     407 _cpc_PrintGphStrM12X::
   3DA4 DD 21 02 00   [14]  408 	LD IX,#2
   3DA8 DD 39         [15]  409 	ADD IX,SP
   3DAA DD 6E 02      [19]  410 	LD L,2 (IX)
   3DAD DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   3DB0 DD 5E 00      [19]  412    	LD E,0 (IX)
   3DB3 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   3DB6 3E 01         [ 7]  414 	LD A,#1
                            415 
   3DB8 C3 CE 3D      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   3DBB                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   3DBB DD 21 02 00   [14]  425 	LD IX,#2
   3DBF DD 39         [15]  426 	ADD IX,SP
   3DC1 DD 6E 02      [19]  427 	LD L,2 (IX)
   3DC4 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   3DC7 DD 5E 00      [19]  429    	LD E,0 (IX)
   3DCA DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   3DCD AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   3DCE                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   3DCE 32 37 3E      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   3DD1 3A E4 3C      [13]  442 	LD A,(#imprimiendo)
   3DD4 FE 01         [ 7]  443 	CP #1
   3DD6 CA 42 3C      [10]  444 	JP Z,add_elemento
   3DD9 22 E5 3C      [16]  445 	LD (#direcc_destino),HL
   3DDC EB            [ 4]  446 	EX DE,HL
   3DDD CD ED 3D      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   3DE0                     449 bucle_cola_impresionM1:
   3DE0 3A 88 3C      [13]  450 	LD A,(#elementos_cola)
   3DE3 B7            [ 4]  451 	OR A
   3DE4 CA 3C 3C      [10]  452 	JP Z,terminar_impresion
   3DE7 CD 65 3C      [17]  453 	CALL leer_elemento
   3DEA C3 E0 3D      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   3DED                     460 bucle_texto0M1:
   3DED 3E 01         [ 7]  461 	LD A,#1
   3DEF 32 E4 3C      [13]  462 	LD (#imprimiendo),A
                            463 
   3DF2 3A 01 3F      [13]  464 	LD A,(#first_char)
   3DF5 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   3DF6 7E            [ 7]  466 	LD A,(HL)
   3DF7 B7            [ 4]  467 	OR A ;CP 0
   3DF8 C8            [11]  468 	RET Z
   3DF9 90            [ 4]  469 	SUB B
   3DFA 01 02 3F      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   3DFD E5            [11]  471 	PUSH HL
   3DFE 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   3DFF 26 00         [ 7]  473 	LD H,#0
   3E01 29            [11]  474 	ADD HL,HL
   3E02 29            [11]  475 	ADD HL,HL
   3E03 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3E04 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3E05 CD 62 3E      [17]  478 	CALL escribe_letraM1
   3E08 3A 37 3E      [13]  479 	LD A,(dobleM1)
   3E0B FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   3E0D CC 38 3E      [17]  482 	CALL Z, doblar_letraM1
   3E10 2A E5 3C      [16]  483 	LD HL,(direcc_destino)
   3E13 3A 37 3E      [13]  484 	LD A,(dobleM1)
   3E16 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   3E18 28 08         [12]  487 	JR Z,cont_dobleM1
   3E1A 11 D1 3E      [10]  488 	LD DE,#letra_decodificada
   3E1D FD                  489 	.DB #0xfD
   3E1E 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E20 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   3E22                     494 cont_dobleM1:
   3E22 11 E1 3E      [10]  495 	LD DE,#letra_decodificada_tmp
   3E25 FD                  496 	.DB #0XFD
   3E26 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E28                     498 cont_totM1:
   3E28 CD 49 3E      [17]  499 	CALL cpc_PutSp0M1
   3E2B 2A E5 3C      [16]  500 	LD HL,(#direcc_destino)
   3E2E 23            [ 6]  501 	INC HL
   3E2F 22 E5 3C      [16]  502 	LD (#direcc_destino),HL
   3E32 E1            [10]  503 	POP HL
   3E33 23            [ 6]  504 	INC HL
   3E34 C3 ED 3D      [10]  505 	JP bucle_texto0M1
                            506 
   3E37                     507 dobleM1:
   3E37 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   3E38                     512 doblar_letraM1:
   3E38 21 D1 3E      [10]  513 	LD HL,#letra_decodificada
   3E3B 11 E1 3E      [10]  514 	LD DE,#letra_decodificada_tmp
   3E3E 06 08         [ 7]  515 	LD B,#8
   3E40                     516 buc_doblar_letraM1:
   3E40 7E            [ 7]  517 	LD A,(HL)
   3E41 23            [ 6]  518 	INC HL
   3E42 12            [ 7]  519 	LD (DE),A
   3E43 13            [ 6]  520 	INC DE
   3E44 12            [ 7]  521 	LD (DE),A
   3E45 13            [ 6]  522 	INC DE
   3E46 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   3E48 C9            [10]  524 	RET
                            525 
                            526 
   3E49                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3E49 06 07         [ 7]  530 	LD B,#7
   3E4B 48            [ 4]  531 	LD C,B
   3E4C                     532 loop_alto_2M1:
   3E4C                     533 loop_ancho_2M1:
   3E4C EB            [ 4]  534 	EX DE,HL
   3E4D ED A0         [16]  535 	LDI
   3E4F FD                  536 	.DB #0XFD
   3E50 25            [ 4]  537 	DEC H
   3E51 C8            [11]  538 	RET Z
   3E52 EB            [ 4]  539 	EX DE,HL
   3E53                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   3E53 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   3E55 09            [11]  542 	ADD HL,BC
   3E56 D2 4C 3E      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   3E59 01 50 C0      [10]  544 	LD BC,#0XC050
   3E5C 09            [11]  545 	ADD HL,BC
   3E5D 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   3E5F C3 4C 3E      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   3E62                     551 escribe_letraM1:
   3E62 FD 21 D1 3E   [14]  552 	LD IY,#letra_decodificada
   3E66 06 08         [ 7]  553 	LD B,#8
   3E68 DD 21 CA 3E   [14]  554 	LD IX,#byte_tmp
   3E6C                     555 bucle_altoM1:
   3E6C C5            [11]  556 	PUSH BC
   3E6D E5            [11]  557 	PUSH HL
                            558 
   3E6E 7E            [ 7]  559 	LD A,(HL)
   3E6F 21 C9 3E      [10]  560 	LD HL,#dato
   3E72 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   3E73 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   3E77 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   3E79                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   3E79 E5            [11]  570 	PUSH HL
   3E7A CD 92 3E      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   3E7D E1            [10]  572 	POP HL
   3E7E CB 3E         [15]  573 	SRL (HL)
   3E80 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   3E82 10 F5         [13]  575 	DJNZ bucle_coloresM1
   3E84 DD 7E 00      [19]  576 	LD A,(IX)
   3E87 FD 77 00      [19]  577 	LD (IY),A
   3E8A FD 23         [10]  578 	INC IY
   3E8C E1            [10]  579 	POP HL
   3E8D 23            [ 6]  580 	INC HL
   3E8E C1            [10]  581 	POP BC
   3E8F 10 DB         [13]  582 	DJNZ bucle_altoM1
   3E91 C9            [10]  583 	RET
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
   3E92                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   3E92 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   3E94 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   3E95 21 C5 3E      [10]  610 	LD HL,#colores_m1
   3E98 5F            [ 4]  611 	LD E,A
   3E99 16 00         [ 7]  612 	LD D,#0
   3E9B 19            [11]  613 	ADD HL,DE
   3E9C 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   3E9D 78            [ 4]  618 	LD A,B
   3E9E 3D            [ 4]  619 	DEC A
   3E9F B7            [ 4]  620 	OR A ;CP 0
   3EA0 CA A9 3E      [10]  621 	JP Z,_sin_rotar
   3EA3                     622 rotando:
   3EA3 CB 39         [ 8]  623 	SRL C
   3EA5 3D            [ 4]  624 	DEC A
   3EA6 C2 A3 3E      [10]  625 	JP NZ, rotando
   3EA9                     626 _sin_rotar:
   3EA9 79            [ 4]  627 	LD A,C
   3EAA DD B6 00      [19]  628 	OR (IX)
   3EAD DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   3EB0 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   3EB1                     636 _cpc_SetInkGphStrM1::
   3EB1 DD 21 02 00   [14]  637 	LD IX,#2
   3EB5 DD 39         [15]  638 	ADD IX,SP
   3EB7 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   3EBA DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   3EBD 21 C5 3E      [10]  641 	LD HL,#colores_cambM1
   3EC0 06 00         [ 7]  642 	LD B,#0
   3EC2 09            [11]  643 	ADD HL,BC
   3EC3 77            [ 7]  644 	LD (HL),A
   3EC4 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   3EC5                     649 colores_cambM1:
   3EC5                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   3EC5 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   3EC9                     663 dato:
   3EC9 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   3ECA                     666 byte_tmp:
   3ECA 00                  667 	.DB #0
   3ECB 00                  668 	.DB #0
   3ECC 00                  669 	.DB #0  ;defs 3
   3ECD                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   3ECD 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   3ED1                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   3ED1 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3ED9 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EE1                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   3EE1 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EE9 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EF1 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3EF9 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   3F01                     685 first_char:
   3F01 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   3F02                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   3F02 01                  690 	.DB #0b00000001
   3F03 01                  691 	.DB #0b00000001
   3F04 08                  692 	.DB #0b00001000
   3F05 08                  693 	.DB #0b00001000
   3F06 3C                  694 	.DB #0b00111100
   3F07 30                  695 	.DB #0b00110000
   3F08 30                  696 	.DB #0b00110000
   3F09 00                  697 	.DB #0b00000000
                            698 ;0-9
   3F0A 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   3F0B 44                  700 .db #0b01000100
   3F0C 88                  701 .db #0b10001000
   3F0D 88                  702 .db #0b10001000
   3F0E 88                  703 .db #0b10001000
   3F0F CC                  704 .db #0b11001100
   3F10 FC                  705 .db #0b11111100
   3F11 00                  706 .db #0b00000000
   3F12 10                  707 .db #0b00010000
   3F13 50                  708 .db #0b01010000
   3F14 20                  709 .db #0b00100000
   3F15 20                  710 .db #0b00100000
   3F16 20                  711 .db #0b00100000
   3F17 30                  712 .db #0b00110000
   3F18 FC                  713 .db #0b11111100
   3F19 00                  714 .db #0b00000000
   3F1A 54                  715 .db #0b01010100
   3F1B 44                  716 .db #0b01000100
   3F1C 08                  717 .db #0b00001000
   3F1D A8                  718 .db #0b10101000
   3F1E 80                  719 .db #0b10000000
   3F1F CC                  720 .db #0b11001100
   3F20 FC                  721 .db #0b11111100
   3F21 00                  722 .db #0b00000000
   3F22 54                  723 .db #0b01010100
   3F23 44                  724 .db #0b01000100
   3F24 08                  725 .db #0b00001000
   3F25 28                  726 .db #0b00101000
   3F26 08                  727 .db #0b00001000
   3F27 CC                  728 .db #0b11001100
   3F28 FC                  729 .db #0b11111100
   3F29 00                  730 .db #0b00000000
   3F2A 44                  731 .db #0b01000100
   3F2B 44                  732 .db #0b01000100
   3F2C 88                  733 .db #0b10001000
   3F2D A8                  734 .db #0b10101000
   3F2E 08                  735 .db #0b00001000
   3F2F 0C                  736 .db #0b00001100
   3F30 0C                  737 .db #0b00001100
   3F31 00                  738 .db #0b00000000
   3F32 54                  739 .db #0b01010100
   3F33 44                  740 .db #0b01000100
   3F34 80                  741 .db #0b10000000
   3F35 A8                  742 .db #0b10101000
   3F36 08                  743 .db #0b00001000
   3F37 CC                  744 .db #0b11001100
   3F38 FC                  745 .db #0b11111100
   3F39 00                  746 .db #0b00000000
   3F3A 54                  747 .db #0b01010100
   3F3B 44                  748 .db #0b01000100
   3F3C 80                  749 .db #0b10000000
   3F3D A8                  750 .db #0b10101000
   3F3E 88                  751 .db #0b10001000
   3F3F CC                  752 .db #0b11001100
   3F40 FC                  753 .db #0b11111100
   3F41 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   3F42 54                  755 .db #0b01010100
   3F43 44                  756 .db #0b01000100
   3F44 08                  757 .db #0b00001000
   3F45 08                  758 .db #0b00001000
   3F46 20                  759 .db #0b00100000
   3F47 30                  760 .db #0b00110000
   3F48 30                  761 .db #0b00110000
   3F49 00                  762 .db #0b00000000
   3F4A 54                  763 .db #0b01010100
   3F4B 44                  764 .db #0b01000100
   3F4C 88                  765 .db #0b10001000
   3F4D A8                  766 .db #0b10101000
   3F4E 88                  767 .db #0b10001000
   3F4F CC                  768 .db #0b11001100
   3F50 FC                  769 .db #0b11111100
   3F51 00                  770 .db #0b00000000
   3F52 54                  771 .db #0b01010100
   3F53 44                  772 .db #0b01000100
   3F54 88                  773 .db #0b10001000
   3F55 A8                  774 .db #0b10101000
   3F56 08                  775 .db #0b00001000
   3F57 CC                  776 .db #0b11001100
   3F58 FC                  777 .db #0b11111100
   3F59 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   3F5A 00                  786 	.DB #0b00000000
   3F5B 00                  787 	.DB #0b00000000
   3F5C 20                  788 	.DB #0b00100000
   3F5D 00                  789 	.DB #0b00000000
   3F5E 30                  790 	.DB #0b00110000
   3F5F 00                  791 	.DB #0b00000000
   3F60 00                  792 	.DB #0b00000000
   3F61 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   3F62 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   3F6A 00                  797 	.DB #0b00000000
   3F6B 00                  798 	.DB #0b00000000
   3F6C 00                  799 	.DB #0b00000000
   3F6D 00                  800 	.DB #0b00000000
   3F6E 00                  801 	.DB #0b00000000
   3F6F 00                  802 	.DB #0b00000000
   3F70 C0                  803 	.DB #0b11000000
   3F71 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   3F72 00                  806 .db #0b00000000
   3F73 54                  807 .db #0b01010100
   3F74 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   3F75 A0                  809 .db #0b10100000
   3F76 88                  810 .db #0b10001000
   3F77 CC                  811 .db #0b11001100
   3F78 CC                  812 .db #0b11001100
   3F79 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   3F7A 00                  816 	.DB #0b00000000
   3F7B 10                  817 	.DB #0b00010000
   3F7C 20                  818 	.DB #0b00100000
   3F7D 20                  819 	.DB #0b00100000
   3F7E 30                  820 	.DB #0b00110000
   3F7F 00                  821 	.DB #0b00000000
   3F80 30                  822 	.DB #0b00110000
   3F81 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   3F82 00                  825 	.DB #0b00000000
   3F83 00                  826 	.DB #0b00000000
   3F84 80                  827 	.DB #0b10000000
   3F85 A0                  828 	.DB #0b10100000
   3F86 FC                  829 	.DB #0b11111100
   3F87 FC                  830 	.DB #0b11111100
   3F88 00                  831 	.DB #0b00000000
   3F89 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   3F8A 00                  834 	.DB #0b00000000
   3F8B 00                  835 	.DB #0b00000000
   3F8C 00                  836 	.DB #0b00000000
   3F8D A8                  837 	.DB #0b10101000
   3F8E FC                  838 	.DB #0b11111100
   3F8F 00                  839 	.DB #0b00000000
   3F90 00                  840 	.DB #0b00000000
   3F91 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   3F92 00                  846 .db #0b00000000
   3F93 54                  847 .db #0b01010100
   3F94 88                  848 .db #0b10001000
   3F95 88                  849 .db #0b10001000
   3F96 A8                  850 .db #0b10101000
   3F97 CC                  851 .db #0b11001100
   3F98 CC                  852 .db #0b11001100
   3F99 00                  853 .db #0b00000000
   3F9A 00                  854 .db #0b00000000
   3F9B 54                  855 .db #0b01010100
   3F9C 88                  856 .db #0b10001000
   3F9D A8                  857 .db #0b10101000
   3F9E 88                  858 .db #0b10001000
   3F9F CC                  859 .db #0b11001100
   3FA0 FC                  860 .db #0b11111100
   3FA1 00                  861 .db #0b00000000
   3FA2 00                  862 .db #0b00000000
   3FA3 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   3FA4 88                  864 .db #0b10001000
   3FA5 80                  865 .db #0b10000000
   3FA6 88                  866 .db #0b10001000
   3FA7 CC                  867 .db #0b11001100
   3FA8 FC                  868 .db #0b11111100
   3FA9 00                  869 .db #0b00000000
   3FAA 00                  870 .db #0b00000000
   3FAB 54                  871 .db #0b01010100
   3FAC 88                  872 .db #0b10001000
   3FAD 88                  873 .db #0b10001000
   3FAE 88                  874 .db #0b10001000
   3FAF CC                  875 .db #0b11001100
   3FB0 F0                  876 .db #0b11110000
   3FB1 00                  877 .db #0b00000000
   3FB2 00                  878 .db #0b00000000
   3FB3 54                  879 .db #0b01010100
   3FB4 80                  880 .db #0b10000000
   3FB5 A8                  881 .db #0b10101000
   3FB6 80                  882 .db #0b10000000
   3FB7 CC                  883 .db #0b11001100
   3FB8 FC                  884 .db #0b11111100
   3FB9 00                  885 .db #0b00000000
   3FBA 00                  886 .db #0b00000000
   3FBB 54                  887 .db #0b01010100
   3FBC 80                  888 .db #0b10000000
   3FBD A8                  889 .db #0b10101000
   3FBE 80                  890 .db #0b10000000
   3FBF C0                  891 .db #0b11000000
   3FC0 C0                  892 .db #0b11000000
   3FC1 00                  893 .db #0b00000000
   3FC2 00                  894 .db #0b00000000
   3FC3 54                  895 .db #0b01010100
   3FC4 88                  896 .db #0b10001000
   3FC5 80                  897 .db #0b10000000
   3FC6 A8                  898 .db #0b10101000
   3FC7 CC                  899 .db #0b11001100
   3FC8 FC                  900 .db #0b11111100
   3FC9 00                  901 .db #0b00000000
   3FCA 00                  902 .db #0b00000000
   3FCB 44                  903 .db #0b01000100
   3FCC 88                  904 .db #0b10001000
   3FCD 88                  905 .db #0b10001000
   3FCE A8                  906 .db #0b10101000
   3FCF CC                  907 .db #0b11001100
   3FD0 CC                  908 .db #0b11001100
   3FD1 00                  909 .db #0b00000000
   3FD2 00                  910 .db #0b00000000
   3FD3 54                  911 .db #0b01010100
   3FD4 20                  912 .db #0b00100000
   3FD5 20                  913 .db #0b00100000
   3FD6 20                  914 .db #0b00100000
   3FD7 30                  915 .db #0b00110000
   3FD8 FC                  916 .db #0b11111100
   3FD9 00                  917 .db #0b00000000
   3FDA 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   3FDB 54                  919 .db #0b01010100
   3FDC A8                  920 .db #0b10101000
   3FDD 08                  921 .db #0b00001000
   3FDE 08                  922 .db #0b00001000
   3FDF CC                  923 .db #0b11001100
   3FE0 FC                  924 .db #0b11111100
   3FE1 00                  925 .db #0b00000000
   3FE2 00                  926 .db #0b00000000
   3FE3 44                  927 .db #0b01000100
   3FE4 88                  928 .db #0b10001000
   3FE5 A0                  929 .db #0b10100000
   3FE6 88                  930 .db #0b10001000
   3FE7 CC                  931 .db #0b11001100
   3FE8 CC                  932 .db #0b11001100
   3FE9 00                  933 .db #0b00000000
   3FEA 00                  934 .db #0b00000000
   3FEB 40                  935 .db #0b01000000
   3FEC 80                  936 .db #0b10000000
   3FED 80                  937 .db #0b10000000
   3FEE 80                  938 .db #0b10000000
   3FEF CC                  939 .db #0b11001100
   3FF0 FC                  940 .db #0b11111100
   3FF1 00                  941 .db #0b00000000
   3FF2 00                  942 .db #0b00000000
   3FF3 54                  943 .db #0b01010100
   3FF4 A8                  944 .db #0b10101000
   3FF5 88                  945 .db #0b10001000
   3FF6 88                  946 .db #0b10001000
   3FF7 CC                  947 .db #0b11001100
   3FF8 CC                  948 .db #0b11001100
   3FF9 00                  949 .db #0b00000000
   3FFA 00                  950 .db #0b00000000
   3FFB 50                  951 .db #0b01010000
   3FFC 88                  952 .db #0b10001000
   3FFD 88                  953 .db #0b10001000
   3FFE 88                  954 .db #0b10001000
   3FFF CC                  955 .db #0b11001100
   4000 CC                  956 .db #0b11001100
   4001 00                  957 .db #0b00000000
   4002 00                  958 .db #0b00000000
   4003 54                  959 .db #0b01010100
   4004 88                  960 .db #0b10001000
   4005 88                  961 .db #0b10001000
   4006 88                  962 .db #0b10001000
   4007 CC                  963 .db #0b11001100
   4008 FC                  964 .db #0b11111100
   4009 00                  965 .db #0b00000000
   400A 00                  966 .db #0b00000000
   400B 54                  967 .db #0b01010100
   400C 88                  968 .db #0b10001000
   400D 88                  969 .db #0b10001000
   400E A8                  970 .db #0b10101000
   400F C0                  971 .db #0b11000000
   4010 C0                  972 .db #0b11000000
   4011 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4012 00                  974 .db #0b00000000
   4013 54                  975 .db #0b01010100
   4014 88                  976 .db #0b10001000
   4015 88                  977 .db #0b10001000
   4016 88                  978 .db #0b10001000
   4017 FC                  979 .db #0b11111100
   4018 FC                  980 .db #0b11111100
   4019 00                  981 .db #0b00000000
   401A 00                  982 .db #0b00000000
   401B 54                  983 .db #0b01010100
   401C 88                  984 .db #0b10001000
   401D 88                  985 .db #0b10001000
   401E A0                  986 .db #0b10100000
   401F CC                  987 .db #0b11001100
   4020 CC                  988 .db #0b11001100
   4021 00                  989 .db #0b00000000
   4022 00                  990 .db #0b00000000
   4023 54                  991 .db #0b01010100
   4024 80                  992 .db #0b10000000
   4025 A8                  993 .db #0b10101000
   4026 08                  994 .db #0b00001000
   4027 CC                  995 .db #0b11001100
   4028 FC                  996 .db #0b11111100
   4029 00                  997 .db #0b00000000
   402A 00                  998 .db #0b00000000
   402B 54                  999 .db #0b01010100
   402C 20                 1000 .db #0b00100000
   402D 20                 1001 .db #0b00100000
   402E 20                 1002 .db #0b00100000
   402F 30                 1003 .db #0b00110000
   4030 30                 1004 .db #0b00110000
   4031 00                 1005 .db #0b00000000
   4032 00                 1006 .db #0b00000000
   4033 44                 1007 .db #0b01000100
   4034 88                 1008 .db #0b10001000
   4035 88                 1009 .db #0b10001000
   4036 88                 1010 .db #0b10001000
   4037 CC                 1011 .db #0b11001100
   4038 FC                 1012 .db #0b11111100
   4039 00                 1013 .db #0b00000000
   403A 00                 1014 .db #0b00000000
   403B 44                 1015 .db #0b01000100
   403C 88                 1016 .db #0b10001000
   403D 88                 1017 .db #0b10001000
   403E 88                 1018 .db #0b10001000
   403F CC                 1019 .db #0b11001100
   4040 30                 1020 .db #0b00110000
   4041 00                 1021 .db #0b00000000
   4042 00                 1022 .db #0b00000000
   4043 44                 1023 .db #0b01000100
   4044 88                 1024 .db #0b10001000
   4045 88                 1025 .db #0b10001000
   4046 88                 1026 .db #0b10001000
   4047 FC                 1027 .db #0b11111100
   4048 CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   4049 00                 1029 .db #0b00000000
   404A 00                 1030 .db #0b00000000
   404B 44                 1031 .db #0b01000100
   404C 88                 1032 .db #0b10001000
   404D A0                 1033 .db #0b10100000
   404E 20                 1034 .db #0b00100000
   404F CC                 1035 .db #0b11001100
   4050 CC                 1036 .db #0b11001100
   4051 00                 1037 .db #0b00000000
   4052 00                 1038 .db #0b00000000
   4053 44                 1039 .db #0b01000100
   4054 88                 1040 .db #0b10001000
   4055 88                 1041 .db #0b10001000
   4056 20                 1042 .db #0b00100000
   4057 30                 1043 .db #0b00110000
   4058 30                 1044 .db #0b00110000
   4059 00                 1045 .db #0b00000000
   405A 00                 1046 .db #0b00000000
   405B 54                 1047 .db #0b01010100
   405C 08                 1048 .db #0b00001000
   405D 20                 1049 .db #0b00100000
   405E 80                 1050 .db #0b10000000
   405F CC                 1051 .db #0b11001100
   4060 FC                 1052 .db #0b11111100
   4061 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   4062 03                 1059 	.DB #0b00000011
   4063 0F                 1060 	.DB #0b00001111
   4064 3F                 1061 	.DB #0b00111111
   4065 FF                 1062 	.DB #0b11111111
   4066 3F                 1063 	.DB #0b00111111
   4067 0F                 1064 	.DB #0b00001111
   4068 03                 1065 	.DB #0b00000011
   4069 00                 1066 	.DB #0b00000000
