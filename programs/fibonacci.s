# Print the first 15 Fibonacci numbers to the PIPS terminal

.constant TERMINAL 0xff10
.constant HALT     0xff00

main:
    nop
    # Initialize the stack
    li $sp, 0xf800

    li   $a0, 15

    jal  print_decimal_number

    li   $a0, 321

    jal  print_decimal_number

    j    HALT


# remainder:
#  The remainder of the division operation.
remainder:
    # if a0 < a1, return.
    slt  $t0, $a0, $a1
    bne  $t0, $zero, skip_loop
    while_loop:
        sub  $a0, $a0, $a1
        # t0 will hold if a >= b (actually (not a < b), which is equivalent to a >= b)
        slt  $t0, $a0, $a1
        beq  $t0, $zero, while_loop   # if (not a < b), continue looping
    skip_loop:
        addi $v0, $a0, 0                # solution is in $a0, copy to $v0
    jr   $ra                            # Return to caller
# END remainder

# Division function using repeated subtraction
division:
    # Initialize quotient to 0
    li   $t0, 0

    div_loop:
        # Check if the dividend is less than the divisor
        slt  $t1, $a0, $a1
        bne  $t1, $zero, div_done

        # Subtract the divisor from the dividend
        sub  $a0, $a0, $a1

        # Increment the quotient
        addi $t0, $t0, 1

        # Loop back
        j   div_loop

    div_done:
        addi $v0, $t0, 0
        jr   $ra  # Return quotient
# END division

# product:
#  Returns the product of the four integer arguments in $v0.
product:
  li   $v0, 0                       # Clear return register to use in code
  while:
    beq  $a1, $zero, end_while
    add  $v0, $v0, $a0
    addi $a1, $a1, -1
    j    while
  end_while:
    jr   $ra                        # Return to caller
#END product

# print_decimal_number:
#  Prints the decimal number in $a0.
print_decimal_number:
    # store return address and possible saved temporaries
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)

    # initialize reversed int n into s0
    li   $s0, 0
    # store n into s1
    addi $s1, $a0, 0
    
    # reverse n
    j    while_cond_1
    while_1:
        addi $a0, $s0, 0
        li   $a1, 10
        jal  product
        
        addi $s0, $v0, 0
        addi $a0, $s1, 0
        li   $a1, 10
        jal  remainder

        add  $s0, $s0, $v0

        addi $a0, $s1, 0
        li   $a1, 10
        jal  division

        addi $s1, $v0, 0

        while_cond_1:
            bne $s1, $zero, while_1
        
    j   while_cond_2
    while_2:
        addi $a0, $s0, 0
        li   $a1, 10
        jal  remainder

        addi $t0, $v0, 0x30
        li   $t1, TERMINAL
        sb   $t0, 0($t1)

        addi $a0, $s0, 0
        li   $a1, 10
        jal  division

        addi $s0, $v0, 0

        while_cond_2:
            bne $s0, $zero, while_2

    lw   $ra, 0($sp)
    lw   $s0, 4($sp)
    lw   $s1, 8($sp)
    addi $sp, $sp, 12

    li   $t0, 0x0a
    li   $t1, TERMINAL
    sb   $t0, 0($t1)


    jr   $ra
# END print_decimal_number

