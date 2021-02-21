# Compute first twelve Fibonacci numbers and put in array, then print
      .data
vetor: .byte   0 : 32        # "array" de tamanho 31 inicializado com zero
elements:  .word 1, 2, 3, 4, 32, 43, 12, 98      # primeiros valores 

      .text
      la   $t0, vetor       # carrega o endereço do vetor em t0
      
      add $t1, $zero, $t2   # carrega em t1 o valor de x
      add $t3, $zero, $t4   # carrega em t3 o valor de y
      sub $t9, $t3, $t1     # contador do loop


loop: 
      add  $t7, $t1, $t3    # $t7 = t1 + t3
      sw   $t7, 8($t0)      # coloca t7 no a[x]
      addi $t0, $t0, 4      # incrementa o endereço do vetor
      
      addi $t9, $t9, 1     # incrementa loop
      bgtz $t9, loop        # repete se não chegou no fim
      
      
      la   $a0, vetor        # first argument for print (array)
      add  $a1, $zero, $t5  # second argument for print (size)
      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
		
#########  routine to print the numbers on one line. 

      .data
space:.asciiz  " "          # space to insert between numbers
head: .asciiz  "The Fibonacci numbers are:\n"
      .text
print:add  $t0, $zero, $a0  # starting address of array
      add  $t1, $zero, $a1  # initialize loop counter to array size
      la   $a0, head        # load address of print heading
      li   $v0, 4           # specify Print String service
      syscall               # print heading
out:  lw   $a0, 0($t0)      # load fibonacci number for syscall
      li   $v0, 1           # specify Print Integer service
      syscall               # print fibonacci number
      la   $a0, space       # load address of spacer for syscall
      li   $v0, 4           # specify Print String service
      syscall               # output string
      addi $t0, $t0, 4      # increment address
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, out         # repeat if not finished
      jr   $ra              # return
	
