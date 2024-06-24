.gba
.open "Roms/Megaman Battle Network 3 - Blue Version (U).gba", "Roms/MMBN3 - Light Blue Version.gba", 0x8000000

;-------------------------------------
;	Main hacks
;-------------------------------------

.org 0x87FFFB2
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x05
	.word 0x01020304
	
.close