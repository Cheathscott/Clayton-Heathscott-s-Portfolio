#program 2.3
#lecture 4

.text
#prompt user for a string
li $v0, 4
la $a0, prompt
syscall
#read string
li $v0, 8
la $a0, input
la $a1, inputSize
syscall
#print the question
li $v0, 4
la $a0, output
syscall
#print the string the user inputed
li $v0, 4
la $a0, input
syscall

#how to exit a program
li $v0, 10
syscall

.data
input: .space 81
inputSize: .word 80
prompt: .asciiz  "Please enter a string: "
output: .asciiz  "\nYou typed the string: "
