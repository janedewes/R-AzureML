


# Dados MySQL e Ling R

# config dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/06-BancosdeDadosRelacionaisENoSQLemR")
getwd()



install.packages('RMySQL')
install.packages('ggplot2')
install.packages('dbplyr') # esse pacote possui o driver necessário para conectar em BD relacionais
library(RMySQL)
library(ggplot2)
library(dplyr)



# Conexão com BD
?dbConnect
con = dbConnect(MySQL(), user = 'root', password = 'dsa123', dbname = 'titanicDB', host = 'localhost');


# OBS: ERRO  Error in .local(drv, ...) :Failed to connect to database: Error: Plugin caching_sha2_password could not be loaded: The specified module could not be found.

# COMO RESOLVER: alterando a senha de segurança.
# Acessar shell do MySQL e digitar:(C:Program Files/MySQL/MySQL Server 8.0/bin)>> mysql -u root -p
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dsa123';
# O q deve aparecer: Query OK, 0 rows affected (0.07 sec)
# dar o comando con (acima) novamente



# Query (não buscar todos dados que estão no BD, usar uma query)
# Com esse comando, salva a query:
qry <- "select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived"
# Com esse comando executa a query:
dbGetQuery(con, qry)




# Plot
dados <- dbGetQuery(con, qry) #salvar em df aqui no r
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")


# Conectando no MySQL com dplyr
?src_mysql
con2 <- src_mysql(dbname = "titanicdb", user = "root", password = "dsa123", host = "localhost")



# Coletando e agrupando os dados 
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()
# OBS: os comando acima substituem os comandos SQL
head(dados2)


# Manipulando dados
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect() 
# OBS: os comando acima substituem os comandos SQL
View(dados2)


# Plot
ggplot(dados2, aes(pclass,survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) + geom_line()


# Sumarizando os dados
dados2 <- con2 %>%
  tbl("titanic") %>% 
  filter(fare > 150) %>%
  select(pclass,sex,age,fare) %>%
  group_by(pclass,sex) %>% 
  summarise(avg_age = avg(age),
            avg_fare = avg(fare))
# OBS: os comando acima substituem os comandos SQL
head(dados2)


# --> Para outros bancos de dados, use o pacote RODBC


# Fim 











