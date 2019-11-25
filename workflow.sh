#!/bin/bash

Rscript='/home/koki/Software/R-3.6.0/bin/Rscript'
INFILE='data/input.csv'
INFILE2='data/label.csv'
OUTDIR='output/bash'

echo '### PCA ###'
$Rscript src/pca.R $INFILE 3 $OUTDIR'/pca.csv'

echo '### NMF ###'
$Rscript src/nmf.R $INFILE 4 $OUTDIR'/nmf.csv'

echo '### MDS ###'
$Rscript src/mds.R $INFILE 4 $OUTDIR'/mds.csv'

echo '### LDA ###'
$Rscript src/lda.R $INFILE $INFILE2 3 $OUTDIR'/lda.csv'

echo '### SOM ###'
$Rscript src/som.R $INFILE 2 $OUTDIR'/som.csv'

echo '### Isomap ###'
$Rscript src/isomap.R $INFILE 2 $OUTDIR'/isomap.csv'

echo '### LLE ###'
$Rscript src/lle.R $INFILE 2 $OUTDIR'/lle.csv'

echo '### Diffusion Map ###'
$Rscript src/dmap.R $INFILE 4 $OUTDIR'/dmap.csv'

echo '### t-SNE ###'
$Rscript src/tsne.R $INFILE 2 $OUTDIR'/tsne.csv'

echo '### UMAP ###'
$Rscript src/umap.R $INFILE 2 $OUTDIR'/umap.csv'

echo '### t-UMAP ###'
$Rscript src/tumap.R $INFILE 2 $OUTDIR'/tumap.csv'

echo '### ForceAtlas2 ###'
$Rscript src/fatlas2.R $INFILE 2 $OUTDIR'/fatlas2.csv'
