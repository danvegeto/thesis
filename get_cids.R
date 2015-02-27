data = read.table('candidates.tsv', sep='\t')
cids = as.character(data[[1]])
cat(cids, sep='\n')