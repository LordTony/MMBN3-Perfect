.definelabel punkBeta_ID, 0xd6
.definelabel punkBeta_dropTable_addr, 0x8018f78

.org punkBeta_dropTable_addr
    .halfword 0x1f10

.org 0x08013710 + 0x12
    .byte 0x04

//
// The code that says "don't count Punk" when adding up
// the total number of possible mega chips in game and
// the currently owned number of mega chips
//

// max chips
.org 0x080365f6
    cmp r0, r14

// hard code 86 mega chips after as the return 
// after the rest of the logic runs
.org 0x08036686
    mov r0, #0x56

// owned chips
.org 0x080017b4
    cmp r0, r14

//
// I think the way to library works is that it will show
// the number of chips you have, but it won't show the
// number that exist unless you have them all already.
//

// show max obtainable mega chip count in library
.org 0x080368E6
    cmp		r0, r0
.org 0x08030512
    cmp		r0, r0

// show max obtainable giga chip count in library
//.org 0x080369C2
//    cmp		r0,r0
//.org 0x0803059A
//    cmp		r0,r0

// show max obtainable PA chip count in library
//.org 0x08030622
//    cmp		r0,r0
//.org 0x08036A9E
//    cmp		r0,r0

// never hit?
//.org 0x08001b04
//    cmp r0, #0x56

//.org 0x080304d4
//    sub r0, #0x56

// offset of mega chips
//.org 0x080304f6
//    sub r0, #0x56

// check 20093d0
// check 801155e
// check [8011563]?
// [02000352]! gets written at startup
// seems like it's 7F which makes punk not
// get counted as an option
//[0E000352]! I don't even know what this junk is
// save battery?

//080304b8
//080304d4
//080304f6