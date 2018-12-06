#########################################################################
#                                                                       #
#          ChIP-seq peak calling with the MOSAiCS package               #
#      Dongjun Chung, Pei Fen Kuan, Rene Welch, and Sunduz Keles        #
# https://www.bioconductor.org/packages/release/bioc/html/mosaics.html  #
#                                                                       #
#########################################################################

## Install MOSAiCS and dependencies

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("mosaics", version = "3.8")

library(mosaics)
library(hexbin)

setwd("~/NGS_workshop/data_processing")

constructBins(infile="./aligned_data/parent_IP_sorted.bam",
              fileFormat="bam",
              outfileLoc="./peak_calling",
              byChr=FALSE,
              fragLen=200,
              binSize=200,
              capping=0,
              PET=FALSE)

constructBins(infile="./aligned_data/parent_WCE_sorted.bam",
              fileFormat="bam",
              outfileLoc="./peak_calling",
              byChr=FALSE,
              fragLen=200,
              binSize=200,
              capping=0)

fileName <- c("./peak_calling/parent_IP_sorted.bam_fragL200_bin200.txt", 
              "./peak_calling/parent_WCE_sorted.bam_fragL200_bin200.txt")

binTest <- readBins(type=c("chip", "input"), fileName=fileName)
a <- hexbin (binTest@input, binTest@tagCount, xbins=100)
control <- plot(a, trans=log, inv=exp, colramp=rainbow, xlab="WCE", ylab="ChIP", lcex=0.9)
hexVP.abline(control$plot.vp, a=0, b=sum(binTest@tagCount)/sum(binTest@input), lwd=0.2)

fitTest <- mosaicsFit(binTest, analysisType="IO", bgEst="rMOM")
plot(fitTest)


peakTest <- mosaicsPeak(fitTest, signalModel="2S", FDR=0.05)
export(peakTest, type="bed", filename="./peak_calling/parent_peaks.bed")
export(peakTest, type="txt", filename="./peak_calling/parent_peaks.txt")

