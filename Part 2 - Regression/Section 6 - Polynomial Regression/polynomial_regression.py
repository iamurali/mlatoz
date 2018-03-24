
# ====> importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures

# Importing the data set
dataset = pd.read_csv('Position_Salaries.csv')
level = dataset.iloc[:, 1:2].values
salary = dataset.iloc[:, 2].values

# ====> splitting data into training and data set not required as we are considering full data set for trianing.

# ====> Linear regression
linear_regressor = LinearRegression()
linear_regressor.fit(level, salary)


# =====> Fitting Polynomial regression to the data set.
polynominal_regressor = PolynomialFeatures(degree=4)
level_poly = polynominal_regressor.fit_transform(level)
linear_reg = LinearRegression()
linear_reg.fit(level_poly, salary)


# ====> plot linear regression graph
plt.scatter(level, salary, color='red')
plt.plot(level, linear_regressor.predict(level), color='blue')
plt.title('Truth or Bluff (Linear Regression)')
plt.xlabel('Position Level') 
plt.ylabel('Salary')
plt.savefig('linear_regression.png')
plt.close()

# ====> Polynomial regression model graph
plt.scatter(level, salary, color='red')
plt.plot(level, linear_reg.predict(polynominal_regressor.fit_transform(level)), color='blue')
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Position Level') 
plt.ylabel('Salary')
plt.savefig('polynomial_regression.png')
plt.close()

# =====> Polynominal regression model with degree
polynominal_regressor = PolynomialFeatures(degree=3)
level_poly = polynominal_regressor.fit_transform(level)
linear_reg = LinearRegression()
linear_reg.fit(level_poly, salary)

# ====> polynomial regression with degree 3 graph and for higher resolution
level_grid = np.arange(min(level), max(level), 0.1)
level_grid = level_grid.reshape(len(level_grid), 1)
plt.scatter(level, salary, color='red')
plt.plot(level_grid, linear_reg.predict(polynominal_regressor.fit_transform(level_grid)), color='blue')
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Position Level') 
plt.ylabel('Salary')
plt.savefig('polynomial_3d_regression.png')
plt.close()


# ====> Linear regression prediction 
linear_regressor.predict(6.5)
# ====> Polynominal regression prediction
linear_reg.predict(polynominal_regressor.fit_transform(6.5))