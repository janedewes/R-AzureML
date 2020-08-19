

# Barplot - gráfico de barras



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/04-LingRGraficos")
getwd()

?barplot

# Preparando os dados - número de casamentos em uma igreja de SP - atraves de uma matriz
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados



# Nomeando linhas e colunas na matriz
colnames(dados) <- c("0","1-150","151-300",">300") # cada coluna representa uma faixa de número de casamento
rownames(dados) <- c("Jovem","Adulto","Idoso") # cada linha representa uma faixa etária
dados



# Construindo o Barplot
barplot(dados, beside = T) # um ao lado do outro, por faixa 
barplot(dados) # cria um stacked bar plot - grafico de barras empilhado


# Construindo o plot - Stacked Bar Plot
# As 3 faixas de idade são representadas na mesma coluna para as diferentes quantidades
barplot(dados, col = c("steelblue1", "tan3", "seagreen3")) # cores



# Crie uma legenda para o gráfico anterior
colors()
legend("topright", pch = 15, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))



# Agora temos uma coluna para cada faixa etária, mas na mesma faixa de quantidade
barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 15, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))


# Com a Transposta da matriz, invertemos as posições entre faixa etária e faixa de quantidade
t(dados)
barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))
legend("topright", pch = 15, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"), legend = c("0","1-150","151-300",">300"))




# Fim 




