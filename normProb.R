#generate normal dist graphs in R

# from R For Everyone
library(ggplot2)


randNorm <- rnorm(30000)
randDensity <- dnorm(randNorm)

p <- ggplot(data.frame(x=randNorm, y=randDensity)) + aes(x=x,y=y) + 
    geom_line() + labs(x="x", y="Density") + 
    ggtitle(expression("Normal Distribution" == paste(frac(1, sqrt(2 * pi * sigma^2)),
                                     " ", e^{frac(-(x - mu)^2, 2 * sigma^2)})))
            
#generate values for -1 to shade
neg1Seq <- seq(from=min(randNorm), to=-1, by=.1)

#df w/ dist value
lessthanNeg1 <- data.frame(x=neg1Seq, y=dnorm(neg1Seq))

#add endpoints
lessthanNeg1 <- rbind(c(min(randNorm), 0),
                      lessthanNeg1,
                      c(max(lessthanNeg1$x), 0))

#plot
p + geom_polygon(data=lessthanNeg1, aes(x=x, y=y))

# seq from -1 to 1
neg1to1Seq <- seq(-1,1,.1)
neg1to1 <- data.frame(x=neg1to1Seq, y=dnorm(neg1to1Seq))
neg1to1 <- rbind(c(min(neg1to1$x), 0),
                 neg1to1,
                 c(max(neg1to1$x), 0))

p + geom_polygon(data=neg1to1, aes(x=x, y=y))

#cdf
randProb <- pnorm(randNorm)
cdf <- ggplot(data.frame(x=randNorm, y=randProb)) + aes(x=x, y=y) + 
    geom_point() + labs(x="Random Normal Variables", y="Probability") + 
    ggtitle(expression(phi(x) == paste(frac(1, sqrt(2 * pi)),
                                       " ", integral(e^(-t^2/2) * dt, -infinity, x))))
