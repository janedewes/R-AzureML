

# Lattice 


# Def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/04-LingRGraficos")
getwd()

# O pacote Lattice é um sistema de visualização de dados de alto nível com ênfase em dados multivariados. 

# Na criação de gráficos, condições e agrupamentos são 2 conceitos
# importantes, que nos permitem compreender mais facilmente
# os dados que temos em mãos. O conceito por trás do Lattice
# é agrupar os dados e criar visualizaçãoes de forma que fique 
# mais fácil a busca por padrões.

# Instalar e carregar o pacote
install.packages('lattice')
library(lattice)



# ScatterPlot com Lattice (dataset iris)
View(iris)
# fç xyplot
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)




# ------------------------------------------------------------------------------
# BarPlots com dataset Titanic (dataset da ling R)
?Titanic



# fç usada é o barchart
barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Dados Titanic", columns = 2))

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Dados Titanic", columns = 2),
         scales = list(x = "free"))



# ------------------------------------------------------------------------------
# Contagem de elementos
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength


# ScatterPlots 
xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris)
# relação de duas variaveis com outra (uma) variável



xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)})


xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})
# lm modelo de regressão(preditivo)



histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout=c(3,1), type = "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")


# Distribuição dos dados
qqmath(~ Sepal.Length | Species, data = iris, distribution = qunif)


# Boxplot
bwplot(Species~Sepal.Length, data = iris)


# ViolinPlot
bwplot(Species~Sepal.Length, data = iris,
       panel = panel.violin)



# OBS: o pacote lattice é muito útil para análise de dados, 
#principalmente para comparação de diversas variáveis 



# Fim