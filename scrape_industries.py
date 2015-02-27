import sys
import urllib
from bs4 import BeautifulSoup

cycle = sys.argv[1]
cid_file = sys.argv[2]
cid_list = open(cid_file).readlines()

for cid in cid_list:

	cid = cid.strip()

	url = 'http://www.opensecrets.org/politicians/industries.php?type=I&recs=0&cycle=' + cycle + '&cid=' + cid

	try:

		html = urllib.urlopen(url).read()

	except IOError:

		print cid
		continue

	doc = BeautifulSoup(html)

	for table in doc.find_all('table', attrs={'id': 'topIndus'}):

		for tr in doc.find_all('tr'):

			col_tags = tr.find_all('td')

			if len(col_tags) < 2:
				continue

			text = col_tags[1].get_text()

			if text == 'Coded' or text == 'Not Coded':
				continue

			cols = ['"' + cid + '"']

			# ignore first two columns
			col_tags = col_tags[2:]

			for td in col_tags:

				cols.append('"' + td.get_text().strip() + '"')

			print '\t'.join(cols)

