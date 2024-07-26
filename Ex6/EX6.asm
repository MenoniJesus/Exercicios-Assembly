.data 

vetor1: .word 4 5 6 3 9 8 1 2
tam: .word 8
textinho: .asciiz "O maior numero é: "

.text

li $t0, 0 #i
lw $t1, tam #n
la $t2, vetor1
lw $t5, ($t2)

loop: 
	bge $t0, $t1, exit_loop
	lw $t4 ($t2)
	bgt $t4, $t5, trocaValor
	add $t0, $t0, 1
	add $t2, $t2, 4
j loop

trocaValor:
	move $t5, $t4
	add $t0, $t0, 1
	add $t2, $t2, 4
j loop

exit_loop:
	li $v0, 4
	la $a0, textinho
	syscall
	
	li $v0, 1
	add $a0, $t5, $zero
	syscall
