set -v

Rscript get_matrix.R data/industries.tsv > data/labeled_matrix.tsv
Rscript get_first_column.R data/labeled_matrix.tsv > data/matrix_cids.txt
Rscript strip_first_column.R data/labeled_matrix.tsv > data/matrix.tsv

python ~/tools/tsne/reduce.py ./data/matrix.tsv > data/2d_matrix.tsv

Rscript sort_candidates.R data/candidates.tsv > data/sorted_candidates.tsv
python remove_missing_rows.py data/sorted_candidates.tsv data/matrix_cids.txt > data/clean_candidates.tsv

echo -e "index\tcid\tlast\tfirst\tparty\tx\ty" > data/data.tsv
Rscript join_columns.R data/clean_candidates.tsv data/2d_matrix.tsv >> data/data.tsv

cp data/data.tsv views/data/data.tsv