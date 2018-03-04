# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')

dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Salary)

median_x =  read.csv('Data.csv')

median_x$Age = ifelse(is.na(median_x$Age), ave(median_x$Age, FUN = function(x) median(x, na.rm = TRUE) )  , median_x$Age)
median_x$Salary = ifelse(is.na(median_x$Salary), ave(median_x$Salary, FUN = function(x) median(x, na.rm = TRUE) )  , median_x$Salary)

print(median_x)
print(dataset)

dataset$Country = factor(dataset$Country, labels = c(1, 2, 3), levels = c('France', 'Spain', 'Germany'))
dataset$Purchased = factor(dataset$Purchased, labels = c(1, 0), levels = c('Yes', 'No'))

print(dataset)

# ====> separate data into training set and test set
# install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

print(training_set)
print(test_set)
