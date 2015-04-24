import sys
import urllib
import json
from bs4 import BeautifulSoup

congress = sys.argv[1]

dir_url = 'https://www.govtrack.us/data/congress/' + congress + '/bills/hr/'

dir_text = urllib.urlopen(dir_url).read()
dir_doc = BeautifulSoup(dir_text)

for link in dir_doc.find_all('a')[1:1000]:

	bill_name = link['href'][:-1]

	url = dir_url + bill_name + '/data.json'

	text = urllib.urlopen(url).read()
	data = json.loads(text)

	bill_id = data['bill_id']

	for cosponsor in data['cosponsors']:

		cosponsor_id = cosponsor['thomas_id']

		print '\t'.join([bill_id, cosponsor_id, '1'])