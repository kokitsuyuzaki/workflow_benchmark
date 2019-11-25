library("lle")

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
out.pca <- prcomp(indata)
set.seed(1234)
out.lle <- lle(out.pca$rotation[,1:50], m=2, k=20)

# Data Saving
write.table(out.lle$Y, outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
