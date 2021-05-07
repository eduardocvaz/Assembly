	.data
str1:	.asciiz "Digite o valor de x: \n"
str2:	.asciiz "i:"
str3:	.asciiz "\n"

	.text
	.globl main

main:
	#X=0 i=0
	li $t0, 0
	li $t1, 0
	
	#Imprimir str1
	la $a0, str1
	jal print_str
	
	#receber o numero do terminal
	jal read_int
	move $t1, $v0
	
loop:
	beq $t0, $t1, end # se t0 == x, o código acaba
	addi $t0, $t0, 1
	#Imprimir str2
	la $a0, str2
	jal print_str
	#Imprimir i
	la $a0, ($t0)
	jal print_int
	#Imprimir str3
	la $a0, str3
	jal print_str
	#voltando pro começo
	j loop
	
	
	
end:		
	#Encerrar
	li $v0, 10
	syscall
	
	
print_str:	#necessario passar o endereco da string para $a0 antes de chamar essa rotina
	li $v0, 4
	syscall
	jr $ra
	
print_int:	#necessario passar o valor do inteiro para $a0 antes de chamar essa rotina
	li $v0, 1
	syscall
	jr $ra
	
read_int:
	li $v0, 5
	syscall
	jr $ra
