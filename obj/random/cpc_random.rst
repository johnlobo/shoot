ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   3B49                       1 _cpc_Random::
   3B49 3A 57 3B      [13]    2 	LD A,(#valor_previo)
   3B4C 6F            [ 4]    3 	LD L,A
   3B4D ED 5F         [ 9]    4 	LD A,R
   3B4F 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   3B50 32 57 3B      [13]    6 	LD (#valor_previo),A
   3B53 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   3B54 26 00         [ 7]    8 	LD H,#0
   3B56 C9            [10]    9 	RET
   3B57                      10 valor_previo:
   3B57 FF                   11 	.db #0xFF
