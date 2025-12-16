# 73
nrow(dati)
mean(dati$compressione_B)
sd(dati$compressione_B)
sum(dati$compressione_B > 50)
quantile(dati$compressione_B, 0.2)


boxplot(dati$compressione_A, dati$compressione_B)


t.test(dati$compressione_A, dati$compressione_B, alternative = "t", mu = 0,
       paired = TRUE)


# 74
nrow(dati)
mean(dati$durata[dati$marca == "B"])
sd(dati$durata[dati$marca == "B"])
sum(dati$durata[dati$marca == "B"] > 10)
quantile(dati$durata[dati$marca == "B"], 0.95)

barplot(table(dati$marca))
hist(dati$durata)
boxplot(dati$durata[dati$marca == "A"],
        dati$durata[dati$marca == "B"],
        names = c("A", "B"))

t.test(dati$durata[dati$marca == "B"], dati$durata[dati$marca == "A"],
       paired = FALSE, mu = 0, alternative = "greater")


# 75
nrow(dati)
mean(dati$trazione[dati$materiale == "B"])
sd(dati$trazione[dati$materiale == "B"])

sum(dati$trazione[dati$materiale == "B"] >= 30)

quantile(dati$trazione[dati$materiale == "B"], probs = 0.8)

boxplot(dati$trazione[dati$materiale == "A"], 
        dati$trazione[dati$materiale == "B"])
boxplot(dati$trazione[dati$materiale == "B"], 
        dati$trazione[dati$materiale == "A"])
barplot(table(dati$materiale))
hist(dati$trazione)

t.test(dati$trazione[dati$materiale == "A"], 
       dati$trazione[dati$materiale == "B"],
       mu = 0, paired = FALSE, alternative = "t")

# 76
nrow(dati)
sum(is.na(dati))
mean(dati$index_PRE, na.rm = TRUE)
sd(dati$index_PRE, na.rm = TRUE)

quantile(dati$index_PRE, 0.75, na.rm = TRUE)

boxplot(dati$index_POST, dati$index_PRE)

t.test(dati$index_PRE, dati$index_POST, 
       mu = 0, paired = TRUE, alternative = "less")



# 77
table(dati$gruppo)
mean(dati$index[dati$gruppo == "I"])
sd(dati$index[dati$gruppo == "I"])
quantile(dati$index[dati$gruppo == "I"], 0.85)

boxplot(dati$index[dati$gruppo == "I"],
        dati$index[dati$gruppo == "T"])

t.test(dati$index[dati$gruppo == "I"], dati$index[dati$gruppo == "T"],
       alternative = "g", paired = FALSE) -> test
test$parameter



















