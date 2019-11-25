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

# Data Saving
write.table(out.pca$rotation[, 1:ndim], outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
