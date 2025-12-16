#25
View(dati)

# numero di elementi
nrow(dati)

# average strength of material B
mean(dati$trazione[dati$materiale == "B"])

# standard deviation
sd(dati$trazione[dati$materiale == "B"])

# number of elements of material b with strength >= 30
sum(dati$trazione[dati$materiale == "B"] >= 30)

# Twenty percent of the tensile strength observations for bars 
# of material B are greater than
?quantile
quantile(dati$trazione[dati$materiale == "B"], probs = 0.80)

# Confronto tra grafi
barplot(table(dati[,"materiale"]), xlab = "materiale", main = "A")

boxplot(dati$trazione[dati$materiale == "A"],
        dati$trazione[dati$materiale == "B"],
        names = c("materiale A", "Materiale B"),
        ylab = "trazione",
        main = "B")

hist(dati$trazione, main = "C")

boxplot(dati$trazione[dati$materiale == "B"],
        dati$trazione[dati$materiale == "A"], 
        names = c("materiale B", "Materiale A"),
        ylab = "trazione",
        main = "D")


# You want to give a quantitative answer to the question: do the two materials 
# perform the same? That is, is the average tensile strength the same for the 
# two materials?
# To answer this question you calculate:


## a hypothesis test for the difference of averages, for independent samples, 
## with null hypothesis H_0: mu_A = mu_B
t.test(dati$trazione[dati$materiale == "A"],
       dati$trazione[dati$materiale == "B"],
       alternative = "two.sided",
       mu = 0,
       paired = FALSE)

## the two materials on average do NOT have the same performance