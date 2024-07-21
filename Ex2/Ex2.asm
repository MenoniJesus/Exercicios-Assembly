.data 

vetor: .word 9 6 3

.text

li $t0, 0 #i
li $t1, 3 #n
la $t2, vetor
la $t3, 0

	loop: 
	bge $t0, $t1 exit_loop
	lw $t4, ($t2)
	add $t3, $t3, $t4
	add $t2, $t2, 4
	add $t0, $t0, 1
	b loop
	
	exit_loop:
	add $v0, $zero, 1
	move $a0, $t3
	syscall