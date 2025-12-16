# 24
View(dati)

?table
table(dati$algoritmo)

?mean
mean(dati$tempo[dati$algoritmo == "alg_A"])

?sd
sd(dati$tempo[dati$algoritmo == "alg_A"])

# The 5\(\%) of the slowest response times 
# using the alg_A algorithm is higher than:

## OSS: quantile riordina i tempi in ordine non decrescente
##      dunque il 5% più lento è il 5% da destra, ovvero il
##      quantile del 95% da sinistra
?quantile
quantile(dati$tempo[dati$algoritmo == "alg_A"], probs = 0.95)

# From observing the boxplots of the response times obtained with 
# the two different algorithms, I can state that:

# [ ] the distribution of times for the two algorithms has about the same 
#     mean and variance
# [ ] the distribution of times is skewed for both algorithms
# [ ] all the statements given are true
# [X] none of the statements given are true
# [ ] the two boxes have about the same interquartile range

## When the distribution of times (or any other data) is skewed, 
## it means that the data is not symmetrically distributed around the mean. 
## Skewness can be positive (right-skewed) or negative (left-skewed)

## Right-skewed (positive skew): The right tail of the distribution is longer 
## than the left. In this case, the mean is typically greater than the median.

## Left-skewed (negative skew): The left tail is longer than the right. 
## Here, the mean is typically less than the median.
?boxplot
boxplot(dati$tempo[dati$algoritmo == "alg_B"], 
        dati$tempo[dati$algoritmo == "alg_A"], 
        horizontal = TRUE, 
        names = c("alg_B", "alg_A"))

abline(v = median(dati$tempo[dati$algoritmo== "alg_A"]), col = "blue")
abline(v = median(dati$tempo[dati$algoritmo== "alg_B"]), col = "red")
## [X] none of the statements given are true:
## Le distribuzioni sono entrambe simmetriche, non hanno varianze simili, 
## la distanza interquartile dei tempi con algoritmo alg_B è maggiore di 
## quella con algoritmo alg_A.

# The 0.99-level confidence interval for the mean response time using 
# the alg_A algorithm is:
t.test(dati$tempo[dati$algoritmo == "alg_A"], conf.level = 0.99)

# The 0.99-level confidence interval for the mean response time using 
# the alg_B algorithm is:
t.test(dati$tempo[dati$algoritmo == "alg_B"], conf.level = 0.99)


# From the analysis of the results of the previous two steps, I can say that:

## the confidence intervals overlap for some values so I cannot say that the 
## two mean times are different


##__________________EXTRA_STUFF__________________________________
#install.packages("e1071")
library(e1071)

mean(dati$tempo[dati$algoritmo == "alg_A"])
var(dati$tempo[dati$algoritmo == "alg_A"])
skewness(dati$tempo[dati$algoritmo == "alg_A"])

mean(dati$tempo[dati$algoritmo == "alg_B"])
var(dati$tempo[dati$algoritmo == "alg_B"])
skewness(dati$tempo[dati$algoritmo == "alg_B"])
