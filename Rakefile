# -*- coding: utf-8 -*-

Rscript = "/home/koki/Software/R-3.6.0/bin/Rscript"
INFILE = "data/input.csv"
INFILE2 = "data/label.csv"
OUTDIR = "output/rake"

task :default => ["#{OUTDIR}/pca.csv", "#{OUTDIR}/nmf.csv",
	"#{OUTDIR}/mds.csv", "#{OUTDIR}/lda.csv",
	"#{OUTDIR}/som.csv", "#{OUTDIR}/isomap.csv",
	"#{OUTDIR}/lle.csv", "#{OUTDIR}/dmap.csv",
	"#{OUTDIR}/tsne.csv", "#{OUTDIR}/umap.csv",
	"#{OUTDIR}/tumap.csv", "#{OUTDIR}/fatlas2.csv"]

desc "PCA"
file "#{OUTDIR}/pca.csv" => "src/pca.R" do
	sh "#{Rscript} src/pca.R #{INFILE} 3 #{OUTDIR}/pca.csv"
end

desc "NMF"
file "#{OUTDIR}/nmf.csv" => "src/nmf.R" do
	sh "#{Rscript} src/nmf.R #{INFILE} 4 #{OUTDIR}/nmf.csv"
end

desc "MDS"
file "#{OUTDIR}/mds.csv" => "src/mds.R" do
	sh "#{Rscript} src/mds.R #{INFILE} 4 #{OUTDIR}/mds.csv"
end

desc "LDA"
file "#{OUTDIR}/lda.csv" => "src/lda.R" do
	sh "#{Rscript} src/lda.R #{INFILE} #{INFILE2} 3 #{OUTDIR}/lda.csv"
end

desc "SOM"
file "#{OUTDIR}/som.csv" => "src/som.R" do
	sh "#{Rscript} src/som.R #{INFILE} 2 #{OUTDIR}/som.csv"
end

desc "Isomap"
file "#{OUTDIR}/isomap.csv" => "src/isomap.R" do
	sh "#{Rscript} src/isomap.R #{INFILE} 2 #{OUTDIR}/isomap.csv"
end

desc "LLE"
file "#{OUTDIR}/lle.csv" => "src/lle.R" do
	sh "#{Rscript} src/lle.R #{INFILE} 2 #{OUTDIR}/lle.csv"
end

desc "Diffusion Map"
file "#{OUTDIR}/dmap.csv" => "src/dmap.R" do
	sh "#{Rscript} src/dmap.R #{INFILE} 2 #{OUTDIR}/dmap.csv"
end

desc "t-SNE"
file "#{OUTDIR}/tsne.csv" => "src/tsne.R" do
	sh "#{Rscript} src/tsne.R #{INFILE} 2 #{OUTDIR}/tsne.csv"
end

desc "UMAP"
file "#{OUTDIR}/umap.csv" => "src/umap.R" do
	sh "#{Rscript} src/umap.R #{INFILE} 2 #{OUTDIR}/umap.csv"
end

desc "t-UMAP"
file "#{OUTDIR}/tumap.csv" => "src/tumap.R" do
	sh "#{Rscript} src/tumap.R #{INFILE} 2 #{OUTDIR}/tumap.csv"
end

desc "ForceAtlas2"
file "#{OUTDIR}/fatlas2.csv" => "src/fatlas2.R" do
	sh "#{Rscript} src/fatlas2.R #{INFILE} 2 #{OUTDIR}/fatlas2.csv"
end

desc "全ての出力ファイルを削除"
task :clean do
	sh "rm -rf #{OUTDIR}/*"
end

desc "全てのコマンドを実行"
task :force do
	sh ""
end