python scrape_candidates.py 113 > candidates.tsv
Rscript get_cids.R candidates.tsv > cids.txt
python scrape_industries.py 2012 cids.txt > industries.tsv
Rscript get_matrix.R industries.tsv > matrix.tsv