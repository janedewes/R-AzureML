
# Vetores, Operações com vetores nomeados


# Config diretório
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


# Vetor de strings
vector_caracter = c("Primeira", "frase", "exemplo")
vector_caracter


# Vetor de floats
vector_numerico = c(1.90, 45.3, 300.5)
vector_numerico


# Vetor de valores complexos
vector_complexo = c(5.2+3i, 3.8+4i)
vector_complexo

# Vetor de valores lógicos
vector_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vector_logico

# Vetor de números inteiros
vector_integer = c(2, 4, 6)
vector_integer


# Utilizando seq() (passar o range de valor para essa seq)
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)



# Utilizando rep() (tambem passar o range)
vetor2 = rep(1:5)
vetor2
is.vector(vetor2)



# Indexação de vetores
a <- c(1,2,3,4,5)
a
a[1]
a[6]


b <- c("Frase", "segunda", "exemplo")
b
b[1]
b[2]
b[3]
b[4]




# Combinando vetores
v1 = c(2,3,5)
v2 = c("aa", "bb", "cc", "dd", "ee")
c(v1, v2)


# Operações com Vetores
x = c(1,3,5,7)
y = c(2,4,6,8)

x * 5
x + y
x - y
x * y
x / y


# Somando vetores com número deferente de elementos
alfa = c(10,20,30)
beta = c(1,2,3,4,5,6,7,8,9)
alfa + beta


# Vetor Nomeado (com isso é possível acessar os elementos do vetor)
v = c("Nelson", "Mandela")
v
names(v) = c("Nome", "sobrenome")
v
v["Nome"]






















