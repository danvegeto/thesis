import sys

data = open(sys.argv[1]).readlines()

for row in data:

	print '\t'.join(row.split('\t')[1:]).strip()