

# Boxplots


# OBS: Tanto o Scatterplot quanto o Boxplot são gráficos estatísticos
# pois mostram a relação entre variáveis.


# def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/04-LingRGraficos")
getwd()

?boxplot
?sleep #dataset que será usado


# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)
View(sleep)



# 1ª camada:
# Construção do boxplot -  extra ~ group => relação entre 2 variaveis (são insfos do dataset)
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Duração do Sono",
                       col.main = "red", ylab = "Horas", xlab = "Droga")


# 2ª camada:
# Cálculo da média - by substitui o loop
medias = by(extra, group, mean)

# Adiciona a média ao gráfico
points(medias, col = "red")


# 3ª camada:
# Boxplot horizontal - horizontal = T
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = "", xlab = "", horizontal = T)

horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = "", xlab = "", horizontal = T,
                            col = c("blue", "red") )


