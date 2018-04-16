# Logistic Regression
setwd("~/work/mlatoz/Part 3 - Classification/Section 14 - Logistic Regression")
# install.packages('ElemStatLearn')
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
library(ElemStatLearn)
library(caTools)

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# ====> Scaling

training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

# ===> Logistical regression.
classifier = glm(formula = Purchased ~ ., family = binomial, data = training_set)

prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])

test_pred = ifelse( prob_pred > 0.5, 1, 0)

# ====> Confusion matrix
cm = table(test_set[, 3], test_pred)

# ====> Plot grapth

draw_plot <- function(set, classifier, title, filename) {
  png(filename)
  x1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  x2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(x1, x2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  prob_pred = predict(classifier, type = 'response', newdata = grid_set)
  y_pred = ifelse(prob_pred > 0.5, 1, 0)
  plot(set[, -3], main = title, xlab = 'Age', ylab = 'Estimated Salary', xlim = range(x1), ylim = range(x2))
  contour(x1, x2, matrix(as.numeric(y_pred), length(x1), length(x2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_pred == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21,bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  dev.off()
}


draw_plot(training_set, classifier, 'Logistic regression (Training set)', 'r_logistic_train.png')
draw_plot(test_set, classifier, 'Logistic regression (Test set)', 'r_logistic_test.png')
  
