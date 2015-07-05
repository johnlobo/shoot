ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   386F                       1 _cpc_Random::
   386F 3A 7D 38      [13]    2 	LD A,(#valor_previo)
   3872 6F            [ 4]    3 	LD L,A
   3873 ED 5F         [ 9]    4 	LD A,R
   3875 85            [ 4]    5 	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
   3876 32 7D 38      [13]    6 	LD (#valor_previo),A
   3879 6F            [ 4]    7 	LD L,A ;SE DEVUELVE L (CHAR)
   387A 26 00         [ 7]    8 	LD H,#0
   387C C9            [10]    9 	RET
   387D                      10 valor_previo:
   387D FF                   11 	.db #0xFF
