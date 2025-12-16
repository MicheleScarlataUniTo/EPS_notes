#71
nrow(dati)
mean(dati$time_new_version)
sd(dati$time_new_version)
sum(dati$time_new_version > 26.5)
quantile(dati$time_new_version, 0.9)

hist(dati$time_old_version)
boxplot(dati$time_old_version, dati$time_new_version)

t.test(dati$time_new_version, dati$time_old_version,
       paired = TRUE, alternative = "l")




# 72
nrow(dati)
mean(dati$compressione_B)
sd(dati$compressione_B)
sum(dati$compressione_B > 50)
quantile(dati$compressione_B, 0.2)

boxplot(dati$compressione_A, dati$compressione_B)
hist(dati$compressione_A, breaks = 15)

t.test(dati$compressione_A, dati$compressione_B,
       paired = TRUE, alternative = "t")




# 74
nrow(dati)
mean(dati$durata[dati$marca == "B"])
sd(dati$durata[dati$marca == "B"])

sum(dati$durata[dati$marca =="B"] >= 10)
quantile(dati$durata[dati$marca =="B"], 0.95)

barplot(table(dati$marca))
hist(dati$durata, breaks = 10)
boxplot(dati$durata[dati$marca == "A"],
        dati$durata[dati$marca == "B"])

t.test(dati$durata[dati$marca == "A"],
       dati$durata[dati$marca == "B"],
       alternative = "two.sided", paired = FALSE)$parameter



# 75
nrow(dati)
mean(dati$trazione[dati$materiale == "B"])
sd(dati$trazione[dati$materiale == "B"])
sum(dati$trazione[dati$materiale == "B"] >= 30)
quantile(dati$trazione[dati$materiale == "B"], 0.8)


barplot(table(dati$materiale))
hist(dati$trazione)
boxplot(dati$trazione[dati$materiale == "A"],
        dati$trazione[dati$materiale == "B"])


t.test(dati$trazione[dati$materiale == "A"],
       dati$trazione[dati$materiale == "B"],
       paired = FALSE, alternative = "t")


# 76
nrow(dati)
sum(is.na(dati))
mean(dati$index_PRE, na.rm = TRUE)
sd(dati$index_PRE, na.rm = TRUE)
quantile(dati$index_PRE, 0.75, na.rm = TRUE)

boxplot(dati$index_PRE, dati$index_POST)

t.test(dati$index_PRE, dati$index_POST,
       paired = TRUE, alternative = "l")


# 24
table(dati$algoritmo)

sum(is.na(dati))

mean(dati$tempo[dati$algoritmo == "alg_A"])
sd(dati$tempo[dati$algoritmo == "alg_A"])

quantile(dati$tempo[dati$algoritmo == "alg_A"], probs = 0.95)

boxplot(dati$tempo[dati$algoritmo == "alg_A"],
        dati$tempo[dati$algoritmo == "alg_B"],
        names = c("A", "B"))

t.test(dati$tempo[dati$algoritmo == "alg_A"], conf.level = 0.99)
t.test(dati$tempo[dati$algoritmo == "alg_B"], conf.level = 0.99)

t.test(dati$tempo[dati$algoritmo == "alg_A"],
       dati$tempo[dati$algoritmo == "alg_B"],
       paired = FALSE, alternative = "t")

t.test(dati$tempo[dati$algoritmo == "alg_A"],
       dati$tempo[dati$algoritmo == "alg_B"],
       paired = FALSE, alternative = "t",
       conf.level = 0.99)


#25

nrow(dati)
mean(dati$trazione[dati$materiale == "B"])
sd(dati$trazione[dati$materiale == "B"])
sum(dati$trazione[dati$materiale == "B"] >= 30)
quantile(dati$trazione[dati$materiale == "B"], probs = 0.8)

hist(dati$trazione)
barplot(table(dati$materiale))
boxplot(dati$trazione[dati$materiale == "A"],
        dati$trazione[dati$materiale == "B"])

t.test(dati$trazione[dati$materiale == "A"],
       dati$trazione[dati$materiale == "B"],
       paired = FALSE, alternative = "t")



# 26
nrow(dati)
sum(is.na(dati))
mean(dati$vel[dati$sicurezza == "presente"])
sd(dati$vel[dati$sicurezza == "presente"])

quantile(dati$vel, 0.9, na.rm = T)

hist(dati$vel)

binom.test(sum(dati$sicurezza == "presente"), nrow(dati),
           p = 0.6, alternative = "g")

sum(dati$sicurezza == "presente")

#27
pnorm(1.5, 0, 2)
1 - pnorm(3, 0, 2)
(pnorm(6, 0, 2) - pnorm(3, 0, 2)) / (pnorm(6, 0, 2))

#28
1 - pnorm(3, 2, 2)
(1 - pnorm(3, 2, 2)) * (1 - pnorm(3, 0, 1))
(pnorm(7, 2, 2) - pnorm(6, 2, 2)) / (1 - pnorm(6, 2, 2))


# 29
pnorm(1, 0, 2) - pnorm(-2, 0, 2)

#31
1 - pnorm(13, 10, 4)
pnorm(12, 10, 4) - pnorm(8.5, 10, 4)
(1 - (pnorm(12, 10, 4) - pnorm(8.5, 10, 4)) - pnorm(8, 10, 4)) / (1 - pnorm(8, 10, 4))
(pnorm(7, 10, 4) - pnorm(6, 10, 4)) / (1 - pnorm(6, 10, 4))



## CHAT GPT
## Sia 𝑋 una variabile aleatoria distribuita secondo una distribuzione 
## geometrica con parametro 𝑝 = 0.4
## Sia 𝑌 una variabile aleatoria distribuita come una distribuzione di 
## Poisson con parametro 𝜆= 3 indipendente da 𝑋
## Determinare La probabilità che entrambe le variabili aleatorie 
## siano maggiori del loro parametro di distribuzione.
## Risposta:
(1 - pgeom(0.4, 0.4)) * (1 - ppois(3, 3,))


## Sia X una variabile aleatoria distribuita secondo una distribuzione di 
## Poisson con parametro lambda = 2
## Sia Y una variabile aleatoria distribuita come una distribuzione geometrica 
## con parametro p = 0.5, indipendente da X
## Determinare la probabilità che X sia compresa tra 1 e 3, sapendo che Y > 2.
## Risposta:

## DATO CHE SONO INDIPENDENTI, LA PROBABILITA' E' DATA DAL PRODOTTO
(ppois(3, 2) - ppois(1, 2)) * (1 - pgeom(2, 0.5))


                                                 
## Esame REPE 
chisq.test(table(dati))$expected
table(dati$Nido[dati$Foresta == "Primaria"])
table(dati$Nido[dati$Foresta == "Secondaria"])

dpois(2, 10) + dpois(7, 10) + dpois(8, 10) + dpois(9, 10)
1 - ppois(4, 10)
(ppois(3, 10) - dpois(0, 10)) / (1 - dpois(0, 10))
(pnorm(6, 1, 1) - pnorm(0.5, 1, 1)) / pnorm(6, 1, 1)

# Esame DAVIDE
(1/3)^3 + (2/3)^3

(1/3)^2 + (2/3)^2

(1/3)^4 + (2/3)^4


1 - pexp(3, 2) + pexp(1.5, 2)
1 - pexp(3, 2)
(pexp(6, 2) - pexp(3, 2))

table(dati$fertilizzante)
mean(dati$altezza[dati$fertilizzante == "A"])
sd(dati$altezza[dati$fertilizzante == "A"])
quantile(dati$altezza[dati$fertilizzante == "A"], 0.9)

boxplot(dati$altezza[dati$fertilizzante == "A"],
        dati$altezza[dati$fertilizzante == "B"],
        names = c("A", "B"))

t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       paired = FALSE, alternative = "t")
t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       paired = FALSE, alternative = "t")$parameter
t.test(dati$altezza[dati$fertilizzante == "A"],
       dati$altezza[dati$fertilizzante == "B"],
       paired = FALSE, alternative = "t")$p.value


nrow(dati)
sum(is.na(dati))
mean(dati$diametro[dati$altezza >= 25 & dati$altezza <= 35], na.rm = TRUE)
sd(dati$diametro[dati$altezza >= 25 & dati$altezza <= 35], na.rm = TRUE)
quantile(dati$altezza, 0.9, na.rm = TRUE)
boxplot(dati$altezza[dati$diametro < 40],
        dati$altezza[dati$diametro >= 40],
        names = c("< 40", ">=40"))

cor.test(dati$altezza, dati$diametro)
cor.test(dati$diametro, dati$altezza)
lm(dati$altezza ~ dati$diametro)
summary(lm(dati$altezza ~ dati$diametro))



# 38
0.3 * dbinom(3, 8, 7/11) + 0.7 * dbinom(3, 6, 7/11)
0.3 * dbinom(7, 8, 7/11)


0.3 * dbinom(2, 8, 7/11) + 0.7 * dbinom(2, 6, 7/11) +
0.3 * dbinom(1, 8, 7/11) + 0.7 * dbinom(1, 6, 7/11) +
0.3 * dbinom(0, 8, 7/11) + 0.7 * dbinom(0, 6, 7/11)



(
0.3 * dbinom(2, 8, 7/11) +
0.3 * dbinom(1, 8, 7/11) +
0.3 * dbinom(0, 8, 7/11)
    ) / (
0.3 * dbinom(2, 8, 7/11) + 0.7 * dbinom(2, 6, 7/11) +
0.3 * dbinom(1, 8, 7/11) + 0.7 * dbinom(1, 6, 7/11) +
0.3 * dbinom(0, 8, 7/11) + 0.7 * dbinom(0, 6, 7/11)
    )


# 47
## X ~ N(0.2, 1)
1 - pnorm(2, 0.2, 1)

## ALMENO UNA DELLE 3 MAGGIORE DI 1
## 1 - 'nessuno maggiore di 1'
1 - (pnorm(1, 0.2, 1))^3

## Y = 2X - 0.4 sia maggiore di 1
## Y = aX + b
## X ~ N(mu, var)
## Y ~ N(a * mu + b, a^2 * var)

## in questo caso ho: Y ~ N (2 * 0.2 - 0.4, 2^2 * 1) = N (0, 4)
## RICORDIAMO CHE R VUOLE sqrt(var) = deviazione standard
1 - pnorm(1, 0, 2)


# 59
## il primo successo (p = 0.4) si ha al quarto tentativo
?dgeom
## R vuole il numero di fallimenti consecutivi
dgeom(3, 0.4)

## il terzo successo è al settimo lancio
## HO DUE SUCCESSI SUI PRIMI SEI LANCI, CONSIDERO IL COEFF. BINOM
dbinom(2, 6, 0.4) * 0.4

## p(CCCT) * p(CT || TC) * p(T)
dgeom(3, 0.4) * dbinom(1, 2, 0.4) * 0.4








































































































































