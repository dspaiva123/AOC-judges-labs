# Nome: Daniel de Souza Paiva - RA: 140260
# UC: AOC 2021_2 - PROF.: CAPPABIANCO

# LAB 01_Data_Atual


#data segment contendo as Strings de Entrada e Saida:
.data
    msg1:   .asciiz "Entre com o mes (MM): \n"
    msg1erro:   .asciiz "Mes invalido.\n"
    msg2:   .asciiz "Entre com o dia (DD): \n"
    msg2erro:   .asciiz "Dia invalido.\n"
    msg3:   .asciiz "Entre com o ano (AAAA): \n"
    msg3erro:   .asciiz "Ano invalido.\n"
    msg4:   .asciiz "\nData Atual: "
    barra:  .asciiz "/"

# Start text segment
.text
.globl main

main: 
	lerMes:
        #Pedindo que o usuario digite o mes
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg1 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        #Lendo o input
        li $v0, 5 #carregando instrucao para leitura do input
        syscall #lendo
        move $t0, $v0 #armazenando o mes em $t0

        blt $t0,1,mesInvalido #mes < 1
        bgt $t0,12,mesInvalido #mes >12
        j lerDia #pass, ler o dia agora

    mesInvalido:
        #Imprimindo mensagem de mes invalido
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg1erro #carregando o endereco do erro do mes
        syscall #imprimindo
        j lerMes #voltando ao loop do mes

    #Loop while ate ler um dia valido:
    lerDia:  
        #Pedindo que o usuario digite o dia
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg2 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        #Lendo o input
        li $v0, 5 #carregando instrucao para leitura do input
        syscall #lendo
        move $t1, $v0 #armazenando o dia em $t1

        blt $t1,1,diaInvalido #dia < 1
        bgt $t1,31,diaInvalido #dia > 31
        j lerAno #pass, ler o ano agora

    diaInvalido:
        #Imprimindo mensagem de dia invalido
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg2erro #carregando o endereco do erro do dia
        syscall #imprimindo
        j lerDia #voltando ao loop do dia

    #Loop while ate ler um ano valido
    lerAno:  
        #Pedindo que o usuario digite o ano
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg3 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        #Lendo o input
        li $v0, 5 #carregando instrucao para leitura do input
        syscall #lendo
        move $t2, $v0 #armazenando o ano em $t2

        blt $t2,1980,anoInvalido #ano < 1980
        bgt $t2,2050,anoInvalido #ano > 2050
        j Output #pass, imprimir Data Atual agora

    anoInvalido:
        #Imprimindo mensagem de ano invalido
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg3erro #carregando o endereco do erro do ano
        syscall #imprimindo
        j lerAno #voltando ao loop do ano            

    Output:
        #Imprimindo "Data Atual: "
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, msg4 #carregando o endereco da string a ser impressa
        syscall #imprimindo

        #Caso seja maior ou igual que 10, seguir para impressao normal
        bge $t0,10,imprimeMes
        #Se nao, imprimir 0 antes do valor
        li $v0, 1 #carregando instrucao para impressao de INT
        move $a0, $zero #carregando o 0 para ser impresso
        syscall #imprimindo

    imprimeMes:
        li $v0, 1 #carregando instrucao para impressao de int
        move $a0, $t0 #carregando o valor do mes
        syscall #imprimindo o mes

        #Imprimindo "/"
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, barra #carregando o endereco da string a ser impressa
        syscall #imprimindo a /
        
        #Caso seja maior ou igual que 10, seguir para impressao normal
        bge $t1,10,imprimeDia
        #Se nao, imprimir 0 antes do valor
        li $v0, 1 #carregando instrucao para impressao de INT
        move $a0, $zero #carregando o 0 para ser impresso
        syscall #imprimindo

    imprimeDia:
        li $v0, 1 #carregando instrucao para impressao de int
        move $a0, $t1 #carregando o valor do dia
        syscall #imprimindo o dia

        #Imprimindo "/"
        li $v0, 4 #carregando instrucao para impressao de string
        la $a0, barra #carregando o endereco da string a ser impressa
        syscall #imprimindo a /
    
    imprimeAno:
        li $v0, 1 #carregando instrucao para impressao de int
        move $a0, $t2 #carregando o valor do ano
        syscall #imprimindo o ano

    Exit:
        li $v0, 10	# code for program end
        syscall
        
# Codigo em C utilizado como base (elaborado por mim):        
# int main()
# {
#     int dia = 0, mes = 0, ano = 0;

#     while (mes < 1 || mes > 12)
#     {
#         printf("Entre com o mes (MM): ");
#         scanf("%d",&mes);
#         if(mes < 1 || mes > 12) printf("Mes invalido.\n");
#     }
#     while (dia < 1 || dia > 31)
#     {
#         printf("Entre com o dia (DD): ");
#         scanf("%d",&dia);
#         if(dia < 1 || dia > 31) printf("Dia invalido.\n");
#     }
#     while (ano < 1980 || ano > 2050)
#     {
#         printf("Entre com o ano (AAAA): ");
#         scanf("%d",&ano);
#         if(ano < 1980 || ano > 2050) printf("Ano invalido.\n");
#     }
    
#     printf("Data Atual: ");
#     if (mes < 10) printf("0");
#     printf("%d", mes);
#     printf("/");
#     if (dia < 10) printf("0");
#     printf("%d", dia);
#     printf("/");
#     printf("%d", ano);
#     return 0;
# }