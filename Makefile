Rscript := /home/koki/Software/R-3.6.0/bin/Rscript
INFILE := data/input.csv
INFILE2 := data/label.csv
OUTDIR := output/make

all: $(OUTDIR)/pca.csv \
	$(OUTDIR)/nmf.csv \
	$(OUTDIR)/mds.csv \
	$(OUTDIR)/lda.csv \
	$(OUTDIR)/som.csv \
	$(OUTDIR)/isomap.csv \
	$(OUTDIR)/lle.csv \
	$(OUTDIR)/dmap.csv \
	$(OUTDIR)/tsne.csv \
	$(OUTDIR)/umap.csv \
	$(OUTDIR)/tumap.csv \
	$(OUTDIR)/fatlas2.csv

$(OUTDIR)/pca.csv: src/pca.R
	$(Rscript) src/pca.R $(INFILE) 3 $(OUTDIR)/pca.csv

$(OUTDIR)/nmf.csv: src/nmf.R
	$(Rscript) src/nmf.R $(INFILE) 4 $(OUTDIR)/nmf.csv

$(OUTDIR)/mds.csv: src/mds.R
	$(Rscript) src/mds.R $(INFILE) 4 $(OUTDIR)/mds.csv

$(OUTDIR)/lda.csv: src/lda.R
	$(Rscript) src/lda.R $(INFILE) $(INFILE2) 3 $(OUTDIR)/lda.csv

$(OUTDIR)/som.csv: src/som.R
	$(Rscript) src/som.R $(INFILE) 2 $(OUTDIR)/som.csv

$(OUTDIR)/isomap.csv: src/isomap.R
	$(Rscript) src/isomap.R $(INFILE) 2 $(OUTDIR)/isomap.csv

$(OUTDIR)/lle.csv: src/lle.R
	$(Rscript) src/lle.R $(INFILE) 2 $(OUTDIR)/lle.csv

$(OUTDIR)/dmap.csv: src/dmap.R
	$(Rscript) src/dmap.R $(INFILE) 4 $(OUTDIR)/dmap.csv

$(OUTDIR)/tsne.csv: src/tsne.R
	$(Rscript) src/tsne.R $(INFILE) 2 $(OUTDIR)/tsne.csv

$(OUTDIR)/umap.csv: src/umap.R
	$(Rscript) src/umap.R $(INFILE) 2 $(OUTDIR)/umap.csv

$(OUTDIR)/tumap.csv: src/tumap.R
	$(Rscript) src/tumap.R $(INFILE) 2 $(OUTDIR)/tumap.csv

$(OUTDIR)/fatlas2.csv: src/fatlas2.R
	$(Rscript) src/fatlas2.R $(INFILE) 2 $(OUTDIR)/fatlas2.csv

.PHONY: clean
clean:
	rm $(OUTDIR)/*.csv

force:
	$(Rscript) src/pca.R $(INFILE) 3 $(OUTDIR)/pca.csv
	$(Rscript) src/nmf.R $(INFILE) 4 $(OUTDIR)/nmf.csv
	$(Rscript) src/mds.R $(INFILE) 4 $(OUTDIR)/mds.csv
	$(Rscript) src/lda.R $(INFILE) $(INFILE2) 3 $(OUTDIR)/lda.csv
	$(Rscript) src/som.R $(INFILE) 2 $(OUTDIR)/som.csv
	$(Rscript) src/isomap.R $(INFILE) 2 $(OUTDIR)/isomap.csv
	$(Rscript) src/lle.R $(INFILE) 2 $(OUTDIR)/lle.csv
	$(Rscript) src/dmap.R $(INFILE) 4 $(OUTDIR)/dmap.csv
	$(Rscript) src/tsne.R $(INFILE) 2 $(OUTDIR)/tsne.csv
	$(Rscript) src/umap.R $(INFILE) 2 $(OUTDIR)/umap.csv
	$(Rscript) src/tumap.R $(INFILE) 2 $(OUTDIR)/tumap.csv
	$(Rscript) src/fatlas2.R $(INFILE) 2 $(OUTDIR)/fatlas2.csv
