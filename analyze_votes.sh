set -v
Rscript normalize.R data/matrix.tsv data/candidate_totals.txt > data/normalized_matrix.tsv
Rscript get_vote_matrix.R data/votes.tsv > data/vote_matrix.tsv
python align_donations_and_votes.py data/normalized_matrix.tsv data/vote_matrix.tsv data/legislators.csv
Rscript regression.R data/aligned_matrix.tsv data/aligned_vote_matrix.tsv > data/coefficients.tsv