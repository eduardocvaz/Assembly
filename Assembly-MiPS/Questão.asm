	.data
str1:	.asciiz "O resultado é:  "
str2:	.asciiz "Digite o primeiro numero: \n"
str3:	.asciiz "Digite o segundo numero:  \n"
str4:	.asciiz "\n"
	.text
	.globl main

main:
	#Imprimir str2
	li $v0, 4
	la $a0, str2
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Imprimir str3
	li $v0, 4
	la $a0, str3
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t1, $v0
	
	#soma e depois multiplica por 3 o resultado
	add $s0, $t0, $t1
	addi $t2,$zero,3
	mul $s1, $s0, $t2
	
	#Imprimir str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#Imprimir o 
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Imprimir \n
	li $v0, 4
	la $a0, str4
	syscall
	
	
	

