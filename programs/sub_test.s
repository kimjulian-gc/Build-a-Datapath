# This program tests the 'sub' instruction by performing register-based subtraction.
sub_test:
  li $s0, 20           # Load 20 into $s0
  li $s1, 10           # Load 10 into $s1
  sub $s2, $s0, $s1    # $s2 = $s0 - $s1 = 10
  sub $s3, $s2, $s1    # $s3 = $s2 - $s1 = 0
