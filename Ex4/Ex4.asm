 .data 

#definir vetor
vetor1: .word 2 3 4 6 8 6

.text
#coloca valor nos registradores
li $t0, 0 #i
li $t1, 6 #n
la $t2, vetor1
li $t3, 0 #soma
li $t4, 0 #cont maior
li $t5, 0 #cont menor

loop:
    #aqui ele vai passar somando todos os valores do vetor, apos isso ele redireciona para o "calculo_media"
    bge $t0, $t1, calculo_media
    lw $t6, 0($t2)
    add $t3, $t3, $t6
    add $t2, $t2, 4
    add $t0, $t0, 1
j loop

#aqui é calculado o valor da media
calculo_media:
    div $t3, $t3, $t1
    #retorno o valor de $t0 para 0 e coloco o $t2 para apontar para o inicio do vetor
    li $t0, 0
    la $t2, vetor1

defini_conts:
    #primeira validação referente ao vetor, segunda se o valor é menor que a media
    bge $t0, $t1, exit_loop
    lw $t6, 0($t2)
    slt $t7, $t6, $t3
    bne $t7, $zero, somadorMenor
    add $t4, $t4, 1
    add $t2, $t2, 4
    add $t0, $t0, 1
j defini_conts

somadorMenor:
    add $t5, $t5, 1
    add $t2, $t2, 4
    add $t0, $t0, 1
j defini_conts

#faço os prints dos dados, media e quantidade de valores acima e abaixo
exit_loop:
    #primeiro valor é a media
    add $v0, $zero, 1
    move $a0, $t3
    syscall

    #colocar espaço entre os numeros
    li $a0, 32
    li $v0, 11
    syscall

    #segundo valor é a quantidade de notas igual ou acima da media
    add $v0, $zero, 1
    move $a0, $t4
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    #terceiro valor é a quantidade de notas menor que a media
    add $v0, $zero, 1
    move $a0, $t5
    syscall
