# Random Forest Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.ensemble import RandomForestRegressor

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
level = dataset.iloc[:, 1:2].values
salary = dataset.iloc[:, 2].values


# ====> Random forest regressor 
regressor = RandomForestRegressor(n_estimators = 300, random_state = 0)
regressor.fit(level, salary)

regressor.predict(6.5)

# ====> Plot Random forest Regression visualization
level_grid = np.arange(min(level), max(level), step = 0.01)
level_grid = level_grid.reshape(len(level_grid), 1)
plt.scatter(level, salary, color = 'red')
plt.plot(level_grid, regressor.predict(level_grid), color = 'blue')
plt.title('Level vs Salary (Random forest regressor)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.savefig('py_random_forest.png')
plt.close()