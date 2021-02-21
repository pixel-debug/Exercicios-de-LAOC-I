######_PROGETTO ARCHITETTURA DEGLI ELABORATORI II CALCOLO DEL DETERMINANTE DI UNA MATRICE DI ORDINE <=4 UTILIZZANDO IL TEOREMA DI LAPLACE_######
.data
intro: .asciiz "Calcolo della determinante di una matrice di ordine <= 4 con il teorema di Laplace"
arrivederci: .asciiz "\n\nUscita \nCreato da Alessandro Persiano"

ordine_matrice: .asciiz "\nInserisci l'ordine della matrice (max 4): "
riga_n: .asciiz "\nRiga numero "
acapo: .asciiz "\n"
infreccia: .asciiz "= "
init_m: .asciiz "m["
fine_m_zero: .asciiz "][0]"
sottomat: .asciiz "\n\nEstrazione sottomatrice rispetto l'elemento in posizione: "
caporiga: .asciiz "\nNumero caporiga: "
complemento_algebrico: .asciiz "\nComplemento algebrico: "
det: .asciiz "\n\nIl determinate della matrice e': "

.align 2
matrice: .word 2, 3, 4 , 5
size: .word 2,2
.text
.globl main

main:
				#sposto il contenuto di $v0,contenente il determinante della matrice, in $t0
					
	
    	la $a0, matrice # carregar o endereço base
        lw $a1, size
        jal laplace 
        move $a0, $v0  # copio o valor de a0 pra v0, v0 = soma
        
        li $v0,1
        syscall
        #printa
        li $v0,10
        syscall

	
laplace: 				#ordine matrice = 2
					#determinante = m[0][0]*m[1][1]-m[0][1]*m[1][0];
  	lw $t0,0($a1)			#$t0 = m[0][0]	
 	lw $t1,4($a1)			#$t1 = m[0][1]
	lw $t2,8($a1)			#$t2 = m[1][0]	
 	lw $t3,12($a1)			#$t3 = m[1][1]
 	
 	mul $t4,$t0,$t3			# $t4 = $t0 * $t3 ; $t4 = m[0][0]*m[1][1]
 	mul $t5,$t1,$t2			# $t5 = $t0 * $t3 ; $t5 = m[0][1]*m[1][0]
 	sub $t0,$t4,$t5			# $t0 = $t4 - $t5
 				
	move $v0,$t0			#$v0 = $t0 ; $t0 = determinante calcolato
	j fine				#goto(fine)
	
fine:
		
	lw $ra,0($sp)			#Recupero il return address dallo stack pointer
	add $sp,$sp,4			#Alzo lo stack pointer di 4 byte
	jr $ra				#Jump register return adress
## FINE PROCEDURA LAPLACE
