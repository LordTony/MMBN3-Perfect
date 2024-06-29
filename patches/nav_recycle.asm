;-------------------------------------
;   Giga Chips
;   - Nav Recycle for now
;-------------------------------------

; Override the giga chip anti-cheat no-no list
.org 0x08001a86
	.fill 26, 0xff

; Add Nav Recycle to Undernet 2 Bugfrag Vendor Item List
.org 0x08044e60
	.byte 0x02			; Type (0 = Nothing, 1 = Item, 2 = BattleChip, 3 = NaviCust Program)
	.byte 0x01			; (0xFF = unlimited)
	.halfword 0x0130	; Item/BattleChip/Program index (16-bit)
	.byte 0x1a			; Chip code/Program color (8-bit)
	.byte 0x00			; Unused byte
	.halfword 0x00c8	; Price in 100z/1 BugFrag (16-bit)

; add the art for the giga chips past the end of the rom
; Sprite order NavRcycl, AlphArmΣ, Bass, Serenade, Balance
; 0x700 length for each sprite
; 0x20 length for each palette
.definelabel gigchip_data_address, 0x08800000
.org gigchip_data_address
	.incbin "white_giga_chip_sprites.dat"

; Fix the library page ordering
.org 0x08013b1e			; This is for Nav Recycle 
	.halfword 0x00ff	; Set the ordering
	.skip 0x08
	.word gigchip_data_address	; Set the art
	.word gigchip_data_address + 0x700

// TODO: should be able to easily get the other
// giga chips connected to their art and library sorting