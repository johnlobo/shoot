ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   3669                       1 _cpc_Random::
   3669 3A 77 36      [13]    2 	LD A,(#valor_previo)
   366C 6F            [ 4]    3 	LD L,A
   366D ED 5F         [ 9]    4 	LD A,R
   366F 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   3670 32 77 36      [13]    6 	LD (#valor_previo),A
   3673 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   3674 26 00         [ 7]    8 	LD H,#0
   3676 C9            [10]    9 	RET
   3677                      10 valor_previo:
   3677 FF                   11 	.db #0xFF
