#########################################################################
#                                                                       #
#         Generating wiggle files with the MOSAiCS package              #
#      Dongjun Chung, Pei Fen Kuan, Rene Welch, and Sunduz Keles        #
# https://www.bioconductor.org/packages/release/bioc/html/mosaics.html  #
#                                                                       #
#########################################################################


# The ‘generateWig’ function supports the same set of aligned read file formats 
# as in the ‘constructBins’ function. 
# The ‘span’ argument indicates span used in wiggle files. 
# The ‘normConst’ argument means the normalizing constant to scale the values in 
# wiggle files and it is especially useful when wiggle files for multiple related 
# samples are generated and compared. In the resulting wiggle files, values are 
# scaled by the value specified in the ‘normConst’ argument.

## Install MOSAiCS and dependencies

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("mosaics", version = "3.8")

library(mosaics)

## Generate wiggle files based on sorted bam files

setwd("~/NGS_workshop/data_processing/aligned_data")

generateWig(infile="parent_IP_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)

generateWig(infile="parent_WCE_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)

generateWig(infile="trmB1_IP_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)

generateWig(infile="trmB1_WCE_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)

generateWig(infile="trmB2_IP_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)

generateWig(infile="trmB2_WCE_sorted.bam",
            fileFormat="bam", 
            outfileLoc="./",
            byChr=FALSE,
            PET=FALSE, 
            fragLen=200, 
            span=50, 
            capping=0, 
            normConst=1)
