.globl _cpc_memset
_cpc_memset::

;; guardo la dirección de la pila
;;	LD DE, SP  
;; Recover parameters from stack
;;   ld   hl, #2       ;; [10] Make HL point to the byte where parameters start in the
;;   add  hl, sp       ;; [11] ... stack (first 2 bytes are return address)
;;  ld    e, (hl)     ;; [ 7] DE = Pointer to first byte in memory for memset
;;   inc  hl           ;; [ 6]
;;   ld    d, (hl)     ;; [ 7] 
;;   inc  hl           ;; [ 6]         
;;   ld 	hl, #0
;;  	LD BC, 0x1800   ; Size of screen
;;  	LD SP, 0x4000   ; Start of screen
;;  	LOOP:
;;  	PUSH HL
;;  	DEC BC
;;  	JNZ LOOP
;;  	LD SP, DE
  	ret

.globl _set_stack
_set_stack::
	pop bc
	pop hl
	ld sp, hl
	push hl
	push bc
	ret

;******************************
; 	unsigned char fastCollision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2){
; 	Descripción:	Devuelve 1 si se ha producido una colisión y 0 en caso contrario
;	Entrada:	- Coordenada x objeto 1
;				- Coordenada y objeto 1
;				- Ancho objeto 1
;				- Alto objeto 1
;				- Coordenada x objeto 1
;				- Coordenada y objeto 1
;				- Ancho objeto 1
;				- Alto objeto 1
;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
;	Modificados: 
;
; @JohnLobo Nov15  
;******************************
.globl _fast_collision
_fast_collision::	

	ld ix,#2
	add ix,sp
	
	ld a,0 (ix)				;recupero la coordenada x1
	ld h,a
	ld a,2 (ix)				;recupero el ancho 1
	add a,h
	ld l,a
	ld a,4 (ix)				;recupero la coordenada x2
	ld b,a
	ld a,6 (ix)				;recupero el ancho 2
	add a,b
	ld c,a
	call #solseg
	jr nc, no_choca
	ld a,1 (ix)				;recupero la coordenada y1
	ld h,a
	ld a,3 (ix)				;recupero el alto 1
	add a,h
	ld l,a
	ld a,5 (ix)				;recupero la coordenada y2
	ld b,a
	ld a,7 (ix)				;recupero el alto 2
	add a,b
	ld c,a
	call #solseg
	jr nc, no_choca
	ld h,#0
	ld l,#1
	ret
no_choca:
	ld h,#0
	ld l,#0
	ret

solseg:
	ld a,c					;solapamaiento
	cp h
	jr c, #solseg1			;no hay colisión continua
	ld a,l
	cp b
solseg1:
	ccf						;complemento carry
	ret


;******************************
; 	unsigned char detectColision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned, char y2,unsigned char w2,unsigned char h2){
;	return ((x1 < x2 + w2) &&
;	(x1 + w1 > x2) &&
;	(y1 < y2 + h2) &&
;	(h1 + y1 > y2));
;
; 	Descripción:	Devuelve la dirección de pantalla correspondiente a las coordenadas x,y pasadas 
;					como parámetro
;	Entrada:	- Coordenada x objeto 1
;				- Coordenada y objeto 1
;				- Ancho objeto 1
;				- Alto objeto 1
;				- Coordenada x objeto 1
;				- Coordenada y objeto 1
;				- Ancho objeto 1
;				- Alto objeto 1
;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
;	Modificados: 
;
; @JohnLobo Nov15  
;******************************
.globl _detect_collision
_detect_collision::		
	
	ld ix,#2
	add ix,sp
	
	ld a,0 (ix)				;recupero la coordenada x1
	ld (#coordenadas1),a
	ld a,1 (ix)				;recupero la coordenada y1
	ld (#coordenadas1+1),a
	ld a,2 (ix)				;recupero el ancho 1
	ld (#dimensiones1),a
	ld a,3 (ix)				;recupero el alto 1
	ld (#dimensiones1+1),a
	ld a,4 (ix)				;recupero la coordenada x2
	ld (#coordenadas2),a
	ld a,5 (ix)				;recupero la coordenada y2
	ld (#coordenadas2+1),a
	ld a,6 (ix)				;recupero el ancho 2
	ld (#dimensiones2),a
	ld a,7 (ix)				;recupero el alto 2
	ld (#dimensiones2+1),a

; x1 < x2 + w2
	ld b,#0
	ld a,(#coordenadas2)
	ld c,a
	ld h,#0
	ld a,(#dimensiones2)
	ld l,a
	add hl,bc
	ex de,hl
	ld h,#0
	ld a,(#coordenadas1)
	ld l,a
	or a
	sbc hl,de
	jp m,#positivo1   ; Salta si HL < DE
	jp comparacion2
positivo1:
	ld a,#1
	ld (#resultado1),a
; x1 + w1 > x2
comparacion2:
	ld d,#0
	ld a,(#dimensiones1)
	ld e,a
	add hl,de
	ex de,hl
	ld h,#0
	ld a,(#coordenadas2)
	ld l,a
	or a
	sbc hl,de
	jp p,#positivo2   ; Salta si DE > HL
	jp comparacion3
positivo2:
	ld a,#1
	ld (#resultado2),a
; y1 < y2 + h2
comparacion3:
	ld b,#0
	ld a,(#coordenadas2+1)
	ld c,a
	ld h,#0
	ld a,(#dimensiones2+1)
	ld l,a
	add hl,bc
	ex de,hl
	ld h,#0
	ld a,(#coordenadas1+1)
	ld l,a
	or a
	sbc hl,de
	jp m,#positivo3   ; Salta si HL < DE
	jp comparacion4
positivo3:
	ld a,#1
	ld (#resultado4),a
; h1 + y1 > y2
comparacion4:
	ld d,#0
	ld a,(#dimensiones1+1)
	ld e,a
	add hl,de
	ex de,hl
	ld h,#0
	ld a,(#coordenadas2+1)
	ld l,a
	or a
	sbc hl,de
	jp p,#positivo4   ; Salta si DE > HL
	jp colision
positivo4:
	ld a,#1
	ld (#resultado4),a
colision:
	ld b,#4
	ld de,#resultado1
bucle:
	ld a,(de)
	or a
	jp z, #nocol
	djnz #bucle
	ld h,#0
	ld l,#1
	jp salida
nocol:
	ld h,#0
	ld l,#0
salida:
	ret
	coordenadas1: .dw #0
	dimensiones1: .dw #0
	coordenadas2: .dw #0
	dimensiones2: .dw #0
	resultado1: .db #0
	resultado2: .db #0
	resultado3: .db #0
	resultado4: .db #0