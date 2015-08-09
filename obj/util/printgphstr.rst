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
   47DA                      12 _cpc_PrintGphStr2X::
                             13 ;preparación datos impresión. El ancho y alto son fijos!
                             14 ;	LD IX,#2
                             15 ;	ADD IX,SP
                             16 ;	LD L,2 (IX)
                             17 ;	LD H,3 (IX)	;DESTINO
                             18 ;  	LD E,0 (IX)
                             19 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             20 
   47DA F1            [10]   21 	POP AF
   47DB D1            [10]   22 	POP DE
   47DC E1            [10]   23 	POP HL
   47DD E5            [11]   24 	PUSH HL
   47DE D5            [11]   25 	PUSH DE
   47DF F5            [11]   26 	PUSH AF
                             27 
   47E0 3E 01         [ 7]   28 	LD A,#1
   47E2 C3 EB 47      [10]   29  	JP cpc_PrintGphStr0
                             30 
                             31 
                             32 .globl _cpc_PrintGphStr
                             33 
   47E5                      34 _cpc_PrintGphStr::
                             35 ;preparación datos impresión. El ancho y alto son fijos!
                             36 ;	LD IX,#2
                             37 ;	ADD IX,SP
                             38 ;	LD L,2 (IX)
                             39 ;	LD H,3 (IX)	;DESTINO
                             40 ;	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
                             41 ;  	LD E,0 (IX)
                             42 ;	LD D,1 (IX)	;TEXTO ORIGEN
                             43 
   47E5 F1            [10]   44 	POP AF 
   47E6 D1            [10]   45 	POP DE
   47E7 E1            [10]   46 	POP	HL
   47E8 E5            [11]   47 	PUSH HL
   47E9 D5            [11]   48 	PUSH DE
   47EA F5            [11]   49 	PUSH AF
                             50 
   47EB                      51 cpc_PrintGphStr0:
                             52 
                             53 	;DE destino
                             54 	;HL origen
                             55 	;ex de,hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   47EB 32 B1 48      [13]   56 	LD (#doble),A
                             57 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                             58 	;la impresión en curso.
   47EE 3A B2 48      [13]   59 	LD A,(#imprimiendo)
   47F1 FE 01         [ 7]   60 	CP #1
   47F3 CA 10 48      [10]   61 	JP Z,add_elemento
   47F6 22 B3 48      [16]   62 	LD (#direcc_destino),HL
   47F9 EB            [ 4]   63 	EX DE,HL
   47FA CD 66 48      [17]   64 	CALL bucle_texto0
                             65 
                             66 ;antes de terminar, se mira si hay algo en cola.
   47FD                      67 bucle_cola_impresion:
   47FD 3A 56 48      [13]   68 	LD A,(#elementos_cola)
   4800 B7            [ 4]   69 	OR A
   4801 CA 0A 48      [10]   70 	JP Z,terminar_impresion
   4804 CD 33 48      [17]   71 	CALL leer_elemento
   4807 C3 FD 47      [10]   72 	JP bucle_cola_impresion
                             73 
                             74 
   480A                      75 terminar_impresion:
   480A AF            [ 4]   76 	XOR A
   480B 32 B2 48      [13]   77 	LD (#imprimiendo),A
   480E C9            [10]   78 	RET
   480F                      79 entrar_cola_impresion:
                             80 ;si se está imprimiendo se mete el valor en la cola
   480F C9            [10]   81 	RET
   4810                      82 add_elemento:
   4810 F3            [ 4]   83 	DI
   4811 DD 2A 58 48   [20]   84 	LD IX,(#pos_cola)
   4815 DD 75 00      [19]   85 	LD 0 (IX),L
   4818 DD 74 01      [19]   86 	LD 1 (IX),H
   481B DD 73 02      [19]   87 	LD 2 (IX),E
   481E DD 72 03      [19]   88 	LD 3 (IX),D
   4821 DD 23         [10]   89 	INC IX
   4823 DD 23         [10]   90 	INC IX
   4825 DD 23         [10]   91 	INC IX
   4827 DD 23         [10]   92 	INC IX
   4829 DD 22 58 48   [20]   93 	LD (#pos_cola),IX
                             94 
   482D 21 56 48      [10]   95 	LD HL,#elementos_cola
   4830 34            [11]   96 	INC (HL)
                             97 	;Se añaden los valores hl y de
   4831 FB            [ 4]   98 	EI
   4832 C9            [10]   99 	RET
   4833                     100 leer_elemento:
   4833 F3            [ 4]  101 	DI
   4834 DD 2A 58 48   [20]  102 	LD IX,(#pos_cola)
   4838 DD 6E 00      [19]  103 	LD L,0 (IX)
   483B DD 66 01      [19]  104 	LD H,1 (IX)
   483E DD 5E 02      [19]  105 	LD E,2 (IX)
   4841 DD 56 04      [19]  106 	LD D,4 (IX)
   4844 DD 2B         [10]  107 	DEC IX
   4846 DD 2B         [10]  108 	DEC IX
   4848 DD 2B         [10]  109 	DEC IX
   484A DD 2B         [10]  110 	DEC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



   484C DD 22 58 48   [20]  111 	LD (#pos_cola),IX
   4850 21 56 48      [10]  112 	LD HL,#elementos_cola
   4853 35            [11]  113 	DEC (HL)
   4854 FB            [ 4]  114 	EI
   4855 C9            [10]  115 	RET
                            116 
   4856                     117 elementos_cola:
   4856 00 00               118 	.DW #0				; defw 0
   4858                     119 pos_cola:
   4858 5A 48               120 	.DW #cola_impresion ;defw cola_impresion
                            121 						;pos_escritura_cola defw cola_impresion
   485A                     122 cola_impresion:  		; defs 12
   485A 00 00 00 00 00 00   123 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   4866                     124 bucle_texto0:
   4866 3E 01         [ 7]  125 	LD A,#1
   4868 32 B2 48      [13]  126 	LD (imprimiendo),A
                            127 
   486B 3A 75 49      [13]  128 	LD A,(first_char)
   486E 47            [ 4]  129 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            130 
   486F 7E            [ 7]  131 	LD A,(HL)
   4870 B7            [ 4]  132 	OR A ;CP 0
   4871 C8            [11]  133 	RET Z
   4872 90            [ 4]  134 	SUB B
   4873 01 76 49      [10]  135 	LD BC,#cpc_Chars	;apunto a la primera letra
   4876 E5            [11]  136 	PUSH HL
                            137 
   4877 6F            [ 4]  138 	LD L,A		;en A tengo la letra que sería
   4878 26 00         [ 7]  139 	LD H,#0
   487A 29            [11]  140 	ADD HL,HL
   487B 29            [11]  141 	ADD HL,HL
   487C 29            [11]  142 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   487D 09            [11]  143 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   487E CD E9 48      [17]  144 	CALL escribe_letra
   4881 3A B1 48      [13]  145 	LD A,(doble)
   4884 FE 01         [ 7]  146 	CP #1
                            147 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   4886 CC D0 48      [17]  148 	CALL Z, doblar_letra
   4889 2A B3 48      [16]  149 	LD HL,(#direcc_destino)
   488C 3A B1 48      [13]  150 	LD A,(doble)
   488F FE 01         [ 7]  151 	CP #1
                            152 	;alto
   4891 28 08         [12]  153 	JR Z,cont_doble
   4893 11 45 49      [10]  154 	LD DE,#letra_decodificada
   4896 FD                  155 	.DB #0xfD
   4897 26 08         [ 7]  156 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   4899 18 06         [12]  157 	JR cont_tot
                            158 
                            159 
   489B                     160 cont_doble:
   489B 11 55 49      [10]  161 	LD DE,#letra_decodificada_tmp
   489E FD                  162 	.DB #0xfD
   489F 26 10         [ 7]  163 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   48A1                     165 cont_tot:
   48A1 CD B5 48      [17]  166 	CALL cpc_PutSp0
   48A4 2A B3 48      [16]  167 	LD HL,(#direcc_destino)
   48A7 23            [ 6]  168 	INC HL
   48A8 23            [ 6]  169 	INC HL
   48A9 22 B3 48      [16]  170 	LD (#direcc_destino),HL
   48AC E1            [10]  171 	POP HL
   48AD 23            [ 6]  172 	INC HL
   48AE C3 66 48      [10]  173 	JP bucle_texto0
                            174 
                            175 
   48B1                     176 doble:
   48B1 00                  177 	.DB #0
   48B2                     178 imprimiendo:
   48B2 00                  179 	.DB #0
   48B3                     180 direcc_destino:
   48B3 00 00               181 	.DW #0
                            182 
                            183 
   48B5                     184 cpc_PutSp0:
                            185 ;	.DB #0xfD
                            186 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   48B5 06 07         [ 7]  187 	LD B,#7
   48B7 48            [ 4]  188 	LD C,B
   48B8                     189 loop_alto_2:
                            190 
   48B8                     191 loop_ancho_2:
   48B8 EB            [ 4]  192 	EX DE,HL
   48B9 ED A0         [16]  193 	LDI
   48BB ED A0         [16]  194 	LDI
   48BD FD                  195 	.DB #0XFD
   48BE 25            [ 4]  196 	DEC H
   48BF C8            [11]  197 	RET Z
   48C0 EB            [ 4]  198 	EX DE,HL
   48C1                     199 salto_linea:
   48C1 0E FE         [ 7]  200 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   48C3 09            [11]  201 	ADD HL,BC
   48C4 D2 B8 48      [10]  202 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   48C7 01 50 C0      [10]  203 	LD BC,#0XC050
   48CA 09            [11]  204 	ADD HL,BC
   48CB 06 07         [ 7]  205 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   48CD C3 B8 48      [10]  206 	JP loop_alto_2
                            207 
                            208 
                            209 
                            210 
   48D0                     211 doblar_letra:
   48D0 21 45 49      [10]  212 	LD HL,#letra_decodificada
   48D3 11 55 49      [10]  213 	LD DE,#letra_decodificada_tmp
   48D6 06 08         [ 7]  214 	LD B,#8
   48D8                     215 buc_doblar_letra:
   48D8 7E            [ 7]  216 	LD A,(HL)
   48D9 23            [ 6]  217 	INC HL
   48DA 12            [ 7]  218 	LD (DE),A
   48DB 13            [ 6]  219 	INC DE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   48DC 13            [ 6]  220 	INC DE
   48DD 12            [ 7]  221 	LD (DE),A
   48DE 1B            [ 6]  222 	DEC DE
   48DF 7E            [ 7]  223 	LD A,(HL)
   48E0 23            [ 6]  224 	INC HL
   48E1 12            [ 7]  225 	LD (DE),A
   48E2 13            [ 6]  226 	INC DE
   48E3 13            [ 6]  227 	INC DE
   48E4 12            [ 7]  228 	LD (DE),A
   48E5 13            [ 6]  229 	INC DE
   48E6 10 F0         [13]  230 	DJNZ buc_doblar_letra
   48E8 C9            [10]  231 	RET
                            232 
                            233 
   48E9                     234 escribe_letra:		; Code by Kevin Thacker
   48E9 D5            [11]  235 	PUSH DE
   48EA FD 21 45 49   [14]  236 	LD IY,#letra_decodificada
   48EE 06 08         [ 7]  237 	LD B,#8
   48F0                     238 bucle_alto_letra:
   48F0 C5            [11]  239 	PUSH BC
   48F1 E5            [11]  240 	PUSH HL
   48F2 5E            [ 7]  241 	LD E,(HL)
   48F3 CD 0A 49      [17]  242 	CALL op_colores
   48F6 FD 72 00      [19]  243 	LD (IY),D
   48F9 FD 23         [10]  244 	INC IY
   48FB CD 0A 49      [17]  245 	CALL op_colores
   48FE FD 72 00      [19]  246 	LD (IY),D
   4901 FD 23         [10]  247 	INC IY
   4903 E1            [10]  248 	POP HL
   4904 23            [ 6]  249 	INC HL
   4905 C1            [10]  250 	POP BC
   4906 10 E8         [13]  251 	DJNZ bucle_alto_letra
   4908 D1            [10]  252 	POP DE
   4909 C9            [10]  253 	RET
                            254 
   490A                     255 op_colores:
   490A 16 00         [ 7]  256 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   490C CD 17 49      [17]  257 	CALL op_colores_pixel	;; do pixel 0
   490F CB 02         [ 8]  258 	RLC D
   4911 CD 17 49      [17]  259 	CALL op_colores_pixel
   4914 CB 0A         [ 8]  260 	RRC D
   4916 C9            [10]  261 	RET
                            262 
                            263 ;; follow through to do pixel 1
                            264 
   4917                     265 op_colores_pixel:
                            266 	;; shift out pixel into bits 0 and 1 (source)
   4917 CB 03         [ 8]  267 	RLC E
   4919 CB 03         [ 8]  268 	RLC E
                            269 	;; isolate
   491B 7B            [ 4]  270 	LD A,E
   491C E6 03         [ 7]  271 	AND #0X3
   491E 21 41 49      [10]  272 	LD HL,#colores_b0
   4921 85            [ 4]  273 	ADD A,L
   4922 6F            [ 4]  274 	LD L,A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   4923 7C            [ 4]  275 	LD A,H
   4924 CE 00         [ 7]  276 	ADC A,#0
   4926 67            [ 4]  277 	LD H,A
                            278 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   4927 7A            [ 4]  279 	LD A,D
   4928 B6            [ 7]  280 	OR (HL)
   4929 57            [ 4]  281 	LD D,A
   492A C9            [10]  282 	RET
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
   492B                     300  _cpc_SetInkGphStr::
   492B 21 02 00      [10]  301  	LD HL,#2
   492E 44            [ 4]  302  	LD B,H
   492F 39            [11]  303  	ADD HL,SP
                            304 
   4930 4E            [ 7]  305  	LD C, (HL)
   4931 23            [ 6]  306  	INC HL
   4932 7E            [ 7]  307  	LD A,(HL)
                            308 
   4933 21 41 49      [10]  309  	LD HL,#colores_b0
   4936 09            [11]  310  	ADD HL,BC
   4937 77            [ 7]  311  	LD (HL),A
   4938 C9            [10]  312  	RET
                            313 
   4939                     314 colores_cambM1:
   4939                     315 colores_m1:
   4939 00 88 80 08         316 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
                            317 
                            318 ;defb @00000000,  @01010100, @00010000, @00000101  ;@00000001, @00000101, @00010101, @00000000
                            319 
                            320 
                            321 
                            322 ;DEFC direcc_destino0_m1 = direcc_destino
                            323 ;DEFC colores_cambM1 = colores_m1
                            324 
                            325 
   493D                     326 dato:
   493D 1B                  327 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            328 
   493E                     329 byte_tmp:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   493E 00                  330 	.DB #0
   493F 00                  331 	.DB #0
   4940 00                  332 	.DB #0  ;defs 3
   4941                     333 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            334 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   4941 0A 20 A0 28         335 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            336 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            337 
   4945                     338 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   4945 00 00 00 00 00 00   339 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   494D 00 00 00 00 00 00   340 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4955                     341 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   4955 00 00 00 00 00 00   342 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   495D 00 00 00 00 00 00   343 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4965 00 00 00 00 00 00   344 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   496D 00 00 00 00 00 00   345 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            346 
                            347 
   4975                     348 first_char:
   4975 2F                  349 	.DB #47	;first defined char number (ASCII)
                            350 
   4976                     351 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            352 	;/
   4976 01                  353 	.DB #0b00000001
   4977 01                  354 	.DB #0b00000001
   4978 08                  355 	.DB #0b00001000
   4979 08                  356 	.DB #0b00001000
   497A 3C                  357 	.DB #0b00111100
   497B 30                  358 	.DB #0b00110000
   497C 30                  359 	.DB #0b00110000
   497D 00                  360 	.DB #0b00000000
                            361 ;0-9
   497E 54                  362 .db #0b01010100
   497F 44                  363 .db #0b01000100
   4980 88                  364 .db #0b10001000
   4981 88                  365 .db #0b10001000
   4982 88                  366 .db #0b10001000
   4983 CC                  367 .db #0b11001100
   4984 FC                  368 .db #0b11111100
   4985 00                  369 .db #0b00000000
   4986 10                  370 .db #0b00010000
   4987 50                  371 .db #0b01010000
   4988 20                  372 .db #0b00100000
   4989 20                  373 .db #0b00100000
   498A 20                  374 .db #0b00100000
   498B 30                  375 .db #0b00110000
   498C FC                  376 .db #0b11111100
   498D 00                  377 .db #0b00000000
   498E 54                  378 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   498F 44                  379 .db #0b01000100
   4990 08                  380 .db #0b00001000
   4991 A8                  381 .db #0b10101000
   4992 80                  382 .db #0b10000000
   4993 CC                  383 .db #0b11001100
   4994 FC                  384 .db #0b11111100
   4995 00                  385 .db #0b00000000
   4996 54                  386 .db #0b01010100
   4997 44                  387 .db #0b01000100
   4998 08                  388 .db #0b00001000
   4999 28                  389 .db #0b00101000
   499A 08                  390 .db #0b00001000
   499B CC                  391 .db #0b11001100
   499C FC                  392 .db #0b11111100
   499D 00                  393 .db #0b00000000
   499E 44                  394 .db #0b01000100
   499F 44                  395 .db #0b01000100
   49A0 88                  396 .db #0b10001000
   49A1 A8                  397 .db #0b10101000
   49A2 08                  398 .db #0b00001000
   49A3 0C                  399 .db #0b00001100
   49A4 0C                  400 .db #0b00001100
   49A5 00                  401 .db #0b00000000
   49A6 54                  402 .db #0b01010100
   49A7 44                  403 .db #0b01000100
   49A8 80                  404 .db #0b10000000
   49A9 A8                  405 .db #0b10101000
   49AA 08                  406 .db #0b00001000
   49AB CC                  407 .db #0b11001100
   49AC FC                  408 .db #0b11111100
   49AD 00                  409 .db #0b00000000
   49AE 54                  410 .db #0b01010100
   49AF 44                  411 .db #0b01000100
   49B0 80                  412 .db #0b10000000
   49B1 A8                  413 .db #0b10101000
   49B2 88                  414 .db #0b10001000
   49B3 CC                  415 .db #0b11001100
   49B4 FC                  416 .db #0b11111100
   49B5 00                  417 .db #0b00000000
   49B6 54                  418 .db #0b01010100
   49B7 44                  419 .db #0b01000100
   49B8 08                  420 .db #0b00001000
   49B9 08                  421 .db #0b00001000
   49BA 20                  422 .db #0b00100000
   49BB 30                  423 .db #0b00110000
   49BC 30                  424 .db #0b00110000
   49BD 00                  425 .db #0b00000000
   49BE 54                  426 .db #0b01010100
   49BF 44                  427 .db #0b01000100
   49C0 88                  428 .db #0b10001000
   49C1 A8                  429 .db #0b10101000
   49C2 88                  430 .db #0b10001000
   49C3 CC                  431 .db #0b11001100
   49C4 FC                  432 .db #0b11111100
   49C5 00                  433 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   49C6 54                  434 .db #0b01010100
   49C7 44                  435 .db #0b01000100
   49C8 88                  436 .db #0b10001000
   49C9 A8                  437 .db #0b10101000
   49CA 08                  438 .db #0b00001000
   49CB CC                  439 .db #0b11001100
   49CC FC                  440 .db #0b11111100
   49CD 00                  441 .db #0b00000000
                            442 
                            443 
                            444 
                            445 
                            446 
                            447 
                            448 	;:
   49CE 00                  449 	.DB #0b00000000
   49CF 00                  450 	.DB #0b00000000
   49D0 20                  451 	.DB #0b00100000
   49D1 00                  452 	.DB #0b00000000
   49D2 30                  453 	.DB #0b00110000
   49D3 00                  454 	.DB #0b00000000
   49D4 00                  455 	.DB #0b00000000
   49D5 00                  456 	.DB #0b00000000
                            457 	;SPC (;)
   49D6 00 00 00 00 00 00   458 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            459 	;.   (<)
   49DE 00                  460 	.DB #0b00000000
   49DF 00                  461 	.DB #0b00000000
   49E0 00                  462 	.DB #0b00000000
   49E1 00                  463 	.DB #0b00000000
   49E2 00                  464 	.DB #0b00000000
   49E3 00                  465 	.DB #0b00000000
   49E4 C0                  466 	.DB #0b11000000
   49E5 00                  467 	.DB #0b00000000
                            468 	;Ñ    (=)
   49E6 00                  469 .db #0b00000000
   49E7 54                  470 .db #0b01010100
   49E8 00                  471 .db #0b00000000
   49E9 A0                  472 .db #0b10100000
   49EA 88                  473 .db #0b10001000
   49EB CC                  474 .db #0b11001100
   49EC CC                  475 .db #0b11001100
   49ED 00                  476 .db #0b00000000
                            477 
                            478 	; !	(>)
   49EE 00                  479 	.DB #0b00000000
   49EF 10                  480 	.DB #0b00010000
   49F0 20                  481 	.DB #0b00100000
   49F1 20                  482 	.DB #0b00100000
   49F2 30                  483 	.DB #0b00110000
   49F3 00                  484 	.DB #0b00000000
   49F4 30                  485 	.DB #0b00110000
   49F5 00                  486 	.DB #0b00000000
                            487 	;-> (?)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   49F6 00                  488 	.DB #0b00000000
   49F7 00                  489 	.DB #0b00000000
   49F8 80                  490 	.DB #0b10000000
   49F9 A0                  491 	.DB #0b10100000
   49FA FC                  492 	.DB #0b11111100
   49FB FC                  493 	.DB #0b11111100
   49FC 00                  494 	.DB #0b00000000
   49FD 00                  495 	.DB #0b00000000
                            496 	;-  (@)
   49FE 00                  497 	.DB #0b00000000
   49FF 00                  498 	.DB #0b00000000
   4A00 00                  499 	.DB #0b00000000
   4A01 A8                  500 	.DB #0b10101000
   4A02 FC                  501 	.DB #0b11111100
   4A03 00                  502 	.DB #0b00000000
   4A04 00                  503 	.DB #0b00000000
   4A05 00                  504 	.DB #0b00000000
                            505 
                            506 
                            507 
                            508 ;A-Z
   4A06 00                  509 .db #0b00000000
   4A07 54                  510 .db #0b01010100
   4A08 88                  511 .db #0b10001000
   4A09 88                  512 .db #0b10001000
   4A0A A8                  513 .db #0b10101000
   4A0B CC                  514 .db #0b11001100
   4A0C CC                  515 .db #0b11001100
   4A0D 00                  516 .db #0b00000000
   4A0E 00                  517 .db #0b00000000
   4A0F 54                  518 .db #0b01010100
   4A10 88                  519 .db #0b10001000
   4A11 A8                  520 .db #0b10101000
   4A12 88                  521 .db #0b10001000
   4A13 CC                  522 .db #0b11001100
   4A14 FC                  523 .db #0b11111100
   4A15 00                  524 .db #0b00000000
   4A16 00                  525 .db #0b00000000
   4A17 54                  526 .db #0b01010100
   4A18 88                  527 .db #0b10001000
   4A19 80                  528 .db #0b10000000
   4A1A 88                  529 .db #0b10001000
   4A1B CC                  530 .db #0b11001100
   4A1C FC                  531 .db #0b11111100
   4A1D 00                  532 .db #0b00000000
   4A1E 00                  533 .db #0b00000000
   4A1F 54                  534 .db #0b01010100
   4A20 88                  535 .db #0b10001000
   4A21 88                  536 .db #0b10001000
   4A22 88                  537 .db #0b10001000
   4A23 CC                  538 .db #0b11001100
   4A24 F0                  539 .db #0b11110000
   4A25 00                  540 .db #0b00000000
   4A26 00                  541 .db #0b00000000
   4A27 54                  542 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   4A28 80                  543 .db #0b10000000
   4A29 A8                  544 .db #0b10101000
   4A2A 80                  545 .db #0b10000000
   4A2B CC                  546 .db #0b11001100
   4A2C FC                  547 .db #0b11111100
   4A2D 00                  548 .db #0b00000000
   4A2E 00                  549 .db #0b00000000
   4A2F 54                  550 .db #0b01010100
   4A30 80                  551 .db #0b10000000
   4A31 A8                  552 .db #0b10101000
   4A32 80                  553 .db #0b10000000
   4A33 C0                  554 .db #0b11000000
   4A34 C0                  555 .db #0b11000000
   4A35 00                  556 .db #0b00000000
   4A36 00                  557 .db #0b00000000
   4A37 54                  558 .db #0b01010100
   4A38 88                  559 .db #0b10001000
   4A39 80                  560 .db #0b10000000
   4A3A A8                  561 .db #0b10101000
   4A3B CC                  562 .db #0b11001100
   4A3C FC                  563 .db #0b11111100
   4A3D 00                  564 .db #0b00000000
   4A3E 00                  565 .db #0b00000000
   4A3F 44                  566 .db #0b01000100
   4A40 88                  567 .db #0b10001000
   4A41 88                  568 .db #0b10001000
   4A42 A8                  569 .db #0b10101000
   4A43 CC                  570 .db #0b11001100
   4A44 CC                  571 .db #0b11001100
   4A45 00                  572 .db #0b00000000
   4A46 00                  573 .db #0b00000000
   4A47 54                  574 .db #0b01010100
   4A48 20                  575 .db #0b00100000
   4A49 20                  576 .db #0b00100000
   4A4A 20                  577 .db #0b00100000
   4A4B 30                  578 .db #0b00110000
   4A4C FC                  579 .db #0b11111100
   4A4D 00                  580 .db #0b00000000
   4A4E 00                  581 .db #0b00000000
   4A4F 54                  582 .db #0b01010100
   4A50 A8                  583 .db #0b10101000
   4A51 08                  584 .db #0b00001000
   4A52 08                  585 .db #0b00001000
   4A53 CC                  586 .db #0b11001100
   4A54 FC                  587 .db #0b11111100
   4A55 00                  588 .db #0b00000000
   4A56 00                  589 .db #0b00000000
   4A57 44                  590 .db #0b01000100
   4A58 88                  591 .db #0b10001000
   4A59 A0                  592 .db #0b10100000
   4A5A 88                  593 .db #0b10001000
   4A5B CC                  594 .db #0b11001100
   4A5C CC                  595 .db #0b11001100
   4A5D 00                  596 .db #0b00000000
   4A5E 00                  597 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   4A5F 40                  598 .db #0b01000000
   4A60 80                  599 .db #0b10000000
   4A61 80                  600 .db #0b10000000
   4A62 80                  601 .db #0b10000000
   4A63 CC                  602 .db #0b11001100
   4A64 FC                  603 .db #0b11111100
   4A65 00                  604 .db #0b00000000
   4A66 00                  605 .db #0b00000000
   4A67 54                  606 .db #0b01010100
   4A68 A8                  607 .db #0b10101000
   4A69 88                  608 .db #0b10001000
   4A6A 88                  609 .db #0b10001000
   4A6B CC                  610 .db #0b11001100
   4A6C CC                  611 .db #0b11001100
   4A6D 00                  612 .db #0b00000000
   4A6E 00                  613 .db #0b00000000
   4A6F 50                  614 .db #0b01010000
   4A70 88                  615 .db #0b10001000
   4A71 88                  616 .db #0b10001000
   4A72 88                  617 .db #0b10001000
   4A73 CC                  618 .db #0b11001100
   4A74 CC                  619 .db #0b11001100
   4A75 00                  620 .db #0b00000000
   4A76 00                  621 .db #0b00000000
   4A77 54                  622 .db #0b01010100
   4A78 88                  623 .db #0b10001000
   4A79 88                  624 .db #0b10001000
   4A7A 88                  625 .db #0b10001000
   4A7B CC                  626 .db #0b11001100
   4A7C FC                  627 .db #0b11111100
   4A7D 00                  628 .db #0b00000000
   4A7E 00                  629 .db #0b00000000
   4A7F 54                  630 .db #0b01010100
   4A80 88                  631 .db #0b10001000
   4A81 88                  632 .db #0b10001000
   4A82 A8                  633 .db #0b10101000
   4A83 C0                  634 .db #0b11000000
   4A84 C0                  635 .db #0b11000000
   4A85 00                  636 .db #0b00000000
   4A86 00                  637 .db #0b00000000
   4A87 54                  638 .db #0b01010100
   4A88 88                  639 .db #0b10001000
   4A89 88                  640 .db #0b10001000
   4A8A 88                  641 .db #0b10001000
   4A8B FC                  642 .db #0b11111100
   4A8C FC                  643 .db #0b11111100
   4A8D 00                  644 .db #0b00000000
   4A8E 00                  645 .db #0b00000000
   4A8F 54                  646 .db #0b01010100
   4A90 88                  647 .db #0b10001000
   4A91 88                  648 .db #0b10001000
   4A92 A0                  649 .db #0b10100000
   4A93 CC                  650 .db #0b11001100
   4A94 CC                  651 .db #0b11001100
   4A95 00                  652 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   4A96 00                  653 .db #0b00000000
   4A97 54                  654 .db #0b01010100
   4A98 80                  655 .db #0b10000000
   4A99 A8                  656 .db #0b10101000
   4A9A 08                  657 .db #0b00001000
   4A9B CC                  658 .db #0b11001100
   4A9C FC                  659 .db #0b11111100
   4A9D 00                  660 .db #0b00000000
   4A9E 00                  661 .db #0b00000000
   4A9F 54                  662 .db #0b01010100
   4AA0 20                  663 .db #0b00100000
   4AA1 20                  664 .db #0b00100000
   4AA2 20                  665 .db #0b00100000
   4AA3 30                  666 .db #0b00110000
   4AA4 30                  667 .db #0b00110000
   4AA5 00                  668 .db #0b00000000
   4AA6 00                  669 .db #0b00000000
   4AA7 44                  670 .db #0b01000100
   4AA8 88                  671 .db #0b10001000
   4AA9 88                  672 .db #0b10001000
   4AAA 88                  673 .db #0b10001000
   4AAB CC                  674 .db #0b11001100
   4AAC FC                  675 .db #0b11111100
   4AAD 00                  676 .db #0b00000000
   4AAE 00                  677 .db #0b00000000
   4AAF 44                  678 .db #0b01000100
   4AB0 88                  679 .db #0b10001000
   4AB1 88                  680 .db #0b10001000
   4AB2 88                  681 .db #0b10001000
   4AB3 CC                  682 .db #0b11001100
   4AB4 30                  683 .db #0b00110000
   4AB5 00                  684 .db #0b00000000
   4AB6 00                  685 .db #0b00000000
   4AB7 44                  686 .db #0b01000100
   4AB8 88                  687 .db #0b10001000
   4AB9 88                  688 .db #0b10001000
   4ABA 88                  689 .db #0b10001000
   4ABB FC                  690 .db #0b11111100
   4ABC CC                  691 .db #0b11001100
   4ABD 00                  692 .db #0b00000000
   4ABE 00                  693 .db #0b00000000
   4ABF 44                  694 .db #0b01000100
   4AC0 88                  695 .db #0b10001000
   4AC1 A0                  696 .db #0b10100000
   4AC2 20                  697 .db #0b00100000
   4AC3 CC                  698 .db #0b11001100
   4AC4 CC                  699 .db #0b11001100
   4AC5 00                  700 .db #0b00000000
   4AC6 00                  701 .db #0b00000000
   4AC7 44                  702 .db #0b01000100
   4AC8 88                  703 .db #0b10001000
   4AC9 88                  704 .db #0b10001000
   4ACA 20                  705 .db #0b00100000
   4ACB 30                  706 .db #0b00110000
   4ACC 30                  707 .db #0b00110000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   4ACD 00                  708 .db #0b00000000
   4ACE 00                  709 .db #0b00000000
   4ACF 54                  710 .db #0b01010100
   4AD0 08                  711 .db #0b00001000
   4AD1 20                  712 .db #0b00100000
   4AD2 80                  713 .db #0b10000000
   4AD3 CC                  714 .db #0b11001100
   4AD4 FC                  715 .db #0b11111100
   4AD5 00                  716 .db #0b00000000
                            717 
                            718 
                            719 
                            720 
                            721 	;-
   4AD6 03                  722 	.DB #0b00000011
   4AD7 0F                  723 	.DB #0b00001111
   4AD8 3F                  724 	.DB #0b00111111
   4AD9 FF                  725 	.DB #0b11111111
   4ADA 3F                  726 	.DB #0b00111111
   4ADB 0F                  727 	.DB #0b00001111
   4ADC 03                  728 	.DB #0b00000011
   4ADD 00                  729 	.DB #0b00000000
