import sys
import pandas

funding = pandas.read_csv(sys.argv[1], sep='\t')

funding = funding.div(funding.sum(axis=1), axis=0)

print '\t'.join(funding.columns)

for index in funding.index:

	row = ['"' + index + '"']

	for cell in funding.ix[index,:]:
		row.append(str(cell))

	print '\t'.join(row)