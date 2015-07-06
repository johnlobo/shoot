ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   3B3B                       1 _cpc_Random::
   3B3B 3A 49 3B      [13]    2 	LD A,(#valor_previo)
   3B3E 6F            [ 4]    3 	LD L,A
   3B3F ED 5F         [ 9]    4 	LD A,R
   3B41 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   3B42 32 49 3B      [13]    6 	LD (#valor_previo),A
   3B45 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   3B46 26 00         [ 7]    8 	LD H,#0
   3B48 C9            [10]    9 	RET
   3B49                      10 valor_previo:
   3B49 FF                   11 	.db #0xFF
