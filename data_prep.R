library(tidyverse)
library(readxl)
library(janitor)

data <- read_xlsx("Summary_of_NZ_Wines.xlsx") %>%
  clean_names()
names(data) <- c("Category", paste0("y", 2009:2018))  

write_rds(data, path = "nz_wine/wine.rds")
