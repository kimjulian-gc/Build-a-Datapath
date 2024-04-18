# This is a comprehensive test program to validate the 'addi', 'add', 'subi', and 'sub' instructions.
# The program uses simple numbers to ensure the arithmetic operations work correctly.

# Test 'addi' instruction
addi $t0, $zero, 5    # $t0 = 0 + 5 = 5
addi $t1, $zero, 10   # $t1 = 0 + 10 = 10

# Test 'add' instruction
add $t2, $t0, $t1     # $t2 = $t0 + $t1 = 5 + 10 = 15
add $t3, $t1, $t1     # $t3 = $t1 + $t1 = 10 + 10 = 20

# Test 'subi' instruction
subi $s0, $t2, 5      # $s0 = $t2 - 5 = 15 - 5 = 10
subi $s1, $t3, 10     # $s1 = $t3 - 10 = 20 - 10 = 10

# Test 'sub' instruction
sub $s2, $t3, $t2     # $s2 = $t3 - $t2 = 20 - 15 = 5
sub $s3, $t3, $t1     # $s3 = $t3 - $t1 = 20 - 10 = 10

# Check results
# Expected:
# $t0 = 5
# $t1 = 10
# $t2 = 15
# $t3 = 20
# $s0 = 10
# $s1 = 10
# $s2 = 5
# $s3 = 10
