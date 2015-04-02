args <- commandArgs(TRUE)
library(reshape)

data = read.table(args[1], sep='\t', quote='')

pivot = cast(data, V5 ~ V4, value='V7')

matrix = as.matrix(pivot)

write.table(matrix, sep='\t', quote=FALSE, na='0')