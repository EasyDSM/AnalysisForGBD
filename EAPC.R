# This is the code for Estimated Annual Percentage Change (EAPC).

# Make the data -----------------------------------------------------------

set.seed(1234)
year <- seq(1990, 2019, 1)
asr <- 2*year + 3  + rnorm(length(year), mean = 0, sd = 1)

# To show the data with point plot ----------------------------------------

plot(x = year, y = asr, 
     main = "ASR Changed by Year",
     xlab = "Year", 
     ylab = "Age-standardized Rate (Per 100000)")

# Fit Formula -------------------------------------------------------------

lnasr <- log(asr, base = exp(1))
fit <- lm(lnasr ~ year)
summary(fit)

# EAPC Calculation --------------------------------------------------------

eapc <- exp(coef(fit)[2])-1; eapc
eapc.ci <- exp(confint(fit)[2,])-1; eapc.ci

