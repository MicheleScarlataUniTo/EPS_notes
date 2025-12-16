nrow(dati)
sum(is.na(dati))

mean(dati$diametro[dati$altezza >= 25 & dati$altezza <= 35], na.rm = TRUE)
sd(dati$diametro[dati$altezza >= 25 & dati$altezza <= 35], na.rm = TRUE)

quantile(dati$altezza, probs =  0.9, na.rm = TRUE)

boxplot(dati$diametro[dati$altezza < 40])


cor.test(dati$diametro, dati$altezza)
lm(dati$altezza ~ dati$diametro) -> modello
summary(modello)





pexp(1.5, 2) + 1 - pexp(3, 2)
1 - pexp(3, 2)
(pexp(6, 2) - pexp(3, 2)) 




table(dati$fertilizzante)
mean(dati$altezza[dati$fertilizzante == "A"], na.rm = TRUE)
sd(dati$altezza[dati$fertilizzante == "A"], na.rm = TRUE)
quantile(dati$altezza[dati$fertilizzante == "A"], probs = 0.9)
boxplot(dati$altezza[dati$fertilizzante == "A"],
        dati$altezza[dati$fertilizzante == "B"])


t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       alternative = "two.sided",
       mu = 0, paired = FALSE, na.rm = TRUE) -> test

test$parameter

t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       alternative = "l",
       mu = 0, paired = FALSE, na.rm = TRUE)

t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       alternative = "g",
       mu = 0, paired = FALSE, na.rm = TRUE)