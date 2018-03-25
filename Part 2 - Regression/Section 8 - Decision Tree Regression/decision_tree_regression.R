# Decision Tree Regression
setwd("~/work/mlatoz/Part 2 - Regression/Section 8 - Decision Tree Regression")
# install.packages('rpart')
library(rpart)

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# Decision tree regressor
regressor = rpart(formula = Salary ~ ., data = dataset, control = rpart.control(minsplit = 1))

# ====> graph
level_grid = seq(min(dataset$Level), max(dataset$Level), by=0.01)
svr_plot = ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = level_grid, y = predict(regressor, newdata = data.frame(Level =  level_grid))), color = 'blue') +
  ggtitle('Level vs Salary (Decision Tree regression)') +
  xlab('Level') + 
  ylab('Salary')

ggsave(filename = 'r_dtr_regression.png', svr_plot)