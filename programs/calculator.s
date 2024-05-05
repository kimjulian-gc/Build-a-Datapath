# One-Function Calculator
# This program allows a user to input a one-digit number, a plus sign, and another one-digit number.
# It converts these inputs into integers, adds them, and prints the result followed by a newline.
# The program runs in a loop, continually accepting and evaluating user input.
# Preconditions: Assumes keyboard input can be accessed at address KBD and is byte addressable.
# Postconditions: Adds two one-digit numbers and prints the result to the terminal, continues until the machine is halted.

# Constants for system calls and stack
.constant HALT 0xff00      # System call for halting the machine
.constant TERM 0xff10      # Address of the terminal output
.constant KBD 0xff20       # Address of the keyboard input
.constant STACK_TOP 0xf800 # Top address of the stack

# Initialize
nop
main:
    li $sp, STACK_TOP     # Set stack pointer
    li $s0, TERM          # Terminal address
    li $s1, KBD           # Keyboard input address

# First digit input loop
input_loop_first_digit:
    li $v0, 0            # Clear sum register
    li $t0, 0            # Temporary register for current digit

    # Read first digit
    lb $t0, 0($s1)       # Load byte from keyboard
    li $t1, '\n'
    beq $t1, $t0, exit   # If '\n' is entered without full command, user wants to exit.
    subi $t0, $t0, '0'   # Convert from ASCII to integer
    slti $t1, $t0, 0     # Check if less than 0
    bne $t1, $zero, input_loop_first_digit  # Loop if not a valid digit
    slti $t1, $t0, 10    # Check if less than 10
    beq $t1, $zero, input_loop_first_digit  # Loop if not a valid digit
    add $v0, $v0, $t0    # Store first digit in $v0

# Operator input loop (we expect '+')
input_loop_operator:
    lb $t0, 0($s1)       # Load byte (should be '+')
    li $t1, '\n'
    beq $t1, $t0, exit   # If '\n' is entered without full command, user wants to exit.
    li $t1, '+'
    bne $t0, $t1, input_loop_operator  # Ensure it is '+'

# Second digit input loop
input_loop_second_digit:
    lb $t0, 0($s1)       # Load byte from keyboard
    li $t1, '\n'
    beq $t1, $t0, exit   # If '\n' is entered without full command, user wants to exit.
    subi $t0, $t0, '0'   # Convert from ASCII to integer
    slti $t1, $t0, 0     # Check if less than 0
    bne $t1, $zero, input_loop_second_digit  # Loop if not a valid digit
    slti $t1, $t0, 10    # Check if less than 10
    beq $t1, $zero, input_loop_second_digit  # Loop if not a valid digit
    add $v0, $v0, $t0    # Add second digit to $v0
    
# newline input loop (we expect '\n')
input_loop_newline_digit:
    lb $t0, 0($s1)       # Load byte (should be '\n')
    li $t1, '\n'
    # Uncomment if you want continual addition (n+n+...+n)
    # li $t2, '+'
    # beq $t0, $t2, input_loop_second_digit   # If the input is plus, user wants to keep adding
    bne $t0, $t1, input_loop_newline_digit  # Ensure it is '\n'
    j compute_and_display

# Compute result and display
compute_and_display:
    addi $a0, $v0, 0     # Move sum to $a0 for printing
    jal print_decimal_number  # Print the result
    j input_loop_first_digit  # Loop back for new input

# Exit routine
exit:
    j HALT               # Halt the machine

# remainder:
# The remainder of the division operation.
remainder:
 # if a0 < a1, return.
 slt $t0, $a0, $a1
 bne $t0, $zero, skip_loop
 while_loop:
  sub $a0, $a0, $a1
  # t0 will hold if a >= b (actually (not a < b), which is equivalent to a >= b)
  slt $t0, $a0, $a1
  beq $t0, $zero, while_loop # if (not a < b), continue looping
 skip_loop:
  addi $v0, $a0, 0    # solution is in $a0, copy to $v0
 jr $ra       # Return to caller
# END remainder

# Division function using repeated subtraction
division:
 # Initialize quotient to 0
 li $t0, 0

 div_loop:
  # Check if the dividend is less than the divisor
  slt $t1, $a0, $a1
  bne $t1, $zero, div_done

  # Subtract the divisor from the dividend
  sub $a0, $a0, $a1

  # Increment the quotient
  addi $t0, $t0, 1

  # Loop back
  j div_loop

 div_done:
  addi $v0, $t0, 0
  jr $ra # Return quotient
# END division

# product:
# Returns the product of the four integer arguments in $v0.
product:
 li $v0, 0      # Clear return register to use in code
 while:
 beq $a1, $zero, end_while
 add $v0, $v0, $a0
 addi $a1, $a1, -1
 j while
 end_while:
 jr $ra      # Return to caller
#END product

# print_decimal_number:
# Prints the decimal number in $a0.
print_decimal_number:
 # store return address and possible saved temporaries
 addi $sp, $sp, -16
 sw $ra, 0($sp)
 sw $s0, 4($sp)
 sw $s1, 8($sp)
 sw $s2, 12($sp)

 # initialize reversed int n into s0
 li $s0, 0
 li $s2, 0
 # store n into s1
 addi $s1, $a0, 0
  
 # reverse n
 j while_cond_1
 while_1:
  addi $a0, $s0, 0
  li $a1, 10
  jal product
   
  addi $s0, $v0, 0
  addi $a0, $s1, 0
  li $a1, 10
  jal remainder

  add $s0, $s0, $v0

  addi $a0, $s1, 0
  li $a1, 10
  jal division

  addi $s1, $v0, 0
  addi $s2, $s2, 1 # count number of digits

  while_cond_1:
   bne $s1, $zero, while_1

 j while_cond_2
 while_2:
  addi $a0, $s0, 0
  li $a1, 10
  jal remainder

  addi $t0, $v0, 0x30
  li $t1, TERM
  sb $t0, 0($t1)

  addi $a0, $s0, 0
  li $a1, 10
  jal division

  addi $s0, $v0, 0
  addi $s2, $s2, -1 # count remaining number of digits

  while_cond_2:
   bne $s0, $zero, while_2

 # print remaining 0s
 li $t1, TERM
 li $t0, 0x30
 j while_cond_3
 while_3:
  sb $t0, 0($t1)
  addi $s2, $s2, -1 # count remaining number of digits
 while_cond_3:
  bne $s2, $zero, while_3

 lw $ra, 0($sp)
 lw $s0, 4($sp)
 lw $s1, 8($sp)
 addi $sp, $sp, 12

 li $t0, 0x0a
 li $t1, TERM
 sb $t0, 0($t1)


 jr $ra
# END print_decimal_number

