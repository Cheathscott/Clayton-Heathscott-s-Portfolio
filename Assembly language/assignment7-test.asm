#Clayton Heathscott
#Assignment 6
#psudo code

#cout <<Enter a string to convert to lowercase;
#cin>> string;
#string = char[];
#int i = 0;
#int m = 0
# while (char[] != 0)
#{
#	if (char[i] < a || char[i] > z)
#	{
#		cout << char[i]
#	}
#	else
#	{
#		char[i] = char[i] + 20;
#		cout << char[i]
#		m++
#	}
#	
#	i++
#}
# cout << "The number of translations is " << m;

#cout <<Enter a string to convert to uppercase;
#cin>> string;
#string = char[];
#int i = 0;
#int m = 0
# while (char[] != 0)
#{
#	if (char[i] <=Z)
#	{
#		cout << char[i]
#	}
#	else
#	{
#		char[i] = char[i] - 20;
#		cout << char[i]
#		m++
#	}
#	
#	i++
#}
# cout << "The number of translations is " << m;



.data
StringEnter: .asciiz  "Enter a string to convert to lowercase: "
StringEnterUpper: .asciiz "\nEnter a string to convert to uppercase: "
convert_prompt: "The converted string is: "
Converted_Lower: .space 80
Converted_Upper: .asciiz " "
translations: .asciiz "The number of translation is: "
Num_of_Translations: .word 0
String_Length: .word 0 
lowerA: .word 0x61
lowerZ: .word 0x7a
UpperA: .word 0x41
UpperZ: .word 0x5a



.text
    la $a0, StringEnter  # Read and print first string
    li $a1, 80 #size you want
    jal PromptString #not from utils, scroll to the bottom


   move $a0,$v0     # Return value v0 is parm to PrintString
   la $a1, ($v0)
   #########
   jal tolower#
   #########
   sw $v0, Num_of_Translations
 move $a0, $a1
 #######
 jal strlen#
 #######
 sw $v0, String_Length
   
   li $v0, 4
   la $a0, convert_prompt
   syscall
   
   
   # Printing out the new lowercase array
   #################################################
   li $t0, 0
   lw $t1, String_Length
   start_loop1:
    	bge $t0,$t1,exit_loop1
        
        # Contents of for loop here
        li $t2,0               # initialize postion in the array
        mul $t2,$t0,1          # calculate the how far into array to go (index*1)       
        add $t2,$t2,$s0        # set memory location of element in the array
 
	lb $s3,($t2)           # load the value in myArray[index] into $s3
	
	# Print the character 
	la $a0,($s3)
	li $v0,11
	syscall 
	
	#End of for loop here
    	addi $t0,$t0,1
    	j start_loop1
exit_loop1:               
   #################################################
   
   
   
   #printing out the number of translations for tolower
   li $v0, 4
   la $a0, translations
   syscall
   li $v0 1
   lw $a0, Num_of_Translations
   syscall
 
   
   
   

   ##############################################################################################################
   
   
   
   
   
   #beggining of the toupper part of the program
   
   
    la $a0, StringEnterUpper  # Read and print first string
    li $a1, 80 #size you want
    jal PromptString #not from utils, scroll to the bottom


   move $a0,$v0     # Return value v0 is parm to PrintString
   la $a1, ($v0)
   jal toupper
   sw $v0, Num_of_Translations
 move $a0, $a1
 jal strlen
 sw $v0, String_Length
   li $t0, 0
   lw $t1, String_Length
   
   li $v0, 4
   la $a0, convert_prompt
   syscall
   #################################################
   start_loop3:
    	bge $t0,$t1,exit_loop3
        
        # Contents of for loop here
        li $t2,0               # initialize postion in the array
        mul $t2,$t0,1          # calculate the how far into array to go (index*1)       
        add $t2,$t2,$s0        # set memory location of element in the array
 
	lb $s3,($t2)           # load the value in myArray[index] into $s3
	
	# Print the character 
	la $a0,($s3)
	li $v0,11
	syscall 
	
	#End of for loop here
    	addi $t0,$t0,1
    	j start_loop3
exit_loop3:               
   #################################################
   li $v0, 4
   la $a0, translations
   syscall
   li $v0 1
   lw $a0, Num_of_Translations
   syscall
 
   
   
   jal Exit












#procedures

#################################################
# name - toupper
# description - convert a null terminated string to all uppercase
# inserts:
# $a0 - the memory location of the string 
# $a1 -  the memory address of the string
# outputs:
# $v0 - the number of characters that were translated
################################################
.text
toupper:
li $t0, 0 #counter
li $t5, 0 #counter for num of letters changed
la $s0, ($a0)

lb $t1, UpperA
lb $t3, UpperZ

lb $s4, ($s0)
start_loop:
    	blez $s4,exit_loop
        
        # Contents of for loop here
        li $t2,0               # initialize postion in the array
        mul $t2,$t0,1          # calculate the how far into array to go (index*1)       
        add $t2,$t2,$s0        # set memory location of element in the array
        
        # traverse same distance in second array
        li $t4, 0
        mul $t4, $t0, 1
        add $t4, $t4, $a1
 
	lb $s4,($t2)           # load the value in myArray[index] into $s3
	
	
	
ble $s4, $t3, next

xori $s3, $s4, 0x20

next:
beq $s3, 0x2a, exit_loop
beq $s4, 0x2a, exit_loop
ble $s4, $t3, print2


	# Print the character 
	#la $a0,($s3)
	#li $v0,11
	#syscall 
	sb $s3, ($t4)
	add $t5, $t5, 1
	j end_print_2
	
print2:
	
	sb $s4, ($t4)
end_print_2:

	#End of for loop here
    	addi $t0,$t0,1
    	
    	j start_loop
exit_loop:               
move $v0, $t5



jr $ra


#################################################
# name - tolower
# description - convert a null terminated string to all lowercase.
# inserts:
# $a0 - the memory location of the string 
# $a1 -  the memory address of the string
# outputs:
# $v0 - the number of characters that were translated
################################################
.text
tolower:
li $t0, 0 #counter
li $t5, 0 #counter for num of letters changed
la $s0, ($a0)

lb $t1, lowerA
lb $t3, lowerZ

lb $s4, ($s0)
start_loop2:
    	blez $s4,exit_loop2
        
        # Contents of for loop here
        li $t2,0               # initialize postion in the array
        mul $t2,$t0,1          # calculate the how far into array to go (index*1)       
        add $t2,$t2,$s0        # set memory location of element in the array
        
        # traverse same distance in second array
        li $t4, 0
        mul $t4, $t0, 1
        add $t4, $t4, $a1
 
	lb $s4,($t2)           # load the value in myArray[index] into $s3
	
	
	blt $t1, $s4 next1
bgt $s4, $t3, next1

ori $s3, $s4, 0x20

next1:
beq $s3, 0x2a, exit_loop2
beq $s4, 0x2a, exit_loop2
blt $t1, $s4, print3
bgt $s4, $t3, print3

	
	sb $s3, ($t4)
	add $t5, $t5, 1
	j end_print_3
	
print3:
	#la $a0, ($s4)
	#li $v0, 11
	#syscall
	sb $s4, ($t4)
end_print_3:

	#End of for loop here
    	addi $t0,$t0,1
    	
    	j start_loop2
exit_loop2:               
move $v0, $t5



jr $ra






##################################################
# Subprogram:     PromptString
#  Prompt for a string, allocate the string
#  and return the string to the calling subprogram. 
# Input:
#  $a0 - The prompt 
#  $a1 - The maximum size of the string# 
# Output:
#  $v0 - The address of the user entered string
##################################################
.text
PromptString: #this is the code for new
    addi $sp, $sp, -12         # Push stack
    sw $ra, 0($sp)            
    sw $a1, 4($sp) #size
    sw $s0, 8($sp)
    
    li $v0, 4                  # Print the prompt
    syscall                    # in the function, so we know $a0 still has
                               # the pointer to the prompt.

    li $v0, 9  #9-allocate memory                 # Allocate memory
    lw $a0, 4($sp)#-$a1 was the size
    syscall                   
    move $s0, $v0              # save return location of allocated memory
                             
    move $a0, $v0              # 
    li $v0, 8                  # 8- Read the string
    lw $a1, 4($sp)
    syscall
    
    move $v0,$s0
    # Return value already in $v0
    lw $ra, 0($sp)             # Pop stack
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra   


.include "Heathscott-Clayton-Utils.asm"

