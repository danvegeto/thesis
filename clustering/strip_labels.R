args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='')

write.table(data, sep='\t', row.names=FALSE, col.names=FALSE)