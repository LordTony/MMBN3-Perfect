
.definelabel bassGS_ID, 0xf2
.definelabel bassOmega_ID, 0xf3
.definelabel alphaOmega_ID, 0xc5

// white only chips
.definelabel bass_X_chip, 0x2f32
.definelabel bassGS_X_chip, 0x2f38
.definelabel alphArmSigma_V_chip, 0x2b31
.definelabel Balance_Y_chip, 0x3134 // might make sense to just add this to a shop

.definelabel custom_reward_logic, 0x087ffbd0
.definelabel beaten_enemy_id_addr, 0x02037353

.org 0x080158b4
    ldr r0, =custom_reward_logic
    mov pc, r0
    .pool

.org custom_reward_logic
    push { r4, r6 }
    mov r0, #0x0
    ldrb r1, [r5,#0xc] // current reward page
    ldrb r2, [r5,#0xd] // number of reward pages
    cmp r1, r2
    bge @@return_label
    add r2, r1, r1
    add r2, #0x10
    ldrh r0, [r5, r2] // reward for this page
    ldr r6, =beaten_enemy_id_addr
    ldrb r6, [r6, #0]
    cmp r6, #bassGS_ID
    beq @@give_bass_X
    cmp r6, #bassOmega_ID
    beq @@give_bassGS_X
    cmp r6, #alphaOmega_ID
    beq @@give_alphaArmSigma_V
    @@increment_page_count:
    add r1, #0x1
    strb r1, [r5, #0xc]
    @@return_label:
    pop { r4, r6 }
    mov pc,lr

    @@give_bass_X:
    ldr r6, =bass_X_chip
    b @@change_next_reward

    @@give_bassGS_X:
    ldr r6, =bassGS_X_chip
    b @@change_next_reward

    @@give_alphaArmSigma_V:
    ldr r6, =alphArmSigma_V_chip

    @@change_next_reward:
    ldrh r4, [r5, #0xe]  // [r5,#0xe] will be zero if you are on the reward
    cmp r4, #0x0
    bne @@increment_page_count
    strh r6, [r5, r2]
    b @@return_label

    .pool

//
// Add the dissolve effect the extra award chip
//

.definelabel fix_dissolve_effect, 0x087ffc50
.definelabel after_override_section, 0x08014fde

.org 0x08014fd2
    ldr r0, =fix_dissolve_effect
    mov pc, r0
    .pool

.org fix_dissolve_effect
    ldrb r0, [r5, #0xc]
    cmp r0, #0x1
    ble @@test_dissolve
        @@dissolve:
        mov r0, #0xc
        b @@return_label
    @@test_dissolve:
    ldrh r0, [r5, #0xe] // Chip that will be given
    ldr r3, =bass_X_chip
    cmp r0, r3
    beq @@dissolve
    ldr r3, =bassGS_X_chip
    cmp r0, r3
    beq @@dissolve
    ldr r3, =alphArmSigma_V_chip
    cmp r0, r3
    beq @@dissolve
        mov r0, #0x4
    @@return_label:
    ldr r3, =after_override_section
    mov pc, r3
    .pool

//
// Fix how long the "Press A" timer takes to show up
//

.definelabel fix_timer, 0x087ffca0
.definelabel after_fix_timer, 0x08014fa8

.org 0x08014f9e
    ldr r0, =fix_timer
    mov pc, r0
    .pool

.org 0x087ffca0
    mov r0, #0x1
    ldrb r1, [r5, #0xc]
    tst r1, r1
    bne @@return

    // check for special chips
    ldr r3, =beaten_enemy_id_addr
    ldrb r3, [r3, #0]
    cmp r3, #bassGS_ID
    beq @@return
    cmp r3, #bassOmega_ID
    beq @@return
    cmp r3, #alphaOmega_ID
    beq @@return

    mov r0, #0x1e
    @@return:
    ldr r3, =after_fix_timer
    mov pc, r3
    .pool