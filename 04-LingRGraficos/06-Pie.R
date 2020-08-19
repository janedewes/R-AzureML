


# Graficos de Pizza


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/04-LingRGraficos")
getwd()

?pie


# Criando as fatias
fatias = c(40, 20, 40)
# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")


# Unindo paises e fatias - com a fç paste
paises = paste(paises, fatias)


# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "")


colors()
# Construindo um gráfico
pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"), 
    main ="Dsitribuição de Vendas")




# Trabalhando com dataframes
?iris
attach(iris)
Values = table(Species) 
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies")


# 3D
install.packages("plotrix")
library(plotrix) #carrega o pacote na sessão


pie3D(fatias, labels = paises, explode = 0.05,
      col = c("steelblue1", "tomato2", "tan3"), 
      main = "Dsitribuição de Vendas")

# explode = divisão entre as fatias. 


# Fim