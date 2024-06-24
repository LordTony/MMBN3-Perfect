.gba
.open "Megaman Battle Network 3 - Blue Version (U).gba", "MMBN3 - Perfect Version.gba", 0x8000000

;-------------------------------------
;	Main hacks
;-------------------------------------

;-------------------------------------
;   Giga Chips
;   - Nav Recycle for now
;-------------------------------------

; Override the giga chip anti-cheat no-no list
.org 0x08001a86
	.fill 26, 0xFF

; Add Nav Recycle to Undernet 2 Bugfrag Vendor Item List
.org 0x08044e60
	.byte 0x02  		; Type (0 = Nothing, 1 = Item, 2 = BattleChip, 3 = NaviCust Program)
	.byte 0x01  		; (0xFF = unlimited)
	.halfword 0x0130	; Item/BattleChip/Program index (16-bit)
	.byte 0x1A			; Chip code/Program color (8-bit)
	.byte 0x00 			; Unused byte
	.halfword 0x00C8 	; Price in 100z/1 BugFrag (16-bit)

; Todo add proper sorting so the giga chips don't mangle the library display

; Todo add the art for nav-recycle, because it ain't there bro 

.close