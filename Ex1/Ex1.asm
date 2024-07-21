.data

.text

main:
	li $t0, 0  # i = 0
	li $t1, 5  # n = 5
	li $t2, 0  # soma = 0
	
	# while (i <= n)

loop:
	bgt $t0, $t1, end_loop
	add $t2, $t2, $t0  #soma += i
	add $t0, $t0, 1
	b loop
	
end_loop:	
	li $v0, 1 
	move $a0, $t2
	syscall
