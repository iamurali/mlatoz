# -*- coding: utf-8 -*-

# =====> import libraries

import numpy as np
import matplotlib as plt
import pandas as pd
from sklearn.cross_validation import train_test_split


# ====> read data

dataset = pd.read_csv("data.csv")
x = dataset.iloc[:, -1].values
y = dataset.iloc[:, 3].values

# ====> training set and test set

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

"""
from sklearn.preprocessing import StandardScaler
sc_x = StandardScaler()
x_train = sc_x.fit_transform(x_train)
x_test = sc_x.fit_transform(x_test)
"""
