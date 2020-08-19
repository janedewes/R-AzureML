

# Fatores e Dataframes - Compreendendo a ordem dos fatores



# Config o dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()



# Níveis dos fatores
# Internamente o R armazena valores inteiros e faz um mapeamento para as strings
# e agrupa as estatísticas 


# Criando vetores
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0 ,2)
vec3 <- c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde')

# Unindo os vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R categorizou a última coluna como fator (nesse caso, não!!)

# Fazer manualmente:
fac_vec3 <- factor(vec3)
fac_vec3
levels(vec3)
summary(vec3)

df <- data.frame(vec1, vec2, fac_vec3)
df
str(df)

# Verificando os níveis do fator
levels(df$fac_vec3)

# Criando uma outra coluna e atribuindo labels
df$cat1 <- factor(df$fac_vec3, labels = c("cor2", "cor1", "cor3"))
df


# Internamente , os fatores são registrados como inteiros, mas a ordenação segue a ordem alfabética das strings
str(df)
# Veja como foi feita a atribuição:
# Azul = cor2
# Laranja = cor1
# Verde = cor3
# Ou seja, os vetores com os labels. seguiram a ordem alfabetica dos níveis classificados pelo R


# Criando uma outra coluna e atribuir labels
# Ao aplicar a fç factor() a voluna vec2, internamente o R classificou em ordem alfabética
# e quando atribuir os labels, foi feita associação
df$cat2 <- factor(df$vec2, labels = c("Divorciado", "Casado", "Solteiro"))
df
str(df)
levels(df$cat2)




# Fim











