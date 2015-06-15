ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   2864                       1 _cpc_Random::
   2864 3A 72 28      [13]    2 	LD A,(#valor_previo)
   2867 6F            [ 4]    3 	LD L,A
   2868 ED 5F         [ 9]    4 	LD A,R
   286A 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   286B 32 72 28      [13]    6 	LD (#valor_previo),A
   286E 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   286F 26 00         [ 7]    8 	LD H,#0
   2871 C9            [10]    9 	RET
   2872                      10 valor_previo:
   2872 FF                   11 	.db #0xFF
