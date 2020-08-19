

# DataFrames e Operações com DataFrame


# Config diretório
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


# Criando um dataframe vazio (df)
df <- data.frame()
class(df)
df



# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes, idades, itens, codigos))
df


# Criando Vetrores
pais = c("Portugal", "Inglaterra", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)


# Criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa



# Adicionando um novo vetor a um dataframe existente (cbind = une pela coluna)
olhos = c("verde", "azul", "azul", "castanho", "castanho")
pesq = cbind(pesquisa, olhos)
pesq



# Informações sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)



# Obtendo um vetor de um dataframe ($ = obter coluna individual)
pesq$pais 
pesq$nome


# Extrair um único valor
pesq[1,1]
pesq[3,2]



# Número de linhas e colunas
nrow(pesq)
ncol(pesq)



# Primeiros elementos do dataframe
head(pesq)
head(mtcars)


# ùltimos elementos do dataframe
tail(pesq)
tail(mtcars)



# Data frames built-in do R
?mtcars
mtcars




# Filtro para um subset de dados que atendem a um critério
pesq[altura < 1.60,]
pesq[altura < 1.60, c('código', 'olhos')]



# Dataframes Nomeados
names(pesq) <- c("País", "Nome", "Altura", "Código", "Olhos")
pesq

colnames(pesq) <- c("Var 1", "Var 2", "Var 3", "Var 4", "Var 5")
rownames(pesq) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
pesq


# Carregando um arquivo csv (dataframe que foi criado .csv)
?read.csv
pacientes <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ","))




# Visualizando o dataset
View(pacientes)
head(pacientes)
summary(pacientes)


# Vizualizando as variáveis
pacientes$Diabete
pacientes$status #atenção a letras mauiusculas e minusculas!
pacientes$Status

# Histograma
hist(pacientes$Idade)


# Combinando dataframes
dataset_final <- merge(pesq, pacientes)
dataset_final





















