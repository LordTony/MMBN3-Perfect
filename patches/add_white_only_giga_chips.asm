////////////////////
//   Giga Chips   //
////////////////////////////////////////
//                                    //
//   - Nav Recycle                    //
//   - All art is now in the game     //
//                                    //
////////////////////////////////////////

//
// Adding art from white version
//

.definelabel gigchip_data_address, 0x08800000
.org gigchip_data_address
    .incbin "white_giga_chip_sprites.dat"

/////////////////////////////
//   Chip Data Structure   //
//////////////////////////////////////////////////////////
//                                                      //
//                             Library Display Order    //
//                                             |---|    //
//   00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    //
//                                                      //
//                           Art Addr    Palette Addr   //
//                           |---------| |---------|    //
//   10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    //
//                                                      //
//////////////////////////////////////////////////////////

///////////////
//   Order   //
////////////////////////
//                    //
//   0 = NavRcycl *   //
//   1 = AlphArm V    //
//   2 = Bass X       //
//   3 = Serenade S   //
//   4 = Balance Y    //
//                    //
////////////////////////

//
// Hooking up the art to the giga chip data
// Replacing the "place holder" art image
//

.definelabel start_of_chip_data, 0x08013b10
.definelabel chip_art_size, 0x700
.definelabel chip_art_and_palette_size, 0x720

.macro write_chip_data, index
    .org start_of_chip_data + (0x20 * index)
        .skip 0xe
        .halfword (0x00f0 + index)
        .skip 0x8
        .word gigchip_data_address + (chip_art_and_palette_size * index)
        .word gigchip_data_address + (chip_art_and_palette_size * index) + chip_art_size
.endmacro

write_chip_data 0
write_chip_data 1
write_chip_data 2
write_chip_data 3
write_chip_data 4

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

//
// Experimental Bass X chip
//
/*
.definelabel custom_reward_logic, 0x087ffbd0

.org 0x080158b4
    ldr r0, =custom_reward_logic
    mov pc, r0
    .pool

.org custom_reward_logic
    push { r6 }
    mov r0,#0x0
    ldrb r1,[r5,#0xc] // current reward page
    ldrb r2,[r5,#0xd] // number of reward pages
    cmp r1,r2
    bge @@return_label
    add r2,r1,r1
    add r2,#0x10
    ldrh r0,[r5,r2]
    ldr r6, =0x2f32 // This is broken right now. currently gives bass X chip in every battle
    cmp r0, r6
    bne @@GiveBassX
    add r1,#0x1
    @@skip_add:
    strb r1,[r5,#0xc]
    @@return_label:
    pop { r6 }
    mov pc,lr

    @@GiveBassX:
    strh r6, [r5, r2]
    b @@skip_add

    .pool
*/