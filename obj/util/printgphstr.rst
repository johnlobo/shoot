ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   2CF5                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   2CF5 32 22 2D      [13]   11 	LD (#inc_ancho+1),A
   2CF8 7D            [ 4]   12 	LD A,L
   2CF9 CB 3F         [ 8]   13 	SRL A
   2CFB CB 3F         [ 8]   14 	SRL A
   2CFD CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   2CFF 57            [ 4]   17 	LD D,A						;D
   2D00 CB 27         [ 8]   18 	SLA A
   2D02 CB 27         [ 8]   19 	SLA A
   2D04 CB 27         [ 8]   20 	SLA A
   2D06 95            [ 4]   21 	SUB L
   2D07 ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   2D09 5F            [ 4]   24 	LD E,A						;E
   2D0A 6A            [ 4]   25 	LD L,D
   2D0B 26 00         [ 7]   26 	LD H,#0
   2D0D 29            [11]   27 	ADD HL,HL
   2D0E 01 25 2D      [10]   28 	LD BC,#bloques
   2D11 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   2D12 4E            [ 7]   31 	LD C,(HL)
   2D13 23            [ 6]   32 	INC HL
   2D14 66            [ 7]   33 	LD H,(HL)
   2D15 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   2D16 E5            [11]   36 	PUSH HL
   2D17 16 00         [ 7]   37 	LD D,#0
   2D19 21 57 2D      [10]   38 	LD HL,#sub_bloques
   2D1C 19            [11]   39 	ADD HL,DE
   2D1D 7E            [ 7]   40 	LD A,(HL)
   2D1E E1            [10]   41 	POP HL
   2D1F 84            [ 4]   42 	ADD H
   2D20 67            [ 4]   43 	LD H,A
   2D21                      44 inc_ancho:
   2D21 1E 00         [ 7]   45 	LD E,#0
   2D23 19            [11]   46 	ADD HL,DE
   2D24 C9            [10]   47 	RET
                             48 
   2D25                      49 bloques:
   2D25 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   2D57                      51 sub_bloques:
   2D57 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   2D5F                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   2D5F DD 21 02 00   [14]   65 	LD IX,#2
   2D63 DD 39         [15]   66 	ADD IX,SP
   2D65 DD 6E 02      [19]   67 	LD L,2 (IX)
   2D68 DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   2D6B DD 5E 00      [19]   69    	LD E,0 (IX)
   2D6E DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   2D71 3E 01         [ 7]   71 	LD A,#1
   2D73 C3 BA 2D      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   2D76                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   2D76 DD 21 02 00   [14]   80 	LD IX,#2
   2D7A DD 39         [15]   81 	ADD IX,SP
   2D7C DD 6E 03      [19]   82  	LD L,3 (IX)
   2D7F DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   2D82 CD F5 2C      [17]   84 	CALL cpc_GetScrAddress0
   2D85 DD 5E 00      [19]   85    	LD E,0 (IX)
   2D88 DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   2D8B 3E 01         [ 7]   87 	LD A,#1
   2D8D C3 BA 2D      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   2D90                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   2D90 DD 21 02 00   [14]   94 	LD IX,#2
   2D94 DD 39         [15]   95 	ADD IX,SP
   2D96 DD 6E 03      [19]   96  	LD L,3 (IX)
   2D99 DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   2D9C CD F5 2C      [17]   98 	CALL cpc_GetScrAddress0
   2D9F DD 5E 00      [19]   99    	LD E,0 (IX)
   2DA2 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   2DA5 C3 BA 2D      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   2DA8                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   2DA8 DD 21 02 00   [14]  108 	LD IX,#2
   2DAC DD 39         [15]  109 	ADD IX,SP
   2DAE DD 6E 02      [19]  110 	LD L,2 (IX)
   2DB1 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   2DB4 DD 5E 00      [19]  113    	LD E,0 (IX)
   2DB7 DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   2DBA                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   2DBA 32 80 2E      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   2DBD 3A 81 2E      [13]  125 	LD A,(#imprimiendo)
   2DC0 FE 01         [ 7]  126 	CP #1
   2DC2 CA DF 2D      [10]  127 	JP Z,add_elemento
   2DC5 22 82 2E      [16]  128 	LD (#direcc_destino),HL
   2DC8 EB            [ 4]  129 	EX DE,HL
   2DC9 CD 35 2E      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   2DCC                     133 bucle_cola_impresion:
   2DCC 3A 25 2E      [13]  134 	LD A,(#elementos_cola)
   2DCF B7            [ 4]  135 	OR A
   2DD0 CA D9 2D      [10]  136 	JP Z,terminar_impresion
   2DD3 CD 02 2E      [17]  137 	CALL leer_elemento
   2DD6 C3 CC 2D      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   2DD9                     141 terminar_impresion:
   2DD9 AF            [ 4]  142 	XOR A
   2DDA 32 81 2E      [13]  143 	LD (#imprimiendo),A
   2DDD C9            [10]  144 	RET
   2DDE                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   2DDE C9            [10]  147 	RET
   2DDF                     148 add_elemento:
   2DDF F3            [ 4]  149 	DI
   2DE0 DD 2A 27 2E   [20]  150 	LD IX,(#pos_cola)
   2DE4 DD 75 00      [19]  151 	LD 0 (IX),L
   2DE7 DD 74 01      [19]  152 	LD 1 (IX),H
   2DEA DD 73 02      [19]  153 	LD 2 (IX),E
   2DED DD 72 03      [19]  154 	LD 3 (IX),D
   2DF0 DD 23         [10]  155 	INC IX
   2DF2 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   2DF4 DD 23         [10]  157 	INC IX
   2DF6 DD 23         [10]  158 	INC IX
   2DF8 DD 22 27 2E   [20]  159 	LD (#pos_cola),IX
                            160 
   2DFC 21 25 2E      [10]  161 	LD HL,#elementos_cola
   2DFF 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   2E00 FB            [ 4]  164 	EI
   2E01 C9            [10]  165 	RET
   2E02                     166 leer_elemento:
   2E02 F3            [ 4]  167 	DI
   2E03 DD 2A 27 2E   [20]  168 	LD IX,(#pos_cola)
   2E07 DD 6E 00      [19]  169 	LD L,0 (IX)
   2E0A DD 66 01      [19]  170 	LD H,1 (IX)
   2E0D DD 5E 02      [19]  171 	LD E,2 (IX)
   2E10 DD 56 04      [19]  172 	LD D,4 (IX)
   2E13 DD 2B         [10]  173 	DEC IX
   2E15 DD 2B         [10]  174 	DEC IX
   2E17 DD 2B         [10]  175 	DEC IX
   2E19 DD 2B         [10]  176 	DEC IX
   2E1B DD 22 27 2E   [20]  177 	LD (#pos_cola),IX
   2E1F 21 25 2E      [10]  178 	LD HL,#elementos_cola
   2E22 35            [11]  179 	DEC (HL)
   2E23 FB            [ 4]  180 	EI
   2E24 C9            [10]  181 	RET
                            182 
   2E25                     183 elementos_cola:
   2E25 00 00               184 	.DW #0				; defw 0
   2E27                     185 pos_cola:
   2E27 29 2E               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   2E29                     188 cola_impresion:  		; defs 12
   2E29 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   2E35                     190 bucle_texto0:
   2E35 3E 01         [ 7]  191 	LD A,#1
   2E37 32 81 2E      [13]  192 	LD (imprimiendo),A
                            193 
   2E3A 3A 9E 30      [13]  194 	LD A,(first_char)
   2E3D 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   2E3E 7E            [ 7]  197 	LD A,(HL)
   2E3F B7            [ 4]  198 	OR A ;CP 0
   2E40 C8            [11]  199 	RET Z
   2E41 90            [ 4]  200 	SUB B
   2E42 01 9F 30      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   2E45 E5            [11]  202 	PUSH HL
                            203 
   2E46 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   2E47 26 00         [ 7]  205 	LD H,#0
   2E49 29            [11]  206 	ADD HL,HL
   2E4A 29            [11]  207 	ADD HL,HL
   2E4B 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   2E4C 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   2E4D CD B8 2E      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   2E50 3A 80 2E      [13]  211 	LD A,(doble)
   2E53 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   2E55 CC 9F 2E      [17]  214 	CALL Z, doblar_letra
   2E58 2A 82 2E      [16]  215 	LD HL,(#direcc_destino)
   2E5B 3A 80 2E      [13]  216 	LD A,(doble)
   2E5E FE 01         [ 7]  217 	CP #1
                            218 	;alto
   2E60 28 08         [12]  219 	JR Z,cont_doble
   2E62 11 6E 30      [10]  220 	LD DE,#letra_decodificada
   2E65 FD                  221 	.DB #0xfD
   2E66 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2E68 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   2E6A                     226 cont_doble:
   2E6A 11 7E 30      [10]  227 	LD DE,#letra_decodificada_tmp
   2E6D FD                  228 	.DB #0xfD
   2E6E 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   2E70                     231 cont_tot:
   2E70 CD 84 2E      [17]  232 	CALL cpc_PutSp0
   2E73 2A 82 2E      [16]  233 	LD HL,(#direcc_destino)
   2E76 23            [ 6]  234 	INC HL
   2E77 23            [ 6]  235 	INC HL
   2E78 22 82 2E      [16]  236 	LD (#direcc_destino),HL
   2E7B E1            [10]  237 	POP HL
   2E7C 23            [ 6]  238 	INC HL
   2E7D C3 35 2E      [10]  239 	JP bucle_texto0
                            240 
                            241 
   2E80                     242 doble:
   2E80 00                  243 	.DB #0
   2E81                     244 imprimiendo:
   2E81 00                  245 	.DB #0
   2E82                     246 direcc_destino:
   2E82 00 00               247 	.DW #0
                            248 
                            249 
   2E84                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2E84 06 07         [ 7]  253 	LD B,#7
   2E86 48            [ 4]  254 	LD C,B
   2E87                     255 loop_alto_2:
                            256 
   2E87                     257 loop_ancho_2:
   2E87 EB            [ 4]  258 	EX DE,HL
   2E88 ED A0         [16]  259 	LDI
   2E8A ED A0         [16]  260 	LDI
   2E8C FD                  261 	.DB #0XFD
   2E8D 25            [ 4]  262 	DEC H
   2E8E C8            [11]  263 	RET Z
   2E8F EB            [ 4]  264 	EX DE,HL
   2E90                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   2E90 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   2E92 09            [11]  267 	ADD HL,BC
   2E93 D2 87 2E      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   2E96 01 50 C0      [10]  269 	LD BC,#0XC050
   2E99 09            [11]  270 	ADD HL,BC
   2E9A 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   2E9C C3 87 2E      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   2E9F                     277 doblar_letra:
   2E9F 21 6E 30      [10]  278 	LD HL,#letra_decodificada
   2EA2 11 7E 30      [10]  279 	LD DE,#letra_decodificada_tmp
   2EA5 06 08         [ 7]  280 	LD B,#8
   2EA7                     281 buc_doblar_letra:
   2EA7 7E            [ 7]  282 	LD A,(HL)
   2EA8 23            [ 6]  283 	INC HL
   2EA9 12            [ 7]  284 	LD (DE),A
   2EAA 13            [ 6]  285 	INC DE
   2EAB 13            [ 6]  286 	INC DE
   2EAC 12            [ 7]  287 	LD (DE),A
   2EAD 1B            [ 6]  288 	DEC DE
   2EAE 7E            [ 7]  289 	LD A,(HL)
   2EAF 23            [ 6]  290 	INC HL
   2EB0 12            [ 7]  291 	LD (DE),A
   2EB1 13            [ 6]  292 	INC DE
   2EB2 13            [ 6]  293 	INC DE
   2EB3 12            [ 7]  294 	LD (DE),A
   2EB4 13            [ 6]  295 	INC DE
   2EB5 10 F0         [13]  296 	DJNZ buc_doblar_letra
   2EB7 C9            [10]  297 	RET
                            298 
                            299 
   2EB8                     300 escribe_letra:		; Code by Kevin Thacker
   2EB8 D5            [11]  301 	PUSH DE
   2EB9 FD 21 6E 30   [14]  302 	LD IY,#letra_decodificada
   2EBD 06 08         [ 7]  303 	LD B,#8
   2EBF                     304 bucle_alto_letra:
   2EBF C5            [11]  305 	PUSH BC
   2EC0 E5            [11]  306 	PUSH HL
   2EC1 5E            [ 7]  307 	LD E,(HL)
   2EC2 CD D9 2E      [17]  308 	CALL op_colores
   2EC5 FD 72 00      [19]  309 	LD (IY),D
   2EC8 FD 23         [10]  310 	INC IY
   2ECA CD D9 2E      [17]  311 	CALL op_colores
   2ECD FD 72 00      [19]  312 	LD (IY),D
   2ED0 FD 23         [10]  313 	INC IY
   2ED2 E1            [10]  314 	POP HL
   2ED3 23            [ 6]  315 	INC HL
   2ED4 C1            [10]  316 	POP BC
   2ED5 10 E8         [13]  317 	DJNZ bucle_alto_letra
   2ED7 D1            [10]  318 	POP DE
   2ED8 C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   2ED9                     321 op_colores:
   2ED9 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   2EDB CD E6 2E      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   2EDE CB 02         [ 8]  324 	RLC D
   2EE0 CD E6 2E      [17]  325 	CALL op_colores_pixel
   2EE3 CB 0A         [ 8]  326 	RRC D
   2EE5 C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   2EE6                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   2EE6 CB 03         [ 8]  333 	RLC E
   2EE8 CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   2EEA 7B            [ 4]  336 	LD A,E
   2EEB E6 03         [ 7]  337 	AND #0X3
   2EED 21 6A 30      [10]  338 	LD HL,#colores_b0
   2EF0 85            [ 4]  339 	ADD A,L
   2EF1 6F            [ 4]  340 	LD L,A
   2EF2 7C            [ 4]  341 	LD A,H
   2EF3 CE 00         [ 7]  342 	ADC A,#0
   2EF5 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   2EF6 7A            [ 4]  345 	LD A,D
   2EF7 B6            [ 7]  346 	OR (HL)
   2EF8 57            [ 4]  347 	LD D,A
   2EF9 C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   2EFA                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   2EFA DD 21 02 00   [14]  355 	LD IX,#2
   2EFE DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   2F00 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   2F03 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   2F06 21 6A 30      [10]  363 	LD HL,#colores_b0
   2F09 06 00         [ 7]  364 	LD B,#0
   2F0B 09            [11]  365 	ADD HL,BC
   2F0C 77            [ 7]  366 	LD (HL),A
   2F0D C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   2F0E                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   2F0E DD 21 02 00   [14]  377 	LD IX,#2
   2F12 DD 39         [15]  378 	ADD IX,SP
   2F14 DD 6E 03      [19]  379  	LD L,3 (IX)
   2F17 DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   2F1A CD F5 2C      [17]  381 	CALL cpc_GetScrAddress0
   2F1D DD 5E 00      [19]  382    	LD E,0 (IX)
   2F20 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   2F23 AF            [ 4]  384 	XOR A
   2F24 C3 6B 2F      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   2F27                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   2F27 DD 21 02 00   [14]  392 	LD IX,#2
   2F2B DD 39         [15]  393 	ADD IX,SP
   2F2D DD 6E 03      [19]  394  	LD L,3 (IX)
   2F30 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   2F33 CD F5 2C      [17]  396 	CALL cpc_GetScrAddress0
   2F36 DD 5E 00      [19]  397    	LD E,0 (IX)
   2F39 DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   2F3C 3E 01         [ 7]  399 	LD A,#1
   2F3E C3 6B 2F      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   2F41                     407 _cpc_PrintGphStrM12X::
   2F41 DD 21 02 00   [14]  408 	LD IX,#2
   2F45 DD 39         [15]  409 	ADD IX,SP
   2F47 DD 6E 02      [19]  410 	LD L,2 (IX)
   2F4A DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   2F4D DD 5E 00      [19]  412    	LD E,0 (IX)
   2F50 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   2F53 3E 01         [ 7]  414 	LD A,#1
                            415 
   2F55 C3 6B 2F      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   2F58                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   2F58 DD 21 02 00   [14]  425 	LD IX,#2
   2F5C DD 39         [15]  426 	ADD IX,SP
   2F5E DD 6E 02      [19]  427 	LD L,2 (IX)
   2F61 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   2F64 DD 5E 00      [19]  429    	LD E,0 (IX)
   2F67 DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   2F6A AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   2F6B                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   2F6B 32 D4 2F      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   2F6E 3A 81 2E      [13]  442 	LD A,(#imprimiendo)
   2F71 FE 01         [ 7]  443 	CP #1
   2F73 CA DF 2D      [10]  444 	JP Z,add_elemento
   2F76 22 82 2E      [16]  445 	LD (#direcc_destino),HL
   2F79 EB            [ 4]  446 	EX DE,HL
   2F7A CD 8A 2F      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   2F7D                     449 bucle_cola_impresionM1:
   2F7D 3A 25 2E      [13]  450 	LD A,(#elementos_cola)
   2F80 B7            [ 4]  451 	OR A
   2F81 CA D9 2D      [10]  452 	JP Z,terminar_impresion
   2F84 CD 02 2E      [17]  453 	CALL leer_elemento
   2F87 C3 7D 2F      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   2F8A                     460 bucle_texto0M1:
   2F8A 3E 01         [ 7]  461 	LD A,#1
   2F8C 32 81 2E      [13]  462 	LD (#imprimiendo),A
                            463 
   2F8F 3A 9E 30      [13]  464 	LD A,(#first_char)
   2F92 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   2F93 7E            [ 7]  466 	LD A,(HL)
   2F94 B7            [ 4]  467 	OR A ;CP 0
   2F95 C8            [11]  468 	RET Z
   2F96 90            [ 4]  469 	SUB B
   2F97 01 9F 30      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   2F9A E5            [11]  471 	PUSH HL
   2F9B 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   2F9C 26 00         [ 7]  473 	LD H,#0
   2F9E 29            [11]  474 	ADD HL,HL
   2F9F 29            [11]  475 	ADD HL,HL
   2FA0 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   2FA1 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   2FA2 CD FF 2F      [17]  478 	CALL escribe_letraM1
   2FA5 3A D4 2F      [13]  479 	LD A,(dobleM1)
   2FA8 FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   2FAA CC D5 2F      [17]  482 	CALL Z, doblar_letraM1
   2FAD 2A 82 2E      [16]  483 	LD HL,(direcc_destino)
   2FB0 3A D4 2F      [13]  484 	LD A,(dobleM1)
   2FB3 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   2FB5 28 08         [12]  487 	JR Z,cont_dobleM1
   2FB7 11 6E 30      [10]  488 	LD DE,#letra_decodificada
   2FBA FD                  489 	.DB #0xfD
   2FBB 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2FBD 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   2FBF                     494 cont_dobleM1:
   2FBF 11 7E 30      [10]  495 	LD DE,#letra_decodificada_tmp
   2FC2 FD                  496 	.DB #0XFD
   2FC3 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2FC5                     498 cont_totM1:
   2FC5 CD E6 2F      [17]  499 	CALL cpc_PutSp0M1
   2FC8 2A 82 2E      [16]  500 	LD HL,(#direcc_destino)
   2FCB 23            [ 6]  501 	INC HL
   2FCC 22 82 2E      [16]  502 	LD (#direcc_destino),HL
   2FCF E1            [10]  503 	POP HL
   2FD0 23            [ 6]  504 	INC HL
   2FD1 C3 8A 2F      [10]  505 	JP bucle_texto0M1
                            506 
   2FD4                     507 dobleM1:
   2FD4 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   2FD5                     512 doblar_letraM1:
   2FD5 21 6E 30      [10]  513 	LD HL,#letra_decodificada
   2FD8 11 7E 30      [10]  514 	LD DE,#letra_decodificada_tmp
   2FDB 06 08         [ 7]  515 	LD B,#8
   2FDD                     516 buc_doblar_letraM1:
   2FDD 7E            [ 7]  517 	LD A,(HL)
   2FDE 23            [ 6]  518 	INC HL
   2FDF 12            [ 7]  519 	LD (DE),A
   2FE0 13            [ 6]  520 	INC DE
   2FE1 12            [ 7]  521 	LD (DE),A
   2FE2 13            [ 6]  522 	INC DE
   2FE3 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   2FE5 C9            [10]  524 	RET
                            525 
                            526 
   2FE6                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2FE6 06 07         [ 7]  530 	LD B,#7
   2FE8 48            [ 4]  531 	LD C,B
   2FE9                     532 loop_alto_2M1:
   2FE9                     533 loop_ancho_2M1:
   2FE9 EB            [ 4]  534 	EX DE,HL
   2FEA ED A0         [16]  535 	LDI
   2FEC FD                  536 	.DB #0XFD
   2FED 25            [ 4]  537 	DEC H
   2FEE C8            [11]  538 	RET Z
   2FEF EB            [ 4]  539 	EX DE,HL
   2FF0                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   2FF0 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   2FF2 09            [11]  542 	ADD HL,BC
   2FF3 D2 E9 2F      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   2FF6 01 50 C0      [10]  544 	LD BC,#0XC050
   2FF9 09            [11]  545 	ADD HL,BC
   2FFA 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   2FFC C3 E9 2F      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   2FFF                     551 escribe_letraM1:
   2FFF FD 21 6E 30   [14]  552 	LD IY,#letra_decodificada
   3003 06 08         [ 7]  553 	LD B,#8
   3005 DD 21 67 30   [14]  554 	LD IX,#byte_tmp
   3009                     555 bucle_altoM1:
   3009 C5            [11]  556 	PUSH BC
   300A E5            [11]  557 	PUSH HL
                            558 
   300B 7E            [ 7]  559 	LD A,(HL)
   300C 21 66 30      [10]  560 	LD HL,#dato
   300F 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   3010 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   3014 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   3016                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   3016 E5            [11]  570 	PUSH HL
   3017 CD 2F 30      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   301A E1            [10]  572 	POP HL
   301B CB 3E         [15]  573 	SRL (HL)
   301D CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   301F 10 F5         [13]  575 	DJNZ bucle_coloresM1
   3021 DD 7E 00      [19]  576 	LD A,(IX)
   3024 FD 77 00      [19]  577 	LD (IY),A
   3027 FD 23         [10]  578 	INC IY
   3029 E1            [10]  579 	POP HL
   302A 23            [ 6]  580 	INC HL
   302B C1            [10]  581 	POP BC
   302C 10 DB         [13]  582 	DJNZ bucle_altoM1
   302E C9            [10]  583 	RET
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
   302F                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   302F 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   3031 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   3032 21 62 30      [10]  610 	LD HL,#colores_m1
   3035 5F            [ 4]  611 	LD E,A
   3036 16 00         [ 7]  612 	LD D,#0
   3038 19            [11]  613 	ADD HL,DE
   3039 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   303A 78            [ 4]  618 	LD A,B
   303B 3D            [ 4]  619 	DEC A
   303C B7            [ 4]  620 	OR A ;CP 0
   303D CA 46 30      [10]  621 	JP Z,_sin_rotar
   3040                     622 rotando:
   3040 CB 39         [ 8]  623 	SRL C
   3042 3D            [ 4]  624 	DEC A
   3043 C2 40 30      [10]  625 	JP NZ, rotando
   3046                     626 _sin_rotar:
   3046 79            [ 4]  627 	LD A,C
   3047 DD B6 00      [19]  628 	OR (IX)
   304A DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   304D C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   304E                     636 _cpc_SetInkGphStrM1::
   304E DD 21 02 00   [14]  637 	LD IX,#2
   3052 DD 39         [15]  638 	ADD IX,SP
   3054 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   3057 DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   305A 21 62 30      [10]  641 	LD HL,#colores_cambM1
   305D 06 00         [ 7]  642 	LD B,#0
   305F 09            [11]  643 	ADD HL,BC
   3060 77            [ 7]  644 	LD (HL),A
   3061 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   3062                     649 colores_cambM1:
   3062                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   3062 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   3066                     663 dato:
   3066 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   3067                     666 byte_tmp:
   3067 00                  667 	.DB #0
   3068 00                  668 	.DB #0
   3069 00                  669 	.DB #0  ;defs 3
   306A                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   306A 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   306E                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   306E 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3076 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   307E                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   307E 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3086 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   308E 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3096 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   309E                     685 first_char:
   309E 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   309F                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   309F 01                  690 	.DB #0b00000001
   30A0 01                  691 	.DB #0b00000001
   30A1 08                  692 	.DB #0b00001000
   30A2 08                  693 	.DB #0b00001000
   30A3 3C                  694 	.DB #0b00111100
   30A4 30                  695 	.DB #0b00110000
   30A5 30                  696 	.DB #0b00110000
   30A6 00                  697 	.DB #0b00000000
                            698 ;0-9
   30A7 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   30A8 44                  700 .db #0b01000100
   30A9 88                  701 .db #0b10001000
   30AA 88                  702 .db #0b10001000
   30AB 88                  703 .db #0b10001000
   30AC CC                  704 .db #0b11001100
   30AD FC                  705 .db #0b11111100
   30AE 00                  706 .db #0b00000000
   30AF 10                  707 .db #0b00010000
   30B0 50                  708 .db #0b01010000
   30B1 20                  709 .db #0b00100000
   30B2 20                  710 .db #0b00100000
   30B3 20                  711 .db #0b00100000
   30B4 30                  712 .db #0b00110000
   30B5 FC                  713 .db #0b11111100
   30B6 00                  714 .db #0b00000000
   30B7 54                  715 .db #0b01010100
   30B8 44                  716 .db #0b01000100
   30B9 08                  717 .db #0b00001000
   30BA A8                  718 .db #0b10101000
   30BB 80                  719 .db #0b10000000
   30BC CC                  720 .db #0b11001100
   30BD FC                  721 .db #0b11111100
   30BE 00                  722 .db #0b00000000
   30BF 54                  723 .db #0b01010100
   30C0 44                  724 .db #0b01000100
   30C1 08                  725 .db #0b00001000
   30C2 28                  726 .db #0b00101000
   30C3 08                  727 .db #0b00001000
   30C4 CC                  728 .db #0b11001100
   30C5 FC                  729 .db #0b11111100
   30C6 00                  730 .db #0b00000000
   30C7 44                  731 .db #0b01000100
   30C8 44                  732 .db #0b01000100
   30C9 88                  733 .db #0b10001000
   30CA A8                  734 .db #0b10101000
   30CB 08                  735 .db #0b00001000
   30CC 0C                  736 .db #0b00001100
   30CD 0C                  737 .db #0b00001100
   30CE 00                  738 .db #0b00000000
   30CF 54                  739 .db #0b01010100
   30D0 44                  740 .db #0b01000100
   30D1 80                  741 .db #0b10000000
   30D2 A8                  742 .db #0b10101000
   30D3 08                  743 .db #0b00001000
   30D4 CC                  744 .db #0b11001100
   30D5 FC                  745 .db #0b11111100
   30D6 00                  746 .db #0b00000000
   30D7 54                  747 .db #0b01010100
   30D8 44                  748 .db #0b01000100
   30D9 80                  749 .db #0b10000000
   30DA A8                  750 .db #0b10101000
   30DB 88                  751 .db #0b10001000
   30DC CC                  752 .db #0b11001100
   30DD FC                  753 .db #0b11111100
   30DE 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   30DF 54                  755 .db #0b01010100
   30E0 44                  756 .db #0b01000100
   30E1 08                  757 .db #0b00001000
   30E2 08                  758 .db #0b00001000
   30E3 20                  759 .db #0b00100000
   30E4 30                  760 .db #0b00110000
   30E5 30                  761 .db #0b00110000
   30E6 00                  762 .db #0b00000000
   30E7 54                  763 .db #0b01010100
   30E8 44                  764 .db #0b01000100
   30E9 88                  765 .db #0b10001000
   30EA A8                  766 .db #0b10101000
   30EB 88                  767 .db #0b10001000
   30EC CC                  768 .db #0b11001100
   30ED FC                  769 .db #0b11111100
   30EE 00                  770 .db #0b00000000
   30EF 54                  771 .db #0b01010100
   30F0 44                  772 .db #0b01000100
   30F1 88                  773 .db #0b10001000
   30F2 A8                  774 .db #0b10101000
   30F3 08                  775 .db #0b00001000
   30F4 CC                  776 .db #0b11001100
   30F5 FC                  777 .db #0b11111100
   30F6 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   30F7 00                  786 	.DB #0b00000000
   30F8 00                  787 	.DB #0b00000000
   30F9 20                  788 	.DB #0b00100000
   30FA 00                  789 	.DB #0b00000000
   30FB 30                  790 	.DB #0b00110000
   30FC 00                  791 	.DB #0b00000000
   30FD 00                  792 	.DB #0b00000000
   30FE 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   30FF 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   3107 00                  797 	.DB #0b00000000
   3108 00                  798 	.DB #0b00000000
   3109 00                  799 	.DB #0b00000000
   310A 00                  800 	.DB #0b00000000
   310B 00                  801 	.DB #0b00000000
   310C 00                  802 	.DB #0b00000000
   310D C0                  803 	.DB #0b11000000
   310E 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   310F 00                  806 .db #0b00000000
   3110 54                  807 .db #0b01010100
   3111 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   3112 A0                  809 .db #0b10100000
   3113 88                  810 .db #0b10001000
   3114 CC                  811 .db #0b11001100
   3115 CC                  812 .db #0b11001100
   3116 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   3117 00                  816 	.DB #0b00000000
   3118 10                  817 	.DB #0b00010000
   3119 20                  818 	.DB #0b00100000
   311A 20                  819 	.DB #0b00100000
   311B 30                  820 	.DB #0b00110000
   311C 00                  821 	.DB #0b00000000
   311D 30                  822 	.DB #0b00110000
   311E 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   311F 00                  825 	.DB #0b00000000
   3120 00                  826 	.DB #0b00000000
   3121 80                  827 	.DB #0b10000000
   3122 A0                  828 	.DB #0b10100000
   3123 FC                  829 	.DB #0b11111100
   3124 FC                  830 	.DB #0b11111100
   3125 00                  831 	.DB #0b00000000
   3126 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   3127 00                  834 	.DB #0b00000000
   3128 00                  835 	.DB #0b00000000
   3129 00                  836 	.DB #0b00000000
   312A A8                  837 	.DB #0b10101000
   312B FC                  838 	.DB #0b11111100
   312C 00                  839 	.DB #0b00000000
   312D 00                  840 	.DB #0b00000000
   312E 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   312F 00                  846 .db #0b00000000
   3130 54                  847 .db #0b01010100
   3131 88                  848 .db #0b10001000
   3132 88                  849 .db #0b10001000
   3133 A8                  850 .db #0b10101000
   3134 CC                  851 .db #0b11001100
   3135 CC                  852 .db #0b11001100
   3136 00                  853 .db #0b00000000
   3137 00                  854 .db #0b00000000
   3138 54                  855 .db #0b01010100
   3139 88                  856 .db #0b10001000
   313A A8                  857 .db #0b10101000
   313B 88                  858 .db #0b10001000
   313C CC                  859 .db #0b11001100
   313D FC                  860 .db #0b11111100
   313E 00                  861 .db #0b00000000
   313F 00                  862 .db #0b00000000
   3140 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   3141 88                  864 .db #0b10001000
   3142 80                  865 .db #0b10000000
   3143 88                  866 .db #0b10001000
   3144 CC                  867 .db #0b11001100
   3145 FC                  868 .db #0b11111100
   3146 00                  869 .db #0b00000000
   3147 00                  870 .db #0b00000000
   3148 54                  871 .db #0b01010100
   3149 88                  872 .db #0b10001000
   314A 88                  873 .db #0b10001000
   314B 88                  874 .db #0b10001000
   314C CC                  875 .db #0b11001100
   314D F0                  876 .db #0b11110000
   314E 00                  877 .db #0b00000000
   314F 00                  878 .db #0b00000000
   3150 54                  879 .db #0b01010100
   3151 80                  880 .db #0b10000000
   3152 A8                  881 .db #0b10101000
   3153 80                  882 .db #0b10000000
   3154 CC                  883 .db #0b11001100
   3155 FC                  884 .db #0b11111100
   3156 00                  885 .db #0b00000000
   3157 00                  886 .db #0b00000000
   3158 54                  887 .db #0b01010100
   3159 80                  888 .db #0b10000000
   315A A8                  889 .db #0b10101000
   315B 80                  890 .db #0b10000000
   315C C0                  891 .db #0b11000000
   315D C0                  892 .db #0b11000000
   315E 00                  893 .db #0b00000000
   315F 00                  894 .db #0b00000000
   3160 54                  895 .db #0b01010100
   3161 88                  896 .db #0b10001000
   3162 80                  897 .db #0b10000000
   3163 A8                  898 .db #0b10101000
   3164 CC                  899 .db #0b11001100
   3165 FC                  900 .db #0b11111100
   3166 00                  901 .db #0b00000000
   3167 00                  902 .db #0b00000000
   3168 44                  903 .db #0b01000100
   3169 88                  904 .db #0b10001000
   316A 88                  905 .db #0b10001000
   316B A8                  906 .db #0b10101000
   316C CC                  907 .db #0b11001100
   316D CC                  908 .db #0b11001100
   316E 00                  909 .db #0b00000000
   316F 00                  910 .db #0b00000000
   3170 54                  911 .db #0b01010100
   3171 20                  912 .db #0b00100000
   3172 20                  913 .db #0b00100000
   3173 20                  914 .db #0b00100000
   3174 30                  915 .db #0b00110000
   3175 FC                  916 .db #0b11111100
   3176 00                  917 .db #0b00000000
   3177 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   3178 54                  919 .db #0b01010100
   3179 A8                  920 .db #0b10101000
   317A 08                  921 .db #0b00001000
   317B 08                  922 .db #0b00001000
   317C CC                  923 .db #0b11001100
   317D FC                  924 .db #0b11111100
   317E 00                  925 .db #0b00000000
   317F 00                  926 .db #0b00000000
   3180 44                  927 .db #0b01000100
   3181 88                  928 .db #0b10001000
   3182 A0                  929 .db #0b10100000
   3183 88                  930 .db #0b10001000
   3184 CC                  931 .db #0b11001100
   3185 CC                  932 .db #0b11001100
   3186 00                  933 .db #0b00000000
   3187 00                  934 .db #0b00000000
   3188 40                  935 .db #0b01000000
   3189 80                  936 .db #0b10000000
   318A 80                  937 .db #0b10000000
   318B 80                  938 .db #0b10000000
   318C CC                  939 .db #0b11001100
   318D FC                  940 .db #0b11111100
   318E 00                  941 .db #0b00000000
   318F 00                  942 .db #0b00000000
   3190 54                  943 .db #0b01010100
   3191 A8                  944 .db #0b10101000
   3192 88                  945 .db #0b10001000
   3193 88                  946 .db #0b10001000
   3194 CC                  947 .db #0b11001100
   3195 CC                  948 .db #0b11001100
   3196 00                  949 .db #0b00000000
   3197 00                  950 .db #0b00000000
   3198 50                  951 .db #0b01010000
   3199 88                  952 .db #0b10001000
   319A 88                  953 .db #0b10001000
   319B 88                  954 .db #0b10001000
   319C CC                  955 .db #0b11001100
   319D CC                  956 .db #0b11001100
   319E 00                  957 .db #0b00000000
   319F 00                  958 .db #0b00000000
   31A0 54                  959 .db #0b01010100
   31A1 88                  960 .db #0b10001000
   31A2 88                  961 .db #0b10001000
   31A3 88                  962 .db #0b10001000
   31A4 CC                  963 .db #0b11001100
   31A5 FC                  964 .db #0b11111100
   31A6 00                  965 .db #0b00000000
   31A7 00                  966 .db #0b00000000
   31A8 54                  967 .db #0b01010100
   31A9 88                  968 .db #0b10001000
   31AA 88                  969 .db #0b10001000
   31AB A8                  970 .db #0b10101000
   31AC C0                  971 .db #0b11000000
   31AD C0                  972 .db #0b11000000
   31AE 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   31AF 00                  974 .db #0b00000000
   31B0 54                  975 .db #0b01010100
   31B1 88                  976 .db #0b10001000
   31B2 88                  977 .db #0b10001000
   31B3 88                  978 .db #0b10001000
   31B4 FC                  979 .db #0b11111100
   31B5 FC                  980 .db #0b11111100
   31B6 00                  981 .db #0b00000000
   31B7 00                  982 .db #0b00000000
   31B8 54                  983 .db #0b01010100
   31B9 88                  984 .db #0b10001000
   31BA 88                  985 .db #0b10001000
   31BB A0                  986 .db #0b10100000
   31BC CC                  987 .db #0b11001100
   31BD CC                  988 .db #0b11001100
   31BE 00                  989 .db #0b00000000
   31BF 00                  990 .db #0b00000000
   31C0 54                  991 .db #0b01010100
   31C1 80                  992 .db #0b10000000
   31C2 A8                  993 .db #0b10101000
   31C3 08                  994 .db #0b00001000
   31C4 CC                  995 .db #0b11001100
   31C5 FC                  996 .db #0b11111100
   31C6 00                  997 .db #0b00000000
   31C7 00                  998 .db #0b00000000
   31C8 54                  999 .db #0b01010100
   31C9 20                 1000 .db #0b00100000
   31CA 20                 1001 .db #0b00100000
   31CB 20                 1002 .db #0b00100000
   31CC 30                 1003 .db #0b00110000
   31CD 30                 1004 .db #0b00110000
   31CE 00                 1005 .db #0b00000000
   31CF 00                 1006 .db #0b00000000
   31D0 44                 1007 .db #0b01000100
   31D1 88                 1008 .db #0b10001000
   31D2 88                 1009 .db #0b10001000
   31D3 88                 1010 .db #0b10001000
   31D4 CC                 1011 .db #0b11001100
   31D5 FC                 1012 .db #0b11111100
   31D6 00                 1013 .db #0b00000000
   31D7 00                 1014 .db #0b00000000
   31D8 44                 1015 .db #0b01000100
   31D9 88                 1016 .db #0b10001000
   31DA 88                 1017 .db #0b10001000
   31DB 88                 1018 .db #0b10001000
   31DC CC                 1019 .db #0b11001100
   31DD 30                 1020 .db #0b00110000
   31DE 00                 1021 .db #0b00000000
   31DF 00                 1022 .db #0b00000000
   31E0 44                 1023 .db #0b01000100
   31E1 88                 1024 .db #0b10001000
   31E2 88                 1025 .db #0b10001000
   31E3 88                 1026 .db #0b10001000
   31E4 FC                 1027 .db #0b11111100
   31E5 CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   31E6 00                 1029 .db #0b00000000
   31E7 00                 1030 .db #0b00000000
   31E8 44                 1031 .db #0b01000100
   31E9 88                 1032 .db #0b10001000
   31EA A0                 1033 .db #0b10100000
   31EB 20                 1034 .db #0b00100000
   31EC CC                 1035 .db #0b11001100
   31ED CC                 1036 .db #0b11001100
   31EE 00                 1037 .db #0b00000000
   31EF 00                 1038 .db #0b00000000
   31F0 44                 1039 .db #0b01000100
   31F1 88                 1040 .db #0b10001000
   31F2 88                 1041 .db #0b10001000
   31F3 20                 1042 .db #0b00100000
   31F4 30                 1043 .db #0b00110000
   31F5 30                 1044 .db #0b00110000
   31F6 00                 1045 .db #0b00000000
   31F7 00                 1046 .db #0b00000000
   31F8 54                 1047 .db #0b01010100
   31F9 08                 1048 .db #0b00001000
   31FA 20                 1049 .db #0b00100000
   31FB 80                 1050 .db #0b10000000
   31FC CC                 1051 .db #0b11001100
   31FD FC                 1052 .db #0b11111100
   31FE 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   31FF 03                 1059 	.DB #0b00000011
   3200 0F                 1060 	.DB #0b00001111
   3201 3F                 1061 	.DB #0b00111111
   3202 FF                 1062 	.DB #0b11111111
   3203 3F                 1063 	.DB #0b00111111
   3204 0F                 1064 	.DB #0b00001111
   3205 03                 1065 	.DB #0b00000011
   3206 00                 1066 	.DB #0b00000000
