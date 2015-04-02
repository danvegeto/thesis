args <- commandArgs(TRUE)

matrix_data = read.table(args[1], sep='\t', quote="")
vector_data = read.table(args[2], sep='\t', quote="")

matrix = matrix_data
vector = as.vector(vector_data)

normalized = matrix / c(vector)

write.table(normalized, sep='\t', quote=FALSE, na='0')
