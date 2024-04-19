# Test 'nop' instruction
nop

# Test 'and' instruction
# First set $t0 = 0
and $t0, $zero, $zero # $t0 = 0 & 0 = 0

addi $t0, $t0, 1
and $t1, $zero, $t0 # $t1 = 0 & 1 = 0
and $t2, $t0, $zero # $t2 = 1 & 0 = 0
and $t3, $t0, $t0   # $t3 = 1 & 1 = 1

# Test 'andi' instruction
andi $s0, $zero, 0x0000 # $s0 = 0 & 0x0000 = 0
andi $s1, $zero, 0xFFFF # $s1 = 0 & 0xFFFF = 0
andi $s2, $t0, 0x0000   # $s2 = 1 & 0x0000 = 0
andi $s3, $t0, 0xFFFF   # $s3 = 1 & 0xFFFF = 1

# Test 'or' instruction
or $t0, $zero, $zero           # $t0 = 0 | 0 = 0
or $t1, $zero, $t0             # $t1 = 0 | 0 = 0

addi $t0, $t0, 1
or $t2, $zero, $t0             # $t2 = 0 | 1 = 1
or $t3, $t0, $t0               # $t3 = 1 | 1 = 1

# Test 'ori' instruction
ori $s0, $zero, 0x0000 # $s0 = 0 | 0x0000 = 0
ori $s1, $zero, 0xFFFF # $s1 = 0 | 0xFFFF = 0xFFFF
ori $s2, $t0, 0x0000   # $s2 = 1 | 0x0000 = 1
ori $s3, $t0, 0xFFFF   # $s3 = 1 | 0xFFFF = 0xFFFF

# Test 'nand' instruction
nand $t0, $zero, $zero           # $t0 = ~(0 & 0) = 0xFFFF
nand $t1, $zero, $t0             # $t1 = ~(0 & 0xFFFF) = 0
nand $t2, $t0, $t0               # $t2 = ~(0xFFFF & 0xFFFF) = 0
nand $t3, $t0, $zero             # $t3 = ~(0xFFFF & 0) = 0

# Test 'nandi' instruction
nandi $s0, $zero, 0x0000 # $s0 = ~(0 & 0x0000) = 0xFFFF
nandi $s1, $zero, 0xFFFF # $s1 = ~(0 & 0xFFFF) = 0xFFFF
nandi $s2, $t0, 0x0000 # $s2 = ~(0xFFFF & 0x0000) = 0x0000
nandi $s3, $t0, 0xFFFF # $s3 = ~(0xFFFF & 0xFFFF) = 0x0000FFFF

# Test 'nor' instruction
nor $t0, $zero, $zero # $t0 = ~(0 | 0) = 0xFFFF
nor $t1, $zero, $t0   # $t1 = ~(0 | 0xFFFF) = 0x0000
nor $t2, $t0, $zero   # $t2 = ~(0xFFFF | 0) = 0x0000
nor $t3, $t0, $t0     # $t3 = ~(0xFFFF | 0xFFFF) = 0x0000

# Test 'nori' instruction
nori $s0, $zero, 0x0000    # $s0 = ~(0 | 0x0000) = 0xFFFF
nori $s1, $zero, 0xFFFF    # $s1 = ~(0 | 0xFFFF) = 0x0000
nori $s2, $t0, 0x0000      # $s2 = ~(0xFFFF | 0x0000) = 0x0000
nori $s3, $t0, 0xFFFF      # $s3 = ~(0xFFFF | 0xFFFF) = 0x0000

# Test 'xor' instruction
xor $t0, $zero, $zero   # $t0 = 0 ^ 0 = 0

addi $t0, $zero, 1      # $t0 = 1
xor $t1, $zero, $t0     # $t1 = 0 ^ 1 = 1
xor $t2, $t0, $zero     # $t2 = 1 ^ 0 = 1
xor $t3, $t0, $t0       # $t3 = 1 ^ 1 = 0

# Test 'xori' instruction
xori $s0, $zero, 0x0000          # $s0 = 0 ^ 0x0000 = 0
xori $s1, $zero, 0xFFFF          # $s1 = 0 ^ 0xFFFF = 0xFFFF

li   $t0, 0xFFFF                 # $t0 = 0xFFFF
xori $s2, $t0, 0x0000            # $s2 = 0xFFFF ^ 0x0000 = 0xFFFF
xori $s3, $t0, 0xFFFF            # $s3 = 0xFFFF ^ 0xFFFF = 0xFFFF

# Test 'slt' instruction
slt $t0, $zero, $zero   # $t0 = 0 < 0 = 0
slt $t1, $zero, $t0     # $t1 = 0 < 0 = 0
slt $t2, $t0, $zero     # $t2 = 0 < 0 = 0

li  $t0, 1
slt $t3, $zero, $t0       # $t3 = 0 < 1 = 1

# Test 'slti' instruction
slti $s0, $t0, 0     # $s0 = 1 < 0 = 0
slti $s1, $t0, 1     # $s1 = 1 < 1 = 0
slti $s2, $t0, -1    # $s2 = 1 < -1 = 0
slti $s3, $t0, 2     # $s3 = 1 < 2 = 1

# Test 'sltu' instruction
sltu $t0, $zero, $zero    # $t0 = 0 < 0 = 0
sltu $t1, $zero, $t0      # $t1 = 0 < 0 = 0

li   $t0, 1
sltu $t2, $t0, $zero      # $t2 = 1 < 0 = 0
sltu $t3, $zero, $t0      # $t3 = 0 < 1 = 1

# Test 'sltiu' instruction
sltiu $s0, $t0, 0     # $s0 = 1 < 0 = 0
sltiu $s1, $t0, 1     # $s1 = 1 < 1 = 0
sltiu $s2, $t0, -1    # $s2 = 1 < -1 = 0
sltiu $s3, $t0, 2     # $s3 = 1 < 2 = 1
