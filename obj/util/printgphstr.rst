ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 ;*************************************
                              7 ; GRAPHIC TEXT
                              8 ;*************************************
                              9 
                             10 .globl _cpc_PrintGphStr2X
                             11 
   4ED1                      12 _cpc_PrintGphStr2X::
                             13 ;preparación datos impresión. El ancho y alto son fijos!
                             14 ;	LD IX,#2
                             15 ;	ADD IX,SP
                             16 ;	LD L,2 (IX)
                             17 ;	LD H,3 (IX)	;DESTINO
                             18 ;  	LD E,0 (IX)
                             19 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             20 
   4ED1 F1            [10]   21 	POP AF
   4ED2 D1            [10]   22 	POP DE
   4ED3 E1            [10]   23 	POP HL
   4ED4 E5            [11]   24 	PUSH HL
   4ED5 D5            [11]   25 	PUSH DE
   4ED6 F5            [11]   26 	PUSH AF
                             27 
   4ED7 3E 01         [ 7]   28 	LD A,#1
   4ED9 C3 E2 4E      [10]   29  	JP cpc_PrintGphStr0
                             30 
                             31 
                             32 .globl _cpc_PrintGphStr
                             33 
   4EDC                      34 _cpc_PrintGphStr::
                             35 ;preparación datos impresión. El ancho y alto son fijos!
                             36 ;	LD IX,#2
                             37 ;	ADD IX,SP
                             38 ;	LD L,2 (IX)
                             39 ;	LD H,3 (IX)	;DESTINO
                             40 ;	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
                             41 ;  	LD E,0 (IX)
                             42 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             43 
   4EDC F1            [10]   44 	POP AF 
   4EDD D1            [10]   45 	POP DE
   4EDE E1            [10]   46 	POP	HL
   4EDF E5            [11]   47 	PUSH HL
   4EE0 D5            [11]   48 	PUSH DE
   4EE1 F5            [11]   49 	PUSH AF
                             50 
   4EE2                      51 cpc_PrintGphStr0:
                             52 
                             53 	;DE destino
                             54 	;HL origen
                             55 	;ex de,hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   4EE2 32 A8 4F      [13]   56 	LD (#doble),A
                             57 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                             58 	;la impresión en curso.
   4EE5 3A A9 4F      [13]   59 	LD A,(#imprimiendo)
   4EE8 FE 01         [ 7]   60 	CP #1
   4EEA CA 07 4F      [10]   61 	JP Z,add_elemento
   4EED 22 AA 4F      [16]   62 	LD (#direcc_destino),HL
   4EF0 EB            [ 4]   63 	EX DE,HL
   4EF1 CD 5D 4F      [17]   64 	CALL bucle_texto0
                             65 
                             66 ;antes de terminar, se mira si hay algo en cola.
   4EF4                      67 bucle_cola_impresion:
   4EF4 3A 4D 4F      [13]   68 	LD A,(#elementos_cola)
   4EF7 B7            [ 4]   69 	OR A
   4EF8 CA 01 4F      [10]   70 	JP Z,terminar_impresion
   4EFB CD 2A 4F      [17]   71 	CALL leer_elemento
   4EFE C3 F4 4E      [10]   72 	JP bucle_cola_impresion
                             73 
                             74 
   4F01                      75 terminar_impresion:
   4F01 AF            [ 4]   76 	XOR A
   4F02 32 A9 4F      [13]   77 	LD (#imprimiendo),A
   4F05 C9            [10]   78 	RET
   4F06                      79 entrar_cola_impresion:
                             80 ;si se está imprimiendo se mete el valor en la cola
   4F06 C9            [10]   81 	RET
   4F07                      82 add_elemento:
   4F07 F3            [ 4]   83 	DI
   4F08 DD 2A 4F 4F   [20]   84 	LD IX,(#pos_cola)
   4F0C DD 75 00      [19]   85 	LD 0 (IX),L
   4F0F DD 74 01      [19]   86 	LD 1 (IX),H
   4F12 DD 73 02      [19]   87 	LD 2 (IX),E
   4F15 DD 72 03      [19]   88 	LD 3 (IX),D
   4F18 DD 23         [10]   89 	INC IX
   4F1A DD 23         [10]   90 	INC IX
   4F1C DD 23         [10]   91 	INC IX
   4F1E DD 23         [10]   92 	INC IX
   4F20 DD 22 4F 4F   [20]   93 	LD (#pos_cola),IX
                             94 
   4F24 21 4D 4F      [10]   95 	LD HL,#elementos_cola
   4F27 34            [11]   96 	INC (HL)
                             97 	;Se añaden los valores hl y de
   4F28 FB            [ 4]   98 	EI
   4F29 C9            [10]   99 	RET
   4F2A                     100 leer_elemento:
   4F2A F3            [ 4]  101 	DI
   4F2B DD 2A 4F 4F   [20]  102 	LD IX,(#pos_cola)
   4F2F DD 6E 00      [19]  103 	LD L,0 (IX)
   4F32 DD 66 01      [19]  104 	LD H,1 (IX)
   4F35 DD 5E 02      [19]  105 	LD E,2 (IX)
   4F38 DD 56 04      [19]  106 	LD D,4 (IX)
   4F3B DD 2B         [10]  107 	DEC IX
   4F3D DD 2B         [10]  108 	DEC IX
   4F3F DD 2B         [10]  109 	DEC IX
   4F41 DD 2B         [10]  110 	DEC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



   4F43 DD 22 4F 4F   [20]  111 	LD (#pos_cola),IX
   4F47 21 4D 4F      [10]  112 	LD HL,#elementos_cola
   4F4A 35            [11]  113 	DEC (HL)
   4F4B FB            [ 4]  114 	EI
   4F4C C9            [10]  115 	RET
                            116 
   4F4D                     117 elementos_cola:
   4F4D 00 00               118 	.DW #0				; defw 0
   4F4F                     119 pos_cola:
   4F4F 51 4F               120 	.DW #cola_impresion ;defw cola_impresion
                            121 						;pos_escritura_cola defw cola_impresion
   4F51                     122 cola_impresion:  		; defs 12
   4F51 00 00 00 00 00 00   123 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   4F5D                     124 bucle_texto0:
   4F5D 3E 01         [ 7]  125 	LD A,#1
   4F5F 32 A9 4F      [13]  126 	LD (imprimiendo),A
                            127 
   4F62 3A 6C 50      [13]  128 	LD A,(first_char)
   4F65 47            [ 4]  129 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            130 
   4F66 7E            [ 7]  131 	LD A,(HL)
   4F67 B7            [ 4]  132 	OR A ;CP 0
   4F68 C8            [11]  133 	RET Z
   4F69 90            [ 4]  134 	SUB B
   4F6A 01 6D 50      [10]  135 	LD BC,#cpc_Chars	;apunto a la primera letra
   4F6D E5            [11]  136 	PUSH HL
                            137 
   4F6E 6F            [ 4]  138 	LD L,A		;en A tengo la letra que sería
   4F6F 26 00         [ 7]  139 	LD H,#0
   4F71 29            [11]  140 	ADD HL,HL
   4F72 29            [11]  141 	ADD HL,HL
   4F73 29            [11]  142 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4F74 09            [11]  143 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4F75 CD E0 4F      [17]  144 	CALL escribe_letra
   4F78 3A A8 4F      [13]  145 	LD A,(doble)
   4F7B FE 01         [ 7]  146 	CP #1
                            147 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   4F7D CC C7 4F      [17]  148 	CALL Z, doblar_letra
   4F80 2A AA 4F      [16]  149 	LD HL,(#direcc_destino)
   4F83 3A A8 4F      [13]  150 	LD A,(doble)
   4F86 FE 01         [ 7]  151 	CP #1
                            152 	;alto
   4F88 28 08         [12]  153 	JR Z,cont_doble
   4F8A 11 3C 50      [10]  154 	LD DE,#letra_decodificada
   4F8D FD                  155 	.DB #0xfD
   4F8E 26 08         [ 7]  156 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4F90 18 06         [12]  157 	JR cont_tot
                            158 
                            159 
   4F92                     160 cont_doble:
   4F92 11 4C 50      [10]  161 	LD DE,#letra_decodificada_tmp
   4F95 FD                  162 	.DB #0xfD
   4F96 26 10         [ 7]  163 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   4F98                     165 cont_tot:
   4F98 CD AC 4F      [17]  166 	CALL cpc_PutSp0
   4F9B 2A AA 4F      [16]  167 	LD HL,(#direcc_destino)
   4F9E 23            [ 6]  168 	INC HL
   4F9F 23            [ 6]  169 	INC HL
   4FA0 22 AA 4F      [16]  170 	LD (#direcc_destino),HL
   4FA3 E1            [10]  171 	POP HL
   4FA4 23            [ 6]  172 	INC HL
   4FA5 C3 5D 4F      [10]  173 	JP bucle_texto0
                            174 
                            175 
   4FA8                     176 doble:
   4FA8 00                  177 	.DB #0
   4FA9                     178 imprimiendo:
   4FA9 00                  179 	.DB #0
   4FAA                     180 direcc_destino:
   4FAA 00 00               181 	.DW #0
                            182 
                            183 
   4FAC                     184 cpc_PutSp0:
                            185 ;	.DB #0xfD
                            186 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4FAC 06 07         [ 7]  187 	LD B,#7
   4FAE 48            [ 4]  188 	LD C,B
   4FAF                     189 loop_alto_2:
                            190 
   4FAF                     191 loop_ancho_2:
   4FAF EB            [ 4]  192 	EX DE,HL
   4FB0 ED A0         [16]  193 	LDI
   4FB2 ED A0         [16]  194 	LDI
   4FB4 FD                  195 	.DB #0XFD
   4FB5 25            [ 4]  196 	DEC H
   4FB6 C8            [11]  197 	RET Z
   4FB7 EB            [ 4]  198 	EX DE,HL
   4FB8                     199 salto_linea:
   4FB8 0E FE         [ 7]  200 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   4FBA 09            [11]  201 	ADD HL,BC
   4FBB D2 AF 4F      [10]  202 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   4FBE 01 50 C0      [10]  203 	LD BC,#0XC050
   4FC1 09            [11]  204 	ADD HL,BC
   4FC2 06 07         [ 7]  205 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   4FC4 C3 AF 4F      [10]  206 	JP loop_alto_2
                            207 
                            208 
                            209 
                            210 
   4FC7                     211 doblar_letra:
   4FC7 21 3C 50      [10]  212 	LD HL,#letra_decodificada
   4FCA 11 4C 50      [10]  213 	LD DE,#letra_decodificada_tmp
   4FCD 06 08         [ 7]  214 	LD B,#8
   4FCF                     215 buc_doblar_letra:
   4FCF 7E            [ 7]  216 	LD A,(HL)
   4FD0 23            [ 6]  217 	INC HL
   4FD1 12            [ 7]  218 	LD (DE),A
   4FD2 13            [ 6]  219 	INC DE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   4FD3 13            [ 6]  220 	INC DE
   4FD4 12            [ 7]  221 	LD (DE),A
   4FD5 1B            [ 6]  222 	DEC DE
   4FD6 7E            [ 7]  223 	LD A,(HL)
   4FD7 23            [ 6]  224 	INC HL
   4FD8 12            [ 7]  225 	LD (DE),A
   4FD9 13            [ 6]  226 	INC DE
   4FDA 13            [ 6]  227 	INC DE
   4FDB 12            [ 7]  228 	LD (DE),A
   4FDC 13            [ 6]  229 	INC DE
   4FDD 10 F0         [13]  230 	DJNZ buc_doblar_letra
   4FDF C9            [10]  231 	RET
                            232 
                            233 
   4FE0                     234 escribe_letra:		; Code by Kevin Thacker
   4FE0 D5            [11]  235 	PUSH DE
   4FE1 FD 21 3C 50   [14]  236 	LD IY,#letra_decodificada
   4FE5 06 08         [ 7]  237 	LD B,#8
   4FE7                     238 bucle_alto_letra:
   4FE7 C5            [11]  239 	PUSH BC
   4FE8 E5            [11]  240 	PUSH HL
   4FE9 5E            [ 7]  241 	LD E,(HL)
   4FEA CD 01 50      [17]  242 	CALL op_colores
   4FED FD 72 00      [19]  243 	LD (IY),D
   4FF0 FD 23         [10]  244 	INC IY
   4FF2 CD 01 50      [17]  245 	CALL op_colores
   4FF5 FD 72 00      [19]  246 	LD (IY),D
   4FF8 FD 23         [10]  247 	INC IY
   4FFA E1            [10]  248 	POP HL
   4FFB 23            [ 6]  249 	INC HL
   4FFC C1            [10]  250 	POP BC
   4FFD 10 E8         [13]  251 	DJNZ bucle_alto_letra
   4FFF D1            [10]  252 	POP DE
   5000 C9            [10]  253 	RET
                            254 
   5001                     255 op_colores:
   5001 16 00         [ 7]  256 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   5003 CD 0E 50      [17]  257 	CALL op_colores_pixel	;; do pixel 0
   5006 CB 02         [ 8]  258 	RLC D
   5008 CD 0E 50      [17]  259 	CALL op_colores_pixel
   500B CB 0A         [ 8]  260 	RRC D
   500D C9            [10]  261 	RET
                            262 
                            263 ;; follow through to do pixel 1
                            264 
   500E                     265 op_colores_pixel:
                            266 	;; shift out pixel into bits 0 and 1 (source)
   500E CB 03         [ 8]  267 	RLC E
   5010 CB 03         [ 8]  268 	RLC E
                            269 	;; isolate
   5012 7B            [ 4]  270 	LD A,E
   5013 E6 03         [ 7]  271 	AND #0X3
   5015 21 38 50      [10]  272 	LD HL,#colores_b0
   5018 85            [ 4]  273 	ADD A,L
   5019 6F            [ 4]  274 	LD L,A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   501A 7C            [ 4]  275 	LD A,H
   501B CE 00         [ 7]  276 	ADC A,#0
   501D 67            [ 4]  277 	LD H,A
                            278 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   501E 7A            [ 4]  279 	LD A,D
   501F B6            [ 7]  280 	OR (HL)
   5020 57            [ 4]  281 	LD D,A
   5021 C9            [10]  282 	RET
                            283 
                            284 
                            285 .globl _cpc_SetInkGphStr
                            286 
                            287 ;_cpc_SetInkGphStr::
                            288 ;	LD IX,#2
                            289 ;	ADD IX,SP
                            290 ;
                            291 ;	LD A,1 (IX) ;VALOR
                            292 ;	LD C,0 (IX)	;COLOR
                            293 ;
                            294 ;	LD HL,#colores_b0
                            295 ;	LD B,#0
                            296 ;	ADD HL,BC
                            297 ;	LD (HL),A
                            298 ;	RET
                            299 
   5022                     300  _cpc_SetInkGphStr::
   5022 21 02 00      [10]  301  	LD HL,#2
   5025 44            [ 4]  302  	LD B,H
   5026 39            [11]  303  	ADD HL,SP
                            304 
   5027 4E            [ 7]  305  	LD C, (HL)
   5028 23            [ 6]  306  	INC HL
   5029 7E            [ 7]  307  	LD A,(HL)
                            308 
   502A 21 38 50      [10]  309  	LD HL,#colores_b0
   502D 09            [11]  310  	ADD HL,BC
   502E 77            [ 7]  311  	LD (HL),A
   502F C9            [10]  312  	RET
                            313 
   5030                     314 colores_cambM1:
   5030                     315 colores_m1:
   5030 00 88 80 08         316 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
                            317 
                            318 ;defb @00000000,  @01010100, @00010000, @00000101  ;@00000001, @00000101, @00010101, @00000000
                            319 
                            320 
                            321 
                            322 ;DEFC direcc_destino0_m1 = direcc_destino
                            323 ;DEFC colores_cambM1 = colores_m1
                            324 
                            325 
   5034                     326 dato:
   5034 1B                  327 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            328 
   5035                     329 byte_tmp:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   5035 00                  330 	.DB #0
   5036 00                  331 	.DB #0
   5037 00                  332 	.DB #0  ;defs 3
   5038                     333 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            334 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   5038 0A 20 A0 28         335 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            336 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            337 
   503C                     338 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   503C 00 00 00 00 00 00   339 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   5044 00 00 00 00 00 00   340 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   504C                     341 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   504C 00 00 00 00 00 00   342 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   5054 00 00 00 00 00 00   343 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   505C 00 00 00 00 00 00   344 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   5064 00 00 00 00 00 00   345 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            346 
                            347 
   506C                     348 first_char:
   506C 2F                  349 	.DB #47	;first defined char number (ASCII)
                            350 
   506D                     351 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            352 	;/
   506D 01                  353 	.DB #0b00000001
   506E 01                  354 	.DB #0b00000001
   506F 08                  355 	.DB #0b00001000
   5070 08                  356 	.DB #0b00001000
   5071 3C                  357 	.DB #0b00111100
   5072 30                  358 	.DB #0b00110000
   5073 30                  359 	.DB #0b00110000
   5074 00                  360 	.DB #0b00000000
                            361 ;0-9
   5075 54                  362 .db #0b01010100
   5076 44                  363 .db #0b01000100
   5077 88                  364 .db #0b10001000
   5078 88                  365 .db #0b10001000
   5079 88                  366 .db #0b10001000
   507A CC                  367 .db #0b11001100
   507B FC                  368 .db #0b11111100
   507C 00                  369 .db #0b00000000
   507D 10                  370 .db #0b00010000
   507E 50                  371 .db #0b01010000
   507F 20                  372 .db #0b00100000
   5080 20                  373 .db #0b00100000
   5081 20                  374 .db #0b00100000
   5082 30                  375 .db #0b00110000
   5083 FC                  376 .db #0b11111100
   5084 00                  377 .db #0b00000000
   5085 54                  378 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   5086 44                  379 .db #0b01000100
   5087 08                  380 .db #0b00001000
   5088 A8                  381 .db #0b10101000
   5089 80                  382 .db #0b10000000
   508A CC                  383 .db #0b11001100
   508B FC                  384 .db #0b11111100
   508C 00                  385 .db #0b00000000
   508D 54                  386 .db #0b01010100
   508E 44                  387 .db #0b01000100
   508F 08                  388 .db #0b00001000
   5090 28                  389 .db #0b00101000
   5091 08                  390 .db #0b00001000
   5092 CC                  391 .db #0b11001100
   5093 FC                  392 .db #0b11111100
   5094 00                  393 .db #0b00000000
   5095 44                  394 .db #0b01000100
   5096 44                  395 .db #0b01000100
   5097 88                  396 .db #0b10001000
   5098 A8                  397 .db #0b10101000
   5099 08                  398 .db #0b00001000
   509A 0C                  399 .db #0b00001100
   509B 0C                  400 .db #0b00001100
   509C 00                  401 .db #0b00000000
   509D 54                  402 .db #0b01010100
   509E 44                  403 .db #0b01000100
   509F 80                  404 .db #0b10000000
   50A0 A8                  405 .db #0b10101000
   50A1 08                  406 .db #0b00001000
   50A2 CC                  407 .db #0b11001100
   50A3 FC                  408 .db #0b11111100
   50A4 00                  409 .db #0b00000000
   50A5 54                  410 .db #0b01010100
   50A6 44                  411 .db #0b01000100
   50A7 80                  412 .db #0b10000000
   50A8 A8                  413 .db #0b10101000
   50A9 88                  414 .db #0b10001000
   50AA CC                  415 .db #0b11001100
   50AB FC                  416 .db #0b11111100
   50AC 00                  417 .db #0b00000000
   50AD 54                  418 .db #0b01010100
   50AE 44                  419 .db #0b01000100
   50AF 08                  420 .db #0b00001000
   50B0 08                  421 .db #0b00001000
   50B1 20                  422 .db #0b00100000
   50B2 30                  423 .db #0b00110000
   50B3 30                  424 .db #0b00110000
   50B4 00                  425 .db #0b00000000
   50B5 54                  426 .db #0b01010100
   50B6 44                  427 .db #0b01000100
   50B7 88                  428 .db #0b10001000
   50B8 A8                  429 .db #0b10101000
   50B9 88                  430 .db #0b10001000
   50BA CC                  431 .db #0b11001100
   50BB FC                  432 .db #0b11111100
   50BC 00                  433 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   50BD 54                  434 .db #0b01010100
   50BE 44                  435 .db #0b01000100
   50BF 88                  436 .db #0b10001000
   50C0 A8                  437 .db #0b10101000
   50C1 08                  438 .db #0b00001000
   50C2 CC                  439 .db #0b11001100
   50C3 FC                  440 .db #0b11111100
   50C4 00                  441 .db #0b00000000
                            442 
                            443 
                            444 
                            445 
                            446 
                            447 
                            448 	;:
   50C5 00                  449 	.DB #0b00000000
   50C6 00                  450 	.DB #0b00000000
   50C7 20                  451 	.DB #0b00100000
   50C8 00                  452 	.DB #0b00000000
   50C9 30                  453 	.DB #0b00110000
   50CA 00                  454 	.DB #0b00000000
   50CB 00                  455 	.DB #0b00000000
   50CC 00                  456 	.DB #0b00000000
                            457 	;SPC (;)
   50CD 00 00 00 00 00 00   458 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            459 	;.   (<)
   50D5 00                  460 	.DB #0b00000000
   50D6 00                  461 	.DB #0b00000000
   50D7 00                  462 	.DB #0b00000000
   50D8 00                  463 	.DB #0b00000000
   50D9 00                  464 	.DB #0b00000000
   50DA 00                  465 	.DB #0b00000000
   50DB C0                  466 	.DB #0b11000000
   50DC 00                  467 	.DB #0b00000000
                            468 	;Ñ    (=)
   50DD 00                  469 .db #0b00000000
   50DE 54                  470 .db #0b01010100
   50DF 00                  471 .db #0b00000000
   50E0 A0                  472 .db #0b10100000
   50E1 88                  473 .db #0b10001000
   50E2 CC                  474 .db #0b11001100
   50E3 CC                  475 .db #0b11001100
   50E4 00                  476 .db #0b00000000
                            477 
                            478 	; !	(>)
   50E5 00                  479 	.DB #0b00000000
   50E6 10                  480 	.DB #0b00010000
   50E7 20                  481 	.DB #0b00100000
   50E8 20                  482 	.DB #0b00100000
   50E9 30                  483 	.DB #0b00110000
   50EA 00                  484 	.DB #0b00000000
   50EB 30                  485 	.DB #0b00110000
   50EC 00                  486 	.DB #0b00000000
                            487 	;-> (?)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   50ED 00                  488 	.DB #0b00000000
   50EE 00                  489 	.DB #0b00000000
   50EF 80                  490 	.DB #0b10000000
   50F0 A0                  491 	.DB #0b10100000
   50F1 FC                  492 	.DB #0b11111100
   50F2 FC                  493 	.DB #0b11111100
   50F3 00                  494 	.DB #0b00000000
   50F4 00                  495 	.DB #0b00000000
                            496 	;-  (@)
   50F5 00                  497 	.DB #0b00000000
   50F6 00                  498 	.DB #0b00000000
   50F7 00                  499 	.DB #0b00000000
   50F8 A8                  500 	.DB #0b10101000
   50F9 FC                  501 	.DB #0b11111100
   50FA 00                  502 	.DB #0b00000000
   50FB 00                  503 	.DB #0b00000000
   50FC 00                  504 	.DB #0b00000000
                            505 
                            506 
                            507 
                            508 ;A-Z
   50FD 00                  509 .db #0b00000000
   50FE 54                  510 .db #0b01010100
   50FF 88                  511 .db #0b10001000
   5100 88                  512 .db #0b10001000
   5101 A8                  513 .db #0b10101000
   5102 CC                  514 .db #0b11001100
   5103 CC                  515 .db #0b11001100
   5104 00                  516 .db #0b00000000
   5105 00                  517 .db #0b00000000
   5106 54                  518 .db #0b01010100
   5107 88                  519 .db #0b10001000
   5108 A8                  520 .db #0b10101000
   5109 88                  521 .db #0b10001000
   510A CC                  522 .db #0b11001100
   510B FC                  523 .db #0b11111100
   510C 00                  524 .db #0b00000000
   510D 00                  525 .db #0b00000000
   510E 54                  526 .db #0b01010100
   510F 88                  527 .db #0b10001000
   5110 80                  528 .db #0b10000000
   5111 88                  529 .db #0b10001000
   5112 CC                  530 .db #0b11001100
   5113 FC                  531 .db #0b11111100
   5114 00                  532 .db #0b00000000
   5115 00                  533 .db #0b00000000
   5116 54                  534 .db #0b01010100
   5117 88                  535 .db #0b10001000
   5118 88                  536 .db #0b10001000
   5119 88                  537 .db #0b10001000
   511A CC                  538 .db #0b11001100
   511B F0                  539 .db #0b11110000
   511C 00                  540 .db #0b00000000
   511D 00                  541 .db #0b00000000
   511E 54                  542 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   511F 80                  543 .db #0b10000000
   5120 A8                  544 .db #0b10101000
   5121 80                  545 .db #0b10000000
   5122 CC                  546 .db #0b11001100
   5123 FC                  547 .db #0b11111100
   5124 00                  548 .db #0b00000000
   5125 00                  549 .db #0b00000000
   5126 54                  550 .db #0b01010100
   5127 80                  551 .db #0b10000000
   5128 A8                  552 .db #0b10101000
   5129 80                  553 .db #0b10000000
   512A C0                  554 .db #0b11000000
   512B C0                  555 .db #0b11000000
   512C 00                  556 .db #0b00000000
   512D 00                  557 .db #0b00000000
   512E 54                  558 .db #0b01010100
   512F 88                  559 .db #0b10001000
   5130 80                  560 .db #0b10000000
   5131 A8                  561 .db #0b10101000
   5132 CC                  562 .db #0b11001100
   5133 FC                  563 .db #0b11111100
   5134 00                  564 .db #0b00000000
   5135 00                  565 .db #0b00000000
   5136 44                  566 .db #0b01000100
   5137 88                  567 .db #0b10001000
   5138 88                  568 .db #0b10001000
   5139 A8                  569 .db #0b10101000
   513A CC                  570 .db #0b11001100
   513B CC                  571 .db #0b11001100
   513C 00                  572 .db #0b00000000
   513D 00                  573 .db #0b00000000
   513E 54                  574 .db #0b01010100
   513F 20                  575 .db #0b00100000
   5140 20                  576 .db #0b00100000
   5141 20                  577 .db #0b00100000
   5142 30                  578 .db #0b00110000
   5143 FC                  579 .db #0b11111100
   5144 00                  580 .db #0b00000000
   5145 00                  581 .db #0b00000000
   5146 54                  582 .db #0b01010100
   5147 A8                  583 .db #0b10101000
   5148 08                  584 .db #0b00001000
   5149 08                  585 .db #0b00001000
   514A CC                  586 .db #0b11001100
   514B FC                  587 .db #0b11111100
   514C 00                  588 .db #0b00000000
   514D 00                  589 .db #0b00000000
   514E 44                  590 .db #0b01000100
   514F 88                  591 .db #0b10001000
   5150 A0                  592 .db #0b10100000
   5151 88                  593 .db #0b10001000
   5152 CC                  594 .db #0b11001100
   5153 CC                  595 .db #0b11001100
   5154 00                  596 .db #0b00000000
   5155 00                  597 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   5156 40                  598 .db #0b01000000
   5157 80                  599 .db #0b10000000
   5158 80                  600 .db #0b10000000
   5159 80                  601 .db #0b10000000
   515A CC                  602 .db #0b11001100
   515B FC                  603 .db #0b11111100
   515C 00                  604 .db #0b00000000
   515D 00                  605 .db #0b00000000
   515E 54                  606 .db #0b01010100
   515F A8                  607 .db #0b10101000
   5160 88                  608 .db #0b10001000
   5161 88                  609 .db #0b10001000
   5162 CC                  610 .db #0b11001100
   5163 CC                  611 .db #0b11001100
   5164 00                  612 .db #0b00000000
   5165 00                  613 .db #0b00000000
   5166 50                  614 .db #0b01010000
   5167 88                  615 .db #0b10001000
   5168 88                  616 .db #0b10001000
   5169 88                  617 .db #0b10001000
   516A CC                  618 .db #0b11001100
   516B CC                  619 .db #0b11001100
   516C 00                  620 .db #0b00000000
   516D 00                  621 .db #0b00000000
   516E 54                  622 .db #0b01010100
   516F 88                  623 .db #0b10001000
   5170 88                  624 .db #0b10001000
   5171 88                  625 .db #0b10001000
   5172 CC                  626 .db #0b11001100
   5173 FC                  627 .db #0b11111100
   5174 00                  628 .db #0b00000000
   5175 00                  629 .db #0b00000000
   5176 54                  630 .db #0b01010100
   5177 88                  631 .db #0b10001000
   5178 88                  632 .db #0b10001000
   5179 A8                  633 .db #0b10101000
   517A C0                  634 .db #0b11000000
   517B C0                  635 .db #0b11000000
   517C 00                  636 .db #0b00000000
   517D 00                  637 .db #0b00000000
   517E 54                  638 .db #0b01010100
   517F 88                  639 .db #0b10001000
   5180 88                  640 .db #0b10001000
   5181 88                  641 .db #0b10001000
   5182 FC                  642 .db #0b11111100
   5183 FC                  643 .db #0b11111100
   5184 00                  644 .db #0b00000000
   5185 00                  645 .db #0b00000000
   5186 54                  646 .db #0b01010100
   5187 88                  647 .db #0b10001000
   5188 88                  648 .db #0b10001000
   5189 A0                  649 .db #0b10100000
   518A CC                  650 .db #0b11001100
   518B CC                  651 .db #0b11001100
   518C 00                  652 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   518D 00                  653 .db #0b00000000
   518E 54                  654 .db #0b01010100
   518F 80                  655 .db #0b10000000
   5190 A8                  656 .db #0b10101000
   5191 08                  657 .db #0b00001000
   5192 CC                  658 .db #0b11001100
   5193 FC                  659 .db #0b11111100
   5194 00                  660 .db #0b00000000
   5195 00                  661 .db #0b00000000
   5196 54                  662 .db #0b01010100
   5197 20                  663 .db #0b00100000
   5198 20                  664 .db #0b00100000
   5199 20                  665 .db #0b00100000
   519A 30                  666 .db #0b00110000
   519B 30                  667 .db #0b00110000
   519C 00                  668 .db #0b00000000
   519D 00                  669 .db #0b00000000
   519E 44                  670 .db #0b01000100
   519F 88                  671 .db #0b10001000
   51A0 88                  672 .db #0b10001000
   51A1 88                  673 .db #0b10001000
   51A2 CC                  674 .db #0b11001100
   51A3 FC                  675 .db #0b11111100
   51A4 00                  676 .db #0b00000000
   51A5 00                  677 .db #0b00000000
   51A6 44                  678 .db #0b01000100
   51A7 88                  679 .db #0b10001000
   51A8 88                  680 .db #0b10001000
   51A9 88                  681 .db #0b10001000
   51AA CC                  682 .db #0b11001100
   51AB 30                  683 .db #0b00110000
   51AC 00                  684 .db #0b00000000
   51AD 00                  685 .db #0b00000000
   51AE 44                  686 .db #0b01000100
   51AF 88                  687 .db #0b10001000
   51B0 88                  688 .db #0b10001000
   51B1 88                  689 .db #0b10001000
   51B2 FC                  690 .db #0b11111100
   51B3 CC                  691 .db #0b11001100
   51B4 00                  692 .db #0b00000000
   51B5 00                  693 .db #0b00000000
   51B6 44                  694 .db #0b01000100
   51B7 88                  695 .db #0b10001000
   51B8 A0                  696 .db #0b10100000
   51B9 20                  697 .db #0b00100000
   51BA CC                  698 .db #0b11001100
   51BB CC                  699 .db #0b11001100
   51BC 00                  700 .db #0b00000000
   51BD 00                  701 .db #0b00000000
   51BE 44                  702 .db #0b01000100
   51BF 88                  703 .db #0b10001000
   51C0 88                  704 .db #0b10001000
   51C1 20                  705 .db #0b00100000
   51C2 30                  706 .db #0b00110000
   51C3 30                  707 .db #0b00110000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   51C4 00                  708 .db #0b00000000
   51C5 00                  709 .db #0b00000000
   51C6 54                  710 .db #0b01010100
   51C7 08                  711 .db #0b00001000
   51C8 20                  712 .db #0b00100000
   51C9 80                  713 .db #0b10000000
   51CA CC                  714 .db #0b11001100
   51CB FC                  715 .db #0b11111100
   51CC 00                  716 .db #0b00000000
                            717 
                            718 
                            719 
                            720 
                            721 	;-
   51CD 03                  722 	.DB #0b00000011
   51CE 0F                  723 	.DB #0b00001111
   51CF 3F                  724 	.DB #0b00111111
   51D0 FF                  725 	.DB #0b11111111
   51D1 3F                  726 	.DB #0b00111111
   51D2 0F                  727 	.DB #0b00001111
   51D3 03                  728 	.DB #0b00000011
   51D4 00                  729 	.DB #0b00000000
