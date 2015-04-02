import sys
import urllib
from bs4 import BeautifulSoup

cycle = sys.argv[1]
cid_file = sys.argv[2]
cid_list = open(cid_file).readlines()

for cid in cid_list:

	cid = cid.strip()

	url = 'http://www.opensecrets.org/politicians/summary.php?cycle=' + cycle + '&type=I&cid=' + cid

	html = urllib.urlopen(url).read()

	doc = BeautifulSoup(html)

	text = doc.td.next_sibling.next_sibling.text

	print text.strip().replace('$', '').replace(',', '')