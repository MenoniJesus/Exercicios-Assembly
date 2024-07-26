.data 

vetor1: .word 3 4 9 2 5 6

.text

li $t0, 0 #i
li $t1, 6 #n
li $t2, 0 #soma
la $t3, vetor1

loop:
	bge $t0, $t1, exit_loop
	lw $t4, ($t3)
	add $t2, $t2, $t4
	add $t3, $t3, 4
	add $t0, $t0, 1
j loop

exit_loop:
	li $v0, 1
	add $a0, $t2, $zero
	syscall