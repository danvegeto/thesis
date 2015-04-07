library(reshape)
library(boot)
#library(bootstrap)

args <- commandArgs(TRUE)

donations = read.table(args[1], sep='\t', quote='', header=TRUE)
votes = read.table(args[2], sep='\t', quote='', header=TRUE)
parties = read.table(args[3])



#x = cbind(as.matrix(parties), as.matrix(donations))
#y = votes#unlist(votes[1])



n = nrow(donations)

#x = x[1:rows,]

cat('\tPARTY\tINTERCEPT\t')
cat(colnames(donations), sep='\t')
#cat('\tSUM_ABS\tP\tNULL_P\tNET_P')
cat('\tDELTA\tDELTA_1')
cat('\n')

for (i in 1:1)#n)
{


	#vote_data = cbind(parties, floor(votes[i]))
	vote_data = cbind(parties, donations, floor(votes[i]))

	

	#y = unlist(votes[i])	
	#y = y[1:rows]
	
	#y = floor(y)


	#x_train = as.matrix(x[1:(rows-rows/5),])
	#y_train = as.matrix(y[1:(rows-rows/5),])
	#x_test = as.matrix(x[(rows-rows/5):rows,])
	#y_test = as.matrix(y[(rows-rows/5):rows,])


	y = vote_data[,94]
	x = as.matrix(vote_data[,1:93])


	fit = glm(y ~ x, data=vote_data, family=binomial(link='logit'), maxit = 100)
	
	c = coefficients(fit)

	cat(colnames(votes)[i])
	
	cat('\t')
	cat(c, sep='\t')

	#sum_abs = sum(abs(c))

	#cat('\t')
	#cat(sum_abs)

	#rd = with(fit, deviance)
	#rdf = with(fit, df.residual)

	#nd = with(fit, null.deviance)
	#ndf = with(fit, df.null)

	#rp = 1 - pchisq(rd, rdf)
	#np = 1 - pchisq(nd, ndf)
	#net_p = rp - np

	#cat('\t')
	#cat(rp)

	#cat('\t')
	#cat(np)

	#cat('\t')
	#cat(net_p)

	cat('\t')

 	#cost_function = function(r, pi = 0) mean(abs(r-pi) > 0.5)

	#print(vote_data)


	eval = cv.glm(vote_data, fit, K=10)

	cat('\n')

	print(eval)

	


	cat('\n')
	cat('\n')

	#x1 = data.frame(vote_data[301:350,1:93])


	#print(x1)

	#predicted_votes = round(predict(fit, newdata=x1, type='response'))

	#cat(predicted_votes)

	cat('\n')
	cat('\n')

	#correct = sum(predicted_votes == y)

	#accuracy = correct / length(y)

	#cat(correct)
	#cat('/')
	#cat(length(y))
	#cat('\n')
	#cat(accuracy)

	cat('\n')
	cat('\n')
}

warnings()