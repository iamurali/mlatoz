# KNN Classifier
setwd("~/work/mlatoz/Part 3 - Classification/Section 15 - K-Nearest Neighbors (K-NN)")

# install.packages('ElemStatLearn')
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
library(ElemStatLearn)
library(caTools)
library(class)

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# ====> Scaling

training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

# ===> KNN regression.
test_pred = knn(training_set[, -3], test_set[, -3], cl=training_set[, 3], k=5)


# ====> Confusion matrix
cm = table(test_set[, 3], test_pred)

# ====> Plot grapth

draw_plot <- function(set, classifier, title, filename) {
  png(filename)
  x1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  x2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(x1, x2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  y_pred = knn(training_set[, -3], grid_set, cl=training_set[, 3], k=5)
  plot(set[, -3], main = title, xlab = 'Age', ylab = 'Estimated Salary', xlim = range(x1), ylim = range(x2))
  contour(x1, x2, matrix(as.numeric(y_pred), length(x1), length(x2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_pred == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21,bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  dev.off()
}


draw_plot(training_set, classifier, 'KNN (Training set)', 'r_knn_train.png')
draw_plot(test_set, classifier, 'KNN (Test set)', 'r_knn_test.png')
  
