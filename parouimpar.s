.data
num: .word 11    #entrada do usuário

.text
main:
  lw x6, num      #carrega o input
 	addi x5, x5, 2   #declara x5 com o valor 2
	rem x10, x6, x5  #x10 recebe x6 mod x5
  addi x11, x10, 0 #x11 recebe o valor de saída
  addi x10, x0, 1
  ecall            #saída
