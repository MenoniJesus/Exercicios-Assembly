.data 

vetor1: .word 0 0 0 0 0 0 0 0 0 0
barrinha: .asciiz " - "
pulaLinha: .asciiz "\n"
tam: .word 10

.text

li $t0, 1 #i
lw $t1, tam #n
la $t2, vetor1
li $t4, 0 #mul

.text

loop:
	bge $t0, $t1, exit_loop
	mul $t4, $t0, $t0
	sw $t4 ($t2)
	add $t2, $t2, 4
	add $t0, $t0, 1
j loop

exit_loop:
	li $t0, 1
	la $t2, vetor1
	
start_print:
	bge $t0, $t1, end_print
	lw $t3, ($t2)
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, barrinha
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	add $t2, $t2, 4
	add $t0, $t0, 1
j start_print

end_print:
