



# Solução Lista de Exercícios - Capítulo 5


# def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/05-ArquivosTxtCsvExcel")
getwd()

# --------------------------------------------------------------------------------------

# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

# correto?
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")


# --------------------------------------------------------------------------------------

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
# Troubleshooting
library(readr)
?read_csv

df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Correto 
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))



# --------------------------------------------------------------------------------------



# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")


# Solução Sobrepor os histogramas: (add=T)
hist(dataset1, breaks = 30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab = "height", ylab = "nbr of plants", main = "distribution of of 2 durum wheat varieties")
hist(dataset2, breaks = 30, xlim=c(0,300), col = rgb(0,0,1,0.5), add=T )
legend("topright", legend = c("Dataset 1", "Dataset 2"), col = c(rgb(1,0,0,0.5), 
                                                                 rgb(0,0,1,0.5)), pt.cex = 2, pch = 15)


# --------------------------------------------------------------------------------------
# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)
View(iris)

# help ajuda a entender o pacote!
?plotly

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))


# correto  (ploty -> ~ [usar tio antes da variável!!])
plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# --------------------------------------------------------------------------------------

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
# www.r-graph-gallery.com (exemplos de gráicos em ling R)
library(plotly)
head(volcano)
?volcano #infos de vulcoes (como o da nova zelandia)

# Result 3D plot
p = plot_ly(z = volcano, type = "surface")
p


# --------------------------------------------------------------------------------------

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
# json são dados semi-estruturados (usados em web)
library("rjson")
resultado <- fromJSON(file = "input.json")
print(resultado)
class(resultado)


# --------------------------------------------------------------------------------------

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
# é mais facil trabalhar com df doq com lista no R
library("rjson")
resultado <- fromJSON(file = "input.json")
class(resultado)

json_data_frame <- as.data.frame(resultado)
print(json_data_frame)
class(json_data_frame)
View(json_data_frame)



# --------------------------------------------------------------------------------------

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML, ele precisa do pct methods, é uma dependência!
# xml é um formato semi-estruturado, em forma de tags, blocos de dados, possível trocar dados entre sistemas!!!
install.packages("XML")
library("XML")
library("methods")

resultado <- xmlParse(file = "input.xml")
print(resultado)


# --------------------------------------------------------------------------------------

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)
class(xmldataframe)
View(xmldataframe)



# --------------------------------------------------------------------------------------

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
data <- read.csv("input.csv")
print(data)
View(data)


# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
print(is.data.frame(data))
print(ncol(data))
print(nrow(data)) 

# Pergunta 2 - Qual o maior salário?
salario <- max(data$salary)
print(salario) 

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
retval <- subset(data, salary == max(salary))
print(retval)

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
retval <- subset(data, dept == "IT")
print(retval)

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
# usar a fç subset com duas condições (&)
info <- subset(data, salary > 600 & dept == "IT")
print(info)







# --------------------------------------------------------------------------------------

# OBS: Converter arquivos em formato de TABELA, metado to trabalho concluído, pois com tabela podemos 
# trabalhar com maior flexibilidade, por ex:
# - fatiar a tabela
# - modificar linhas, colunas 
# - fazer pesquisas
# - criar novas colunas 
# - junção de colunas já existentes
# -TRABALHAR COM TABELA É O IDEAL NA MAIOIA DAS VEZES!

# dados no formato, txt, csv, json, xml, web etc... trazer para o R e converter para um dataframe!
# a partir disso começar a analisar os dados!! 

