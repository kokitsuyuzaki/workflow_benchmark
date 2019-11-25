library("Rtsne")

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
out.tsne <- Rtsne(t(indata), dims=ndim)

# Data Saving
write.table(out.tsne$Y, outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
