


# Interpretando um Histograma



# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# Histograma


# Um histograma ? um modelo de gr?fico que representa uma distribui??o de frequ?ncias 
# atrav?s de um agrupamento de classes, de forma que se pode contabilizar as ocorr?ncias dos 
# dados em cada classe. 


# Possibilita visualizar a distribui??o de medidas, a dispers?o, simetria dos dados e tend?ncias centrais.


# Os conceitos de Frequ?ncia Absoluta e Frequ?ncia Relativa s?o importantes na constru??o de um histograma. 


# Por frequ?ncia absoluta, entende-se o n?mero de observa??es correspondente a cada classe. 


# A frequ?ncia relativa, por sua vez, diz respeito ao quociente entre a frequ?ncia absoluta da classe 
# correspondente e a soma das frequ?ncias absolutas. 


# A soma das ?reas de todos os ret?ngulos do histograma deve ser igual a 1.


# Como fazer um histograma manualmente?

# 1- Ordenar os valores
# 2- Encontrar a amplitude total: A = xmax − xmin. Assim, os intervalos devem cobrir uma faixa de, no mínimo, o valor da amplitude.
# 3- Estimar o n?mero de classes: 2k ≤ n. Sendo que n é igual a raiz quadrada do n?mero total de observa??es.
# 4- Estimar o tamanho de cada intervalo de classe: C = A/k
# 5- Contar o n?mero de observa??es que caem em cada intervalo de classe (subintervalo), frequ?ncia.
# 6- Determinar a frequ?ncia relativa do intervalo: Frequ?ncia relativa = frequ?ncia/total de observa??es.
# 7- Construir o gr?fico.



# ou usar hist()

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = "Número de Acidentes Diários", xlab = "Acidentes", ylab = "Frequência") # 10 breaks 
hist(dados, main = "Número de Acidentes Diários", xlab = "Acidentes", ylab = "Frequência", breaks = 6) # agrupar os dados em classes, p melhorar a compreensao e interpretação dos dados. 
hist(dados, main = "Número de Acidentes Diários", xlab = "Acidentes", ylab = "Frequência", breaks = 5) # R não permite, dificulta a analise dos dados 
?hist



# FIM




