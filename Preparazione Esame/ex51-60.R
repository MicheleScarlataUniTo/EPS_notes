
# 51
# Sia X una variabile aleatoria continua distribuita come una Uniforme 
# sull'intervallo [0,1]. Determinare:

# La probabilità che X sia minore della sua media. 
0.5 
# propr. delle Uniformi, confermato da: 
punif(0.5, 0, 1)

# La probabilità che −X sia maggiore di −0.25 . 
# OVVERO X MINORE DI 0.25
punif(0.25, 0, 1)


# La probabilità che X−0.5  sia positiva sapendo che X è minore di 0.9.
## OVVERO 0.9 > X > 0.5 

(punif(0.9, 0, 1) - punif(0.5, 0, 1)) / punif(0.9, 0, 1)
 
################################################################################

# 52

# Sia X una variabile aleatoria distribuita come una Esponenziale di parametro 
# ('rate') pari a 0.2
# Sia Y una variabile aleatoria distribuita come una Esponenziale di parametro 
# ('rate') pari a 0.5 , indipendente da X .


#Determinare:
    
# La probabilità che Y sia maggiore di 3. 
1 - pexp(3, 0.5)


# La probabilità che almeno una delle due variabili aleatorie sia maggiore di 2. 
## CORRISPONDE A: 1 - p(nessuno maggiore di 2)
1 - (pexp(2, 0.2) * pexp(2, 0.5))

# La probabilità che X sia minore di 1 sapendo che X è minore di 2. 
pexp(1, 0.2) / pexp(2, 0.2)


################################################################################

# 53


# Sia Y una variabile aleatoria distribuita come una Normale di media 2 e 
# varianza 4. Consideriamo X=2−Y.
# Determinare:
    
# La probabilità che X sia negativa. 
# X ~ N(-1 *  2 + 2, sqrt(-1 * -1 * 4)) - > X ~ N(0, 2)
pnorm(0, 0, 2)

# La probabilità che −X sia compresa fra -2 e 1. 
## X COMPRESO TRA -1 E 2

pnorm(2, 0, 2) - pnorm(-1, 0 ,2)


# La probabilità che X sia negativa sapendo che X è maggiore di -3.
(pnorm(0, 0, 2) - pnorm(-3, 0, 2)) / (1 - pnorm(-3, 0, 2))


################################################################################

# 58
# Si tira cinque volte una moneta non truccata. Calcolare:
    
# la probabilità dell'evento A="i primi tre risultati sono uguali"
1/2*1/2

# la probabilità dell'evento  B="i primi tre o gli ultimi tre risultati sono
# uguali 

##(CCC..) OR (TTT..) OR (..CCC) OR (..TTT) - (TTTTT) - (CCCCC)
1/8 + 1/8 + 1/8 + 1/8 - 1/32 - 1/32


# P(A|B)
## P(A|B) = (P(B|A) * P (A)) / P(B)

## OSS: IN QUESTO CASO HO: P(B|A) * P (A) = P(A)

0.25 / (1/8 + 1/8 + 1/8 + 1/8 - 1/32 - 1/32)

################################################################################

# 59

# Una moneta sbilanciata viene lanciata ripetutamente. In ciascun lancio la 
# probabilità che esca T è 0.4. Calcolare la probabilità degli eventi:
    
# A="la prima T esce al quarto lancio"
?dgeom
dgeom(3, 0.4)
## ANALOGO A
0.6 * 0.6 * 0.6 * 0.4

# B="la terza T esce al settimo lancio"
## PROBABILITA' DI PRENDERE DUE TESTE ESATTE SU 6 LANCI * PROB. DI TESTA Al 7°

dbinom(2, 6, 0.4) * 0.4


# C=A∩B
## PROB. TESTA AL 4° LANCIO * PROB. TESTA AL 5° O 6° LANCIO * PROB. T AL 7°

dgeom(3, 0.4) * dbinom(1, 2, 0.4) * 0.4

################################################################################

# 60
# Ci sono quattro scatole in un armadio: la scatola A ha 4 palline numerate da 1 
# a 4, la scatola B ha sei palline numerate da 1 a 6), le scatole C e D  hanno 
# ambedue 8 palline numerate da 1 a 8. La tua amica prende segretamente e 
# uniformemente a caso una scatola e ne estrae una pallina.

# Determinare la probabilità di ottenere un numero minore o uguale a 3 (≤ 3) 
# oppure 5 
0.25 * (3/4 + 4/6 + 4/8 + 4/8)



# Sai che è uscito 4 oppure 5. Qual è la probabilità che la pallina sia stata 
# estratta dalla scatola C o dalla D? 
(2/8 + 2/8) / (1/4 + 2/6 + 2/8 + 2/8)



# Sai che è uscito 4 oppure 5. Qual è la probabilità che la pallina sia stata 
# estratta dalla scatola D?
(2/8) / (1/4 + 2/6 + 2/8 + 2/8)
































































































