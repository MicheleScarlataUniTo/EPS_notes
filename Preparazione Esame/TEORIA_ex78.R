#78
View(dati)
table(dati$algoritmo)
mean(dati$tempo[dati$algoritmo == "alg_A"])
sd(dati$tempo[dati$algoritmo == "alg_A"])
quantile(dati$tempo[dati$algoritmo == "alg_A"], 0.95)

boxplot(dati$tempo[dati$algoritmo == "alg_A"], 
        dati$tempo[dati$algoritmo == "alg_B"])

# Si vuole dare una risposta quantitativa alla domanda: 
# i tempi medi di risposta dei due algoritmi sono uguali?
# Per questa domanda calcoli:

## [X] due intervalli di confidenza per i tempi medi di risposta 
##     con i due algoritmi
?t.test
t.test(dati$tempo[dati$algoritmo == "alg_A"], conf.level = 0.99)
t.test(dati$tempo[dati$algoritmo == "alg_B"], conf.level = 0.99)

## gli intervalli di confidenza si sovrappongono per alcuni valori quindi 
## non posso dire che i due tempi medi sono diversi

t.test(dati$tempo[dati$algoritmo == "alg_A"], 
       dati$tempo[dati$algoritmo == "alg_B"],
       paired = FALSE, mu = 0, alternative = "t", conf.level = 0.99)
