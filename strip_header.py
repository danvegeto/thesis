import sys

data = open(sys.argv[1]).readlines()

print ''.join(data[1:])