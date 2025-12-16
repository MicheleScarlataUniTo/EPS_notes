#______________________________________________________________________________
#
## LA VARIABILE CONSIDERATA HA UN CERTO FIT SU UNA PMF?
#______________________________________________________________________________
# es: "I trattamenti vengono scelti con uguale probabilità?"
# -> mi chiedo se abbiano tutti p = 0.25

## IDEA: chisq.test(vettore dei casi, vettore delle probabilità)
?chisq.test
chisq.test(c(66, 92, 73, 22), p = c(0.25, 0.25, 0.25, 0.25))
## ANALOGO A: (indico di ripetere 4 volte 0.25)
chisq.test(c(66, 92, 73, 22), p = rep(0.25, 4))

## p-value = 4.895e-09 -> Rifiuto H0 a favore di H1: non ha la PMF richiesta

## OSS: DEVO CONTROLLARE LA REGOLA DI COCHRAN SUGLI EXPECTED:
chisq.test(c(66, 92, 73, 22), p = rep(0.25, 4))$expected


# Altro esempio:
giorniArma <- c(74, 60, 66, 71, 51, 66, 76)
chisq.test(giorniArma, p = rep(1/7, 7))
chisq.test(giorniArma, p = rep(1/7, 7))$expected
## p-value = 0.3417 -> Accetto H0: Vi è distribuzione uniforme


#______________________________________________________________________________
#
## TEST DI KOLMOGOROV-SMIRNOV PER DUE CAMPIONI
#
## "DETERMINARE SE DUE VARIABILI ALEATORIE CAMPIONARIE ABBIANO STESSA PMF"
#______________________________________________________________________________

## H0: FX campionaria ~ G
## H1: FX campionaria !~ G

## NOTA: PER USARE KS TEST, DEVO CONFRONTARE DUE CAMPIONI.


# Verificare se cotinina2 è distribuita come una normale(173, 120).
cotinina2<-c(1.5, 0, 131, 173, 265, 210,  44, 277,  32, 3, 35, 112, 477, 289,
             227, 103, 222, 149, 313, 491, 130, 234, 164, 198, 17, 253, 87,
             121, 266, 290, 123, 167, 250, 245, 48, 86, 284, 1, 208, 173.5)

hist(cotinina2, breaks = 20)
## OSS: G := pnorm(mean = 173, sd = 120)
ks.test(cotinina2, "pnorm", mean = 173, sd = 120)
# p-value = 0.8752 -> Accetto H0, in quanto non ho sufficiente evidenza che X
#           campionaria non sia una distribuzione normale


## Altro esempio:

# Verificare se il punteggio `math` ed il punteggio `verbal` hanno la stessa
# distribuzione.

## OSS: IN QUESTO CASO, ENTRAMBE LE PMF SONO CAMPIONARIE

data("stud.recs")
ks.test(stud.recs$sat.m, stud.recs$sat.v)

# p-value = 0.0015 -> Rifiuto H0 a favore di H1 -> I due punteggi non hanno la
#                     stessa distribuzione

plot(density(stud.recs$sat.m), col = "red")
lines(density(stud.recs$sat.v), col = "blue")


#______________________________________________________________________________
#
## TEST DI SHAPIRO-WILK PER PER LA NORMALITA'
#
## "DETERMINARE SE UNA VARIABILE ALEATORIE CAMPIONARIA SIA UNA NORMALE"
#______________________________________________________________________________

## OSS: KOLMOGOROV-SMIRNOV NON MI PERMETTE DI DETERMINARE SE UNA VARIABILE
##      ALEATORIA CAMPIONARIA ABBIA UNA PMF DELLA QUALE NON CONOSCO I PARAMETRI

## H0: FX campionaria ~ NORMALE
## H1: FX campionaria !~ NORMALE

?shapiro.test
shapiro.test(cotinina2)

# p-value = 0.04662 -> Debole significatività che mi porta a rifiutare che
#                     cotinina2 sia una normale

## OSS: SHAPIRO TEST E' MOLTO PIU' PRECISO DI KS TEST PER DETERMINARE NORMALI



#______________________________________________________________________________
#
## CORRELAZIONE E REGRESSIONE LINEARE
#
## "DETERMINARE SE UNA STIMA DELLA CORRELAZIONE TRA DUE VARIABILI"
#______________________________________________________________________________
library(readxl)
read_excel("body_data.xlsx") -> bodyData

## Estrraggo solo le femmine, tenendo tutte le colonne dei dati
bodyData[bodyData$`GENDER (1=M)` == 0, ] -> bodyFemale 

## Misuro la correlazione tra la densità di globuli bianchi e la pressione
?cor.test

## H0: I DATI NON SONO SCORRELATI
## H1: I DATI SONO CORRELATI


## MI CHIEDO QUANTO `WHITE` (`Y`) SIA CORRELATO AL VERIFICARSI DI `PULSE` (`X`)
cor.test(bodyFemale$WHITE, bodyFemale$PULSE)

# p-value = 0.007258 -> Rifiuto H0 a favore di H1, è accettabile considerare i
#                       dati come correlati

# cor = 0.2205849 -> Vi è una bassa correlazione positiva


## DETERMINO IL LINEAR MODEL

## lm (CIO' CHE VOGLIO DETERMINARE ~ CIO' DA CUI DIPENDE)
## SI PUO' IMMAGINARE COME FUNZIONE: lm(asseY ~ asseX)
lm(bodyFemale$WHITE ~ bodyFemale$PULSE)
# Alternativamente, in maniera equivalente, specifico data frame e parametri
lm(data = bodyFemale, WHITE ~ PULSE)

# Coefficients:
# (Intercept)        PULSE  
#   4.06293         0.03454 

# Y = a*X + b + err

# b := Intercept
# a := `PULSE` (in questo caso, dato che sarà coeff. di PULSE)

## STIMA SENZA INTERCETTA: lm(data = bodyFemale, WHITE ~ PULSE - 1)

## OSS: L'output è "scarno", lo assegno ad una variabile per osservarlo meglio

lm(data = bodyFemale, WHITE ~ PULSE) -> bodyFemale_lm
View(bodyFemale_lm)

## Restituisce molte più informazioni rispetto all'output di lm, ma meno che
## osservando l'intero output
summary(bodyFemale_lm)

## NELLO SPECIFICO, OSSERVO:

# Coefficients:
#              Estimate   Std.Error   t value       Pr(>|t|) 
# (Intercept)  4.06293    0.95241     4.266       3.57e-05 ***
#    PULSE     0.03454    0.01268     2.723       0.00726 ** 

# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1



## La prima riga corrisponde a `b`, la seconda ad `a`

## L'ultimo valore sulla riga corrisponde al p-value del test per la nullità
## del parametro


## MI VIENE INOLTRE RESTITUITO:

# Multiple R-squared:  0.04866,	Adjusted R-squared:  0.0421 

## R-squared è il rapporto tra la variazione spiegata dal modello e la 
## variazione totale (lo voglio il più vicino possibile ad 1)

## In questo caso è piccolo -> la relazione lineare tra X ed Y spiega pochissimo
## la variabilità delle Y, come verifico da:

## SCATTERPLOT CON `PULSE` COME `X`, `WHITE` COME `Y`
plot(bodyFemale$PULSE, bodyFemale$WHITE)

## Adjusted R-squared è una versione di R-squared penalizzata dal numero di
## variabili che compongono il mio modello (la retta ottenuta da lm), in
## questo caso sono solo `a` e `b`, ma spesso si hanno casi del tipo:
## Y = a1*X1 + a2*X2 + ... + b



## DEVO ANCORA ANALIZZARE I RESIDUI

## VERIFICA I RESIDUI PER OGNI FITTED VALUE (idealmente il più vicini a zero)
plot(bodyFemale_lm, which = 1)

## VERIFICA LA NORMALITA' DEI RESIDUI

## GRAFICO CHE `PLOTTA` I QUANTILI DEI MIEI DATI RISPETTO 
## AI QUANTILI DELLA NORMALE
plot(bodyFemale_lm, which = 2)

## Osservo che il maggiore errore rispetto alla normale vi è nei residui più
## bassi. Verifico tramite istogramma sui residui che essi non siano distr.
## come una normale nella parte più bassa:

hist(residuals(bodyFemale_lm))




## INFINE, DOPO AVER ANALIZZATO I RESIDUI, ANALIZZO PER UN EVENTUALE PRESENZA
## DI VALORI ANOMALI CHE INFLUENZANO LA STIMA DEL MODELLO

## PER CIASCUNA OSSERVAZIONE, PLOTTO LA DISTANZA DI COOK, ASSEGNANDO LABEL 
## CORRISPONDENTI ALLE i-ESIME OSSERVAZIONI, RITENUTE VALORI ANOMALI SECONDO
## LA DISTANZA DI COOK

## LA DISTANZA DI COOK MISURA L'INFLUENZA DELL'OSSERVAZIONE, OVVERO:
## LA PRESENZA/ASSENZA DELL'i-ESIMA OSSERVAZIONE, INFLUISCE MOLTO SUL MODELLO?
plot(bodyFemale_lm, which = 4)

## noto che 30, 50 e 99 sono indici con osservazioni che influiscono molto

bodyFemale[30, c("PULSE", "WHITE")]
# PULSE WHITE
# <dbl> <dbl>
#  94   14.3

## osservo che nel plot, è outlier su WHITE:
plot(bodyFemale$PULSE, bodyFemale$WHITE)

## mi è confermato dal boxplot su WHITE
boxplot(bodyFemale$WHITE)


## osservando gli altri due:
bodyFemale[50, c("PULSE", "WHITE")]
bodyFemale[99, c("PULSE", "WHITE")]

## deduco che siano otlier sulla nuvola di punti (alla loro `PULSE`, non è 
## comune avere un il loro valore in `WHITE`)


## ORA CHE HO FINITO, POSSO USARE IL MIO MODELLO PER FARE UNA PREVISIONE DELLA
## Y PER UN VALORE DI X CHE NON E' TRA I MIEI CAMPIONI:
?predict

## che valore ho in `WHITE` per `PULSE` = 91 ?
predict(bodyFemale_lm, newdata = data.frame(PULSE = 91))

## HO DUE MODI PER QUANTIFICARE L'INCERTEZZA DELLA PREVISIONE:
##  1) Incertezza legata alla stima della retta (quanto potrebbe cambiare la
##     retta cambiando il campione dal quale ne genero la stima).
##  2) Incertezza legata alla presenza dell'errore `err` nel modello.

## SE VOGLIO ANCHE UN INTERVALLO DI CONFIDENZA RELATIVO A (1)
predict(bodyFemale_lm, newdata = data.frame(PULSE = 91), 
        interval = "confidence")

## SE VOGLIO CONSIDERARE ANCHE (2)
predict(bodyFemale_lm, newdata = data.frame(PULSE = 91), 
        interval = "prediction")





