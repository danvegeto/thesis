library(reshape)

data = read.table('industries.tsv', sep='\t')

matrix = cast(data, V1 ~ V2)

matrix = gsub(',', '', as.matrix(matrix))
matrix = gsub('\\$', '', as.matrix(matrix))

write.table(matrix, sep='\t', na='"0"', row.names=FALSE, col.names=FALSE)