ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl _cpc_memset
   4BFD                       2 _cpc_memset::
                              3 
                              4 ;; guardo la dirección de la pila
                              5 ;;	LD DE, SP  
                              6 ;; Recover parameters from stack
                              7 ;;   ld   hl, #2       ;; [10] Make HL point to the byte where parameters start in the
                              8 ;;   add  hl, sp       ;; [11] ... stack (first 2 bytes are return address)
                              9 ;;  ld    e, (hl)     ;; [ 7] DE = Pointer to first byte in memory for memset
                             10 ;;   inc  hl           ;; [ 6]
                             11 ;;   ld    d, (hl)     ;; [ 7] 
                             12 ;;   inc  hl           ;; [ 6]         
                             13 ;;   ld 	hl, #0
                             14 ;;  	LD BC, 0x1800   ; Size of screen
                             15 ;;  	LD SP, 0x4000   ; Start of screen
                             16 ;;  	LOOP:
                             17 ;;  	PUSH HL
                             18 ;;  	DEC BC
                             19 ;;  	JNZ LOOP
                             20 ;;  	LD SP, DE
   4BFD C9            [10]   21   	ret
                             22 
                             23 .globl _set_stack
   4BFE                      24 _set_stack::
   4BFE C1            [10]   25 	pop bc
   4BFF E1            [10]   26 	pop hl
   4C00 F9            [ 6]   27 	ld sp, hl
   4C01 E5            [11]   28 	push hl
   4C02 C5            [11]   29 	push bc
   4C03 C9            [10]   30 	ret
                             31 
                             32 ;******************************
                             33 ; 	unsigned char fastCollision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2){
                             34 ; 	Descripción:	Devuelve 1 si se ha producido una colisión y 0 en caso contrario
                             35 ;	Entrada:	- Coordenada x objeto 1
                             36 ;				- Coordenada y objeto 1
                             37 ;				- Ancho objeto 1
                             38 ;				- Alto objeto 1
                             39 ;				- Coordenada x objeto 1
                             40 ;				- Coordenada y objeto 1
                             41 ;				- Ancho objeto 1
                             42 ;				- Alto objeto 1
                             43 ;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
                             44 ;	Modificados: 
                             45 ;
                             46 ; @JohnLobo Nov15  
                             47 ;******************************
                             48 .globl _fast_collision
   4C04                      49 _fast_collision::	
                             50 
   4C04 DD 21 02 00   [14]   51 	ld ix,#2
   4C08 DD 39         [15]   52 	add ix,sp
                             53 	
   4C0A DD 7E 00      [19]   54 	ld a,0 (ix)				;recupero la coordenada x1
   4C0D 67            [ 4]   55 	ld h,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   4C0E DD 7E 02      [19]   56 	ld a,2 (ix)				;recupero el ancho 1
   4C11 84            [ 4]   57 	add a,h
   4C12 6F            [ 4]   58 	ld l,a
   4C13 DD 7E 04      [19]   59 	ld a,4 (ix)				;recupero la coordenada x2
   4C16 47            [ 4]   60 	ld b,a
   4C17 DD 7E 06      [19]   61 	ld a,6 (ix)				;recupero el ancho 2
   4C1A 80            [ 4]   62 	add a,b
   4C1B 4F            [ 4]   63 	ld c,a
   4C1C CD 42 4C      [17]   64 	call #solseg
   4C1F 30 1C         [12]   65 	jr nc, no_choca
   4C21 DD 7E 01      [19]   66 	ld a,1 (ix)				;recupero la coordenada y1
   4C24 67            [ 4]   67 	ld h,a
   4C25 DD 7E 03      [19]   68 	ld a,3 (ix)				;recupero el alto 1
   4C28 84            [ 4]   69 	add a,h
   4C29 6F            [ 4]   70 	ld l,a
   4C2A DD 7E 05      [19]   71 	ld a,5 (ix)				;recupero la coordenada y2
   4C2D 47            [ 4]   72 	ld b,a
   4C2E DD 7E 07      [19]   73 	ld a,7 (ix)				;recupero el alto 2
   4C31 80            [ 4]   74 	add a,b
   4C32 4F            [ 4]   75 	ld c,a
   4C33 CD 42 4C      [17]   76 	call #solseg
   4C36 30 05         [12]   77 	jr nc, no_choca
   4C38 26 00         [ 7]   78 	ld h,#0
   4C3A 2E 01         [ 7]   79 	ld l,#1
   4C3C C9            [10]   80 	ret
   4C3D                      81 no_choca:
   4C3D 26 00         [ 7]   82 	ld h,#0
   4C3F 2E 00         [ 7]   83 	ld l,#0
   4C41 C9            [10]   84 	ret
                             85 
   4C42                      86 solseg:
   4C42 79            [ 4]   87 	ld a,c					;solapamaiento
   4C43 BC            [ 4]   88 	cp h
   4C44 38 02         [12]   89 	jr c, #solseg1			;no hay colisión continua
   4C46 7D            [ 4]   90 	ld a,l
   4C47 B8            [ 4]   91 	cp b
   4C48                      92 solseg1:
   4C48 3F            [ 4]   93 	ccf						;complemento carry
   4C49 C9            [10]   94 	ret
                             95 
                             96 
                             97 ;******************************
                             98 ; 	unsigned char detectColision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned, char y2,unsigned char w2,unsigned char h2){
                             99 ;	return ((x1 < x2 + w2) &&
                            100 ;	(x1 + w1 > x2) &&
                            101 ;	(y1 < y2 + h2) &&
                            102 ;	(h1 + y1 > y2));
                            103 ;
                            104 ; 	Descripción:	Devuelve la dirección de pantalla correspondiente a las coordenadas x,y pasadas 
                            105 ;					como parámetro
                            106 ;	Entrada:	- Coordenada x objeto 1
                            107 ;				- Coordenada y objeto 1
                            108 ;				- Ancho objeto 1
                            109 ;				- Alto objeto 1
                            110 ;				- Coordenada x objeto 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            111 ;				- Coordenada y objeto 1
                            112 ;				- Ancho objeto 1
                            113 ;				- Alto objeto 1
                            114 ;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
                            115 ;	Modificados: 
                            116 ;
                            117 ; @JohnLobo Nov15  
                            118 ;******************************
                            119 .globl _detect_collision
   4C4A                     120 _detect_collision::		
                            121 	
   4C4A DD 21 02 00   [14]  122 	ld ix,#2
   4C4E DD 39         [15]  123 	add ix,sp
                            124 	
   4C50 DD 7E 00      [19]  125 	ld a,0 (ix)				;recupero la coordenada x1
   4C53 32 14 4D      [13]  126 	ld (#coordenadas1),a
   4C56 DD 7E 01      [19]  127 	ld a,1 (ix)				;recupero la coordenada y1
   4C59 32 15 4D      [13]  128 	ld (#coordenadas1+1),a
   4C5C DD 7E 02      [19]  129 	ld a,2 (ix)				;recupero el ancho 1
   4C5F 32 16 4D      [13]  130 	ld (#dimensiones1),a
   4C62 DD 7E 03      [19]  131 	ld a,3 (ix)				;recupero el alto 1
   4C65 32 17 4D      [13]  132 	ld (#dimensiones1+1),a
   4C68 DD 7E 04      [19]  133 	ld a,4 (ix)				;recupero la coordenada x2
   4C6B 32 18 4D      [13]  134 	ld (#coordenadas2),a
   4C6E DD 7E 05      [19]  135 	ld a,5 (ix)				;recupero la coordenada y2
   4C71 32 19 4D      [13]  136 	ld (#coordenadas2+1),a
   4C74 DD 7E 06      [19]  137 	ld a,6 (ix)				;recupero el ancho 2
   4C77 32 1A 4D      [13]  138 	ld (#dimensiones2),a
   4C7A DD 7E 07      [19]  139 	ld a,7 (ix)				;recupero el alto 2
   4C7D 32 1B 4D      [13]  140 	ld (#dimensiones2+1),a
                            141 
                            142 ; x1 < x2 + w2
   4C80 06 00         [ 7]  143 	ld b,#0
   4C82 3A 18 4D      [13]  144 	ld a,(#coordenadas2)
   4C85 4F            [ 4]  145 	ld c,a
   4C86 26 00         [ 7]  146 	ld h,#0
   4C88 3A 1A 4D      [13]  147 	ld a,(#dimensiones2)
   4C8B 6F            [ 4]  148 	ld l,a
   4C8C 09            [11]  149 	add hl,bc
   4C8D EB            [ 4]  150 	ex de,hl
   4C8E 26 00         [ 7]  151 	ld h,#0
   4C90 3A 14 4D      [13]  152 	ld a,(#coordenadas1)
   4C93 6F            [ 4]  153 	ld l,a
   4C94 B7            [ 4]  154 	or a
   4C95 ED 52         [15]  155 	sbc hl,de
   4C97 FA 9D 4C      [10]  156 	jp m,#positivo1   ; Salta si HL < DE
   4C9A C3 A2 4C      [10]  157 	jp comparacion2
   4C9D                     158 positivo1:
   4C9D 3E 01         [ 7]  159 	ld a,#1
   4C9F 32 1C 4D      [13]  160 	ld (#resultado1),a
                            161 ; x1 + w1 > x2
   4CA2                     162 comparacion2:
   4CA2 16 00         [ 7]  163 	ld d,#0
   4CA4 3A 16 4D      [13]  164 	ld a,(#dimensiones1)
   4CA7 5F            [ 4]  165 	ld e,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   4CA8 19            [11]  166 	add hl,de
   4CA9 EB            [ 4]  167 	ex de,hl
   4CAA 26 00         [ 7]  168 	ld h,#0
   4CAC 3A 18 4D      [13]  169 	ld a,(#coordenadas2)
   4CAF 6F            [ 4]  170 	ld l,a
   4CB0 B7            [ 4]  171 	or a
   4CB1 ED 52         [15]  172 	sbc hl,de
   4CB3 F2 B9 4C      [10]  173 	jp p,#positivo2   ; Salta si DE > HL
   4CB6 C3 BE 4C      [10]  174 	jp comparacion3
   4CB9                     175 positivo2:
   4CB9 3E 01         [ 7]  176 	ld a,#1
   4CBB 32 1D 4D      [13]  177 	ld (#resultado2),a
                            178 ; y1 < y2 + h2
   4CBE                     179 comparacion3:
   4CBE 06 00         [ 7]  180 	ld b,#0
   4CC0 3A 19 4D      [13]  181 	ld a,(#coordenadas2+1)
   4CC3 4F            [ 4]  182 	ld c,a
   4CC4 26 00         [ 7]  183 	ld h,#0
   4CC6 3A 1B 4D      [13]  184 	ld a,(#dimensiones2+1)
   4CC9 6F            [ 4]  185 	ld l,a
   4CCA 09            [11]  186 	add hl,bc
   4CCB EB            [ 4]  187 	ex de,hl
   4CCC 26 00         [ 7]  188 	ld h,#0
   4CCE 3A 15 4D      [13]  189 	ld a,(#coordenadas1+1)
   4CD1 6F            [ 4]  190 	ld l,a
   4CD2 B7            [ 4]  191 	or a
   4CD3 ED 52         [15]  192 	sbc hl,de
   4CD5 FA DB 4C      [10]  193 	jp m,#positivo3   ; Salta si HL < DE
   4CD8 C3 E0 4C      [10]  194 	jp comparacion4
   4CDB                     195 positivo3:
   4CDB 3E 01         [ 7]  196 	ld a,#1
   4CDD 32 1F 4D      [13]  197 	ld (#resultado4),a
                            198 ; h1 + y1 > y2
   4CE0                     199 comparacion4:
   4CE0 16 00         [ 7]  200 	ld d,#0
   4CE2 3A 17 4D      [13]  201 	ld a,(#dimensiones1+1)
   4CE5 5F            [ 4]  202 	ld e,a
   4CE6 19            [11]  203 	add hl,de
   4CE7 EB            [ 4]  204 	ex de,hl
   4CE8 26 00         [ 7]  205 	ld h,#0
   4CEA 3A 19 4D      [13]  206 	ld a,(#coordenadas2+1)
   4CED 6F            [ 4]  207 	ld l,a
   4CEE B7            [ 4]  208 	or a
   4CEF ED 52         [15]  209 	sbc hl,de
   4CF1 F2 F7 4C      [10]  210 	jp p,#positivo4   ; Salta si DE > HL
   4CF4 C3 FC 4C      [10]  211 	jp colision
   4CF7                     212 positivo4:
   4CF7 3E 01         [ 7]  213 	ld a,#1
   4CF9 32 1F 4D      [13]  214 	ld (#resultado4),a
   4CFC                     215 colision:
   4CFC 06 04         [ 7]  216 	ld b,#4
   4CFE 11 1C 4D      [10]  217 	ld de,#resultado1
   4D01                     218 bucle:
   4D01 1A            [ 7]  219 	ld a,(de)
   4D02 B7            [ 4]  220 	or a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   4D03 CA 0F 4D      [10]  221 	jp z, #nocol
   4D06 10 F9         [13]  222 	djnz #bucle
   4D08 26 00         [ 7]  223 	ld h,#0
   4D0A 2E 01         [ 7]  224 	ld l,#1
   4D0C C3 13 4D      [10]  225 	jp salida
   4D0F                     226 nocol:
   4D0F 26 00         [ 7]  227 	ld h,#0
   4D11 2E 00         [ 7]  228 	ld l,#0
   4D13                     229 salida:
   4D13 C9            [10]  230 	ret
   4D14 00 00               231 	coordenadas1: .dw #0
   4D16 00 00               232 	dimensiones1: .dw #0
   4D18 00 00               233 	coordenadas2: .dw #0
   4D1A 00 00               234 	dimensiones2: .dw #0
   4D1C 00                  235 	resultado1: .db #0
   4D1D 00                  236 	resultado2: .db #0
   4D1E 00                  237 	resultado3: .db #0
   4D1F 00                  238 	resultado4: .db #0
