


# Medidas de Tend�ncia Central - Moda, Valores M�ximo e M�nimo e Amplitude

# def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# Moda

# A moda de uma distribui��o � o valor que ocorre mais frequentemente, 
# ou o valor que corresponde ao intervalo de classe com a maior frequ�ncia. 

# A moda, da mesma forma que a mediana, n�o � afetada por valores extremos.


# Uma distribui��o de frequ�ncia que apresenta apenas uma moda � chamada de unimodal. 
# Se a distribui��o apresenta dois pontos de alta concentra��o ela � chamada de bimodal. 


# Distribui��es bimodais ou multimodais podem indicar que na realidade a distribui��o de frequ�ncia 
# se refere a duas popula��es cujas medidas foram misturadas. 



# Por exemplo, suponha que um lote de caixas de leite longa vida � amostrado e em cada caixa da 
# amostra � medido o volume envasado. Se o lote � formado pela produ��o de duas m�quinas de envase 
# que est�o calibradas em valores diferentes, � poss�vel que o histograma apresente duas modas, 
# uma para cada valor de calibra��o.



# Exemplo: Uma loja de cal�ados quer saber qual o tamanho mais comprado em um dia de vendas. 
# A partir dos dados coletados a seguir, determine o tamanho mais pedido. 
tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
mean(tamanhos)  
median(tamanhos)
# def o numero de maior frequencia (moda)


# R n�o tem f� pronta p moda
# abaixo exemplo p c�lculo da moda:

moda = function(dados) {
  vetor = table(as.vector(dados))
  names(vetor)[vetor == max(vetor)]
}

moda(tamanhos)


# ------------------------------------------------------------------------------

# Valores M�ximo e M�nimo

# Representam os valores m�ximos e m�nimos da distribui��o de dados

# Exemplo: Quais s�o os valores m�ximo e m�nimo dos tamanhos de sapatos do item anterior.
tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
max(tamanhos)
min(tamanhos)


# ------------------------------------------------------------------------------


# Amplitude 
# A amplitude � a diferen�a entre o maior e menor valor de um conjunto de dados qualquer.

# Exemplo: Bob quer aprender a voar com asa delta, e ele quer saber qual a amplitude m�xima que um voo pode ter. 
# A partir dos dados de outros praticantes de voo livre, determine qual a amplitude. 
dados = c(28, 31, 45, 58, 22, 33, 42, 68, 24, 37)
range(dados)

diff(range(dados)) # diff � o que calcula a diferen�a!!!



# OBS: A media � afetada por valores extremos(outliers), j� a mediana e moda n�o!


# Fim 



