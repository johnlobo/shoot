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
   44D3                      23 _g_nextRand::
   44D3                      24 	.ds 1
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
   2E1B                      53 _getRandomUniform::
                             54 ;src/random/random.c:56: g_nextRand += inc;               // Move to next random value to get
   2E1B 21 02 00      [10]   55 	ld	hl,#2
   2E1E 39            [11]   56 	add	hl,sp
   2E1F D5            [11]   57 	push	de
   2E20 FD 21 D3 44   [14]   58 	ld	iy,#_g_nextRand
   2E24 FD E5         [15]   59 	push	iy
   2E26 D1            [10]   60 	pop	de
   2E27 1A            [ 7]   61 	ld	a,(de)
   2E28 86            [ 7]   62 	add	a, (hl)
   2E29 12            [ 7]   63 	ld	(de),a
   2E2A D1            [10]   64 	pop	de
                             65 ;src/random/random.c:57: return g_randUnif[g_nextRand];   // Return the random value
   2E2B 11 36 2E      [10]   66 	ld	de,#_g_randUnif+0
   2E2E 2A D3 44      [16]   67 	ld	hl,(_g_nextRand)
   2E31 26 00         [ 7]   68 	ld	h,#0x00
   2E33 19            [11]   69 	add	hl,de
   2E34 6E            [ 7]   70 	ld	l,(hl)
   2E35 C9            [10]   71 	ret
   2E36                      72 _g_randUnif:
   2E36 FD                   73 	.db #0xFD	; 253
   2E37 45                   74 	.db #0x45	; 69	'E'
   2E38 9E                   75 	.db #0x9E	; 158
   2E39 70                   76 	.db #0x70	; 112	'p'
   2E3A E1                   77 	.db #0xE1	; 225
   2E3B 52                   78 	.db #0x52	; 82	'R'
   2E3C 24                   79 	.db #0x24	; 36
   2E3D 23                   80 	.db #0x23	; 35
   2E3E 69                   81 	.db #0x69	; 105	'i'
   2E3F 2A                   82 	.db #0x2A	; 42
   2E40 6C                   83 	.db #0x6C	; 108	'l'
   2E41 B0                   84 	.db #0xB0	; 176
   2E42 DB                   85 	.db #0xDB	; 219
   2E43 C7                   86 	.db #0xC7	; 199
   2E44 5E                   87 	.db #0x5E	; 94
   2E45 18                   88 	.db #0x18	; 24
   2E46 FF                   89 	.db #0xFF	; 255
   2E47 D7                   90 	.db #0xD7	; 215
   2E48 F1                   91 	.db #0xF1	; 241
   2E49 48                   92 	.db #0x48	; 72	'H'
   2E4A 08                   93 	.db #0x08	; 8
   2E4B AF                   94 	.db #0xAF	; 175
   2E4C 20                   95 	.db #0x20	; 32
   2E4D F8                   96 	.db #0xF8	; 248
   2E4E C0                   97 	.db #0xC0	; 192
   2E4F 73                   98 	.db #0x73	; 115	's'
   2E50 5B                   99 	.db #0x5B	; 91
   2E51 2C                  100 	.db #0x2C	; 44
   2E52 D5                  101 	.db #0xD5	; 213
   2E53 50                  102 	.db #0x50	; 80	'P'
   2E54 82                  103 	.db #0x82	; 130
   2E55 3F                  104 	.db #0x3F	; 63
   2E56 46                  105 	.db #0x46	; 70	'F'
   2E57 D9                  106 	.db #0xD9	; 217
   2E58 5D                  107 	.db #0x5D	; 93
   2E59 CD                  108 	.db #0xCD	; 205
   2E5A 60                  109 	.db #0x60	; 96
   2E5B 66                  110 	.db #0x66	; 102	'f'
   2E5C 0D                  111 	.db #0x0D	; 13
   2E5D F3                  112 	.db #0xF3	; 243
   2E5E 6D                  113 	.db #0x6D	; 109	'm'
   2E5F 86                  114 	.db #0x86	; 134
   2E60 9F                  115 	.db #0x9F	; 159
   2E61 D2                  116 	.db #0xD2	; 210
   2E62 42                  117 	.db #0x42	; 66	'B'
   2E63 E7                  118 	.db #0xE7	; 231
   2E64 B8                  119 	.db #0xB8	; 184
   2E65 80                  120 	.db #0x80	; 128
   2E66 51                  121 	.db #0x51	; 81	'Q'
   2E67 38                  122 	.db #0x38	; 56	'8'
   2E68 AA                  123 	.db #0xAA	; 170
   2E69 B6                  124 	.db #0xB6	; 182
   2E6A DD                  125 	.db #0xDD	; 221
   2E6B 63                  126 	.db #0x63	; 99	'c'
   2E6C 4E                  127 	.db #0x4E	; 78	'N'
   2E6D 7A                  128 	.db #0x7A	; 122	'z'
   2E6E 93                  129 	.db #0x93	; 147
   2E6F 75                  130 	.db #0x75	; 117	'u'
   2E70 94                  131 	.db #0x94	; 148
   2E71 17                  132 	.db #0x17	; 23
   2E72 76                  133 	.db #0x76	; 118	'v'
   2E73 FA                  134 	.db #0xFA	; 250
   2E74 DC                  135 	.db #0xDC	; 220
   2E75 5A                  136 	.db #0x5A	; 90	'Z'
   2E76 D8                  137 	.db #0xD8	; 216
   2E77 22                  138 	.db #0x22	; 34
   2E78 BC                  139 	.db #0xBC	; 188
   2E79 6F                  140 	.db #0x6F	; 111	'o'
   2E7A CF                  141 	.db #0xCF	; 207
   2E7B 2B                  142 	.db #0x2B	; 43
   2E7C D0                  143 	.db #0xD0	; 208
   2E7D B5                  144 	.db #0xB5	; 181
   2E7E 1A                  145 	.db #0x1A	; 26
   2E7F BE                  146 	.db #0xBE	; 190
   2E80 77                  147 	.db #0x77	; 119	'w'
   2E81 8B                  148 	.db #0x8B	; 139
   2E82 DA                  149 	.db #0xDA	; 218
   2E83 04                  150 	.db #0x04	; 4
   2E84 96                  151 	.db #0x96	; 150
   2E85 A4                  152 	.db #0xA4	; 164
   2E86 92                  153 	.db #0x92	; 146
   2E87 BA                  154 	.db #0xBA	; 186
   2E88 4D                  155 	.db #0x4D	; 77	'M'
   2E89 A2                  156 	.db #0xA2	; 162
   2E8A 47                  157 	.db #0x47	; 71	'G'
   2E8B 2E                  158 	.db #0x2E	; 46
   2E8C A8                  159 	.db #0xA8	; 168
   2E8D 54                  160 	.db #0x54	; 84	'T'
   2E8E 7B                  161 	.db #0x7B	; 123
   2E8F EE                  162 	.db #0xEE	; 238
   2E90 53                  163 	.db #0x53	; 83	'S'
   2E91 EF                  164 	.db #0xEF	; 239
   2E92 AB                  165 	.db #0xAB	; 171
   2E93 43                  166 	.db #0x43	; 67	'C'
   2E94 8E                  167 	.db #0x8E	; 142
   2E95 3A                  168 	.db #0x3A	; 58
   2E96 88                  169 	.db #0x88	; 136
   2E97 29                  170 	.db #0x29	; 41
   2E98 E2                  171 	.db #0xE2	; 226
   2E99 3D                  172 	.db #0x3D	; 61
   2E9A D4                  173 	.db #0xD4	; 212
   2E9B BB                  174 	.db #0xBB	; 187
   2E9C FB                  175 	.db #0xFB	; 251
   2E9D 74                  176 	.db #0x74	; 116	't'
   2E9E 21                  177 	.db #0x21	; 33
   2E9F 56                  178 	.db #0x56	; 86	'V'
   2EA0 06                  179 	.db #0x06	; 6
   2EA1 8A                  180 	.db #0x8A	; 138
   2EA2 AE                  181 	.db #0xAE	; 174
   2EA3 8F                  182 	.db #0x8F	; 143
   2EA4 62                  183 	.db #0x62	; 98	'b'
   2EA5 61                  184 	.db #0x61	; 97	'a'
   2EA6 6E                  185 	.db #0x6E	; 110	'n'
   2EA7 4C                  186 	.db #0x4C	; 76	'L'
   2EA8 1D                  187 	.db #0x1D	; 29
   2EA9 78                  188 	.db #0x78	; 120	'x'
   2EAA 87                  189 	.db #0x87	; 135
   2EAB 89                  190 	.db #0x89	; 137
   2EAC 91                  191 	.db #0x91	; 145
   2EAD 0C                  192 	.db #0x0C	; 12
   2EAE 9A                  193 	.db #0x9A	; 154
   2EAF 95                  194 	.db #0x95	; 149
   2EB0 40                  195 	.db #0x40	; 64
   2EB1 12                  196 	.db #0x12	; 18
   2EB2 7C                  197 	.db #0x7C	; 124
   2EB3 07                  198 	.db #0x07	; 7
   2EB4 3B                  199 	.db #0x3B	; 59
   2EB5 EB                  200 	.db #0xEB	; 235
   2EB6 71                  201 	.db #0x71	; 113	'q'
   2EB7 13                  202 	.db #0x13	; 19
   2EB8 F2                  203 	.db #0xF2	; 242
   2EB9 4F                  204 	.db #0x4F	; 79	'O'
   2EBA 0A                  205 	.db #0x0A	; 10
   2EBB 3C                  206 	.db #0x3C	; 60
   2EBC F0                  207 	.db #0xF0	; 240
   2EBD 65                  208 	.db #0x65	; 101	'e'
   2EBE 03                  209 	.db #0x03	; 3
   2EBF 64                  210 	.db #0x64	; 100	'd'
   2EC0 6A                  211 	.db #0x6A	; 106	'j'
   2EC1 02                  212 	.db #0x02	; 2
   2EC2 FC                  213 	.db #0xFC	; 252
   2EC3 C5                  214 	.db #0xC5	; 197
   2EC4 01                  215 	.db #0x01	; 1
   2EC5 15                  216 	.db #0x15	; 21
   2EC6 5C                  217 	.db #0x5C	; 92
   2EC7 98                  218 	.db #0x98	; 152
   2EC8 97                  219 	.db #0x97	; 151
   2EC9 2F                  220 	.db #0x2F	; 47
   2ECA 84                  221 	.db #0x84	; 132
   2ECB F9                  222 	.db #0xF9	; 249
   2ECC 33                  223 	.db #0x33	; 51	'3'
   2ECD 16                  224 	.db #0x16	; 22
   2ECE 72                  225 	.db #0x72	; 114	'r'
   2ECF BF                  226 	.db #0xBF	; 191
   2ED0 1B                  227 	.db #0x1B	; 27
   2ED1 F6                  228 	.db #0xF6	; 246
   2ED2 C9                  229 	.db #0xC9	; 201
   2ED3 7D                  230 	.db #0x7D	; 125
   2ED4 37                  231 	.db #0x37	; 55	'7'
   2ED5 90                  232 	.db #0x90	; 144
   2ED6 58                  233 	.db #0x58	; 88	'X'
   2ED7 27                  234 	.db #0x27	; 39
   2ED8 14                  235 	.db #0x14	; 20
   2ED9 9D                  236 	.db #0x9D	; 157
   2EDA 35                  237 	.db #0x35	; 53	'5'
   2EDB A5                  238 	.db #0xA5	; 165
   2EDC C2                  239 	.db #0xC2	; 194
   2EDD C3                  240 	.db #0xC3	; 195
   2EDE E8                  241 	.db #0xE8	; 232
   2EDF E9                  242 	.db #0xE9	; 233
   2EE0 11                  243 	.db #0x11	; 17
   2EE1 31                  244 	.db #0x31	; 49	'1'
   2EE2 B7                  245 	.db #0xB7	; 183
   2EE3 67                  246 	.db #0x67	; 103	'g'
   2EE4 CB                  247 	.db #0xCB	; 203
   2EE5 AC                  248 	.db #0xAC	; 172
   2EE6 7F                  249 	.db #0x7F	; 127
   2EE7 2D                  250 	.db #0x2D	; 45
   2EE8 7E                  251 	.db #0x7E	; 126
   2EE9 44                  252 	.db #0x44	; 68	'D'
   2EEA A6                  253 	.db #0xA6	; 166
   2EEB ED                  254 	.db #0xED	; 237
   2EEC A7                  255 	.db #0xA7	; 167
   2EED C6                  256 	.db #0xC6	; 198
   2EEE 0B                  257 	.db #0x0B	; 11
   2EEF E6                  258 	.db #0xE6	; 230
   2EF0 AD                  259 	.db #0xAD	; 173
   2EF1 22                  260 	.db #0x22	; 34
   2EF2 F4                  261 	.db #0xF4	; 244
   2EF3 F5                  262 	.db #0xF5	; 245
   2EF4 C4                  263 	.db #0xC4	; 196
   2EF5 C8                  264 	.db #0xC8	; 200
   2EF6 5F                  265 	.db #0x5F	; 95
   2EF7 CE                  266 	.db #0xCE	; 206
   2EF8 E0                  267 	.db #0xE0	; 224
   2EF9 49                  268 	.db #0x49	; 73	'I'
   2EFA E3                  269 	.db #0xE3	; 227
   2EFB EC                  270 	.db #0xEC	; 236
   2EFC 39                  271 	.db #0x39	; 57	'9'
   2EFD D3                  272 	.db #0xD3	; 211
   2EFE 19                  273 	.db #0x19	; 25
   2EFF 79                  274 	.db #0x79	; 121	'y'
   2F00 26                  275 	.db #0x26	; 38
   2F01 A1                  276 	.db #0xA1	; 161
   2F02 CA                  277 	.db #0xCA	; 202
   2F03 83                  278 	.db #0x83	; 131
   2F04 BD                  279 	.db #0xBD	; 189
   2F05 30                  280 	.db #0x30	; 48	'0'
   2F06 99                  281 	.db #0x99	; 153
   2F07 85                  282 	.db #0x85	; 133
   2F08 CC                  283 	.db #0xCC	; 204
   2F09 81                  284 	.db #0x81	; 129
   2F0A 05                  285 	.db #0x05	; 5
   2F0B 1F                  286 	.db #0x1F	; 31
   2F0C 9C                  287 	.db #0x9C	; 156
   2F0D 41                  288 	.db #0x41	; 65	'A'
   2F0E 32                  289 	.db #0x32	; 50	'2'
   2F0F 36                  290 	.db #0x36	; 54	'6'
   2F10 F7                  291 	.db #0xF7	; 247
   2F11 4A                  292 	.db #0x4A	; 74	'J'
   2F12 A0                  293 	.db #0xA0	; 160
   2F13 6B                  294 	.db #0x6B	; 107	'k'
   2F14 DF                  295 	.db #0xDF	; 223
   2F15 8C                  296 	.db #0x8C	; 140
   2F16 B3                  297 	.db #0xB3	; 179
   2F17 DE                  298 	.db #0xDE	; 222
   2F18 FE                  299 	.db #0xFE	; 254
   2F19 B2                  300 	.db #0xB2	; 178
   2F1A 09                  301 	.db #0x09	; 9
   2F1B B4                  302 	.db #0xB4	; 180
   2F1C A3                  303 	.db #0xA3	; 163
   2F1D 28                  304 	.db #0x28	; 40
   2F1E D6                  305 	.db #0xD6	; 214
   2F1F E5                  306 	.db #0xE5	; 229
   2F20 0F                  307 	.db #0x0F	; 15
   2F21 C1                  308 	.db #0xC1	; 193
   2F22 E4                  309 	.db #0xE4	; 228
   2F23 1C                  310 	.db #0x1C	; 28
   2F24 34                  311 	.db #0x34	; 52	'4'
   2F25 B1                  312 	.db #0xB1	; 177
   2F26 57                  313 	.db #0x57	; 87	'W'
   2F27 25                  314 	.db #0x25	; 37
   2F28 59                  315 	.db #0x59	; 89	'Y'
   2F29 B9                  316 	.db #0xB9	; 185
   2F2A 9B                  317 	.db #0x9B	; 155
   2F2B 0E                  318 	.db #0x0E	; 14
   2F2C D1                  319 	.db #0xD1	; 209
   2F2D 10                  320 	.db #0x10	; 16
   2F2E A9                  321 	.db #0xA9	; 169
   2F2F 68                  322 	.db #0x68	; 104	'h'
   2F30 00                  323 	.db #0x00	; 0
   2F31 8D                  324 	.db #0x8D	; 141
   2F32 55                  325 	.db #0x55	; 85	'U'
   2F33 3E                  326 	.db #0x3E	; 62
   2F34 1E                  327 	.db #0x1E	; 30
   2F35 4B                  328 	.db #0x4B	; 75	'K'
                            329 ;src/random/random.c:60: void cpc_random(u8* random_number) {
                            330 ;	---------------------------------
                            331 ; Function cpc_random
                            332 ; ---------------------------------
   2F36                     333 _cpc_random::
                            334 ;src/random/random.c:74: __endasm;
   2F36 3A 44 2F      [13]  335 	LD A,(#valor_previo)
   2F39 6F            [ 4]  336 	LD L,A
   2F3A ED 5F         [ 9]  337 	LD A,R
   2F3C 85            [ 4]  338 	ADD L
   2F3D 32 44 2F      [13]  339 	LD (#valor_previo),A
   2F40 6F            [ 4]  340 	LD L,A ;SE DEVUELVE L (CHAR)
   2F41 26 00         [ 7]  341 	LD H,#0
   2F43 C9            [10]  342 	RET
   2F44                     343 	 valor_previo:
   2F44 FF                  344 	.db #0xFF
   2F45 C9            [10]  345 	ret
                            346 	.area _CODE
                            347 	.area _INITIALIZER
                            348 	.area _CABS (ABS)
