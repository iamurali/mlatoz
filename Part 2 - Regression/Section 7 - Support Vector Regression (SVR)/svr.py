# SVR -- Support Vector Regression algorithm

# ====> Importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVR

# ====> read read
data = pd.read_csv('Position_Salaries.csv')
level = data.iloc[:, 1:2].values
salary = data.iloc[:, 2:3].values

# ====> feature scalling

sc_level = StandardScaler()
level = sc_level.fit_transform(level)

sc_salary = StandardScaler()
salary = sc_salary.fit_transform(salary)


# ====> Make use of svr regression algorithm

regressor = SVR(kernel='rbf')
regressor.fit(level, salary)

transformed_predicter = sc_level.transform(np.array([[6.5]]))
salary_predict = sc_salary.inverse_transform(regressor.predict(transformed_predicter))


# ====> SVR Plot grapth

plt.scatter(level, salary, color = 'red')
plt.plot(level, regressor.predict(level), color = 'blue')
plt.title('Level vs Salary (SVR)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.savefig('py_svr_regression.png')
plt.close()

# ====> High resoulution SVR plot grapth
level_grid = np.arange(min(level), max(level), step=0.1)
level_grid = level_grid.reshape(len(level_grid), 1)
plt.scatter(level, salary, color='red')
plt.plot(level_grid, regressor.predict(level_grid), color = 'blue')
plt.title('Level vs Salary (SVR) High Resolution')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.savefig('py_svr_regression_hd.png')
plt.close()
