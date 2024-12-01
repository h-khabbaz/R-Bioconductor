#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#add expression log column
rna <- rna %>% 
  mutate(expression_log = log2(expression+1))

#expression log distribution per sample boxplot
ggplot(data = rna,mapping = aes(x = expression_log, y = sample)) + geom_boxplot(alpha = 0.2) + geom_jitter(alpha = 0.2, color = "tomato")