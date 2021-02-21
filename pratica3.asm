# Demonstração de algumas instruções MIPS simples

	# Declara main como uma função global
	.globl main

	# Todo o código do programa é colocado após a diretiva .text
	.text

# O label 'main' representa o ponto de início
main:
  li $t0, 2344          	# Insere valor 2433 no registrador t0
  j Loop
Loop:
  
  beq $t0, 1, Exit            	# desvia para Exit se t0 = 1
  slti $t1, $t0, 81     	# $t1 = 1 se t0 <=80
  beq $t1,$zero, If_1  		# se t0 < 80, vai para primeira condicional
  bne $t1, $zero, If_2	
  
If_1:
  subi $t0,$t0, 2       	# t0 - 2
  j Loop          		# desvia para Loop

If_2:
  srl $t0,$t0, 2       		# t0 / 4
  j Loop          		# desvia para Loop
Exit:
