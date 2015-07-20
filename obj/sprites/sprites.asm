;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jul  5 2015) (Mac OS X x86_64)
; This file was generated Mon Jul 20 23:41:04 2015
;--------------------------------------------------------
	.module sprites
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _toque004
	.globl _toque003
	.globl _toque002
	.globl _toque001
	.globl _toque000
	.globl _explosion02004
	.globl _explosion02003
	.globl _explosion02002
	.globl _explosion02001
	.globl _explosion02000
	.globl _G_star_04
	.globl _G_star_03
	.globl _G_star_02
	.globl _G_star_01
	.globl _G_star_00
	.globl _G_baddie03_07
	.globl _G_baddie03_06
	.globl _G_baddie03_05
	.globl _G_baddie03_04
	.globl _G_baddie03_03
	.globl _G_baddie03_02
	.globl _G_baddie03_01
	.globl _G_baddie03_00
	.globl _G_shoot_02
	.globl _G_shoot_01
	.globl _G_shoot_00
	.globl _G_ship_02
	.globl _G_ship_01
	.globl _G_ship_00
	.globl _ship03
	.globl _ship02
	.globl _bullet02_0
	.globl _bullet01_1
	.globl _bullet01_0
	.globl _ship01
	.globl _redFlag
	.globl _palette
	.globl _tintas
	.globl _G_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	.area _CODE
_G_palette:
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x0B	; 11
	.db #0x09	; 9
	.db #0x0A	; 10
	.db #0x0E	; 14
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x1A	; 26
	.db #0x16	; 22
	.db #0x1E	; 30
	.db #0x13	; 19
	.db #0x1F	; 31
	.db #0x17	; 23
	.db #0x15	; 21
	.db #0x10	; 16
_tintas:
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x0B	; 11
	.db #0x09	; 9
	.db #0x0A	; 10
	.db #0x0E	; 14
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x1A	; 26
	.db #0x16	; 22
	.db #0x1E	; 30
	.db #0x13	; 19
	.db #0x1F	; 31
	.db #0x17	; 23
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x14	; 20
_palette:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x0B	; 11
	.db #0x05	; 5
	.db #0x17	; 23
	.db #0x09	; 9
	.db #0x0C	; 12
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0F	; 15
	.db #0x0D	; 13
	.db #0x19	; 25
	.db #0x1A	; 26
	.db #0x00	; 0
_redFlag:
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x14	; 20
	.db #0x2C	; 44
	.db #0x3C	; 60
	.db #0x2C	; 44
	.db #0x3C	; 60
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db 0x00
	.db 0x00
_ship01:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4C	; 76	'L'
	.db #0x8C	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8C	; 140
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x4C	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8C	; 140
	.db #0xCC	; 204
	.db #0x64	; 100	'd'
	.db #0x4C	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4C	; 76	'L'
	.db #0x98	; 152
	.db #0x64	; 100	'd'
	.db #0x8C	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4C	; 76	'L'
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x8C	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_bullet01_0:
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0x15	; 21
	.db #0x2A	; 42
_bullet01_1:
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x2A	; 42
	.db #0x15	; 21
	.db #0x2A	; 42
	.db #0x15	; 21
_bullet02_0:
	.db #0x2A	; 42
	.db #0x2A	; 42
	.db #0x2A	; 42
	.db #0x2A	; 42
_ship02:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x4C	; 76	'L'
	.db #0x4C	; 76	'L'
	.db #0x4C	; 76	'L'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0xC0	; 192
	.db #0x84	; 132
	.db #0xCC	; 204
	.db #0x4C	; 76	'L'
	.db #0x4C	; 76	'L'
	.db #0x8C	; 140
	.db #0xC0	; 192
	.db #0x84	; 132
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x4C	; 76	'L'
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x4C	; 76	'L'
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0xCC	; 204
	.db #0x8C	; 140
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x4C	; 76	'L'
	.db #0x08	; 8
	.db #0x4C	; 76	'L'
	.db #0x8C	; 140
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0xCC	; 204
	.db #0x8C	; 140
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0xCC	; 204
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x4C	; 76	'L'
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xC0	; 192
	.db #0x0C	; 12
	.db #0x48	; 72	'H'
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5B	; 91
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA7	; 167
	.db #0xA2	; 162
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_ship03:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0x8C	; 140
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x4C	; 76	'L'
	.db #0x8C	; 140
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0xC4	; 196
	.db #0xC8	; 200
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x48	; 72	'H'
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x1B	; 27
	.db #0x27	; 39
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x0A	; 10
	.db #0x00	; 0
	.db #0x00	; 0
_G_ship_00:
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xA8	; 168
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x54	; 84	'T'
	.db #0x3C	; 60
	.db #0x2D	; 45
	.db #0x1E	; 30
	.db #0x3C	; 60
	.db #0x28	; 40
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x14	; 20
_G_ship_01:
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0xCC	; 204
	.db #0xF0	; 240
	.db #0x54	; 84	'T'
	.db #0x0C	; 12
	.db #0x89	; 137
	.db #0x5A	; 90	'Z'
	.db #0xF0	; 240
	.db #0x08	; 8
	.db #0xD8	; 216
	.db #0xF0	; 240
	.db #0x50	; 80	'P'
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x50	; 80	'P'
_G_ship_02:
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xA8	; 168
	.db #0xF0	; 240
	.db #0xCC	; 204
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0xA5	; 165
	.db #0x46	; 70	'F'
	.db #0x0C	; 12
	.db #0xA0	; 160
	.db #0xF0	; 240
	.db #0xE4	; 228
	.db #0x04	; 4
	.db #0xA0	; 160
	.db #0x11	; 17
	.db #0x2A	; 42
	.db #0x04	; 4
_G_shoot_00:
	.db #0x7B	; 123
	.db #0xB7	; 183
	.db #0x7B	; 123
	.db #0xB7	; 183
_G_shoot_01:
	.db #0xA2	; 162
	.db #0x2A	; 42
	.db #0x2A	; 42
	.db #0x2A	; 42
_G_shoot_02:
	.db #0x51	; 81	'Q'
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
_G_baddie03_00:
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x3F	; 63
	.db #0x7A	; 122	'z'
	.db #0xB5	; 181
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x3F	; 63
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
_G_baddie03_01:
	.db #0x51	; 81	'Q'
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x3F	; 63
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xB5	; 181
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x2A	; 42
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x2A	; 42
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x2A	; 42
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0xA2	; 162
_G_baddie03_02:
	.db #0x51	; 81	'Q'
	.db #0xB7	; 183
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0xF8	; 248
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0xF8	; 248
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0xB7	; 183
	.db #0x2A	; 42
	.db #0x00	; 0
_G_baddie03_03:
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0xA2	; 162
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x2A	; 42
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xB5	; 181
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xB5	; 181
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0x3F	; 63
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x00	; 0
_G_baddie03_04:
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x51	; 81	'Q'
	.db #0x3F	; 63
	.db #0x50	; 80	'P'
	.db #0xA0	; 160
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x7A	; 122	'z'
	.db #0xB5	; 181
	.db #0x3F	; 63
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x3F	; 63
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0x00	; 0
_G_baddie03_05:
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xA8	; 168
	.db #0x15	; 21
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0xA8	; 168
	.db #0x15	; 21
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x7A	; 122	'z'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x3F	; 63
	.db #0xA2	; 162
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0xA2	; 162
_G_baddie03_06:
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7B	; 123
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0xF4	; 244
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0xF4	; 244
	.db #0xB5	; 181
	.db #0x7A	; 122	'z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x2A	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7B	; 123
	.db #0xA2	; 162
_G_baddie03_07:
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3F	; 63
	.db #0xA2	; 162
	.db #0x00	; 0
	.db #0xB5	; 181
	.db #0x3F	; 63
	.db #0xA2	; 162
	.db #0x50	; 80	'P'
	.db #0x3F	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x7A	; 122	'z'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x7A	; 122	'z'
	.db #0xF0	; 240
	.db #0xA8	; 168
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xA8	; 168
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
_G_star_00:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_G_star_01:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xB4	; 180
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xF8	; 248
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xB4	; 180
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_G_star_02:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0xA0	; 160
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xA0	; 160
	.db #0xA8	; 168
	.db #0xB4	; 180
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0xA0	; 160
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_G_star_03:
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
_G_star_04:
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
_explosion02000:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0xF4	; 244
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xF0	; 240
	.db #0x78	; 120	'x'
	.db #0xA8	; 168
	.db #0x54	; 84	'T'
	.db #0xB4	; 180
	.db #0x70	; 112	'p'
	.db #0xA8	; 168
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0xA8	; 168
	.db #0xF8	; 248
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0xFC	; 252
	.db #0xBC	; 188
	.db #0x34	; 52	'4'
	.db #0x3C	; 60
	.db #0xF4	; 244
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x34	; 52	'4'
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xF4	; 244
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0xF4	; 244
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_explosion02001:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0xB4	; 180
	.db #0x28	; 40
	.db #0x14	; 20
	.db #0xF0	; 240
	.db #0x30	; 48	'0'
	.db #0x7C	; 124
	.db #0xBC	; 188
	.db #0xB0	; 176
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0x14	; 20
	.db #0x78	; 120	'x'
	.db #0xF0	; 240
	.db #0x28	; 40
	.db #0x54	; 84	'T'
	.db #0x3C	; 60
	.db #0xB4	; 180
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xA8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_explosion02002:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x3C	; 60
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x3C	; 60
	.db #0xB4	; 180
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_explosion02003:
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xA0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_explosion02004:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_toque000:
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_toque001:
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_toque002:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
_toque003:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db 0x00
	.db 0x00
_toque004:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.area _INITIALIZER
	.area _CABS (ABS)
