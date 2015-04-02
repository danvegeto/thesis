args <- commandArgs(TRUE)

data = read.table(args[1], sep='\t', quote='')

for (i in 1:ncol(data))
{
	for (j in 1:ncol(data))
	{
		c = cor(data[,i], data[,j])

		print(paste(i, j, ": ", c, sep=" "))
	}
}

#write.table(data, sep='\t', quote=FALSE, row.names=FALSE, col.names=FALSE)