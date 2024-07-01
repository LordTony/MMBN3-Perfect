.definelabel press_programs_owned_address, 0x02001AD0

// instead of checking if it's equipped
// just check if it's owned
// also change the branch logic so having
// more than 1 press chip doesn't cause problems
.org 0x0812d980
    LDR R0, [PC, #0]
    .word press_programs_owned_address
    cmp r0, #0
    beq LAB_0812d98c

.org 0x0812d93a
    LDR R0, [PC, #0]
    .word press_programs_owned_address
    cmp r0, #0 
    beq LAB_0812d97a

; creating labels into the original code
.org 0x0812d97a
    LAB_0812d97a:

.org 0x0812d98c
    LAB_0812d98c:

// TODO: Do this with the flame chip thing too