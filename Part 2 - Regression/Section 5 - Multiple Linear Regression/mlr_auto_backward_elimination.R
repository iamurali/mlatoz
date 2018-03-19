# Created on Mon Mar 21 00:57:35 2018
# @author: mural.kummitha

setwd("~/work/mlatoz/Part 2 - Regression/Section 5 - Multiple Linear Regression")
dataset = read.csv('50_Startups.csv')
dataset$State = factor(dataset$State, levels = c('New York', 'California', 'Florida'), labels = c(1, 2, 3))

backwardElimination <- function(data_s, sl) {
  len = length(data_s)
  for (i in c(1:len)) {
    regressor = lm(formula = Profit ~ ., data = data_s)
    maxPValue = max(coef(summary(regressor))[c(2:len), "Pr(>|t|)"])
    
    if (maxPValue > sl) {
      j = which(coef(summary(regressor))[c(2:len), "Pr(>|t|)"] == maxPValue)
      data_s = data_s[, -j]
    }
    len = len-1
  }
  return(summary(regressor))
}

multiLinearRegressionBackwardElimation <- function() {
  set.seed(123)
  split = sample.split(dataset, SplitRatio = 0.8)
  training_set = subset(dataset, split == TRUE)
  test_set = subset(dataset, split == FALSE)
  regressor = lm(formula = Profit ~ ., data = dataset)
  print(coef(summary(regressor)))
  sl = 0.05
  data = dataset[, c(1, 2, 3, 4, 5)]
  regressor_summary = backwardElimination(dataset, sl)
  return(regressor_summary)
}
model_summary = multiLinearRegressionBackwardElimation()
print(model_summary)
