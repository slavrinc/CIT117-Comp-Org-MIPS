.data
X_prompt: .asciiz "Enter a value for X: "
Y_prompt: .asciiz "Enter a value for Y: "
a_res: .asciiz "a) (x*x*x) + 2(x*x) + 3x + 4 = "
b_res: .asciiz "\nb) ((4x)/3) * y = "

.text
# prompt & save X:
li $v0, 4
la $a0, X_prompt
syscall

li $v0, 5	#read int_X stored at $v0
syscall

add $s0, $v0, $zero #s0 = X

# prompt & save Y:
li $v0, 4
la $a0, Y_prompt
syscall

li $v0, 5	#read int_Y stored at $v0
syscall

add $s1, $v0, $zero #s1 = Y

# problem a:
# (x*x*x) + 2(x*x) + 3x + 4

# move x for operation
add $t0, $s0, $zero	# t0 = x

mult $t0, $t0
mflo $t1		# t1 = x*x

mult $t1, $t0
mflo $t2		# t2 = x*x*x

li $t3, 3
mult $t0, $t3
mflo $t0		# t0 = 3x

li $t3, 2
mult $t1, $t3
mflo $t1		# t1 = 2(x*x)

addi $t0, $t0, 4	# t0 = 3x + 4
add $t0, $t0, $t1	# t0 = 2(x*x) + 3x + 4
add $t0, $t0, $t2	# t0 = (x*x*x) + 2(x*x) + 3x + 4

li $v0, 4
la $a0, a_res
syscall

add $a0, $t0, $zero
li $v0, 1
syscall

# problem b:
# (4x/3) * y
# move x for operation
add $t0, $s0, $zero	# t0 = x

#move y for operation
add $t1, $s1, $zero	# t1 = y

li $t2, 4
mult $t0, $t2
mflo $t0		#t0 = 4x

li $t2, 3
div $t0, $t2
mflo $t0		#t0 = (4x)/3

mult $t0, $t1
mflo $t0		# t0 = (4x/3)*y

li $v0, 4
la $a0, b_res
syscall

add $a0, $t0, $zero
li $v0, 1
syscall

end: 
li $v0, 10 	# exit syscall
syscall

