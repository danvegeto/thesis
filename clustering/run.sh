set -v

cp ../data/normalized_matrix.tsv data/normalized_matrix.tsv
cp ../data/candidates.tsv data/candidates.tsv

Rscript strip_labels.R data/normalized_matrix.tsv > data/raw_matrix.tsv

python ~/tools/tsne/reduce.py ./data/raw_matrix.tsv > data/2d_matrix.tsv

echo -e "cid\tlast\tfirst\tparty\tt\tindustry\tx\ty" > data/data.tsv
Rscript join_columns.R data/candidates.tsv data/2d_matrix.tsv >> data/data.tsv

cp data/data.tsv views/data/data.tsv