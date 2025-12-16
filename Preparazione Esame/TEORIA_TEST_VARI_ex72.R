# 72

nrow(dati)
mean(dati$time_new_version)
sd(dati$time_new_version)

sum(dati$time_new_version > 26.5)

quantile(dati$time_new_version, 0.9)


hist(dati$time_old_version)
boxplot(dati$time_old_version, dati$time_new_version)
boxplot(dati$time_new_version, dati$time_old_version)



t.test(dati$time_old_version, dati$time_new_version, alternative = "g",
       mu = 0, paired = TRUE)
