.data

.text

li $t0, 0 #i 
li $t1, 7 #n 
li $t2, 0 #soma

loop:
	bge $t0, $t1, exit_loop
	add $t2, $t2, $t0
	add $t0, $t0, 1
j loop

exit_loop:
	li $v0, 1
	add $a0, $t2, $zero
	syscall