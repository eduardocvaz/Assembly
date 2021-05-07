	.data
str1:	.asciiz "Digite o numero: "
str3:	.asciiz "Resultado: "

	.text
	.globl main

main:
	#Imprimir str1
	la $a0, str1
	jal print_str
	#receber o numero do terminal
	jal read_int
	move $s0, $v0 #x
	addi $s0 $s0 1 #x+1 para não atrapalhar o loop
	li $s1, 1 #r
	li $s2, 2 #d
	li $s3, 4 #s
	li $t0, 0 #t
	
loop:
	bne $t0, $zero, end #finaliza se t for 0
	addi $s1 $s1 1 #r+1
	addi $s2 $s2 2 #d+2
	add $s3 $s3 $s2 #s+d
	addi $s3 $s3 1#s+1
	slt $t2 $s3 $s0 #compara se r é maior
	bne $t2, $zero, loop # volta pro loop se for o caso
end:		
	la $a0, str3
	jal print_str
	
	la $a0, ($s1)
	jal print_int
	#Encerrar
	li $v0, 10
	syscall	
print_str:	#necessario passar o endereco da string para $a0 antes des chamar essa rotina
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
