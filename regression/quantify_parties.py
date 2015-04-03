import sys

data = open(sys.argv[1]).readlines()

for line in data:

	value = line.strip()

	if value == 'Republican':

		print '-1'

	elif value == 'Democrat':

		print '1'

	else:

		print '0'