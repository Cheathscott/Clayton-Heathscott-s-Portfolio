#program 3.3

.text
#.globl is not entirely necessary right now
.globl main
Main:

#Get input Value
#this line below is the same as
#li $v0, 4
addi $v0, $zero, 4
la $a0, prompt
syscall
addi $v0, $zero, 5
syscall
move $s0, $v0

#write prompt
#retrieve input
#check if odd or even
addi $t0, $zero, 2  #store 2 in $t0
div $t0, $s0, $t0   #Divide input by 2
mfhi $s1            # Save remainder in $s1

#print output
addi $v0, $zero, 4
la $a0, result      # Print result string
Syscall

addi $v0, $zero, 1
move $a0, $s1      #print result
Syscall

#exit program
addi $v0, $zero, 10
syscall

.data
prompt: .asciiz  "Enter your number: "
result: .asciiz "A result of 0 is even, 1 is odd: result = "
