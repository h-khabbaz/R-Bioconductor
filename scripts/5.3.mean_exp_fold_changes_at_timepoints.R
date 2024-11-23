#load required library
library(tidyverse)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#do the job
solution <- rna %>% 
  select(gene,time,expression) %>%
  group_by(gene,time) %>%
  summarise(mean_expression=mean(expression)) %>%
  pivot_wider(names_from = time,values_from = mean_expression) %>% 
  mutate(fold_change_8vs0 = `8`/`0`,fold_change_8vs4 = `8`/`4`) %>% 
  pivot_longer(names_to = "compare",values_to = "fold_change",fold_change_8vs0:fold_change_8vs4)

#view results
solution

#export
write_csv(solution,"data/processed/5.3.mean_exp_fold_changes_at_timepoints.csv")
