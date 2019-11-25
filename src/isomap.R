library("RDRToolbox")

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
out.isomap <- Isomap(data=t(indata), dims=2, k=5)

# Data Saving
write.table(out.isomap[[1]], outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
