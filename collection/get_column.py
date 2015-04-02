import sys

data = open(sys.argv[1]).readlines()
col = int(sys.argv[2])

for row in data:

	value = row.split('\t')[col].strip()

	if value.startswith('"') and value.endswith('"'):

		value = value[1:-1]

	print value
