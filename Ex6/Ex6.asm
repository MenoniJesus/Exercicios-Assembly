.data
#definir vetor e seus elementos
vetor1: 2 5 3 9 7 4 8 1

.text
li $t0, 0 #i
li $t1, 8 #n
li $t2, 0 #maior valor
la $t3, vetor1

loop:
bge $t0, $t1, exit_loop
lw $t4, 0($t3)
bge $t2, $t4, continua_loop
move $t2, $t4
j loop

continua_loop:
add $t0, $t0, 1
add $t3, $t3, 4
j loop

exit_loop:
add $v0, $zero, 1
move $a0, $t2
syscall