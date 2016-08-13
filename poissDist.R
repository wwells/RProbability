#generate poisson dist graphs in R
#In probability theory and statistics, 
#the poisson dist is also for count data, and relies on 
#x and lambda. 
#as lambda grows large, Poisson begins to resemble the normal distribution

# from R For Everyone
library(ggplot2)

pmf <- function(x, lambda) {
    ((lambda^x)*exp(1)^(-lambda))/factorial(x)
}

#same as "dpois"

# in poisson, lambda is both mean and variance


p <- ggplot() + ggtitle(expression("Normal Distribution" == paste(frac(1, sqrt(2 * pi * sigma^2)),
                                                          " ", e^{frac(-(x - mu)^2, 2 * sigma^2)})))