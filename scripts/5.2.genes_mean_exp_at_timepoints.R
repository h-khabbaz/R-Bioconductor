#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#do the job
solution <- rna %>% 
  select(gene,time,expression) %>%
  group_by(gene,time) %>%
  summarise(mean_expression=mean(expression)) %>%
  pivot_wider(names_from = time,values_from = mean_expression)

#view results
solution

#export
write_csv(solution,"data/processed/5.2.genes_mean_exp_at_timepoints.csv")

