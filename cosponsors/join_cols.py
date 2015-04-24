import sys
import pandas

col_source = pandas.read_csv(sys.argv[1], sep='\t')
row_source = pandas.read_csv(sys.argv[2], sep='\t')

paths = sys.argv[3:]

cols = []

for path in paths:

	col = open(path).read().strip().split('\t')

	cols.append(col)

data = pandas.DataFrame(cols).transpose()

data.index = row_source[[0]]
data.columns = col_source.columns

print data.to_csv(sep='\t')