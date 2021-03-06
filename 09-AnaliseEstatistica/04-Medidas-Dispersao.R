


# Medidas de Dispersão - Desvio Padr�o e Vari�ncia



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()



# Desvio Padr�o

# O desvio padr�o indica o grau de varia��o de um conjunto de dados, este conjunto pode ser amostral ou populacional.

# Para um conjunto amostral o desvio padr�o � dado pelo somat�rio da raiz quadrada do quadrado da diferen�a entre 
# o valor do dado coletado (xi) e o valor m�dio (x), dividido pelo tamanho amostral menos um (n-1).



# Exemplo: Um engenheiro precisa decidir entre tr�s modelos de m�quinas de corte de alta precis�o,
# para isso ele usa como crit�rio o desvio padr�o. A m�quina que tiver menor desvio ser� a escolhida por ele. 
# A partir dos dados de medida de corte das 3 m�quinas, determine qual deve ser a escolhida pelo engenheiro. 
# M�quina 1 (mm) = (181.9, 180.8, 181.9, 180.2, 181.4). 
# M�quina 2 (mm) = (180.1, 181.8, 181.5, 181.2, 182.4). 
# M�quina 3 (mm) = (182.1, 183.7, 182.1, 180.2, 181.9).

Maq1 = c(181.9, 180.8, 181.9, 180.2, 181.4)
Maq2 = c(180.1, 181.8, 181.5, 181.2, 182.4)
Maq3 = c(182.1, 183.7, 182.1, 180.2, 181.9)

mean(Maq1)
mean(Maq2)
mean(Maq3)

sd(Maq1) 
sd(Maq2)
sd(Maq3)
# resposta desse ex, a m�quina que possui menor variabilidade. Essa m�quina ter� um n�vel maior de precis�o. (M�q 1)



# OBS: valores extremos afetam a m�dia
# sd calcula o qu�o distante os dados est�o da m�dia,
# isso ajuda a compreender como os dados est�o distribu�dos.

# ------------------------------------------------------------------------------



# Vari�ncia

# A vari�ncia tamb�m � um importante indicador de variabilidade dos dados. 
# Como a soma dos desvios sempre somar�o zero, � necess�rio usar uma medida de variabilidade que torne 
# os desvios negativos em valores n�o negativos, para que a soma dos desvios represente um valor 
# de variabilidade do conjunto de dados diferente de zero.


# A vari�ncia ent�o � o quadrado do desvio padr�o. 

# As medidas amostrais tem n-1 graus de liberdade. 

# Graus de liberdade � a diferença entre 
# a dimens�o da amostra (n) e a quantidade de par�metros a serem avaliados na popula��o. 

# No caso da vari�ncia amostral, � usada como refer�ncia a m�ia da amostra e isso tornaria o 
# valor da vari�ncia amostral menor do que o da vari�ncia populacional, devido aos valores 
# coletados estarem mais pr�ximos da m�dia amostral. 

# Para corrigir isso o divisor perde 1 grau de liberdade e quando se trata das medidas 
# amostrais utilizamos o n-1.

# C�lculo da vari�ncia para o exemplo anterior.

var(Maq1) 
var(Maq2)
var(Maq3)


# OBS: Tb mostra a variabilidade dos dados.   


# FIM 





