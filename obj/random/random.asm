;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
; This file was generated Wed Jul  1 00:32:43 2015
;--------------------------------------------------------
	.module random
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpc_random
	.globl _getRandomUniform
	.globl _g_nextRand
	.globl _g_randUnif
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_nextRand::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/random/random.c:55: u8 getRandomUniform(u8 inc) {
;	---------------------------------
; Function getRandomUniform
; ---------------------------------
_getRandomUniform::
;src/random/random.c:56: g_nextRand += inc;               // Move to next random value to get
	ld	hl,#2
	add	hl,sp
	push	de
	ld	iy,#_g_nextRand
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	pop	de
;src/random/random.c:57: return g_randUnif[g_nextRand];   // Return the random value
	ld	de,#_g_randUnif+0
	ld	hl,(_g_nextRand)
	ld	h,#0x00
	add	hl,de
	ld	l,(hl)
	ret
_g_randUnif:
	.db #0xFD	; 253
	.db #0x45	; 69	'E'
	.db #0x9E	; 158
	.db #0x70	; 112	'p'
	.db #0xE1	; 225
	.db #0x52	; 82	'R'
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x69	; 105	'i'
	.db #0x2A	; 42
	.db #0x6C	; 108	'l'
	.db #0xB0	; 176
	.db #0xDB	; 219
	.db #0xC7	; 199
	.db #0x5E	; 94
	.db #0x18	; 24
	.db #0xFF	; 255
	.db #0xD7	; 215
	.db #0xF1	; 241
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0xAF	; 175
	.db #0x20	; 32
	.db #0xF8	; 248
	.db #0xC0	; 192
	.db #0x73	; 115	's'
	.db #0x5B	; 91
	.db #0x2C	; 44
	.db #0xD5	; 213
	.db #0x50	; 80	'P'
	.db #0x82	; 130
	.db #0x3F	; 63
	.db #0x46	; 70	'F'
	.db #0xD9	; 217
	.db #0x5D	; 93
	.db #0xCD	; 205
	.db #0x60	; 96
	.db #0x66	; 102	'f'
	.db #0x0D	; 13
	.db #0xF3	; 243
	.db #0x6D	; 109	'm'
	.db #0x86	; 134
	.db #0x9F	; 159
	.db #0xD2	; 210
	.db #0x42	; 66	'B'
	.db #0xE7	; 231
	.db #0xB8	; 184
	.db #0x80	; 128
	.db #0x51	; 81	'Q'
	.db #0x38	; 56	'8'
	.db #0xAA	; 170
	.db #0xB6	; 182
	.db #0xDD	; 221
	.db #0x63	; 99	'c'
	.db #0x4E	; 78	'N'
	.db #0x7A	; 122	'z'
	.db #0x93	; 147
	.db #0x75	; 117	'u'
	.db #0x94	; 148
	.db #0x17	; 23
	.db #0x76	; 118	'v'
	.db #0xFA	; 250
	.db #0xDC	; 220
	.db #0x5A	; 90	'Z'
	.db #0xD8	; 216
	.db #0x22	; 34
	.db #0xBC	; 188
	.db #0x6F	; 111	'o'
	.db #0xCF	; 207
	.db #0x2B	; 43
	.db #0xD0	; 208
	.db #0xB5	; 181
	.db #0x1A	; 26
	.db #0xBE	; 190
	.db #0x77	; 119	'w'
	.db #0x8B	; 139
	.db #0xDA	; 218
	.db #0x04	; 4
	.db #0x96	; 150
	.db #0xA4	; 164
	.db #0x92	; 146
	.db #0xBA	; 186
	.db #0x4D	; 77	'M'
	.db #0xA2	; 162
	.db #0x47	; 71	'G'
	.db #0x2E	; 46
	.db #0xA8	; 168
	.db #0x54	; 84	'T'
	.db #0x7B	; 123
	.db #0xEE	; 238
	.db #0x53	; 83	'S'
	.db #0xEF	; 239
	.db #0xAB	; 171
	.db #0x43	; 67	'C'
	.db #0x8E	; 142
	.db #0x3A	; 58
	.db #0x88	; 136
	.db #0x29	; 41
	.db #0xE2	; 226
	.db #0x3D	; 61
	.db #0xD4	; 212
	.db #0xBB	; 187
	.db #0xFB	; 251
	.db #0x74	; 116	't'
	.db #0x21	; 33
	.db #0x56	; 86	'V'
	.db #0x06	; 6
	.db #0x8A	; 138
	.db #0xAE	; 174
	.db #0x8F	; 143
	.db #0x62	; 98	'b'
	.db #0x61	; 97	'a'
	.db #0x6E	; 110	'n'
	.db #0x4C	; 76	'L'
	.db #0x1D	; 29
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0x89	; 137
	.db #0x91	; 145
	.db #0x0C	; 12
	.db #0x9A	; 154
	.db #0x95	; 149
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x7C	; 124
	.db #0x07	; 7
	.db #0x3B	; 59
	.db #0xEB	; 235
	.db #0x71	; 113	'q'
	.db #0x13	; 19
	.db #0xF2	; 242
	.db #0x4F	; 79	'O'
	.db #0x0A	; 10
	.db #0x3C	; 60
	.db #0xF0	; 240
	.db #0x65	; 101	'e'
	.db #0x03	; 3
	.db #0x64	; 100	'd'
	.db #0x6A	; 106	'j'
	.db #0x02	; 2
	.db #0xFC	; 252
	.db #0xC5	; 197
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x5C	; 92
	.db #0x98	; 152
	.db #0x97	; 151
	.db #0x2F	; 47
	.db #0x84	; 132
	.db #0xF9	; 249
	.db #0x33	; 51	'3'
	.db #0x16	; 22
	.db #0x72	; 114	'r'
	.db #0xBF	; 191
	.db #0x1B	; 27
	.db #0xF6	; 246
	.db #0xC9	; 201
	.db #0x7D	; 125
	.db #0x37	; 55	'7'
	.db #0x90	; 144
	.db #0x58	; 88	'X'
	.db #0x27	; 39
	.db #0x14	; 20
	.db #0x9D	; 157
	.db #0x35	; 53	'5'
	.db #0xA5	; 165
	.db #0xC2	; 194
	.db #0xC3	; 195
	.db #0xE8	; 232
	.db #0xE9	; 233
	.db #0x11	; 17
	.db #0x31	; 49	'1'
	.db #0xB7	; 183
	.db #0x67	; 103	'g'
	.db #0xCB	; 203
	.db #0xAC	; 172
	.db #0x7F	; 127
	.db #0x2D	; 45
	.db #0x7E	; 126
	.db #0x44	; 68	'D'
	.db #0xA6	; 166
	.db #0xED	; 237
	.db #0xA7	; 167
	.db #0xC6	; 198
	.db #0x0B	; 11
	.db #0xE6	; 230
	.db #0xAD	; 173
	.db #0x22	; 34
	.db #0xF4	; 244
	.db #0xF5	; 245
	.db #0xC4	; 196
	.db #0xC8	; 200
	.db #0x5F	; 95
	.db #0xCE	; 206
	.db #0xE0	; 224
	.db #0x49	; 73	'I'
	.db #0xE3	; 227
	.db #0xEC	; 236
	.db #0x39	; 57	'9'
	.db #0xD3	; 211
	.db #0x19	; 25
	.db #0x79	; 121	'y'
	.db #0x26	; 38
	.db #0xA1	; 161
	.db #0xCA	; 202
	.db #0x83	; 131
	.db #0xBD	; 189
	.db #0x30	; 48	'0'
	.db #0x99	; 153
	.db #0x85	; 133
	.db #0xCC	; 204
	.db #0x81	; 129
	.db #0x05	; 5
	.db #0x1F	; 31
	.db #0x9C	; 156
	.db #0x41	; 65	'A'
	.db #0x32	; 50	'2'
	.db #0x36	; 54	'6'
	.db #0xF7	; 247
	.db #0x4A	; 74	'J'
	.db #0xA0	; 160
	.db #0x6B	; 107	'k'
	.db #0xDF	; 223
	.db #0x8C	; 140
	.db #0xB3	; 179
	.db #0xDE	; 222
	.db #0xFE	; 254
	.db #0xB2	; 178
	.db #0x09	; 9
	.db #0xB4	; 180
	.db #0xA3	; 163
	.db #0x28	; 40
	.db #0xD6	; 214
	.db #0xE5	; 229
	.db #0x0F	; 15
	.db #0xC1	; 193
	.db #0xE4	; 228
	.db #0x1C	; 28
	.db #0x34	; 52	'4'
	.db #0xB1	; 177
	.db #0x57	; 87	'W'
	.db #0x25	; 37
	.db #0x59	; 89	'Y'
	.db #0xB9	; 185
	.db #0x9B	; 155
	.db #0x0E	; 14
	.db #0xD1	; 209
	.db #0x10	; 16
	.db #0xA9	; 169
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x8D	; 141
	.db #0x55	; 85	'U'
	.db #0x3E	; 62
	.db #0x1E	; 30
	.db #0x4B	; 75	'K'
;src/random/random.c:60: void cpc_random(u8* random_number) {
;	---------------------------------
; Function cpc_random
; ---------------------------------
_cpc_random::
;src/random/random.c:74: __endasm;
	LD A,(#valor_previo)
	LD L,A
	LD A,R
	ADD L
	LD (#valor_previo),A
	LD L,A ;SE DEVUELVE L (CHAR)
	LD H,#0
	RET
	 valor_previo:
	.db #0xFF
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
