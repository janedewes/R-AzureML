

# Site: Projeto de ML em R 


# Lista de Exercícios Parte 3 - Capítulo 11 - Problema de Regressão


# def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/11-MLemR")
getwd()


# Definindo o Problema: Analisando dados das casas de Boston, nos EUA e fazendo previsoes.
# The Boston Housing Dataset
# http://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html
# Seu modelo deve prever a MEDV (Valor da Mediana de ocupação das casas). VAR TARGET!!! 
# Utilize um modelo de rede neural!




# ------------------------------------------------------------------------------
# Carregando o pacote MASS (Vem no R e esse pacote contem o dataset Boston!!!)
library(MASS)

# Importando os dados do dataset Boston
set.seed(101) # mreproduzir os mesmos resultados
dados <- Boston
head(dados)
View(dados)

# Resumo dos dados
str(dados)
summary(dados)
any(is.na(dados)) #  perguntar se tem  dados na

# Carregando o pacote para Redes Neurais
install.packages("neuralnet")
library(neuralnet)


# OBS: É necessário conhecer cada algoritmo para saber quais pré-processamentos devem ser reslizados!

# Descrição da importancia de se aplicar a normalização como pré-processamento dos dados ANTES de trabalhar com redes neurais!!

# Como primeiro passo, vamos abordar o pré-processamento de dados. 
# É uma boa pratica normalizar seus dados antes de treinar uma rede neural. 
# Dependendo do seu conjunto de dados, evitando a normalizacao pode levar a 
# resultados inuteis ou a um processo de treinamento muito dificil 
# (na maioria das vezes o algoritmo não ira convergir antes do numero de iteracoes
# maximo permitido). Voce pode escolher diferentes metodos para dimensionar os 
# dados (normalizacao-z, escala min-max, etc ...). 
# Normalmente escala nos intervalos [0,1] ou [1,1] tende a dar melhores resultados. 

# Normalização: colocar os dados em uma mesma escala!!

# ------------------------------------------------------------------------------
# Normalizacao 
maxs <- apply(dados, 2, max) 
mins <- apply(dados, 2, min)


# Imprimindo os valores
maxs
mins


# Normalizando
dados_normalizados <- as.data.frame(scale(dados, center = mins, scale = maxs - mins))
head(dados_normalizados)



# Criando os dados de treino e de teste
install.packages("caTools")
library(caTools)
split = sample.split(dados_normalizados$medv, SplitRatio = 0.70) #divisão


treino = subset(dados_normalizados, split == TRUE)
teste = subset(dados_normalizados, split == FALSE)



# Obtendo o nome das colunas
coluna_nomes <- names(treino)
coluna_nomes



# Agregando (~ -> substitui escrever todas as var preditoras!!)
formula <- as.formula(paste("medv ~", paste(coluna_nomes[!coluna_nomes %in% "medv"], collapse = " + ")))
formula


# ----------------------- Criação do modelo ------------------------------------
# Treinando o Modelo
rede_neural <- neuralnet(formula, data = treino, hidden = c(5,3), linear.output = TRUE)



# Plot
plot(rede_neural)

# Vamos encontrar os dados de entrada X peso (multipli de matrizes)
# Esse resultado é multipli por mais um conj de pesos
# As duas camadas do meio(parametro, e cada bolinha é um neurônio) são as camadas ocultas da rede neural, a primeira camada é a entrada a última é a de saída. 



# ----------------------- Previsões --------------------------------------------

# Fazendo previsoes com os dados de teste
rede_neural_prev <- compute(rede_neural, teste[1:13])
rede_neural_prev # resultado das previsões (esse result está normalizado)


# O retorno da previsao da Rede Neural é uma lista
str(rede_neural_prev)


# Convertendo os dados de teste (os dadosdo resultado estão normalizado, aqui faremos a conversão de volta!)
previsoes <- rede_neural_prev$net.result * (max(dados$medv) - min(dados$medv)) + min(dados$medv)
teste_convert <- (teste$medv) * (max(dados$medv) - min(dados$medv)) + min(dados$medv)
teste_convert # resultado sem a normalização!!



# Calculando o Mean Squared Error
MSE.nn <- sum((teste_convert - previsoes)^2)/nrow(teste)
MSE.nn



# Obtendo os erros de previsao
error.df <- data.frame(teste_convert, previsoes)
head(error.df)



# Plot dos erros
library(ggplot2)
ggplot(error.df, aes(x = teste_convert,y = previsoes)) + 
  geom_point() + stat_smooth()



# FIM 


