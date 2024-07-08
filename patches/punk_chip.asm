.definelabel punkBeta_ID, 0xd6
.definelabel punkBeta_dropTable_addr, 0x8018f78

.org punkBeta_dropTable_addr
    .halfword 0x1f10

.org 0x08013710
    .skip 0xe
    .halfword 0x0001
    //.skip 0x02
    //.byte 0x04
    