set -v

python scrape_votes.py > data/votes.tsv
Rscript get_vote_matrix.R data/votes.tsv > data/vote_matrix.tsv

./dl_legislators.sh > data/legislators.csv