.data 
A:      .float  4.830
B:      .float  4.012
Amsg:   .asciiz "A < B\n"
Bmsg:   .asciiz "B < A\n"
EQmsg:  .asciiz "A and B are equal!\n"

.text
        # Load single precision to registers
        l.s     $f0,A
        l.s     $f2,B
        
        c.lt.s  0,$f0,$f2          # is A < B?  # compare, less than, single precision
        bc1t    0,printA           # yes:  print A
        
        c.lt.s  1,$f2,$f0          # is B < A?
        bc1t    1,printB           # yes:  print B

        la      $a0,EQmsg        # otherwise
        li      $v0,4            # they are equal
        syscall

        j exit

printA:
        la      $a0,Amsg      
        li      $v0,4 
        syscall          
        j exit

printB:
        la      $a0,Bmsg       
        li      $v0,4            
        syscall	

exit: 
		li $v0,10
		syscall
