set -v

cp ../data/normalized_matrix.tsv data/normalized_matrix.tsv
cp ../data/vote_matrix.tsv data/vote_matrix.tsv
cp ../data/legislators.csv data/legislators.csv

python align_donations_and_votes.py data/normalized_matrix.tsv data/vote_matrix.tsv data/legislators.csv

python quantify_parties.py data/parties.tsv > data/quantified_parties.tsv

python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv CONTROL > data/control_results.tsv
python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv PARTIES > data/parties_results.tsv
python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv FUNDING > data/funding_results.tsv
python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv COMBINED > data/combined_results.tsv
