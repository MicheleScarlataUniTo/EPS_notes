# 38

# Procedi con il seguente esperimento: 
# lanci una moneta truccata che restituisce testa con probabilità 0.3. 
# Se ottieni testa estrai con reimbussolamento 8 palline da un’urna che ne 
# contiene 11, delle quali 4 sono bianche e 7 sono verdi. Se ottieni croce 
# estrai, con reimbussolamento dalla stessa urna, 6 palline.

# Con quale probabilità ottieni 3 palline verdi? 
## ?? dbinom(SUCCESSI, TENTATIVI, pSUCC)
p <- 7/11
0.3 * dbinom(3, 8, p) + 0.7 * dbinom(3, 6, p)

#  Con quale probabilità ottieni 7 palline verdi? 
0.3 * dbinom(7, 8, p)


#  Con quale probabilità ottieni meno di (<) 3 palline verdi? 
0.3 * dbinom(2, 8, p) + 0.7 * dbinom(2, 6, p) +
0.3 * dbinom(1, 8, p) + 0.7 * dbinom(1, 6, p) +
0.3 * dbinom(0, 8, p) + 0.7 * dbinom(0, 6, p)



#  Con quale probabilità avevi ottenuto testa se hai estratto meno di (<) 
#  3 palline verdi?
(
    0.3 * dbinom(2, 8, p) + 
    0.3 * dbinom(1, 8, p) + 
    0.3 * dbinom(0, 8, p) 
) / (
    0.3 * dbinom(2, 8, p) + 0.7 * dbinom(2, 6, p) +
    0.3 * dbinom(1, 8, p) + 0.7 * dbinom(1, 6, p) +
    0.3 * dbinom(0, 8, p) + 0.7 * dbinom(0, 6, p)
)


#40

#Un'urna contiene 5 palline bianche, 6 nere e 4 rosse. Si estraggono 2 palline.

# Si calcoli la probabilità che le due palline estratte siano dello stesso 
# colore con estrazione in blocco. 
(
    choose(5, 2) + choose(6, 2) + choose(4, 2) 
) / (
    choose(5+6+4, 2)
)


# Si calcoli la probabilità che le due palline estratte siano dello stesso 
# colore se la prima viene rimessa nell'urna prima di estrarre la seconda. 
(5/15 * 5/15) + (6/15 * 6/15) + (4/15 * 4/15)


# NB: possibili funzioni di R utili: choose() factorial()

