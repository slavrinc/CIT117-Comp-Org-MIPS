.data
prompt: .asciiz "Enter your favorite type of pie: "
result: .asciiz "\nSo you like "
result2: .asciiz " pie."

.text
li $v0, 4	# print prompt
la $a0, prompt
syscall

#read input
li $a1, 30 	#max of 30 chars
li $v0, 8	#syscall to readstring
syscall

la $t1, ($a0)	# saving input end data to $t1

li $v0, 4	# print result string
la $a0, result
syscall

# print input
add $a0, $t1, $zero #loading input data into $a0 to print
li $v0, 4
syscall

li $v0, 4	# print result2 string
la $a0, result2
syscall

end: 
li $v0, 10 	# exit syscall
syscall
