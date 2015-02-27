args <- commandArgs(TRUE)
data = read.table(args[1], sep='\t', quote="")
data = data[order(data[[1]]),]
write.table(data, sep='\t', quote=FALSE, na='0', col.names=FALSE)