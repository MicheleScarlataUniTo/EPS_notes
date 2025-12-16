x <- seq(0.01, 10, 0.01)
y <- dchisq(x, 1)

plot(x, y, type= "l")
lines(x, dchisq(x, 2), col = 'blue')
lines(x, dchisq(x, 2), col = 'red')
lines(x, dchisq(x, 2), col = 'gray')

x <- seq(0.01, 20, 0.01)
plot(x, dchisq(x, 7), col = 'gray', type = "l")

q1 <- qchisq(0.025, df = 34)
q2 <- qchisq(0.975, df = 34)

x <- seq(0.01, 100, 0.1)
plot(x, dchisq(x, 34), col = "red", type = "l")
abline(v = c(q1, q2), col = "blue")


#############

install.packages("DescTools")
library(DescTools)
install.packages("readr")
library(readr)
install.packages("readxl")
library(readxl)


births <- read_excel(file.choose())
View(births)

hist(births$`LENGTH OF STAY`, breaks = 30)
abline(v = median(births$`LENGTH OF STAY`), col = "red")
abline(v = mean(births$`LENGTH OF STAY`), col = "blue")

boxplot(births$`LENGTH OF STAY`, horizontal = T)

?VarCI

VarCI(births$`LENGTH OF STAY`, conf.level = 0.95) -> civar

civar
sqrt(civar)







