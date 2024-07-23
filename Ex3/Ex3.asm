.data

#define os vetores
vetor1: .word 6 5 4 3
vetor2: .word 8 9 6 9
vetor3: .word 0 0 0 0

.text

#coloca valor nos registradores
li $t0, 0 #i
li $t1, 4 #n 
la $t2, vetor1
la $t3, vetor2
la $t4, vetor3

loop:
	#faz uma validação, se falsa continua o codigo
	bge $t0, $t1, exit_loop
	
	#carrega os valores atuais
	lw $t6, 0($t2)
	lw $t7, 0($t3)
	
	#faz a soma e salva no vetor3
	add $t5, $t6, $t7
	sw $t5, 0($t4)
	
	#avança o valor do vetor
	add $t2, $t2, 4
	add $t3, $t3, 4
	add $t4, $t4, 4
	
	#faz i++
	add $t0, $t0, 1
	
	# volta para o loop
	j loop
	
exit_loop:
	li $t0, 0 # reinicia i
	la $t4, vetor3 # aponta t4 para o inicio de vetor3

print_loop:
	bge $t0, $t1, end_print # termina o loop de impressão
	
	lw $a0, 0($t4) # carrega o valor atual do vetor3 para $a0
	li $v0, 1
	syscall
	
	# Imprime espaço entre os números
	li $a0, 32
	li $v0, 11
	syscall
	
	add $t4, $t4, 4
	add $t0, $t0, 1
	j print_loop
	
end_print:
	li $v0, 10
	syscall
