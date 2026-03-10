#!/usr/bin/env Rscript

library(Matrix)
#install.packages("fastTopics")
library(ggplot2)
library(cowplot)
library(fastTopics)

set.seed(1)

AMmatrix <- readMM("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression.mtx")
cols <- read.csv("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression_col_names.tsv", sep="\t", header=FALSE)
rows <- read.csv("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression_row_names.tsv", sep="\t", header=FALSE)
colnames(AMmatrix) <- cols$V1
row.names(AMmatrix) <- rows$V1
AMmatrix <- t(AMmatrix)
AMmatrix <- as(AMmatrix, "CsparseMatrix")

fit7 <- readRDS("20250324_GSE280003_AMsLPS_Topicfit7_iter150.RDS")

nonzero_genes <- row.names(fit7$F)
AMmtx <- AMmatrix[,nonzero_genes]

AMlabels <- read.csv("//bgfs//rgottschalk//Sonia//CellOracle//20250325_GSE280003_barcode_labels.csv")
AMlabels <- list(barcodes = AMlabels$X, labs =AMlabels$label)

de7 <- de_analysis(fit7, AMmtx, pseudocount =0.1)
saveRDS(de7, file = "20250326_GSE280003_Topicfit7_DE.RDS")

topicLFCs <- as.data.frame(de7$est)
#write.csv(topicLFCs, "20250327_fit7_DE_LFCs.csv")