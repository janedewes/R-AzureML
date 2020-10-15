

# Lista de Exercícios - Capítulo 3

# Def dir
setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/03-FatoresEstruturasDeControleFuncoes")
getwd()


# --------------------------------------------------------------------------------
# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# --------------------------------------------------------------------------------
# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
charac_vec <- c("A", "B", "C")
num_vec <- c(4.5, 3.9, 7.2)
logic_vect <- c(TRUE, TRUE, FALSE)

df <- data.frame(charac_vec, num_vec, logic_vect)
df

# --------------------------------------------------------------------------------
# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for (i in 1:length(vec1)){ #não importa o tamanho do vetor, podemos usar sempre o mesmo loop!
  if (vec1[i] >10) {
    print(vec1[i])
    print('Este elemento do vetor é maior que 10')
  } else {
    print(vec1[i])
    print('Este elemento do vetor é menor que 10')
  }
}


# --------------------------------------------------------------------------------
# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (i in 1:length(lst2)) {
  print(lst2[[i]])
}



# --------------------------------------------------------------------------------
# Site: mathwarehouse.com/algebra/matrix/multiply-matrix.php
# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise (usado em ML usa *)(multiplica elemento por elemento)
mat3 <- mat1 * mat2
mat3

# Multiplicação de matrizes tradicional usa %*% [livro / site etc](multplica linha col e soma, elemento por elemento)

mat4 <- mat1 %*% mat2
mat4
# Item [1,1] ==> (1x1)+(2x2)+(3x3)+(4x4)+(5x5) = 55
# Item [2,1] ==> (6x1)+(7x2)+(8x3)+(9x4)+(10x5) = 130
# Item [3,1] ==> (11x1)+(12x2)+(14x3)+(14x4)+(15x5) = 205
# OBS: SABER QUAL O TIPO DE MULTIPLICAÇÃO SER USADA É A CHAVE P TRABALHAR COM ML
# --------------------------------------------------------------------------------


# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos

# Vetor
vec1 <- c(12,3,4,19,34)
names(vec1) <- c('col1', 'col2', 'col3', 'col4', 'col5')
vec1


# Matriz
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
dimnames(mat1) = (list( c("obs1", "obs2", "obs3", "obs4", "obs5"), c("var1", "var2", "var3", "var4", "var5")))#linha primeiro depois col
mat1

# Lista
lst1 <- list(2,3, c(1,2,3))  # 3 elementos
names(lst1) <- c('valor 2', 'valor3', 'vetor com 3 elementos')
lst1


# df
df1 <- data.frame(c("A", "B", "C"), c(4.5, 3.9,  7.2), c(TRUE, TRUE, FALSE))
colnames(df1) <- c('Caracteres', 'Float', 'Logico')
rownames(df1) <- c('linha1', 'linha2', 'linha3')
df1



# --------------------------------------------------------------------------------
# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

?sample # gera amostras randomicas atraves de permutação
mat2[sample(1:50, 10)] = NA
mat2
# vemos que ela sub por NA alguns dos malores da matrix, radomicamente, dentro dos 50 primeiros numeros da matrix!!!


# --------------------------------------------------------------------------------
# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)
colSums(mat1)

# não é necessario  usar nenhum tipo de loop (como o loop for)



# --------------------------------------------------------------------------------
# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
order(a)
a[order(a)]



# --------------------------------------------------------------------------------
# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for (i in mat1) {
  if(i >15){
    print(i)
  }
}



# FIM 
