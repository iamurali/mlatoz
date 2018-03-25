# Random Forest Regression
# install.packages("randomForest")
# setwd("~/work/mlatoz/Part 2 - Regression/Section 9 - Random Forest Regression")
library(randomForest)
library(ggplot2)
# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# ====> Random forest regression
set.seed(123) # ====> for random factor to be fixed 
regressor = randomForest(dataset[1], y = dataset$Salary, ntree = 500)

predict(regressor, newdata = data.frame(Level = 6.5))

# ====> Visualizing the result of Random forest regression
level_grid = seq(min(dataset$Level), max(dataset$Level), by = 0.01)
exp_plot = ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = level_grid, y = predict(regressor, newdata = data.frame(Level = level_grid))), color = 'blue') +
  ggtitle('Level vs Salary (Random forest regression)') + 
  xlab('Level') +
  ylab('Salary')

ggsave(filename = 'r_random_forest.png', plot = exp_plot)