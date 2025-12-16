# 61
# Si hanno a disposizione 3 scatole. La scatola A contiene 12 palline rosse e 12
# palline nere. La scatola B contiene 10 palline rosse e 30 palline nere. La 
# scatola C contiene 3 palline rosse e 15 palline nere.
# Si estraggono tre palline in tre estrazioni consecutive con reintroduzione con
# la seguente procedura:
    
# - Prima estrazione: Si estrae una pallina dalla scatola A.

# - Seconda estrazione: Se all'estrazione precedente si è estratta una pallina 
#    rossa allora si estrae una pallina dalla scatola A. Se invece si è estratta 
#    una pallina nera si estrae una pallina dalla scatola B.

# - Terza estrazione: Se nell'estrazione precedente si è estratta una pallina 
#     rossa allora si estrae una pallina dalla scatola A. Se nella prima 
#     estrazione si è estratta una pallina rossa e nella seconda estrazione si è
#     estratta una pallina nera, allora si estrae una pallina dalla scatola B. 
#     Infine, se nella prima e nella seconda estrazione si è estratta una 
#     pallina nera allora si estrae una pallina dalla scatola C.

# Determinare la probabilità della sequenza (Rossa, Rossa, Rossa) 
## RIMANIAMO SEMPRE NELLA A
(12/24)^3

# Determinare la probabilità della sequenza (Nera, Nera, Nera) 
(12/24) * (30/40) * (15/ 18)

# Determinare la probabilità che si estragga una pallina rossa sia alla seconda 
# sia alla terza estrazione.
## RRR oppure NRR
(12/24)^3 + (12/24)*(10/40)*(12/24)
################################################################################
#  62

# L'urna U1 contiene una proporzione 0.3 di palline bianche e l'urna U2
# una proporzione 0.5 di palline bianche. Si estraggono con reimbussolamento 4 
# palline da U1 e 6 da U2 . Tutte le palline estratte vengono sistemate in una 
# terza urna U3. Sia X la proporzione di palline bianche nell'urna U3. Calcolare


## X corrisponde alla somma delle palline estratte dalle due urne / 10
# il valore atteso EX
((4 * 0.3) + (6 * 0.5)) / 10 -> EX
## EX = p ; SU SINGOLA ESTRAZIONE BERNOULLIANA

# la varianza VarX
## var(binom(n, p)): `n` tentativi, `p` prob. succ. = n * p * (1-p)

## RICORDIAMO 
##     VAR[X + Y] = VAR[X] + VAR[Y]
##     VAR[aX + b] = a^2 * VAR[X]

## DUNQUE, dato X = ((palline estratte da U1) + (palline estratte da U2)) / 10
((4 * 0.3 * 0.7) + (6 * 0.5 * 0.5))/(10^2) -> VAR


# il momento secondo EX2
## RICORDIAMO:
##     VARIANZA(X) = MOMENTO_SECONDO(X) - (VALORE_ATTESO(X))^2

##  -> MOMENTO_SECONDO(X) = VARIANZA(X) + (VALORE_ATTESO(X))^2
VAR + EX*EX


################################################################################
# 64

# Ci sono quattro dadi in un cassetto: un tetraedro (4 facce numerate da 1 a 4), 
# un esaedro (cioè un cubo, 6 facce numerate da 1 a 6) e due ottaedri (8 facce
# numerate da 1 a 8). La tua amica prende segretamente e uniformemente a caso 
# uno dei quattro dadi e lo lancia.

# Determinare la probabilità di ottenere un numero compreso fra 2 e 5, estremi 
# inclusi 
0.25 * (3/4 + 4/6 + 4/8 + 4/8)

# Sai che è uscito 4 oppure 5. Qual è la probabilità che sia stato lanciato un 
# ottaedro? 
(2/8 + 2/8) / (1/4 + 2/6 + 2/8 + 2/8)

# Sapendo che è uscito 4 oppure 5, determinare la probabilità che sia uscito 4 
# da un lancio di un ottaedro
(1/8 + 1/8) / (1/4 + 2/6 + 2/8 + 2/8)


################################################################################
# 66

# Siano date 3 urne e 4 palline indistinguibili. Si definisca l'evento Aj
#  = "l'urna j-esima resta vuota", con j = 1, 2, 3. Calcolare con quale 
# probabilità, inserendo uniformemente a caso e indipendentemente le 4 palline
# nelle 3 urne,

#  la prima urna resti vuota; 
(2/3)^4

# la seconda urna resti vuota; 
(2/3)^4

# almeno un'urna resta vuota; 
(2/3)^4 -> Ui_vuota
(1/3)^4 -> Uij_vuote
0 -> Uijk_vuote
3*Ui_vuota - 3*Uij_vuote + Uijk_vuote -> almeno_una_vuota

# due urne restano vuote se almeno una delle tre urne è vuota;
(3 * Uij_vuote) / (almeno_una_vuota)

################################################################################
# 69

# You toss five times a fair coin. Calculate:
    
# the probability of the event A = "the first three outcomes are equal"
2 * (1/2)^3

# the probability of the event B = "the first three or the last three 
# outcomes are equal" 
2 * (1/2)^3 + 2 * (1/2)^3 - 2 * (1/2)^5

# P(A|B) = P(A & B) / P(B)
(2 * (1/2)^3) / (2 * (1/2)^3 + 2 * (1/2)^3 - 2 * (1/2)^5)
















