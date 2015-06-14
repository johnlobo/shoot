ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   2854                       1 _cpc_Random::
   2854 3A 62 28      [13]    2 	LD A,(#valor_previo)
   2857 6F            [ 4]    3 	LD L,A
   2858 ED 5F         [ 9]    4 	LD A,R
   285A 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   285B 32 62 28      [13]    6 	LD (#valor_previo),A
   285E 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   285F 26 00         [ 7]    8 	LD H,#0
   2861 C9            [10]    9 	RET
   2862                      10 valor_previo:
   2862 FF                   11 	.db #0xFF
