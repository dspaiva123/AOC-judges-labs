# Nome: Daniel de Souza Paiva - RA: 140260
# UC: AOC 2021_2 - PROF.: CAPPABIANCO

# LAB 02_Mensagem_Criptografada

#Criptografia: 
#Ant -> Novo (Em ASCII)
#o,O -> 0 (111,79 -> 48)
#i,I -> 1 (105,73 -> 49)
#z,Z -> 2 (122,90 -> 50)
#e,E -> 3 (101,69 -> 51)
#a,A -> 4 (97,65 -> 52)
#s,S -> 5 (115,83 -> 53)
#g,G -> 6 (103,71 -> 54)
#t,T -> 7 (116,84 -> 55)
#b,B -> 8 (98,66 -> 56)
#p,P -> 9 (112,80 -> 57)
#0 -> O (48 -> 79)
#1 -> I (49 -> 73)
#2 -> Z (50 -> 90)
#3 -> E (51 -> 69)
#4 -> A (52 -> 65)
#5 -> S (53 -> 83)
#6 -> G (54 -> 71)
#7 -> T (55 -> 84)
#8 -> B (56 -> 66)
#9 -> P (57 -> 80)

#ASCII util:
#10 = \n

#data segment contendo as Strings de Entrada e Saida e declaracao dos vetores:
.data
    msgIn1:   .asciiz "Insira a mensagem: "
    msgOut1: .asciiz "Numero total de caracteres: "
    msgOut2: .asciiz "Mensagem criptografada: "
    enter: .byte 10 #\n

    msg: .space 200 #alocando o espaco na memoria referente ao tamanho do input
    
#text segment contendo o codigo
.text
.globl main #indicando a main
main: 
    lerMensagem:
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msgIn1 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        li $v0, 8 #instrucao para ler string
        la $a0, msg #onde ela sera armazenada
        la $a1, 200 #tamanho max a ser lido
        syscall

        move $s0, $zero #definindo $s0 como armazenador da pos atual da string e tambem sera do tamanho
        
    ################ INICIO DO LACO #######################
    loopCriptografia:
	lb  $t0, msg($s0) #armazenando o char da pos atual da string para ser avaliado
	beq $t0, 10, fimCriptografia #10 = \n
	
	#LETRAS:
	#caso: o,O -> 0 (111,79 -> 48)
	beq $t0, 111, casoO 
	beq $t0, 79, casoO
	#caso: i,I -> 1 (105,73 -> 49)
	beq $t0, 105, casoI
	beq $t0, 73, casoI
	#caso: z,Z -> 2 (122,90 -> 50)
	beq $t0, 122, casoZ
	beq $t0, 90, casoZ
	#caso: e,E -> 3 (101,69 -> 51)
	beq $t0, 101, casoE
	beq $t0, 69, casoE
	#caso: a,A -> 4 (97,65 -> 52)
	beq $t0, 97, casoA
	beq $t0, 65, casoA
	#caso: s,S -> 5 (115,83 -> 53)
	beq $t0, 115, casoS
	beq $t0, 83, casoS
	#caso: g,G -> 6 (103,71 -> 54)
	beq $t0, 103, casoG
	beq $t0, 71, casoG
	#caso: t,T -> 7 (116,84 -> 55)
	beq $t0, 116, casoT
	beq $t0, 84, casoT
	#caso: b,B -> 8 (98,66 -> 56)
	beq $t0, 98, casoB
	beq $t0, 66, casoB
	#caso: p,P -> 9 (112,80 -> 57)
	beq $t0, 112, casoP
	beq $t0, 80, casoP
	
	#NUMEROS:
	#caso: 0 -> O (48 -> 79)
	beq $t0, 48, caso0
	#caso: 1 -> I (49 -> 73)
	beq $t0, 49, caso1
	#caso: 2 -> Z (50 -> 90)
	beq $t0, 50, caso2
	#caso: 3 -> E (51 -> 69)
	beq $t0, 51, caso3
	#caso: 4 -> A (52 -> 65)
	beq $t0, 52, caso4
	#caso: 5 -> S (53 -> 83)
	beq $t0, 53, caso5
	#caso: 6 -> G (54 -> 71)
	beq $t0, 54, caso6
    	#caso: 7 -> T (55 -> 84)
	beq $t0, 55, caso7
    	#caso: 8 -> B (56 -> 66)
	beq $t0, 56, caso8
    	#caso: 9 -> P (57 -> 80)
	beq $t0, 57, caso9
	
	#MANTER:
	move $t1, $zero #$t1 armazena o char em ascii que substituira a pos atual

    substituir:
    	beqz $t1, proxPos #impedir que seja feita substituicao quando era pra manter
    	sb $t1, msg($s0) #substituindo msg na posicao atual pelo char em $t1
    	
    proxPos:
    	addi $s0, $s0, 1 #indo para a prox pos
	j loopCriptografia #voltando ao inicio do loop
	
    #Note que $t1 sera utilizado para armazenar o char que substituira a posicao atual da nossa string mensagem
    #CASOS LETRAS	
    casoO:
    	li $t1, 48 
    	j substituir
    casoI:
    	li $t1, 49 
    	j substituir
    casoZ:
    	li $t1, 50
    	j substituir
    casoE:
    	li $t1, 51
    	j substituir
    casoA:
    	li $t1, 52
    	j substituir
    casoS:
    	li $t1, 53
    	j substituir
    casoG:
    	li $t1, 54
    	j substituir
    casoT:
    	li $t1, 55
    	j substituir
    casoB:
    	li $t1, 56
    	j substituir
    casoP:
    	li $t1, 57
    	j substituir

    #CASOS NUMEROS:	
    caso0:
    	li $t1, 79 
    	j substituir
    caso1:
    	li $t1, 73 
    	j substituir
    caso2:
    	li $t1, 90
    	j substituir
    caso3:
    	li $t1, 69
    	j substituir
    caso4:
    	li $t1, 65
    	j substituir
    caso5:
    	li $t1, 83
    	j substituir
    caso6:
    	li $t1, 71
    	j substituir
    caso7:
    	li $t1, 84
    	j substituir
    caso8:
    	li $t1, 66
    	j substituir
    caso9:
    	li $t1, 80
    	j substituir
    
    ################ FIM DO LACO #######################
    fimCriptografia:
    	#imprimindo: "Numero total de caracteres: "
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msgOut1 #carregando o endereco da string a ser impressa
        syscall #imprimindo
    	
    	#o numero esta em $s0
    	li $v0, 1 #1 = instrucao de impressao de int
    	move $a0, $s0 #carregando o valor a ser impresso
    	syscall #imprimindo
	
	#pulando a linha
	li $v0, 11 #11 = instrucao de impressao de char
        li $a0, 10 #carregando o valor "\n" da tabela ascii
        syscall #imprimindo
	
	#imprimindo: "Mensagem criptografada: "
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msgOut2 #carregando o endereco da string a ser impressa
        syscall #imprimindo
    	
    	#imprimindo a mensagem criptografada 
    	li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg #carregando o endereco da string a ser impressa
        syscall #imprimindo
        
        #encerrando o programa
        li $v0, 10	#10 = exit
        syscall