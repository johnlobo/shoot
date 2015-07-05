ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   387E                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   387E 32 AB 38      [13]   11 	LD (#inc_ancho+1),A
   3881 7D            [ 4]   12 	LD A,L
   3882 CB 3F         [ 8]   13 	SRL A
   3884 CB 3F         [ 8]   14 	SRL A
   3886 CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   3888 57            [ 4]   17 	LD D,A						;D
   3889 CB 27         [ 8]   18 	SLA A
   388B CB 27         [ 8]   19 	SLA A
   388D CB 27         [ 8]   20 	SLA A
   388F 95            [ 4]   21 	SUB L
   3890 ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   3892 5F            [ 4]   24 	LD E,A						;E
   3893 6A            [ 4]   25 	LD L,D
   3894 26 00         [ 7]   26 	LD H,#0
   3896 29            [11]   27 	ADD HL,HL
   3897 01 AE 38      [10]   28 	LD BC,#bloques
   389A 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   389B 4E            [ 7]   31 	LD C,(HL)
   389C 23            [ 6]   32 	INC HL
   389D 66            [ 7]   33 	LD H,(HL)
   389E 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   389F E5            [11]   36 	PUSH HL
   38A0 16 00         [ 7]   37 	LD D,#0
   38A2 21 E0 38      [10]   38 	LD HL,#sub_bloques
   38A5 19            [11]   39 	ADD HL,DE
   38A6 7E            [ 7]   40 	LD A,(HL)
   38A7 E1            [10]   41 	POP HL
   38A8 84            [ 4]   42 	ADD H
   38A9 67            [ 4]   43 	LD H,A
   38AA                      44 inc_ancho:
   38AA 1E 00         [ 7]   45 	LD E,#0
   38AC 19            [11]   46 	ADD HL,DE
   38AD C9            [10]   47 	RET
                             48 
   38AE                      49 bloques:
   38AE 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   38E0                      51 sub_bloques:
   38E0 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   38E8                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   38E8 DD 21 02 00   [14]   65 	LD IX,#2
   38EC DD 39         [15]   66 	ADD IX,SP
   38EE DD 6E 02      [19]   67 	LD L,2 (IX)
   38F1 DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   38F4 DD 5E 00      [19]   69    	LD E,0 (IX)
   38F7 DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   38FA 3E 01         [ 7]   71 	LD A,#1
   38FC C3 43 39      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   38FF                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   38FF DD 21 02 00   [14]   80 	LD IX,#2
   3903 DD 39         [15]   81 	ADD IX,SP
   3905 DD 6E 03      [19]   82  	LD L,3 (IX)
   3908 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   390B CD 7E 38      [17]   84 	CALL cpc_GetScrAddress0
   390E DD 5E 00      [19]   85    	LD E,0 (IX)
   3911 DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   3914 3E 01         [ 7]   87 	LD A,#1
   3916 C3 43 39      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   3919                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   3919 DD 21 02 00   [14]   94 	LD IX,#2
   391D DD 39         [15]   95 	ADD IX,SP
   391F DD 6E 03      [19]   96  	LD L,3 (IX)
   3922 DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   3925 CD 7E 38      [17]   98 	CALL cpc_GetScrAddress0
   3928 DD 5E 00      [19]   99    	LD E,0 (IX)
   392B DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   392E C3 43 39      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   3931                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   3931 DD 21 02 00   [14]  108 	LD IX,#2
   3935 DD 39         [15]  109 	ADD IX,SP
   3937 DD 6E 02      [19]  110 	LD L,2 (IX)
   393A DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   393D DD 5E 00      [19]  113    	LD E,0 (IX)
   3940 DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   3943                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   3943 32 09 3A      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   3946 3A 0A 3A      [13]  125 	LD A,(#imprimiendo)
   3949 FE 01         [ 7]  126 	CP #1
   394B CA 68 39      [10]  127 	JP Z,add_elemento
   394E 22 0B 3A      [16]  128 	LD (#direcc_destino),HL
   3951 EB            [ 4]  129 	EX DE,HL
   3952 CD BE 39      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   3955                     133 bucle_cola_impresion:
   3955 3A AE 39      [13]  134 	LD A,(#elementos_cola)
   3958 B7            [ 4]  135 	OR A
   3959 CA 62 39      [10]  136 	JP Z,terminar_impresion
   395C CD 8B 39      [17]  137 	CALL leer_elemento
   395F C3 55 39      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   3962                     141 terminar_impresion:
   3962 AF            [ 4]  142 	XOR A
   3963 32 0A 3A      [13]  143 	LD (#imprimiendo),A
   3966 C9            [10]  144 	RET
   3967                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   3967 C9            [10]  147 	RET
   3968                     148 add_elemento:
   3968 F3            [ 4]  149 	DI
   3969 DD 2A B0 39   [20]  150 	LD IX,(#pos_cola)
   396D DD 75 00      [19]  151 	LD 0 (IX),L
   3970 DD 74 01      [19]  152 	LD 1 (IX),H
   3973 DD 73 02      [19]  153 	LD 2 (IX),E
   3976 DD 72 03      [19]  154 	LD 3 (IX),D
   3979 DD 23         [10]  155 	INC IX
   397B DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   397D DD 23         [10]  157 	INC IX
   397F DD 23         [10]  158 	INC IX
   3981 DD 22 B0 39   [20]  159 	LD (#pos_cola),IX
                            160 
   3985 21 AE 39      [10]  161 	LD HL,#elementos_cola
   3988 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   3989 FB            [ 4]  164 	EI
   398A C9            [10]  165 	RET
   398B                     166 leer_elemento:
   398B F3            [ 4]  167 	DI
   398C DD 2A B0 39   [20]  168 	LD IX,(#pos_cola)
   3990 DD 6E 00      [19]  169 	LD L,0 (IX)
   3993 DD 66 01      [19]  170 	LD H,1 (IX)
   3996 DD 5E 02      [19]  171 	LD E,2 (IX)
   3999 DD 56 04      [19]  172 	LD D,4 (IX)
   399C DD 2B         [10]  173 	DEC IX
   399E DD 2B         [10]  174 	DEC IX
   39A0 DD 2B         [10]  175 	DEC IX
   39A2 DD 2B         [10]  176 	DEC IX
   39A4 DD 22 B0 39   [20]  177 	LD (#pos_cola),IX
   39A8 21 AE 39      [10]  178 	LD HL,#elementos_cola
   39AB 35            [11]  179 	DEC (HL)
   39AC FB            [ 4]  180 	EI
   39AD C9            [10]  181 	RET
                            182 
   39AE                     183 elementos_cola:
   39AE 00 00               184 	.DW #0				; defw 0
   39B0                     185 pos_cola:
   39B0 B2 39               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   39B2                     188 cola_impresion:  		; defs 12
   39B2 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   39BE                     190 bucle_texto0:
   39BE 3E 01         [ 7]  191 	LD A,#1
   39C0 32 0A 3A      [13]  192 	LD (imprimiendo),A
                            193 
   39C3 3A 27 3C      [13]  194 	LD A,(first_char)
   39C6 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   39C7 7E            [ 7]  197 	LD A,(HL)
   39C8 B7            [ 4]  198 	OR A ;CP 0
   39C9 C8            [11]  199 	RET Z
   39CA 90            [ 4]  200 	SUB B
   39CB 01 28 3C      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   39CE E5            [11]  202 	PUSH HL
                            203 
   39CF 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   39D0 26 00         [ 7]  205 	LD H,#0
   39D2 29            [11]  206 	ADD HL,HL
   39D3 29            [11]  207 	ADD HL,HL
   39D4 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   39D5 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   39D6 CD 41 3A      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   39D9 3A 09 3A      [13]  211 	LD A,(doble)
   39DC FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   39DE CC 28 3A      [17]  214 	CALL Z, doblar_letra
   39E1 2A 0B 3A      [16]  215 	LD HL,(#direcc_destino)
   39E4 3A 09 3A      [13]  216 	LD A,(doble)
   39E7 FE 01         [ 7]  217 	CP #1
                            218 	;alto
   39E9 28 08         [12]  219 	JR Z,cont_doble
   39EB 11 F7 3B      [10]  220 	LD DE,#letra_decodificada
   39EE FD                  221 	.DB #0xfD
   39EF 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   39F1 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   39F3                     226 cont_doble:
   39F3 11 07 3C      [10]  227 	LD DE,#letra_decodificada_tmp
   39F6 FD                  228 	.DB #0xfD
   39F7 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   39F9                     231 cont_tot:
   39F9 CD 0D 3A      [17]  232 	CALL cpc_PutSp0
   39FC 2A 0B 3A      [16]  233 	LD HL,(#direcc_destino)
   39FF 23            [ 6]  234 	INC HL
   3A00 23            [ 6]  235 	INC HL
   3A01 22 0B 3A      [16]  236 	LD (#direcc_destino),HL
   3A04 E1            [10]  237 	POP HL
   3A05 23            [ 6]  238 	INC HL
   3A06 C3 BE 39      [10]  239 	JP bucle_texto0
                            240 
                            241 
   3A09                     242 doble:
   3A09 00                  243 	.DB #0
   3A0A                     244 imprimiendo:
   3A0A 00                  245 	.DB #0
   3A0B                     246 direcc_destino:
   3A0B 00 00               247 	.DW #0
                            248 
                            249 
   3A0D                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3A0D 06 07         [ 7]  253 	LD B,#7
   3A0F 48            [ 4]  254 	LD C,B
   3A10                     255 loop_alto_2:
                            256 
   3A10                     257 loop_ancho_2:
   3A10 EB            [ 4]  258 	EX DE,HL
   3A11 ED A0         [16]  259 	LDI
   3A13 ED A0         [16]  260 	LDI
   3A15 FD                  261 	.DB #0XFD
   3A16 25            [ 4]  262 	DEC H
   3A17 C8            [11]  263 	RET Z
   3A18 EB            [ 4]  264 	EX DE,HL
   3A19                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   3A19 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   3A1B 09            [11]  267 	ADD HL,BC
   3A1C D2 10 3A      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   3A1F 01 50 C0      [10]  269 	LD BC,#0XC050
   3A22 09            [11]  270 	ADD HL,BC
   3A23 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   3A25 C3 10 3A      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   3A28                     277 doblar_letra:
   3A28 21 F7 3B      [10]  278 	LD HL,#letra_decodificada
   3A2B 11 07 3C      [10]  279 	LD DE,#letra_decodificada_tmp
   3A2E 06 08         [ 7]  280 	LD B,#8
   3A30                     281 buc_doblar_letra:
   3A30 7E            [ 7]  282 	LD A,(HL)
   3A31 23            [ 6]  283 	INC HL
   3A32 12            [ 7]  284 	LD (DE),A
   3A33 13            [ 6]  285 	INC DE
   3A34 13            [ 6]  286 	INC DE
   3A35 12            [ 7]  287 	LD (DE),A
   3A36 1B            [ 6]  288 	DEC DE
   3A37 7E            [ 7]  289 	LD A,(HL)
   3A38 23            [ 6]  290 	INC HL
   3A39 12            [ 7]  291 	LD (DE),A
   3A3A 13            [ 6]  292 	INC DE
   3A3B 13            [ 6]  293 	INC DE
   3A3C 12            [ 7]  294 	LD (DE),A
   3A3D 13            [ 6]  295 	INC DE
   3A3E 10 F0         [13]  296 	DJNZ buc_doblar_letra
   3A40 C9            [10]  297 	RET
                            298 
                            299 
   3A41                     300 escribe_letra:		; Code by Kevin Thacker
   3A41 D5            [11]  301 	PUSH DE
   3A42 FD 21 F7 3B   [14]  302 	LD IY,#letra_decodificada
   3A46 06 08         [ 7]  303 	LD B,#8
   3A48                     304 bucle_alto_letra:
   3A48 C5            [11]  305 	PUSH BC
   3A49 E5            [11]  306 	PUSH HL
   3A4A 5E            [ 7]  307 	LD E,(HL)
   3A4B CD 62 3A      [17]  308 	CALL op_colores
   3A4E FD 72 00      [19]  309 	LD (IY),D
   3A51 FD 23         [10]  310 	INC IY
   3A53 CD 62 3A      [17]  311 	CALL op_colores
   3A56 FD 72 00      [19]  312 	LD (IY),D
   3A59 FD 23         [10]  313 	INC IY
   3A5B E1            [10]  314 	POP HL
   3A5C 23            [ 6]  315 	INC HL
   3A5D C1            [10]  316 	POP BC
   3A5E 10 E8         [13]  317 	DJNZ bucle_alto_letra
   3A60 D1            [10]  318 	POP DE
   3A61 C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   3A62                     321 op_colores:
   3A62 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   3A64 CD 6F 3A      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   3A67 CB 02         [ 8]  324 	RLC D
   3A69 CD 6F 3A      [17]  325 	CALL op_colores_pixel
   3A6C CB 0A         [ 8]  326 	RRC D
   3A6E C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   3A6F                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   3A6F CB 03         [ 8]  333 	RLC E
   3A71 CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   3A73 7B            [ 4]  336 	LD A,E
   3A74 E6 03         [ 7]  337 	AND #0X3
   3A76 21 F3 3B      [10]  338 	LD HL,#colores_b0
   3A79 85            [ 4]  339 	ADD A,L
   3A7A 6F            [ 4]  340 	LD L,A
   3A7B 7C            [ 4]  341 	LD A,H
   3A7C CE 00         [ 7]  342 	ADC A,#0
   3A7E 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   3A7F 7A            [ 4]  345 	LD A,D
   3A80 B6            [ 7]  346 	OR (HL)
   3A81 57            [ 4]  347 	LD D,A
   3A82 C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   3A83                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   3A83 DD 21 02 00   [14]  355 	LD IX,#2
   3A87 DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   3A89 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   3A8C DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   3A8F 21 F3 3B      [10]  363 	LD HL,#colores_b0
   3A92 06 00         [ 7]  364 	LD B,#0
   3A94 09            [11]  365 	ADD HL,BC
   3A95 77            [ 7]  366 	LD (HL),A
   3A96 C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   3A97                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   3A97 DD 21 02 00   [14]  377 	LD IX,#2
   3A9B DD 39         [15]  378 	ADD IX,SP
   3A9D DD 6E 03      [19]  379  	LD L,3 (IX)
   3AA0 DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   3AA3 CD 7E 38      [17]  381 	CALL cpc_GetScrAddress0
   3AA6 DD 5E 00      [19]  382    	LD E,0 (IX)
   3AA9 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   3AAC AF            [ 4]  384 	XOR A
   3AAD C3 F4 3A      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   3AB0                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   3AB0 DD 21 02 00   [14]  392 	LD IX,#2
   3AB4 DD 39         [15]  393 	ADD IX,SP
   3AB6 DD 6E 03      [19]  394  	LD L,3 (IX)
   3AB9 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   3ABC CD 7E 38      [17]  396 	CALL cpc_GetScrAddress0
   3ABF DD 5E 00      [19]  397    	LD E,0 (IX)
   3AC2 DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   3AC5 3E 01         [ 7]  399 	LD A,#1
   3AC7 C3 F4 3A      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   3ACA                     407 _cpc_PrintGphStrM12X::
   3ACA DD 21 02 00   [14]  408 	LD IX,#2
   3ACE DD 39         [15]  409 	ADD IX,SP
   3AD0 DD 6E 02      [19]  410 	LD L,2 (IX)
   3AD3 DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   3AD6 DD 5E 00      [19]  412    	LD E,0 (IX)
   3AD9 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   3ADC 3E 01         [ 7]  414 	LD A,#1
                            415 
   3ADE C3 F4 3A      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   3AE1                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   3AE1 DD 21 02 00   [14]  425 	LD IX,#2
   3AE5 DD 39         [15]  426 	ADD IX,SP
   3AE7 DD 6E 02      [19]  427 	LD L,2 (IX)
   3AEA DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   3AED DD 5E 00      [19]  429    	LD E,0 (IX)
   3AF0 DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   3AF3 AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   3AF4                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   3AF4 32 5D 3B      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   3AF7 3A 0A 3A      [13]  442 	LD A,(#imprimiendo)
   3AFA FE 01         [ 7]  443 	CP #1
   3AFC CA 68 39      [10]  444 	JP Z,add_elemento
   3AFF 22 0B 3A      [16]  445 	LD (#direcc_destino),HL
   3B02 EB            [ 4]  446 	EX DE,HL
   3B03 CD 13 3B      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   3B06                     449 bucle_cola_impresionM1:
   3B06 3A AE 39      [13]  450 	LD A,(#elementos_cola)
   3B09 B7            [ 4]  451 	OR A
   3B0A CA 62 39      [10]  452 	JP Z,terminar_impresion
   3B0D CD 8B 39      [17]  453 	CALL leer_elemento
   3B10 C3 06 3B      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   3B13                     460 bucle_texto0M1:
   3B13 3E 01         [ 7]  461 	LD A,#1
   3B15 32 0A 3A      [13]  462 	LD (#imprimiendo),A
                            463 
   3B18 3A 27 3C      [13]  464 	LD A,(#first_char)
   3B1B 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   3B1C 7E            [ 7]  466 	LD A,(HL)
   3B1D B7            [ 4]  467 	OR A ;CP 0
   3B1E C8            [11]  468 	RET Z
   3B1F 90            [ 4]  469 	SUB B
   3B20 01 28 3C      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   3B23 E5            [11]  471 	PUSH HL
   3B24 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   3B25 26 00         [ 7]  473 	LD H,#0
   3B27 29            [11]  474 	ADD HL,HL
   3B28 29            [11]  475 	ADD HL,HL
   3B29 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   3B2A 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   3B2B CD 88 3B      [17]  478 	CALL escribe_letraM1
   3B2E 3A 5D 3B      [13]  479 	LD A,(dobleM1)
   3B31 FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   3B33 CC 5E 3B      [17]  482 	CALL Z, doblar_letraM1
   3B36 2A 0B 3A      [16]  483 	LD HL,(direcc_destino)
   3B39 3A 5D 3B      [13]  484 	LD A,(dobleM1)
   3B3C FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   3B3E 28 08         [12]  487 	JR Z,cont_dobleM1
   3B40 11 F7 3B      [10]  488 	LD DE,#letra_decodificada
   3B43 FD                  489 	.DB #0xfD
   3B44 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3B46 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   3B48                     494 cont_dobleM1:
   3B48 11 07 3C      [10]  495 	LD DE,#letra_decodificada_tmp
   3B4B FD                  496 	.DB #0XFD
   3B4C 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3B4E                     498 cont_totM1:
   3B4E CD 6F 3B      [17]  499 	CALL cpc_PutSp0M1
   3B51 2A 0B 3A      [16]  500 	LD HL,(#direcc_destino)
   3B54 23            [ 6]  501 	INC HL
   3B55 22 0B 3A      [16]  502 	LD (#direcc_destino),HL
   3B58 E1            [10]  503 	POP HL
   3B59 23            [ 6]  504 	INC HL
   3B5A C3 13 3B      [10]  505 	JP bucle_texto0M1
                            506 
   3B5D                     507 dobleM1:
   3B5D 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   3B5E                     512 doblar_letraM1:
   3B5E 21 F7 3B      [10]  513 	LD HL,#letra_decodificada
   3B61 11 07 3C      [10]  514 	LD DE,#letra_decodificada_tmp
   3B64 06 08         [ 7]  515 	LD B,#8
   3B66                     516 buc_doblar_letraM1:
   3B66 7E            [ 7]  517 	LD A,(HL)
   3B67 23            [ 6]  518 	INC HL
   3B68 12            [ 7]  519 	LD (DE),A
   3B69 13            [ 6]  520 	INC DE
   3B6A 12            [ 7]  521 	LD (DE),A
   3B6B 13            [ 6]  522 	INC DE
   3B6C 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   3B6E C9            [10]  524 	RET
                            525 
                            526 
   3B6F                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   3B6F 06 07         [ 7]  530 	LD B,#7
   3B71 48            [ 4]  531 	LD C,B
   3B72                     532 loop_alto_2M1:
   3B72                     533 loop_ancho_2M1:
   3B72 EB            [ 4]  534 	EX DE,HL
   3B73 ED A0         [16]  535 	LDI
   3B75 FD                  536 	.DB #0XFD
   3B76 25            [ 4]  537 	DEC H
   3B77 C8            [11]  538 	RET Z
   3B78 EB            [ 4]  539 	EX DE,HL
   3B79                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   3B79 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   3B7B 09            [11]  542 	ADD HL,BC
   3B7C D2 72 3B      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   3B7F 01 50 C0      [10]  544 	LD BC,#0XC050
   3B82 09            [11]  545 	ADD HL,BC
   3B83 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   3B85 C3 72 3B      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   3B88                     551 escribe_letraM1:
   3B88 FD 21 F7 3B   [14]  552 	LD IY,#letra_decodificada
   3B8C 06 08         [ 7]  553 	LD B,#8
   3B8E DD 21 F0 3B   [14]  554 	LD IX,#byte_tmp
   3B92                     555 bucle_altoM1:
   3B92 C5            [11]  556 	PUSH BC
   3B93 E5            [11]  557 	PUSH HL
                            558 
   3B94 7E            [ 7]  559 	LD A,(HL)
   3B95 21 EF 3B      [10]  560 	LD HL,#dato
   3B98 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   3B99 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   3B9D 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   3B9F                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   3B9F E5            [11]  570 	PUSH HL
   3BA0 CD B8 3B      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   3BA3 E1            [10]  572 	POP HL
   3BA4 CB 3E         [15]  573 	SRL (HL)
   3BA6 CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   3BA8 10 F5         [13]  575 	DJNZ bucle_coloresM1
   3BAA DD 7E 00      [19]  576 	LD A,(IX)
   3BAD FD 77 00      [19]  577 	LD (IY),A
   3BB0 FD 23         [10]  578 	INC IY
   3BB2 E1            [10]  579 	POP HL
   3BB3 23            [ 6]  580 	INC HL
   3BB4 C1            [10]  581 	POP BC
   3BB5 10 DB         [13]  582 	DJNZ bucle_altoM1
   3BB7 C9            [10]  583 	RET
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
   3BB8                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   3BB8 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   3BBA A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   3BBB 21 EB 3B      [10]  610 	LD HL,#colores_m1
   3BBE 5F            [ 4]  611 	LD E,A
   3BBF 16 00         [ 7]  612 	LD D,#0
   3BC1 19            [11]  613 	ADD HL,DE
   3BC2 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   3BC3 78            [ 4]  618 	LD A,B
   3BC4 3D            [ 4]  619 	DEC A
   3BC5 B7            [ 4]  620 	OR A ;CP 0
   3BC6 CA CF 3B      [10]  621 	JP Z,_sin_rotar
   3BC9                     622 rotando:
   3BC9 CB 39         [ 8]  623 	SRL C
   3BCB 3D            [ 4]  624 	DEC A
   3BCC C2 C9 3B      [10]  625 	JP NZ, rotando
   3BCF                     626 _sin_rotar:
   3BCF 79            [ 4]  627 	LD A,C
   3BD0 DD B6 00      [19]  628 	OR (IX)
   3BD3 DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   3BD6 C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   3BD7                     636 _cpc_SetInkGphStrM1::
   3BD7 DD 21 02 00   [14]  637 	LD IX,#2
   3BDB DD 39         [15]  638 	ADD IX,SP
   3BDD DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   3BE0 DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   3BE3 21 EB 3B      [10]  641 	LD HL,#colores_cambM1
   3BE6 06 00         [ 7]  642 	LD B,#0
   3BE8 09            [11]  643 	ADD HL,BC
   3BE9 77            [ 7]  644 	LD (HL),A
   3BEA C9            [10]  645 	RET
                            646 
                            647 
                            648 
   3BEB                     649 colores_cambM1:
   3BEB                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   3BEB 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   3BEF                     663 dato:
   3BEF 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   3BF0                     666 byte_tmp:
   3BF0 00                  667 	.DB #0
   3BF1 00                  668 	.DB #0
   3BF2 00                  669 	.DB #0  ;defs 3
   3BF3                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   3BF3 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   3BF7                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   3BF7 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3BFF 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3C07                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   3C07 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3C0F 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3C17 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   3C1F 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   3C27                     685 first_char:
   3C27 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   3C28                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   3C28 01                  690 	.DB #0b00000001
   3C29 01                  691 	.DB #0b00000001
   3C2A 08                  692 	.DB #0b00001000
   3C2B 08                  693 	.DB #0b00001000
   3C2C 3C                  694 	.DB #0b00111100
   3C2D 30                  695 	.DB #0b00110000
   3C2E 30                  696 	.DB #0b00110000
   3C2F 00                  697 	.DB #0b00000000
                            698 ;0-9
   3C30 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   3C31 44                  700 .db #0b01000100
   3C32 88                  701 .db #0b10001000
   3C33 88                  702 .db #0b10001000
   3C34 88                  703 .db #0b10001000
   3C35 CC                  704 .db #0b11001100
   3C36 FC                  705 .db #0b11111100
   3C37 00                  706 .db #0b00000000
   3C38 10                  707 .db #0b00010000
   3C39 50                  708 .db #0b01010000
   3C3A 20                  709 .db #0b00100000
   3C3B 20                  710 .db #0b00100000
   3C3C 20                  711 .db #0b00100000
   3C3D 30                  712 .db #0b00110000
   3C3E FC                  713 .db #0b11111100
   3C3F 00                  714 .db #0b00000000
   3C40 54                  715 .db #0b01010100
   3C41 44                  716 .db #0b01000100
   3C42 08                  717 .db #0b00001000
   3C43 A8                  718 .db #0b10101000
   3C44 80                  719 .db #0b10000000
   3C45 CC                  720 .db #0b11001100
   3C46 FC                  721 .db #0b11111100
   3C47 00                  722 .db #0b00000000
   3C48 54                  723 .db #0b01010100
   3C49 44                  724 .db #0b01000100
   3C4A 08                  725 .db #0b00001000
   3C4B 28                  726 .db #0b00101000
   3C4C 08                  727 .db #0b00001000
   3C4D CC                  728 .db #0b11001100
   3C4E FC                  729 .db #0b11111100
   3C4F 00                  730 .db #0b00000000
   3C50 44                  731 .db #0b01000100
   3C51 44                  732 .db #0b01000100
   3C52 88                  733 .db #0b10001000
   3C53 A8                  734 .db #0b10101000
   3C54 08                  735 .db #0b00001000
   3C55 0C                  736 .db #0b00001100
   3C56 0C                  737 .db #0b00001100
   3C57 00                  738 .db #0b00000000
   3C58 54                  739 .db #0b01010100
   3C59 44                  740 .db #0b01000100
   3C5A 80                  741 .db #0b10000000
   3C5B A8                  742 .db #0b10101000
   3C5C 08                  743 .db #0b00001000
   3C5D CC                  744 .db #0b11001100
   3C5E FC                  745 .db #0b11111100
   3C5F 00                  746 .db #0b00000000
   3C60 54                  747 .db #0b01010100
   3C61 44                  748 .db #0b01000100
   3C62 80                  749 .db #0b10000000
   3C63 A8                  750 .db #0b10101000
   3C64 88                  751 .db #0b10001000
   3C65 CC                  752 .db #0b11001100
   3C66 FC                  753 .db #0b11111100
   3C67 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   3C68 54                  755 .db #0b01010100
   3C69 44                  756 .db #0b01000100
   3C6A 08                  757 .db #0b00001000
   3C6B 08                  758 .db #0b00001000
   3C6C 20                  759 .db #0b00100000
   3C6D 30                  760 .db #0b00110000
   3C6E 30                  761 .db #0b00110000
   3C6F 00                  762 .db #0b00000000
   3C70 54                  763 .db #0b01010100
   3C71 44                  764 .db #0b01000100
   3C72 88                  765 .db #0b10001000
   3C73 A8                  766 .db #0b10101000
   3C74 88                  767 .db #0b10001000
   3C75 CC                  768 .db #0b11001100
   3C76 FC                  769 .db #0b11111100
   3C77 00                  770 .db #0b00000000
   3C78 54                  771 .db #0b01010100
   3C79 44                  772 .db #0b01000100
   3C7A 88                  773 .db #0b10001000
   3C7B A8                  774 .db #0b10101000
   3C7C 08                  775 .db #0b00001000
   3C7D CC                  776 .db #0b11001100
   3C7E FC                  777 .db #0b11111100
   3C7F 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   3C80 00                  786 	.DB #0b00000000
   3C81 00                  787 	.DB #0b00000000
   3C82 20                  788 	.DB #0b00100000
   3C83 00                  789 	.DB #0b00000000
   3C84 30                  790 	.DB #0b00110000
   3C85 00                  791 	.DB #0b00000000
   3C86 00                  792 	.DB #0b00000000
   3C87 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   3C88 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   3C90 00                  797 	.DB #0b00000000
   3C91 00                  798 	.DB #0b00000000
   3C92 00                  799 	.DB #0b00000000
   3C93 00                  800 	.DB #0b00000000
   3C94 00                  801 	.DB #0b00000000
   3C95 00                  802 	.DB #0b00000000
   3C96 C0                  803 	.DB #0b11000000
   3C97 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   3C98 00                  806 .db #0b00000000
   3C99 54                  807 .db #0b01010100
   3C9A 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   3C9B A0                  809 .db #0b10100000
   3C9C 88                  810 .db #0b10001000
   3C9D CC                  811 .db #0b11001100
   3C9E CC                  812 .db #0b11001100
   3C9F 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   3CA0 00                  816 	.DB #0b00000000
   3CA1 10                  817 	.DB #0b00010000
   3CA2 20                  818 	.DB #0b00100000
   3CA3 20                  819 	.DB #0b00100000
   3CA4 30                  820 	.DB #0b00110000
   3CA5 00                  821 	.DB #0b00000000
   3CA6 30                  822 	.DB #0b00110000
   3CA7 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   3CA8 00                  825 	.DB #0b00000000
   3CA9 00                  826 	.DB #0b00000000
   3CAA 80                  827 	.DB #0b10000000
   3CAB A0                  828 	.DB #0b10100000
   3CAC FC                  829 	.DB #0b11111100
   3CAD FC                  830 	.DB #0b11111100
   3CAE 00                  831 	.DB #0b00000000
   3CAF 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   3CB0 00                  834 	.DB #0b00000000
   3CB1 00                  835 	.DB #0b00000000
   3CB2 00                  836 	.DB #0b00000000
   3CB3 A8                  837 	.DB #0b10101000
   3CB4 FC                  838 	.DB #0b11111100
   3CB5 00                  839 	.DB #0b00000000
   3CB6 00                  840 	.DB #0b00000000
   3CB7 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   3CB8 00                  846 .db #0b00000000
   3CB9 54                  847 .db #0b01010100
   3CBA 88                  848 .db #0b10001000
   3CBB 88                  849 .db #0b10001000
   3CBC A8                  850 .db #0b10101000
   3CBD CC                  851 .db #0b11001100
   3CBE CC                  852 .db #0b11001100
   3CBF 00                  853 .db #0b00000000
   3CC0 00                  854 .db #0b00000000
   3CC1 54                  855 .db #0b01010100
   3CC2 88                  856 .db #0b10001000
   3CC3 A8                  857 .db #0b10101000
   3CC4 88                  858 .db #0b10001000
   3CC5 CC                  859 .db #0b11001100
   3CC6 FC                  860 .db #0b11111100
   3CC7 00                  861 .db #0b00000000
   3CC8 00                  862 .db #0b00000000
   3CC9 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   3CCA 88                  864 .db #0b10001000
   3CCB 80                  865 .db #0b10000000
   3CCC 88                  866 .db #0b10001000
   3CCD CC                  867 .db #0b11001100
   3CCE FC                  868 .db #0b11111100
   3CCF 00                  869 .db #0b00000000
   3CD0 00                  870 .db #0b00000000
   3CD1 54                  871 .db #0b01010100
   3CD2 88                  872 .db #0b10001000
   3CD3 88                  873 .db #0b10001000
   3CD4 88                  874 .db #0b10001000
   3CD5 CC                  875 .db #0b11001100
   3CD6 F0                  876 .db #0b11110000
   3CD7 00                  877 .db #0b00000000
   3CD8 00                  878 .db #0b00000000
   3CD9 54                  879 .db #0b01010100
   3CDA 80                  880 .db #0b10000000
   3CDB A8                  881 .db #0b10101000
   3CDC 80                  882 .db #0b10000000
   3CDD CC                  883 .db #0b11001100
   3CDE FC                  884 .db #0b11111100
   3CDF 00                  885 .db #0b00000000
   3CE0 00                  886 .db #0b00000000
   3CE1 54                  887 .db #0b01010100
   3CE2 80                  888 .db #0b10000000
   3CE3 A8                  889 .db #0b10101000
   3CE4 80                  890 .db #0b10000000
   3CE5 C0                  891 .db #0b11000000
   3CE6 C0                  892 .db #0b11000000
   3CE7 00                  893 .db #0b00000000
   3CE8 00                  894 .db #0b00000000
   3CE9 54                  895 .db #0b01010100
   3CEA 88                  896 .db #0b10001000
   3CEB 80                  897 .db #0b10000000
   3CEC A8                  898 .db #0b10101000
   3CED CC                  899 .db #0b11001100
   3CEE FC                  900 .db #0b11111100
   3CEF 00                  901 .db #0b00000000
   3CF0 00                  902 .db #0b00000000
   3CF1 44                  903 .db #0b01000100
   3CF2 88                  904 .db #0b10001000
   3CF3 88                  905 .db #0b10001000
   3CF4 A8                  906 .db #0b10101000
   3CF5 CC                  907 .db #0b11001100
   3CF6 CC                  908 .db #0b11001100
   3CF7 00                  909 .db #0b00000000
   3CF8 00                  910 .db #0b00000000
   3CF9 54                  911 .db #0b01010100
   3CFA 20                  912 .db #0b00100000
   3CFB 20                  913 .db #0b00100000
   3CFC 20                  914 .db #0b00100000
   3CFD 30                  915 .db #0b00110000
   3CFE FC                  916 .db #0b11111100
   3CFF 00                  917 .db #0b00000000
   3D00 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   3D01 54                  919 .db #0b01010100
   3D02 A8                  920 .db #0b10101000
   3D03 08                  921 .db #0b00001000
   3D04 08                  922 .db #0b00001000
   3D05 CC                  923 .db #0b11001100
   3D06 FC                  924 .db #0b11111100
   3D07 00                  925 .db #0b00000000
   3D08 00                  926 .db #0b00000000
   3D09 44                  927 .db #0b01000100
   3D0A 88                  928 .db #0b10001000
   3D0B A0                  929 .db #0b10100000
   3D0C 88                  930 .db #0b10001000
   3D0D CC                  931 .db #0b11001100
   3D0E CC                  932 .db #0b11001100
   3D0F 00                  933 .db #0b00000000
   3D10 00                  934 .db #0b00000000
   3D11 40                  935 .db #0b01000000
   3D12 80                  936 .db #0b10000000
   3D13 80                  937 .db #0b10000000
   3D14 80                  938 .db #0b10000000
   3D15 CC                  939 .db #0b11001100
   3D16 FC                  940 .db #0b11111100
   3D17 00                  941 .db #0b00000000
   3D18 00                  942 .db #0b00000000
   3D19 54                  943 .db #0b01010100
   3D1A A8                  944 .db #0b10101000
   3D1B 88                  945 .db #0b10001000
   3D1C 88                  946 .db #0b10001000
   3D1D CC                  947 .db #0b11001100
   3D1E CC                  948 .db #0b11001100
   3D1F 00                  949 .db #0b00000000
   3D20 00                  950 .db #0b00000000
   3D21 50                  951 .db #0b01010000
   3D22 88                  952 .db #0b10001000
   3D23 88                  953 .db #0b10001000
   3D24 88                  954 .db #0b10001000
   3D25 CC                  955 .db #0b11001100
   3D26 CC                  956 .db #0b11001100
   3D27 00                  957 .db #0b00000000
   3D28 00                  958 .db #0b00000000
   3D29 54                  959 .db #0b01010100
   3D2A 88                  960 .db #0b10001000
   3D2B 88                  961 .db #0b10001000
   3D2C 88                  962 .db #0b10001000
   3D2D CC                  963 .db #0b11001100
   3D2E FC                  964 .db #0b11111100
   3D2F 00                  965 .db #0b00000000
   3D30 00                  966 .db #0b00000000
   3D31 54                  967 .db #0b01010100
   3D32 88                  968 .db #0b10001000
   3D33 88                  969 .db #0b10001000
   3D34 A8                  970 .db #0b10101000
   3D35 C0                  971 .db #0b11000000
   3D36 C0                  972 .db #0b11000000
   3D37 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   3D38 00                  974 .db #0b00000000
   3D39 54                  975 .db #0b01010100
   3D3A 88                  976 .db #0b10001000
   3D3B 88                  977 .db #0b10001000
   3D3C 88                  978 .db #0b10001000
   3D3D FC                  979 .db #0b11111100
   3D3E FC                  980 .db #0b11111100
   3D3F 00                  981 .db #0b00000000
   3D40 00                  982 .db #0b00000000
   3D41 54                  983 .db #0b01010100
   3D42 88                  984 .db #0b10001000
   3D43 88                  985 .db #0b10001000
   3D44 A0                  986 .db #0b10100000
   3D45 CC                  987 .db #0b11001100
   3D46 CC                  988 .db #0b11001100
   3D47 00                  989 .db #0b00000000
   3D48 00                  990 .db #0b00000000
   3D49 54                  991 .db #0b01010100
   3D4A 80                  992 .db #0b10000000
   3D4B A8                  993 .db #0b10101000
   3D4C 08                  994 .db #0b00001000
   3D4D CC                  995 .db #0b11001100
   3D4E FC                  996 .db #0b11111100
   3D4F 00                  997 .db #0b00000000
   3D50 00                  998 .db #0b00000000
   3D51 54                  999 .db #0b01010100
   3D52 20                 1000 .db #0b00100000
   3D53 20                 1001 .db #0b00100000
   3D54 20                 1002 .db #0b00100000
   3D55 30                 1003 .db #0b00110000
   3D56 30                 1004 .db #0b00110000
   3D57 00                 1005 .db #0b00000000
   3D58 00                 1006 .db #0b00000000
   3D59 44                 1007 .db #0b01000100
   3D5A 88                 1008 .db #0b10001000
   3D5B 88                 1009 .db #0b10001000
   3D5C 88                 1010 .db #0b10001000
   3D5D CC                 1011 .db #0b11001100
   3D5E FC                 1012 .db #0b11111100
   3D5F 00                 1013 .db #0b00000000
   3D60 00                 1014 .db #0b00000000
   3D61 44                 1015 .db #0b01000100
   3D62 88                 1016 .db #0b10001000
   3D63 88                 1017 .db #0b10001000
   3D64 88                 1018 .db #0b10001000
   3D65 CC                 1019 .db #0b11001100
   3D66 30                 1020 .db #0b00110000
   3D67 00                 1021 .db #0b00000000
   3D68 00                 1022 .db #0b00000000
   3D69 44                 1023 .db #0b01000100
   3D6A 88                 1024 .db #0b10001000
   3D6B 88                 1025 .db #0b10001000
   3D6C 88                 1026 .db #0b10001000
   3D6D FC                 1027 .db #0b11111100
   3D6E CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   3D6F 00                 1029 .db #0b00000000
   3D70 00                 1030 .db #0b00000000
   3D71 44                 1031 .db #0b01000100
   3D72 88                 1032 .db #0b10001000
   3D73 A0                 1033 .db #0b10100000
   3D74 20                 1034 .db #0b00100000
   3D75 CC                 1035 .db #0b11001100
   3D76 CC                 1036 .db #0b11001100
   3D77 00                 1037 .db #0b00000000
   3D78 00                 1038 .db #0b00000000
   3D79 44                 1039 .db #0b01000100
   3D7A 88                 1040 .db #0b10001000
   3D7B 88                 1041 .db #0b10001000
   3D7C 20                 1042 .db #0b00100000
   3D7D 30                 1043 .db #0b00110000
   3D7E 30                 1044 .db #0b00110000
   3D7F 00                 1045 .db #0b00000000
   3D80 00                 1046 .db #0b00000000
   3D81 54                 1047 .db #0b01010100
   3D82 08                 1048 .db #0b00001000
   3D83 20                 1049 .db #0b00100000
   3D84 80                 1050 .db #0b10000000
   3D85 CC                 1051 .db #0b11001100
   3D86 FC                 1052 .db #0b11111100
   3D87 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   3D88 03                 1059 	.DB #0b00000011
   3D89 0F                 1060 	.DB #0b00001111
   3D8A 3F                 1061 	.DB #0b00111111
   3D8B FF                 1062 	.DB #0b11111111
   3D8C 3F                 1063 	.DB #0b00111111
   3D8D 0F                 1064 	.DB #0b00001111
   3D8E 03                 1065 	.DB #0b00000011
   3D8F 00                 1066 	.DB #0b00000000
