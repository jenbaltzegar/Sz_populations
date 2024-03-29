#!/usr/bin/env Rscript

# set working directory
setwd("~/temp_JenB/jfbaltz_libs3-6/tests.denovo/results")

snps_per_loc = read.delim('./n_snps_per_locus.tsv')
# Keep only M==n, m==3
snps_per_loc = subset(snps_per_loc, M==n & m==3)
# Rename column 1
colnames(snps_per_loc)[1] = 'par_set'

# Create a new data frame to contain the number of loci and polymorphic loci
d = snps_per_loc[,c('par_set', 'M', 'n', 'm')]
d = d[!duplicated(d),]

# Compute these numbers for each parameter set, using the par_set column as an ID
rownames(d) = d$par_set
for(p in rownames(d)) {
	s = subset(snps_per_loc, par_set == p)
	d[p,'n_loci'] = sum(s$n_loci)
	s2 = subset(s, n_snps > 0)
	d[p,'n_loci_poly'] = sum(s2$n_loci)
}

# Make sure the table is ordered
d = d[order(d$M),]

pdf('./n_loci_Mn.pdf')

# Number of loci
# ==========

plot(NULL,
	xlim=range(d$M),
	ylim=range(c(0, d$n_loci)),
	xlab='M==n',
	ylab='Number of loci',
	main='Number of 80%-samples loci as M=n increases',
	xaxt='n',
	las=2
	)
abline(h=0:20*5000, lty='dotted', col='grey50')
axis(1, at=c(1,3,5,7,9))
legend('bottomright', c('All loci', 'Polymorphic loci'), lty=c('solid', 'dashed'))

lines(d$M, d$n_loci)
points(d$M, d$n_loci, cex=0.5)

lines(d$M, d$n_loci_poly, lty='dashed')
points(d$M, d$n_loci_poly, cex=0.5)

# Number of new loci at each step (slope of the previous)
# ==========

# Record the number of new loci at each parameter step
d$new_loci =  d$n_loci - c(NA, d$n_loci)[1:nrow(d)]
d$new_loci_poly = d$n_loci_poly - c(NA, d$n_loci_poly)[1:nrow(d)]

# Record the step size
d$step_size = d$M - c(NA, d$M)[1:(nrow(d))]

plot(NULL,
	xlim=range(d$M),
	ylim=range(c(0, d$new_loci, d$new_loci_poly), na.rm=T),
	xlab='M==n',
	ylab='Number of new loci / step_size (slope)',
	main='Number of new 80%-samples loci as M=n increases'
	)
abline(h=0, lty='dotted', col='grey50')
legend('topright', c('All loci', 'Polymorphic loci'), lty=c('solid', 'dashed'))

lines(d$M, d$new_loci / d$step_size)
points(d$M, d$new_loci / d$step_size, cex=0.5)

lines(d$M, d$new_loci_poly / d$step_size, lty='dashed')
points(d$M, d$new_loci_poly / d$step_size, cex=0.5)

null=dev.off()
