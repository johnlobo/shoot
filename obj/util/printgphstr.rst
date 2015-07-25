ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   46EB                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   46EB 32 18 47      [13]   11 	LD (#inc_ancho+1),A
   46EE 7D            [ 4]   12 	LD A,L
   46EF CB 3F         [ 8]   13 	SRL A
   46F1 CB 3F         [ 8]   14 	SRL A
   46F3 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   46F5 57            [ 4]   17 	LD D,A						;D
   46F6 CB 27         [ 8]   18 	SLA A
   46F8 CB 27         [ 8]   19 	SLA A
   46FA CB 27         [ 8]   20 	SLA A
   46FC 95            [ 4]   21 	SUB L
   46FD ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   46FF 5F            [ 4]   24 	LD E,A						;E
   4700 6A            [ 4]   25 	LD L,D
   4701 26 00         [ 7]   26 	LD H,#0
   4703 29            [11]   27 	ADD HL,HL
   4704 01 1B 47      [10]   28 	LD BC,#bloques
   4707 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   4708 4E            [ 7]   31 	LD C,(HL)
   4709 23            [ 6]   32 	INC HL
   470A 66            [ 7]   33 	LD H,(HL)
   470B 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   470C E5            [11]   36 	PUSH HL
   470D 16 00         [ 7]   37 	LD D,#0
   470F 21 4D 47      [10]   38 	LD HL,#sub_bloques
   4712 19            [11]   39 	ADD HL,DE
   4713 7E            [ 7]   40 	LD A,(HL)
   4714 E1            [10]   41 	POP HL
   4715 84            [ 4]   42 	ADD H
   4716 67            [ 4]   43 	LD H,A
   4717                      44 inc_ancho:
   4717 1E 00         [ 7]   45 	LD E,#0
   4719 19            [11]   46 	ADD HL,DE
   471A C9            [10]   47 	RET
                             48 
   471B                      49 bloques:
   471B 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   474D                      51 sub_bloques:
   474D 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   4755                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   4755 DD 21 02 00   [14]   65 	LD IX,#2
   4759 DD 39         [15]   66 	ADD IX,SP
   475B DD 6E 02      [19]   67 	LD L,2 (IX)
   475E DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   4761 DD 5E 00      [19]   69    	LD E,0 (IX)
   4764 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   4767 3E 01         [ 7]   71 	LD A,#1
   4769 C3 B0 47      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   476C                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   476C DD 21 02 00   [14]   80 	LD IX,#2
   4770 DD 39         [15]   81 	ADD IX,SP
   4772 DD 6E 03      [19]   82  	LD L,3 (IX)
   4775 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   4778 CD EB 46      [17]   84 	CALL cpc_GetScrAddress0
   477B DD 5E 00      [19]   85    	LD E,0 (IX)
   477E DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   4781 3E 01         [ 7]   87 	LD A,#1
   4783 C3 B0 47      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   4786                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   4786 DD 21 02 00   [14]   94 	LD IX,#2
   478A DD 39         [15]   95 	ADD IX,SP
   478C DD 6E 03      [19]   96  	LD L,3 (IX)
   478F DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   4792 CD EB 46      [17]   98 	CALL cpc_GetScrAddress0
   4795 DD 5E 00      [19]   99    	LD E,0 (IX)
   4798 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   479B C3 B0 47      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   479E                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   479E DD 21 02 00   [14]  108 	LD IX,#2
   47A2 DD 39         [15]  109 	ADD IX,SP
   47A4 DD 6E 02      [19]  110 	LD L,2 (IX)
   47A7 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   47AA DD 5E 00      [19]  113    	LD E,0 (IX)
   47AD DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   47B0                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   47B0 32 76 48      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   47B3 3A 77 48      [13]  125 	LD A,(#imprimiendo)
   47B6 FE 01         [ 7]  126 	CP #1
   47B8 CA D5 47      [10]  127 	JP Z,add_elemento
   47BB 22 78 48      [16]  128 	LD (#direcc_destino),HL
   47BE EB            [ 4]  129 	EX DE,HL
   47BF CD 2B 48      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   47C2                     133 bucle_cola_impresion:
   47C2 3A 1B 48      [13]  134 	LD A,(#elementos_cola)
   47C5 B7            [ 4]  135 	OR A
   47C6 CA CF 47      [10]  136 	JP Z,terminar_impresion
   47C9 CD F8 47      [17]  137 	CALL leer_elemento
   47CC C3 C2 47      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   47CF                     141 terminar_impresion:
   47CF AF            [ 4]  142 	XOR A
   47D0 32 77 48      [13]  143 	LD (#imprimiendo),A
   47D3 C9            [10]  144 	RET
   47D4                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   47D4 C9            [10]  147 	RET
   47D5                     148 add_elemento:
   47D5 F3            [ 4]  149 	DI
   47D6 DD 2A 1D 48   [20]  150 	LD IX,(#pos_cola)
   47DA DD 75 00      [19]  151 	LD 0 (IX),L
   47DD DD 74 01      [19]  152 	LD 1 (IX),H
   47E0 DD 73 02      [19]  153 	LD 2 (IX),E
   47E3 DD 72 03      [19]  154 	LD 3 (IX),D
   47E6 DD 23         [10]  155 	INC IX
   47E8 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   47EA DD 23         [10]  157 	INC IX
   47EC DD 23         [10]  158 	INC IX
   47EE DD 22 1D 48   [20]  159 	LD (#pos_cola),IX
                            160 
   47F2 21 1B 48      [10]  161 	LD HL,#elementos_cola
   47F5 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   47F6 FB            [ 4]  164 	EI
   47F7 C9            [10]  165 	RET
   47F8                     166 leer_elemento:
   47F8 F3            [ 4]  167 	DI
   47F9 DD 2A 1D 48   [20]  168 	LD IX,(#pos_cola)
   47FD DD 6E 00      [19]  169 	LD L,0 (IX)
   4800 DD 66 01      [19]  170 	LD H,1 (IX)
   4803 DD 5E 02      [19]  171 	LD E,2 (IX)
   4806 DD 56 04      [19]  172 	LD D,4 (IX)
   4809 DD 2B         [10]  173 	DEC IX
   480B DD 2B         [10]  174 	DEC IX
   480D DD 2B         [10]  175 	DEC IX
   480F DD 2B         [10]  176 	DEC IX
   4811 DD 22 1D 48   [20]  177 	LD (#pos_cola),IX
   4815 21 1B 48      [10]  178 	LD HL,#elementos_cola
   4818 35            [11]  179 	DEC (HL)
   4819 FB            [ 4]  180 	EI
   481A C9            [10]  181 	RET
                            182 
   481B                     183 elementos_cola:
   481B 00 00               184 	.DW #0				; defw 0
   481D                     185 pos_cola:
   481D 1F 48               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   481F                     188 cola_impresion:  		; defs 12
   481F 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   482B                     190 bucle_texto0:
   482B 3E 01         [ 7]  191 	LD A,#1
   482D 32 77 48      [13]  192 	LD (imprimiendo),A
                            193 
   4830 3A 94 4A      [13]  194 	LD A,(first_char)
   4833 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   4834 7E            [ 7]  197 	LD A,(HL)
   4835 B7            [ 4]  198 	OR A ;CP 0
   4836 C8            [11]  199 	RET Z
   4837 90            [ 4]  200 	SUB B
   4838 01 95 4A      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   483B E5            [11]  202 	PUSH HL
                            203 
   483C 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   483D 26 00         [ 7]  205 	LD H,#0
   483F 29            [11]  206 	ADD HL,HL
   4840 29            [11]  207 	ADD HL,HL
   4841 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4842 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4843 CD AE 48      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   4846 3A 76 48      [13]  211 	LD A,(doble)
   4849 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   484B CC 95 48      [17]  214 	CALL Z, doblar_letra
   484E 2A 78 48      [16]  215 	LD HL,(#direcc_destino)
   4851 3A 76 48      [13]  216 	LD A,(doble)
   4854 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   4856 28 08         [12]  219 	JR Z,cont_doble
   4858 11 64 4A      [10]  220 	LD DE,#letra_decodificada
   485B FD                  221 	.DB #0xfD
   485C 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   485E 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   4860                     226 cont_doble:
   4860 11 74 4A      [10]  227 	LD DE,#letra_decodificada_tmp
   4863 FD                  228 	.DB #0xfD
   4864 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   4866                     231 cont_tot:
   4866 CD 7A 48      [17]  232 	CALL cpc_PutSp0
   4869 2A 78 48      [16]  233 	LD HL,(#direcc_destino)
   486C 23            [ 6]  234 	INC HL
   486D 23            [ 6]  235 	INC HL
   486E 22 78 48      [16]  236 	LD (#direcc_destino),HL
   4871 E1            [10]  237 	POP HL
   4872 23            [ 6]  238 	INC HL
   4873 C3 2B 48      [10]  239 	JP bucle_texto0
                            240 
                            241 
   4876                     242 doble:
   4876 00                  243 	.DB #0
   4877                     244 imprimiendo:
   4877 00                  245 	.DB #0
   4878                     246 direcc_destino:
   4878 00 00               247 	.DW #0
                            248 
                            249 
   487A                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   487A 06 07         [ 7]  253 	LD B,#7
   487C 48            [ 4]  254 	LD C,B
   487D                     255 loop_alto_2:
                            256 
   487D                     257 loop_ancho_2:
   487D EB            [ 4]  258 	EX DE,HL
   487E ED A0         [16]  259 	LDI
   4880 ED A0         [16]  260 	LDI
   4882 FD                  261 	.DB #0XFD
   4883 25            [ 4]  262 	DEC H
   4884 C8            [11]  263 	RET Z
   4885 EB            [ 4]  264 	EX DE,HL
   4886                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   4886 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   4888 09            [11]  267 	ADD HL,BC
   4889 D2 7D 48      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   488C 01 50 C0      [10]  269 	LD BC,#0XC050
   488F 09            [11]  270 	ADD HL,BC
   4890 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   4892 C3 7D 48      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   4895                     277 doblar_letra:
   4895 21 64 4A      [10]  278 	LD HL,#letra_decodificada
   4898 11 74 4A      [10]  279 	LD DE,#letra_decodificada_tmp
   489B 06 08         [ 7]  280 	LD B,#8
   489D                     281 buc_doblar_letra:
   489D 7E            [ 7]  282 	LD A,(HL)
   489E 23            [ 6]  283 	INC HL
   489F 12            [ 7]  284 	LD (DE),A
   48A0 13            [ 6]  285 	INC DE
   48A1 13            [ 6]  286 	INC DE
   48A2 12            [ 7]  287 	LD (DE),A
   48A3 1B            [ 6]  288 	DEC DE
   48A4 7E            [ 7]  289 	LD A,(HL)
   48A5 23            [ 6]  290 	INC HL
   48A6 12            [ 7]  291 	LD (DE),A
   48A7 13            [ 6]  292 	INC DE
   48A8 13            [ 6]  293 	INC DE
   48A9 12            [ 7]  294 	LD (DE),A
   48AA 13            [ 6]  295 	INC DE
   48AB 10 F0         [13]  296 	DJNZ buc_doblar_letra
   48AD C9            [10]  297 	RET
                            298 
                            299 
   48AE                     300 escribe_letra:		; Code by Kevin Thacker
   48AE D5            [11]  301 	PUSH DE
   48AF FD 21 64 4A   [14]  302 	LD IY,#letra_decodificada
   48B3 06 08         [ 7]  303 	LD B,#8
   48B5                     304 bucle_alto_letra:
   48B5 C5            [11]  305 	PUSH BC
   48B6 E5            [11]  306 	PUSH HL
   48B7 5E            [ 7]  307 	LD E,(HL)
   48B8 CD CF 48      [17]  308 	CALL op_colores
   48BB FD 72 00      [19]  309 	LD (IY),D
   48BE FD 23         [10]  310 	INC IY
   48C0 CD CF 48      [17]  311 	CALL op_colores
   48C3 FD 72 00      [19]  312 	LD (IY),D
   48C6 FD 23         [10]  313 	INC IY
   48C8 E1            [10]  314 	POP HL
   48C9 23            [ 6]  315 	INC HL
   48CA C1            [10]  316 	POP BC
   48CB 10 E8         [13]  317 	DJNZ bucle_alto_letra
   48CD D1            [10]  318 	POP DE
   48CE C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   48CF                     321 op_colores:
   48CF 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   48D1 CD DC 48      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   48D4 CB 02         [ 8]  324 	RLC D
   48D6 CD DC 48      [17]  325 	CALL op_colores_pixel
   48D9 CB 0A         [ 8]  326 	RRC D
   48DB C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   48DC                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   48DC CB 03         [ 8]  333 	RLC E
   48DE CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   48E0 7B            [ 4]  336 	LD A,E
   48E1 E6 03         [ 7]  337 	AND #0X3
   48E3 21 60 4A      [10]  338 	LD HL,#colores_b0
   48E6 85            [ 4]  339 	ADD A,L
   48E7 6F            [ 4]  340 	LD L,A
   48E8 7C            [ 4]  341 	LD A,H
   48E9 CE 00         [ 7]  342 	ADC A,#0
   48EB 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   48EC 7A            [ 4]  345 	LD A,D
   48ED B6            [ 7]  346 	OR (HL)
   48EE 57            [ 4]  347 	LD D,A
   48EF C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   48F0                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   48F0 DD 21 02 00   [14]  355 	LD IX,#2
   48F4 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   48F6 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   48F9 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   48FC 21 60 4A      [10]  363 	LD HL,#colores_b0
   48FF 06 00         [ 7]  364 	LD B,#0
   4901 09            [11]  365 	ADD HL,BC
   4902 77            [ 7]  366 	LD (HL),A
   4903 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   4904                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   4904 DD 21 02 00   [14]  377 	LD IX,#2
   4908 DD 39         [15]  378 	ADD IX,SP
   490A DD 6E 03      [19]  379  	LD L,3 (IX)
   490D DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   4910 CD EB 46      [17]  381 	CALL cpc_GetScrAddress0
   4913 DD 5E 00      [19]  382    	LD E,0 (IX)
   4916 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   4919 AF            [ 4]  384 	XOR A
   491A C3 61 49      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   491D                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   491D DD 21 02 00   [14]  392 	LD IX,#2
   4921 DD 39         [15]  393 	ADD IX,SP
   4923 DD 6E 03      [19]  394  	LD L,3 (IX)
   4926 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   4929 CD EB 46      [17]  396 	CALL cpc_GetScrAddress0
   492C DD 5E 00      [19]  397    	LD E,0 (IX)
   492F DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   4932 3E 01         [ 7]  399 	LD A,#1
   4934 C3 61 49      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   4937                     407 _cpc_PrintGphStrM12X::
   4937 DD 21 02 00   [14]  408 	LD IX,#2
   493B DD 39         [15]  409 	ADD IX,SP
   493D DD 6E 02      [19]  410 	LD L,2 (IX)
   4940 DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   4943 DD 5E 00      [19]  412    	LD E,0 (IX)
   4946 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   4949 3E 01         [ 7]  414 	LD A,#1
                            415 
   494B C3 61 49      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   494E                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   494E DD 21 02 00   [14]  425 	LD IX,#2
   4952 DD 39         [15]  426 	ADD IX,SP
   4954 DD 6E 02      [19]  427 	LD L,2 (IX)
   4957 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   495A DD 5E 00      [19]  429    	LD E,0 (IX)
   495D DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4960 AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   4961                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   4961 32 CA 49      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   4964 3A 77 48      [13]  442 	LD A,(#imprimiendo)
   4967 FE 01         [ 7]  443 	CP #1
   4969 CA D5 47      [10]  444 	JP Z,add_elemento
   496C 22 78 48      [16]  445 	LD (#direcc_destino),HL
   496F EB            [ 4]  446 	EX DE,HL
   4970 CD 80 49      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   4973                     449 bucle_cola_impresionM1:
   4973 3A 1B 48      [13]  450 	LD A,(#elementos_cola)
   4976 B7            [ 4]  451 	OR A
   4977 CA CF 47      [10]  452 	JP Z,terminar_impresion
   497A CD F8 47      [17]  453 	CALL leer_elemento
   497D C3 73 49      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   4980                     460 bucle_texto0M1:
   4980 3E 01         [ 7]  461 	LD A,#1
   4982 32 77 48      [13]  462 	LD (#imprimiendo),A
                            463 
   4985 3A 94 4A      [13]  464 	LD A,(#first_char)
   4988 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   4989 7E            [ 7]  466 	LD A,(HL)
   498A B7            [ 4]  467 	OR A ;CP 0
   498B C8            [11]  468 	RET Z
   498C 90            [ 4]  469 	SUB B
   498D 01 95 4A      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   4990 E5            [11]  471 	PUSH HL
   4991 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   4992 26 00         [ 7]  473 	LD H,#0
   4994 29            [11]  474 	ADD HL,HL
   4995 29            [11]  475 	ADD HL,HL
   4996 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   4997 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   4998 CD F5 49      [17]  478 	CALL escribe_letraM1
   499B 3A CA 49      [13]  479 	LD A,(dobleM1)
   499E FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   49A0 CC CB 49      [17]  482 	CALL Z, doblar_letraM1
   49A3 2A 78 48      [16]  483 	LD HL,(direcc_destino)
   49A6 3A CA 49      [13]  484 	LD A,(dobleM1)
   49A9 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   49AB 28 08         [12]  487 	JR Z,cont_dobleM1
   49AD 11 64 4A      [10]  488 	LD DE,#letra_decodificada
   49B0 FD                  489 	.DB #0xfD
   49B1 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   49B3 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   49B5                     494 cont_dobleM1:
   49B5 11 74 4A      [10]  495 	LD DE,#letra_decodificada_tmp
   49B8 FD                  496 	.DB #0XFD
   49B9 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   49BB                     498 cont_totM1:
   49BB CD DC 49      [17]  499 	CALL cpc_PutSp0M1
   49BE 2A 78 48      [16]  500 	LD HL,(#direcc_destino)
   49C1 23            [ 6]  501 	INC HL
   49C2 22 78 48      [16]  502 	LD (#direcc_destino),HL
   49C5 E1            [10]  503 	POP HL
   49C6 23            [ 6]  504 	INC HL
   49C7 C3 80 49      [10]  505 	JP bucle_texto0M1
                            506 
   49CA                     507 dobleM1:
   49CA 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   49CB                     512 doblar_letraM1:
   49CB 21 64 4A      [10]  513 	LD HL,#letra_decodificada
   49CE 11 74 4A      [10]  514 	LD DE,#letra_decodificada_tmp
   49D1 06 08         [ 7]  515 	LD B,#8
   49D3                     516 buc_doblar_letraM1:
   49D3 7E            [ 7]  517 	LD A,(HL)
   49D4 23            [ 6]  518 	INC HL
   49D5 12            [ 7]  519 	LD (DE),A
   49D6 13            [ 6]  520 	INC DE
   49D7 12            [ 7]  521 	LD (DE),A
   49D8 13            [ 6]  522 	INC DE
   49D9 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   49DB C9            [10]  524 	RET
                            525 
                            526 
   49DC                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   49DC 06 07         [ 7]  530 	LD B,#7
   49DE 48            [ 4]  531 	LD C,B
   49DF                     532 loop_alto_2M1:
   49DF                     533 loop_ancho_2M1:
   49DF EB            [ 4]  534 	EX DE,HL
   49E0 ED A0         [16]  535 	LDI
   49E2 FD                  536 	.DB #0XFD
   49E3 25            [ 4]  537 	DEC H
   49E4 C8            [11]  538 	RET Z
   49E5 EB            [ 4]  539 	EX DE,HL
   49E6                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   49E6 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   49E8 09            [11]  542 	ADD HL,BC
   49E9 D2 DF 49      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   49EC 01 50 C0      [10]  544 	LD BC,#0XC050
   49EF 09            [11]  545 	ADD HL,BC
   49F0 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   49F2 C3 DF 49      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   49F5                     551 escribe_letraM1:
   49F5 FD 21 64 4A   [14]  552 	LD IY,#letra_decodificada
   49F9 06 08         [ 7]  553 	LD B,#8
   49FB DD 21 5D 4A   [14]  554 	LD IX,#byte_tmp
   49FF                     555 bucle_altoM1:
   49FF C5            [11]  556 	PUSH BC
   4A00 E5            [11]  557 	PUSH HL
                            558 
   4A01 7E            [ 7]  559 	LD A,(HL)
   4A02 21 5C 4A      [10]  560 	LD HL,#dato
   4A05 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   4A06 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   4A0A 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   4A0C                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   4A0C E5            [11]  570 	PUSH HL
   4A0D CD 25 4A      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   4A10 E1            [10]  572 	POP HL
   4A11 CB 3E         [15]  573 	SRL (HL)
   4A13 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   4A15 10 F5         [13]  575 	DJNZ bucle_coloresM1
   4A17 DD 7E 00      [19]  576 	LD A,(IX)
   4A1A FD 77 00      [19]  577 	LD (IY),A
   4A1D FD 23         [10]  578 	INC IY
   4A1F E1            [10]  579 	POP HL
   4A20 23            [ 6]  580 	INC HL
   4A21 C1            [10]  581 	POP BC
   4A22 10 DB         [13]  582 	DJNZ bucle_altoM1
   4A24 C9            [10]  583 	RET
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
   4A25                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   4A25 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   4A27 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   4A28 21 58 4A      [10]  610 	LD HL,#colores_m1
   4A2B 5F            [ 4]  611 	LD E,A
   4A2C 16 00         [ 7]  612 	LD D,#0
   4A2E 19            [11]  613 	ADD HL,DE
   4A2F 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   4A30 78            [ 4]  618 	LD A,B
   4A31 3D            [ 4]  619 	DEC A
   4A32 B7            [ 4]  620 	OR A ;CP 0
   4A33 CA 3C 4A      [10]  621 	JP Z,_sin_rotar
   4A36                     622 rotando:
   4A36 CB 39         [ 8]  623 	SRL C
   4A38 3D            [ 4]  624 	DEC A
   4A39 C2 36 4A      [10]  625 	JP NZ, rotando
   4A3C                     626 _sin_rotar:
   4A3C 79            [ 4]  627 	LD A,C
   4A3D DD B6 00      [19]  628 	OR (IX)
   4A40 DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   4A43 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   4A44                     636 _cpc_SetInkGphStrM1::
   4A44 DD 21 02 00   [14]  637 	LD IX,#2
   4A48 DD 39         [15]  638 	ADD IX,SP
   4A4A DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   4A4D DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   4A50 21 58 4A      [10]  641 	LD HL,#colores_cambM1
   4A53 06 00         [ 7]  642 	LD B,#0
   4A55 09            [11]  643 	ADD HL,BC
   4A56 77            [ 7]  644 	LD (HL),A
   4A57 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   4A58                     649 colores_cambM1:
   4A58                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   4A58 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   4A5C                     663 dato:
   4A5C 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   4A5D                     666 byte_tmp:
   4A5D 00                  667 	.DB #0
   4A5E 00                  668 	.DB #0
   4A5F 00                  669 	.DB #0  ;defs 3
   4A60                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   4A60 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   4A64                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   4A64 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4A6C 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4A74                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   4A74 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4A7C 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4A84 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   4A8C 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   4A94                     685 first_char:
   4A94 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   4A95                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   4A95 01                  690 	.DB #0b00000001
   4A96 01                  691 	.DB #0b00000001
   4A97 08                  692 	.DB #0b00001000
   4A98 08                  693 	.DB #0b00001000
   4A99 3C                  694 	.DB #0b00111100
   4A9A 30                  695 	.DB #0b00110000
   4A9B 30                  696 	.DB #0b00110000
   4A9C 00                  697 	.DB #0b00000000
                            698 ;0-9
   4A9D 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   4A9E 44                  700 .db #0b01000100
   4A9F 88                  701 .db #0b10001000
   4AA0 88                  702 .db #0b10001000
   4AA1 88                  703 .db #0b10001000
   4AA2 CC                  704 .db #0b11001100
   4AA3 FC                  705 .db #0b11111100
   4AA4 00                  706 .db #0b00000000
   4AA5 10                  707 .db #0b00010000
   4AA6 50                  708 .db #0b01010000
   4AA7 20                  709 .db #0b00100000
   4AA8 20                  710 .db #0b00100000
   4AA9 20                  711 .db #0b00100000
   4AAA 30                  712 .db #0b00110000
   4AAB FC                  713 .db #0b11111100
   4AAC 00                  714 .db #0b00000000
   4AAD 54                  715 .db #0b01010100
   4AAE 44                  716 .db #0b01000100
   4AAF 08                  717 .db #0b00001000
   4AB0 A8                  718 .db #0b10101000
   4AB1 80                  719 .db #0b10000000
   4AB2 CC                  720 .db #0b11001100
   4AB3 FC                  721 .db #0b11111100
   4AB4 00                  722 .db #0b00000000
   4AB5 54                  723 .db #0b01010100
   4AB6 44                  724 .db #0b01000100
   4AB7 08                  725 .db #0b00001000
   4AB8 28                  726 .db #0b00101000
   4AB9 08                  727 .db #0b00001000
   4ABA CC                  728 .db #0b11001100
   4ABB FC                  729 .db #0b11111100
   4ABC 00                  730 .db #0b00000000
   4ABD 44                  731 .db #0b01000100
   4ABE 44                  732 .db #0b01000100
   4ABF 88                  733 .db #0b10001000
   4AC0 A8                  734 .db #0b10101000
   4AC1 08                  735 .db #0b00001000
   4AC2 0C                  736 .db #0b00001100
   4AC3 0C                  737 .db #0b00001100
   4AC4 00                  738 .db #0b00000000
   4AC5 54                  739 .db #0b01010100
   4AC6 44                  740 .db #0b01000100
   4AC7 80                  741 .db #0b10000000
   4AC8 A8                  742 .db #0b10101000
   4AC9 08                  743 .db #0b00001000
   4ACA CC                  744 .db #0b11001100
   4ACB FC                  745 .db #0b11111100
   4ACC 00                  746 .db #0b00000000
   4ACD 54                  747 .db #0b01010100
   4ACE 44                  748 .db #0b01000100
   4ACF 80                  749 .db #0b10000000
   4AD0 A8                  750 .db #0b10101000
   4AD1 88                  751 .db #0b10001000
   4AD2 CC                  752 .db #0b11001100
   4AD3 FC                  753 .db #0b11111100
   4AD4 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   4AD5 54                  755 .db #0b01010100
   4AD6 44                  756 .db #0b01000100
   4AD7 08                  757 .db #0b00001000
   4AD8 08                  758 .db #0b00001000
   4AD9 20                  759 .db #0b00100000
   4ADA 30                  760 .db #0b00110000
   4ADB 30                  761 .db #0b00110000
   4ADC 00                  762 .db #0b00000000
   4ADD 54                  763 .db #0b01010100
   4ADE 44                  764 .db #0b01000100
   4ADF 88                  765 .db #0b10001000
   4AE0 A8                  766 .db #0b10101000
   4AE1 88                  767 .db #0b10001000
   4AE2 CC                  768 .db #0b11001100
   4AE3 FC                  769 .db #0b11111100
   4AE4 00                  770 .db #0b00000000
   4AE5 54                  771 .db #0b01010100
   4AE6 44                  772 .db #0b01000100
   4AE7 88                  773 .db #0b10001000
   4AE8 A8                  774 .db #0b10101000
   4AE9 08                  775 .db #0b00001000
   4AEA CC                  776 .db #0b11001100
   4AEB FC                  777 .db #0b11111100
   4AEC 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   4AED 00                  786 	.DB #0b00000000
   4AEE 00                  787 	.DB #0b00000000
   4AEF 20                  788 	.DB #0b00100000
   4AF0 00                  789 	.DB #0b00000000
   4AF1 30                  790 	.DB #0b00110000
   4AF2 00                  791 	.DB #0b00000000
   4AF3 00                  792 	.DB #0b00000000
   4AF4 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   4AF5 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   4AFD 00                  797 	.DB #0b00000000
   4AFE 00                  798 	.DB #0b00000000
   4AFF 00                  799 	.DB #0b00000000
   4B00 00                  800 	.DB #0b00000000
   4B01 00                  801 	.DB #0b00000000
   4B02 00                  802 	.DB #0b00000000
   4B03 C0                  803 	.DB #0b11000000
   4B04 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   4B05 00                  806 .db #0b00000000
   4B06 54                  807 .db #0b01010100
   4B07 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   4B08 A0                  809 .db #0b10100000
   4B09 88                  810 .db #0b10001000
   4B0A CC                  811 .db #0b11001100
   4B0B CC                  812 .db #0b11001100
   4B0C 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   4B0D 00                  816 	.DB #0b00000000
   4B0E 10                  817 	.DB #0b00010000
   4B0F 20                  818 	.DB #0b00100000
   4B10 20                  819 	.DB #0b00100000
   4B11 30                  820 	.DB #0b00110000
   4B12 00                  821 	.DB #0b00000000
   4B13 30                  822 	.DB #0b00110000
   4B14 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   4B15 00                  825 	.DB #0b00000000
   4B16 00                  826 	.DB #0b00000000
   4B17 80                  827 	.DB #0b10000000
   4B18 A0                  828 	.DB #0b10100000
   4B19 FC                  829 	.DB #0b11111100
   4B1A FC                  830 	.DB #0b11111100
   4B1B 00                  831 	.DB #0b00000000
   4B1C 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   4B1D 00                  834 	.DB #0b00000000
   4B1E 00                  835 	.DB #0b00000000
   4B1F 00                  836 	.DB #0b00000000
   4B20 A8                  837 	.DB #0b10101000
   4B21 FC                  838 	.DB #0b11111100
   4B22 00                  839 	.DB #0b00000000
   4B23 00                  840 	.DB #0b00000000
   4B24 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   4B25 00                  846 .db #0b00000000
   4B26 54                  847 .db #0b01010100
   4B27 88                  848 .db #0b10001000
   4B28 88                  849 .db #0b10001000
   4B29 A8                  850 .db #0b10101000
   4B2A CC                  851 .db #0b11001100
   4B2B CC                  852 .db #0b11001100
   4B2C 00                  853 .db #0b00000000
   4B2D 00                  854 .db #0b00000000
   4B2E 54                  855 .db #0b01010100
   4B2F 88                  856 .db #0b10001000
   4B30 A8                  857 .db #0b10101000
   4B31 88                  858 .db #0b10001000
   4B32 CC                  859 .db #0b11001100
   4B33 FC                  860 .db #0b11111100
   4B34 00                  861 .db #0b00000000
   4B35 00                  862 .db #0b00000000
   4B36 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   4B37 88                  864 .db #0b10001000
   4B38 80                  865 .db #0b10000000
   4B39 88                  866 .db #0b10001000
   4B3A CC                  867 .db #0b11001100
   4B3B FC                  868 .db #0b11111100
   4B3C 00                  869 .db #0b00000000
   4B3D 00                  870 .db #0b00000000
   4B3E 54                  871 .db #0b01010100
   4B3F 88                  872 .db #0b10001000
   4B40 88                  873 .db #0b10001000
   4B41 88                  874 .db #0b10001000
   4B42 CC                  875 .db #0b11001100
   4B43 F0                  876 .db #0b11110000
   4B44 00                  877 .db #0b00000000
   4B45 00                  878 .db #0b00000000
   4B46 54                  879 .db #0b01010100
   4B47 80                  880 .db #0b10000000
   4B48 A8                  881 .db #0b10101000
   4B49 80                  882 .db #0b10000000
   4B4A CC                  883 .db #0b11001100
   4B4B FC                  884 .db #0b11111100
   4B4C 00                  885 .db #0b00000000
   4B4D 00                  886 .db #0b00000000
   4B4E 54                  887 .db #0b01010100
   4B4F 80                  888 .db #0b10000000
   4B50 A8                  889 .db #0b10101000
   4B51 80                  890 .db #0b10000000
   4B52 C0                  891 .db #0b11000000
   4B53 C0                  892 .db #0b11000000
   4B54 00                  893 .db #0b00000000
   4B55 00                  894 .db #0b00000000
   4B56 54                  895 .db #0b01010100
   4B57 88                  896 .db #0b10001000
   4B58 80                  897 .db #0b10000000
   4B59 A8                  898 .db #0b10101000
   4B5A CC                  899 .db #0b11001100
   4B5B FC                  900 .db #0b11111100
   4B5C 00                  901 .db #0b00000000
   4B5D 00                  902 .db #0b00000000
   4B5E 44                  903 .db #0b01000100
   4B5F 88                  904 .db #0b10001000
   4B60 88                  905 .db #0b10001000
   4B61 A8                  906 .db #0b10101000
   4B62 CC                  907 .db #0b11001100
   4B63 CC                  908 .db #0b11001100
   4B64 00                  909 .db #0b00000000
   4B65 00                  910 .db #0b00000000
   4B66 54                  911 .db #0b01010100
   4B67 20                  912 .db #0b00100000
   4B68 20                  913 .db #0b00100000
   4B69 20                  914 .db #0b00100000
   4B6A 30                  915 .db #0b00110000
   4B6B FC                  916 .db #0b11111100
   4B6C 00                  917 .db #0b00000000
   4B6D 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   4B6E 54                  919 .db #0b01010100
   4B6F A8                  920 .db #0b10101000
   4B70 08                  921 .db #0b00001000
   4B71 08                  922 .db #0b00001000
   4B72 CC                  923 .db #0b11001100
   4B73 FC                  924 .db #0b11111100
   4B74 00                  925 .db #0b00000000
   4B75 00                  926 .db #0b00000000
   4B76 44                  927 .db #0b01000100
   4B77 88                  928 .db #0b10001000
   4B78 A0                  929 .db #0b10100000
   4B79 88                  930 .db #0b10001000
   4B7A CC                  931 .db #0b11001100
   4B7B CC                  932 .db #0b11001100
   4B7C 00                  933 .db #0b00000000
   4B7D 00                  934 .db #0b00000000
   4B7E 40                  935 .db #0b01000000
   4B7F 80                  936 .db #0b10000000
   4B80 80                  937 .db #0b10000000
   4B81 80                  938 .db #0b10000000
   4B82 CC                  939 .db #0b11001100
   4B83 FC                  940 .db #0b11111100
   4B84 00                  941 .db #0b00000000
   4B85 00                  942 .db #0b00000000
   4B86 54                  943 .db #0b01010100
   4B87 A8                  944 .db #0b10101000
   4B88 88                  945 .db #0b10001000
   4B89 88                  946 .db #0b10001000
   4B8A CC                  947 .db #0b11001100
   4B8B CC                  948 .db #0b11001100
   4B8C 00                  949 .db #0b00000000
   4B8D 00                  950 .db #0b00000000
   4B8E 50                  951 .db #0b01010000
   4B8F 88                  952 .db #0b10001000
   4B90 88                  953 .db #0b10001000
   4B91 88                  954 .db #0b10001000
   4B92 CC                  955 .db #0b11001100
   4B93 CC                  956 .db #0b11001100
   4B94 00                  957 .db #0b00000000
   4B95 00                  958 .db #0b00000000
   4B96 54                  959 .db #0b01010100
   4B97 88                  960 .db #0b10001000
   4B98 88                  961 .db #0b10001000
   4B99 88                  962 .db #0b10001000
   4B9A CC                  963 .db #0b11001100
   4B9B FC                  964 .db #0b11111100
   4B9C 00                  965 .db #0b00000000
   4B9D 00                  966 .db #0b00000000
   4B9E 54                  967 .db #0b01010100
   4B9F 88                  968 .db #0b10001000
   4BA0 88                  969 .db #0b10001000
   4BA1 A8                  970 .db #0b10101000
   4BA2 C0                  971 .db #0b11000000
   4BA3 C0                  972 .db #0b11000000
   4BA4 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   4BA5 00                  974 .db #0b00000000
   4BA6 54                  975 .db #0b01010100
   4BA7 88                  976 .db #0b10001000
   4BA8 88                  977 .db #0b10001000
   4BA9 88                  978 .db #0b10001000
   4BAA FC                  979 .db #0b11111100
   4BAB FC                  980 .db #0b11111100
   4BAC 00                  981 .db #0b00000000
   4BAD 00                  982 .db #0b00000000
   4BAE 54                  983 .db #0b01010100
   4BAF 88                  984 .db #0b10001000
   4BB0 88                  985 .db #0b10001000
   4BB1 A0                  986 .db #0b10100000
   4BB2 CC                  987 .db #0b11001100
   4BB3 CC                  988 .db #0b11001100
   4BB4 00                  989 .db #0b00000000
   4BB5 00                  990 .db #0b00000000
   4BB6 54                  991 .db #0b01010100
   4BB7 80                  992 .db #0b10000000
   4BB8 A8                  993 .db #0b10101000
   4BB9 08                  994 .db #0b00001000
   4BBA CC                  995 .db #0b11001100
   4BBB FC                  996 .db #0b11111100
   4BBC 00                  997 .db #0b00000000
   4BBD 00                  998 .db #0b00000000
   4BBE 54                  999 .db #0b01010100
   4BBF 20                 1000 .db #0b00100000
   4BC0 20                 1001 .db #0b00100000
   4BC1 20                 1002 .db #0b00100000
   4BC2 30                 1003 .db #0b00110000
   4BC3 30                 1004 .db #0b00110000
   4BC4 00                 1005 .db #0b00000000
   4BC5 00                 1006 .db #0b00000000
   4BC6 44                 1007 .db #0b01000100
   4BC7 88                 1008 .db #0b10001000
   4BC8 88                 1009 .db #0b10001000
   4BC9 88                 1010 .db #0b10001000
   4BCA CC                 1011 .db #0b11001100
   4BCB FC                 1012 .db #0b11111100
   4BCC 00                 1013 .db #0b00000000
   4BCD 00                 1014 .db #0b00000000
   4BCE 44                 1015 .db #0b01000100
   4BCF 88                 1016 .db #0b10001000
   4BD0 88                 1017 .db #0b10001000
   4BD1 88                 1018 .db #0b10001000
   4BD2 CC                 1019 .db #0b11001100
   4BD3 30                 1020 .db #0b00110000
   4BD4 00                 1021 .db #0b00000000
   4BD5 00                 1022 .db #0b00000000
   4BD6 44                 1023 .db #0b01000100
   4BD7 88                 1024 .db #0b10001000
   4BD8 88                 1025 .db #0b10001000
   4BD9 88                 1026 .db #0b10001000
   4BDA FC                 1027 .db #0b11111100
   4BDB CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   4BDC 00                 1029 .db #0b00000000
   4BDD 00                 1030 .db #0b00000000
   4BDE 44                 1031 .db #0b01000100
   4BDF 88                 1032 .db #0b10001000
   4BE0 A0                 1033 .db #0b10100000
   4BE1 20                 1034 .db #0b00100000
   4BE2 CC                 1035 .db #0b11001100
   4BE3 CC                 1036 .db #0b11001100
   4BE4 00                 1037 .db #0b00000000
   4BE5 00                 1038 .db #0b00000000
   4BE6 44                 1039 .db #0b01000100
   4BE7 88                 1040 .db #0b10001000
   4BE8 88                 1041 .db #0b10001000
   4BE9 20                 1042 .db #0b00100000
   4BEA 30                 1043 .db #0b00110000
   4BEB 30                 1044 .db #0b00110000
   4BEC 00                 1045 .db #0b00000000
   4BED 00                 1046 .db #0b00000000
   4BEE 54                 1047 .db #0b01010100
   4BEF 08                 1048 .db #0b00001000
   4BF0 20                 1049 .db #0b00100000
   4BF1 80                 1050 .db #0b10000000
   4BF2 CC                 1051 .db #0b11001100
   4BF3 FC                 1052 .db #0b11111100
   4BF4 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   4BF5 03                 1059 	.DB #0b00000011
   4BF6 0F                 1060 	.DB #0b00001111
   4BF7 3F                 1061 	.DB #0b00111111
   4BF8 FF                 1062 	.DB #0b11111111
   4BF9 3F                 1063 	.DB #0b00111111
   4BFA 0F                 1064 	.DB #0b00001111
   4BFB 03                 1065 	.DB #0b00000011
   4BFC 00                 1066 	.DB #0b00000000
