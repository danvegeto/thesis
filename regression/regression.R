args <- commandArgs(TRUE)
library(reshape)

donations = read.table(args[1], sep='\t', quote='', header=TRUE)
votes = read.table(args[2], sep='\t', quote='', header=TRUE)
parties = read.table(args[3])

x = cbind(as.matrix(parties), as.matrix(donations))
y = unlist(votes[1])

rows = min(nrow(x), nrow(y))

x = x[1:rows,]

cat('\tPARTY\tINTERCEPT\t')
cat(colnames(donations), sep='\t')
cat('\tP\tNULL_P')
cat('\n')

for (i in 1:nrow(votes))
{
	y = unlist(votes[i])	
	y = y[1:rows]

	y = floor(y)

	fit = glm(y ~ x, family=binomial(link='logit'), maxit = 100)
	
	c = coefficients(fit)

	cat(colnames(votes)[i])
	cat('\t')

	cat(c, sep='\t')

	rd = with(fit, deviance)
	rdf = with(fit, df.residual)

	nd = with(fit, null.deviance)
	ndf = with(fit, df.null)

	rp = 1 - pchisq(rd, rdf)
	np = 1 - pchisq(nd, ndf)

	cat('\t')
	cat(rp)

	cat('\t')
	cat(np)

	cat('\n')
}