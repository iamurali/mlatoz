# Simple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LinearRegression

dataset = pd.read_csv('Salary_Data.csv')

experience = dataset.iloc[:, :-1].values
salary = dataset.iloc[:, 1].values

experience_train, experience_test, salary_train, salary_test = train_test_split(experience, salary, test_size=1/3, random_state=0)

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""


# ====> fitting simple linear regression to the training set
regression = LinearRegression()
regression.fit(experience_train, salary_train)
salary_pred = regression.predict(experience_test)


# ====> Training set plot the regression graph

plt.scatter(experience_train, salary_train, color='red')
plt.plot(experience_train, regression.predict(experience_train), color='blue')
plt.xlabel('No.of Years')
plt.ylabel('Salary')
plt.title('Experience vs Salary (Training Set)')
plt.show()


# ====> Test set plot regression graph

plt.scatter(experience_test, salary_test, color='red')
plt.plot(experience_train, regression.predict(experience_train), color='blue')
plt.xlabel('No.of Years')
plt.ylabel('Salary')
plt.title('Experience vs Salary (Test set)')
plt.show()