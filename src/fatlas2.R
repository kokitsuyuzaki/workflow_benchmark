library("igraph")
library("Matrix")
library("RANN")
library("ForceAtlas2")

# Command line arguments
args <- commandArgs(trailingOnly = TRUE)
infile <- args[1]
ndim <- as.numeric(args[2])
outfile <- args[3]

# Data Loading
indata <- as.matrix(read.csv(infile, header=FALSE))

# Log-transformation
indata <- log10(indata + 1)

# Spase Adjacency Matrix
k = 3
neighbors <- nn2(t(indata), k=k)
n_cells <- ncol(indata)
A <- sparseMatrix(
    i = rep(1:n_cells, k),            # row indexes
    j = as.vector(neighbors$nn.idx),  # column indexes
    x = 1,                            # non-zero value
    dims = c(n_cells, n_cells)        # matrix size
)
AA <- A %*% t(A)
S <- sparseMatrix(i = AA@i + 1, p = AA@p,
    x = AA@x / (2 * k - AA@x), dims = dim(AA))
G <- graph_from_adjacency_matrix(S, weighted = TRUE,
    mode = "undirected", diag = FALSE)

# Dimensional Reduction
out.pca <- prcomp(indata)
set.seed(1234)
out.fatlas2 <- layout.forceatlas2(G, k=k, pos=out.pca$rotation[,1:2],
	plotstep=1E+10)

# Data Saving
write.table(out.fatlas2, outfile,
    row.names=FALSE, col.names=FALSE, quote=FALSE)
