######################################
#Script 3 de bioestat�stica###########
#Gr�ficos no R########################
#Prof Marcos Vital UFAL###############
#20-02-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo pr�tica1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

#Gr�fico de dispers�o

plot(Riqueza~�rea)     #Gr�fico basic�o

#Melhorando o gr�fico:
plot(Riqueza~�rea, las=1, pch=16,
xlab="�rea do fragmento", ylab="N�mero de esp�cies")

#####
#Criando um gr�fico que diferencia os ambientes:

cores<-c("green4", "red4")

plot(Riqueza~�rea, las=1, pch=16,
xlab="�rea do fragmento", ylab="N�mero de esp�cies",
col=cores[Ambiente])

nomes<-c("Mata prim�ria", "Mata secund�ria")

legend("topleft" ,nomes, pch=16, col=cores)

#####

