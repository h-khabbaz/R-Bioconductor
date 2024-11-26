#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#add expression log column
rna <- rna %>% 
  mutate(expression_log = log2(expression+1))

plot_data <- ggplot(rna,mapping = aes(x = expression_log, y = sample))
plot_data + geom_point(aes(color = time))

