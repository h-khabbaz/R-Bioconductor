#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#do the job
solution <- rna %>% 
  select(chromosome_name,sex,expression) %>%
  filter(chromosome_name=="X"|chromosome_name=="Y") %>%
  group_by(chromosome_name,sex) %>%
  summarise(mean_expression=mean(expression)) %>%
  pivot_wider(names_from = sex,values_from = mean_expression)

#export
write_csv(solution,"data/processed/5.1.genders-mean-XY-exp-output.csv")

