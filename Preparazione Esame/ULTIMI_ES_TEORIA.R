library(UsingR)
data(Galton)
View(Galton)

plot(Galton$parent, Galton$child)

cor.test(Galton$parent, Galton$child)
# p-value < 2.2e-16
## Quindi c'è correlazione tra l'altezza dei genitori e quella dei figli


lm(data = Galton, child ~ parent) -> modello_galton
summary(modello_galton)

# Multiple R-squared:  0.2105
## Un ~ 21% dell'altezza dei figli è determinato dall'altezza dei genitori


plot(modello_galton, which = 1)

plot(modello_galton, which = 2)
hist(residuals(modello_galton))

plot(modello_galton, which = 4)
Galton[c(1, 693, 897), ]


predict(modello_galton, newdata = data.frame(parent = 68), 
        interval = "prediction")


################################################################################
data(MLBattend)

## EX: analizza i dati della Major Baseball League dal '69 al '99.
## Determina un linear model per `attendance` secondo:
## attendance = a1 * year + a2 * runs.scored + a3 * wins + a4 * games.behind +
##              b + `err`

plot(MLBattend$year, MLBattend$attendance)
## risultano degli anni fuori dall'intervallo che desidero analizzare,
## li dovrò escludere,

plot(MLBattend$runs.scored, MLBattend$attendance)
plot(MLBattend$wins, MLBattend$attendance)
plot(MLBattend$games.behind, MLBattend$attendance)


## Rimuovo i dati con year != 0 (probabilmente corrispondeva al 2000)
dati <- MLBattend[MLBattend$year != 0, ]
plot(dati$year, dati$attendance)

## USARE LA LIBRERIA "corrplot" PER CORRELAZIONI MULTIVARIATE
install.packages("corrplot")
library(corrplot)

## Testo la correlazione delle variabili che mi interessano
test = cor.test(dati[ ,c("year", "attendance", 
                          "runs.scored", "wins", "games.behind")])

corrplot(cor(dati[ ,c("year", "attendance", 
                      "runs.scored", "wins", "games.behind")]),
         p.mat = test$p, sig.level = 0.01,
         order = 'hclust', addrect = 2)


## Genero il modello lineare con Y = attendance rispetto alle altre variabili
lm(attendance ~ year + runs.scored + wins + games.behind, data = dati) -> modMLB
## Analizzo il modello generato
summary(modMLB)

# runs.scored  -3.804e+01  2.838e+02  -0.134   0.8934 
## Osservo che `runs.scored` non è ritenuto correlato


## Ristimo il modello togliendo `runs.scored`
lm(attendance ~ year + wins + games.behind, data = dati) -> modMLB
## Analizzo il modello generato
summary(modMLB)

## Osservo che ora, tutte le variabili presenti nel modello sono considerate 
## altamente significative

