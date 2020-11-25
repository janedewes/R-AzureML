


# Mapas



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/04-LingRGraficos")
getwd()



# Instalar os pacotes
install.packages(c("ggplot2", "maps", "mapdata"))

install.packages("mapdata")


# Carregar os pacotes
library(ggplot2)
library(maps)
library(mapdata)




# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world")


# Visualizando o dataframe
dim(mapa)
View(mapa)



# Gerando e trabalhando no mapa
ggplot() + geom_polygon(data = mapa, aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3)

# Tira o preenchimento e coloca o contorno
ggplot() + 
  geom_polygon(data = mapa, aes(x=long, y = lat, group = group), fill = NA, color = "blue") + 
  coord_fixed(1.3)

# Preenchimento com uuma cor diferente
gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x=long, y = lat, group = group), fill = "seagreen1", color = "blue") + 
  coord_fixed(1.3)
gg1




# Representando os pontos no mapa (é possivel escolher por lat e lon)
# Marcando alguns pontos no mapa
# Podemos usar um shapefile ( no BR: site do IBGE)
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Ponto1", "Ponto2"),
  stringsAsFactors = FALSE
) 


# colocando pontos(def acima) no mapa 
gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = "red", size = 2)



# Divisão por países
ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)


# Para mais exemplos com instruções para instalação dos pacotes

# rMaps 
# http://rmaps.github.io



# Fim
