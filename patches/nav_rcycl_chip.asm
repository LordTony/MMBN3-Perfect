//////////////////
//              //
//   NavRcycl   //
//              //
//////////////////

//
// Override the giga chip anti-cheat no-no list for vendors
//

.org 0x08001a86
    .fill 26, 0xff

//
// Add NavRcycl to Undernet 2 Bugfrag Vendor Item List
//

.org 0x08044e60
    .byte 0x02          // Type (0 = Nothing, 1 = Item, 2 = BattleChip, 3 = NaviCust Program)
    .byte 0x01          // (0xFF = unlimited)
    .halfword 0x0130    // Item/BattleChip/Program index (16-bit)
    .byte 0x1a          // Chip code/Program color (8-bit)
    .byte 0x00          // Unused byte
    .halfword 0x00c8    // Price in 100z/1 BugFrag (16-bit)