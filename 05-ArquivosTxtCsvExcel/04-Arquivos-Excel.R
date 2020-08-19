


# Trabalhando com Planilhas Excel



# OBS: Os Pacotes requerem Java (JDK): 
# XLConnect 
# xlsx
# rJava

# Pacote que requer Perl: gdata



# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/05-ArquivosTxtCsvExcel")
getwd()


# Instalando os pacotes
install.packages('rJava')
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")


# Este pacote deve estar carregado para poder usar todos os pacotes que requerem Java
library(rJava)

# Obs: Ao carregar todos os pacotes que manipulam excel, pode gerar problema de namespace, pois alguns pacotes
# possuem o mesmo nome de funções (que são diferentes entre os pacotes). Para evitar problemas, carregue e use
# os pacotes de forma individual (nÃ£o carregue todos os pacotes de uma única vez).

# Pacote readxl
library(readxl)


# Lista as worksheet no arquivo Excel
excel_sheets("UrbanPop.xlsx")



# Lendo a planilha do Excel
read_excel("UrbanPop.xlsx") #ler a planilha (carrega como double=numero, character=texto)
head(read_excel("UrbanPop.xlsx")) 
read_excel("UrbanPop.xlsx", sheet = "Period2") #ler alguma folha especifica da planilha excel
read_excel("UrbanPop.xlsx", sheet = 4) # só tenho 3 planilhas e n 4




# Importando uma worksheet para um dataframe
df <- read_excel("UrbanPop.xlsx", sheet = 3)
head(df)



# Importando todas as worksheets
# lapply = aplicar uma op à um conj de elementos 
# OBS: todo o arquivo workbook, cada uma das folhas é uma planilha
df_todas <- lapply(excel_sheets("UrbanPop.xlsx"), read_excel, path = 'UrbanPop.xlsx') 
df_todas
class(df_todas)


# Pacote XLConnect
detach(package:readxl) #descarregar o pacote usado anterior
library(XLConnect) #carrega



# Namespace
arq1 = XLConnect::loadWorkbook("UrbanPop.xlsx") # nome do pacote :: nome da fç
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df1) 



# Pacote xlsx
detach(package:XLConnect) #descarrega
library(xlsx) #carrega
?xlsx


?read.xlsx
df2 <- read.xlsx("UrbanPop.xlsx", sheetIndex = 1) #erro!
df2



# Pacote gdata - requer o Perl
detach(package:xlsx)
library(gdata)

arq1 <- xls2csv("planilha1.xlsx",
                sheet = 1,
                na.strings = "EMPTY")
arq1
read.csv(arq1)



# fim
