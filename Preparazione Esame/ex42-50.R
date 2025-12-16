# 42

# L’urna A contiene 10 palline bianche e 10 nere. L’urna B contiene 5 palline 
# bianche e 15 nere. Viene lanciata una moneta non truccata: se esce testa 
# allora vengono fatte 3 estrazioni senza reinserimento dall’urna A; 
# se esce croce vengono fatte 5 estrazioni con reinserimento dall’urna B.

# Calcolare la probabilità di estrarre esattamente 2 palline bianche sapendo 
# di aver ottenuto testa. 

## SONO NELLA A: (10 nere, 10 bianche)
## BBN, BNB, NBB

10/20 * 9/19 * 10/18 +
10/20 * 10/19 * 9/18 +
10/20 * 10/19 * 9/18 -> esatt2bianche_A
## 0.3947
?choose
## EQUIVALE A:
( choose(10,2)*choose(10,1) )/( choose(20,3) )
## Che sono tutte le possibili combinazioni di scelta di 2 bianche ed una nera
## sui loro campioni da 10 ciascuna, sul totale di 20 palline


# Calcolare la probabilità di estrarre esattamente 2 palline bianche sapendo 
# di aver ottenuto croce.

## SONO NELLA B: (5 bianche, 15 nere), REIMBUSSOLAMENTO -> BINOMIALE
?dbinom
dbinom(2, 5, 5/(5+15)) -> esatt2bianche_B
##0.2637

# Calcolare la probabilità che vengano estratte esattamente 2 palline bianche.
0.5 * esatt2bianche_A + 0.5 * esatt2bianche_B
##0.3292

# Sapendo che sono state estratte esattamente 2 palline bianche, calcolare la 
# probabilità che sia uscita testa.

esatt2bianche_A / (esatt2bianche_A + esatt2bianche_B)

##0.5995

################################################################################
# 44

## 3 monete. La moneta A ha p(testa) = p.
## La moneta B ha p(testa) = p/2. -> p(croce) = (2-p)/2
## La moneta C ha p(testa) = p/3. -> p(croce) = (3-p)/3

## 1°) Si lancia A. 
## 2°) Se era uscita testa si lancia A, altrimenti B.
## 3°) Se era uscita testa si lancia A, se croce ed ero in A, allora B;
##     se croce ed ero in B, allora C.

## se p = 1/4 determina P(T, T, T):
1/4 * 1/4 * 1/4

# se p = 1/2 determina p(C, C, C):
1/2 * 3/4 * 5/6

## se p = 1/4 determina P(?, T, T):
1/4 * 1/4 * 1/4 + 3/4 * 1/8 * 1/4


################################################################################

#46

# Sia X una variabile aleatoria distribuita come una Normale di media 0.2
# e varianza 1. Sia Y una variabile aleatoria distribuita come una Esponenziale
# di parametro ('rate') pari a 1, indipendente da X.

#Determinare:
    
# La probabilità che Y sia maggiore di 2.
?pexp
1 - pexp(2, 1) -> Ybigger2

# La probabilità che almeno una delle due variabili aleatorie sia maggiore di 2.
1 - pnorm(2, 0.2, 1) -> Xbigger2

Xbigger2 + Ybigger2 - Xbigger2 * Ybigger2

# La probabilità che al massimo una delle due sia maggiore di 1.
1 - pnorm(1, 0.2, 1) -> Xbigger1
1 - pexp(1, 1) -> Ybigger1

1 - Xbigger1 * Ybigger1

################################################################################

# 47

# Siano X1,X2,X3 tre variabili aleatorie indipendenti e identicamente 
# distribuite, con distribuzione Normale di media 0.2 e varianza 1.
# Determinare:
    
# La probabilità che X2 sia maggiore di 2. 
1 - pnorm(2, 0.2, 1) 


# La probabilità che almeno una delle tre variabili aleatorie sia maggiore di 1.
## CORRISPONDE AD: 1 - p(tutte minori di 1)
1 - (pnorm(1, 0.2, 1) * pnorm(1, 0.2, 1) * pnorm(1, 0.2, 1))

# La probabilità che Y=2X2−0.4 sia maggiore di 1.

# X ~ N (mu, sigma)
# Y = aX + b 
# Y ~ N(a*mu + b, sqrt(a*a*sigma*sigma))

## IN QUESTO CASO: y ~ N(2*0.2 - 0.4, sqrt(2*2*1*1)) -> Y ~ N(0, 2)

1 - pnorm(1, 0, 2)


################################################################################

# 48

# Sia X una variabile aleatoria continua distribuita come una Uniforme 
# sull'intervallo [2,10].  Determinare:
##Comandi di R che potrebbero essere utili: punif, dunif

# La probabilità che X sia minore della sua media. Answer
?punif
## LA MEDIA DI UN UNIFORME E' LA SOMMA DEGLI ESTREMI DIVISO 2, IN QUESTO CASO: 6
punif(6, min = 2, max = 10)


# La probabilità che X sia maggiore di 3. Answer
1 - punif(3, min = 2, max = 10)


# La probabilità che X  sia compresa fra -2 e 3. Answer
punif(3, min = 2, max = 10)


# La probabilità che X  sia maggiore di 3 sapendo che X è minore di 6. Answer
(punif(6, min = 2, max = 10) - punif(3, min = 2, max = 10) 
    ) / (punif(6, min = 2, max = 10))

################################################################################

# 49

# Sia Y una variabile aleatoria distribuita come una Normale di media −5
# e varianza 1  Consideriamo X=Y+4 Determinare:
    
# La probabilità che X sia negativa. Answer
## X ~ N(1 * (-5) + 4, sqrt(1)) -> X ~ N(-1, 1)
pnorm(0, -1, 1)

# La probabilità che −X sia compresa fra -2 e 1. Answer
## X compresa fra -1 e 2
pnorm(2, -1, 1) - pnorm(-1, -1, 1)


# La probabilità che X sia positiva sapendo che 2X è minore di 3.
## X MINORE DI 1.5
(pnorm(1.5, -1, 1) - pnorm(0, -1, 1)) / pnorm(1.5, -1, 1)

################################################################################

# 50

# Sia X una variabile aleatoria distribuita come una Esponenziale di parametro 
# ('rate') pari a 2. Sia Y una variabile aleatoria distribuita come una 
# Esponenziale di parametro ('rate') pari a 1, indipendente da X .

#Determinare:
    
# La probabilità che X sia maggiore di 3. 
1 - pexp(3, 2)


# La probabilità che entrambe le variabili aleatorie siano maggiori di 2. 
(1 - pexp(2, 2)) * (1 - pexp(2, 1))


# La probabilità che X sia minore di 7 sapendo che X è maggiore di 6.

(pexp(7, 2) - pexp(6, 2)) / (1 - pexp(6, 2))



