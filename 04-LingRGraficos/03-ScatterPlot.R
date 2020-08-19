

# Scatterplots



# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/04-LingRGraficos")
getwd()



# Define os dados
set.seed(67) 
# semente, como são valores randomicos, cada vez q o script é executado, 
#eles mudam. Com set.seed mantemos os mesmos valores
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)



# Cria o Plot
plot(x, y, col = 123, pch = 10, main = "Multi Scatterplot",
     col.main = "red", cex.main = 1.5, xlab = "Variável Independente", 
     ylab = "Variável Dependente")


# Adiciona outros dados (pch = tipo do simbolo)
points(z, t, col = "blue", pch = 4)

# Adiciona outros dados (cor = nome ou código)
points(y, t, col = 777, pch = 9)

# Cria legenda
legend(-6,5.9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.65, bty = "n")