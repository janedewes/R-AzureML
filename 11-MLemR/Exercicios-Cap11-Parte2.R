

# site : projeto de ML em R


# Lista de Exercícios Parte 2 - Capítulo 11 - Modelo de ML 

# 1. Problema de negócio
# 2. Coleta dos dados 
# 3. Analise exploratoria
# 4. Pré-processamento dos dados (*n foi feito nesse ex)
# 5. Construção, treinamento e teste do modelo 
# 6. Apresentação dos resultados 



# def dir 
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/11-MLemR")
getwd()


# ------------------------------------------------------------------------------
# 1. Problema de negócio
# Regressão Linear (prever um número)
# Definição do Problema: Prever as notas dos alunos com base em diversas métricas
# https://archive.ics.uci.edu/ml/datasets/Student+Performance
# Dataset com dados de estudantes
# Vamos prever a nota final (grade) dos alunos
# G3 é a var target.

# install.packages("ggplot2")
# install.packages("ggthemes")
# install.packages("dplyr")
library(ggplot2)
library(ggthemes)
library(dplyr)



# ------------------------------------------------------------------------------
# 2. Coleta dos dados 
# Carregando o dataset
df <- read.csv2('estudantes.csv')
View(df)



# ------------------------------------------------------------------------------
# 3. Analise exploratoria (compreender os dados)
# Explorando os dados
head(df)
summary(df)
str(df)
any(is.na(df))



# Obtendo apenas as colunas numéricas (saber o tipo das var)
# FALSE: var categórica 
# TRUE: var numerica
colunas_numericas <- sapply(df, is.numeric)
colunas_numericas



# Filtrando as colunas numéricas para correlação
data_cor <- cor(df[,colunas_numericas])# , -> todas as linhas , temos um critério para as cols
data_cor
head(data_cor)





# Pacotes para visualizar a análise de correlação
install.packages('corrgram')
#install.packages('corrplot')
library(corrplot)
library(corrgram)



# Criando um corrplot
corrplot(data_cor, method = 'color')



# Criando um corrgram
corrgram(df)
corrgram(df, order = TRUE, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)



# Criando um histograma
ggplot(df, aes(x = G3)) + 
  geom_histogram(bins = 20, 
                 alpha = 0.5, fill = 'blue') + 
  theme_minimal()



# ------------------------------------------------------------------------------
# 4. Pré-processamento dos dados (*n foi feito nesse ex)
# EX: Mudar escala dos dados, aplicar normalização , etc.
# Para aumentar o nível de acuracia (R-squared)!
# ------------------------------------------------------------------------------


# 5. Construção, treinamento e teste do modelo 


# Treinando e Interpretando o Modelo
# Import Library
install.packages("caTools") 
library(caTools)
# caTools -> tem a fç sample.split que é para 
# fazer a divisão entre dados de treino e de teste de maneira aleatória



# Criando as amostras de forma randômica
set.seed(101) 
?sample.split
amostra <- sample.split(df$age, SplitRatio = 0.70) # age -> índice





# ***** Treinamos o modelo nos dados de treino 
# ***** Fazer as predições nos dados de teste  


# Criando dados de treino - 70% dos dados
treino = subset(df, amostra == TRUE)

# Criando dados de teste - 30% dos dados
teste = subset(df, amostra == FALSE)


# Podemos gerar varias versões do modelo (def quais var serão usadas)
# Gerando o Modelo (Usando todos os atributos)
modelo_v1 <- lm(G3 ~ ., treino)
modelo_v2 <- lm(G3 ~ G2 + G1, treino)
modelo_v3 <- lm(G3 ~ absences, treino)
modelo_v4 <- lm(G3 ~ Medu, treino)





# Interpretando o Modelo (R-squared quanto maior, melhor!)
summary(modelo_v1) # R-squared: 0.86 (melhor, vamos escolher o modelo_v1!!!!!)
summary(modelo_v2) # R-squared: 0.82 (bom)
summary(modelo_v3) # R-squared: 0.0002675 (péssimo)
summary(modelo_v4) # R-squared: 0.06442 (péssimo)





# ***** Visualizando o Modelo e Fazendo Previsões

# Obtendo os resíduos (residuos -> erros que o modelo cometeu!!)
res <- residuals(modelo_v1)


# Convertendo o objeto para um dataframe
res <- as.data.frame(res)
head(res)


# Histograma dos resíduos
ggplot(res, aes(res)) +  
  geom_histogram(fill = 'blue', 
                 alpha = 0.5, 
                 binwidth = 1)



# Plot do Modelo
plot(modelo_v1)



#----------------------------- Previsões

# Fazendo as predições
modelo_v1 <- lm(G3 ~ ., treino) # recriando o modelo_v1 (n é necessário)
prevendo_G3 <- predict(modelo_v1, teste) # conj de dados de teste
prevendo_G3


# Visualizando os valores previstos e observados
resultados <- cbind(prevendo_G3, teste$G3) 
colnames(resultados) <- c('Previsto','Real')
resultados <- as.data.frame(resultados)
resultados
min(resultados)



# Tratando os valores negativos (notas negativas n existem, ajudar o modelo)
trata_zero <- function(x){
  if  (x < 0){
    return(0)
  }else{
    return(x)
  }
}



# Aplicando a função para tratar valores negativos em nossa previsão
resultados$Previsto <- sapply(resultados$Previsto, trata_zero)
resultados$Previsto

# ----------- Calcular os erros do modeo de maneira manual 

# Calculando o erro médio
# Quão distantes seus valores previstos estão dos valores observados
# Formula: MSE (erro médio ao quadrado)
mse <- mean((resultados$Real - resultados$Previsto)^2)
print(mse)



# Formula: RMSE (raiz quadrada)
rmse <- mse^0.5
rmse



# Calculando R Squared (soma)
SSE = sum((resultados$Previsto - resultados$Real)^2)
SST = sum((mean(df$G3) - resultados$Real)^2)



# R-Squared
# Ajuda a avaliar o nível de precisão do nosso modelo. Quanto maior, melhor, sendo 1 o valor ideal.
R2 = 1 - (SSE/SST)
R2





# FIM 




