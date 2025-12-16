#80
table(dati$scuola)
mean(dati$voto[dati$scuola == "A"]) 
sd(dati$voto[dati$scuola == "A"]) 
quantile(dati$voto[dati$scuola == "A"], 0.95)
boxplot(dati$voto[dati$scuola == "A"],
        dati$voto[dati$scuola == "B"],
        names = c("A", "B"))

t.test(dati$voto[dati$scuola == "A"], conf.level = 0.99)
t.test(dati$voto[dati$scuola == "B"], conf.level = 0.99)

t.test(dati$voto[dati$scuola == "A"],
       dati$voto[dati$scuola == "B"],
       paired = FALSE, conf.level = 0.99)

# 81
View(dati)
table(dati$sicurezza, useNA =("always"))
table(dati$vel, useNA =("always"))
sum(is.na(dati))

mean(dati$vel[dati$sicurezza == "presente"])
sd(dati$vel[dati$sicurezza == "presente"])

quantile(dati$vel, 0.9, na.rm = TRUE)
hist(dati$vel)

# più del 60% dei veicoli in circolazione dispone di dispositivi 
# per la sicurezza stradale.


## Eseguo un test di ipotesi sulla proporzione di veicoli con dispositivi 
## di sicurezza, H_0: p = 0.6 contro H_1: p > 0.6
?binom.test
## SUCCESSI E FALLIMENTI PRESI DALLA TABELLA
binom.test(c(80, 35), p = 0.6, alternative = "greater")



# 83
nrow(dati)
table(dati$stabilimento)
sum(dati$stabilimento == "B")

sum(dati$stabilimento == "B") / nrow(dati)

mean(dati$diametro[dati$stabilimento == "B"])

quantile(dati$diametro, probs = 0.1)

#  Si vuole dare una risposta quantitativa alla domanda: il diametro medio 
# dei pezzi prodotti nello stabilimento B è pari a 26?


## test sulla media con H0: "la media è 26"
##                      H1: "la media NON è 26"

t.test(dati$diametro[dati$stabilimento == "B"], 
       mu = 26, alternative = "two.sided")


# 84
nrow(dati)
mean(dati$eta)
sum(dati$preferenza == "Sperimentale") 
/ nrow(dati)

sum(dati$preferenza == "Sperimentale" & dati$eta < 35) / sum(dati$eta < 35)
## ANALOGO A:
table(dati$preferenza[dati$eta < 35])

mean(dati$eta[dati$preferenza == "Sperimentale"])

boxplot(dati$eta[dati$preferenza == "Sperimentale"],
        dati$eta[dati$preferenza == "Attuale"],
        names = c("Sperimentale", "Attuale"))

boxplot(dati$eta[dati$preferenza == "Attuale"],
        dati$eta[dati$preferenza == "Sperimentale"],
        names = c("Attuale", "Sperimentale"))


## il prodotto nella versione sperimentale è preferito da più della 
## metà dei consumatori

## TEST PER LE PROPORZIONI

binom.test(sum(dati$preferenza == "Sperimentale"), nrow(dati),
       p = 0.5, alternative = "greater")


# 85
nrow(dati)
mean(dati$Affidabilita)
sum(dati$Preferenza == "A") / nrow(dati)
sum(dati$Preferenza == "A" & dati$Affidabilita > 0.5) / sum(dati$Affidabilita > 0.5)

mean(dati$Affidabilita[dati$Preferenza == "A"])

hist(dati$Affidabilita)

boxplot(dati$Affidabilita[dati$Preferenza == "A"],
        dati$Affidabilita[dati$Preferenza == "B"])

## QUESTI DUE SONO ANALOGHI (SI PREFERISCE USARE `barplot`)
plot(dati$Preferenza)
barplot(table(dati$Preferenza))


# il prodotto di marca A è preferito dalla metà dei consumatori
binom.test(sum(dati$Preferenza == "A"), nrow(dati),
           p = 0.5, alternative = "two.sided")
           




# 86
nrow(dati)
mean(dati$compressione_B)
sd(dati$compressione_B)

sum(dati$compressione_B > 50)

quantile(dati$compressione_B, 0.2)


hist(dati$compressione_A, breaks = 10)
hist(dati$compressione_B, breaks = 10)
boxplot(dati$compressione_A, dati$compressione_B)


## do the two compression algorithms have the same performance? That is, 
## is the average percentage compression the same?

## TEST PER LA DIFFERENZA MEDIA DI CAMPIONI APPAIATI
## H0: "0"         H1:"not 0"
t.test(dati$compressione_A, dati$compressione_B,
       paired = TRUE, alternative = "two.sided")




