////////////////////////////////////////////
//  Press Program Only Needs to be Owned  //
////////////////////////////////////////////

.definelabel press_programs_owned_address, 0x02001ad0

.org 0x0812d980
    LDR R0, [PC, #0]
    .word press_programs_owned_address
    cmp r0, #0
    beq LAB_0812d98c

.org 0x0812d98c
    LAB_0812d98c:

.org 0x0812d93a
    LDR R0, [PC, #0]
    .word press_programs_owned_address
    cmp r0, #0 
    beq LAB_0812d97a

.org 0x0812d97a
    LAB_0812d97a:

///////////////////////////////////////////////
//  EngyChng Program Only Needs to be Owned  //
///////////////////////////////////////////////

.definelabel engychng_programs_owned_address, 0x02001ad4

.org 0x080f546c
    LDR R0, [PC, #0]
    .word engychng_programs_owned_address
    cmp r0, #0
    beq LAB_080f5482

.org 0x080f5482
    LAB_080f5482:

.org 0x0802a392
    LDR R0, [PC, #0]
    .word engychng_programs_owned_address
    cmp r0, #0
    beq LAB_0802a3f0

.org 0x0802a3f0
    LAB_0802a3f0: