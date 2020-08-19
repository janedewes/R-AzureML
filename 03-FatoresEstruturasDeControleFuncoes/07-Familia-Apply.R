

# Familia Apply - para fazer loops (melhor performance)


#config dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()



# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão similar ao lapply
# vapply() - simialr ao sapply, com valor de retorno modificado
# rapply() - similar ao lapply()
# epplay() - gera uma lista
# mapply() - similar a sapply, multivariada
# by


# DICAS: Se estiver trabalhando com objetos:

# list, numeric, character (list/vector) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações especificas => apply


# Usando loop
lista1 <- list(a = (1:20), b = (35:67))

# Ex1)
# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for (i in lista1$a){
  valor_a = valor_a + i
}

for (j in lista1$b){
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

# Ou

# Ex2)
# Calculando cada elemento com sapply
?sapply
sapply(lista1, sum)


# Aplicando funções com sapply
sapply(lista1, mean)



# apply()
?apply


x <- matrix(c(20, 13, 64, 32, 45, 12, 76, 49, 82), nr = 3, byrow = T)

apply(x, mean) # Erro, falta um parametro, correto abaixo.
apply(x, 1, mean)
apply(x, 2, mean)
apply(x, 1, plot)


resultadoapply <- apply(x, 1, mean)
resultadoapply




# Aplicando apply() em um dataframe
escola <- data.frame(Aluno = c("Bob", "Tereza", "Marta", "Felipe", "Zacarias", "Elton"),
                     Fisica = c(91, 82, 75, 97, 62, 74),
                     Matematica = c(99, 100, 96, 92, 91, 87),
                     Quimica = c(56, 72, 49, 68, 59, 77))
escola
escola$Matematica



# Calculando a média por aluno
# Criar uma col vazia:
escola$Media = NA
escola

# , indica que são todas as linhas:
# 1 para linha, 2 para col
escola$Media = apply(escola[, c(2, 3,4)], 1, mean)
escola

# Arredondar valor da media:
escola$Media = round(escola$Media)
escola


# tapply()
?gl
# Gerar valores aleatórios (ficticios)
tabela_basquete <- 
  data.frame(equipe = gl(5, 5, labels = paste("Equipe", LETTERS[1:5])),
             jogador = sample(letters, 25),
             num_cestas = floor(runif(25, min=0, max=50 )))

View(tabela_basquete)
summary(tabela_basquete)
# Equipe A, B, C, D, E





# Como calcular o total de cestas por equipe?

# USANDO SQL!!!
# tapply() vs sqldf
install.packages('sqldf')
library(sqldf)
#sql
sqldf("select equipe, sum(num_cestas) from tabela_basquete group by equipe") #instrução sql



#tapply()
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)



# by (não é da familia apply, ela é similar)
?by

dat <- data.frame(species=c(rep(c(1,2,3), each =5)), 
                  petal.length=c(rnorm(5, 4.5, 1),
                                 rnorm(5, 4.5, 1),
                                 rnorm(5, 5.5, 1)), 
                  petal.width=c(rnorm(5, 2.5, 1),
                                rnorm(5, 2.5, 1),
                                rnorm(5, 4, 1)))

dat$species <- factor(dat$species)
View(dat)


by(dat, dat$species, function(x){
  #calcular o comprimento médio da pétala para cada espécie
  mean.pl <- mean(x$petal.length)
})


# lapply()
lista1 <- list(a = (1:10), b = (45:77))
lista1
sapply(lista1, sum)



# vapply()
?vapply

vapply(lista1,
       fivenum,
       c(Min. = 0,
         "1stQu." = 0,
         Median = 0,
         "3rd Qu." = 0,
         Max = 0))


# replicate
?replicate
replicate(7, runif(10))


# mapply()
?mapply
mapply(rep, 1:4, 4:1)



# rapply() fç recursiva- faz uma chamada a si mesma
?rapply

lista2 <- list(a = c(1:5), b = c(6:10))
lista2


rapply(lista2, sum)
rapply(lista2, sum, how = "list")



# Fim 

































