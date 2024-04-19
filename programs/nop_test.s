# Test 'nop' instruction
nop

# Test 'and' instruction
# First set $t0 = 0
and $t0, $zero, $zero # $t0 = 0 & 0 = 0

addi $t0, $t0, 1
and $t1, $zero, $t0 # $t1 = 0 & 1 = 0
and $t2, $t0, $zero # $t2 = 1 & 0 = 0
and $t3, $t0, $t0   # $t3 = 1 & 1 = 1