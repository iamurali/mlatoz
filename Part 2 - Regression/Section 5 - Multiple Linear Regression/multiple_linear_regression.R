# Multiple Linear Regression

# Prerequisites
setwd("~/work/mlatoz/Part 2 - Regression/Section 4 - Simple Linear Regression")
library(caTools)

# Importing the dataset
dataset = read.csv('50_Startups.csv')
dataset$State = factor(dataset$State, levels = c('New York', 'California', 'Florida'), labels = c(1, 2, 3))

# ====> training and test set
set.seed(123)
split = sample.split(dataset, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set)
regressor = lm(formula = Profit ~ ., data = training_set)
profit_predict = predict(regressor, test_set)
summary(regressor)

regressor1 = lm(formula = Profit ~ R.D.Spend, data = training_set)
profit_predict1 = predict(regressor1, test_set)
summary(regressor1)

# ====> backward elimination for optimal model

regressor2 = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
profit_predict2 = predict(regressor2, test_set)
summary(regressor2)


regressor3 = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(regressor3)

regressor4 = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset)
summary(regressor4)

regressor5 = lm(formula = Profit ~ R.D.Spend, data = dataset)
summary(regressor5)