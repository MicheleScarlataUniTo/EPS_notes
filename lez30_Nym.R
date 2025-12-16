library(UsingR)

data("grades")

?grades
table(grades)

?mosaicplot
mosaicplot(t(table(grades)))

R <- 1000
N <- 200
mu <- 69.6
sigma <- 11.3

?rnorm
campioni <- matrix(rnorm(R*N, mean = mu, sd <- sigma), nrow = N, ncol = R)
hist(campioni[,999])

medie_campionarie <- colMeans(campioni)
str(medie_campionarie)
hist(medie_campionarie)

abline(v = mu, col = "red")


hist(campioni[,999])
abline(v = mu, col = "red")
abline(v = c(mu - 2*sigma, mu + 2*sigma), col = "blue")
hist(campioni[,99])
medie_campionarie <- colMeans(campioni)
hist(medie_campionarie, xlim = c(60, 80)) # distribuzione normale
abline(v = mu, col = "red")
sd(medie_campionarie)


rm(list=ls())
R <- 1000
N <- 200
numprove <- 10
psucc <- 0.3
campioni <- matrix(data = rbinom(R*N, size = numprove, prob = psucc), nrow = N, ncol = R)
hist(campioni[,999])

hist(campioni[,90])
hist(campioni[,90], freq = F)

hist(campioni[,999])
hist(campioni[,999], freq = F)

medie_campionarie <- colMeans(campioni)
hist(medie_campionarie)
abline(v = numprove*psucc, col = "red")
sd(medie_campionarie)
sqrt(numprove * psucc * (1 - psucc))

