# 71
nrow(dati)
table(dati$stabilimento)
111/212
mean(dati$diametro[dati$stabilimento == "B"])

quantile(dati$diametro, probs = 0.1)

hist(dati$diametro[dati$stabilimento == "B"], breaks = 15)

boxplot(dati$diametro[dati$stabilimento == "B"],
        dati$diametro[dati$stabilimento == "A"],
        names = c("B", "A"))

## TEST PER LA MEDIA
## H0: media = 26
## H1: media != 26
t.test(dati$diametro[dati$stabilimento == "B"], mu = 26, alternative = "t")

## p-value = 6.045e-05 -> p-value ~ 0
## Rifiuto H0 a favore di h1

################################################################################

# 72