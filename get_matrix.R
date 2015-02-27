args <- commandArgs(TRUE)
library(reshape)

data = read.table(args[1], sep='\t')

pivot = cast(data, V1 ~ V2)

matrix = as.matrix(pivot)
matrix = gsub(',', '', matrix)
matrix = gsub('\\$', '', matrix)

write.table(matrix, sep='\t', na='"0"', row.names=FALSE, col.names=FALSE)