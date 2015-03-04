import sys

data = open(sys.argv[1]).readlines()

current = ''

for row in data:

	if current == '' or not row.startswith(current):

		current = row.split('\t')[0]

		print '\t'.join(row.split('\t')[0:2])




