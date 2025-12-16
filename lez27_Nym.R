library(UsingR)

?babies
View(babies)
babies$smoke[babies$smoke == 9] <- NA
View(babies$smoke)

?as.factor
babies$smoke_f <- as.factor(babies$smoke)
is.factor(babies$smoke_f)

?table
table(babies$smoke_f, useNA = "no")
table(babies$smoke_f, useNA = "always")
table(babies$smoke_f, useNA = "ifany")

?barplot
barplot(table(babies$smoke_f, useNA = "ifany"))

?dotchart
dotchart(table(babies$smoke_f, useNA = "ifany"))

?pie
pie(table(babies$smoke_f, useNA = "ifany"))

babies$wt[babies$wt == 999] <- NA
babies$peso <- babies$wt * 28.3495
hist(babies$peso, breaks = 20)
hist(babies$peso, breaks = 40)

mean(babies$peso)
median(babies$peso)

boxplot(babies$peso, horizontal = TRUE)
boxplot(babies$peso ~ babies$smoke_f)

