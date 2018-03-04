# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import Imputer
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
import copy

# Importing the dataset

dataset = pd.read_csv('Data.csv')

X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 3].values

# ====> taking care of missing data

# ====> using mean strategy
 
mean_x = copy.deepcopy(X)
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0)
imputer = imputer.fit(mean_x[:, 1:3])

mean_x[:, 1:3] = imputer.transform(mean_x[:, 1:3])

print(mean_x)

# ====> using median strategy

median_x = copy.deepcopy(X)
median_imputer = Imputer(missing_values= "NaN", strategy= "median", axis= 0)
median_x[:, 1:3] = median_imputer.fit_transform(median_x[:, 1:3])
print(median_x)

# ====> using mode strategy

mode_x = copy.deepcopy(X)
mode_imputer = Imputer(missing_values= "NaN", strategy= "most_frequent", axis= 0)
mode_x[:, 1:3] = mode_imputer.fit_transform(mode_x[:, 1:3])
print(mode_x)


# ====> categorical data

# ====> using mean

labelencoder = LabelEncoder()
mean_x[:, 0] = labelencoder.fit_transform(mean_x[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
mean_x = onehotencoder.fit_transform(mean_x).toarray()

labelpurchase = LabelEncoder()
Y = labelpurchase.fit_transform(Y)


