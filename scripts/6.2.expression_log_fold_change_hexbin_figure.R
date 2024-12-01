#load required library
library(tidyverse)
library(hexbin)

#read input data
rna <- read_csv("data/raw/rnaseq.csv")

#add expression log column
rna <- rna %>% 
  mutate(expression_log = log2(expression+1))

#summarizing over mean expression difference log at different times
rna_fc <- rna %>% select(gene, time, gene_biotype, expression_log) %>%
  group_by(gene, time, gene_biotype) %>%
  summarize(mean_exp = mean(expression_log)) %>%
  pivot_wider(names_from = time, values_from = mean_exp) %>%
  mutate(time_8_vs_0 = `8` - `0`, time_4_vs_0 = `4` - `0`)

#plotting hexbin figure
ggplot(data = rna_fc,mapping = aes(x = time_4_vs_0, y = time_8_vs_0)) + geom_hex()