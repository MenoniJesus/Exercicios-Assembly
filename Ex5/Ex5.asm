.data

vetor1: .space 400 # espaço para 100 palavras

.text

li $t0, 1 #i
li $t1, 100 #n
la $t2, vetor1

loop:
    bge $t0, $t1, exit_loop
    mul $t4, $t0, $t0
    sw $t4, 0($t2)

    add $v0, $zero, 1
    move $a0, $t0
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    li $a0, 45
    li $v0, 11
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    add $v0, $zero, 1
    move $a0, $t4
    syscall

    li $a0, 10
    li $v0, 11
    syscall

    add $t0, $t0, 1
    add $t2, $t2, 4
j loop


exit_loop:
    li $v0, 10
    syscall
