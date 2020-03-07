#clayton heathscott - counting-main.asm
#Parker Trussell - lab partner
#parker - counting-occur.asm

.data
Sringenter: .asciiz "Please enter a string: "
array: .space 600
charsearch: .asciiz "Please enter a character to search for: "
search_string: .asciiz "Search string = "
foundchar: .asciiz "We found the character "
foundchar2: .asciiz " times."
num_of_occurences: .word 0


.text
la $a0, Sringenter
jal PrintString
li $v0, 8
la $a1, array
syscall
la $a0, array

la $a0, charsearch
jal PrintString
li $v0, 12
syscall
move $a1, $v0

jal CoutOccur




jal Exit
















.include "Heathscott-Clayton-Utils.asm"
.include "count-occur.asm"
