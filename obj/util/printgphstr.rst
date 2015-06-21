ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ; ******************************************************
                              2 ; **       Librería de rutinas SDCC para Amstrad CPC  **
                              3 ; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
                              4 ; ******************************************************
                              5 
                              6 
                              7 
   2796                       8 cpc_GetScrAddress0:			;en HL están las coordenadas
                              9 
                             10 	;LD A,H
   2796 32 C3 27      [13]   11 	LD (#inc_ancho+1),A
   2799 7D            [ 4]   12 	LD A,L
   279A CB 3F         [ 8]   13 	SRL A
   279C CB 3F         [ 8]   14 	SRL A
   279E CB 3F         [ 8]   15 	SRL A
                             16 	; A indica el bloque a multiplicar x &50
   27A0 57            [ 4]   17 	LD D,A						;D
   27A1 CB 27         [ 8]   18 	SLA A
   27A3 CB 27         [ 8]   19 	SLA A
   27A5 CB 27         [ 8]   20 	SLA A
   27A7 95            [ 4]   21 	SUB L
   27A8 ED 44         [ 8]   22 	NEG
                             23 	; A indica el desplazamiento a multiplicar x &800
   27AA 5F            [ 4]   24 	LD E,A						;E
   27AB 6A            [ 4]   25 	LD L,D
   27AC 26 00         [ 7]   26 	LD H,#0
   27AE 29            [11]   27 	ADD HL,HL
   27AF 01 C6 27      [10]   28 	LD BC,#bloques
   27B2 09            [11]   29 	ADD HL,BC
                             30 	;HL APUNTA AL BLOQUE BUSCADO
   27B3 4E            [ 7]   31 	LD C,(HL)
   27B4 23            [ 6]   32 	INC HL
   27B5 66            [ 7]   33 	LD H,(HL)
   27B6 69            [ 4]   34 	LD L,C
                             35 	;HL TIENE EL VALOR DEL BLOQUE DE 8 BUSCADO
   27B7 E5            [11]   36 	PUSH HL
   27B8 16 00         [ 7]   37 	LD D,#0
   27BA 21 F8 27      [10]   38 	LD HL,#sub_bloques
   27BD 19            [11]   39 	ADD HL,DE
   27BE 7E            [ 7]   40 	LD A,(HL)
   27BF E1            [10]   41 	POP HL
   27C0 84            [ 4]   42 	ADD H
   27C1 67            [ 4]   43 	LD H,A
   27C2                      44 inc_ancho:
   27C2 1E 00         [ 7]   45 	LD E,#0
   27C4 19            [11]   46 	ADD HL,DE
   27C5 C9            [10]   47 	RET
                             48 
   27C6                      49 bloques:
   27C6 00 C0 50 C0 A0 C0    50 .DW #0XC000,#0XC050,#0XC0A0,#0XC0F0,#0XC140,#0XC190,#0XC1E0,#0XC230,#0XC280,#0XC2D0,#0XC320,#0XC370,#0XC3C0,#0XC410,#0XC460,#0XC4B0,#0XC500,#0XC550,#0XC5A0,#0XC5F0,#0XC640,#0XC690,#0XC6E0,#0XC730,#0XC780
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
   27F8                      51 sub_bloques:
   27F8 00 08 10 18 20 28    52 .DB #0X00,#0X08,#0X10,#0X18,#0X20,#0X28,#0X30,#0X38
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
   2800                      63 _cpc_PrintGphStr2X::
                             64 ;preparación datos impresión. El ancho y alto son fijos!
   2800 DD 21 02 00   [14]   65 	LD IX,#2
   2804 DD 39         [15]   66 	ADD IX,SP
   2806 DD 6E 02      [19]   67 	LD L,2 (IX)
   2809 DD 66 03      [19]   68 	LD H,3 (IX)	;DESTINO
   280C DD 5E 00      [19]   69    	LD E,0 (IX)
   280F DD 56 01      [19]   70 	LD D,1 (IX)	;TEXTO ORIGEN
   2812 3E 01         [ 7]   71 	LD A,#1
   2814 C3 5B 28      [10]   72  	JP cpc_PrintGphStr0
                             73 
                             74 
                             75 
                             76 .globl _cpc_PrintGphStrXY2X
                             77 
   2817                      78 _cpc_PrintGphStrXY2X::
                             79 ;preparación datos impresión. El ancho y alto son fijos!
   2817 DD 21 02 00   [14]   80 	LD IX,#2
   281B DD 39         [15]   81 	ADD IX,SP
   281D DD 6E 03      [19]   82  	LD L,3 (IX)
   2820 DD 7E 02      [19]   83 	LD A,2 (IX)	;pantalla
   2823 CD 96 27      [17]   84 	CALL cpc_GetScrAddress0
   2826 DD 5E 00      [19]   85    	LD E,0 (IX)
   2829 DD 56 01      [19]   86 	LD D,1 (IX)	;texto origen
   282C 3E 01         [ 7]   87 	LD A,#1
   282E C3 5B 28      [10]   88  	JP cpc_PrintGphStr0
                             89 
                             90 .globl _cpc_PrintGphStrXY
                             91 
   2831                      92 _cpc_PrintGphStrXY::
                             93 ;preparación datos impresión. El ancho y alto son fijos!
   2831 DD 21 02 00   [14]   94 	LD IX,#2
   2835 DD 39         [15]   95 	ADD IX,SP
   2837 DD 6E 03      [19]   96  	LD L,3 (IX)
   283A DD 7E 02      [19]   97 	LD A,2 (IX)	;pantalla
   283D CD 96 27      [17]   98 	CALL cpc_GetScrAddress0
   2840 DD 5E 00      [19]   99    	LD E,0 (IX)
   2843 DD 56 01      [19]  100 	LD D,1 (IX)	;texto origen
   2846 C3 5B 28      [10]  101  	JP cpc_PrintGphStr0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            102 
                            103 
                            104 .globl _cpc_PrintGphStr
                            105 
   2849                     106 _cpc_PrintGphStr::
                            107 ;preparación datos impresión. El ancho y alto son fijos!
   2849 DD 21 02 00   [14]  108 	LD IX,#2
   284D DD 39         [15]  109 	ADD IX,SP
   284F DD 6E 02      [19]  110 	LD L,2 (IX)
   2852 DD 66 03      [19]  111 	LD H,3 (IX)	;DESTINO
                            112 	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
   2855 DD 5E 00      [19]  113    	LD E,0 (IX)
   2858 DD 56 01      [19]  114 	LD D,1 (IX)	;TEXTO ORIGEN
                            115 	;JP cpc_PrintGphStr0
                            116 
   285B                     117 cpc_PrintGphStr0:
                            118 
                            119 	;DE destino
                            120 	;HL origen
                            121 	;ex de,hl
   285B 32 21 29      [13]  122 	LD (#doble),A
                            123 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            124 	;la impresión en curso.
   285E 3A 22 29      [13]  125 	LD A,(#imprimiendo)
   2861 FE 01         [ 7]  126 	CP #1
   2863 CA 80 28      [10]  127 	JP Z,add_elemento
   2866 22 23 29      [16]  128 	LD (#direcc_destino),HL
   2869 EB            [ 4]  129 	EX DE,HL
   286A CD D6 28      [17]  130 	CALL bucle_texto0
                            131 
                            132 ;antes de terminar, se mira si hay algo en cola.
   286D                     133 bucle_cola_impresion:
   286D 3A C6 28      [13]  134 	LD A,(#elementos_cola)
   2870 B7            [ 4]  135 	OR A
   2871 CA 7A 28      [10]  136 	JP Z,terminar_impresion
   2874 CD A3 28      [17]  137 	CALL leer_elemento
   2877 C3 6D 28      [10]  138 	JP bucle_cola_impresion
                            139 
                            140 
   287A                     141 terminar_impresion:
   287A AF            [ 4]  142 	XOR A
   287B 32 22 29      [13]  143 	LD (#imprimiendo),A
   287E C9            [10]  144 	RET
   287F                     145 entrar_cola_impresion:
                            146 ;si se está imprimiendo se mete el valor en la cola
   287F C9            [10]  147 	RET
   2880                     148 add_elemento:
   2880 F3            [ 4]  149 	DI
   2881 DD 2A C8 28   [20]  150 	LD IX,(#pos_cola)
   2885 DD 75 00      [19]  151 	LD 0 (IX),L
   2888 DD 74 01      [19]  152 	LD 1 (IX),H
   288B DD 73 02      [19]  153 	LD 2 (IX),E
   288E DD 72 03      [19]  154 	LD 3 (IX),D
   2891 DD 23         [10]  155 	INC IX
   2893 DD 23         [10]  156 	INC IX
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   2895 DD 23         [10]  157 	INC IX
   2897 DD 23         [10]  158 	INC IX
   2899 DD 22 C8 28   [20]  159 	LD (#pos_cola),IX
                            160 
   289D 21 C6 28      [10]  161 	LD HL,#elementos_cola
   28A0 34            [11]  162 	INC (HL)
                            163 	;Se añaden los valores hl y de
   28A1 FB            [ 4]  164 	EI
   28A2 C9            [10]  165 	RET
   28A3                     166 leer_elemento:
   28A3 F3            [ 4]  167 	DI
   28A4 DD 2A C8 28   [20]  168 	LD IX,(#pos_cola)
   28A8 DD 6E 00      [19]  169 	LD L,0 (IX)
   28AB DD 66 01      [19]  170 	LD H,1 (IX)
   28AE DD 5E 02      [19]  171 	LD E,2 (IX)
   28B1 DD 56 04      [19]  172 	LD D,4 (IX)
   28B4 DD 2B         [10]  173 	DEC IX
   28B6 DD 2B         [10]  174 	DEC IX
   28B8 DD 2B         [10]  175 	DEC IX
   28BA DD 2B         [10]  176 	DEC IX
   28BC DD 22 C8 28   [20]  177 	LD (#pos_cola),IX
   28C0 21 C6 28      [10]  178 	LD HL,#elementos_cola
   28C3 35            [11]  179 	DEC (HL)
   28C4 FB            [ 4]  180 	EI
   28C5 C9            [10]  181 	RET
                            182 
   28C6                     183 elementos_cola:
   28C6 00 00               184 	.DW #0				; defw 0
   28C8                     185 pos_cola:
   28C8 CA 28               186 	.DW #cola_impresion ;defw cola_impresion
                            187 						;pos_escritura_cola defw cola_impresion
   28CA                     188 cola_impresion:  		; defs 12
   28CA 00 00 00 00 00 00   189 	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
        00 00 00 00 00 00
   28D6                     190 bucle_texto0:
   28D6 3E 01         [ 7]  191 	LD A,#1
   28D8 32 22 29      [13]  192 	LD (imprimiendo),A
                            193 
   28DB 3A 3F 2B      [13]  194 	LD A,(first_char)
   28DE 47            [ 4]  195 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
                            196 
   28DF 7E            [ 7]  197 	LD A,(HL)
   28E0 B7            [ 4]  198 	OR A ;CP 0
   28E1 C8            [11]  199 	RET Z
   28E2 90            [ 4]  200 	SUB B
   28E3 01 40 2B      [10]  201 	LD BC,#cpc_Chars	;apunto a la primera letra
   28E6 E5            [11]  202 	PUSH HL
                            203 
   28E7 6F            [ 4]  204 	LD L,A		;en A tengo la letra que sería
   28E8 26 00         [ 7]  205 	LD H,#0
   28EA 29            [11]  206 	ADD HL,HL
   28EB 29            [11]  207 	ADD HL,HL
   28EC 29            [11]  208 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   28ED 09            [11]  209 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   28EE CD 59 29      [17]  210 	CALL escribe_letra
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   28F1 3A 21 29      [13]  211 	LD A,(doble)
   28F4 FE 01         [ 7]  212 	CP #1
                            213 ; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   28F6 CC 40 29      [17]  214 	CALL Z, doblar_letra
   28F9 2A 23 29      [16]  215 	LD HL,(#direcc_destino)
   28FC 3A 21 29      [13]  216 	LD A,(doble)
   28FF FE 01         [ 7]  217 	CP #1
                            218 	;alto
   2901 28 08         [12]  219 	JR Z,cont_doble
   2903 11 0F 2B      [10]  220 	LD DE,#letra_decodificada
   2906 FD                  221 	.DB #0xfD
   2907 26 08         [ 7]  222 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2909 18 06         [12]  223 	JR cont_tot
                            224 
                            225 
   290B                     226 cont_doble:
   290B 11 1F 2B      [10]  227 	LD DE,#letra_decodificada_tmp
   290E FD                  228 	.DB #0xfD
   290F 26 10         [ 7]  229 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
                            230 
   2911                     231 cont_tot:
   2911 CD 25 29      [17]  232 	CALL cpc_PutSp0
   2914 2A 23 29      [16]  233 	LD HL,(#direcc_destino)
   2917 23            [ 6]  234 	INC HL
   2918 23            [ 6]  235 	INC HL
   2919 22 23 29      [16]  236 	LD (#direcc_destino),HL
   291C E1            [10]  237 	POP HL
   291D 23            [ 6]  238 	INC HL
   291E C3 D6 28      [10]  239 	JP bucle_texto0
                            240 
                            241 
   2921                     242 doble:
   2921 00                  243 	.DB #0
   2922                     244 imprimiendo:
   2922 00                  245 	.DB #0
   2923                     246 direcc_destino:
   2923 00 00               247 	.DW #0
                            248 
                            249 
   2925                     250 cpc_PutSp0:
                            251 ;	.DB #0xfD
                            252 ;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2925 06 07         [ 7]  253 	LD B,#7
   2927 48            [ 4]  254 	LD C,B
   2928                     255 loop_alto_2:
                            256 
   2928                     257 loop_ancho_2:
   2928 EB            [ 4]  258 	EX DE,HL
   2929 ED A0         [16]  259 	LDI
   292B ED A0         [16]  260 	LDI
   292D FD                  261 	.DB #0XFD
   292E 25            [ 4]  262 	DEC H
   292F C8            [11]  263 	RET Z
   2930 EB            [ 4]  264 	EX DE,HL
   2931                     265 salto_linea:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   2931 0E FE         [ 7]  266 	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
   2933 09            [11]  267 	ADD HL,BC
   2934 D2 28 29      [10]  268 	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
   2937 01 50 C0      [10]  269 	LD BC,#0XC050
   293A 09            [11]  270 	ADD HL,BC
   293B 06 07         [ 7]  271 	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
   293D C3 28 29      [10]  272 	JP loop_alto_2
                            273 
                            274 
                            275 
                            276 
   2940                     277 doblar_letra:
   2940 21 0F 2B      [10]  278 	LD HL,#letra_decodificada
   2943 11 1F 2B      [10]  279 	LD DE,#letra_decodificada_tmp
   2946 06 08         [ 7]  280 	LD B,#8
   2948                     281 buc_doblar_letra:
   2948 7E            [ 7]  282 	LD A,(HL)
   2949 23            [ 6]  283 	INC HL
   294A 12            [ 7]  284 	LD (DE),A
   294B 13            [ 6]  285 	INC DE
   294C 13            [ 6]  286 	INC DE
   294D 12            [ 7]  287 	LD (DE),A
   294E 1B            [ 6]  288 	DEC DE
   294F 7E            [ 7]  289 	LD A,(HL)
   2950 23            [ 6]  290 	INC HL
   2951 12            [ 7]  291 	LD (DE),A
   2952 13            [ 6]  292 	INC DE
   2953 13            [ 6]  293 	INC DE
   2954 12            [ 7]  294 	LD (DE),A
   2955 13            [ 6]  295 	INC DE
   2956 10 F0         [13]  296 	DJNZ buc_doblar_letra
   2958 C9            [10]  297 	RET
                            298 
                            299 
   2959                     300 escribe_letra:		; Code by Kevin Thacker
   2959 D5            [11]  301 	PUSH DE
   295A FD 21 0F 2B   [14]  302 	LD IY,#letra_decodificada
   295E 06 08         [ 7]  303 	LD B,#8
   2960                     304 bucle_alto_letra:
   2960 C5            [11]  305 	PUSH BC
   2961 E5            [11]  306 	PUSH HL
   2962 5E            [ 7]  307 	LD E,(HL)
   2963 CD 7A 29      [17]  308 	CALL op_colores
   2966 FD 72 00      [19]  309 	LD (IY),D
   2969 FD 23         [10]  310 	INC IY
   296B CD 7A 29      [17]  311 	CALL op_colores
   296E FD 72 00      [19]  312 	LD (IY),D
   2971 FD 23         [10]  313 	INC IY
   2973 E1            [10]  314 	POP HL
   2974 23            [ 6]  315 	INC HL
   2975 C1            [10]  316 	POP BC
   2976 10 E8         [13]  317 	DJNZ bucle_alto_letra
   2978 D1            [10]  318 	POP DE
   2979 C9            [10]  319 	RET
                            320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   297A                     321 op_colores:
   297A 16 00         [ 7]  322 	ld d,#0					;; initial byte at end will be result of 2 pixels combined
   297C CD 87 29      [17]  323 	CALL op_colores_pixel	;; do pixel 0
   297F CB 02         [ 8]  324 	RLC D
   2981 CD 87 29      [17]  325 	CALL op_colores_pixel
   2984 CB 0A         [ 8]  326 	RRC D
   2986 C9            [10]  327 	RET
                            328 
                            329 ;; follow through to do pixel 1
                            330 
   2987                     331 op_colores_pixel:
                            332 	;; shift out pixel into bits 0 and 1 (source)
   2987 CB 03         [ 8]  333 	RLC E
   2989 CB 03         [ 8]  334 	RLC E
                            335 	;; isolate
   298B 7B            [ 4]  336 	LD A,E
   298C E6 03         [ 7]  337 	AND #0X3
   298E 21 0B 2B      [10]  338 	LD HL,#colores_b0
   2991 85            [ 4]  339 	ADD A,L
   2992 6F            [ 4]  340 	LD L,A
   2993 7C            [ 4]  341 	LD A,H
   2994 CE 00         [ 7]  342 	ADC A,#0
   2996 67            [ 4]  343 	LD H,A
                            344 	;; READ IT AND COMBINE WITH PIXEL SO FAR
   2997 7A            [ 4]  345 	LD A,D
   2998 B6            [ 7]  346 	OR (HL)
   2999 57            [ 4]  347 	LD D,A
   299A C9            [10]  348 	RET
                            349 
                            350 
                            351 .globl _cpc_SetInkGphStr
                            352 
   299B                     353 _cpc_SetInkGphStr::
                            354 ;preparación datos impresión. El ancho y alto son fijos!
   299B DD 21 02 00   [14]  355 	LD IX,#2
   299F DD 39         [15]  356 	ADD IX,SP
                            357 
                            358 	;LD A,H
                            359 	;LD C,L
   29A1 DD 7E 01      [19]  360 	LD A,1 (IX) ;VALOR
   29A4 DD 4E 00      [19]  361 	LD C,0 (IX)	;COLOR
                            362 
   29A7 21 0B 2B      [10]  363 	LD HL,#colores_b0
   29AA 06 00         [ 7]  364 	LD B,#0
   29AC 09            [11]  365 	ADD HL,BC
   29AD 77            [ 7]  366 	LD (HL),A
   29AE C9            [10]  367 	RET
                            368 
                            369 
                            370 
                            371 
                            372 
                            373 .globl _cpc_PrintGphStrXYM1
                            374 
   29AF                     375 _cpc_PrintGphStrXYM1::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            376 ;preparación datos impresión. El ancho y alto son fijos!
   29AF DD 21 02 00   [14]  377 	LD IX,#2
   29B3 DD 39         [15]  378 	ADD IX,SP
   29B5 DD 6E 03      [19]  379  	LD L,3 (IX)
   29B8 DD 7E 02      [19]  380 	LD A,2 (IX)	;pantalla
   29BB CD 96 27      [17]  381 	CALL cpc_GetScrAddress0
   29BE DD 5E 00      [19]  382    	LD E,0 (IX)
   29C1 DD 56 01      [19]  383 	LD D,1 (IX)	;texto origen
   29C4 AF            [ 4]  384 	XOR A
   29C5 C3 0C 2A      [10]  385 	JP cpc_PrintGphStr0M1
                            386 
                            387 
                            388 .globl _cpc_PrintGphStrXYM12X
                            389 
   29C8                     390 _cpc_PrintGphStrXYM12X::
                            391 ;preparación datos impresión. El ancho y alto son fijos!
   29C8 DD 21 02 00   [14]  392 	LD IX,#2
   29CC DD 39         [15]  393 	ADD IX,SP
   29CE DD 6E 03      [19]  394  	LD L,3 (IX)
   29D1 DD 7E 02      [19]  395 	LD A,2 (IX)	;pantalla
   29D4 CD 96 27      [17]  396 	CALL cpc_GetScrAddress0
   29D7 DD 5E 00      [19]  397    	LD E,0 (IX)
   29DA DD 56 01      [19]  398 	LD D,1 (IX)	;texto origen
   29DD 3E 01         [ 7]  399 	LD A,#1
   29DF C3 0C 2A      [10]  400 	JP cpc_PrintGphStr0M1
                            401 
                            402 
                            403 
                            404 
                            405 .globl _cpc_PrintGphStrM12X
                            406 
   29E2                     407 _cpc_PrintGphStrM12X::
   29E2 DD 21 02 00   [14]  408 	LD IX,#2
   29E6 DD 39         [15]  409 	ADD IX,SP
   29E8 DD 6E 02      [19]  410 	LD L,2 (IX)
   29EB DD 66 03      [19]  411 	LD H,3 (IX)	;DESTINO
   29EE DD 5E 00      [19]  412    	LD E,0 (IX)
   29F1 DD 56 01      [19]  413 	LD D,1 (IX)	;TEXTO ORIGEN
   29F4 3E 01         [ 7]  414 	LD A,#1
                            415 
   29F6 C3 0C 2A      [10]  416 	JP cpc_PrintGphStr0M1
                            417 
                            418 
                            419 
                            420 .globl _cpc_PrintGphStrM1
                            421 
   29F9                     422 _cpc_PrintGphStrM1::
                            423 ;preparación datos impresión. El ancho y alto son fijos!
                            424 
   29F9 DD 21 02 00   [14]  425 	LD IX,#2
   29FD DD 39         [15]  426 	ADD IX,SP
   29FF DD 6E 02      [19]  427 	LD L,2 (IX)
   2A02 DD 66 03      [19]  428 	LD H,3 (IX)	;DESTINO
   2A05 DD 5E 00      [19]  429    	LD E,0 (IX)
   2A08 DD 56 01      [19]  430 	LD D,1 (IX)	;TEXTO ORIGEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   2A0B AF            [ 4]  431 	XOR A
                            432 
                            433 	;JP cpc_PrintGphStr0M1
                            434 
   2A0C                     435 cpc_PrintGphStr0M1:
                            436 	;DE destino
                            437 	;HL origen
                            438 	;ex de,hl
   2A0C 32 75 2A      [13]  439 	LD (#dobleM1),A
                            440 	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
                            441 	;la impresión en curso.
   2A0F 3A 22 29      [13]  442 	LD A,(#imprimiendo)
   2A12 FE 01         [ 7]  443 	CP #1
   2A14 CA 80 28      [10]  444 	JP Z,add_elemento
   2A17 22 23 29      [16]  445 	LD (#direcc_destino),HL
   2A1A EB            [ 4]  446 	EX DE,HL
   2A1B CD 2B 2A      [17]  447 	CALL bucle_texto0M1
                            448 ;antes de terminar, se mira si hay algo en cola.
   2A1E                     449 bucle_cola_impresionM1:
   2A1E 3A C6 28      [13]  450 	LD A,(#elementos_cola)
   2A21 B7            [ 4]  451 	OR A
   2A22 CA 7A 28      [10]  452 	JP Z,terminar_impresion
   2A25 CD A3 28      [17]  453 	CALL leer_elemento
   2A28 C3 1E 2A      [10]  454 	JP bucle_cola_impresionM1
                            455 
                            456 
                            457 
                            458 
                            459 
   2A2B                     460 bucle_texto0M1:
   2A2B 3E 01         [ 7]  461 	LD A,#1
   2A2D 32 22 29      [13]  462 	LD (#imprimiendo),A
                            463 
   2A30 3A 3F 2B      [13]  464 	LD A,(#first_char)
   2A33 47            [ 4]  465 	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)
   2A34 7E            [ 7]  466 	LD A,(HL)
   2A35 B7            [ 4]  467 	OR A ;CP 0
   2A36 C8            [11]  468 	RET Z
   2A37 90            [ 4]  469 	SUB B
   2A38 01 40 2B      [10]  470 	LD BC,#cpc_Chars	;apunto a la primera letra
   2A3B E5            [11]  471 	PUSH HL
   2A3C 6F            [ 4]  472 	LD L,A		;en A tengo la letra que sería
   2A3D 26 00         [ 7]  473 	LD H,#0
   2A3F 29            [11]  474 	ADD HL,HL
   2A40 29            [11]  475 	ADD HL,HL
   2A41 29            [11]  476 	ADD HL,HL	;x8 porque cada letra son 8 bytes
   2A42 09            [11]  477 	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
   2A43 CD A0 2A      [17]  478 	CALL escribe_letraM1
   2A46 3A 75 2A      [13]  479 	LD A,(dobleM1)
   2A49 FE 01         [ 7]  480 	CP #1
                            481 	; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
   2A4B CC 76 2A      [17]  482 	CALL Z, doblar_letraM1
   2A4E 2A 23 29      [16]  483 	LD HL,(direcc_destino)
   2A51 3A 75 2A      [13]  484 	LD A,(dobleM1)
   2A54 FE 01         [ 7]  485 	CP #1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            486 	;alto
   2A56 28 08         [12]  487 	JR Z,cont_dobleM1
   2A58 11 0F 2B      [10]  488 	LD DE,#letra_decodificada
   2A5B FD                  489 	.DB #0xfD
   2A5C 26 08         [ 7]  490 	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2A5E 18 06         [12]  491 	JR cont_totM1
                            492 
                            493 
   2A60                     494 cont_dobleM1:
   2A60 11 1F 2B      [10]  495 	LD DE,#letra_decodificada_tmp
   2A63 FD                  496 	.DB #0XFD
   2A64 26 10         [ 7]  497 	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2A66                     498 cont_totM1:
   2A66 CD 87 2A      [17]  499 	CALL cpc_PutSp0M1
   2A69 2A 23 29      [16]  500 	LD HL,(#direcc_destino)
   2A6C 23            [ 6]  501 	INC HL
   2A6D 22 23 29      [16]  502 	LD (#direcc_destino),HL
   2A70 E1            [10]  503 	POP HL
   2A71 23            [ 6]  504 	INC HL
   2A72 C3 2B 2A      [10]  505 	JP bucle_texto0M1
                            506 
   2A75                     507 dobleM1:
   2A75 00                  508 	.DB #0
                            509 ;.imprimiendo defb 0
                            510 ;.direcc_destino defw 0
                            511 
   2A76                     512 doblar_letraM1:
   2A76 21 0F 2B      [10]  513 	LD HL,#letra_decodificada
   2A79 11 1F 2B      [10]  514 	LD DE,#letra_decodificada_tmp
   2A7C 06 08         [ 7]  515 	LD B,#8
   2A7E                     516 buc_doblar_letraM1:
   2A7E 7E            [ 7]  517 	LD A,(HL)
   2A7F 23            [ 6]  518 	INC HL
   2A80 12            [ 7]  519 	LD (DE),A
   2A81 13            [ 6]  520 	INC DE
   2A82 12            [ 7]  521 	LD (DE),A
   2A83 13            [ 6]  522 	INC DE
   2A84 10 F8         [13]  523 	DJNZ buc_doblar_letraM1
   2A86 C9            [10]  524 	RET
                            525 
                            526 
   2A87                     527 cpc_PutSp0M1:
                            528 	;	defb #0xfD
                            529    	;	LD H,8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   2A87 06 07         [ 7]  530 	LD B,#7
   2A89 48            [ 4]  531 	LD C,B
   2A8A                     532 loop_alto_2M1:
   2A8A                     533 loop_ancho_2M1:
   2A8A EB            [ 4]  534 	EX DE,HL
   2A8B ED A0         [16]  535 	LDI
   2A8D FD                  536 	.DB #0XFD
   2A8E 25            [ 4]  537 	DEC H
   2A8F C8            [11]  538 	RET Z
   2A90 EB            [ 4]  539 	EX DE,HL
   2A91                     540 salto_lineaM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   2A91 0E FF         [ 7]  541 	LD C,#0XFF			;#0x07f6 			;salto linea menos ancho
   2A93 09            [11]  542 	ADD HL,BC
   2A94 D2 8A 2A      [10]  543 	JP NC,loop_alto_2M1 ;sig_linea_2zz		;si no desborda va a la siguiente linea
   2A97 01 50 C0      [10]  544 	LD BC,#0XC050
   2A9A 09            [11]  545 	ADD HL,BC
   2A9B 06 07         [ 7]  546 	LD B,#7			;sólo se daría una de cada 8 veces en un sprite
   2A9D C3 8A 2A      [10]  547 	JP loop_alto_2M1
                            548 
                            549 
                            550 
   2AA0                     551 escribe_letraM1:
   2AA0 FD 21 0F 2B   [14]  552 	LD IY,#letra_decodificada
   2AA4 06 08         [ 7]  553 	LD B,#8
   2AA6 DD 21 08 2B   [14]  554 	LD IX,#byte_tmp
   2AAA                     555 bucle_altoM1:
   2AAA C5            [11]  556 	PUSH BC
   2AAB E5            [11]  557 	PUSH HL
                            558 
   2AAC 7E            [ 7]  559 	LD A,(HL)
   2AAD 21 07 2B      [10]  560 	LD HL,#dato
   2AB0 77            [ 7]  561 	LD (HL),A
                            562 	;me deja en ix los valores convertidos
                            563 	;HL tiene la dirección origen de los datos de la letra
                            564 	;LD DE,letra	;el destino es la posición de decodificación de la letra
                            565 	;Se analiza el byte por parejas de bits para saber el color de cada pixel.
   2AB1 DD 36 00 00   [19]  566 	LD (IX),#0	;reset el byte
   2AB5 06 04         [ 7]  567 	LD B,#4	;son 4 pixels por byte. Los recorro en un bucle y miro qué color tiene cada byte.
   2AB7                     568 bucle_coloresM1:
                            569 	;roto el byte en (HL)
   2AB7 E5            [11]  570 	PUSH HL
   2AB8 CD D0 2A      [17]  571 	CALL op_colores_m1	;voy a ver qué color es el byte. tengo un máximo de 4 colores posibles en modo 0.
   2ABB E1            [10]  572 	POP HL
   2ABC CB 3E         [15]  573 	SRL (HL)
   2ABE CB 3E         [15]  574 	SRL (HL)	;voy rotando el byte para mirar los bits por pares.
   2AC0 10 F5         [13]  575 	DJNZ bucle_coloresM1
   2AC2 DD 7E 00      [19]  576 	LD A,(IX)
   2AC5 FD 77 00      [19]  577 	LD (IY),A
   2AC8 FD 23         [10]  578 	INC IY
   2ACA E1            [10]  579 	POP HL
   2ACB 23            [ 6]  580 	INC HL
   2ACC C1            [10]  581 	POP BC
   2ACD 10 DB         [13]  582 	DJNZ bucle_altoM1
   2ACF C9            [10]  583 	RET
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
   2AD0                     605 op_colores_m1:   	;rutina en modo 1
                            606 					;mira el color del bit a pintar
   2AD0 3E 03         [ 7]  607 	LD A,#3			;hay 4 colores posibles. Me quedo con los 2 primeros bits
   2AD2 A6            [ 7]  608 	AND (HL)
                            609 	; EN A tengo el número de bytes a sumar!!
   2AD3 21 03 2B      [10]  610 	LD HL,#colores_m1
   2AD6 5F            [ 4]  611 	LD E,A
   2AD7 16 00         [ 7]  612 	LD D,#0
   2AD9 19            [11]  613 	ADD HL,DE
   2ADA 4E            [ 7]  614 	LD C,(HL)
                            615 	;EN C ESTÁ EL BYTE DEL COLOR
                            616 	;LD A,4
                            617 	;SUB B
   2ADB 78            [ 4]  618 	LD A,B
   2ADC 3D            [ 4]  619 	DEC A
   2ADD B7            [ 4]  620 	OR A ;CP 0
   2ADE CA E7 2A      [10]  621 	JP Z,_sin_rotar
   2AE1                     622 rotando:
   2AE1 CB 39         [ 8]  623 	SRL C
   2AE3 3D            [ 4]  624 	DEC A
   2AE4 C2 E1 2A      [10]  625 	JP NZ, rotando
   2AE7                     626 _sin_rotar:
   2AE7 79            [ 4]  627 	LD A,C
   2AE8 DD B6 00      [19]  628 	OR (IX)
   2AEB DD 77 00      [19]  629 	LD (IX),A
                            630 	;INC IX
   2AEE C9            [10]  631 	RET
                            632 
                            633 
                            634 .globl _cpc_SetInkGphStrM1
                            635 
   2AEF                     636 _cpc_SetInkGphStrM1::
   2AEF DD 21 02 00   [14]  637 	LD IX,#2
   2AF3 DD 39         [15]  638 	ADD IX,SP
   2AF5 DD 7E 01      [19]  639 	LD A,1 (IX) ;VALOR
   2AF8 DD 4E 00      [19]  640 	LD C,0 (IX)	;COLOR
   2AFB 21 03 2B      [10]  641 	LD HL,#colores_cambM1
   2AFE 06 00         [ 7]  642 	LD B,#0
   2B00 09            [11]  643 	ADD HL,BC
   2B01 77            [ 7]  644 	LD (HL),A
   2B02 C9            [10]  645 	RET
                            646 
                            647 
                            648 
   2B03                     649 colores_cambM1:
   2B03                     650 colores_m1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   2B03 00 88 80 08         651 	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000
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
   2B07                     663 dato:
   2B07 1B                  664 	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar
                            665 
   2B08                     666 byte_tmp:
   2B08 00                  667 	.DB #0
   2B09 00                  668 	.DB #0
   2B0A 00                  669 	.DB #0  ;defs 3
   2B0B                     670 colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
                            671 	  		;Pero se tienen que poner bien, en la posición que le corresponda.
   2B0B 0A 20 A0 28         672 	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
                            673 	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000
                            674 
   2B0F                     675 letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
   2B0F 00 00 00 00 00 00   676 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   2B17 00 00 00 00 00 00   677 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   2B1F                     678 letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
   2B1F 00 00 00 00 00 00   679 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   2B27 00 00 00 00 00 00   680 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   2B2F 00 00 00 00 00 00   681 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
   2B37 00 00 00 00 00 00   682 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            683 
                            684 
   2B3F                     685 first_char:
   2B3F 2F                  686 	.DB #47	;first defined char number (ASCII)
                            687 
   2B40                     688 cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
                            689 	;/
   2B40 01                  690 	.DB #0b00000001
   2B41 01                  691 	.DB #0b00000001
   2B42 08                  692 	.DB #0b00001000
   2B43 08                  693 	.DB #0b00001000
   2B44 3C                  694 	.DB #0b00111100
   2B45 30                  695 	.DB #0b00110000
   2B46 30                  696 	.DB #0b00110000
   2B47 00                  697 	.DB #0b00000000
                            698 ;0-9
   2B48 54                  699 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   2B49 44                  700 .db #0b01000100
   2B4A 88                  701 .db #0b10001000
   2B4B 88                  702 .db #0b10001000
   2B4C 88                  703 .db #0b10001000
   2B4D CC                  704 .db #0b11001100
   2B4E FC                  705 .db #0b11111100
   2B4F 00                  706 .db #0b00000000
   2B50 10                  707 .db #0b00010000
   2B51 50                  708 .db #0b01010000
   2B52 20                  709 .db #0b00100000
   2B53 20                  710 .db #0b00100000
   2B54 20                  711 .db #0b00100000
   2B55 30                  712 .db #0b00110000
   2B56 FC                  713 .db #0b11111100
   2B57 00                  714 .db #0b00000000
   2B58 54                  715 .db #0b01010100
   2B59 44                  716 .db #0b01000100
   2B5A 08                  717 .db #0b00001000
   2B5B A8                  718 .db #0b10101000
   2B5C 80                  719 .db #0b10000000
   2B5D CC                  720 .db #0b11001100
   2B5E FC                  721 .db #0b11111100
   2B5F 00                  722 .db #0b00000000
   2B60 54                  723 .db #0b01010100
   2B61 44                  724 .db #0b01000100
   2B62 08                  725 .db #0b00001000
   2B63 28                  726 .db #0b00101000
   2B64 08                  727 .db #0b00001000
   2B65 CC                  728 .db #0b11001100
   2B66 FC                  729 .db #0b11111100
   2B67 00                  730 .db #0b00000000
   2B68 44                  731 .db #0b01000100
   2B69 44                  732 .db #0b01000100
   2B6A 88                  733 .db #0b10001000
   2B6B A8                  734 .db #0b10101000
   2B6C 08                  735 .db #0b00001000
   2B6D 0C                  736 .db #0b00001100
   2B6E 0C                  737 .db #0b00001100
   2B6F 00                  738 .db #0b00000000
   2B70 54                  739 .db #0b01010100
   2B71 44                  740 .db #0b01000100
   2B72 80                  741 .db #0b10000000
   2B73 A8                  742 .db #0b10101000
   2B74 08                  743 .db #0b00001000
   2B75 CC                  744 .db #0b11001100
   2B76 FC                  745 .db #0b11111100
   2B77 00                  746 .db #0b00000000
   2B78 54                  747 .db #0b01010100
   2B79 44                  748 .db #0b01000100
   2B7A 80                  749 .db #0b10000000
   2B7B A8                  750 .db #0b10101000
   2B7C 88                  751 .db #0b10001000
   2B7D CC                  752 .db #0b11001100
   2B7E FC                  753 .db #0b11111100
   2B7F 00                  754 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   2B80 54                  755 .db #0b01010100
   2B81 44                  756 .db #0b01000100
   2B82 08                  757 .db #0b00001000
   2B83 08                  758 .db #0b00001000
   2B84 20                  759 .db #0b00100000
   2B85 30                  760 .db #0b00110000
   2B86 30                  761 .db #0b00110000
   2B87 00                  762 .db #0b00000000
   2B88 54                  763 .db #0b01010100
   2B89 44                  764 .db #0b01000100
   2B8A 88                  765 .db #0b10001000
   2B8B A8                  766 .db #0b10101000
   2B8C 88                  767 .db #0b10001000
   2B8D CC                  768 .db #0b11001100
   2B8E FC                  769 .db #0b11111100
   2B8F 00                  770 .db #0b00000000
   2B90 54                  771 .db #0b01010100
   2B91 44                  772 .db #0b01000100
   2B92 88                  773 .db #0b10001000
   2B93 A8                  774 .db #0b10101000
   2B94 08                  775 .db #0b00001000
   2B95 CC                  776 .db #0b11001100
   2B96 FC                  777 .db #0b11111100
   2B97 00                  778 .db #0b00000000
                            779 
                            780 
                            781 
                            782 
                            783 
                            784 
                            785 	;:
   2B98 00                  786 	.DB #0b00000000
   2B99 00                  787 	.DB #0b00000000
   2B9A 20                  788 	.DB #0b00100000
   2B9B 00                  789 	.DB #0b00000000
   2B9C 30                  790 	.DB #0b00110000
   2B9D 00                  791 	.DB #0b00000000
   2B9E 00                  792 	.DB #0b00000000
   2B9F 00                  793 	.DB #0b00000000
                            794 	;SPC (;)
   2BA0 00 00 00 00 00 00   795 	.DB #0,#0,#0,#0,#0,#0,#0,#0
        00 00
                            796 	;.   (<)
   2BA8 00                  797 	.DB #0b00000000
   2BA9 00                  798 	.DB #0b00000000
   2BAA 00                  799 	.DB #0b00000000
   2BAB 00                  800 	.DB #0b00000000
   2BAC 00                  801 	.DB #0b00000000
   2BAD 00                  802 	.DB #0b00000000
   2BAE C0                  803 	.DB #0b11000000
   2BAF 00                  804 	.DB #0b00000000
                            805 	;Ñ    (=)
   2BB0 00                  806 .db #0b00000000
   2BB1 54                  807 .db #0b01010100
   2BB2 00                  808 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   2BB3 A0                  809 .db #0b10100000
   2BB4 88                  810 .db #0b10001000
   2BB5 CC                  811 .db #0b11001100
   2BB6 CC                  812 .db #0b11001100
   2BB7 00                  813 .db #0b00000000
                            814 
                            815 	; !	(>)
   2BB8 00                  816 	.DB #0b00000000
   2BB9 10                  817 	.DB #0b00010000
   2BBA 20                  818 	.DB #0b00100000
   2BBB 20                  819 	.DB #0b00100000
   2BBC 30                  820 	.DB #0b00110000
   2BBD 00                  821 	.DB #0b00000000
   2BBE 30                  822 	.DB #0b00110000
   2BBF 00                  823 	.DB #0b00000000
                            824 	;-> (?)
   2BC0 00                  825 	.DB #0b00000000
   2BC1 00                  826 	.DB #0b00000000
   2BC2 80                  827 	.DB #0b10000000
   2BC3 A0                  828 	.DB #0b10100000
   2BC4 FC                  829 	.DB #0b11111100
   2BC5 FC                  830 	.DB #0b11111100
   2BC6 00                  831 	.DB #0b00000000
   2BC7 00                  832 	.DB #0b00000000
                            833 	;-  (@)
   2BC8 00                  834 	.DB #0b00000000
   2BC9 00                  835 	.DB #0b00000000
   2BCA 00                  836 	.DB #0b00000000
   2BCB A8                  837 	.DB #0b10101000
   2BCC FC                  838 	.DB #0b11111100
   2BCD 00                  839 	.DB #0b00000000
   2BCE 00                  840 	.DB #0b00000000
   2BCF 00                  841 	.DB #0b00000000
                            842 
                            843 
                            844 
                            845 ;A-Z
   2BD0 00                  846 .db #0b00000000
   2BD1 54                  847 .db #0b01010100
   2BD2 88                  848 .db #0b10001000
   2BD3 88                  849 .db #0b10001000
   2BD4 A8                  850 .db #0b10101000
   2BD5 CC                  851 .db #0b11001100
   2BD6 CC                  852 .db #0b11001100
   2BD7 00                  853 .db #0b00000000
   2BD8 00                  854 .db #0b00000000
   2BD9 54                  855 .db #0b01010100
   2BDA 88                  856 .db #0b10001000
   2BDB A8                  857 .db #0b10101000
   2BDC 88                  858 .db #0b10001000
   2BDD CC                  859 .db #0b11001100
   2BDE FC                  860 .db #0b11111100
   2BDF 00                  861 .db #0b00000000
   2BE0 00                  862 .db #0b00000000
   2BE1 54                  863 .db #0b01010100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   2BE2 88                  864 .db #0b10001000
   2BE3 80                  865 .db #0b10000000
   2BE4 88                  866 .db #0b10001000
   2BE5 CC                  867 .db #0b11001100
   2BE6 FC                  868 .db #0b11111100
   2BE7 00                  869 .db #0b00000000
   2BE8 00                  870 .db #0b00000000
   2BE9 54                  871 .db #0b01010100
   2BEA 88                  872 .db #0b10001000
   2BEB 88                  873 .db #0b10001000
   2BEC 88                  874 .db #0b10001000
   2BED CC                  875 .db #0b11001100
   2BEE F0                  876 .db #0b11110000
   2BEF 00                  877 .db #0b00000000
   2BF0 00                  878 .db #0b00000000
   2BF1 54                  879 .db #0b01010100
   2BF2 80                  880 .db #0b10000000
   2BF3 A8                  881 .db #0b10101000
   2BF4 80                  882 .db #0b10000000
   2BF5 CC                  883 .db #0b11001100
   2BF6 FC                  884 .db #0b11111100
   2BF7 00                  885 .db #0b00000000
   2BF8 00                  886 .db #0b00000000
   2BF9 54                  887 .db #0b01010100
   2BFA 80                  888 .db #0b10000000
   2BFB A8                  889 .db #0b10101000
   2BFC 80                  890 .db #0b10000000
   2BFD C0                  891 .db #0b11000000
   2BFE C0                  892 .db #0b11000000
   2BFF 00                  893 .db #0b00000000
   2C00 00                  894 .db #0b00000000
   2C01 54                  895 .db #0b01010100
   2C02 88                  896 .db #0b10001000
   2C03 80                  897 .db #0b10000000
   2C04 A8                  898 .db #0b10101000
   2C05 CC                  899 .db #0b11001100
   2C06 FC                  900 .db #0b11111100
   2C07 00                  901 .db #0b00000000
   2C08 00                  902 .db #0b00000000
   2C09 44                  903 .db #0b01000100
   2C0A 88                  904 .db #0b10001000
   2C0B 88                  905 .db #0b10001000
   2C0C A8                  906 .db #0b10101000
   2C0D CC                  907 .db #0b11001100
   2C0E CC                  908 .db #0b11001100
   2C0F 00                  909 .db #0b00000000
   2C10 00                  910 .db #0b00000000
   2C11 54                  911 .db #0b01010100
   2C12 20                  912 .db #0b00100000
   2C13 20                  913 .db #0b00100000
   2C14 20                  914 .db #0b00100000
   2C15 30                  915 .db #0b00110000
   2C16 FC                  916 .db #0b11111100
   2C17 00                  917 .db #0b00000000
   2C18 00                  918 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   2C19 54                  919 .db #0b01010100
   2C1A A8                  920 .db #0b10101000
   2C1B 08                  921 .db #0b00001000
   2C1C 08                  922 .db #0b00001000
   2C1D CC                  923 .db #0b11001100
   2C1E FC                  924 .db #0b11111100
   2C1F 00                  925 .db #0b00000000
   2C20 00                  926 .db #0b00000000
   2C21 44                  927 .db #0b01000100
   2C22 88                  928 .db #0b10001000
   2C23 A0                  929 .db #0b10100000
   2C24 88                  930 .db #0b10001000
   2C25 CC                  931 .db #0b11001100
   2C26 CC                  932 .db #0b11001100
   2C27 00                  933 .db #0b00000000
   2C28 00                  934 .db #0b00000000
   2C29 40                  935 .db #0b01000000
   2C2A 80                  936 .db #0b10000000
   2C2B 80                  937 .db #0b10000000
   2C2C 80                  938 .db #0b10000000
   2C2D CC                  939 .db #0b11001100
   2C2E FC                  940 .db #0b11111100
   2C2F 00                  941 .db #0b00000000
   2C30 00                  942 .db #0b00000000
   2C31 54                  943 .db #0b01010100
   2C32 A8                  944 .db #0b10101000
   2C33 88                  945 .db #0b10001000
   2C34 88                  946 .db #0b10001000
   2C35 CC                  947 .db #0b11001100
   2C36 CC                  948 .db #0b11001100
   2C37 00                  949 .db #0b00000000
   2C38 00                  950 .db #0b00000000
   2C39 50                  951 .db #0b01010000
   2C3A 88                  952 .db #0b10001000
   2C3B 88                  953 .db #0b10001000
   2C3C 88                  954 .db #0b10001000
   2C3D CC                  955 .db #0b11001100
   2C3E CC                  956 .db #0b11001100
   2C3F 00                  957 .db #0b00000000
   2C40 00                  958 .db #0b00000000
   2C41 54                  959 .db #0b01010100
   2C42 88                  960 .db #0b10001000
   2C43 88                  961 .db #0b10001000
   2C44 88                  962 .db #0b10001000
   2C45 CC                  963 .db #0b11001100
   2C46 FC                  964 .db #0b11111100
   2C47 00                  965 .db #0b00000000
   2C48 00                  966 .db #0b00000000
   2C49 54                  967 .db #0b01010100
   2C4A 88                  968 .db #0b10001000
   2C4B 88                  969 .db #0b10001000
   2C4C A8                  970 .db #0b10101000
   2C4D C0                  971 .db #0b11000000
   2C4E C0                  972 .db #0b11000000
   2C4F 00                  973 .db #0b00000000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   2C50 00                  974 .db #0b00000000
   2C51 54                  975 .db #0b01010100
   2C52 88                  976 .db #0b10001000
   2C53 88                  977 .db #0b10001000
   2C54 88                  978 .db #0b10001000
   2C55 FC                  979 .db #0b11111100
   2C56 FC                  980 .db #0b11111100
   2C57 00                  981 .db #0b00000000
   2C58 00                  982 .db #0b00000000
   2C59 54                  983 .db #0b01010100
   2C5A 88                  984 .db #0b10001000
   2C5B 88                  985 .db #0b10001000
   2C5C A0                  986 .db #0b10100000
   2C5D CC                  987 .db #0b11001100
   2C5E CC                  988 .db #0b11001100
   2C5F 00                  989 .db #0b00000000
   2C60 00                  990 .db #0b00000000
   2C61 54                  991 .db #0b01010100
   2C62 80                  992 .db #0b10000000
   2C63 A8                  993 .db #0b10101000
   2C64 08                  994 .db #0b00001000
   2C65 CC                  995 .db #0b11001100
   2C66 FC                  996 .db #0b11111100
   2C67 00                  997 .db #0b00000000
   2C68 00                  998 .db #0b00000000
   2C69 54                  999 .db #0b01010100
   2C6A 20                 1000 .db #0b00100000
   2C6B 20                 1001 .db #0b00100000
   2C6C 20                 1002 .db #0b00100000
   2C6D 30                 1003 .db #0b00110000
   2C6E 30                 1004 .db #0b00110000
   2C6F 00                 1005 .db #0b00000000
   2C70 00                 1006 .db #0b00000000
   2C71 44                 1007 .db #0b01000100
   2C72 88                 1008 .db #0b10001000
   2C73 88                 1009 .db #0b10001000
   2C74 88                 1010 .db #0b10001000
   2C75 CC                 1011 .db #0b11001100
   2C76 FC                 1012 .db #0b11111100
   2C77 00                 1013 .db #0b00000000
   2C78 00                 1014 .db #0b00000000
   2C79 44                 1015 .db #0b01000100
   2C7A 88                 1016 .db #0b10001000
   2C7B 88                 1017 .db #0b10001000
   2C7C 88                 1018 .db #0b10001000
   2C7D CC                 1019 .db #0b11001100
   2C7E 30                 1020 .db #0b00110000
   2C7F 00                 1021 .db #0b00000000
   2C80 00                 1022 .db #0b00000000
   2C81 44                 1023 .db #0b01000100
   2C82 88                 1024 .db #0b10001000
   2C83 88                 1025 .db #0b10001000
   2C84 88                 1026 .db #0b10001000
   2C85 FC                 1027 .db #0b11111100
   2C86 CC                 1028 .db #0b11001100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   2C87 00                 1029 .db #0b00000000
   2C88 00                 1030 .db #0b00000000
   2C89 44                 1031 .db #0b01000100
   2C8A 88                 1032 .db #0b10001000
   2C8B A0                 1033 .db #0b10100000
   2C8C 20                 1034 .db #0b00100000
   2C8D CC                 1035 .db #0b11001100
   2C8E CC                 1036 .db #0b11001100
   2C8F 00                 1037 .db #0b00000000
   2C90 00                 1038 .db #0b00000000
   2C91 44                 1039 .db #0b01000100
   2C92 88                 1040 .db #0b10001000
   2C93 88                 1041 .db #0b10001000
   2C94 20                 1042 .db #0b00100000
   2C95 30                 1043 .db #0b00110000
   2C96 30                 1044 .db #0b00110000
   2C97 00                 1045 .db #0b00000000
   2C98 00                 1046 .db #0b00000000
   2C99 54                 1047 .db #0b01010100
   2C9A 08                 1048 .db #0b00001000
   2C9B 20                 1049 .db #0b00100000
   2C9C 80                 1050 .db #0b10000000
   2C9D CC                 1051 .db #0b11001100
   2C9E FC                 1052 .db #0b11111100
   2C9F 00                 1053 .db #0b00000000
                           1054 
                           1055 
                           1056 
                           1057 
                           1058 	;-
   2CA0 03                 1059 	.DB #0b00000011
   2CA1 0F                 1060 	.DB #0b00001111
   2CA2 3F                 1061 	.DB #0b00111111
   2CA3 FF                 1062 	.DB #0b11111111
   2CA4 3F                 1063 	.DB #0b00111111
   2CA5 0F                 1064 	.DB #0b00001111
   2CA6 03                 1065 	.DB #0b00000011
   2CA7 00                 1066 	.DB #0b00000000
