


# Lista de Exercícios - Capítulo 2


# Config dir 
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/02-FundamentosDaLingR")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vec <- c(1:12)
vec


# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
mat <- matrix(c(1:16), nrow = 4, ncol = 4)
mat

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lst <- list(vec, mat)
lst
# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe (link da internet)
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
class(df)
df
View(df)


# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df) = c("config", "esfc", "chang")
names(df) = c("col1", "col2", "col3")
df


# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
class(iris)
dim(iris) #tamanho
summary(iris)# resumo estatístico
str(iris) # resumo dos tipos de dados de cada var
View(iris)


# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)


# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()

?subset #help
iris1 <- subset(iris, Sepal.Length > 7)
iris1
View(iris1)

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

novo_iris <- iris #criar cópia do dataset original 
novo_iris
install.packages("dplyr")
library(dplyr)
?slice
slice(novo_iris, 1:15)
class(slice(novo_iris, 1:15))
View(novo_iris)


# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter

RSiteSearch('filter') #aprender a usar essa fç
filter(novo_iris, Sepal.Length > 7)


# FIM 
