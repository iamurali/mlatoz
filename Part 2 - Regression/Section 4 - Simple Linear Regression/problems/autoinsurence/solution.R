#' 
#' Created on Sun Mar 11 23:03:35 2018
#' 
#' @author: mural.kummitha
#' 
# ======> Auto Insurance in Sweden simple linear regression

# ====> read dataset
library(caTools)
library(ggplot2)
setwd('~/work/mlatoz/Part 2 - Regression/Section 4 - Simple Linear Regression/problems/autoinsurence')
dataset = read.csv('AutoInsurSweden.csv')


# ====> separate data into training set and test set
set.seed(123)
split = sample.split(dataset$TotalPayment, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# ====> predict the simple linear regression
regressor = lm(formula = TotalPayment ~ NoOfClaims, data = training_set)
payment_predict = predict(regressor, test_set)
payment_training_set_predict = predict(regressor, training_set)

# ====> plot training set regression graph
training_set_plot = ggplot() + 
                      geom_point(aes(x=training_set$NoOfClaims, y=training_set$TotalPayment), color='red') +
                      geom_line(aes(x=training_set$NoOfClaims, y=payment_training_set_predict), color='blue') +
                      ggtitle('No.of claims vs Payment (Training set) ') +
                      xlab('No.of Claims') + 
                      ylab('Payment')
ggsave(filename = 'r_training_set.png', plot = training_set_plot)


# ====> plot test set regression graph
test_set_plot = ggplot() +
                  geom_point(aes(x=test_set$NoOfClaims, y=test_set$TotalPayment), color='red') +
                  geom_line(aes(x=training_set$NoOfClaims, y=payment_training_set_predict), color='blue') +
                  ggtitle('No.of Claims vs Payment (Test set) ') +
                  xlab('No.of Claims') + 
                  ylab('Payment')

ggsave(filename = 'r_test_set.png', plot=test_set_plot)


