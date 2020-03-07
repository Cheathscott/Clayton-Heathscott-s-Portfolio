#program 2.2
#lecture 4
#program to read an integer and print back to consol
.text
#prompt for an integer
main:
li $v0, 4
la $a0, prompt
syscall
#read the integer and save it in $s0
li $v0, 5
move $s0, $v0
syscall

#request the integer
li $v0, 4
la $a0, output
syscall
#output the integer
li $v0, 1
move $a0, $s0
syscall
#exit the program

li $v0, 10
syscall

.data
prompt: .asciiz "Please enter an integer: "
output: .asciiz "\nYou typed the number "
