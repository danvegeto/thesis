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

if len(sys.argv) > 5:
	funding_col = int(sys.argv[5])
	funding = funding.ix[:,funding_col]

#funding = funding.ix[:,["Transportation Unions", "Building Trade Unions", "Leadership PACs", "Candidate Committees", "Public Sector Unions", "Lobbyists", "Oil & Gas", "Misc Finance", "Democratic/Liberal"]]

#votes = votes + 1
votes = np.floor((votes + 1) / 2)

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

c_param = 100
tol_param = 0.001
k_param = 5

print 'VOTE\t' + '\t'.join(x.columns) + '\t' + 'SUM_ABS\tACCURACY'

#scores = []

for i in range(votes.shape[1]):

	col = votes.columns[i]
	y = votes[col]

	try:

		# instantiate a logistic regression model, and fit with X and y
		model = LogisticRegression(C=c_param, tol=tol_param)
		model = model.fit(x, y)

		coefficients = model.coef_[0]
		sum_abs = sum(abs(coefficients))

		str_list = []
		for c in coefficients:
			str_list.append(str(c))

		# evaluate the model using 10-fold cross-validation
		score = cross_val_score(LogisticRegression(C=c_param, tol=tol_param), x, y, scoring='accuracy', cv=k_param).mean()

		#scores.append(score)

		print votes.columns[i] + '\t' + '\t'.join(str_list) + '\t' + str(sum_abs) + '\t' + str(score)

	except ValueError:
		continue

#print sum(scores) / len(scores)