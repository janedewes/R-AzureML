


# Medidas de Dispersão - Coeficiente de Variação


setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# Coeficiente de Varia��o

# O coeficiente de varia��o indica a quantidade de varia��o de um conjunto de dados em rela��o a m�dia. 
# O valor � dado por uma rela��o direta do quociente entre o desvio com a m�dia da amostra.



# O coeficiente de varia��o (CV), mede o desvio padr�o em termos de percentual da m�dia. 
# Um CV alto, indica alta variabilidade dos dados, ou seja, menos consist�ncia dos dados. 
# Um CV menor, indica mais consist�ncia dentro do conjunto de dados.



# Quando comparamos a consist�ncia entre 2 conjuntos de dados em rela��o a suas m�dias, 
# � melhor feito quando utilizamos coeficiente de varia��o. 



# Exemplo: Imagine que um investidor est� decidindo se compra a��es da Nike ou Adidas na bolsa de valores. 
# O valor m�dio da a��o de cada empresa e o desvio padr�o, s�o dados a seguir. 
# Qual deve ser a escolha do investidor?


# Nike ==> Valor m�dio da a��o = $55.62 / desvio padr�o = $5.10 (sd= variabilidade)
# Adidas ==> Valor m�dio da a��o = $24.86 / desvio padr�o = $3.60 


# CV = (desvio/media) * 100
CV_Nike   = (5.10/55.62) * 100
CV_Adidas = (3.60/24.86) * 100

print(CV_Nike)
print(CV_Adidas)



# Conclus�o

# Um investidor se sentiria mais seguro em adquirir a��o da Nike, pois o pre�o das a��es 
# teria uma varia��o menor, podendo assim evitar perdas e permitindo ao investidor ter 
# um investimento mais seguro.

# OBS: o CV nos d� uma forma de comparar conjuntos diferentes de dados. 

# Fim



