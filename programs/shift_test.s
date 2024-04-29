# This is a simple program that tests the implementation of shift instructions.

nop

li  $t0, 0x000F     # Load 0x000F (15) into $t0
sll $s0, $t0, 4     # $s0 = 15 * 16 = 240 0x00F0

li  $t0, 0x8000     # Load 0x1000 into $t0
sll $s1, $t0, 1     # $s1 = (overflow) 0x0000


li  $t0, 0xF000     # Load 0xF000 into $t0
srl $s2, $t0, 4     # $s2 = 0x0F00

li  $t0, 0x000F     # Load 0x000F (15) into $t0
srl $s3, $t0, 1     # $s3 = 15 / 2 = 7 = 0x0007


li $t0, 0xF000      # Load 0xF000 into $t0
sra $t1, $t0, 4     # $t1 = 0xFF00

li  $t0, 0x000F     # Load 0x000F (15) into $t0
sra $t2, $t0, 1     # $t2 = 15 / 2 = 7 = 0x0007