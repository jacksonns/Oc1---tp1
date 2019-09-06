.data
vet1: .word 1,2,3    #vetor 1
vet2: .word 3,1,2    #vetor 2
num: .word 3         #numero de elementos
    
.text
main:
    la x12, vet1     #carrega vetor 1
    la x13, vet2    #carrega vetor 2
    lw x14, num     #recebe numero de elementos
    addi x5, x0, -1  #inicia contador 1 com -1
    addi x6, x0, -1  #inicia contador 2 com -1
    addi x11, x0, 0  #inicia a saida com 0
    jal loop1        #chama o primeiro loop
    addi x10, x0, 1  #faz o ecall ser a saida
    ecall            #saida
    jal exit         #encerra o programa
    
loop1:
    lw x8, 0(x12)      #carrega o primeiro valor do vet1
    addi x12, x12, 4   #incrementa a posicao do vet1
    addi x5, x5, 1     #adiciona o contador 
    blt x5, x14,loop2  #chama o loop2
    jalr x0, 0(x1)
    
loop2:
    lw x9, 0(x13)       #carrega o primeiro valor do vet2
    beq x8, x9, loop1   #volta pro loop1 caso encontre um valor igual
    addi x13, x13, 4    #incrementa a posicao do vet2
    addi x6, x6, 1      #incrementa contador
    blt x6, x14, loop2  #volta pro loop caso cont < num
    addi x11, x0, 1     #adiciona 1 na saida (x11)
    jalr x0, 0(x1)
    
exit:
