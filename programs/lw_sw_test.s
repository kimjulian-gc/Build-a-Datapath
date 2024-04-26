nop
li $a0, 42
li $t0, 0

sw $a0, 0($t0)
lw $a1, 0($t0)
lw $s0, 0($t0)
lw $s1, 0($t0)
lw $s2, 0($t0)

nop