# Linguagem R - Script 01


# Definir o diretório de trabalho
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


# Nome dos contributors da ling. R
contributors()

# Licença
license()

# Infos sobre a sessão
sessionInfo()

# Imprimir na tela
print('Print da frase!')

# Criar gráficos 
plot(1:25)



# Instalar pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')


# Carregar o pacote
library(ggplot2)

# Descarregar o pacote
detach(package:ggplot2)


# se souber o nome da fç
help(mean)
?mean

# para buscar mais opções sobre uma fç, usar pacotes SOS
install.packages("sos")
library(sos)
findFn("fread")


# Se não souber o nome da fç 
help.search('randomForest')
help.search('matplot')
#ou
??matplot
RSiteSearch('matplot')

example('matplot')

# sair 
q()




