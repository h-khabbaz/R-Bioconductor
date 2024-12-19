#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#add expression log column
rna <- rna %>% 
  mutate(expression_log = log2(expression+1))

#Calculate each chromosome mean expression at different times
chr_exp_by_time <- rna %>% 
  group_by(chromosome_name,time) %>% 
  summarise(mean_exp = mean(expression_log))

#Line plot
ggplot(data = chr_exp_by_time, mapping = aes(x = time,y = mean_exp)) + geom_line() + facet_wrap(~ chromosome_name, scales = "free_y")