

# Funções Especiais


# Config dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()


# unlist() - Produz um vetor com os elementos da lista (flatten)

lst1 <- list(6, "b", 15)
lst1
class(lst1)

unlist(lst1)
vec1 <- unlist(lst1)
class(vec1)
vec1

lst2 <- list(v1 = 6, v2 = list(381, 2190), v3 = c(30, 217))
lst2


unlist(lst2)

mean(unlist(lst2))
round(mean(unlist(lst2)))


# do.call()
# Executa um fç em um objeto
# *****Atenção*****
# As fçs da familia apply aplicam um fç a cada elemento de um objeto (substitui o loop)
# A fç do.call aplica uma fç ao objeto inteiro e não a cada elemento individualmente
?do.call

data <- list()
N <- 100

for (n in 1:N) {
  data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)

do.call(rbind, data)
class(do.call(rbind, data))


# lapply() x do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum) # soma os individuais
do.call(sum, y) #soma o total geral



# O resultado da fç lapply() tb pode ser obtido através do pacote plyr
install.packages('plyr')
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

# ldply é uma fç do pacote plyr:
ldply(y, sum)


# strsplit()
# Divide ums string ou vetor de caracteres


texto <- "Primeira frase escrita"
strsplit(texto, " ") #resulta em um vetor de palavras (separadas por espaço)

strsplit(texto, "") #separação por TODOS caracteres


dates <- c("1996-05-23", "2008-12-30", "2009-11-29")
temp <- strsplit(dates, "-") #separa pelo -
temp
class(temp)



# transforma a lista em matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol = 3, byrow = TRUE)


Names <- c("Brian, Sargey", "Page, Larry",
           "Dorsey, Jack", "Glass, Noah", 
           "Williams, Evan", "Stone, Biz")

Cofounded <- rep(c("Google", "Twitter"), c(2,4))
temp <- strsplit(Names, ", ")
temp



# [[]] signf indexação dentro de uma lista
frase <- "Muitas vezes temos que repetir algo diversas vezes e essas diversas vezes parecem algo estranho"
palavras <- strsplit(frase, " ")[[1]] 
palavras
unique(tolower(palavras)) #unique = tira palavras repetidas



# strsplit() com dataframes
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes
strsplit(as.character(antes$tipo), '_e_') #carregar biblio abaixo:


library(stringr)
str_split_fixed(antes$tipo, "_e_", 2)



# Usando do.call()
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes
depois <- strsplit(as.character(antes$tipo), '_e_')
depois
do.call(rbind, depois) #rbind une os elementos da lista (porlinha)


# Usando dplyr e tidyr
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

antes <- data.frame(
  attr = c(1 ,30, 4, 6),
  tipo = c('pao_e_agua', 'pao_e_agua_2')
)

antes %>% #caractere de concatenação
  separate(tipo, c('pao_e_agua', 'pao_e_agua_2'))



# Fim 



































