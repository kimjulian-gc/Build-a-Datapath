li $t0, 2
li $t1, 5
blt! $t0, $t1, jump_here

li $s0, 666
j halt

jump_here:
  li $s0, 4

  li $t0, 3
  li $t1, 2
  blt! $t0, $t1, dont_jump_here

  li $s1, 4
  j halt

dont_jump_here:
  li $s1, 666

halt:
  li $s3, 1