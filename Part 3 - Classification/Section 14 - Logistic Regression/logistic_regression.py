# Logistic Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from matplotlib.colors import ListedColormap

def draw_plot(x_set, y_set, classifier):
  age_full_set = np.arange(start = x_set[:, 0].min()-1, stop= x_set[:, 0].max() + 1, step = 0.01)
  salary_full_set = np.arange(start = x_set[:, 1].min() - 1, stop = x_set[:, 1].max() + 1, step = 0.01)
  print(age_full_set.shape)
  x1, x2 = np.meshgrid(age_full_set, salary_full_set)
  y_predict = classifier.predict( np.array([x1.ravel(), x2.ravel()]).T).reshape(x1.shape)
  plt.contourf(x1, x2, y_predict, alpha = 0.75, cmap = ListedColormap(('red', 'green')))
  plt.xlim(x1.min(), x1.max())
  plt.ylim(x2.min(), x2.max())
  for i, j in enumerate(np.unique(y_set)):
    idx = (y_set == j)
    print(np.unique(y_set))
    print(x_set[idx])
    print(j)
    plt.scatter(x_set[y_set == j, 0], x_set[ y_set == j, 1], cmap = ListedColormap(('red', 'green'))(i), label = j)
    
  plt.title('Logistic vs Regression Training set')
  plt.xlabel('Age')
  plt.ylabel('Estimated Salary')
  plt.legend()
  return plt
  

# Importing the dataset
dataset = pd.read_csv('Social_Network_Ads.csv')
independent_variables = dataset.iloc[:, [2,3]].values
dep_variable = dataset.iloc[:, 4].values

# Divide into training set and test set

independent_variables_train, independent_variables_test, dep_variable_train, dep_variable_test = train_test_split(independent_variables, dep_variable, test_size = 0.25, random_state = 0)
sc_x = StandardScaler()
independent_variables_train = sc_x.fit_transform(independent_variables_train)
independent_variables_test = sc_x.transform(independent_variables_test)

# ====> Linear regression

classifier = LogisticRegression(random_state = 0)
classifier.fit(independent_variables_train, dep_variable_train)
dep_predict = classifier.predict(independent_variables_test)

# ====> Confusion matrix 
cm = confusion_matrix(dep_variable_test, dep_predict)

# ====> Plot
plt_graph = draw_plot(independent_variables_train, dep_variable_train, classifier)
plt.savefig('training_set_py.png')
plt.close()
plt_graph = draw_plot(independent_variables_test, dep_variable_test, classifier)
plt.savefig('test_set_py.png')
plt.close()