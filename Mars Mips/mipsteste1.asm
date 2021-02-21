.data
vet:  .word   0 : 32		# array de 32 posições para o vetor vet
size: .word  32              
      .text
      la $t0, vet		# abre o endereço do array
      la $t5, size		# abre o tamanho do array
      lw $t5, 0($t5)		# abre o array
      
      li $t1, 1			# valor primeira posição
      sw $t1, 0($t5) 		#joga o valor na posiçao 0 em t5
      li $t1, 2			# valor segunda posição
      sw $t1, 4($t5) 		#joga o valor na posiçao 1 em t5
      li $t1, 3			# valor da posição
      sw $t1, 8($t5) 		#joga o valor na posiçao 2 em t5
      li $t1, 4			# valor da posição
      sw $t1, 12($t5) 		#joga o valor na posiçao 3 em t5
      li $t1, 32		# valor da posição
      sw $t1, 16($t5) 		#joga o valor na posiçao 4 em t5
      li $t1, 43		# valor da posição
      sw $t1, 20($t5) 		#joga o valor na posiçao 5 em t5
      li $t1, 12		# valor da posição
      sw $t1, 24($t5) 		#joga o valor na posiçao 6 em t5
      li $t1, 98		#valor da posição
      sw $t1, 28($t5) 		#joga o valor na posiçao 7 em t5

main:
      la $a0, 31        #guarda o valor 31 em a0
      la $a1, 34        #guarda o valor 34 em a1
      jal gxy            #chama a função
      j Exit

gxy:     
      sll $a0,$a0,2        #multiplica por 4
      addu $t2,$t5,$a0        #coloca o valor de a0 em t2

loop:
      lw $t6,0($t2)        #puxa o valor de i do vetor para consulta
      sub $t7,$t2,$t5        #variavel para resgatar a posição de memoria
      div $t7,$t7,4        #divide para comparar valor    
      slt $t3,$t7,$a1        #se i<y, t3=1
      beq $t3,0,return        #se i<y sai do for e entra no return
      add $t4, $t7, $a1        #adiciona i+y a a[i]
      sw $t4,0($t2)        #substitui o valor no vetor
      addiu $t2,$t2,4        #i++
      j loop
      
return:
      subi $t2,$t2,1        #i--
      lw $v0, 0($t2)        #joga em t5 o valor de a[i-1]
      jr $ra            #retorno

Exit: