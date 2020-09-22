

# Remodelagem de Dados com tidyr


# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/07-ManipulacaoDeDadosR")
getwd()



# Instalando os pacotes
install.packages("tidyr")
library(tidyr)
library(ggplot2)




# Dados de notas em disciplinas
dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)
dados

# dividir as colunas:
dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B) # gather = transf linha em col
# agora temos 3 var: nome, região e nota. 



# Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

df2
# runif = valores aleatórios
# set.seed = usar os mesmos exemplos 

# ------------------------------------------------------------------------------



# Reshape 1
df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao)
# pegar todas as cols e agrupar nas cols key e time, menos a id e acao.

df2_organizado1 %>% head(8)

# OBS: fazer reshape para não ter cols com infos duplicadas


# Reshape 2
df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.") 

# separamos a coluna key em localidade e tempo, que estavam separadas por ponto. 
# melhor do que fazer pelo excel
df2_organizado2 %>% head(8)



# ------------------------------------------------------------------------------


# Mais um exemplo
set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"), 
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)
# com dados aleatórios
print(df3)


# Reshape dos dados (acima)
df3 %>%
  gather(day, score, c(day1score, day2score))


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  spread(day, score)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)


# tudo junto:
df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)
# Nessa instrução:
# Mudamos o shape
# separamos as cols
# Criamos o gráfico
# calculamos o modelo de regressão
# e colocamos tudo na mesma área de plotagem 


# grafico das linhas de regressão(x e y = dia e score)

# OBS: ter a mesma info distribuida um mais de uma col, então fazer o reshape!

# Fim
