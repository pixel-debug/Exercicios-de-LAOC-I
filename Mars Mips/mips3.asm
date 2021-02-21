.data
# matriz quadrada 2x2
array: .word 30, 1, 0 # primeira linha
	.word 2, 5, 4	# segunda linha
	.word 1, 2, 1
size: .word 3
    
.text
	main:
    	la $a0, array # carregar o endereço base
        lw $a1, size
        jal sumDiagonal 
        move $a0, $v0   # coloca o valor de v0, que é a soma em a0
        
        li $v0,1	# printa esse inteiro, a0
        syscall
        # termina o programa
        li $v0,10
        syscall
        
    sumDiagonal:
    	li $v0,0 # soma = 0
        li $t0,0 # t0 = i
        sumLoop:

        	
        	add $t1, $t0, $t0        # t1 = index da linha * numeroColuna
        	add $t1, $t1, $t0
        	
            	add $t1, $t1, $t0	#t1 = $t1 + index da coluna(t0)
            	
            	# t1 x 4		
            	add $t1, $t1, $t1
            	add $t1, $t1, $t1
            	
            	add $t1, $t1, $a0	# endereço
            	
            	lb $t2, 0($t1)
            	add $v0, $v0,$t2	# soma = soma + m[i][i]

            	
            	add $t0, $t0,1		# itera index t0
            	
            	blt $t0, $a1, sumLoop	# se index é menor que size, volta
          
     jr $ra
