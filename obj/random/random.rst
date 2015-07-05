                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
                              4 ; This file was generated Wed Jul  1 00:32:43 2015
                              5 ;--------------------------------------------------------
                              6 	.module random
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _cpc_random
                             13 	.globl _getRandomUniform
                             14 	.globl _g_nextRand
                             15 	.globl _g_randUnif
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
   42CD                      23 _g_nextRand::
   42CD                      24 	.ds 1
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/random/random.c:55: u8 getRandomUniform(u8 inc) {
                             50 ;	---------------------------------
                             51 ; Function getRandomUniform
                             52 ; ---------------------------------
   2C15                      53 _getRandomUniform::
                             54 ;src/random/random.c:56: g_nextRand += inc;               // Move to next random value to get
   2C15 21 02 00      [10]   55 	ld	hl,#2
   2C18 39            [11]   56 	add	hl,sp
   2C19 D5            [11]   57 	push	de
   2C1A FD 21 CD 42   [14]   58 	ld	iy,#_g_nextRand
   2C1E FD E5         [15]   59 	push	iy
   2C20 D1            [10]   60 	pop	de
   2C21 1A            [ 7]   61 	ld	a,(de)
   2C22 86            [ 7]   62 	add	a, (hl)
   2C23 12            [ 7]   63 	ld	(de),a
   2C24 D1            [10]   64 	pop	de
                             65 ;src/random/random.c:57: return g_randUnif[g_nextRand];   // Return the random value
   2C25 11 30 2C      [10]   66 	ld	de,#_g_randUnif+0
   2C28 2A CD 42      [16]   67 	ld	hl,(_g_nextRand)
   2C2B 26 00         [ 7]   68 	ld	h,#0x00
   2C2D 19            [11]   69 	add	hl,de
   2C2E 6E            [ 7]   70 	ld	l,(hl)
   2C2F C9            [10]   71 	ret
   2C30                      72 _g_randUnif:
   2C30 FD                   73 	.db #0xFD	; 253
   2C31 45                   74 	.db #0x45	; 69	'E'
   2C32 9E                   75 	.db #0x9E	; 158
   2C33 70                   76 	.db #0x70	; 112	'p'
   2C34 E1                   77 	.db #0xE1	; 225
   2C35 52                   78 	.db #0x52	; 82	'R'
   2C36 24                   79 	.db #0x24	; 36
   2C37 23                   80 	.db #0x23	; 35
   2C38 69                   81 	.db #0x69	; 105	'i'
   2C39 2A                   82 	.db #0x2A	; 42
   2C3A 6C                   83 	.db #0x6C	; 108	'l'
   2C3B B0                   84 	.db #0xB0	; 176
   2C3C DB                   85 	.db #0xDB	; 219
   2C3D C7                   86 	.db #0xC7	; 199
   2C3E 5E                   87 	.db #0x5E	; 94
   2C3F 18                   88 	.db #0x18	; 24
   2C40 FF                   89 	.db #0xFF	; 255
   2C41 D7                   90 	.db #0xD7	; 215
   2C42 F1                   91 	.db #0xF1	; 241
   2C43 48                   92 	.db #0x48	; 72	'H'
   2C44 08                   93 	.db #0x08	; 8
   2C45 AF                   94 	.db #0xAF	; 175
   2C46 20                   95 	.db #0x20	; 32
   2C47 F8                   96 	.db #0xF8	; 248
   2C48 C0                   97 	.db #0xC0	; 192
   2C49 73                   98 	.db #0x73	; 115	's'
   2C4A 5B                   99 	.db #0x5B	; 91
   2C4B 2C                  100 	.db #0x2C	; 44
   2C4C D5                  101 	.db #0xD5	; 213
   2C4D 50                  102 	.db #0x50	; 80	'P'
   2C4E 82                  103 	.db #0x82	; 130
   2C4F 3F                  104 	.db #0x3F	; 63
   2C50 46                  105 	.db #0x46	; 70	'F'
   2C51 D9                  106 	.db #0xD9	; 217
   2C52 5D                  107 	.db #0x5D	; 93
   2C53 CD                  108 	.db #0xCD	; 205
   2C54 60                  109 	.db #0x60	; 96
   2C55 66                  110 	.db #0x66	; 102	'f'
   2C56 0D                  111 	.db #0x0D	; 13
   2C57 F3                  112 	.db #0xF3	; 243
   2C58 6D                  113 	.db #0x6D	; 109	'm'
   2C59 86                  114 	.db #0x86	; 134
   2C5A 9F                  115 	.db #0x9F	; 159
   2C5B D2                  116 	.db #0xD2	; 210
   2C5C 42                  117 	.db #0x42	; 66	'B'
   2C5D E7                  118 	.db #0xE7	; 231
   2C5E B8                  119 	.db #0xB8	; 184
   2C5F 80                  120 	.db #0x80	; 128
   2C60 51                  121 	.db #0x51	; 81	'Q'
   2C61 38                  122 	.db #0x38	; 56	'8'
   2C62 AA                  123 	.db #0xAA	; 170
   2C63 B6                  124 	.db #0xB6	; 182
   2C64 DD                  125 	.db #0xDD	; 221
   2C65 63                  126 	.db #0x63	; 99	'c'
   2C66 4E                  127 	.db #0x4E	; 78	'N'
   2C67 7A                  128 	.db #0x7A	; 122	'z'
   2C68 93                  129 	.db #0x93	; 147
   2C69 75                  130 	.db #0x75	; 117	'u'
   2C6A 94                  131 	.db #0x94	; 148
   2C6B 17                  132 	.db #0x17	; 23
   2C6C 76                  133 	.db #0x76	; 118	'v'
   2C6D FA                  134 	.db #0xFA	; 250
   2C6E DC                  135 	.db #0xDC	; 220
   2C6F 5A                  136 	.db #0x5A	; 90	'Z'
   2C70 D8                  137 	.db #0xD8	; 216
   2C71 22                  138 	.db #0x22	; 34
   2C72 BC                  139 	.db #0xBC	; 188
   2C73 6F                  140 	.db #0x6F	; 111	'o'
   2C74 CF                  141 	.db #0xCF	; 207
   2C75 2B                  142 	.db #0x2B	; 43
   2C76 D0                  143 	.db #0xD0	; 208
   2C77 B5                  144 	.db #0xB5	; 181
   2C78 1A                  145 	.db #0x1A	; 26
   2C79 BE                  146 	.db #0xBE	; 190
   2C7A 77                  147 	.db #0x77	; 119	'w'
   2C7B 8B                  148 	.db #0x8B	; 139
   2C7C DA                  149 	.db #0xDA	; 218
   2C7D 04                  150 	.db #0x04	; 4
   2C7E 96                  151 	.db #0x96	; 150
   2C7F A4                  152 	.db #0xA4	; 164
   2C80 92                  153 	.db #0x92	; 146
   2C81 BA                  154 	.db #0xBA	; 186
   2C82 4D                  155 	.db #0x4D	; 77	'M'
   2C83 A2                  156 	.db #0xA2	; 162
   2C84 47                  157 	.db #0x47	; 71	'G'
   2C85 2E                  158 	.db #0x2E	; 46
   2C86 A8                  159 	.db #0xA8	; 168
   2C87 54                  160 	.db #0x54	; 84	'T'
   2C88 7B                  161 	.db #0x7B	; 123
   2C89 EE                  162 	.db #0xEE	; 238
   2C8A 53                  163 	.db #0x53	; 83	'S'
   2C8B EF                  164 	.db #0xEF	; 239
   2C8C AB                  165 	.db #0xAB	; 171
   2C8D 43                  166 	.db #0x43	; 67	'C'
   2C8E 8E                  167 	.db #0x8E	; 142
   2C8F 3A                  168 	.db #0x3A	; 58
   2C90 88                  169 	.db #0x88	; 136
   2C91 29                  170 	.db #0x29	; 41
   2C92 E2                  171 	.db #0xE2	; 226
   2C93 3D                  172 	.db #0x3D	; 61
   2C94 D4                  173 	.db #0xD4	; 212
   2C95 BB                  174 	.db #0xBB	; 187
   2C96 FB                  175 	.db #0xFB	; 251
   2C97 74                  176 	.db #0x74	; 116	't'
   2C98 21                  177 	.db #0x21	; 33
   2C99 56                  178 	.db #0x56	; 86	'V'
   2C9A 06                  179 	.db #0x06	; 6
   2C9B 8A                  180 	.db #0x8A	; 138
   2C9C AE                  181 	.db #0xAE	; 174
   2C9D 8F                  182 	.db #0x8F	; 143
   2C9E 62                  183 	.db #0x62	; 98	'b'
   2C9F 61                  184 	.db #0x61	; 97	'a'
   2CA0 6E                  185 	.db #0x6E	; 110	'n'
   2CA1 4C                  186 	.db #0x4C	; 76	'L'
   2CA2 1D                  187 	.db #0x1D	; 29
   2CA3 78                  188 	.db #0x78	; 120	'x'
   2CA4 87                  189 	.db #0x87	; 135
   2CA5 89                  190 	.db #0x89	; 137
   2CA6 91                  191 	.db #0x91	; 145
   2CA7 0C                  192 	.db #0x0C	; 12
   2CA8 9A                  193 	.db #0x9A	; 154
   2CA9 95                  194 	.db #0x95	; 149
   2CAA 40                  195 	.db #0x40	; 64
   2CAB 12                  196 	.db #0x12	; 18
   2CAC 7C                  197 	.db #0x7C	; 124
   2CAD 07                  198 	.db #0x07	; 7
   2CAE 3B                  199 	.db #0x3B	; 59
   2CAF EB                  200 	.db #0xEB	; 235
   2CB0 71                  201 	.db #0x71	; 113	'q'
   2CB1 13                  202 	.db #0x13	; 19
   2CB2 F2                  203 	.db #0xF2	; 242
   2CB3 4F                  204 	.db #0x4F	; 79	'O'
   2CB4 0A                  205 	.db #0x0A	; 10
   2CB5 3C                  206 	.db #0x3C	; 60
   2CB6 F0                  207 	.db #0xF0	; 240
   2CB7 65                  208 	.db #0x65	; 101	'e'
   2CB8 03                  209 	.db #0x03	; 3
   2CB9 64                  210 	.db #0x64	; 100	'd'
   2CBA 6A                  211 	.db #0x6A	; 106	'j'
   2CBB 02                  212 	.db #0x02	; 2
   2CBC FC                  213 	.db #0xFC	; 252
   2CBD C5                  214 	.db #0xC5	; 197
   2CBE 01                  215 	.db #0x01	; 1
   2CBF 15                  216 	.db #0x15	; 21
   2CC0 5C                  217 	.db #0x5C	; 92
   2CC1 98                  218 	.db #0x98	; 152
   2CC2 97                  219 	.db #0x97	; 151
   2CC3 2F                  220 	.db #0x2F	; 47
   2CC4 84                  221 	.db #0x84	; 132
   2CC5 F9                  222 	.db #0xF9	; 249
   2CC6 33                  223 	.db #0x33	; 51	'3'
   2CC7 16                  224 	.db #0x16	; 22
   2CC8 72                  225 	.db #0x72	; 114	'r'
   2CC9 BF                  226 	.db #0xBF	; 191
   2CCA 1B                  227 	.db #0x1B	; 27
   2CCB F6                  228 	.db #0xF6	; 246
   2CCC C9                  229 	.db #0xC9	; 201
   2CCD 7D                  230 	.db #0x7D	; 125
   2CCE 37                  231 	.db #0x37	; 55	'7'
   2CCF 90                  232 	.db #0x90	; 144
   2CD0 58                  233 	.db #0x58	; 88	'X'
   2CD1 27                  234 	.db #0x27	; 39
   2CD2 14                  235 	.db #0x14	; 20
   2CD3 9D                  236 	.db #0x9D	; 157
   2CD4 35                  237 	.db #0x35	; 53	'5'
   2CD5 A5                  238 	.db #0xA5	; 165
   2CD6 C2                  239 	.db #0xC2	; 194
   2CD7 C3                  240 	.db #0xC3	; 195
   2CD8 E8                  241 	.db #0xE8	; 232
   2CD9 E9                  242 	.db #0xE9	; 233
   2CDA 11                  243 	.db #0x11	; 17
   2CDB 31                  244 	.db #0x31	; 49	'1'
   2CDC B7                  245 	.db #0xB7	; 183
   2CDD 67                  246 	.db #0x67	; 103	'g'
   2CDE CB                  247 	.db #0xCB	; 203
   2CDF AC                  248 	.db #0xAC	; 172
   2CE0 7F                  249 	.db #0x7F	; 127
   2CE1 2D                  250 	.db #0x2D	; 45
   2CE2 7E                  251 	.db #0x7E	; 126
   2CE3 44                  252 	.db #0x44	; 68	'D'
   2CE4 A6                  253 	.db #0xA6	; 166
   2CE5 ED                  254 	.db #0xED	; 237
   2CE6 A7                  255 	.db #0xA7	; 167
   2CE7 C6                  256 	.db #0xC6	; 198
   2CE8 0B                  257 	.db #0x0B	; 11
   2CE9 E6                  258 	.db #0xE6	; 230
   2CEA AD                  259 	.db #0xAD	; 173
   2CEB 22                  260 	.db #0x22	; 34
   2CEC F4                  261 	.db #0xF4	; 244
   2CED F5                  262 	.db #0xF5	; 245
   2CEE C4                  263 	.db #0xC4	; 196
   2CEF C8                  264 	.db #0xC8	; 200
   2CF0 5F                  265 	.db #0x5F	; 95
   2CF1 CE                  266 	.db #0xCE	; 206
   2CF2 E0                  267 	.db #0xE0	; 224
   2CF3 49                  268 	.db #0x49	; 73	'I'
   2CF4 E3                  269 	.db #0xE3	; 227
   2CF5 EC                  270 	.db #0xEC	; 236
   2CF6 39                  271 	.db #0x39	; 57	'9'
   2CF7 D3                  272 	.db #0xD3	; 211
   2CF8 19                  273 	.db #0x19	; 25
   2CF9 79                  274 	.db #0x79	; 121	'y'
   2CFA 26                  275 	.db #0x26	; 38
   2CFB A1                  276 	.db #0xA1	; 161
   2CFC CA                  277 	.db #0xCA	; 202
   2CFD 83                  278 	.db #0x83	; 131
   2CFE BD                  279 	.db #0xBD	; 189
   2CFF 30                  280 	.db #0x30	; 48	'0'
   2D00 99                  281 	.db #0x99	; 153
   2D01 85                  282 	.db #0x85	; 133
   2D02 CC                  283 	.db #0xCC	; 204
   2D03 81                  284 	.db #0x81	; 129
   2D04 05                  285 	.db #0x05	; 5
   2D05 1F                  286 	.db #0x1F	; 31
   2D06 9C                  287 	.db #0x9C	; 156
   2D07 41                  288 	.db #0x41	; 65	'A'
   2D08 32                  289 	.db #0x32	; 50	'2'
   2D09 36                  290 	.db #0x36	; 54	'6'
   2D0A F7                  291 	.db #0xF7	; 247
   2D0B 4A                  292 	.db #0x4A	; 74	'J'
   2D0C A0                  293 	.db #0xA0	; 160
   2D0D 6B                  294 	.db #0x6B	; 107	'k'
   2D0E DF                  295 	.db #0xDF	; 223
   2D0F 8C                  296 	.db #0x8C	; 140
   2D10 B3                  297 	.db #0xB3	; 179
   2D11 DE                  298 	.db #0xDE	; 222
   2D12 FE                  299 	.db #0xFE	; 254
   2D13 B2                  300 	.db #0xB2	; 178
   2D14 09                  301 	.db #0x09	; 9
   2D15 B4                  302 	.db #0xB4	; 180
   2D16 A3                  303 	.db #0xA3	; 163
   2D17 28                  304 	.db #0x28	; 40
   2D18 D6                  305 	.db #0xD6	; 214
   2D19 E5                  306 	.db #0xE5	; 229
   2D1A 0F                  307 	.db #0x0F	; 15
   2D1B C1                  308 	.db #0xC1	; 193
   2D1C E4                  309 	.db #0xE4	; 228
   2D1D 1C                  310 	.db #0x1C	; 28
   2D1E 34                  311 	.db #0x34	; 52	'4'
   2D1F B1                  312 	.db #0xB1	; 177
   2D20 57                  313 	.db #0x57	; 87	'W'
   2D21 25                  314 	.db #0x25	; 37
   2D22 59                  315 	.db #0x59	; 89	'Y'
   2D23 B9                  316 	.db #0xB9	; 185
   2D24 9B                  317 	.db #0x9B	; 155
   2D25 0E                  318 	.db #0x0E	; 14
   2D26 D1                  319 	.db #0xD1	; 209
   2D27 10                  320 	.db #0x10	; 16
   2D28 A9                  321 	.db #0xA9	; 169
   2D29 68                  322 	.db #0x68	; 104	'h'
   2D2A 00                  323 	.db #0x00	; 0
   2D2B 8D                  324 	.db #0x8D	; 141
   2D2C 55                  325 	.db #0x55	; 85	'U'
   2D2D 3E                  326 	.db #0x3E	; 62
   2D2E 1E                  327 	.db #0x1E	; 30
   2D2F 4B                  328 	.db #0x4B	; 75	'K'
                            329 ;src/random/random.c:60: void cpc_random(u8* random_number) {
                            330 ;	---------------------------------
                            331 ; Function cpc_random
                            332 ; ---------------------------------
   2D30                     333 _cpc_random::
                            334 ;src/random/random.c:74: __endasm;
   2D30 3A 3E 2D      [13]  335 	LD A,(#valor_previo)
   2D33 6F            [ 4]  336 	LD L,A
   2D34 ED 5F         [ 9]  337 	LD A,R
   2D36 85            [ 4]  338 	ADD L
   2D37 32 3E 2D      [13]  339 	LD (#valor_previo),A
   2D3A 6F            [ 4]  340 	LD L,A ;SE DEVUELVE L (CHAR)
   2D3B 26 00         [ 7]  341 	LD H,#0
   2D3D C9            [10]  342 	RET
   2D3E                     343 	 valor_previo:
   2D3E FF                  344 	.db #0xFF
   2D3F C9            [10]  345 	ret
                            346 	.area _CODE
                            347 	.area _INITIALIZER
                            348 	.area _CABS (ABS)
