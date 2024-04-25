# Test Suite for Load and Store Instructions

li $sp, 0xf800

# Load a value into $t0 and store it in memory
li $t0, 42         # Load immediate value 42 into $t0
sw $t0, 4($zero) # Store $t0 at memory address 4

# Load the stored value back into $t1 using lw
lw $t1, 4($zero) # Load value from memory address 4 into $t1

# Load a byte from memory into $t2 using lb
lb $t2, 8($zero) # Load byte from memory address 8 into $t2

# Store a byte into memory
li $t3, 75         # Load immediate value 75 into $t3
sb $t3, 8($zero) # Store the byte value at memory address 8

# Load the stored byte value back into $t4 using lb
lb $s0, 8($zero) # Load byte from memory address 8 into $t4

# Expected Output:
# $t1 should contain 42 (value loaded using lw)
# $t2 should contain 0 (value loaded using lb, upper byte of $t1)
# $s0 should contain 75 (value loaded using lb after store byte operation)

# End of Test Suite

