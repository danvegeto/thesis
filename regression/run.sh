set -v

cp ../data/matrix.tsv data/matrix.tsv
cp ../data/vote_matrix.tsv data/vote_matrix.tsv
cp ../data/legislators.csv data/legislators.csv

python normalize.py data/matrix.tsv > data/normalized_matrix.tsv

python align_donations_and_votes.py data/normalized_matrix.tsv data/vote_matrix.tsv data/legislators.csv

python quantify_parties.py data/parties.tsv > data/quantified_parties.tsv

python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv CONTROL > data/control_results.tsv
python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv PARTIES > data/parties_results.tsv
#python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv FUNDING > data/funding_results.tsv
#python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv COMBINED > data/combined_results.tsv

#echo 'mean\tmedian\tmin\tmax' > data/accuracy_scores.tsv

for i in {0..91}
do
	echo "python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv COMBINED $i > data/combined_results.tsv"
	python regression.py data/quantified_parties.tsv data/aligned_matrix.tsv data/aligned_vote_matrix.tsv COMBINED $i > data/combined_results.tsv

	echo "python compare_results.py data/parties_results.tsv data/combined_results.tsv > data/accuracy_scores_$i.tsv"
	python compare_results.py data/parties_results.tsv data/combined_results.tsv > data/accuracy_scores_$i.tsv

done

python join_cols.py data/aligned_matrix.tsv data/combined_results.tsv data/accuracy_scores_{0..91}.tsv > data/accuracy_scores.tsv
