


# TRabalhando com arquivos CSV


#def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/05-ArquivosTxtCsvExcel")
getwd()



# Usando o pacote readr
install.packages("readr")
library(readr)


# Abre o prompt para escolher o arquivo
meu_arquivo <- read_csv(file.choose())


# Importando arquivos (tb arqvs txts)
df1 <- read_table("temperaturas.txt",
                  col_names = c("Day", "Month", "Year", "Temp"))

head(df1)
View(df1)
str(df1) # tipos de dados 


# Faz a leitura linha por linha
read_lines("temperaturas.txt", skip = 0, n_max = -1L)
read_file("temperaturas.txt") # nesse caso perde a formatação


# Exportando o Importando 
write_csv(iris, "iris.csv") #gravar o dataset iris em formato csv
dir()



# Tipos para carregar cada uma das cols:

# col_integer():
# col_double():
# col_logical():
# col_character():
# col_factor():
# col_skip():
# col_date() (alias = "D"), col_datetime() (alias = "T"), col_time() ("t")


df_iris <-read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(), 
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


dim(df_iris)
str(df_iris)



# Manipulando arquivos csv
df_cad <- read_csv("cadastro.csv") # transf o arq em df
View(df_cad)

# dplyr = é um pacote para manipular os dados:
install.packages("dplyr")
library(dplyr)
options(warn=-1) #não mostra os warns
 

df_cad <- tbl_df(df_cad) #transf em df
head(df_cad)
View(df_cad)


write.csv(df_cad, "df_cad_bkp.csv") # gravar dataset



# Importando vários arquivos simultaneamente
list.files()
lista_arquivos <- list.files('C:/Users/paloma/Desktop/DSA/BigDataRAzure/05-ArquivosTxtCsvExcel/arquivos', full.names = TRUE)
class(lista_arquivos)
lista_arquivos

# Dentro do obj colocamos 2dim
lista_arquivos2 <-lapply(lista_arquivos, read_csv) #aplicar loop na lista de arqvs, para operação read_csv
class(lista_arquivos2)
View(lista_arquivos2)



# Parsing  (ajustar o formato de data)
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d") # n deixa carregar, pois n existe dia 34


# Idioma 
locale("en")
locale("fr")
locale("pt")




# Fim 


































