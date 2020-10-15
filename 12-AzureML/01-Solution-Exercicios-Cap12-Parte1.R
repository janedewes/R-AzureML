


# Solução Lista de Exercícios - Capítulo 12


# Criar um modelo de arvore de decisão


# Def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/12-DataMungingAzure")
getwd()


# Existem diversos pacotes para árvores de decisão em R. Usaremos aqui o rpart.
install.packages('rpart')
library(rpart)




# Vamos utilizar um dataset que é disponibilizado junto com o pacote rpart
str(kyphosis) 
head(kyphosis)
View(kyphosis)
?kyphosis # dataset de crianças que tiveram cirurgia corretiva na espinha (kyphosis -> um tipo de deformação)




# ------------------------------------------------------------------------------
# Exercício 1 - Depois de explorar o dataset, crie um modelo de árvore de decisão
?rpart # pode ser usado p Regressão ou Classificação

# Kyphosis -> target
# ponto -> todas as var preditoras
# método -> class (Classificação = prever categoria)
# conj de dados -> data = kyphosis
arvore <- rpart(Kyphosis ~ . , method = 'class', data = kyphosis)
class(arvore)
arvore




# Para examinar o resultado de uma árvore de decisao, existem diversas funcões, mas você pode usar printcp()
printcp(arvore)




# Visualizando a ávore (execute uma função para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o gráfico
plot(arvore, uniform = TRUE, main = "Arvore de Decisao em R")
text(arvore, use.n = TRUE, all = TRUE)





# Este outro pacote faz a visualizaco ficar mais legivel
install.packages('rpart.plot')
library(rpart.plot)
prp(arvore)





# FIM 
