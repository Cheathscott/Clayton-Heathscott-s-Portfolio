#program 3.4
#calculates the results of 
# 5*x^ + 2*x + 3

.text
main:
#get input value, x
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $s0, $v0

#calculate the result of 5*x*x + 2* x
mul $t0, $s0, $s0
mul $t0, $t0, 5
mul $t1, $s0, 2
add $t0, $t0, $t1
addi $s1, $t0, 3

#print output
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $s1
syscall

#exit program
li $v0, 10
syscall

.data
prompt: .asciiz "Enter a value for x: "
result: .asciiz "The result is: "

