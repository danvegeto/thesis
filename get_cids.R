args <- commandArgs(TRUE)
data = read.table(args[1], sep='\t')
cids = as.character(data[[1]])
cat(cids, sep='\n')