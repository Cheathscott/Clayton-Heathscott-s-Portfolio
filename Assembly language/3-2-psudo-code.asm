#main {
#register int i = please enter the first value
#register int j = please enter the second value
#register int k = i + j
#print ("the result is " + k

.text
#register convention
#i is $s0
#j is $s1
#k is $s2


#register int i = please enter the first value
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5
syscall
#take value in v0 and store in s0
move $s0, $v0

#second prompt
li $v0, 4
la $a0, prompt2
syscall

li $v0, 5
syscall
#take value in v0 and store in s1
move $s1, $v0


#3rd prompt k
li $v0, 4
la $a0, output
syscall

li $v0, 1
move $a0, $s2
syscall

#exit
li $v0, 10
syscall

.data
prompt1: .asciiz "please enter the first value "
prompt2: .asciiz "please enter the second value "
output: .asciiz "The result is "