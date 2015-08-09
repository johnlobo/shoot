ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;******************************
                              2 ; 	void set_stack(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2){
                              3 ; 	Descripción:	Reubica la pila 
                              4 ;	Entrada:	Dirección en la que se reubica la pila
                              5 ;	Salida:		Ninguna
                              6 ;	Modificados: 
                              7 ;
                              8 ; @JohnLobo Nov15  
                              9 ;******************************
                             10 .globl _set_stack
   4ADE                      11 _set_stack::
   4ADE C1            [10]   12 	pop bc
   4ADF E1            [10]   13 	pop hl
   4AE0 F9            [ 6]   14 	ld sp, hl
   4AE1 E5            [11]   15 	push hl
   4AE2 C5            [11]   16 	push bc
   4AE3 C9            [10]   17 	ret
                             18 
                             19 ;******************************
                             20 ; 	unsigned char fastCollision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2){
                             21 ; 	Descripción:	Devuelve 1 si se ha producido una colisión y 0 en caso contrario
                             22 ;	Entrada:	- Coordenada x objeto 1
                             23 ;				- Coordenada y objeto 1
                             24 ;				- Ancho objeto 1
                             25 ;				- Alto objeto 1
                             26 ;				- Coordenada x objeto 1
                             27 ;				- Coordenada y objeto 1
                             28 ;				- Ancho objeto 1
                             29 ;				- Alto objeto 1
                             30 ;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
                             31 ;	Modificados: 
                             32 ;
                             33 ; @JohnLobo Nov15  
                             34 ;******************************
                             35 .globl _fast_collision
   4AE4                      36 _fast_collision::	
                             37 
   4AE4 DD E5         [15]   38 	push ix
                             39 
                             40 ;	ld ix,#2
   4AE6 DD 21 04 00   [14]   41 	ld ix,#4
   4AEA DD 39         [15]   42 	add ix,sp
                             43 	
   4AEC DD 7E 00      [19]   44 	ld a,0 (ix)				;recupero la coordenada x1
   4AEF 67            [ 4]   45 	ld h,a
   4AF0 DD 7E 02      [19]   46 	ld a,2 (ix)				;recupero el ancho 1
   4AF3 84            [ 4]   47 	add a,h
   4AF4 6F            [ 4]   48 	ld l,a
   4AF5 DD 7E 04      [19]   49 	ld a,4 (ix)				;recupero la coordenada x2
   4AF8 47            [ 4]   50 	ld b,a
   4AF9 DD 7E 06      [19]   51 	ld a,6 (ix)				;recupero el ancho 2
   4AFC 80            [ 4]   52 	add a,b
   4AFD 4F            [ 4]   53 	ld c,a
   4AFE CD 28 4B      [17]   54 	call #solseg
   4B01 30 1E         [12]   55 	jr nc, no_choca
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   4B03 DD 7E 01      [19]   56 	ld a,1 (ix)				;recupero la coordenada y1
   4B06 67            [ 4]   57 	ld h,a
   4B07 DD 7E 03      [19]   58 	ld a,3 (ix)				;recupero el alto 1
   4B0A 84            [ 4]   59 	add a,h
   4B0B 6F            [ 4]   60 	ld l,a
   4B0C DD 7E 05      [19]   61 	ld a,5 (ix)				;recupero la coordenada y2
   4B0F 47            [ 4]   62 	ld b,a
   4B10 DD 7E 07      [19]   63 	ld a,7 (ix)				;recupero el alto 2
   4B13 80            [ 4]   64 	add a,b
   4B14 4F            [ 4]   65 	ld c,a
   4B15 CD 28 4B      [17]   66 	call #solseg
   4B18 30 07         [12]   67 	jr nc, no_choca
   4B1A 26 00         [ 7]   68 	ld h,#0
   4B1C 2E 01         [ 7]   69 	ld l,#1
                             70 
   4B1E DD E1         [14]   71 	pop ix
                             72 
   4B20 C9            [10]   73 	ret
   4B21                      74 no_choca:
   4B21 26 00         [ 7]   75 	ld h,#0
   4B23 2E 00         [ 7]   76 	ld l,#0
                             77 
   4B25 DD E1         [14]   78 	pop ix
                             79 
   4B27 C9            [10]   80 	ret
                             81 
   4B28                      82 solseg:
   4B28 79            [ 4]   83 	ld a,c					;solapamaiento
   4B29 BC            [ 4]   84 	cp h
   4B2A 38 02         [12]   85 	jr c, #solseg1			;no hay colisión continua
   4B2C 7D            [ 4]   86 	ld a,l
   4B2D B8            [ 4]   87 	cp b
   4B2E                      88 solseg1:
   4B2E 3F            [ 4]   89 	ccf						;complemento carry
   4B2F C9            [10]   90 	ret
