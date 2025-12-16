# ESAME REPE
# 1
View(dati)

nrow(dati)
mean(dati$DOPO)
sd(dati$DOPO)

sum(dati$DOPO > 0.7)

#Il 5% dei giocatori realizzano una percentuale di battute efficaci dopo 
# le 6 settimane di nuovo programma di allenamento superiore a
?quantile
quantile(dati$DOPO, probs = 0.95)


hist(dati$PRIMA)
hist(dati$DOPO)
boxplot(dati)

# Si vuole dare una risposta quantitativa alla domanda: il nuovo programma 
# di allenamento funziona?
# Ovvero, mediamente dopo il nuovo programma di allenamento la percentuale di 
# battute efficaci dei giocatori è aumentata?
# Per rispondere a questa domanda calcoli:

## un test di ipotesi per la media delle differenze, per campioni appaiati, 
## con ipotesi alternativa H_1: mu_PRIMA < mu_DOPO

t.test(dati$PRIMA, dati$DOPO, mu = 0, paired = TRUE, alternative = "less")

# 2
View(dati)

nrow(dati)
# caso mancante che si trova alla riga 
which(is.na(dati), arr.ind = TRUE)

#  e che riguarda la variabile
## STAMPO L'INTERA RIGA E VEDO QUALE ABBIA VALORE NA
dati[33, ]

table(dati, useNA = "always")
87/202


barplot(table(dati[, 2]))
barplot(table(dati[, 1]))

# Si vuole dare una risposta quantitativa alla domanda: 
# esiste una associazione tra il tipo di foresta e
# l’occupazione dei nidi?

# un test di ipotesi del chi-quadro per l’indipendenza con H_0: 
# le due variabili sono indipendenti
# contro H_1: le due variabili non sono indipendenti
?chisq.test

# SONO EQUIVALENTI: 
chisq.test(dati$Foresta, dati$Nido)
chisq.test(table(dati))

min(chisq.test(table(dati))$expected)


# 3 
# NB: può essere utile la funzione di R "ppois"
# Sia una variabile aleatoria Poisson(10) (cioè di parametro lambda = 10)
# Calcolare:
# la probabilità che "la variabile aleatoria valga 2 oppure assuma un valore 
# nell'insieme {7, 8, 9}
dpois(2, 10) + dpois(7, 10) + dpois(8, 10) + dpois(9, 10)

# P(X >= 5)
1 - ppois(4, 10)

# P(X <= 3 | x != 0)
(ppois(3,10) - dpois(0,10) ) / (1 - dpois(0, 10))





# 4
# X ~ N(mu = 1, var = 1)
1 - pnorm(3, 1, 1)

# La probabilità che X sia maggiore di 0.5 sapendo che X è minore di 6
(pnorm(6, 1, 1) - pnorm(0.5, 1, 1)) / (pnorm(6, 1, 1))




