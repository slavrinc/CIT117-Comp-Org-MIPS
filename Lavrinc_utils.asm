# subprogram:	Lavrinc_utils.asm
# author:	Samantha Lavrinc
# purpose:	To perform various shift operations.
# input: 	$s0 = userInput value
# output:	$s1 = mult10, $s2 = ror, $s3 = rorBIT, $s4 = rol, $s5 = rolBIT

.text

main:
# shift multiplication:
# 10 = 8  + 2 
# (x<<3) + (x<<1)

# $s0 = x = (x<<0)
sll $t1, $t0, 3		# $t1 = (x<<3)
sll $t3, $t0, 1		# $t3 = (x<<1)

add $s1, $t1, $t3	# $s1 = (x<<3) + (x<<1)

