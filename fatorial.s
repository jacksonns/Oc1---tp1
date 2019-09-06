.data
	n:	.word 3  #entrada do usuario
    
.text
main:
	lw x10, n  	 #carrega o input
	jal fat   	  #chama fatorial
    addi x10, x0, 1 	 #faz ecall ser a saida
    ecall       	 #saida
    jal exit    	#sai do programa
    
fat:
	slt x11, x10, x0		    	 # 0!=1 
	beq x11, x0, continua1       #continua 
	addi x11,x0, -1			   #-1 para negativos
	jr x1                         
    
continua1:
	slti x11, x10, 2					# 1!=1
	beq x11, x0, continua2      #vai para o fatorial normal
	jr x1
    
continua2:
	addi sp, sp, -8			# cria espaço para 2 numeros na pilha
	sw x1, 4(sp)		    # empilha x1
	sw x10, 0(sp)			# empilha x10

	addi x10, x10, -1       #subtrai 1 de x10
	jal fat					# chamada recursiva

	lw x10, 0(sp)				# desempilha x10
	lw x1, 4(sp)				# desempilha x1
	addi sp, sp, 8			# restaura a pilha

	mul x11, x10, x11      #faz a multiplicacao
 
	jalr x0, 0(x1)
    
exit:
