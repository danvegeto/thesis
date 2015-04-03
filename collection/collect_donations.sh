set -v

python get_first_column.py data/candidates.tsv > data/cids.txt
python scrape_industries.py 2012 data/cids.txt > data/industries.tsv
python get_unique_names.py data/industries.tsv > data/cids.txt
python remove_missing_rows.py data/candidates.tsv data/cids.txt > data/candidates_1.tsv
cp data/candidates_1.tsv data/candidates.tsv

python get_top_industries.py data/industries.tsv > data/top_industries.tsv
Rscript sort_candidates.R data/top_industries.tsv > data/top_industries_1.tsv
python strip_first_column.py data/top_industries_1.tsv > data/top_industries.txt
Rscript join_columns.R data/candidates.tsv data/top_industries.txt > data/candidates_1.tsv
cp data/candidates_1.tsv data/candidates.tsv

Rscript get_matrix.R data/industries.tsv > data/matrix.tsv
python strip_header.py data/matrix.tsv > data/headless_matrix.tsv
python get_first_column.py data/headless_matrix.tsv > data/matrix_cids.txt
python remove_missing_rows.py data/candidates.tsv data/matrix_cids.txt > data/candidates_1.tsv
cp data/candidates_1.tsv data/candidates.tsv
python get_column.py data/candidates.tsv 4 > data/candidate_totals.txt
Rscript normalize.R data/matrix.tsv data/candidate_totals.txt > data/normalized_matrix.tsv