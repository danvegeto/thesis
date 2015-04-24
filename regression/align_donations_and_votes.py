import sys
import pandas

donations = pandas.read_csv(sys.argv[1], sep='\t')
votes = pandas.read_csv(sys.argv[2], sep='\t')
legislators = pandas.read_csv(sys.argv[3], sep=',', quoting=True, quotechar='"')

D = '\t'.join(donations.columns)
V = '\t'.join(votes.columns)
P = 'PARTY'

for d in range(len(donations)):

	d_id = donations.index[d]

	d_found = False

	for l in range(len(legislators)-1, 10000, -1):

		if legislators.ix[l,'opensecrets_id'] == d_id:

			d_found = True

			l_id_1 = legislators.ix[l,'lis_id']
			l_id_2 = legislators.ix[l,'bioguide_id']

			v_found = False

			for v in range(len(votes)):

				v_id = votes.index[v]

				l_id = None

				if v_id == l_id_1 or v_id == l_id_2:

					v_found = True

					party = legislators.ix[l,'party']

					#if party == 'Republican':
					#	break

					str_list = [d_id]
					for x in donations.ix[d,:].values:
						str_list.append(str(x))

					D += '\n' + '\t'.join(str_list)

					str_list = [d_id]
					for x in votes.ix[v,:].values:
						str_list.append(str(x))

					V += '\n' + '\t'.join(str_list)

					P += '\n' + d_id + '\t' + party

					#print d_id + '\t' + v_id

				if v_found:
					break

			if v_found:
				break

		if d_found:
			break

D_file = open('data/aligned_matrix.tsv', 'w')
D_file.write(D)
D_file.close()

V_file = open('data/aligned_vote_matrix.tsv', 'w')
V_file.write(V)
V_file.close()

P_file = open('data/parties.tsv', 'w')
P_file.write(P)
P_file.close()