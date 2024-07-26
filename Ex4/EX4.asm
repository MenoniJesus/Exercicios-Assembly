.data

vetor1: .word 6 4 8 6
media: .asciiz "A media é: "
menor: .asciiz "Abaixo da media: "
maior: .asciiz "Acima da media: "
pulaLinha: .asciiz "\n"

.text

li $t0, 0 #i
li $t1, 4 #n
la $t2, vetor1
li $t3, 0 #soma e posteriormente a media
li $t5, 0 #contador de maior ou igual a media
li $t6, 0 #contador de menor que a media

loop: 
	bge $t0, $t1, exit_loop
	lw $t4, ($t2)
	add $t3, $t3, $t4
	add $t2, $t2, 4
	add $t0, $t0, 1
j loop

exit_loop:
	div $t3, $t3, $t1
	li $t0, 0
	la $t2, vetor1

cont:
	bge $t0, $t1, print_loop
	lw $t4, ($t2)
	blt $t4, $t3, min
	add $t5, $t5, 1
	add $t0, $t0, 1
	add $t2, $t2, 4
j cont

min:
	add $t6, $t6, 1
 	add $t0, $t0, 1
 	add $t2, $t2, 4
j cont
 
print_loop:
	li $v0, 4
	la $a0, media
	syscall

	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	li $v0, 4
	la $a0, maior
	syscall
	
	li $v0, 1
	add $a0, $t5, $zero
	syscall
	
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	li $v0, 4
	la $a0, menor
	syscall
	
	li $v0, 1
	add $a0, $t6, $zero
	syscall