args <- commandArgs(TRUE)
library(reshape)

donations = read.table(args[1], sep='\t', quote='', header=TRUE)
votes = read.table(args[2], sep='\t', quote='', header=TRUE)

x = as.matrix(donations)
y = unlist(votes[1])

rows = min(nrow(x), nrow(y))

x = x[1:rows,]

cat('\t\t')
cat(colnames(donations), sep='\t')
cat('\n')

for (i in 1:nrow(votes))
{
	y = unlist(votes[i])	
	y = y[1:rows]

	#convert to {0, 1}
	y = floor((y+1)/2)

	fit = glm(y ~ x, family=binomial(link='logit'), maxit = 100)

	#summary(fit)
	
	c = coefficients(fit)

	cat(colnames(votes)[i])
	cat('\t')

	cat(c, sep='\t')

	cat('\n')
}