ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl _cpc_memset
                              2 
   49BB                       3 _cpc_memset::
                              4 
                              5 ;; guardo la dirección de la pila
                              6 ;;	LD DE, SP  
                              7 ;; Recover parameters from stack
                              8 ;;   ld   hl, #2       ;; [10] Make HL point to the byte where parameters start in the
                              9 ;;   add  hl, sp       ;; [11] ... stack (first 2 bytes are return address)
                             10 ;;  ld    e, (hl)     ;; [ 7] DE = Pointer to first byte in memory for memset
                             11 ;;   inc  hl           ;; [ 6]
                             12 ;;   ld    d, (hl)     ;; [ 7] 
                             13 ;;   inc  hl           ;; [ 6]         
                             14 ;;   ld 	hl, #0
                             15 ;;  	LD BC, 0x1800   ; Size of screen
                             16 ;;  	LD SP, 0x4000   ; Start of screen
                             17 ;;  	LOOP:
                             18 ;;  	PUSH HL
                             19 ;;  	DEC BC
                             20 ;;  	JNZ LOOP
                             21 ;;  	LD SP, DE
   49BB C9            [10]   22   	ret
                             23 
                             24 .globl _set_stack
                             25 
   49BC                      26 _set_stack::
   49BC C1            [10]   27 	pop bc
   49BD E1            [10]   28 	pop hl
   49BE F9            [ 6]   29 	ld sp, hl
   49BF E5            [11]   30 	push hl
   49C0 C5            [11]   31 	push bc
   49C1 C9            [10]   32 	ret
