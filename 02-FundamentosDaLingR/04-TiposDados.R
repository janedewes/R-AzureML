
# Tipos b√°sicos de dados em R

# Def. diret√≥rio
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/02-FundamentosDaLingR")
getwd()


# Numeric - Todos os n√∫meros criados em R s√£o modo numeric
# S√£o armazenados como n√∫meros decimais (double)
num1 <- 7
num1
class(num1)
mode(num1)
typeof(num1)


num2 = 16.82
num2
mode(num2)
typeof(num2)


# Integer (inteiro)
# Converter tipos numeric para integer
is.integer(num2)
y = as.integer(num2)
y
class(y)
mode(y)
typeof(y)

as.integer('3.7') #String (consegue)
as.integer("Joe") #String, n consegue (n È num)
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)



# Character (STRING)
char1 = 'Frase 1'
char1
mode(char1)
typeof(char1)


char2 = "Frase 2"
char2
mode(char2)
typeof(char2)


char3 = c("Frase3", "Frase4", "Frase5") #c cria uma lista de caracters (strings)
char3
mode(char3)
typeof(char3)


#Complex (n˙meros complexos)
compl = 2.5 + 4i
compl
mode(compl)
typeof(compl)

sqrt(-1)
sqrt(-1+0i)
sqrt(as.complex(-1))




# Logic 

#podemos def as vari·veis na mesma linha (separadas por ;)
x = 1; y = 2 
z = x > y
z
class(z)


u = TRUE; v = FALSE
class(u)
u & v
u | v
!u


#OperaÁıes com 0
5/0
0/5


#Erro (string/numero)
'Joe'/5






