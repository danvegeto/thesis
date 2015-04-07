import sys

data = open(sys.argv[1]).readlines()

print data[0].strip()

for line in data[1:]:

	values = line.strip().split('\t')

	if values[1] == 'Republican':

		values[1] = '-1'

	elif values[1] == 'Democrat':

		values[1] = '1'

	else:

		values[1] = '0'

	print '\t'.join(values)