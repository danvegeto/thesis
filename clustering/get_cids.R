args <- commandArgs(TRUE)
data = read.table(args[1], sep='\t', quote="")
cids = as.character(data[[1]])
cat(cids, sep='\n')