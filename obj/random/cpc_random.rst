ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   2CE6                       1 _cpc_Random::
   2CE6 3A F4 2C      [13]    2 	LD A,(#valor_previo)
   2CE9 6F            [ 4]    3 	LD L,A
   2CEA ED 5F         [ 9]    4 	LD A,R
   2CEC 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   2CED 32 F4 2C      [13]    6 	LD (#valor_previo),A
   2CF0 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   2CF1 26 00         [ 7]    8 	LD H,#0
   2CF3 C9            [10]    9 	RET
   2CF4                      10 valor_previo:
   2CF4 FF                   11 	.db #0xFF
