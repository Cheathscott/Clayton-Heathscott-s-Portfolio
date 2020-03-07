.text
# Parameters #
#	$a0 - string to search
#	$a1 - character to search for

# return #
#	#v0 - number of occurences
CoutOccur:

	move $t3,$a0
	li $t2,0
	
	start_loop:
	add $t0,$t2,$t3
	lb $t1,($t0) #load byte
	beq $t1,$zero,end_loop
	bne $t1,$a1,skipIncrement
	addi $t2,$t2,1 #Increment
	
	skipIncrement:
		j start_loop
	
	end_loop:
		move $v0,$t2
		jr $ra
