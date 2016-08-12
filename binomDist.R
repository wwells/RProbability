#generate binom dist graphs in R
#In probability theory and statistics, 
#the binomial distribution with parameters n and p 
#is the discrete probability distribution of the number of 
#successes in a sequence of n independent yes/no experiments, 
#each of which yields success with probability p. 

# from R For Everyone
library(ggplot2)

#vis 10k experiments w/ 10 trials and 0.3 prob success
binomData <- data.frame(Successes = rbinom(n=10000, size=10, prob=0.3))
p <- ggplot(binomData, aes(x=Successes)) + geom_histogram(binwidth=1)

#as n grows, close to normdist
binom5 <- data.frame(Successes=rbinom(n=10000, size=5, prob=.2), Size=5)
binom10 <- data.frame(Successes = rbinom(n=10000, size=10, prob=0.2), Size=10)
binom100 <- data.frame(Successes = rbinom(n=10000, size=100, prob=0.2), Size=100)
binom10000 <- data.frame(Successes = rbinom(n=10000, size=10000, prob=0.2), Size=10000)

binomAll <- rbind(binom5, binom10, binom100, binom10000)

p2 <- ggplot(binomAll, aes(x=Successes)) + geom_histogram() + 
    facet_wrap(~ Size, scales="free") + 
    ggtitle(expression("Binomial Distribution" == 
                           paste(bgroup("(",atop(n,x),")"), p^x,(1-p)^(n-x))))

#prob exactly 3 success out of 10
dbinom(x=3, size=10, prob=0.3)
#cum prob of 3 or less success out of 10
pbinom(q=3, size=10, prob=0.3)
#more than 3
pbinom(q=3, size=10, prob=0.3, lower.tail=FALSE)