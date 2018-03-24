
# ====> Import dataset
setwd("~/work/mlatoz/Part 2 - Regression/Section 6 - Polynomial Regression")
library(ggplot2)
data = read.csv('Position_Salaries.csv')
dataset = data[2:3]

# ====> training set and test set
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# ====> Linear regression
linear_reg = lm(data = dataset, formula = Salary ~ .)
summary(linear_reg)

# ====> Polynomial regression
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
polynominal_reg = lm(formula = Salary ~ ., data = dataset)
summary(polynominal_reg)

# ====> Visualising the Linear graph
linear_plot = ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(linear_reg, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression) R') +
  xlab('Level') +
  ylab('Salary')

ggsave(filename = 'R_linear_regression.png', plot=linear_plot)
  
# ====> Visualising the polynomial graph
polynomial_plot = ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary), color='red') +
  geom_line(aes(x= dataset$Level, y=predict(polynominal_reg, newdata = dataset)), color='blue') +
  ggtitle('Truth or Bluff (Polynomial Regression) R') +
  xlab('Level') + 
  ylab('Salary')

ggsave(filename = 'R_polynomial_regression.png', plot = polynomial_plot)


# ====> with degree 4
dataset$Level4 = data$Level^4
polynomial_plot = ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary), color='red') +
  geom_line(aes(x= dataset$Level, y=predict(polynominal_reg, newdata = dataset)), color='blue') +
  ggtitle('Truth or Bluff (Polynomial Regression) R') +
  xlab('Level') + 
  ylab('Salary')

ggsave(filename = 'R_polynomial_regression.png', plot = polynomial_plot)



# =====> Linear regression predict
y_pred = predict(linear_reg, newdata = data.frame(Level = 6.5))
print(y_pred)

# ====> Polynomial regression predict
y_poly_pred = predict(polynominal_reg, newdata = data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))
print(y_poly_pred)
# ====> Regression model with high resoultion

# level_grid = seq(min(dataset$Level), max(dataset$Level), by=0.1)
# 
# ggplot() +
#   geom_point(aes(x= dataset$Level, y= dataset$Salary), color='red') +
#   geom_line(aes(x= level_grid, y=predict(polynominal_reg, newdata = data.frame(Level = level_grid))), color='blue') +
#   ggtitle('Truth or Bluff (Polynomial Regression) R') +
#   xlab('Level') + 
#   ylab('Salary')
# 
