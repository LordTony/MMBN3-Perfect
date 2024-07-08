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
        .halfword (0xf000 + index)
        .skip 0x8
        .word gigchip_data_address + (chip_art_and_palette_size * index)
        .word gigchip_data_address + (chip_art_and_palette_size * index) + chip_art_size
.endmacro

write_chip_data 0
write_chip_data 1
write_chip_data 2
write_chip_data 3
write_chip_data 4