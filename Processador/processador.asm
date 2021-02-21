.data
# matriz quadrada 2x2
matriz: .word 7, 3, 7, 3 # segunda linha
size: .word 4 

    
.text
	main:
    	la $a0, matriz # carregar o endereço base
        la $a1, size
        lw $a1, 0($a1)
        jal laplace 
        move $a0, $v0  # copio o valor de a0 pra v0, v0 = soma
        
        li $v0,1
        syscall
        #printa
        li $v0,10
        syscall

laplace: 				
					#determinante = m[0][0]*m[1][1]-m[0][1]*m[1][0];
     

	
  	lw $t0,0($a0)			#$t0 = m[0][0]	
 	lw $t1,4($a0)			#$t1 = m[0][1]
	lw $t2,8($a0)			#$t2 = m[1][0]	
 	lw $t3,12($a0)			#$t3 = m[1][1]
 	
 	mul $t4,$t0,$t3			# $t4 = $t0 * $t3 ; $t4 = m[0][0]*m[1][1]
 	mul $t5,$t1,$t2			# $t5 = $t0 * $t3 ; $t5 = m[0][1]*m[1][0]
 	sub $t0,$t4,$t5			# $t0 = $t4 - $t5
 				
	move $v0,$t0			
	jr $ra	
