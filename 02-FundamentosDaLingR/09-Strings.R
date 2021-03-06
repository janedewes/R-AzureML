

# Opera��es com Strings



# Config diretório
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


# String
texto <- "Isso é uma string!"
texto


x = as.character(3.14)
x
class(x)


# Conectando Strings
nome = "Nelson"; sobrenome = "Mandela"
paste(nome, sobrenome)
cat(nome, sobrenome)


# Formato de sa�da
sprintf("A %s é nota %d", "Academia de dança", 10)


# Extra�ndo parte da string
texto <- "Isso é uma string!"
substr(texto, start=12, stop=17)
?substr


# Contando o número de caracteres
nchar(texto)



# Alterando a capitalização
tolower("hitogramas e elementos de dados")
toupper("histogramas e elementos de dados")







# Usando stringr (pacote para tratamento de strings)
library(stringr)


# Dividindo uma string em caracteres
strsplit("histogramas e elementos de dados", NULL)
?strsplit


# Dividindo uma string em caracteres, ap�s o caracter espa�o
strsplit("histogramas e elementos de dados")




# Trabalhando com strings
string1 <- c("Esta � a primeira parte da minha string e ser� a primeira parte do meu vetor", 
             "Aqui a minha string continua, mas ser� transformada no segundo vetor")
string1


string2 <- c("Precisamos testar outras strings - @???!$$",
             "An�lise de dados em R")
string2



# Add 2 strings
str_c(c(string1, string2), sep = "")


# Podemos contar quantas vezes um caracter aparece no texto 
str_count(string2, "s")


# Localiza a primeira e �ltima posi��o em que o caracter aparece na string
str_locate_all(string2, "s")


# Substitui a primeira ocorrencia de um caracter
str_replace(string2, "\\s", "")


# Substitui todas as ocorrencias de um caracter
str_replace_all(string2, "\\s", "")


# Detectando padr�es nas strings
string1 <- "17 jan 2001"
string2 <- "1 jan 2001"

padrao <- "jan 20"

grepl(pattern = padrao, x = string1)
padrao <- "jan20"
grepl(pattern = padrao, x = string1)


























