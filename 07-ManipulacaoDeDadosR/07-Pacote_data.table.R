


# Data.table


# def dir 
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()


# Instalando os pacotes
install.packages("data.table")
library(data.table)
# é um df, mais rápido e eficiente 


# Criando 2 vetores
vec1 <- c(1, 2, 3, 4)
vec2 <- c('Vermelho', 'Verde', 'Marrom', 'Laranja')



# Criando um data.table
?data.table
dt1 <- data.table(vec1, vec2)
dt1
class(dt1)




# Slicing do data.table
dt2 <- data.table(A = 1:9, B = c("Z", "W", "Q"), C = rnorm(9), D = TRUE)
dt2

class(dt2)
dt2[1,1] # primeira linha, primeia col
dt2[3:5,]# linha de 3 a 5 , (vazio depois da virgula) todas as cols
dt2[, .(B, C)] # linhas vazio(ou seja, todas as linhas) . (ponto separa linha e col ) cols B e C



# Aplicando função ao data.table
dt2[, .(Total = sum(A), Mean = mean(C))]
dt2[, plot(A, C)]
dt2[, .(MySum = sum(A)), by = .(Grp = A%%2)]



# Definindo valores por grupos
dt3 <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"), 
                  val = as.integer(c(6:10, 1:5)))
dt3

#-------------------------------

# Operações com data.tables
dt4 <- data.table(A = rep(letters[2:1], each = 4L), 
                  B = rep(1:4, each = 2L), 
                  C = sample(8))

dt4
new_dt4 <- dt4[, sum(C), by = A]
new_dt4
class(new_dt4)
new_dt4[order(A)] # ordenar pela col A
# manipualçao de dados 

new_dt4 <- dt4[, sum(B), by = A][order(A)] # 3 instruções nessa linha de cód
new_dt4



# Iris
dt5 <- as.data.table(iris)
dt5
dt5[, .(Sepal.Length = median(Sepal.Length),
        Sepal.Width = median(Sepal.Width),
        Petal.Length = median(Petal.Length),
        Petal.Width = median(Petal.Width)),
    by = Species]

#aplicar SQL, ajuda a resolver 




# O parâmetro .SD significa Subset Data e um subset é criado considerando a coluna Species e depois 
# é calculda a mediana. O resultado deve ser igual ao comando anterior. 
# O .SD faz parte da notação do pacote data.table.

# mesmo comando q a fç acima:
dt5[, lapply(.SD, median), by = Species] # simplificado com ling R




# Fim







