import sys
import math
import numpy as np
import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
from patsy import dmatrices
from sklearn.linear_model import LogisticRegression
from sklearn.cross_validation import train_test_split
from sklearn import metrics
from sklearn.cross_validation import cross_val_score

parties = pd.read_csv(sys.argv[1], sep='\t')
funding = pd.read_csv(sys.argv[2], sep='\t')
votes = pd.read_csv(sys.argv[3], sep='\t')

votes = np.floor(votes)

x = parties.join(funding)
#x = funding
#x = parties

print '\t' + '\t'.join(x.columns) + '\t' + 'SUM_ABS\tACCURACY'

for i in range(votes.shape[1]):

	col = votes.columns[i]
	y = votes[col]

	# instantiate a logistic regression model, and fit with X and y
	model = LogisticRegression(C=100)
	model = model.fit(x, y)

	coefficients = model.coef_[0]
	sum_abs = sum(abs(coefficients))

	str_list = []
	for c in coefficients:
		str_list.append(str(c))

	# evaluate the model using 10-fold cross-validation
	score = cross_val_score(LogisticRegression(C=100), x, y, scoring='accuracy', cv=10).mean()

	print votes.columns[i] + '\t' + '\t'.join(str_list) + '\t' + str(sum_abs) + '\t' + str(score)