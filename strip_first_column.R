args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='"')

write.table(data[-1], sep='\t', quote=FALSE, col.names=FALSE)