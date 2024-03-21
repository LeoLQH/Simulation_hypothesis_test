library(tidyverse)
library(ggplot2)
library(stats)
library(extraDistr) # Laplace
library(wiqid) # t distribution
library(sn) # Skewed normal

#### one-sample t-test
### Simulation
n.sim <- 1e5
alpha <- 0.05

## Normal distribution 
mean <- 10
var <- 5 

test.mean <- 10
a <- seq(-50, 50, 0.1)






######### Normal dsitribution
##### test mean = 10
test.mean <- 10
result <- c(c(), c())
for (i in 1:15) {
  sample_size <- 10 + i*10
  t_sample <- sapply(c(1:n.sim), function(a) {
    sample <- rnorm(sample_size, mean, var)
    t <- (mean(sample) - test.mean)/sqrt(var(sample)/sample_size)
    return(t)
  })
  temp <- (2*pt(-abs(t_sample), df = sample_size - 1) <= alpha)
  result[i] <- mean(temp)
}

# Generate bar plot from the result of test mean = 10
barplot(result, names.arg = seq(10, 150, 10), ylim = c(0, 0.8), col = "lightblue", yaxt = "n", 
        xlab = "Test mean = 10, Actual popu mean = 10", ylab = "Proportion of Rejected Hypotheses", las = 2)
axis(side = 2, at = seq(0, 0.8, 0.2), labels = seq(0, 0.8, 0.2))
axis(side = 2, at = 0.05, labels = 0.05, col.axis = "red", col.ticks = "red")
abline(h = 0.05, col = "red", lty = 3)
box()



##### test mean = 11
test.mean <- 11
result <- c(c(), c())
for (i in 1:15) {
  sample_size <- 10 + i*10
  t_sample <- sapply(c(1:n.sim), function(a) {
    sample <- rnorm(sample_size, mean, var)
    t <- (mean(sample) - test.mean)/sqrt(var(sample)/sample_size)
    return(t)
  })
  temp <- (2*pt(-abs(t_sample), df = sample_size - 1) <= alpha)
  result[i] <- mean(temp)
}

# Generate bar plot from the result of test mean = 11
barplot(result, names.arg = seq(10, 150, 10), ylim = c(0, 0.8), col = "lightblue", yaxt = "n", 
        xlab = "Test mean = 11, Popu mean = 10", ylab = "Proportion of Rejected Hypotheses", las = 2)
axis(side = 2, at = seq(0, 0.8, 0.2), labels = seq(0, 0.8, 0.2))
axis(side = 2, at = 0.05, labels = 0.05, col.axis = "red", col.ticks = "red")
abline(h = 0.05, col = "red", lty = 3)
box()









####### Skew data dist
##### test mean = 10
test.mean <- 10
result <- c()
for (i in 1:15) {
  sample_size <- 10 + i*10
  t_sample <- sapply(c(1:n.sim), function(a) {
    sample <- rsn(sample_size, mean, var, 5)
    t <- (mean(sample) - test.mean)/sqrt(var(sample)/sample_size)
    return(t)
  })
  temp <- (2*pt(-abs(t_sample), df = sample_size - 1) <= alpha)
  result[i] <- mean(temp)
}

# Generate bar plot from the result of test mean = 10
barplot(result, names.arg = seq(10, 150, 10), ylim = c(0, 1), col = "lightblue", yaxt = "n", 
        xlab = "Sample Size", ylab = "Proportion of Rejected Hypotheses", las = 2)
box()
abline(h = 0.05, col = "red", lty = 3)
axis(side = 2, at = c(seq(0, 1, 0.2), 0.05), labels = c(seq(0, 1, 0.2), 0.05))
axis(side = 2, at = c(0.05), labels = c(0.05), col.axis = "red", col.ticks = "red")


##### test mean = 15
test.mean <- 15
result <- c()
for (i in 1:15) {
  sample_size <- 10 + i*10
  t_sample <- sapply(c(1:n.sim), function(a) {
    sample <- rsn(sample_size, mean, var, 5)
    t <- (mean(sample) - test.mean)/sqrt(var(sample)/sample_size)
    return(t)
  })
  temp <- (2*pt(-abs(t_sample), df = sample_size - 1) <= alpha)
  result[i] <- mean(temp)
}

# Generate bar plot from the result of test mean = 15
barplot(result, names.arg = seq(10, 150, 10), ylim = c(0, 1), col = "lightblue", yaxt = "n", 
        xlab = "Skew Normal, Test mean = 15, Popu mean = 10", ylab = "Proportion of Rejected Hypotheses", las = 2)
box()
abline(h = 0.05, col = "red", lty = 3)
axis(side = 2, at = c(seq(0, 1, 0.2), 0.05), labels = c(seq(0, 1, 0.2), 0.05))
axis(side = 2, at = c(0.05), labels = c(0.05), col.axis = "red", col.ticks = "red")








####### Calculating p-value in normal dist, correct mean
test.mean <- 10
p_vals <- list(c(), c())
for (i in 1:15) {
  sample_size <- 10 + i*10
  t_sample <- sapply(c(1:n.sim), function(a) {
    sample <- rnorm(sample_size, mean, var)
    t <- (mean(sample) - test.mean)/sqrt(var(sample)/sample_size)
    return(t)
  })
  temp <- (2*pt(-abs(t_sample), df = sample_size - 1))
  p_vals[[i]] <- temp
}

data <- as.data.frame(p_vals, col.names = seq(10, 150, 10))
data <- data |> pivot_longer(colnames(data), names_to = "sample_size", values_to = "p_val")
data$sample_size <- factor(data$sample_size, levels = c("X10", "X20", "X30", "X40", "X50", "X60", "X70", "X80", "X90", "X100", "X110", "X120", "X130",
                                                        "X140", "X150"))
data$sample_size <- fct_collapse(data$sample_size, "10" = "X10", "20" = "X20", "30" = "X30", "40" = "X40", "50" = "X50", "60" = "X60", "70" = "X70", "80" = "X80", 
                                 "90" = "X90", "100" = "X100", "110" = "X110", "120" = "X120", "130" = "X130", "140" = "X140", "150" = "X150")
data |> ggplot(aes(x = sample_size, y = p_val)) + 
  scale_x_discrete(breaks = levels(data$sample_size), labels = levels(data$sample_size)) +
  xlab("Test mean = 10, Popu mean = 10") +
  geom_boxplot(col = "blue", outlier.colour = "white") + 
  theme_classic()








