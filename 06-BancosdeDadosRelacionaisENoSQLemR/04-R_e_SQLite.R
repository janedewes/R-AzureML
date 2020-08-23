


# Trabalho com R e SQLite


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/06-BancosdeDadosRelacionaisENoSQLemR")
getwd()



# Instalar SQLite
install.packages("RSQLite")
library(RSQLite)


# Remover o banco SQLite, caso existe, não obrigatório
system("del exemplo.db")  # no windows
# system("rm exemplo.db") # no Mac e Linux



# Criar driver e conexão ao banco de dados 
drv = dbDriver("SQLite") # usando o pte acima (RSQLite)
con = dbConnect(drv, dbname = "exemplo.db") # conexão, e criar o DB no dir que estou (dir def acima) 
dbListTables(con) #listar as tabelas nessa conexão



# Criar tabela e carregar dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars, row.names = TRUE)




# Listar tabela
dbListTables(con)
dbExistsTable(con, "mtcars") # verif se a tabela existe
dbExistsTable(con, "mtcars2") # verif se a tabela existe
dbListFields(con, "mtcars") ## verif as cols da tabela



# OBS: con (diz onde buscar a conexão)

# Ler conteúdo da tabela 
dbReadTable(con, "mtcars")


# Criar apenas a def da tabela (estrutura)
dbWriteTable(con, "mtcars2" , mtcars[0, ], rows.names = TRUE)
dbListTables(con)
dbReadTable(con, "mtcars2")



# Executando cosultas no BD
query = "select row_names from mtcars" # criar query
rs = dbSendQuery(con, query) # salvar query em rs= resultset
dados = fetch(rs, n = -1)
dados
class(dados)




# Executando consultas no BD (no caso de pouca memoria, usar abaixo)
query = "select row_names from mtcars"
rs = dbSendQuery(con, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 1)
  print(dados$row_names)
}


# Executando consultas no BD
query = "select disp, hp from mtcars where disp > 160"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Executando consultas no BD
query = "select row_names, avg(hp) from mtcars group by row_names"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados



# Criando uma tabela a partir de um arquivo
dbWriteTable(con, "iris", "iris.csv", sep = ",", header = T)
dbListTables(con)
dbReadTable(con, "iris")



# Encerrando a conexão - sempre que terminar um trabalho com DB
dbDisconnect(con)



# Carregando dados no banco de dados
# http://dados.gov.br/dataset/iq-indice-nacional-de-precos-ao-consumidor-amplo-15-ipca15
# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite") # abrir conex�o dom SQLite
con = dbConnect(drv, dbname = "exemplo.db") # abrir conex�o com exemplo.db

dbWriteTable(con,"indices", "indice.csv",
             sep = "|", header = T) # N�o funcionou, erro no file 'rt'! 

dbRemoveTable(con, "indices")

dbWriteTable(con,"indices", "indice.csv",
             sep = "|", header = T)

dbListTables(con)
dbReadTable(con, "indices")

df <- dbReadTable(con, "indices")
df
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4, 5, 6, 7, 8)], mean))
df_mean

dbDisconnect(con)




# Fim

































