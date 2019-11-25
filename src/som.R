library("som")

# Command line arguments
args <- commandArgs(trailingOnly = TRUE)
infile <- args[1]
ndim <- as.numeric(args[2])
outfile <- args[3]

# Data Loading
indata <- as.matrix(read.csv(infile, header=FALSE))

# Log-transformation
indata <- log10(indata + 1)

# Dimensional Reduction
set.seed(1234)
out.pca <- prcomp(indata)
out.som <- som(out.pca$rotation[,1:50], xdim=5, ydim=5)
out.som <- out.som$visual[,1:2] + 0.5 +
    cbind(rnorm(ncol(indata),0, 0.2), rnorm(ncol(indata), 0, 0.2))

# Data Saving
write.table(out.som, outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
