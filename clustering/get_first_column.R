args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='"')

cat(as.character(data[[1]]), sep='\n')