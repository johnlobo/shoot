;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9207 (Jun 29 2015) (Mac OS X x86_64)
; This file was generated Fri Jul  3 18:24:01 2015
;--------------------------------------------------------
	.module sprites
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.area _INITIALIZER
	.area _CABS (ABS)
