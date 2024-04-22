jump_test:
  li $t0, 0
  li $t1, 0
  j test_loop

test_func:
  addi $t1, $t1, 1
  jr $ra

test_loop:
  addi $t0, $t0, 1
  jal test_func
  j test_loop
