# Convert to Uppercase
# This program reads a line of text from the keyboard input (mapped at address KBD),
# converts all lowercase letters to uppercase, and writes the result to the terminal output (mapped at address TERM).
# Preconditions: Assumes keyboard input can be accessed at address KBD and is byte addressable.
# Postconditions: All lowercase letters in the input are converted to uppercase. Other characters remain unchanged.

# Constants for system calls and stack
.constant HALT      0xff00    # System call for halting the machine
.constant TERM      0xff10    # Address of the terminal output
.constant KBD       0xff20    # Address of the keyboard input
.constant STACK_TOP 0xf800    # Top address of the stack

nop
# Main program
main:
    li   $sp, STACK_TOP  # Initialize stack pointer

    # Setup I/O addresses
    li   $s0, TERM       # Address of the terminal output
    li   $s1, KBD        # Address of the keyboard input

# Loop to read characters from input
read_loop:
    lb $t0, 0($s1)          # Load a character from the keyboard
    beq $t0, $zero, read_loop  # If it is the null terminator, start over
    
    # Check if the character is a lowercase letter
    li $t1, 'a'           # Load the ASCII value for 'a'
    li $t2, 'z'           # Load the ASCII value for 'z'
    slt $t3, $t0, $t1     # Set $t3 to 1 if $t0 < 'a'
    slt $a0, $t2, $t0     # Set $a0 to 1 if 'z' < $t0
    or $a1, $t3, $a0      # Set $a1 to 1 if either $t3 or $a0 is 1 (i.e., $t0 is outside 'a'-'z')
    beq $a1, $zero, convert_to_upper  # If $a1 is 0, then it is a lowercase letter

# Write character to output
write_char:
    sb $t0, 0($s0)        # Write the character to the terminal
    li $t1, '\n'          # Load a newline constant
    beq $t0, $t1, end     # If the character was the newline, stop looping
    j read_loop           # Read the next character

# Convert lowercase to uppercase
convert_to_upper:
    subi $t0, $t0, 32     # Convert lowercase to uppercase by subtracting 32 from ASCII value
    j write_char          # Write the converted character and continue

# End of program, halt the machine
end:
    j HALT                # Enable halt pin and stop the PC incrementing


