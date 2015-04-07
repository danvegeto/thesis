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

model_type = sys.argv[4]

votes = np.floor(votes)

num_politicians = votes.shape[0]

intercept = pd.DataFrame([1]*num_politicians, columns=['INTERCEPT'], index = parties.index)

x = None

if model_type == 'CONTROL':
	x = intercept
elif model_type == 'PARTIES':
	x = intercept.join(parties)
elif model_type == 'FUNDING':
	x = intercept.join(funding)
elif model_type == 'COMBINED':
	x = intercept.join(parties).join(funding)
else:
	print 'invalid model type'
	sys.exit(1)

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