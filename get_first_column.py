import sys

data = open(sys.argv[1]).readlines()

for row in data:

	value = row.split('\t')[0].strip()

	if value.startswith('"') and value.endswith('"'):

		value = value[1:-1]

	print value
