
# IMPORT LIBRARIES ---------------------------------------------------------------

library(readr)
library(tidyverse)
library(janitor)

# IMPORT DATASET ----------------------------------------------------------

dataset <- read_csv("catastro-sample.csv")
glimpse(dataset)
locale()
df<-dataset %>% janitor::clean_names() %>% type_convert(locale=locale(decimal_mark =","))
glimpse(df)


# CREATE COLUMN -----------------------------------------------------------

df_ap<-df %>% mutate(Apartamento_turistico=floor %in% "00")
df_area_ccaa<-df_ap %>% select(autonomous_region,area) %>% drop_na() %>% group_by(autonomous_region) %>% summarise(mean(area))
