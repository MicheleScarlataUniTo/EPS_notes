library(UsingR)

# Used data
?fat
View(fat)

hist(fat$wrist)
hist(fat$height)

fat$altezze <- fat$height * 2.54
hist(fat$altezze)

# Correlation
?cor
# wrist to neck
cor(fat$wrist, fat$neck)
plot(fat$wrist, fat$neck)
# wrist to altezze
cor(fat$wrist, fat$altezze)
plot(fat$wrist, fat$altezze)

#####################################################
library(MASS)

# Used data
?Animals
View(Animals)

cor(Animals$body, Animals$brain)
cor(Animals$body, Animals$brain, method = "spearman")
plot(Animals$body, Animals$brain)
