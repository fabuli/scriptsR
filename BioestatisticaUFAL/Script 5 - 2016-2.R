######################################
#Script 5 de bioestat�stica###########
#Gr�ficos no R########################
#Prof Marcos Vital UFAL###############
#13-03-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo fumo.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

tabela<-table(Fumo, C�ncer)
tabela

tabela2<-table(C�ncer, Fumo)
tabela2

#Aqui podemos experimentar o gr�fico com as duas tabelas
#E ficar com o que for mais intuitivo e f�cil de interpretar
barplot(tabela, beside=T)
barplot(tabela2, beside=T)
#Quase sempre, a vers�o com a vari�vel explicativa no X, e a resposta nas cores
#� a mais f�cil de interpretar; mas a decis�o � sua!


#################

#Vamos melhorar bastante este gr�fico!

levels(Fumo)                #Conferir a ordem das classes da var. categ�rica

Fumo<-relevel(Fumo, "N�o")  #Altera a ordem das classes, colocando o "N�o" primeiro

levels(Fumo)                #Conferindo de novo, s� pra ver se deu certo

#Veja como mudou no gr�fico:
tabela2<-table(C�ncer, Fumo) #Criando a tabela2 de novo, agora com a vari�vel nova
barplot(tabela2, beside=T)   #Vendo como ficou no gr�fico

levels(C�ncer)               #Para ver em que ordem as barras apareceram

#Agora sim, criando um gr�fico melhor:
limites.y<-c(0, 300)                              #Estabeleci os limites de y em um objeto
cores<-c("gray", "black")                         #Estabeleci a ordem das cores
nomes<-c("n�o tem c�ncer", "tem c�ncer")          #Nomes para aparecerem na legenda

barplot(tabela2, beside=T, las=1, ylim=limites.y, col=cores,
xlab="H�bito de fumar", ylab="Fre	qu�ncia")

legend("topright", nomes, col=cores, pch=15)      #Adiciona a legenda no gr�fico (gr�fico tem que estar aberto!)
                                                  #pch=15 foi usado para se desenhar os quadrados


#####################
#Desafio!
#Vamos adicionar valores relativos em porcentagem em cima das barras

somas<-colSums(tabela2)               #Calculando as somas das colunas da tabela 2
somas                                 #Olhando os valores

n�o.fumantes<-round((tabela2[,1]/somas[1])*100, 1)  #Porcentagens de c�ncer entre n�o fumantes
moderados<-round((tabela2[,2]/somas[2])*100, 1)     #O mesmo para os fumantes moderados
pesados<-round((tabela2[,3]/somas[3])*100, 1)       #O mesmo para os fumantes pesados
#A fun��o round foi usada para arrendondar para uma casa decimal

#Olhando os valores:
n�o.fumantes
moderados
pesados

#Criando o gr�fico de novo:
limites.y<-c(0, 350)
barplot(tabela2, beside=T, las=1, ylim=limites.y, col=cores,
xlab="H�bito de fumar", ylab="Fre	qu�ncia")

legend("topright", nomes, col=cores, pch=15)      #Adiciona a legenda no gr�fico (gr�fico tem que estar aberto!)
                                                  #pch=15 foi usado para se desenhar os quadrados

#E com ele aberto vamos adicionar os valores
text(1.5, tabela2[1,1]+10, n�o.fumantes[1])
text(2.5, tabela2[2,1]+10, n�o.fumantes[2])

text(4.5, tabela2[1,2]+10, moderados[1])
text(5.5, tabela2[2,2]+10, moderados[2])

text(7.5, tabela2[1,3]+10, pesados[1])
text(8.5, tabela2[2,3]+10, pesados[2])
