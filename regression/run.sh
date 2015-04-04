set -v

cp ../data/normalized_matrix.tsv data/normalized_matrix.tsv
cp ../data/vote_matrix.tsv data/vote_matrix.tsv
cp ../data/legislators.csv data/legislators.csv

python align_donations_and_votes.py data/normalized_matrix.tsv data/vote_matrix.tsv data/legislators.csv

python quantify_parties.py data/parties.txt > data/quantified_parties.txt

Rscript regression.R data/aligned_matrix.tsv data/aligned_vote_matrix.tsv data/quantified_parties.txt > data/coefficients.tsv

Rscript sort_coefficients.R data/coefficients.tsv > data/sorted_coefficients.tsv