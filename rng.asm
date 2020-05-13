# Samantha Lavrinc
# CIT-117
# 3-31-2020
#

li $t0, 100 #t0 is a constant 100
li $t1, 0   #t1 is the counter

loop:
beq $t1, $t0, end #loop : if t1 == 100 we are done

#loop : body
li $a0, 1 #location
li $a1, 100 #upper bound
li $v0, 42 #syscall service rng $v0 where $a0 is the ID and $a1 is the upper bound
syscall

addi $a0, $a0, 1 #adding 1 to the rng res

addi $t1, $t1, 1  #loop : add 1 to $t1

li $v0, 1 #syscall service print int $v0
syscall

li $a0, 32 
li $v0, 11  #syscall service for printing character
syscall

j loop # loop: jump back to beg of loop

end: 
li $v0, 10 # exit syscall
syscall