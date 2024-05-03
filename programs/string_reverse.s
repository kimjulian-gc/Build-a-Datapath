# String Reverse
# This program reads a line of text from keyboard input until a newline is encountered,
# reverses the string, prints it out, and then halts.
# Preconditions: Assumes keyboard input can be accessed at address KBD and is byte addressable.
# Postconditions: Reverses the input string and prints it to the terminal, then halts.

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

# Read characters from input until newline
read_char:
    lb   $t0, 0($s1)     # Load a byte from keyboard input
    beq  $t0, $zero, read_char  # If no input, loop
    push $t0             # Push character onto stack
    li   $t1, '\n'       
    bne  $t0, $t1, read_char    # If not newline, read next char

# Print characters in reverse order
print_reverse:
    pop  $a1             # Pop character from stack to $a1
    beq  $a1, $zero, halt        # If stack empty, go to halt
    sb   $a1, 0($s0)     # Output character to terminal
    j    print_reverse   # Continue until stack is empty

# Halt the machine
halt:
    j    HALT            # Halt the machine


