


# Medidas de Tend�ncia Central - M�dia e Mediana



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# Medidas de Tend�ncia Central : As medidas de tendncia central s�o valores 
#representativos da distribui��o em torno da qual as outras medidas se distribuem.
# As mais utilizadas: a m�dia aritm�tica e a mediana.


# M�dia 

# Exemplo: 
notas = c(6.4, 7.3, 9.8, 7.3, 7.9, 8.2, 9.1, 5.6, 8.5, 6.8) 
notas
?mean
mean(notas)  
print(mean(notas))


##### Mediana #####

# A mediana � uma medida alternativa � m�dia aritm�tica para representar o centro 
# da distribui��o, muito usada em estat�stica descritiva. 

# A mediana de um conjunto de medidas (x1, x2, x3, ..., xn) � um valor M tal que 
# pelo menos 50% das medidas s�o menores ou iguais a M e pelo menos 50% das medidas 
# s�o maiores ou iguais a M. 

# Resumindo, 50% das medidas ficam abaixo da mediana e 50% acima.



# Se o n�mero de elementos for �mpar, a mediana � o elemento do meio: n / 2

# Se o n�mero de elementos for par, a mediana ainda � o elemento do meio, 
# mas calculado assim: (n + 1) / 2


# Exemplo: Os dados da lista abaixo s�o tempos de vida (em dias) de 8 l�mpadas. 
# Calcule a m�ia e a mediana.
tempos = c(400, 350, 510, 550, 690, 720, 750, 2000)
mean(tempos)
?median
median(tempos) 


# OBS
# Media: remover os valores NA, pois afeta a mediana

# Fim







