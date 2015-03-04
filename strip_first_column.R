args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='"')

write.table(data[-1], sep='\t', quote=FALSE, row.names=FALSE, col.names=FALSE)