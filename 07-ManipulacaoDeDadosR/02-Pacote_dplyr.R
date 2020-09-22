

# Limpeza, formatação e manipulação de dados em R


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()


# Instalando os pacotes
install.packages("readr") #leitura de dados
install.packages("dplyr") #transf dos dados 
library(dplyr)
library(readr)


detach(package:dplyr) # remove o pacote


# Carregando o dataset
sono_df <- read_csv("sono.csv") # colocar no df
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)


# Função glimpse() pode ser usada no lugar da fç str()
glimpse(sono_df)


# Amostragem
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))

# mutate = a partir do sono_df , gera nova col= peso_libra, 
# para gerar essa col faz calculo sono_total/0.45359237


# Contagem e historgrama
count(sono_df, cidade) # contagem dos registros relacionados à col cidade
hist(sono_df$sono_total) # para fazer histo usa sono_total  que está no df sono_df


# Amostragem (sample_n = coleta uma amostra)
sample_n(sono_df, size = 10)



# select()
sleepData <- select(sono_df,nome, sono_total) # criar outro df a partir de sono_df, com as cols nome e sono_total
head(sleepData)
class(sleepData)
select(sono_df, nome) # retornar uma única col, ou
select(sono_df, nome:cidade)# fazer um range de cols
select(sono_df, nome:pais)



# filter()
filter(sono_df, sono_total >= 16) # 1 condição
filter(sono_df, sono_total >= 16, peso >= 80) # 2 condições
filter(sono_df, cidade %in% c("Recife", "Curitiba")) # in = no SQL



# arrange()
sono_df %>% arrange(cidade) %>% head() # a concatenação simplifica a sintaxe

# concatenar uma op de select, concatenado com uma fç arrange, ainda concatenar com head
sono_df  %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total)  %>% 
  head

# iagual ex acima, ainda aplicar filtro
sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  filter(sono_total >= 16)

# ainda aplicar desc = ordenação em ordem decrescente , um uma das cols dentro de arrange
sono_df %>% 
  select(nome, cidade, sono_total) %>% 
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)




# mutate()
head(sono_df)
sono_df %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head

head(sono_df)


sono_df %>% 
  mutate(novo_indice = sono_total / peso, 
         peso_libras = peso / 0.45359237) %>%
  head




# summarize() 
# sumarizar pela media do sono (calcular mean)
sono_df %>% 
  summarise(media_sono = mean(sono_total))

# tb pela média, min, max e total de registros:
sono_df %>% 
  summarise(media_sono = mean(sono_total), 
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())





# group_by()
# geralmente usa-se summarize e group_by juntos: 
# fazer os calculos e concatenar as fçs
sono_df %>% 
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total), 
            min_sono = min(sono_total), 
            max_sono = max(sono_total),
            total = n())

# OBS: atenção à ordem!!!

# Operador: %>%
head(select(sono_df, nome, sono_total)) # chamar as 3 cols
# ou usando concatenação:
sono_df %>% 
  select(nome, sono_total) %>% 
  head



sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


sono_df
View(sono_df)

# gravar novo dataframe , com os resultados 
sono_df2 <- sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

View(sono_df2)

#obs: não alterar o dataframe original.

# Fim































