set -v

cp ../data/normalized_matrix.tsv data/normalized_matrix.tsv
cp ../data/vote_matrix.tsv data/vote_matrix.tsv
cp ../data/legislators.csv data/legislators.csv

python align_donations_and_votes.py data/normalized_matrix.tsv data/vote_matrix.tsv data/legislators.csv
Rscript regression.R data/aligned_matrix.tsv data/aligned_vote_matrix.tsv > data/coefficients.tsv