args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='')

data = data[apply(data[,-1], 1, function(x) !all(x==0)),]

write.table(data, sep='\t', quote=FALSE)