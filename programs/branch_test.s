nop
li $a0, 0
li $t0, 0
li $s0, 200

while:
    beq  $t0, $s0, end_while
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j while

end_while:
  li $t2, 1
  nop

li $a1, 0
li $t1, 0
while2:
    addi $a1, $a1, 1
    addi $t1, $t1, 1
    bne  $t1, $s0, while2
    
nop