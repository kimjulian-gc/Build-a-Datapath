main:
    addi $t0, $zero, 5       # $t0 = 5
    addi $t1, $zero, 7       # $t1 = 7

    beq $t0, $t1, equal      # If $t0 == $t1, jump to equal
    addi $t2, $zero, 1       # $t2 = 1 (should not execute if beq is taken)

    bne $t0, $t1, not_equal  # If $t0 != $t1, jump to not_equal
    addi $t3, $zero, 2       # $t3 = 2 (should execute if bne is taken)

    j end                    # Jump to the end

equal:
    addi $t2, $zero, 0       # $t2 = 0

not_equal:
    addi $t3, $zero, 3       # $t3 = 3

end:
    nop                       # Do nothing, end of program

