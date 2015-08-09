; ******************************************************
; **       Librería de rutinas SDCC para Amstrad CPC  **
; **       Raúl Simarro (Artaburu)    -   2009, 2012  **
; ******************************************************

;*************************************
; GRAPHIC TEXT
;*************************************

.globl _cpc_PrintGphStr2X

_cpc_PrintGphStr2X::
;preparación datos impresión. El ancho y alto son fijos!
;	LD IX,#2
;	ADD IX,SP
;	LD L,2 (IX)
;	LD H,3 (IX)	;DESTINO
;  	LD E,0 (IX)
;	LD D,1 (IX)	;TEXTO ORIGEN

	POP AF
	POP DE
	POP HL
	PUSH HL
	PUSH DE
	PUSH AF

	LD A,#1
 	JP cpc_PrintGphStr0


.globl _cpc_PrintGphStr

_cpc_PrintGphStr::
;preparación datos impresión. El ancho y alto son fijos!
;	LD IX,#2
;	ADD IX,SP
;	LD L,2 (IX)
;	LD H,3 (IX)	;DESTINO
;	;LD (CPC_PRINTGPHSTR0+DIRECC_DESTINO0),HL
;  	LD E,0 (IX)
;	LD D,1 (IX)	;TEXTO ORIGEN

	POP AF 
	POP DE
	POP	HL
	PUSH HL
	PUSH DE
	PUSH AF

cpc_PrintGphStr0:

	;DE destino
	;HL origen
	;ex de,hl
	LD (#doble),A
	;trabajo previo: Para tener una lista de trabajos de impresión. No se interrumpe
	;la impresión en curso.
	LD A,(#imprimiendo)
	CP #1
	JP Z,add_elemento
	LD (#direcc_destino),HL
	EX DE,HL
	CALL bucle_texto0

;antes de terminar, se mira si hay algo en cola.
bucle_cola_impresion:
	LD A,(#elementos_cola)
	OR A
	JP Z,terminar_impresion
	CALL leer_elemento
	JP bucle_cola_impresion


terminar_impresion:
	XOR A
	LD (#imprimiendo),A
	RET
entrar_cola_impresion:
;si se está imprimiendo se mete el valor en la cola
	RET
add_elemento:
	DI
	LD IX,(#pos_cola)
	LD 0 (IX),L
	LD 1 (IX),H
	LD 2 (IX),E
	LD 3 (IX),D
	INC IX
	INC IX
	INC IX
	INC IX
	LD (#pos_cola),IX

	LD HL,#elementos_cola
	INC (HL)
	;Se añaden los valores hl y de
	EI
	RET
leer_elemento:
	DI
	LD IX,(#pos_cola)
	LD L,0 (IX)
	LD H,1 (IX)
	LD E,2 (IX)
	LD D,4 (IX)
	DEC IX
	DEC IX
	DEC IX
	DEC IX
	LD (#pos_cola),IX
	LD HL,#elementos_cola
	DEC (HL)
	EI
	RET

elementos_cola:
	.DW #0				; defw 0
pos_cola:
	.DW #cola_impresion ;defw cola_impresion
						;pos_escritura_cola defw cola_impresion
cola_impresion:  		; defs 12
	.DB #0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0
bucle_texto0:
	LD A,#1
	LD (imprimiendo),A

	LD A,(first_char)
	LD B,A		;resto 48 para saber el número del caracter (En ASCII 0=48)

	LD A,(HL)
	OR A ;CP 0
	RET Z
	SUB B
	LD BC,#cpc_Chars	;apunto a la primera letra
	PUSH HL

	LD L,A		;en A tengo la letra que sería
	LD H,#0
	ADD HL,HL
	ADD HL,HL
	ADD HL,HL	;x8 porque cada letra son 8 bytes
	ADD HL,BC	;ahora HL apunta a los datos de la letra correspondiente
	CALL escribe_letra
	LD A,(doble)
	CP #1
; ANTES DE IMPRIMIR SE CHEQUEA SI ES DE ALTURA EL DOBLE Y SE ACTÚA EN CONSECUENCIA
	CALL Z, doblar_letra
	LD HL,(#direcc_destino)
	LD A,(doble)
	CP #1
	;alto
	JR Z,cont_doble
	LD DE,#letra_decodificada
	.DB #0xfD
	LD H,#8		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
	JR cont_tot


cont_doble:
	LD DE,#letra_decodificada_tmp
	.DB #0xfD
	LD H,#16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE

cont_tot:
	CALL cpc_PutSp0
	LD HL,(#direcc_destino)
	INC HL
	INC HL
	LD (#direcc_destino),HL
	POP HL
	INC HL
	JP bucle_texto0


doble:
	.DB #0
imprimiendo:
	.DB #0
direcc_destino:
	.DW #0


cpc_PutSp0:
;	.DB #0xfD
;  		LD H,16		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
	LD B,#7
	LD C,B
loop_alto_2:

loop_ancho_2:
	EX DE,HL
	LDI
	LDI
	.DB #0XFD
	DEC H
	RET Z
	EX DE,HL
salto_linea:
	LD C,#0XFE			;&07F6 			;SALTO LINEA MENOS ANCHO
	ADD HL,BC
	JP NC,loop_alto_2 ;SIG_LINEA_2ZZ		;SI NO DESBORDA VA A LA SIGUIENTE LINEA
	LD BC,#0XC050
	ADD HL,BC
	LD B,#7			;SÓLO SE DARÍA UNA DE CADA 8 VECES EN UN SPRITE
	JP loop_alto_2




doblar_letra:
	LD HL,#letra_decodificada
	LD DE,#letra_decodificada_tmp
	LD B,#8
buc_doblar_letra:
	LD A,(HL)
	INC HL
	LD (DE),A
	INC DE
	INC DE
	LD (DE),A
	DEC DE
	LD A,(HL)
	INC HL
	LD (DE),A
	INC DE
	INC DE
	LD (DE),A
	INC DE
	DJNZ buc_doblar_letra
	RET


escribe_letra:		; Code by Kevin Thacker
	PUSH DE
	LD IY,#letra_decodificada
	LD B,#8
bucle_alto_letra:
	PUSH BC
	PUSH HL
	LD E,(HL)
	CALL op_colores
	LD (IY),D
	INC IY
	CALL op_colores
	LD (IY),D
	INC IY
	POP HL
	INC HL
	POP BC
	DJNZ bucle_alto_letra
	POP DE
	RET

op_colores:
	ld d,#0					;; initial byte at end will be result of 2 pixels combined
	CALL op_colores_pixel	;; do pixel 0
	RLC D
	CALL op_colores_pixel
	RRC D
	RET

;; follow through to do pixel 1

op_colores_pixel:
	;; shift out pixel into bits 0 and 1 (source)
	RLC E
	RLC E
	;; isolate
	LD A,E
	AND #0X3
	LD HL,#colores_b0
	ADD A,L
	LD L,A
	LD A,H
	ADC A,#0
	LD H,A
	;; READ IT AND COMBINE WITH PIXEL SO FAR
	LD A,D
	OR (HL)
	LD D,A
	RET


.globl _cpc_SetInkGphStr

;_cpc_SetInkGphStr::
;	LD IX,#2
;	ADD IX,SP
;
;	LD A,1 (IX) ;VALOR
;	LD C,0 (IX)	;COLOR
;
;	LD HL,#colores_b0
;	LD B,#0
;	ADD HL,BC
;	LD (HL),A
;	RET

 _cpc_SetInkGphStr::
 	LD HL,#2
 	LD B,H
 	ADD HL,SP

 	LD C, (HL)
 	INC HL
 	LD A,(HL)

 	LD HL,#colores_b0
 	ADD HL,BC
 	LD (HL),A
 	RET

colores_cambM1:
colores_m1:
	.DB #0b00000000,#0b10001000,#0b10000000,#0b00001000

;defb @00000000,  @01010100, @00010000, @00000101  ;@00000001, @00000101, @00010101, @00000000



;DEFC direcc_destino0_m1 = direcc_destino
;DEFC colores_cambM1 = colores_m1


dato:
	.DB #0b00011011  ;aquí dejo temporalmente el byte a tratar

byte_tmp:
	.DB #0
	.DB #0
	.DB #0  ;defs 3
colores_b0: ;defino los 4 colores posibles para el byte. Los colores pueden ser cualesquiera.
	  		;Pero se tienen que poner bien, en la posición que le corresponda.
	.DB #0b00001010,#0b00100000,#0b10100000,#0b00101000
	;.DB #0b00000000,  #0b01010100, #0b00010000, #0b00000101  ;#0b00000001, #0b00000101, #0b00010101, #0b00000000

letra_decodificada: ;. defs 16 ;16	;uso este espacio para guardar la letra que se decodifica
	.DB #0,#0,#0,#0,#0,#0,#0,#0
	.DB #0,#0,#0,#0,#0,#0,#0,#0
letra_decodificada_tmp: ;defs 32 ;16	;uso este espacio para guardar la letra que se decodifica para tamaño doble altura
	.DB #0,#0,#0,#0,#0,#0,#0,#0
	.DB #0,#0,#0,#0,#0,#0,#0,#0
	.DB #0,#0,#0,#0,#0,#0,#0,#0
	.DB #0,#0,#0,#0,#0,#0,#0,#0


first_char:
	.DB #47	;first defined char number (ASCII)

cpc_Chars:   ;cpc_Chars codificadas... cada pixel se define con 2 bits que definen el color.
	;/
	.DB #0b00000001
	.DB #0b00000001
	.DB #0b00001000
	.DB #0b00001000
	.DB #0b00111100
	.DB #0b00110000
	.DB #0b00110000
	.DB #0b00000000
;0-9
.db #0b01010100
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00010000
.db #0b01010000
.db #0b00100000
.db #0b00100000
.db #0b00100000
.db #0b00110000
.db #0b11111100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b00001000
.db #0b10101000
.db #0b10000000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b00001000
.db #0b00101000
.db #0b00001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b01000100
.db #0b01000100
.db #0b10001000
.db #0b10101000
.db #0b00001000
.db #0b00001100
.db #0b00001100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b10000000
.db #0b10101000
.db #0b00001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b10000000
.db #0b10101000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b00001000
.db #0b00001000
.db #0b00100000
.db #0b00110000
.db #0b00110000
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b10001000
.db #0b10101000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b01010100
.db #0b01000100
.db #0b10001000
.db #0b10101000
.db #0b00001000
.db #0b11001100
.db #0b11111100
.db #0b00000000






	;:
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00100000
	.DB #0b00000000
	.DB #0b00110000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	;SPC (;)
	.DB #0,#0,#0,#0,#0,#0,#0,#0
	;.   (<)
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b11000000
	.DB #0b00000000
	;Ñ    (=)
.db #0b00000000
.db #0b01010100
.db #0b00000000
.db #0b10100000
.db #0b10001000
.db #0b11001100
.db #0b11001100
.db #0b00000000

	; !	(>)
	.DB #0b00000000
	.DB #0b00010000
	.DB #0b00100000
	.DB #0b00100000
	.DB #0b00110000
	.DB #0b00000000
	.DB #0b00110000
	.DB #0b00000000
	;-> (?)
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b10000000
	.DB #0b10100000
	.DB #0b11111100
	.DB #0b11111100
	.DB #0b00000000
	.DB #0b00000000
	;-  (@)
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b10101000
	.DB #0b11111100
	.DB #0b00000000
	.DB #0b00000000
	.DB #0b00000000



;A-Z
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10101000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10101000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10000000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11110000
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10000000
.db #0b10101000
.db #0b10000000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10000000
.db #0b10101000
.db #0b10000000
.db #0b11000000
.db #0b11000000
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10000000
.db #0b10101000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b10101000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b00100000
.db #0b00100000
.db #0b00100000
.db #0b00110000
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10101000
.db #0b00001000
.db #0b00001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10100000
.db #0b10001000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01000000
.db #0b10000000
.db #0b10000000
.db #0b10000000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10101000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01010000
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10101000
.db #0b11000000
.db #0b11000000
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11111100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10001000
.db #0b10001000
.db #0b10100000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b10000000
.db #0b10101000
.db #0b00001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b00100000
.db #0b00100000
.db #0b00100000
.db #0b00110000
.db #0b00110000
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b11111100
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11001100
.db #0b00110000
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b10001000
.db #0b11111100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10100000
.db #0b00100000
.db #0b11001100
.db #0b11001100
.db #0b00000000
.db #0b00000000
.db #0b01000100
.db #0b10001000
.db #0b10001000
.db #0b00100000
.db #0b00110000
.db #0b00110000
.db #0b00000000
.db #0b00000000
.db #0b01010100
.db #0b00001000
.db #0b00100000
.db #0b10000000
.db #0b11001100
.db #0b11111100
.db #0b00000000




	;-
	.DB #0b00000011
	.DB #0b00001111
	.DB #0b00111111
	.DB #0b11111111
	.DB #0b00111111
	.DB #0b00001111
	.DB #0b00000011
	.DB #0b00000000
