.data

vetor1: .word 9 8 7 1 2 3 4 5 6
inicio: .asciiz "["
espaco: .asciiz " "
final: .asciiz "]"

.text

li $t0, 0 #i
li $t1, 0 #j
li $t2, 9 #n
la $t3, 0 #endereco i
la $t4, 0 #endereco min
la $t5, 0 #endereco j
li $t7, 0 #num[j]
li $t8, 0 #nun[min]
li $t9, 0 #min

main_loop:
    bge $t0, $t2, exit_loop
    move $t9, $t0           
    add $t1, $t0, 1          

secondary_loop:
    bge $t1, $t2, check      
    mul $t6, $t1, 4          
    la $t5, vetor1          
    add $t5, $t5, $t6        
    lw $t7, ($t5)            

    mul $t6, $t9, 4          
    la $t4, vetor1           
    add $t4, $t4, $t6        
    lw $t8, ($t4)            

    blt $t7, $t8, update_min 
j continue_secondary

update_min:
    move $t9, $t1            

continue_secondary:
    add $t1, $t1, 1         
j secondary_loop

check:
    beq $t0, $t9, next

    mul $t6, $t0, 4          
    la $t3, vetor1           
    add $t3, $t3, $t6        
    lw $t8, ($t3)            

    mul $t6, $t9, 4          
    la $t4, vetor1          
    add $t4, $t4, $t6        
    lw $t7, ($t4)           

    sw $t7, ($t3)            
    sw $t8, ($t4)            

next:
    add $t0, $t0, 1
j main_loop

exit_loop:
    li $t0, 0
    la $t3, vetor1
    
    li $v0, 4
    la $a0, inicio
    syscall

start_print:
    bge $t0, $t2, end_print
    lw $t4, ($t3)
    
    li $v0, 1
    move $a0, $t4
    syscall
    
    add $t0, $t0, 1
    add $t3, $t3, 4
    
    bge $t0, $t2, start_print
    li $v0, 4
    la $a0, espaco
    syscall
j start_print

end_print:
    li $v0, 4
    la $a0, final
    syscall