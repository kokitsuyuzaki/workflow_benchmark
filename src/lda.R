library("MASS")

# Command line arguments
args <- commandArgs(trailingOnly = TRUE)
infile <- args[1]
labelfile <- args[2]
ndim <- as.numeric(args[3])
outfile <- args[4]

# Data Loading
indata <- as.matrix(read.csv(infile, header=FALSE))
label <- unlist(read.table(labelfile))

# Log-transformation
indata <- log10(indata + 1)

# Dimensional Reduction
out.pca <- prcomp(indata)
out.lda <- lda(label~., data=as.data.frame(out.pca$rotation[,1:30]))
out.lda <- predict(out.lda)$x

# Data Saving
write.table(out.lda[, 1:ndim], outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
