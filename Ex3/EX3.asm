.data 

vetor1: .word 9 3 4 5 8 2
vetor2: .word 8 3 2 4 1 2
vetor3: .word 0 0 0 0 0 0 
tam: .word 6
espaco: .asciiz " "

.text

li $t0, 0 #i
lw $t1, tam #n
la $t2, vetor1
la $t3, vetor2
la $t4, vetor3
li $t7, 0 #soma

loop:
	bge $t0, $t1, exit_loop
	lw $t5, ($t2)
	lw $t6, ($t3)
	add $t7, $t5, $t6
	sw $t7, ($t4)
	add $t2, $t2, 4 
	add $t3, $t3, 4 
	add $t4, $t4, 4
	add $t0, $t0, 1
j loop

exit_loop:
	li $t0, 0 #reinicia o valor de i para 0
	la $t4, vetor3 #faz apontar para o começo do vetor

start_print:
	bge $t0, $t1, end_print
	lw $t7 ($t4)
	
	li $v0, 1
	add $a0, $t7, $zero
	syscall
	
	li $v0, 4
	la $a0, espaco
	syscall
	
	add $t4, $t4, 4
	add $t0, $t0, 1
	
j start_print

end_print:
	
