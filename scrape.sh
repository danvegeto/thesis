set -v
python scrape_candidates.py 112 > data/candidates.tsv
python get_first_column.py data/candidates.tsv > data/cids.txt
python scrape_candidate_totals.py 2012 data/cids.txt > data/candidate_totals.txt

Rscript join_columns.R data/candidates.tsv data/candidate_totals.txt > data/candidates_1.tsv
python remove_zero_rows.py data/candidates_1.tsv 4 > data/candidates_2.tsv
cp data/candidates_2.tsv data/candidates.tsv
python remove_zero_rows.py data/candidate_totals.txt 0 > data/candidate_totals_1.txt
cp data/candidate_totals_1.txt data/candidate_totals.txt

python get_first_column.py data/candidates.tsv > data/cids.txt
python scrape_industries.py 2012 data/cids.txt > data/industries.tsv

python get_top_industries.py data/industries.tsv > data/top_industries.tsv
Rscript sort_candidates.R data/top_industries.tsv > data/top_industries_1.tsv
python strip_first_column.py data/top_industries_1.tsv > data/top_industries.txt
Rscript join_columns.R data/candidates.tsv data/top_industries.txt > data/candidates_1.tsv
cp data/candidates_1.tsv data/candidates.tsv