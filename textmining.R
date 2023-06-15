#!/usr/bin/env Rscript
library(tidyverse)
a <- read_csv("abril_2018_biometria.csv.gz")

x <- a %>%
	lapply(gsub, pattern='b\'\'', replacement=NA) %>%
	lapply(gsub, pattern='b\'', replacement='') %>%
	lapply(gsub, pattern='\'', replacement='') %>%
	lapply(gsub, pattern=' ', replacement='') %>%
	as_tibble() %>%
#	rowwise() %>%
	pivot_longer(everything()) %>%
	mutate(name=str_remove(name, "b''...")) %>%
	drop_na(value)
	
write_csv(x,"primeraprueba.csv")
