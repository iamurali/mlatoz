# ====> Set current working directory
setwd("~/work/mlatoz/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)")

# ===> import libraries
library(ggplot2)
library(e1071)

# ====> read data

data = read.csv('Position_Salaries.csv')
dataset = data[2:3]


# SVR fitting dataset
regressor = svm(formula = Salary ~ ., data = dataset, type = 'eps-regression')
salary_predictor = predict(regressor, data.frame(Level = 6.5))

# ====> SVR Graph representation
svr_plot = ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), color = 'blue') +
  ggtitle('Level vs Salary (SVR)') +
  xlab('Level') + 
  ylab('Salary')

ggsave(filename = 'r_svr_regression.png', svr_plot)