void print_decimal_number(int n) {
  if (n == 0) {
    putchar('0');
  } else {
    int digit = n % 10;
    if (n > digit) {
      print_decimal_number(n / 10);
    }
    putchar('0' + digit);
  }
}

# Print the first 15 Fibonacci numbers to the PIPS terminal

.constant TERMINAL 0xff10
.constant HALT     0xff00

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
        move $v0, $a0                 # solution is in $a0, copy to $v0
    jr   $ra                          # Return to caller
#END remainder

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
#END division

