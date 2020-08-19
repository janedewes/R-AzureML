

# Pacotes e Instalação de Pacotes


# Config dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()


# Alguns pacotes são carregados por padrão


# Busca os pacotes carregados: (PADRAO e os carregados)
search()


# Instala os pacotes carregados (pode instalar como vetor!!)
install.packages(c("ggvis", "tm", "dplyr"))
library(ggvis)
library(tm)
#ou 
require(dplyr)

sealClass()
?require
detach(package:dplyr) #sai da memoria(tira do pacote)


# Lista o conteúdo dos pacotes
?ls
ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = TRUE)


# Lista as fçs de um pacote
lsf.str("package:tm")
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:gglopt2")



# R possui um conjunto de datasets preinstalados

library(MASS)  #já vem com o R
data()

?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)


plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length #conteudo da coluna 

sum(Sepal.Length)
#Acima dará erro, abaixo conserta o erro:
?attach
attach(iris)
sum(Sepal.Length)




# Fim 



