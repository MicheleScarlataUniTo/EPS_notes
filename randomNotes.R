library(readxl)
body <- read_excel(file.choose())
str(body)
View(body)
body$`GENDER (1=M)` <- as.factor(body$`GENDER (1=M)`)
levels(body$`GENDER (1=M)`)
levels(body$`GENDER (1=M)`) <- c("Femmina", "Maschio")
levels(body$`GENDER (1=M)`)
mean(body$PULSE[body$`GENDER (1=M)` == "Maschio"])
mean(body$PULSE[body$`GENDER (1=M)` == "Femmina"])

?t.test

t.test(body$PULSE[body$`GENDER (1=M)` == "Maschio"], conf.level = 0.95)
t.test(body$PULSE[body$`GENDER (1=M)` == "Femmina"], conf.level = 0.95)

#### TEST VARIANZA ####
# Sample data
set.seed(123)
data <- rnorm(30)  # 30 random normal values

# Calculate sample variance and sample size
n <- length(data)
s2 <- var(data)

# Confidence level (e.g., 95%)
alpha <- 0.05

# Chi-squared critical values
chi_sq_lower <- qchisq(alpha / 2, df = n - 1)
chi_sq_upper <- qchisq(1 - alpha / 2, df = n - 1)

# Confidence interval for variance
lower_bound <- (n - 1) * s2 / chi_sq_upper
upper_bound <- (n - 1) * s2 / chi_sq_lower

# Results
cat("95% Confidence Interval for Variance: [", lower_bound, ",", upper_bound, "]\n")
