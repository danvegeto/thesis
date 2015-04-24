import sys
import pandas

results_0 = pandas.read_csv(sys.argv[1], sep='\t')
results_1 = pandas.read_csv(sys.argv[2], sep='\t')

scores_0 = results_0['ACCURACY']
scores_1 = results_1['ACCURACY']

gain = scores_1 - scores_0

str_list = []
for val in gain.tolist():
	str_list.append(str(val))

print '\t'.join(str_list)