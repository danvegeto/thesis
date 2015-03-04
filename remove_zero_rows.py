import sys

data = open(sys.argv[1]).readlines()
col = int(sys.argv[2])

for row in data:

	row = row.strip()

	if not row.split('\t')[col] == '0':

		print row