set -v

Rscript get_matrix.R data/industries.tsv > data/matrix.tsv

echo -e "x\ty" > data/2d_matrix.tsv
python ~/tools/tsne/reduce.py ./data/matrix.tsv >> data/2d_matrix.tsv

cp data/2d_matrix.tsv views/data/data.tsv