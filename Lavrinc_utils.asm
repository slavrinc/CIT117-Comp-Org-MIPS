# Program:	Lavrinc_utils.asm
# Author:	Samantha Lavrinc
# Purpose:	To define utilities which will be used in MIPS programs.

# Subprograms Index:
#	Prompt - Prompts the user to enter an integer and returns it to the calling program.
#	Mult10 - Takes user input parameter and returns the parameter multiplied by 10
#		 using only shift and add operations.
#	RCS    - Takes user input parameter and returns the value shifted right using a 
#		 circular shift.
#	LCS    - Takes user input parameter and returns the value shifted left using a 
#		 circular shift.
#	Print  - Prints shifted value.
#	PBit   - Prints the BIT value.
#	Space  - Prints a new line.
#	Exit   - Exits the program.


# subprogram:	Prompt
# author:	Samantha Lavrinc
# purpose:	Prompts the user to enter an integer and returns it to the calling program.
# input: 	none
# output:	$s0 = userInput value
.text
Prompt:
li $v0, 4		# print prompttext
la $a0, prompttext
syscall
li $v0, 5		# read int stored at $v0
syscall
move $s0, $v0		# save input as $s0
jr $ra

.data
prompttext: .asciiz "Enter an integer to test shift operations: "

# subprogram:	Mult10
# author:	Samantha Lavrinc
# purpose:	To multiply input by 10 using only shift and add operations.
# input: 	$s0 = userInput value = (x)
# output:	$s1 = mult10
# shifted vals: (x<<3) + (x<<1)
.text
Mult10:
la $s7, ($ra)		# save $ra to hold main return address @Mult10
sll $t1, $s0, 3		# $t1 = (x<<3)
sll $t3, $s0, 1		# $t3 = (x<<1)
add $s1, $t1, $t3	# $s1 = (x<<3) + (x<<1)
li $v0, 4		# print mult10r
la $a0, mult10r
syscall
jal Print

.data
mult10r: .asciiz "a. Mult10 = "

# subprogram:	RCS
# author:	Samantha Lavrinc
# purpose:	Takes user input parameter and returns the value shifted right using a 
#		circular shift.
# input: 	$s0 = userInput
# output:	$s1 = RCS, $s2 = bit
.text
RCS:
la $s7, ($ra)		# save $ra to hold main return address @RCS
ror $s1, $s0, 1
add $s2, $s1, $zero     # saved to $s2 to enable correct input/output for PBit
li $v0, 4		# print RCSr
la $a0, RCSr
syscall
jal Print

.data
RCSr: .asciiz "b. RightCircularShift = "

# subprogram:	LCS
# author:	Samantha Lavrinc
# purpose:	Takes user input parameter and returns the value shifted left using a 
#		circular shift.
# input: 	$s0 = userInput
# output:	$s1 = LCS, $s2 = bit
.text
LCS:
la $s7, ($ra)		# save $ra to hold main return address @LCS
srl $s1, $s0, 31	# shift $s0 right by 31 and store res in $s1
sll $s2, $s0, 1		# shift $s0 left by 1 and store res in $s2. $s2 = bits shifted
or $s1, $s2, $s1	# bitwise $s1 and $s2 and store res in $s1
li $v0, 4		# print LCSr
la $a0, LCSr
syscall
jal Print

.data
LCSr: .asciiz "c. LeftCircularShift = "

# subprogram:	Print
# author:	Samantha Lavrinc
# purpose:	To print resulting integer.
# input: 	$s1 = valueToPrint
# output:	$ra = $s7
# side effects: prints integer
.text
Print:
move $a0, $s1
li $v0, 1
syscall
la $ra, ($s7)	# load main address into $ra
jr $ra

# subprogram:	PBit
# author:	Samantha Lavrinc
# purpose:	To print resulting bit value.
# input: 	$s2 = valueToPrint
# output:	None
# side effects: prints shifted bit value.
.text
PBit:
li $v0, 4
la $a0, sbits
syscall
bge $s2, $zero, BIT0 # jump to BIT0 if $t1 <= 0
bge $zero, $s2, BIT1 # jump to BIT1 if $t1 => 0

BIT1:
li $v0, 4
la $a0, bitres1
syscall
j return

BIT0:
li $v0, 4
la $a0, bitres0
syscall
j return

return: 
jr $ra

.data
sbits: .asciiz "   Shifted Bit = "
bitres1: .asciiz "1"
bitres0: .asciiz "0"

# subprogram: 	Space (formerly PrintNewLine)
# author: 	Charles Kann
# purpose: 	to output a new line to the user console
# input: 	None
# output: 	None
# side effects: A new line character is printed to the
# 		user's console
.text
Space:
 li $v0, 4
 la $a0, __PNL_newline
 syscall
 jr $ra
.data
 __PNL_newline: .asciiz "\n"
 
# subprogram: 	Exit
# author: 	Charles Kann
# purpose: 	to use syscall service 10 to exit a program
# input: 	None
# output: 	None
# side effects: The program is exited
.text
Exit:
 li $v0, 10
 syscall