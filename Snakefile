Rscript = '/home/koki/Software/R-3.6.0/bin/Rscript'
INFILE = 'data/input.csv'
INFILE2 = 'data/label.csv'
OUTDIR = 'output/snakemake'

rule all:
    input:
        OUTDIR + '/pca.csv',
        OUTDIR + '/nmf.csv',
        OUTDIR + '/mds.csv',
        OUTDIR + '/lda.csv',
        OUTDIR + '/som.csv',
        OUTDIR + '/isomap.csv',
        OUTDIR + '/lle.csv',
        OUTDIR + '/dmap.csv',
        OUTDIR + '/tsne.csv',
        OUTDIR + '/umap.csv',
        OUTDIR + '/tumap.csv',
        OUTDIR + '/fatlas2.csv'

rule pca:
    input:
        INFILE
    output:
        OUTDIR + '/pca.csv'
    params:
        3
    shell:
        '{Rscript} src/pca.R {input} {params} {output}'

rule nmf:
    input:
        INFILE
    output:
        OUTDIR + '/nmf.csv'
    params:
        4
    shell:
        '{Rscript} src/nmf.R {input} {params} {output}'

rule mds:
    input:
        INFILE
    output:
        OUTDIR + '/mds.csv'
    params:
        4
    shell:
        '{Rscript} src/mds.R {input} {params} {output}'

rule lda:
    input:
        matrix=INFILE,
        label=INFILE2
    output:
        OUTDIR + '/lda.csv'
    params:
        3
    shell:
        '{Rscript} src/lda.R {input.matrix} {input.label} {params} {output}'

rule som:
    input:
        INFILE
    output:
        OUTDIR + '/som.csv'
    params:
        2
    shell:
        '{Rscript} src/som.R {input} {params} {output}'

rule isomap:
    input:
        INFILE
    output:
        OUTDIR + '/isomap.csv'
    params:
        2
    shell:
        '{Rscript} src/isomap.R {input} {params} {output}'

rule lle:
    input:
        INFILE
    output:
        OUTDIR + '/lle.csv'
    params:
        2
    shell:
        '{Rscript} src/lle.R {input} {params} {output}'

rule dmap:
    input:
        INFILE
    output:
        OUTDIR + '/dmap.csv'
    params:
        4
    shell:
        '{Rscript} src/dmap.R {input} {params} {output}'

rule tsne:
    input:
        INFILE
    output:
        OUTDIR + '/tsne.csv'
    params:
        2
    shell:
        '{Rscript} src/tsne.R {input} {params} {output}'

rule umap:
    input:
        INFILE
    output:
        OUTDIR + '/umap.csv'
    params:
        2
    shell:
        '{Rscript} src/umap.R {input} {params} {output}'

rule tumap:
    input:
        INFILE
    output:
        OUTDIR + '/tumap.csv'
    params:
        2
    shell:
        '{Rscript} src/tumap.R {input} {params} {output}'

rule fatlas2:
    input:
        INFILE
    output:
        OUTDIR + '/fatlas2.csv'
    params:
        2
    shell:
        '{Rscript} src/fatlas2.R {input} {params} {output}'
