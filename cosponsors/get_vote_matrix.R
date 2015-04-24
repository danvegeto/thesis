args <- commandArgs(TRUE)
library(reshape)

data = read.table(args[1], sep='\t', quote='')

pivot = cast(data, V2 ~ V1, value='V3')

matrix = as.matrix(pivot)

write.table(matrix, sep='\t', quote=FALSE, na='0')