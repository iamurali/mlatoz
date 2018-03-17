# -*- coding: utf-8 -*-

# Multiple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.linear_model import LinearRegression
import statsmodels.formula.api as smapi

def read_data():
  data = pd.read_csv('50_Startups.csv')
  return data

def extract_variables(data):
  startup_data = data.iloc[:, :-1].values
  profits = data.iloc[:, 4].values
  return startup_data, profits

def encode_data(startup_data):
   label_encoder = LabelEncoder()
   startup_data[:, 3] = label_encoder.fit_transform(startup_data[:, 3])
   onehotencoder = OneHotEncoder(categorical_features=[3])
   startup_data = onehotencoder.fit_transform(startup_data).toarray()
   return startup_data
  
def predict(independent_var_train, dependent_var_train, independent_var_test):
  regressor = LinearRegression()
  regressor.fit(independent_var_train, dependent_var_train)
  return regressor.predict(independent_var_train)
  
def backward_elimination(model_data, dependent_var, sl):
   length = len(dependent_var[1])
   for i in range(0, length):
     regressor = smapi.OLS(model_data, dependent_var).fit()
     maxPvalue = max(regressor.pvalues).astype(float)
     if (maxPvalue > sl):
       for j in range(0, length-i):
         if(regressor.pvalues[j].astype(float) == maxPvalue):
           dependent_var = np.delete(dependent_var, j, 1)
   print(regressor.summary())
   return model_data
     
     
def multi_linear_regression_backward_elimation():
  dataset = read_data()
  startup_data, profits = extract_variables(dataset)
  startup_data = encode_data(startup_data)
  startup_data = startup_data[:, 1:]
  startup_train, startup_test, profits_train, profits_test = train_test_split(startup_data, profits)
  predictor_result = predict(startup_train, profits_train, startup_test)

  sl = 0.05
  startup_data = np.append(arr = np.ones((50,1)).astype(int), values = startup_data, axis = 1)
  startup_data_opt = startup_data[:, [0, 1, 2, 3, 4, 5]]
  # ===> selecting optimal value 
  result = backward_elimination(profits, startup_data_opt, sl)
  
result = multi_linear_regression_backward_elimation()
print(result)