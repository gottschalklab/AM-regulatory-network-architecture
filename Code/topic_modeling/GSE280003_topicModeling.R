#!/usr/bin/env Rscript

library(Matrix)
#install.packages("fastTopics")
library(ggplot2)
library(cowplot)
library(fastTopics)
library(arrow)
library(igraph)
library(tidyverse)
library(Rtsne)
setwd("/bgfs/rgottschalk/Sonia/CellOracle/topicModeling")

set.seed(1)

AMmatrix <- readMM("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression.mtx")
cols <- read.csv("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression_col_names.tsv", sep="\t", header=FALSE)
rows <- read.csv("//bgfs//rgottschalk//Sonia//CellOracle//20250320_GSE280003_allAM_expression_row_names.tsv", sep="\t", header=FALSE)
colnames(AMmatrix) <- cols$V1
row.names(AMmatrix) <- rows$V1
AMmatrix <- t(AMmatrix)
AMmatrix <- as(AMmatrix, "CsparseMatrix")  

#22Mar25 has row col names now
#fit4 <- fit_topic_model(AMmatrix,k = 4)
#saveRDS(fit4, file = "20250322_GSE280003_AMsLPS_Topicfit4.RDS")

#fit5 <- fit_topic_model(AMmatrix, k = 5)
#saveRDS(fit5, file = "20250322_GSE280003_AMsLPS_Topicfit5.RDS")

#fit6 <- fit_topic_model(AMmatrix, k = 6)
#saveRDS(fit6, file = "20250322_GSE280003_AMsLPS_Topicfit6.RDS")

#24Mar25
#fit6 <- fit_topic_model(AMmatrix, k=6, numiter.main = 150, numiter.refine = 150)
#saveRDS(fit6, file = "20250324_GSE280003_AMsLPS_Topicfit6_iter150.RDS")

#fit7 <- fit_topic_model(AMmatrix, k=7, numiter.main = 150, numiter.refine = 150)
#saveRDS(fit7, file = "20250324_GSE280003_AMsLPS_Topicfit7_iter150.RDS")
