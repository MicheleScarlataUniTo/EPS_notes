#26
rView(dati)

table(dati$sicurezza)

# Per sapere quanti NA sono presenti uso:
sum(is.na(dati))

safe <- dati[dati$sicurezza == "presente", ]
mean(safe$vel)
sd(safe$vel)

# 10% of the stopped cars (with or without safety devices) 
# had a speed greater than
quantile(dati$vel,
         probs = 0.90,
         na.rm = TRUE)


hist(dati$vel)
## the distribution of speeds has the shape of a bell and therefore I can say 
## that it could be distributed as a normal

# You want to give a quantitative answer to the question:
# more than 60% of vehicles on the road have road safety devices.
?binom.test
binom.test(80, 115, alternative = "greater", p = 0.6, conf.level = 0.95)

## the random sample carries sufficient evidence to reject the null hypothesis
## I can state, with significance 0.05, that
##more than 60% of the vehicles on the road have road safety devices






