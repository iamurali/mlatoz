#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar 11 23:03:35 2018

@author: mural.kummitha
"""
# ======> Auto Insurance in Sweden simple linear regression

from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LinearRegression
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# =====> read dataset
dataset = pd.read_csv('AutoInsurSweden.csv')

# ====> split data set into training set and test set
no_of_claims = dataset.iloc[:, :-1].values
payment = dataset.iloc[:, 1].values
no_of_claims_train, no_of_claims_test, payment_train, payment_test = train_test_split(no_of_claims, payment, test_size=0.2)

# =====> fitting simple linear to the training set
regressor = LinearRegression()
regressor.fit(no_of_claims_train, payment_train)
payment_predict = regressor.predict(no_of_claims_test)


# =====> Plot training set regression graph
plt.scatter(no_of_claims_train, payment_train, color='red')
plt.plot(no_of_claims_train, regressor.predict(no_of_claims_train), color='blue')
plt.xlabel('No of Claims')
plt.ylabel('Total Payment')
plt.title('No.of Claims vs Total Payment (Training set)')
plt.savefig('p_train_set.png')
plt.close()


# ====> Plot test set regression grapth
plt.scatter(no_of_claims_test, payment_test, color='red')
plt.plot(no_of_claims_train, regressor.predict(no_of_claims_train), color='blue')
plt.title('No.of Claims vs Total Payment (Test set)')
plt.xlabel('No of Claims')
plt.ylabel('Total Payment')
plt.savefig('p_test_set.png')
plt.close()