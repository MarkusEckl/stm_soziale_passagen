library(magrittr)
library(dplyr)
library(quanteda)
library(spacyr)
library(stm)
library(DT)
library(sna)
library(ggplot2)
setwd("/home/eckl/analyse_sp")

load('output/data/stm_model.RData') # loads  stm model

kResult <- searchK(dfm2stm$documents, dfm2stm$vocab, K=c(20,40,60,80), data=dfm2stm$meta)
plot(kResult)

#plot(kResult$results$semcoh)


plot.searchK(kResult)


jpeg("evaluation_sementic_coherence.jpg", width = 350, height = "350")
p <- qplot(kResult$results$K, kResult$results$semcoh, geom=c("point", "smooth"),
      xlab = "Anzahl an N Topics",
      ylab = "semantic coherence")

p
dev.off()


qplot(kResult$results$K, kResult$results$exclus, geom=c("point", "smooth"))

save.image('output/data/stm_evaluation.RData')
