#celsius = (farenheit - 32.0) * 5.0/9.0

.data
celsius: .float 0
farenheit: .float 72.0
const1: .float 32.0
const2: .float 5.0
const3:.float 9.0
msg: .asciiz "Your temperature in celsius is "
newline: .asciiz "\n"

.text
lwc1 $f12, farenheit
lwc1, $f18, const1
lwc1, $f19, const2
lwc1, $f20, const3

div.s $f4, $f19, $f20 #5/9
sub.s $f0, $f12, $f18 #fah -32
mul.s $f0, $f0, $f4 #fah-32   * 5.0/9.0
#f0 holds final result
swc1 $f0, celsius

li $v0, 4
la $a0, msg
syscall

#print floating point
li $v0, 2
mov.s $f12, $f0
syscall


li $v0, 4
la $a0, newline
syscall

li $v0, 10
syscall