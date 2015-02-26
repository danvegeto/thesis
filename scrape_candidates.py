import sys
import urllib
from bs4 import BeautifulSoup

congno = sys.argv[1]

url = 'http://www.opensecrets.org/politicians/candlist.php?congno=' + congno
tempfile = 'temp.html'

urllib.urlretrieve(url, tempfile)

html = BeautifulSoup(open(tempfile))

for link in html.find_all('a'):

	href = link.get('href')

	if href != None and href.startswith('summary.php'):

		cid_start = href.find('cid=') + len('cid=')
		cid_end = href.find('&')

		cid = href[cid_start:cid_end]

		text = link.get_text()

		lastname = text.split(' ')[0][:-1]
		firstname = text.split(' ')[1]
		party = text.split('(')[1][0]

		print ','.join([cid, lastname, firstname, party])
