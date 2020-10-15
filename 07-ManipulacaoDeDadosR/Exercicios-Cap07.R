


# Solução Lista de Exercícios - Capítulo 7



# def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/07-ManipulacaoDeDadosR")
getwd()

# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)



# ----------------------------------------------------------------------------------------
# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
# a fç read_html faz parte do pacote rvest
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")




# ----------------------------------------------------------------------------------------
# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
# com html_nodes conseguimos extrair blocos dentro de uma pág web (as tags)
previsao <- html_nodes(pagina, "detailed-forecast-body b , .forecast-text")
previsao #note que ele é um doc xml!





# ----------------------------------------------------------------------------------------
# Exercício 3 - Transforme o item anterior em texto
# fazer uma limpeza e transformar em texto: com html_text
texto <- html_text(previsao)
paste(texto, collapse = " ") # colocar um espaço para que o arq fique legível!






# ATÉ AQUI (3 EXERCICIOS) SÃO AS ETAPAS DO WEBSCRAPPING !!


# --------------------------------------------------------------------------------------
# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners' # colocamos no obj url
pagina <- read_html(url) # fizemos a leitura do obj
tabela <- html_nodes(pagina, 'table') #extraimos a tag table do obj pagina, criado acima 
class(tabela) # tipo de dado extraído quando usamos o html node






# --------------------------------------------------------------------------------------
# Exercício 5 - Converta o item anterior em um dataframe
tab <- html_table(tabela)[[1]] # notação para buscar o elemento de uma lista 
class(tab)
head(tab)
View(tab) # temos varias infos emuma mesma col, é preciso separar!!





# --------------------------------------------------------------------------------------
# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
tab <- tab[-(1:2), ] # - extrai as duas primeiras linhas, depois o vazio significa que fará em todas as cols
head(tab)
names(tab) <- c("number", "date", "site", "result") # nomear as cols
head(tab)
View(tab)




# --------------------------------------------------------------------------------------
# Exercício 7 - Converta de algarismos romanos para números inteiros
tab$number <- 1:52
tab$date <- as.Date(tab$date, "%B. %d, %Y") # converter em formato de data
head(tab)
View(tab)







# --------------------------------------------------------------------------------------
# Exercício 8 - Divida as colunas em 4 colunas
# atualmente a col esta com os dois dados na mesma col 
# fç separate é do pcte tidyr!!
tab <- separate(tab, result, c('vencedor', 'perdedor'), sep = ', ', remove = TRUE)
head(tab)
View(tab)




# --------------------------------------------------------------------------------------
# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
pattern <- "\\d+$" # o contrabarra d -> é digito (quando encontrar o digito ele faz a divisão!)
tab$pontosVencedor <- as.numeric(str_extract(tab$vencedor, pattern))
tab$pontosPerdedor <- as.numeric(str_extract(tab$perdedor, pattern))
tab$vencedor <- gsub(pattern, "", tab$vencedor)
tab$perdedor <- gsub(pattern, "", tab$perdedor)
head(tab)
View(tab)






# --------------------------------------------------------------------------------------
# Exercício 10 - Grave o resultado em um arquivo csv
write.csv(tab, "superbowl.csv", row.names = F)
dir()

# OBS: com isso gravamos o dataset com as alterações em um arq csv !!!!



# FIM 
