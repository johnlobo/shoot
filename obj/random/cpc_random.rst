ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   449A                       1 _cpc_Random::
   449A 3A A8 44      [13]    2 	LD A,(#valor_previo)
   449D 6F            [ 4]    3 	LD L,A
   449E ED 5F         [ 9]    4 	LD A,R
   44A0 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   44A1 32 A8 44      [13]    6 	LD (#valor_previo),A
   44A4 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   44A5 26 00         [ 7]    8 	LD H,#0
   44A7 C9            [10]    9 	RET
   44A8                      10 valor_previo:
   44A8 FF                   11 	.db #0xFF
