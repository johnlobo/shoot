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
   51D5                      11 _set_stack::
   51D5 C1            [10]   12 	pop bc
   51D6 E1            [10]   13 	pop hl
   51D7 F9            [ 6]   14 	ld sp, hl
   51D8 E5            [11]   15 	push hl
   51D9 C5            [11]   16 	push bc
   51DA C9            [10]   17 	ret
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
   51DB                      36 _fast_collision::	
                             37 
   51DB DD E5         [15]   38 	push ix
                             39 
                             40 ;	ld ix,#2
   51DD DD 21 04 00   [14]   41 	ld ix,#4
   51E1 DD 39         [15]   42 	add ix,sp
                             43 	
   51E3 DD 7E 00      [19]   44 	ld a,0 (ix)				;recupero la coordenada x1
   51E6 67            [ 4]   45 	ld h,a
   51E7 DD 7E 02      [19]   46 	ld a,2 (ix)				;recupero el ancho 1
   51EA 84            [ 4]   47 	add a,h
   51EB 6F            [ 4]   48 	ld l,a
   51EC DD 7E 04      [19]   49 	ld a,4 (ix)				;recupero la coordenada x2
   51EF 47            [ 4]   50 	ld b,a
   51F0 DD 7E 06      [19]   51 	ld a,6 (ix)				;recupero el ancho 2
   51F3 80            [ 4]   52 	add a,b
   51F4 4F            [ 4]   53 	ld c,a
   51F5 CD 1F 52      [17]   54 	call #solseg
   51F8 30 1E         [12]   55 	jr nc, no_choca
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   51FA DD 7E 01      [19]   56 	ld a,1 (ix)				;recupero la coordenada y1
   51FD 67            [ 4]   57 	ld h,a
   51FE DD 7E 03      [19]   58 	ld a,3 (ix)				;recupero el alto 1
   5201 84            [ 4]   59 	add a,h
   5202 6F            [ 4]   60 	ld l,a
   5203 DD 7E 05      [19]   61 	ld a,5 (ix)				;recupero la coordenada y2
   5206 47            [ 4]   62 	ld b,a
   5207 DD 7E 07      [19]   63 	ld a,7 (ix)				;recupero el alto 2
   520A 80            [ 4]   64 	add a,b
   520B 4F            [ 4]   65 	ld c,a
   520C CD 1F 52      [17]   66 	call #solseg
   520F 30 07         [12]   67 	jr nc, no_choca
   5211 26 00         [ 7]   68 	ld h,#0
   5213 2E 01         [ 7]   69 	ld l,#1
                             70 
   5215 DD E1         [14]   71 	pop ix
                             72 
   5217 C9            [10]   73 	ret
   5218                      74 no_choca:
   5218 26 00         [ 7]   75 	ld h,#0
   521A 2E 00         [ 7]   76 	ld l,#0
                             77 
   521C DD E1         [14]   78 	pop ix
                             79 
   521E C9            [10]   80 	ret
                             81 
   521F                      82 solseg:
   521F 79            [ 4]   83 	ld a,c					;solapamaiento
   5220 BC            [ 4]   84 	cp h
   5221 38 02         [12]   85 	jr c, #solseg1			;no hay colisión continua
   5223 7D            [ 4]   86 	ld a,l
   5224 B8            [ 4]   87 	cp b
   5225                      88 solseg1:
   5225 3F            [ 4]   89 	ccf						;complemento carry
   5226 C9            [10]   90 	ret
