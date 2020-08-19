

# Funções


# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()



# Help
?sample #pacote base (AMOSTRA)
args(sample) # argumentos
args(mean) 
args(sd) #(sd= desvio padrao)


# Funções Built-in
abs(-43) #valor absoluto
sum(c(1:5)) 
mean(c(1:5))
round(c(1.1:5.8)) #arrendondar resultado
rev(c(1:5)) #reverso
seq(1:5) #criar seq
sort(rev(c(1:5))) #ordenar
append(c(1:5), 6) # add elemento ao final da lista
#OBS: antes de implementar um fc, verificar se já n existe!!!



# EX: criando um vetor reverso
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2


# Funções
plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))





# Criando funções
# 1)
myfunc <- function(x) { x + x }
myfunc(10)
class(myfunc)


# 2)
myfunc2 <- function(a, b) {
  valor = a ^ b
  print(valor)
}
myfunc2(3, 2)


# 3) sample = amostra (a var num está no escopo local)
jogando_dados <- function() {
  num <- sample(1:6, size = 1) #local
  num
}
jogando_dados()




# Escopo (não usar o mesmo nome de var local e global, para coisas diferentes)
print(num)
num <- c(1:6)
num #global



# Funções sem número definido de argumentos
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")
vec3 <- c(6.5, 9.2, 11.9, 5.1)

myfunc3 <- function(...){
  df = data.frame(cbind(...))
  print(df)
}


myfunc3(vec1)

myfunc3(vec2, vec3)

myfunc3(vec1, vec2, vec3)




# Fim











