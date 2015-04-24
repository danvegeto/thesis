PARTIES=`tail -n 1 data/parties_results.tsv`
COMBINED=`tail -n 1 data/combined_results.tsv`
expr $COMBINED - $PARTIES