args <- commandArgs(TRUE)
library(reshape)

data = read.table(args[1], sep='\t', quote="")

pivot = cast(data, V1 ~ V2, value='V3')

matrix = as.matrix(pivot)
matrix = gsub(',', '', matrix)
matrix = gsub('\\$', '', matrix)

#matrix = matrix[order(rownames(matrix)),]

#head(matrix)

write.table(matrix, sep='\t', quote=FALSE, na='0', row.names=FALSE, col.names=FALSE)