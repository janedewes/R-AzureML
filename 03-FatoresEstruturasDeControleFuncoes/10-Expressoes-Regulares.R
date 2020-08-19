
# Expressões regulares (buscar por padrões!!)


# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()


# grep
# grepl
# sub
# gsub
# regexpr
# gregexpr

str <- c("Expressões", "regulares", "em ling R",
         "permitem a busca de padrões", "e exploração de textos", 
         "podemos buscar padrões em dígitos", 
         "como por exemplo",
         "10992451280")

length(str)
str


#grep()
?grep
grep("ex", str, value = F) #encontrou esse padrão nessa posição do vetor
grep("ex", str, value = T) #mostra o local que eele encontrou o padrão (mineração de texto)
grep("\\d", str, value = F) # // código (pdf anexo)
grep("\\d", str, value = T) #T mostra onde esta o padrao


# grepl() #retorna V ou F
?grepl
grepl("\\d+", str)
grepl("\\D", str) # D tudo que não é digito(tabela anexo)


# gsub
?gsub
gsub("em", "***", str)
gsub("ex", "EX", str, ignore.case = T)

# sub()
sub("em", "Em", str)


# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase)


# gregexpr()
gregexpr(pattern = "a", frase)



str2 <- c("2678 é maior que 45 - @???!$$", 
          "Vamos escrever 14 scripts R")

str2


# gsub() #vai removendo ou substituir as coisas
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot", "Q", str2)
gsub("[[:punct:]]", "", str2)



# Fim 











