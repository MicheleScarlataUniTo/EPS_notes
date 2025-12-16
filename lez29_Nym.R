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

hist(campioni[,12])
hist(campioni[,19])
hist(campioni[,99])

medie_campionarie <- colMeans(campioni)
str(medie_campionarie)
hist(medie_campionarie)

abline(v = mu, col = "RED")
