
# Tipos avançados de dados em R


# Def diretório
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()



# Vetor: Possui 1 dimensão e 1 tipo de dado (c = cria o vetor)

vetor1 <- c(1:20)
vetor1
length(vetor1)
mode(vetor1)
class(vetor1)
typeof(vetor1)



# Matriz: Possui 2 dimensões e 1 tipo de dado
matriz1 <- matrix(1:20, nrow = 2)
matriz1
length(matriz1)
mode(matriz1)
class(matriz1)
typeof(matriz1)


# Array: Possui 2 ou mais dimensões e 1 tipo de dado
array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
mode(array1)
class(array1)
typeof(array1)




# Data Frames: dados de diferentes tipos 
# A maneira mais fácil de explicar data frame: é uma matriz com diferentes tipos de dados
# iris é um dataframe que vem com a ling R

View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)


# Listas: coleção de diferentes onjetos
# Diferentes tipos de dados são possíveis e comuns

lista1 <- list(a = matriz1, b = vetor1)
lista1
length(lista1)
mode(lista1)
class(lista1)
typeof(lista1)



# Funções tb são vistas como objetos em R

func1 <- function(x) {
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)

# Removendo objetos
objects()
rm(array1, func1)
objects()
















