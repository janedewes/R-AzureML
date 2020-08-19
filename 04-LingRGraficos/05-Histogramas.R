

# Histogramas


# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/04-LingRGraficos")
getwd()

# Definindo os dados
?cars
View(cars)
dados = cars$speed

# Construindo um histograma - é usado para visualizar a distribuição de freq de UMA variável.
# divide em classes (grupos) de dados que aparecem com maior/menor frequencia.
?hist
hist(dados)


# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebra entre as células do histograma
# Uma função para calcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de células 
# Uma função para calcular o número de células.

hist(dados, breaks = 10, main = "Histograma das Velocidades") # breaks: caixinhas
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades") # caixinhas específicas
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades") # mostra o total de freq das caixinhas
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")






# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

# Criando uma distribuição normal, media, desvio padrão 
xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
#calcular a diferença:
yaxis = yaxis*diff(grafico$mids)*length(dados)

#acrescentar mais uma camada = distribuição normal 
lines(xaxis, yaxis, col = "red")


# distribuição normal mostra se os dados estão com: 
# media = 0
# desvio padrão = 1



# Fim











