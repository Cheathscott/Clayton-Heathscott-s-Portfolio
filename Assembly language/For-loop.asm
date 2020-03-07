#for loop lecture 12

.text
#step 1: initialize counter and ending values
la $a0, prompt
jal PromptInt
move $s1, $v0
#$s1 = n
li $s0, 0   #$s0 = I
li $s2, 0  #$s2 = sum or total

#step 2: create start and end labels
start_loop:
	#step 3: implement or check to continue or stop the loop
	sle $t1, $s0, $s1
	beqz $t1, end_loop
	
	#step 5: implement the code block
	add $s2, $s2, $s0  # sum + I
	
	#step 4: implement counter and loop
	addi $s0, $s0, 1
	j start_loop


end_loop:

#print the sum
la $a0, output
move $a1, $s2
jal PrintInt

j Exit

.data
prompt: .asciiz "\Enter the value to calculate the sum up to: "
output: .asciiz "The sum is: "
.include "utils.asm"