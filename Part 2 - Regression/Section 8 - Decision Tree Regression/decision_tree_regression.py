# Decision Tree Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.tree import DecisionTreeClassifier

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
level = dataset.iloc[:, 1:2].values
salary = dataset.iloc[:, 2].values


# ====> Decision Tree Regression
regressor = DecisionTreeClassifier(random_state = 0)
regressor.fit(level, salary)

# ====> Predicting a new result
salary_predict = regressor.predict(6.5)


# ====> Visualising the decision tree results
level_grid = np.arange(min(level), max(level), step = 0.01)
level_grid = level_grid.reshape(len(level_grid), 1)
plt.scatter(level, salary, color='red')
plt.plot(level_grid, regressor.predict(level_grid), color = 'blue')
plt.title('Level vs Salary (Decision Tree Regression)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.savefig('py_decision_tree.png')
plt.close()