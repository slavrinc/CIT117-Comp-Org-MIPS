.data
prompt: .asciiz "Enter a floating point number: "
result: .asciiz "Your number is: "

.text
li $v0, 4	# print prompt
la $a0, prompt
syscall

li $v0, 6	#syscall to read float and stored at $f0
syscall

li $v0, 4	# print prompt
la $a0, result
syscall

mov.s $f12, $f0 # move value from $f0 to $f12

li $v0, 2	#prints float at $f12
syscall

end: 
li $v0, 10 	# exit syscall
syscall
