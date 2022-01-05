# Nome: Daniel de Souza Paiva - RA: 140260
# UC: AOC 2021_2 - PROF.: CAPPABIANCO

# LAB 01_Data_Atual


#data segment contendo as Strings de Entrada e Saida:
.data
    msg1:   .asciiz "Qual o seu nome?\n"
    ms2: .asciiz "Salve, "
    pulaLinha: .asciiz "\n"
    nome: .space 10
    charc: .byte 'a'
# Start text segment
.text
.globl main

main: 
    lerNome:
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg1 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        li $v0, 8
        la $a0, nome
        la $a1, 10
        syscall
        
        li $v0,5
	syscall
	move $t0, $v0
        
        lb $t1, charc
        sb $t1, nome($t0)
        
        li $v0, 4
        la $a0, ms2
        syscall
	
        li $v0, 4
        la $a0, nome
        syscall

        li $v0, 4
        la $a0, pulaLinha
        syscall 
	
        li $v0, 10	# code for program end
        syscall
        
