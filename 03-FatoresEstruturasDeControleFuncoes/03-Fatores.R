

# Fatores 

# Confir dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/03-FatoresEstruturasDeControleFuncoes")
getwd()


vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1

# Dois n�veis do vec acima:
fac_vec1 <- factor(vec1)
fac_vec1

class(vec1)
class(fac_vec1)


# Vari�veis categ�ricas nominais
# N�o existe uma ordem impl�cita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
class(animais)
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)


# Vari�veis categ�ricas ordinais
# Possuem uma ordem natural 
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
# Criar um fator ordenado da grad acima em rela��o � ordem dos n�veis:
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "bacharelado"))
fac_grad
levels(fac_grad)


# Sumarizar os dados fornece uma vis�o geral sobre o conte�do das vari�veis (quantidade nos n�veis)
summary(fac_grad)
summary(grad)



vec2 <- c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
#Mudar nomes F e M:
levels(fac_vec2) <- c("Femea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)



# Mais exemplos 
data = c(1,2,2,2,3,3,2,1,1,3,3,1,2,1,1,2,2,2,3,2,2,2,3)
fdata = factor(data)
fdata
# Mudando a representa��o acima:
rdata = factor(data, labels = c("I", "II", "III"))
rdata


# Fatores n�o-ordenados
set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA", "CC", "CC")
set1



# Transformando dados (acima)
# R apenas criou n�veis, n�o significa que exista uma hierarquia.
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)


# Fatores ordenados (dar alguma ordena��o)
o.set1 <- factor(set1,
                 levels = c("CA", "BA", "AA", "CC", "B"),
                 ordered = TRUE)
o.set1
is.ordered(o.set1)

as.numeric(o.set1)
table(o.set1)


# Fatores e Dataframes
df <- read.csv2("etnias.csv", sep = ',')
df
View(df)


#OBS: Verificar como a ling R classifica as v�riaveis, antes de qquer passo adicional
# TRansf em fator (n ordenado): (etnia e sexo)
df$Etnia <- factor(df$Etnia, labels = c("Branco", "Negro", "Pardo"))
df$Sexo <- factor(df$Sexo, labels = c("Feminino", "Masculino"))

  

# Vari�veis do tipo fator
str(df)




# N�veis dos fatores
levels(df$Etnia)
summary(df$Etnia)


# Plot
# ~ significa q tenho algo do lado direito e do lado esquerdo e quero coloc�-las no mesmo gr�fico
plot(df$Idade~df$Etnia, xlab = "Etnia", ylab = "Idade", main = "Idade x Etnia")



# Regress�o (lm= linear model)
summary(lm(Idade~Etnia, data = df))


# Convertendo uma coluna em vari�vel categ�rica. Isso criar� um fator n�o-ordenado
df
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
str(df)


# Fim
































