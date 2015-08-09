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
   4E5F                      12 _cpc_PrintGphStr2X::
                             13 ;preparación datos impresión. El ancho y alto son fijos!
                             14 ;	LD IX,#2
                             15 ;	ADD IX,SP
                             16 ;	LD L,2 (IX)
                             17 ;	LD H,3 (IX)	;DESTINO
                             18 ;  	LD E,0 (IX)
                             19 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             20 
   4E5F F1            [10]   21 	POP AF
   4E60 D1            [10]   22 	POP DE
   4E61 E1            [10]   23 	POP HL
   4E62 E5            [11]   24 	PUSH HL
   4E63 D5            [11]   25 	PUSH DE
   4E64 F5            [11]   26 	PUSH AF
                             27 
   4E65 3E 01         [ 7]   28 	LD A,#1
   4E67 C3 70 4E      [10]   29  	JP cpc_PrintGphStr0
                             30 
                             31 
                             32 .globl _cpc_PrintGphStr
                             33 
   4E6A                      34 _cpc_PrintGphStr::
                             35 ;preparación datos impresión. El ancho y alto son fijos!
                             36 ;	LD IX,#2
                             37 ;	ADD IX,SP
                             38 ;	LD L,2 (IX)
                             39 ;	LD H,3 (IX)	;DESTINO
                             40 ;	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
                             41 ;  	LD E,0 (IX)
                             42 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             43 
   4E6A F1            [10]   44 	POP AF 
   4E6B D1            [10]   45 	POP DE
   4E6C E1            [10]   46 	POP	HL
   4E6D E5            [11]   47 	PUSH HL
   4E6E D5            [11]   48 	PUSH DE
   4E6F F5            [11]   49 	PUSH AF
                             50 
   4E70                      51 cpc_PrintGphStr0:
                             52 
                             53 	;DE destino
                             54 	;HL origen
                             55 	;ex de,hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   4E70 32 36 4F      [13]   56 	LD (#doble),A
                             57 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                             58 	;la impresión en curso.
   4E73 3A 37 4F      [13]   59 	LD A,(#imprimiendo)
   4E76 FE 01         [ 7]   60 	CP #1
   4E78 CA 95 4E      [10]   61 	JP Z,add_elemento
   4E7B 22 38 4F      [16]   62 	LD (#direcc_destino),HL
   4E7E EB            [ 4]   63 	EX DE,HL
   4E7F CD EB 4E      [17]   64 	CALL bucle_texto0
                             65 
                             66 ;antes de terminar, se mira si hay algo en cola.
   4E82                      67 bucle_cola_impresion:
   4E82 3A DB 4E      [13]   68 	LD A,(#elementos_cola)
   4E85 B7            [ 4]   69 	OR A
   4E86 CA 8F 4E      [10]   70 	JP Z,terminar_impresion
   4E89 CD B8 4E      [17]   71 	CALL leer_elemento
   4E8C C3 82 4E      [10]   72 	JP bucle_cola_impresion
                             73 
                             74 
   4E8F                      75 terminar_impresion:
   4E8F AF            [ 4]   76 	XOR A
   4E90 32 37 4F      [13]   77 	LD (#imprimiendo),A
   4E93 C9            [10]   78 	RET
   4E94                      79 entrar_cola_impresion:
                             80 ;si se está imprimiendo se mete el valor en la cola
   4E94 C9            [10]   81 	RET
   4E95                      82 add_elemento:
   4E95 F3            [ 4]   83 	DI
   4E96 DD 2A DD 4E   [20]   84 	LD IX,(#pos_cola)
   4E9A DD 75 00      [19]   85 	LD 0 (IX),L
   4E9D DD 74 01      [19]   86 	LD 1 (IX),H
   4EA0 DD 73 02      [19]   87 	LD 2 (IX),E
   4EA3 DD 72 03      [19]   88 	LD 3 (IX),D
   4EA6 DD 23         [10]   89 	INC IX
   4EA8 DD 23         [10]   90 	INC IX
   4EAA DD 23         [10]   91 	INC IX
   4EAC DD 23         [10]   92 	INC IX
   4EAE DD 22 DD 4E   [20]   93 	LD (#pos_cola),IX
                             94 
   4EB2 21 DB 4E      [10]   95 	LD HL,#elementos_cola
   4EB5 34            [11]   96 	INC (HL)
                             97 	;Se añaden los valores hl y de
   4EB6 FB            [ 4]   98 	EI
   4EB7 C9            [10]   99 	RET
   4EB8                     100 leer_elemento:
   4EB8 F3            [ 4]  101 	DI
   4EB9 DD 2A DD 4E   [20]  102 	LD IX,(#pos_cola)
   4EBD DD 6E 00      [19]  103 	LD L,0 (IX)
   4EC0 DD 66 01      [19]  104 	LD H,1 (IX)
   4EC3 DD 5E 02      [19]  105 	LD E,2 (IX)
   4EC6 DD 56 04      [19]  106 	LD D,4 (IX)
   4EC9 DD 2B         [10]  107 	DEC IX
   4ECB DD 2B         [10]  108 	DEC IX
   4ECD DD 2B         [10]  109 	DEC IX
   4ECF DD 2B         [10]  110 	DEC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



   4ED1 DD 22 DD 4E   [20]  111 	LD (#pos_cola),IX
   4ED5 21 DB 4E      [10]  112 	LD HL,#elementos_cola
   4ED8 35            [11]  113 	DEC (HL)
   4ED9 FB            [ 4]  114 	EI
   4EDA C9            [10]  115 	RET
                            116 
   4EDB                     117 elementos_cola:
   4EDB 00 00               118 	.DW #0				; defw 0
   4EDD                     119 pos_cola:
   4EDD DF 4E               120 	.DW #cola_impresion ;defw cola_impresion
                            121 						;pos_escritura_cola defw cola_impresion
   4EDF                     122 cola_impresion:  		; defs 12
   4EDF 00 00 00 00 00 00   123 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   4EEB                     124 bucle_texto0:
   4EEB 3E 01         [ 7]  125 	LD A,#1
   4EED 32 37 4F      [13]  126 	LD (imprimiendo),A
                            127 
   4EF0 3A FA 4F      [13]  128 	LD A,(first_char)
   4EF3 47            [ 4]  129 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            130 
   4EF4 7E            [ 7]  131 	LD A,(HL)
   4EF5 B7            [ 4]  132 	OR A ;CP 0
   4EF6 C8            [11]  133 	RET Z
   4EF7 90            [ 4]  134 	SUB B
   4EF8 01 FB 4F      [10]  135 	LD BC,#cpc_Chars	;apunto a la primera letra
   4EFB E5            [11]  136 	PUSH HL
                            137 
   4EFC 6F            [ 4]  138 	LD L,A		;en A tengo la letra que sería
   4EFD 26 00         [ 7]  139 	LD H,#0
   4EFF 29            [11]  140 	ADD HL,HL
   4F00 29            [11]  141 	ADD HL,HL
   4F01 29            [11]  142 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4F02 09            [11]  143 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4F03 CD 6E 4F      [17]  144 	CALL escribe_letra
   4F06 3A 36 4F      [13]  145 	LD A,(doble)
   4F09 FE 01         [ 7]  146 	CP #1
                            147 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   4F0B CC 55 4F      [17]  148 	CALL Z, doblar_letra
   4F0E 2A 38 4F      [16]  149 	LD HL,(#direcc_destino)
   4F11 3A 36 4F      [13]  150 	LD A,(doble)
   4F14 FE 01         [ 7]  151 	CP #1
                            152 	;alto
   4F16 28 08         [12]  153 	JR Z,cont_doble
   4F18 11 CA 4F      [10]  154 	LD DE,#letra_decodificada
   4F1B FD                  155 	.DB #0xfD
   4F1C 26 08         [ 7]  156 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4F1E 18 06         [12]  157 	JR cont_tot
                            158 
                            159 
   4F20                     160 cont_doble:
   4F20 11 DA 4F      [10]  161 	LD DE,#letra_decodificada_tmp
   4F23 FD                  162 	.DB #0xfD
   4F24 26 10         [ 7]  163 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   4F26                     165 cont_tot:
   4F26 CD 3A 4F      [17]  166 	CALL cpc_PutSp0
   4F29 2A 38 4F      [16]  167 	LD HL,(#direcc_destino)
   4F2C 23            [ 6]  168 	INC HL
   4F2D 23            [ 6]  169 	INC HL
   4F2E 22 38 4F      [16]  170 	LD (#direcc_destino),HL
   4F31 E1            [10]  171 	POP HL
   4F32 23            [ 6]  172 	INC HL
   4F33 C3 EB 4E      [10]  173 	JP bucle_texto0
                            174 
                            175 
   4F36                     176 doble:
   4F36 00                  177 	.DB #0
   4F37                     178 imprimiendo:
   4F37 00                  179 	.DB #0
   4F38                     180 direcc_destino:
   4F38 00 00               181 	.DW #0
                            182 
                            183 
   4F3A                     184 cpc_PutSp0:
                            185 ;	.DB #0xfD
                            186 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4F3A 06 07         [ 7]  187 	LD B,#7
   4F3C 48            [ 4]  188 	LD C,B
   4F3D                     189 loop_alto_2:
                            190 
   4F3D                     191 loop_ancho_2:
   4F3D EB            [ 4]  192 	EX DE,HL
   4F3E ED A0         [16]  193 	LDI
   4F40 ED A0         [16]  194 	LDI
   4F42 FD                  195 	.DB #0XFD
   4F43 25            [ 4]  196 	DEC H
   4F44 C8            [11]  197 	RET Z
   4F45 EB            [ 4]  198 	EX DE,HL
   4F46                     199 salto_linea:
   4F46 0E FE         [ 7]  200 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   4F48 09            [11]  201 	ADD HL,BC
   4F49 D2 3D 4F      [10]  202 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   4F4C 01 50 C0      [10]  203 	LD BC,#0XC050
   4F4F 09            [11]  204 	ADD HL,BC
   4F50 06 07         [ 7]  205 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   4F52 C3 3D 4F      [10]  206 	JP loop_alto_2
                            207 
                            208 
                            209 
                            210 
   4F55                     211 doblar_letra:
   4F55 21 CA 4F      [10]  212 	LD HL,#letra_decodificada
   4F58 11 DA 4F      [10]  213 	LD DE,#letra_decodificada_tmp
   4F5B 06 08         [ 7]  214 	LD B,#8
   4F5D                     215 buc_doblar_letra:
   4F5D 7E            [ 7]  216 	LD A,(HL)
   4F5E 23            [ 6]  217 	INC HL
   4F5F 12            [ 7]  218 	LD (DE),A
   4F60 13            [ 6]  219 	INC DE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   4F61 13            [ 6]  220 	INC DE
   4F62 12            [ 7]  221 	LD (DE),A
   4F63 1B            [ 6]  222 	DEC DE
   4F64 7E            [ 7]  223 	LD A,(HL)
   4F65 23            [ 6]  224 	INC HL
   4F66 12            [ 7]  225 	LD (DE),A
   4F67 13            [ 6]  226 	INC DE
   4F68 13            [ 6]  227 	INC DE
   4F69 12            [ 7]  228 	LD (DE),A
   4F6A 13            [ 6]  229 	INC DE
   4F6B 10 F0         [13]  230 	DJNZ buc_doblar_letra
   4F6D C9            [10]  231 	RET
                            232 
                            233 
   4F6E                     234 escribe_letra:		; Code by Kevin Thacker
   4F6E D5            [11]  235 	PUSH DE
   4F6F FD 21 CA 4F   [14]  236 	LD IY,#letra_decodificada
   4F73 06 08         [ 7]  237 	LD B,#8
   4F75                     238 bucle_alto_letra:
   4F75 C5            [11]  239 	PUSH BC
   4F76 E5            [11]  240 	PUSH HL
   4F77 5E            [ 7]  241 	LD E,(HL)
   4F78 CD 8F 4F      [17]  242 	CALL op_colores
   4F7B FD 72 00      [19]  243 	LD (IY),D
   4F7E FD 23         [10]  244 	INC IY
   4F80 CD 8F 4F      [17]  245 	CALL op_colores
   4F83 FD 72 00      [19]  246 	LD (IY),D
   4F86 FD 23         [10]  247 	INC IY
   4F88 E1            [10]  248 	POP HL
   4F89 23            [ 6]  249 	INC HL
   4F8A C1            [10]  250 	POP BC
   4F8B 10 E8         [13]  251 	DJNZ bucle_alto_letra
   4F8D D1            [10]  252 	POP DE
   4F8E C9            [10]  253 	RET
                            254 
   4F8F                     255 op_colores:
   4F8F 16 00         [ 7]  256 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   4F91 CD 9C 4F      [17]  257 	CALL op_colores_pixel	;; do pixel 0
   4F94 CB 02         [ 8]  258 	RLC D
   4F96 CD 9C 4F      [17]  259 	CALL op_colores_pixel
   4F99 CB 0A         [ 8]  260 	RRC D
   4F9B C9            [10]  261 	RET
                            262 
                            263 ;; follow through to do pixel 1
                            264 
   4F9C                     265 op_colores_pixel:
                            266 	;; shift out pixel into bits 0 and 1 (source)
   4F9C CB 03         [ 8]  267 	RLC E
   4F9E CB 03         [ 8]  268 	RLC E
                            269 	;; isolate
   4FA0 7B            [ 4]  270 	LD A,E
   4FA1 E6 03         [ 7]  271 	AND #0X3
   4FA3 21 C6 4F      [10]  272 	LD HL,#colores_b0
   4FA6 85            [ 4]  273 	ADD A,L
   4FA7 6F            [ 4]  274 	LD L,A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   4FA8 7C            [ 4]  275 	LD A,H
   4FA9 CE 00         [ 7]  276 	ADC A,#0
   4FAB 67            [ 4]  277 	LD H,A
                            278 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   4FAC 7A            [ 4]  279 	LD A,D
   4FAD B6            [ 7]  280 	OR (HL)
   4FAE 57            [ 4]  281 	LD D,A
   4FAF C9            [10]  282 	RET
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
   4FB0                     300  _cpc_SetInkGphStr::
   4FB0 21 02 00      [10]  301  	LD HL,#2
   4FB3 44            [ 4]  302  	LD B,H
   4FB4 39            [11]  303  	ADD HL,SP
                            304 
   4FB5 4E            [ 7]  305  	LD C, (HL)
   4FB6 23            [ 6]  306  	INC HL
   4FB7 7E            [ 7]  307  	LD A,(HL)
                            308 
   4FB8 21 C6 4F      [10]  309  	LD HL,#colores_b0
   4FBB 09            [11]  310  	ADD HL,BC
   4FBC 77            [ 7]  311  	LD (HL),A
   4FBD C9            [10]  312  	RET
                            313 
   4FBE                     314 colores_cambM1:
   4FBE                     315 colores_m1:
   4FBE 00 88 80 08         316 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
                            317 
                            318 ;defb @00000000,  @01010100, @00010000, @00000101  ;@00000001, @00000101, @00010101, @00000000
                            319 
                            320 
                            321 
                            322 ;DEFC direcc_destino0_m1 = direcc_destino
                            323 ;DEFC colores_cambM1 = colores_m1
                            324 
                            325 
   4FC2                     326 dato:
   4FC2 1B                  327 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            328 
   4FC3                     329 byte_tmp:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   4FC3 00                  330 	.DB #0
   4FC4 00                  331 	.DB #0
   4FC5 00                  332 	.DB #0  ;defs 3
   4FC6                     333 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            334 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   4FC6 0A 20 A0 28         335 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            336 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            337 
   4FCA                     338 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   4FCA 00 00 00 00 00 00   339 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4FD2 00 00 00 00 00 00   340 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4FDA                     341 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   4FDA 00 00 00 00 00 00   342 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4FE2 00 00 00 00 00 00   343 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4FEA 00 00 00 00 00 00   344 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4FF2 00 00 00 00 00 00   345 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            346 
                            347 
   4FFA                     348 first_char:
   4FFA 2F                  349 	.DB #47	;first defined char number (ASCII)
                            350 
   4FFB                     351 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            352 	;/
   4FFB 01                  353 	.DB #0b00000001
   4FFC 01                  354 	.DB #0b00000001
   4FFD 08                  355 	.DB #0b00001000
   4FFE 08                  356 	.DB #0b00001000
   4FFF 3C                  357 	.DB #0b00111100
   5000 30                  358 	.DB #0b00110000
   5001 30                  359 	.DB #0b00110000
   5002 00                  360 	.DB #0b00000000
                            361 ;0-9
   5003 54                  362 .db #0b01010100
   5004 44                  363 .db #0b01000100
   5005 88                  364 .db #0b10001000
   5006 88                  365 .db #0b10001000
   5007 88                  366 .db #0b10001000
   5008 CC                  367 .db #0b11001100
   5009 FC                  368 .db #0b11111100
   500A 00                  369 .db #0b00000000
   500B 10                  370 .db #0b00010000
   500C 50                  371 .db #0b01010000
   500D 20                  372 .db #0b00100000
   500E 20                  373 .db #0b00100000
   500F 20                  374 .db #0b00100000
   5010 30                  375 .db #0b00110000
   5011 FC                  376 .db #0b11111100
   5012 00                  377 .db #0b00000000
   5013 54                  378 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   5014 44                  379 .db #0b01000100
   5015 08                  380 .db #0b00001000
   5016 A8                  381 .db #0b10101000
   5017 80                  382 .db #0b10000000
   5018 CC                  383 .db #0b11001100
   5019 FC                  384 .db #0b11111100
   501A 00                  385 .db #0b00000000
   501B 54                  386 .db #0b01010100
   501C 44                  387 .db #0b01000100
   501D 08                  388 .db #0b00001000
   501E 28                  389 .db #0b00101000
   501F 08                  390 .db #0b00001000
   5020 CC                  391 .db #0b11001100
   5021 FC                  392 .db #0b11111100
   5022 00                  393 .db #0b00000000
   5023 44                  394 .db #0b01000100
   5024 44                  395 .db #0b01000100
   5025 88                  396 .db #0b10001000
   5026 A8                  397 .db #0b10101000
   5027 08                  398 .db #0b00001000
   5028 0C                  399 .db #0b00001100
   5029 0C                  400 .db #0b00001100
   502A 00                  401 .db #0b00000000
   502B 54                  402 .db #0b01010100
   502C 44                  403 .db #0b01000100
   502D 80                  404 .db #0b10000000
   502E A8                  405 .db #0b10101000
   502F 08                  406 .db #0b00001000
   5030 CC                  407 .db #0b11001100
   5031 FC                  408 .db #0b11111100
   5032 00                  409 .db #0b00000000
   5033 54                  410 .db #0b01010100
   5034 44                  411 .db #0b01000100
   5035 80                  412 .db #0b10000000
   5036 A8                  413 .db #0b10101000
   5037 88                  414 .db #0b10001000
   5038 CC                  415 .db #0b11001100
   5039 FC                  416 .db #0b11111100
   503A 00                  417 .db #0b00000000
   503B 54                  418 .db #0b01010100
   503C 44                  419 .db #0b01000100
   503D 08                  420 .db #0b00001000
   503E 08                  421 .db #0b00001000
   503F 20                  422 .db #0b00100000
   5040 30                  423 .db #0b00110000
   5041 30                  424 .db #0b00110000
   5042 00                  425 .db #0b00000000
   5043 54                  426 .db #0b01010100
   5044 44                  427 .db #0b01000100
   5045 88                  428 .db #0b10001000
   5046 A8                  429 .db #0b10101000
   5047 88                  430 .db #0b10001000
   5048 CC                  431 .db #0b11001100
   5049 FC                  432 .db #0b11111100
   504A 00                  433 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   504B 54                  434 .db #0b01010100
   504C 44                  435 .db #0b01000100
   504D 88                  436 .db #0b10001000
   504E A8                  437 .db #0b10101000
   504F 08                  438 .db #0b00001000
   5050 CC                  439 .db #0b11001100
   5051 FC                  440 .db #0b11111100
   5052 00                  441 .db #0b00000000
                            442 
                            443 
                            444 
                            445 
                            446 
                            447 
                            448 	;:
   5053 00                  449 	.DB #0b00000000
   5054 00                  450 	.DB #0b00000000
   5055 20                  451 	.DB #0b00100000
   5056 00                  452 	.DB #0b00000000
   5057 30                  453 	.DB #0b00110000
   5058 00                  454 	.DB #0b00000000
   5059 00                  455 	.DB #0b00000000
   505A 00                  456 	.DB #0b00000000
                            457 	;SPC (;)
   505B 00 00 00 00 00 00   458 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            459 	;.   (<)
   5063 00                  460 	.DB #0b00000000
   5064 00                  461 	.DB #0b00000000
   5065 00                  462 	.DB #0b00000000
   5066 00                  463 	.DB #0b00000000
   5067 00                  464 	.DB #0b00000000
   5068 00                  465 	.DB #0b00000000
   5069 C0                  466 	.DB #0b11000000
   506A 00                  467 	.DB #0b00000000
                            468 	;Ñ    (=)
   506B 00                  469 .db #0b00000000
   506C 54                  470 .db #0b01010100
   506D 00                  471 .db #0b00000000
   506E A0                  472 .db #0b10100000
   506F 88                  473 .db #0b10001000
   5070 CC                  474 .db #0b11001100
   5071 CC                  475 .db #0b11001100
   5072 00                  476 .db #0b00000000
                            477 
                            478 	; !	(>)
   5073 00                  479 	.DB #0b00000000
   5074 10                  480 	.DB #0b00010000
   5075 20                  481 	.DB #0b00100000
   5076 20                  482 	.DB #0b00100000
   5077 30                  483 	.DB #0b00110000
   5078 00                  484 	.DB #0b00000000
   5079 30                  485 	.DB #0b00110000
   507A 00                  486 	.DB #0b00000000
                            487 	;-> (?)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   507B 00                  488 	.DB #0b00000000
   507C 00                  489 	.DB #0b00000000
   507D 80                  490 	.DB #0b10000000
   507E A0                  491 	.DB #0b10100000
   507F FC                  492 	.DB #0b11111100
   5080 FC                  493 	.DB #0b11111100
   5081 00                  494 	.DB #0b00000000
   5082 00                  495 	.DB #0b00000000
                            496 	;-  (@)
   5083 00                  497 	.DB #0b00000000
   5084 00                  498 	.DB #0b00000000
   5085 00                  499 	.DB #0b00000000
   5086 A8                  500 	.DB #0b10101000
   5087 FC                  501 	.DB #0b11111100
   5088 00                  502 	.DB #0b00000000
   5089 00                  503 	.DB #0b00000000
   508A 00                  504 	.DB #0b00000000
                            505 
                            506 
                            507 
                            508 ;A-Z
   508B 00                  509 .db #0b00000000
   508C 54                  510 .db #0b01010100
   508D 88                  511 .db #0b10001000
   508E 88                  512 .db #0b10001000
   508F A8                  513 .db #0b10101000
   5090 CC                  514 .db #0b11001100
   5091 CC                  515 .db #0b11001100
   5092 00                  516 .db #0b00000000
   5093 00                  517 .db #0b00000000
   5094 54                  518 .db #0b01010100
   5095 88                  519 .db #0b10001000
   5096 A8                  520 .db #0b10101000
   5097 88                  521 .db #0b10001000
   5098 CC                  522 .db #0b11001100
   5099 FC                  523 .db #0b11111100
   509A 00                  524 .db #0b00000000
   509B 00                  525 .db #0b00000000
   509C 54                  526 .db #0b01010100
   509D 88                  527 .db #0b10001000
   509E 80                  528 .db #0b10000000
   509F 88                  529 .db #0b10001000
   50A0 CC                  530 .db #0b11001100
   50A1 FC                  531 .db #0b11111100
   50A2 00                  532 .db #0b00000000
   50A3 00                  533 .db #0b00000000
   50A4 54                  534 .db #0b01010100
   50A5 88                  535 .db #0b10001000
   50A6 88                  536 .db #0b10001000
   50A7 88                  537 .db #0b10001000
   50A8 CC                  538 .db #0b11001100
   50A9 F0                  539 .db #0b11110000
   50AA 00                  540 .db #0b00000000
   50AB 00                  541 .db #0b00000000
   50AC 54                  542 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   50AD 80                  543 .db #0b10000000
   50AE A8                  544 .db #0b10101000
   50AF 80                  545 .db #0b10000000
   50B0 CC                  546 .db #0b11001100
   50B1 FC                  547 .db #0b11111100
   50B2 00                  548 .db #0b00000000
   50B3 00                  549 .db #0b00000000
   50B4 54                  550 .db #0b01010100
   50B5 80                  551 .db #0b10000000
   50B6 A8                  552 .db #0b10101000
   50B7 80                  553 .db #0b10000000
   50B8 C0                  554 .db #0b11000000
   50B9 C0                  555 .db #0b11000000
   50BA 00                  556 .db #0b00000000
   50BB 00                  557 .db #0b00000000
   50BC 54                  558 .db #0b01010100
   50BD 88                  559 .db #0b10001000
   50BE 80                  560 .db #0b10000000
   50BF A8                  561 .db #0b10101000
   50C0 CC                  562 .db #0b11001100
   50C1 FC                  563 .db #0b11111100
   50C2 00                  564 .db #0b00000000
   50C3 00                  565 .db #0b00000000
   50C4 44                  566 .db #0b01000100
   50C5 88                  567 .db #0b10001000
   50C6 88                  568 .db #0b10001000
   50C7 A8                  569 .db #0b10101000
   50C8 CC                  570 .db #0b11001100
   50C9 CC                  571 .db #0b11001100
   50CA 00                  572 .db #0b00000000
   50CB 00                  573 .db #0b00000000
   50CC 54                  574 .db #0b01010100
   50CD 20                  575 .db #0b00100000
   50CE 20                  576 .db #0b00100000
   50CF 20                  577 .db #0b00100000
   50D0 30                  578 .db #0b00110000
   50D1 FC                  579 .db #0b11111100
   50D2 00                  580 .db #0b00000000
   50D3 00                  581 .db #0b00000000
   50D4 54                  582 .db #0b01010100
   50D5 A8                  583 .db #0b10101000
   50D6 08                  584 .db #0b00001000
   50D7 08                  585 .db #0b00001000
   50D8 CC                  586 .db #0b11001100
   50D9 FC                  587 .db #0b11111100
   50DA 00                  588 .db #0b00000000
   50DB 00                  589 .db #0b00000000
   50DC 44                  590 .db #0b01000100
   50DD 88                  591 .db #0b10001000
   50DE A0                  592 .db #0b10100000
   50DF 88                  593 .db #0b10001000
   50E0 CC                  594 .db #0b11001100
   50E1 CC                  595 .db #0b11001100
   50E2 00                  596 .db #0b00000000
   50E3 00                  597 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   50E4 40                  598 .db #0b01000000
   50E5 80                  599 .db #0b10000000
   50E6 80                  600 .db #0b10000000
   50E7 80                  601 .db #0b10000000
   50E8 CC                  602 .db #0b11001100
   50E9 FC                  603 .db #0b11111100
   50EA 00                  604 .db #0b00000000
   50EB 00                  605 .db #0b00000000
   50EC 54                  606 .db #0b01010100
   50ED A8                  607 .db #0b10101000
   50EE 88                  608 .db #0b10001000
   50EF 88                  609 .db #0b10001000
   50F0 CC                  610 .db #0b11001100
   50F1 CC                  611 .db #0b11001100
   50F2 00                  612 .db #0b00000000
   50F3 00                  613 .db #0b00000000
   50F4 50                  614 .db #0b01010000
   50F5 88                  615 .db #0b10001000
   50F6 88                  616 .db #0b10001000
   50F7 88                  617 .db #0b10001000
   50F8 CC                  618 .db #0b11001100
   50F9 CC                  619 .db #0b11001100
   50FA 00                  620 .db #0b00000000
   50FB 00                  621 .db #0b00000000
   50FC 54                  622 .db #0b01010100
   50FD 88                  623 .db #0b10001000
   50FE 88                  624 .db #0b10001000
   50FF 88                  625 .db #0b10001000
   5100 CC                  626 .db #0b11001100
   5101 FC                  627 .db #0b11111100
   5102 00                  628 .db #0b00000000
   5103 00                  629 .db #0b00000000
   5104 54                  630 .db #0b01010100
   5105 88                  631 .db #0b10001000
   5106 88                  632 .db #0b10001000
   5107 A8                  633 .db #0b10101000
   5108 C0                  634 .db #0b11000000
   5109 C0                  635 .db #0b11000000
   510A 00                  636 .db #0b00000000
   510B 00                  637 .db #0b00000000
   510C 54                  638 .db #0b01010100
   510D 88                  639 .db #0b10001000
   510E 88                  640 .db #0b10001000
   510F 88                  641 .db #0b10001000
   5110 FC                  642 .db #0b11111100
   5111 FC                  643 .db #0b11111100
   5112 00                  644 .db #0b00000000
   5113 00                  645 .db #0b00000000
   5114 54                  646 .db #0b01010100
   5115 88                  647 .db #0b10001000
   5116 88                  648 .db #0b10001000
   5117 A0                  649 .db #0b10100000
   5118 CC                  650 .db #0b11001100
   5119 CC                  651 .db #0b11001100
   511A 00                  652 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   511B 00                  653 .db #0b00000000
   511C 54                  654 .db #0b01010100
   511D 80                  655 .db #0b10000000
   511E A8                  656 .db #0b10101000
   511F 08                  657 .db #0b00001000
   5120 CC                  658 .db #0b11001100
   5121 FC                  659 .db #0b11111100
   5122 00                  660 .db #0b00000000
   5123 00                  661 .db #0b00000000
   5124 54                  662 .db #0b01010100
   5125 20                  663 .db #0b00100000
   5126 20                  664 .db #0b00100000
   5127 20                  665 .db #0b00100000
   5128 30                  666 .db #0b00110000
   5129 30                  667 .db #0b00110000
   512A 00                  668 .db #0b00000000
   512B 00                  669 .db #0b00000000
   512C 44                  670 .db #0b01000100
   512D 88                  671 .db #0b10001000
   512E 88                  672 .db #0b10001000
   512F 88                  673 .db #0b10001000
   5130 CC                  674 .db #0b11001100
   5131 FC                  675 .db #0b11111100
   5132 00                  676 .db #0b00000000
   5133 00                  677 .db #0b00000000
   5134 44                  678 .db #0b01000100
   5135 88                  679 .db #0b10001000
   5136 88                  680 .db #0b10001000
   5137 88                  681 .db #0b10001000
   5138 CC                  682 .db #0b11001100
   5139 30                  683 .db #0b00110000
   513A 00                  684 .db #0b00000000
   513B 00                  685 .db #0b00000000
   513C 44                  686 .db #0b01000100
   513D 88                  687 .db #0b10001000
   513E 88                  688 .db #0b10001000
   513F 88                  689 .db #0b10001000
   5140 FC                  690 .db #0b11111100
   5141 CC                  691 .db #0b11001100
   5142 00                  692 .db #0b00000000
   5143 00                  693 .db #0b00000000
   5144 44                  694 .db #0b01000100
   5145 88                  695 .db #0b10001000
   5146 A0                  696 .db #0b10100000
   5147 20                  697 .db #0b00100000
   5148 CC                  698 .db #0b11001100
   5149 CC                  699 .db #0b11001100
   514A 00                  700 .db #0b00000000
   514B 00                  701 .db #0b00000000
   514C 44                  702 .db #0b01000100
   514D 88                  703 .db #0b10001000
   514E 88                  704 .db #0b10001000
   514F 20                  705 .db #0b00100000
   5150 30                  706 .db #0b00110000
   5151 30                  707 .db #0b00110000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   5152 00                  708 .db #0b00000000
   5153 00                  709 .db #0b00000000
   5154 54                  710 .db #0b01010100
   5155 08                  711 .db #0b00001000
   5156 20                  712 .db #0b00100000
   5157 80                  713 .db #0b10000000
   5158 CC                  714 .db #0b11001100
   5159 FC                  715 .db #0b11111100
   515A 00                  716 .db #0b00000000
                            717 
                            718 
                            719 
                            720 
                            721 	;-
   515B 03                  722 	.DB #0b00000011
   515C 0F                  723 	.DB #0b00001111
   515D 3F                  724 	.DB #0b00111111
   515E FF                  725 	.DB #0b11111111
   515F 3F                  726 	.DB #0b00111111
   5160 0F                  727 	.DB #0b00001111
   5161 03                  728 	.DB #0b00000011
   5162 00                  729 	.DB #0b00000000
