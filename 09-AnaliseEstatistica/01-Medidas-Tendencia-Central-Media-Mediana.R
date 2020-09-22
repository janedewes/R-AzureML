


# Medidas de Tendência Central - Média e Mediana



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# Medidas de Tendência Central : As medidas de tendncia central são valores 
#representativos da distribuição em torno da qual as outras medidas se distribuem.
# As mais utilizadas: a média aritmética e a mediana.


# Média 

# Exemplo: 
notas = c(6.4, 7.3, 9.8, 7.3, 7.9, 8.2, 9.1, 5.6, 8.5, 6.8) 
notas
?mean
mean(notas)  
print(mean(notas))


##### Mediana #####

# A mediana é uma medida alternativa à média aritmética para representar o centro 
# da distribuição, muito usada em estatística descritiva. 

# A mediana de um conjunto de medidas (x1, x2, x3, ..., xn) é um valor M tal que 
# pelo menos 50% das medidas são menores ou iguais a M e pelo menos 50% das medidas 
# são maiores ou iguais a M. 

# Resumindo, 50% das medidas ficam abaixo da mediana e 50% acima.



# Se o número de elementos for ímpar, a mediana é o elemento do meio: n / 2

# Se o número de elementos for par, a mediana ainda é o elemento do meio, 
# mas calculado assim: (n + 1) / 2


# Exemplo: Os dados da lista abaixo são tempos de vida (em dias) de 8 lâmpadas. 
# Calcule a méia e a mediana.
tempos = c(400, 350, 510, 550, 690, 720, 750, 2000)
mean(tempos)
?median
median(tempos) 


# OBS
# Media: remover os valores NA, pois afeta a mediana

# Fim







