# File:		Lavrinc_testutils.asm
# Author:	Samantha Lavrinc
# Purpose:	DEMO file to test utils.asm
	
.data
prompt: .asciiz "Enter an integer to test shift operations: "
mult10: .asciiz "a. Mult10 = "

.text

main:
# prompt & save integer
li $v0, 4
la $a0, prompt
syscall

#read int stored at $v0
li $v0, 5
syscall

# save input as $s0
add $s0, $v0, $zero

#call to Lavrinc_utils subprogram
jal Lavrinc_utils.asm

#mult10 prompt print
li $v0, 4
la $a0, mult10
syscall

#mult10 res print
add $a0, $s1, $zero
li $v0, 1
syscall


#end program
li $v0, 10
syscall
