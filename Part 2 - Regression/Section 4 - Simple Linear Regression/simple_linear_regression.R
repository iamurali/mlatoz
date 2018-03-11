# ====> Simple linear regression algorithm

# ====> Read csv
# install.packages('caTools')
# ====> install ggplot2
# install.packages('ggplot2')
library(caTools)
library(ggplot2)
setwd("~/work/mlatoz/Part 2 - Regression/Section 4 - Simple Linear Regression")
dataset = read.csv('Salary_Data.csv')


# ====> splitting data into training set and test set
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# ====> Fitting simple linear regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, data=training_set)
summary(regressor)

salary_predict = predict(regressor, test_set)
salary_training_set_predict = predict(regressor, training_set)

# =====> Training set data plot
ggplot() + 
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary), color='red') +
  geom_line(aes(x=training_set$YearsExperience, y=salary_training_set_predict), color='blue') + 
  ggtitle('Years of Experience vs Salary (Training Set)') + 
  xlab('Years of experience') +
  ylab('Salary')

# ====> Test set data plot

ggplot() + 
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary), color='red') + 
  geom_line(aes(x=training_set$YearsExperience, y=salary_training_set_predict), color='blue') +
  ggtitle('Years of Experience vs Salary (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')
 


