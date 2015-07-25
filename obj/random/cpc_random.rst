ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   46DC                       1 _cpc_Random::
   46DC 3A EA 46      [13]    2 	LD A,(#valor_previo)
   46DF 6F            [ 4]    3 	LD L,A
   46E0 ED 5F         [ 9]    4 	LD A,R
   46E2 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   46E3 32 EA 46      [13]    6 	LD (#valor_previo),A
   46E6 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   46E7 26 00         [ 7]    8 	LD H,#0
   46E9 C9            [10]    9 	RET
   46EA                      10 valor_previo:
   46EA FF                   11 	.db #0xFF
