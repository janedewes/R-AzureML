

# Análise Exploratória de Dados  -  Compreendendo os dados 

# - Variaveis numericas 
# - variaveis categoricas



# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/11-MLemR")
getwd()


# Carregando o pacote readr
library(readr)

# Carregando o dataset
carros <- read_csv("carros-usados.csv")


# Resumo dos dados
View(carros)
str(carros)
# OBS: a variavel ano não é numerica (n faremos operações com ela) 
# pode ser transf em tipo categórica (tipo fator!)



# Medidas de Tendência Central
summary(carros$ano) # resumo da var ano
summary(carros[c('preco', 'kilometragem')]) # resumo da var preço e km


# ------------------------------------------------------------------------------
# Análise Exploratoria de Dados Para Variáveis Numericas 



# Usando as funções para variavel preco
mean(carros$preco) # OBS: em uma distr. normal media e mediana tem o mesmo valor. 
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99)) #percentis
quantile(carros$preco, seq( from = 0, to = 1, by = 0.20)) #percentis especificos
IQR(carros$preco) #Diferença entre Q3 e Q1
range(carros$preco) # valor min  e mar
diff(range(carros$preco))

# OBS: analise para variavel preco, tambem e possivel fazer para outras variaveis.



# Plot

# Boxplot
# Leitura de Baixo para Cima - Q1, Q2 (Mediana) e Q3
boxplot(carros$preco, main = "Boxplot para os Preços de Carros Usados", ylab = "Preço (R$)")
boxplot(carros$kilometragem, main = "Boxplot para a Km de Carros Usados", ylab = "Kilometragem (R$)")
#OBS: tratar os outliers (são valores muito distantes da media)!! 


# Histograma
# Indicam a frequencia de valores dentro de cada bin (classe de valores)
hist(carros$preco, main = "Histograma para os PreÃ§os Carros Usados", xlab = "Preço (R$)")
hist(carros$kilometragem, main = "Histograma para a Km de Carros Usados", ylab = "Kilometragem (R$)")
hist(carros$kilometragem, main = "Histograma para a Km de Carros Usados", breaks = 5, ylab = "Kilometragem (R$)") # aumentar ou diminuir os breaks, para melhor analise



# Scatterplot Preço x Km
# Usando o preço como variavel dependente (y)
plot(x = carros$kilometragem, y = carros$preco,
     main = "Scatterplot - Preço x Km",
     xlab = "Kilometragem",
     ylab = "PreÃ§o (R$)")

# Medidas de Disperssao
# Ao interpretar a variancia, numeros maiores indicam que 
# os dados estao espalhados mais amplamente em torno da 
# media. O desvio padrao indica, em media, a quantidade 
# de cada valor diferente da media.
var(carros$preco)
sd(carros$preco)
var(carros$kilometragem)
sd(carros$kilometragem)



# ------------------------------------------------------------------------------
# Analise Exploratoria de Dados Para Variaveis Categoricas


# OBS: transf em numeros, pois o pc nao entende texto, apenas numeros



# Criando tabelas de contingencia - representam uma unica variavel categorica
# Lista as categorias das variaveis nominais
?table
str(carros)
table(carros$cor) # a fç table contou quantas linhas com cada cor!
table(carros$modelo) # a fç table contou quantas linhas com cada modelo!
str(carros) # a fç table não altera dos dados, apenas faz a tabulação!



# Calculando a proporcao de cada categoria (para a variavel modelo)
model_table <- table(carros$modelo)
prop.table(model_table) #em valores %



# Arrendondando os valores
model_table <- table(carros$modelo)
model_table <- prop.table(model_table) * 100
round(model_table, digits = 1)




# Criando uma nova variavel indicando cores conservadoras  (que as pessoas compram com mais frequencia)
head(carros)
carros$conserv <- carros$cor %in% c("Preto", "Cinza", "Prata", "Branco") # buscar apenas carros em que essas cores esão no vetor
head(carros)


# Checando a variavel das cores que estao nos vetores
table(carros$conserv) # retorna o valor numerico



# Verificando o relacionamento entre 2 variaveis categoricas
# Criando uma crosstable 
# Tabelas de contingencia fornecem uma maneira de exibir 
# as frequencias e frequencias relativas de observacoes 
# (lembra do capitulo de Estatistica?), que sao classificados 
# de acordo com duas variaveis categoricas. Os elementos de 
# uma categoria sao exibidas atraves das colunas; 
# os elementos de outra categoria sÃ£o exibidas sobre as linhas.
install.packages("gmodels")
library(gmodels)
?CrossTable # cria a tabulação cruzada
CrossTable(x = carros$modelo, y = carros$conserv) # variaveis modelo e converv


## Teste do Qui-quadrado

# Qui Quadrado, simbolizado por X2 e um teste de 
# hipoteses que se destina a encontrar um valor da 
# dispersao para duas variaveis nominais, avaliando a 
# associacao existente entre variaveis qualitativas.

# É um teste nao parametrico, ou seja, nao depende dos 
# parametros populacionais, como media e variancia.

# O principio basico deste metodo e comparar proporcoes, 
# isto e, as possiveis divergencias entre as frequencias 
# observadas e esperadas para um certo evento.
# Evidentemente, pode-se dizer que dois grupos se 
# comportam de forma semelhante se as diferencas entre 
# as frequencias observadas e as esperadas em cada 
# categoria forem muito pequenas, proximas a zero.

# Ou seja, Se a probabilidade e muito baixa, ele fornece 
# fortes evidencias de que as duas variaveis estao 
# associadas.

CrossTable(x = carros$modelo, y = carros$conserv, chisq = TRUE)
chisq.test(x = carros$modelo, y = carros$conserv)


# Trabalhamos com 2 hipoteses:
# Hipotese nula: As frequencias observadas nao sao diferentes das frequencias esperadas.
# Nao existe diferenca entre as frequencias (contagens) dos grupos.
# Portanto, nao ha associacao entre os grupos

# Hipotese alternativa: As frequencias observadas sao diferentes das frequencias esperadas, 
# portanto existe diferenca entre as frequencias.
# Portanto, ha associacao entre os grupos.


# Neste caso, o valor do Chi = 0.15  
# E graus de liberdade (df) = 2
# Portanto, nao ha associacao entre os grupos
# O valor alto do p-value confirma esta conclusao.



