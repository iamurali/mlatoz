# Multiple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.linear_model import LinearRegression
import statsmodels.formula.api as smapi

# Importing the dataset
data = pd.read_csv('50_Startups.csv')
startup_data = data.iloc[:, :-1].values
profit = data.iloc[:, 4].values

# ====> categorical variable encodings
label_encoder = LabelEncoder()
startup_data[:, 3] = label_encoder.fit_transform(startup_data[:, 3])
onehotencoder = OneHotEncoder(categorical_features=[3])
startup_data = onehotencoder.fit_transform(startup_data).toarray()

# ====> dummy variable trap avoide
startup_data = startup_data[:, 1:]

# ====> training and test set divide
startup_data_train, startup_data_test, profit_train, profit_test = train_test_split(startup_data, profit, test_size=0.2)


# ====> Linear regression model 
regressor = LinearRegression()
regressor.fit(startup_data_train, profit_train)

# ====> predict the test results
profit_predict = regressor.predict(startup_data_test)

# ====> Bulding the optimal model using backward elimination
startup_data = np.append(arr = np.ones((50,1)).astype(int), values = startup_data, axis = 1)

startup_data_opt = startup_data[:, [0, 1, 2, 3, 4, 5]]
regressor_ols = smapi.OLS(profit, startup_data_opt).fit()
regressor_summary = regressor_ols.summary()

startup_data_opt = startup_data[:, [0, 1, 3, 4, 5]]
regressor_ols = smapi.OLS(profit, startup_data_opt).fit()
regressor_summary = regressor_ols.summary()

startup_data_opt = startup_data[:, [0, 3, 4, 5]]
regressor_ols = smapi.OLS(profit, startup_data_opt).fit()
regressor_summary = regressor_ols.summary()

startup_data_opt = startup_data[:, [0, 3, 5]]
regressor_ols = smapi.OLS(profit, startup_data_opt).fit()
regressor_summary = regressor_ols.summary()

startup_data_opt = startup_data[:, [0, 3]]
regressor_ols = smapi.OLS(profit, startup_data_opt).fit()
regressor_summary = regressor_ols.summary()