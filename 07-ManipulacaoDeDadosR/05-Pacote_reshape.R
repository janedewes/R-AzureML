

# Remodelando os Dados com Reshape


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()

 
# Pivot (transposta da Matriz)
mtcars
t(mtcars) # transformar linhas e cols


# Reshape
head(iris)
str(iris)
library(lattice) #p  gráficos
View(iris)



# Distribuindo os dados verticalmente (long)
?reshape
iris_modif <- reshape(iris, 
                      varying = 1:4, 
                      v.names = "Medidas", 
                      timevar = "Dimensoes", 
                      times = names(iris)[1:4], 
                      idvar = "ID", 
                      direction = "long") 

head(iris_modif)
View(iris_modif)


bwplot(Medidas ~ Species | Dimensoes, data = iris_modif) #boxplot
# foi necessário fazer o reshape para criar esse tipo de gráfico



# distribuir um pouco mais as infos:
iris_modif_sp <- reshape(iris, 
                         varying = list(c(1,3),c(2,4)),
                         v.names = c("Comprimento", "Largura"), 
                         timevar = "Parte", 
                         times = c("Sepal", "Petal"),
                         idvar = "ID", 
                         direction = "long")

head(iris_modif_sp)
View(iris_modif_sp)


# grafico do pacote laticce; para gráfico de disperção
xyplot(Comprimento ~  Largura | Species, groups = Parte, 
       data = iris_modif_sp, auto.key = list(space="right"))

xyplot(Comprimento ~  Largura | Parte, groups = Species, 
       data = iris_modif_sp, auto.key = list(space="right"))
# para esse tipo de grafico o reshape é feito p visualizar no formato 
#de combinação das variaveis.


# ------------------------------------------------------------------------------

# Reshape2
install.packages("reshape2")
library(reshape2)



# Criando um dataframe
df = data.frame(nome = c("Zico", "Pele"), 
                chuteira = c(40, 42),
                idade = c(34,NA),
                peso = c(93, NA),
                altura = c(175, 178))
df



# "Derretendo" o dataframe - Função melt() - separar as variaveis por coluna 
# cada info em uma col individual 
df_wide = melt(df, id = c("nome", "chuteira"))
df_wide


# IMPORTANTE ***********************************************
# Removendo NA (valores missing)
df_wide = melt(df, id = c("nome", "chuteira"), na.rm = TRUE)
df_wide
#************************************************************



# "Esticando" o dataframe
dcast(df_wide, formula = chuteira + nome ~ variable) # dcast CONTRARIO DO MELT 
dcast(df_wide, formula = nome + chuteira  ~ variable)
dcast(df_wide, formula = nome  ~ variable)
dcast(df_wide, formula = ...  ~ variable) # (...) = tudo






# Aplicando o reshape2
names(airquality) <- tolower(names(airquality))
head(airquality)
dim(airquality)




# Função melt() - wide
?melt
df_wide <- melt(airquality) 
class(df_wide)
df_wide
head(df_wide) # ver primeiras linhas
tail(df_wide) # ver ultimas linhas




# Inserindo mais duas variáveis
df_wide <- melt(airquality, id.vars = c("month", "day"))
head(df_wide)

df_wide <- melt(airquality, id.vars = c("month", "day"),
                variable.name = "climate_variable", 
                value.name = "climate_value")

head(df_wide)




# Função dcast() - long - fçs melt e dcast do  reshape2
df_wide <- melt(airquality, id.vars = c("month", "day"))
View(df_wide)
df_long <- dcast(df_wide, month + day ~ variable)
View(df_long)
head(airquality)

#OBS-  nao aletrar o dataset original,sempre fazer cópia!!!


# Fim
