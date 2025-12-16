# La variabile time in "nym.2002" contiene il tempo impiegato per terminare la
# maratona di NY per un campione casuale di coloro che hanno completato 
# la maratona.

# 1. % che ha completato la gara sotto le 3h
# 2. qual è il "time cutoff" per il miglior 10% dei concorrenti? e per il 25%?
# 3. qual è il "time cutoff" del 10% di coda? (peggior 10%).


# SOLUZIONE
library(UsingR)

# 1.
sum(nym.2002$time < 180) / length(nym.2002$time)

# 2.
quantile(nym.2002$time, 0.10)
quantile(nym.2002$time, 0.25)

# 3.
quantile(nym.2002$time, 0.90)


# Extra stuff
#media
mean(nym.2002$time)
#mediana
median(nym.2002$time)

hist(nym.2002$time)
hist(nym.2002$time, breaks = 100)
hist(nym.2002$time, breaks = 50)
hist(nym.2002$time, breaks = 100, density = TRUE)
hist(nym.2002$time, breaks = 100, freq = TRUE)
hist(nym.2002$time, breaks = 100, freq = FALSE)

hist(nym.2002$time, breaks = 20)
abline(v = mean(nym.2002$time), col = 'RED')
abline(v = median(nym.2002$time), col = 'GREEN')
boxplot(nym.2002$time, horizontal = TRUE)
abline(v = mean(nym.2002$time), col = 'RED')
abline(v = median(nym.2002$time), col = 'GREEN')

hist(rivers, breaks = 50, col = 'BLUE')
abline(v = mean(rivers), col = 'RED')
abline(v = median(rivers), col = 'GREEN')
boxplot(rivers, horizontal = TRUE)
abline(v = mean(rivers), col = 'RED')
abline(v = median(rivers), col = 'GREEN')

