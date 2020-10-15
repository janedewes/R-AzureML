
# Site : Problema de SVM 


# Lista de Exercícios Parte 4 - Capítulo 11

# def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/11-MLemR")
getwd()



# Definindo o Problema: OCR - Optical Character Recognition
# Seu modelo deve prever o caracter a partir do dataset fornecido. Use um modelo SVM
# Uma img, é uma matriz de pixls, o modelo de ML aprende sobre a relação entre os pixels, 
# entao se por ex, apresentarmos ao modelo o numero 5, ele será capaz de prever se aquilo é o numero 5.
# Isso é visao computacional! Pode ser feito pelo SVM, que é uma subcategoria de rede neural.



## Explorando e preparando os dados
letters <- read.csv("letterdata.csv")
str(letters)
View(letters)


# Criando dados de treino e dados de teste
letters_treino <- letters[1:16000, ]
letters_teste  <- letters[16001:20000, ]


## Treinando o Modelo
install.packages("kernlab")
library(kernlab)


# ------------------------------------- Criando Modelo

# Criando o modelo com o kernel vanilladot
letter_classifier <- ksvm(letter ~ ., data = letters_treino, kernel = "vanilladot")


# Visualizando resultado do modelo
letter_classifier




# ------------------------------------- Avaliando Modelo
# Avaliando a performance do modelo
letter_predictions <- predict(letter_classifier, letters_teste)
head(letter_predictions)
table(letter_predictions, letters_teste$letter) # cria uma cunfusion matrix!!



# Resultados
# Criando um vetor de TRUE/FALSE indicando previsoes corretas/incorretas (mesmo feito acima)
agreement <- letter_predictions == letters_teste$letter
table(agreement)# agrupar a info, p apresentar de maneira resumida
prop.table(table(agreement)) # em %




# ------------------------------------- Otimização -----------------------------

## Otimizando o Modelo
set.seed(12345)

# Recriando o modelo com outro tipo de kernel - rbfdot
letter_classifier_rbf <- ksvm(letter ~ ., data = letters_treino, kernel = "rbfdot") # com outro parametro



# Novas previsoes
letter_predictions_rbf <- predict(letter_classifier_rbf, letters_teste)


# Resultados
# Compare os resultados com a primeira versao do modelo (abaixo foi feito o agrupamento de erros e acertos)
agreement_rbf <- letter_predictions_rbf == letters_teste$letter
table(agreement_rbf)
prop.table(table(agreement_rbf))




# Mudamos o kernel e aumentamos a precisão do modelo para 93% !!!

#FIM 
