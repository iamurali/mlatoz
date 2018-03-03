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

