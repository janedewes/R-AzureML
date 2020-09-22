


# Split-Apply-Combine - plyr


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()



#-------------------------------------------------------------------------------
# Instalando os pacotes
install.packages("plyr")
install.packages("gapminder") # https://www.gapminder.org

library(plyr)
library(gapminder)
?gapminder # dados de todo o mundo (populacao mundial)



# Split-Apply-Combine
?ddply # fatia o df, aplica fç, e retorna os resultados em um dataframe
df <- ddply(gapminder, ~ continent, 
            summarize, 
            max_le = max(lifeExp)) # dados do continente(sumarizado) e espectativa de vida
str(df)
head(df)
View(df)
levels(df$continent)




# Split-Apply-Combine
ddply(gapminder, ~ continent, 
      summarize, 
      n_uniq_countries = length(unique(country))) # continente (sumarizado) e a quantidade unica de paises para cada continente


# identico ao anterior
ddply(gapminder, ~ continent, 
      function(x) c(n_uniq_countries = length(unique(x$country)))) # criar própria function


ddply(gapminder, ~ continent, 
      summarize,
      min = min(lifeExp), 
      max = max(lifeExp),
      median = median(gdpPercap)) 



# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)
?mpg



# Trabalhando com um subset do dataset
data <- mpg[,c(1,7:9)]
str(data)
View(data)




# Sumarizando e Agregando Dados (split, aply, combine)
ddply(data, .(manufacturer), 
      summarize, 
      avgcty = mean(cty)) # sumarizar os dados (resumir/ eliminar var duplicadas)



# Várias funções em uma única chamada
ddply(data, .(manufacturer), 
      summarize, 
      avgcty = mean(cty), 
      sdcty = sd(cty), 
      maxhwy = max(hwy))


# Sumarizando os dados pela combinação de variáveis/fatores
ddply(data, .(manufacturer, drv), 
      summarize, 
      avgcty = mean(cty), 
      sdcty = sd(cty),
      maxhwy = max(hwy)) # duas variaveis 



# Fim 

