.definelabel gutsman_beta_data_pointer, 0x0801a1e0
.definelabel punk_data_pointer, 0x0801a8cc
.definelabel bass_omega_data_pointer, 0x0801a454
.definelabel bass_gs_data_pointer, 0x0801a448
.definelabel alpha_omega_data_pointer, 0x0801aebc

// override gutsman's rom for testing
//.org 0x0812be28
//    .word bass_gs_data_pointer

// set all monster health to 1 for testing
.org 0x08005af2
    mov r1, #0x1

.org 0x080147ba
    mov r1, #0x1