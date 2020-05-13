.data
prompt: .asciiz "Enter an integer to multiply by 15: "
bres: .asciiz "\nBit shift result: "
mres: .asciiz "Mult operation result: "

.text
# prompt & save integer
li $v0, 4
la $a0, prompt
syscall

li $v0, 5		# read int stored at $v0
syscall

add $t0, $v0, $zero 	# t0 = user input

#standard multiplication:
li $t1, 15	# t1 = 15
mult $t0, $t1	
mflo $t1	# t1 = 15* user input for verification

li $v0, 4
la $a0, mres
syscall

add $a0, $t1, $zero
li $v0, 1
syscall

#shift multiplication:
# 15 = 8 + 4 + 2 + 1
# (x<<3) + (x<<2) + (x<<1) + (x<<0)

#t0 = x = (x<<0)

sll $t1, $t0, 3		# $t1 = (x<<3)
sll $t2, $t0, 2		# $t2 = (x<<2)
sll $t3, $t0, 1		# $t3 = (x<<1)

add $t1, $t1, $t0	# (x<<3) + (x<<0)
add $t1, $t1, $t2	# (x<<3) + (x<<2) + (x<<0)
add $t1, $t1, $t3	# $t1 = (x<<3) + (x<<2) + (x<<1) + (x<<0)

li $v0, 4
la $a0, bres
syscall

add $a0, $t1, $zero
li $v0, 1
syscall

end: 
li $v0, 10 	# exit syscall
syscall
