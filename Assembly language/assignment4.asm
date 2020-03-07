.data
x: .word 10
   .word 15
   .word 7
   .word 8
   .word 0
.text
la $t0,x
# Direct access of x
lw $t1,0($t0)
