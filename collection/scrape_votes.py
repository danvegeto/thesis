import urllib
import json
from bs4 import BeautifulSoup

congress = '113'

for year in ['2013', '2014']:

	dir_url = 'https://www.govtrack.us/data/congress/' + congress + '/votes/' + year + '/'

	dir_text = urllib.urlopen(dir_url).read()
	dir_doc = BeautifulSoup(dir_text)

	for link in dir_doc.find_all('a')[1:]:

		vote_name = link['href'][:-1]

		if not vote_name.startswith('h'):
			continue

		url = dir_url + vote_name + '/data.json'

		text = urllib.urlopen(url).read()
		data = json.loads(text)

		category = data['category']
		
		if category != 'passage':
			continue

		for choice in data['votes'].keys():

			quant = '0.5'

			if choice == 'Aye' or choice == 'Yes' or choice == 'Yea':
				quant = '1'
			elif choice == 'Nay' or choice == 'No':
				quant = '0'

			for voter in data['votes'][choice]:
				
				print '\t'.join([congress, year, vote_name, data['vote_id'], voter['id'], choice, quant])