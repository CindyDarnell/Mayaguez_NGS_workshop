## Making growth curve plots with ggplot2

## Install tidyverse
install.packages("tidyverse")

library(tidyr)
library(ggplot2)

data <- read.csv("Hca_trmB_growth_curve.csv", header = TRUE, check.names=FALSE)
data_tidy <- gather(data, key=Time, value=OD, "0":"48")
data_tidy$Time <- as.numeric(data_tidy$Time)

ggplot(data_tidy, aes(x=Time, 
                      y=OD, 
                      color=Strain, 
                      group=interaction(Strain, Replicate, Condition)))+
  geom_point()+
  geom_line(aes(linetype=Condition))+
  theme_bw()+
  scale_y_log10()




