


# Quartil e Percentil

# Def dir
setwd("C:/Users/paloma/Desktop/DSA/BigDataRAzure/09-AnaliseEstatistica")
getwd()


# O que s�o os Quartis e Percentis? 


# Para um grande n�mero de observa��es, � interessante calcular algumas outras medidas de posi��o. 
# Essas medidas s�o uma extens�o do conceito de MEDIANA.

# Exemplo: estamos conduzindo um experimento com animais. 
# Eles recebem uma droga e medimos o tempo de vida (em dias) ap�s a ingest�o dessa droga. 
# Poder�amos fazer a seguinte pergunta: 

# Qual � o tempo em que 50% dos animais ainda est�o vivos? Obviamente esse valor ser� a MEDIANA. 

# Poder�amos estar interessados em saber qual � o tempo em que 75% dos animais est�o vivos. Ou 25%. 

# Esses valores s�o chamados de Quartis da distribui��o (dividem a distribui��o em quartas partes) 
# e s�o representados por Q1  (1� quartil - 25%) e Q3 (3� quartil - 75%). 
# O segundo quartil, Q2, que corresponde a 50%, � a mediana.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
# Esse conceito pode ser estendido um pouco mais, e em lugar de 25%, 50% e 75%, 
# podemos querer calcular percentis (5%, 10%, 90%).



# Quartis

# Quartis s�o valores que dividem um conjunto de dados em quatro partes iguais. 
# O primeiro quartil ser� o termo que ter� 25% dos dados antes dele, 
# o segundo quartil tamb�m seguir� a mesma l�gica e ir� coincidir com a mediana, 
# o terceiro quartil ser� o termo com 75% dos valores do conjunto de dados antes dele 
# e o quarto quartil ser� o �ltimo termo do conjunto com 100% dos dados antes dele.


# ------------------------------------------------------------------------------

# Exemplo: O hor�rio de funcionamento de um banco j� est� se esgotando, para adiantar o atendimento dos clientes o 
# gerente decide para de chamar individualmente e passa a chamar em grupos de 1/4 da quantidade total de clientes na fila. 
# A partir dos n�meros das fichas dos clientes, determine os grupos das 4 chamadas.
num_fichas = c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
?quantile
quantile(num_fichas)


# Ou seja, a primeira chamada contemplar� os clientes com as fichas de 54 at� 56, 
# a segunda de 57 at� 58, a terceira de 59 at� 60 e a quarta de 61 at� 63.



# ------------------------------------------------------------------------------


# Percentis 

# Os percentis são os valores que separam um conjunto de dados em 100 partes iguais. 
# O percentil 10 representa o d�cimo percentil e ter� 10% dos dados antes dele, 
# a l�gica se seguir para todo percentil.

# Exemplo: Consoderando os dados do exemplos anterior, calcule o percentil 10, 80 e 98.
num_fichas = c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
quantile(num_fichas, c(.10))
quantile(num_fichas, c(.80))
quantile(num_fichas, c(.98))



# Ou seja, o cliente que est� com pouco mais do que 98% da fila a frente dele ter� a ficha 63, 
# o que est� com pouco menos do que 80% da fila a frente dele ter� a ficha 61 
# e o que est� com pouco mais do que 10% da fila a frente dele ter� a ficha 55.


# FIM 




