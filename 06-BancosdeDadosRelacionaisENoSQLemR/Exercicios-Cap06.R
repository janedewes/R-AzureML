



# Solução Lista de Exercícios - Capítulo 6


setwd("C:/Users/paloma/Desktop/GitHub/R-Tools/06-BancosdeDadosRelacionaisENoSQLemR")
getwd()

# ----------------------------------------------------------------------------------------
# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages(c("dbplyr", "RSQLite"))
library(RSQLite)
library(dbplyr)
library(dplyr) # para fazer algumas manipulações



# ----------------------------------------------------------------------------------------
# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
# ao trabalhar com sqlite podemos usar extensão .sqlite ou .db (ou qquer outra extensão, desde q o arq seja do formato sqlite)
# abrir a conecção e colocar tudo no obj mamiferos:
mamiferos <- dbConnect(SQLite(), "mamiferos.sqlite")



# ----------------------------------------------------------------------------------------
# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
?src_dbi # essa fç conecta ao obj q representa o banco de dados e extrai as infos 
# (verificar a versão usada no arq q representa o BD) e tb as tabelas desse BD!
src_dbi(mamiferos)




# ----------------------------------------------------------------------------------------
# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
?tbl # fç tbl, para executar uma query direto no sqlite, ou qquer fonte de dados 
dados <- tbl(mamiferos, sql("SELECT year, species_id, plot_id FROM surveys")) 




# ----------------------------------------------------------------------------------------
# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)




# ----------------------------------------------------------------------------------------
# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(mamiferos, "surveys")

# aplicar um filtro para selecionar alguns dados dessa tabela: (a forma abaixo é como se manipula dados em R)
pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)





# ----------------------------------------------------------------------------------------
# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
dados2 <- pesquisas %>%
  filter(weight <5) %>%
  select(species_id, sex, weight) # manipular os dados com pcte dplyr com essa sintaxe, por ex!!


class(dados2)
dados3 <- as.data.frame(dados2) # visualizar, imprimir os dados em formato csv, etc, converter para dataframe!!
class(dados3)
View(dados3)



# ----------------------------------------------------------------------------------------
# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(mamiferos)




# ----------------------------------------------------------------------------------------
# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(mamiferos, "dados3", dados3)
dbRemoveTable(mamiferos, "dados3")
dbListTables(mamiferos)




# ----------------------------------------------------------------------------------------
# Exercicio 10 - Imprima os dados da tabela criada no item anterior
dbReadTable(mamiferos, "dados3")

dbReadTable(mamiferos, "plots")




# FIM 
