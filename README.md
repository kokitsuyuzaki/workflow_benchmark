# workflow_benchmark
A benchmark of benchmark workflow or comparision of dimensional reduction methods

## Requirements
- Ruby and its package as below
  - rake
- Python and its packages as below
  - jupyther
  - snakemake
  - papermill
- R and its packages as below
	- IRKernel
	- nnTensor
	- RDRToolbox
	- MASS
	- lle
	- som
	- destiny
	- Rtsne
	- uwot
	- igraph
	- Matrix
	- RANN
	- ForceAtlas2

## How to perform these workflows
### Bash workflow

```{bash}
./workflow.sh
```

### Makefile workflow

```{bash}
make
```

### Rakefile workflow

```{bash}
rake
```

### Snakemake workflow

```{bash}
snakemake
```

### Papermill workflow

```{bash}
papermill workflow.ipynb output/papermill/output.ipynb \
-p infile data/input.csv -p infile2 data/label.csv -p  \
outdir output/papermill -p pca_ndim 3 -p nmf_ndim 4  \
-p mds_ndim 4 -p lda_ndim 3 -p som_ndim 2 -p isomap_ndim 2 \
-p lle_ndim 2 -p dmap_ndim 4 -p tsne_ndim 2 -p umap_ndim 2 \
-p tumap_ndim 2 -p fatlas2_ndim 2
```

### CWL workflow

```{bash}
cwltool workflow.cwl
```
