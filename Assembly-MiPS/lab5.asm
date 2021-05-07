	.data
str1:	.asciiz "Digite o numero A: "
str2:	.asciiz "Digite o numero B: "
str3:	.asciiz "A>B"
str4:	.asciiz "A<=B"

	.text
	.globl main

main:
	#Imprimir str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Imprimir str2
	li $v0, 4
	la $a0, str2
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t1, $v0
	
	slt $s1 $t1 $t0
	bne $s1 $zero Else
	#Imprime A<=B
	li $v0, 4
	la $a0, str4
	syscall
	j Exit
	
	#Imprime A>B
Else:
	li $v0, 4
	la $a0, str3
	syscall
	
Exit:
	#Encerrar
	li $v0, 10
	syscall
