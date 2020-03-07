.text
label1:
beqz $zero,label2 #if true jump 2 forward to label2
#if true then it will already be on the next instrustion before branching
addi $t0,$t1,10
beqz $zero,label1 #if true jump -3 backward to label 1
label2:
addi $t3, $t4, 10
