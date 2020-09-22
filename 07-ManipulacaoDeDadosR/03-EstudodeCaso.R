


# Estudo de Caso - Limpando, Transformando e Manipulando Dados de Voos

# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()



# Instalando pacote hflights (Dados de voos de Houston)
install.packages("hflights")
library(hflights)
library(dplyr)
?hflights



# Criando um objeto tbl (converter o conj de pata tbl(tabela))
?tbl_df
flights <- tbl_df(hflights)
flights
View(flights)


# Resumindo os dados
str(hflights) 
glimpse(hflights)


# Visualizando como dataframe
data.frame(head(flights))

# ******************************************************************************
# Filtrando os dados com slice 

# filtrar e fatiar o dataset
flights[1,1] # primeira linha, primeira col (buscar uma celula dentro da tabela)
flights[flights$Month == 1 & flights$DayofMonth == 1, ] # depois da ',' vazio. Linha com base em um critério e todas as cols


#ou


# Aplicando filter (do pct dplyr)
filter(flights, Month == 1, DayofMonth == 1) # note que as regras estão separadas por virgula
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# | = or
# & = and
# ******************************************************************************



# Select
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))



# Organizando os dados
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60) # retornar a vel fazendo cálculo


head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE))) # colocar na fç head
head(aggregate(ArrDelay ~ Dest, flights, mean)) 


flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)



# FIM







