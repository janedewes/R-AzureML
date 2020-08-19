#Operadores Básicos, Relacionais e lógicos em R

setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


##### Operadores Básicos #####
7 + 7 
7 - 4
5 * 5
6 / 6
3^2
#ou 
3**2
#módulo
16 %% 3



##### Operadores Relacionais #####

# Atribuindo variáveis (variavel = espaço na memória)
x = 7
y = 5

# operadores
x > 8
x < 8
x <= 8
x >= 8
x == 8
x != 8


##### Operadores Lógicos #####

# and
(x==8) & (x==6)
(x==7) & (x==5)
(x==8) & (x==5)

# or
(x==8) | (x==6)
(x==8) | (x>=5)

# not
x > 8
# ou para negação
print(!x > 8)



