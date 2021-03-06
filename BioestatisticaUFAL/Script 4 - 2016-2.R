######################################
#Script 4 de bioestat�stica###########
#Gr�ficos no R########################
#Prof Marcos Vital UFAL###############
#06-03-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo pr�tica1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

##Conferindo os dados com um histograma
#

hist(Riqueza, col="gray")

hist(Abund_sp1, col="gray")


##Boxplot
#Um gr�fico que mostra mediana e quartis

boxplot(Abund_sp1~Ambiente, range=0, las=1,
xlab="Tipo de ambiente", ylab="Abund�ncia da esp�cie 1")
#range=0 faz as barrinhas se estenderem do m�nimo ao m�ximo


##Gr�fico de m�dias

#Aviso: primeiro, voc� precisa instalar o pacote
#Isto pode ser feito via menu "Pacotes"
#E antes de usar, precisamos carregar (isso vale para cada sess�o do R)

library(sciplot)

lineplot.CI(Ambiente, Riqueza, type="p", las=1,
xlab="Tipo de ambiente", ylab="N�mero de esp�cies")
