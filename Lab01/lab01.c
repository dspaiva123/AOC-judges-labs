#include <stdio.h>
#include <stdlib.h>

int main()
{
    int dia = 0, mes = 0, ano = 0;

    while (mes < 1 || mes > 12)
    {
        printf("Entre com o mes (MM): ");
        scanf("%d",&mes);
        if(mes < 1 || mes > 12) printf("Mes invalido.\n");
    }
    while (dia < 1 || dia > 31)
    {
        printf("Entre com o dia (DD): ");
        scanf("%d",&dia);
        if(dia < 1 || dia > 31) printf("Dia invalido.\n");
    }
    while (ano < 1980 || ano > 2050)
    {
        printf("Entre com o ano (AAAA): ");
        scanf("%d",&ano);
        if(ano < 1980 || ano > 2050) printf("Ano invalido.\n");
    }
    
    printf("Data Atual: ");
    if (mes < 10) printf("0");
    printf("%d", mes);
    printf("/");
    if (dia < 10) printf("0");
    printf("%d", dia);
    printf("/");
    printf("%d", ano);
    return 0;
}