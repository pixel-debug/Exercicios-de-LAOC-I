
.data
vetor: 	.word   0 : 32		# array de 32 posições
array: 	.word 1, 2, 3, 4, 32, 43, 12, 98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   # inicializando array
size: 	.word  32     		# tamanho array
      	.text
         la $t0, array		# endereço do array
         la $t4, size		# tamanho do array
         lw $t4, 0($t4)		# primeiro elemento

loop:
         lw $t5,0($t1)        	# a[x]
      	 sub $t6,$t1,$t4        # t6 = posição memória
      	 div $t6,$t6,4        
       	 slt $t2,$t6,$a1        # x < y ?
      	 beq $t2,0,returno      # senão, quebra o loop e vai pra retorno
      	 add $t3, $t6, $a1      # a[x] = x+y 
      	 sw $t3,0($t1)       	# atualiza array
      	 addiu $t1,$t1,4       	# incrementa x
      	 j loop
      
returno:
      	subi $t1,$t1,1        	# decrementa x
      	lw $v0, 0($t1)        	# t4 = a[x-1]
      	jr $ra            	# retorna
      
cresceNoArray:     
      	sll $a0,$a0,2        
      	addu $t1,$t4,$a0       	# t1 = a0
      
main:
      	la $a0, 31        	# a0 = 31
      	la $a1, 34        	# a1 = 34
      	jal cresceNoArray            	
      	j Exit

Exit:
