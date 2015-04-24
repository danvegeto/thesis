set -v

cp ../data/matrix.tsv data/matrix.tsv

python scrape_cosponsors.py 113 > data/cosponsors.tsv
Rscript get_vote_matrix.R data/cosponsors.tsv > data/cosponsor_matrix.tsv

./dl_legislators.sh > data/legislators.csv