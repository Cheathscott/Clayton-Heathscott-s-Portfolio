.text

li $t0, 0              # index of array
li $t1, 3              # size of the arrays
la $s0, myCharArray    # load location of myArray into $s0

start_loop:
    	bge $t0,$t1,exit_loop
        
        # Contents of for loop here
        li $t2,0               # initialize postion in the array
        mul $t2,$t0,1          # calculate the how far into array to go (index*1)       
        add $t2,$t2,$s0        # set memory location of element in the array
 
	lb $s3,($t2)           # load the value in myArray[index] into $s3
	
	# Print the character 
	la $a0,($s3)
	li $v0,11
	syscall 
	# Print a new line
	jal PrintNewLine
	
	#End of for loop here
    	addi $t0,$t0,1
    	j start_loop
exit_loop:               
	jal Exit
.data
myCharArray: .asciiz  "abc"
.include "utils.asm"



	
	
