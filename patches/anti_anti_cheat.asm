//
// Override the giga chip anti-cheat no-no list for vendors
//

.org 0x08001a86
    .fill 26, 0xff

//
// Removes the checksum checks that corrupt things if the chips are wrong
//

.org 0x08007eae
    mov r0, #0x1
    pop {r4,r6,pc}

.org 0x08007e42
    mov r0, #0x1
    pop {r4,r6,pc}

.org 0x08007e7a
    mov r0, #0x1
    pop {r4,r6,pc}

.org 0x08007ecc
    pop {pc}

.org 0x08007d46
    mov r0, r0

// all of this creates a few code caves.
// one is at 0x08007eec to 0x08007f1b

.org 0x08007dbe
    mov r0, #0x1
    pop {r4,r6,pc}

// new code cave 
// one is at 0x08007dbe to 0x08007df6

.org 0x08007d8a
    mov r0, #0

// [2000352]?

.org 0x08001ab6
    tst r0, r14