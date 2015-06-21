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