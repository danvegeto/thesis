set -v
python scrape_candidates.py 113 > data/candidates.tsv
Rscript get_cids.R data/candidates.tsv > data/cids.txt
python scrape_industries.py 2012 data/cids.txt > data/industries.tsv