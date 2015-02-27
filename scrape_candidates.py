import sys
import urllib
from bs4 import BeautifulSoup

congno = sys.argv[1]

url = 'http://www.opensecrets.org/politicians/candlist.php?congno=' + congno

html = urllib.urlopen(url).read()

doc = BeautifulSoup(html)

for link in doc.find_all('a'):

	href = link.get('href')

	if href != None and href.startswith('summary.php'):

		cid_start = href.find('cid=') + len('cid=')
		cid_end = href.find('&')

		cid = href[cid_start:cid_end]

		text = link.get_text()

		lastname = '"' + text.split(' ')[0][:-1].strip() + '"'
		firstname = '"' + text.split(' ')[1].strip() + '"'
		party = '"' + text.split('(')[1][0].strip() + '"'

		print '\t'.join([cid, lastname, firstname, party])
