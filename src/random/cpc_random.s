_cpc_Random::
	LD A,(#valor_previo)
	LD L,A
	LD A,R
	ADD L ;LOS 2 ÚLTIMOS BITS DE A DIRÁN SI ES 0,1,2,3
	LD (#valor_previo),A
	LD L,A ;SE DEVUELVE L (CHAR)
	LD H,#0
	RET
valor_previo:
	.db #0xFF