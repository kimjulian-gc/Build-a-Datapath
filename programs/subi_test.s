# This program tests the 'subi' instruction by performing immediate subtraction and storing results in registers.
subi_test:
  li $t0, 9           # Initialize $t0 with 10
  subi $t1, $t0, 3     # $t1 = $t0 - 3 = 6
  subi $t2, $t1, 2     # $t2 = $t1 - 2 = 4
  subi $t3, $t2, 4     # $t3 = $t2 - 4 = 0
