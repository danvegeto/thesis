set -v

Rscript get_matrix.R data/industries.tsv > data/matrix.tsv

python strip_header.py data/matrix.tsv > data/headless_matrix.tsv
python get_first_column.py data/headless_matrix.tsv > data/matrix_cids.txt

python remove_missing_rows.py data/candidates.tsv data/matrix_cids.txt > data/candidates_1.tsv
cp data/candidates_1.tsv data/candidates.tsv

python get_column.py data/candidates.tsv 4 > data/candidate_totals.txt

Rscript normalize.R data/matrix.tsv data/candidate_totals.txt > data/normalized_matrix.tsv
Rscript strip_labels.R data/normalized_matrix.tsv > data/raw_matrix.tsv

python ~/tools/tsne/reduce.py ./data/raw_matrix.tsv > data/2d_matrix.tsv

echo -e "cid\tlast\tfirst\tparty\tt\tindustry\tx\ty" > data/data.tsv
Rscript join_columns.R data/candidates.tsv data/2d_matrix.tsv >> data/data.tsv

cp data/data.tsv views/data/data.tsv