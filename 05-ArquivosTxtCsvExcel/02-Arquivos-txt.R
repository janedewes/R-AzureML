


# Arquivos txt


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/05-ArquivosTxtCsvExcel")
getwd()


# fçs base do R - carregados automaticamente no R quando iniciada nova sessão (utils é um deles)
search()

# ------------------------------------------------------------------------------

# Importando arquivo read.table()
?read.table


df1 <- read.table("pedidos.txt") # quando usar a fç read.table o arquivo txt vira um dataframeno RStudio
df1
dim(df1) #6 linhas e 1 col



# acima carregou com apenas uma coluna, especificar o separador:
df1 <- read.table("pedidos.txt", header = TRUE, sep = ',')
df1
dim(df1) # 5 linhas e 3 cols


# alterando o nome das colunas:
df1 <- read.table("pedidos.txt", header = TRUE, sep = ',',
                  col.names = c("var1", "var2", "var3")) 
df1


# alterando (apagando) valores:
df1 <- read.table("pedidos.txt", header = TRUE, 
                  sep = ',',
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'))
df1


# Visualizar o resultado da importação
str(df1) 


# Eliminar os fatores, caso existam no df:
df1 <- read.table("pedidos.txt", header = TRUE, 
                  sep = ',',
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = FALSE)
df1


#-------------------------------------------------------------------------------


# Importando arquivo com read.csv()
df2 <- read.csv("pedidos.txt")
df2
dim(df2) # já importa com o semparador: 5 linhas e 3 colunas, porém ocupa mais espaço em memória!



df3 <- read.csv2("pedidos.txt")
df3
dim(df3) # identifica as linhas mas não as colunas: 5 linhas 1 col

# essa fç requer que identificar o separador:
df3 <- read.csv2("pedidos.txt", sep = ',')
df3
dim(df3)




# Importando arquivo com read.delim()
df4 <- read.delim("pedidos.txt")
df4
dim(df4) # essa fç não identifica as cols: 5 linhas e 1 col. 

# é necessário identificar o semparador:
df4 <- read.delim("pedidos.txt", sep = ',')
df4
dim(df4) # 5 linhas e 3 cols


# ------------------------------------------------------------------------------

# Importando / Exportando 


# OBS: Arq´s estão no B.D., carregados no R (gravados na memória do PC),   
# após fazer modificações salvar novo arq.


# Gerando arquivo 
write.table(mtcars, file = 'mtcars.txt') #mtcars é um dataset que já vem com R
dir()


df_mtcars <- read.table("mtcars.txt") # colocando em um df
df_mtcars 
dim(mtcars) # df com 32 linhas e 11 cols



# Salvar
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double") #double = valor númerico vira decimal
list.files()

#leitura
read.table("mtcars2.txt")
df_mtcars2 <- read.table("mtcars2.txt")
df_mtcars2

#Separador de col
df_mtcars2 <- read.table("mtcars2.txt", sep = "|")
df_mtcars2

#add formato do caracter
df_mtcars2 <- read.table("mtcars2.txt", sep = "|", encoding = 'UTF-8')
df_mtcars2



# Fim 













































