import sys

candidates = open(sys.argv[1]).readlines()
cids = open(sys.argv[2]).readlines()

current = 0

for row in candidates:

	if current < len(cids) and row.startswith(cids[current].strip()):

		print row.strip()
		current += 1