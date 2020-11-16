##6.7.3

library(tidyverse)
library(lubridate)
library(readr)
ebola <- read_csv("Chapter 6/country_timeseries.csv")
head(ebola)



ebola_tidy <- ebola %>% 
  pivot_longer(cols = c(-Date, -Day), names_to = "variable", values_to = "count") %>% 
  mutate(Date = mdy(Date)) %>% 
  separate(col = variable, into = c("type", "country"), sep = "_") %>% 
  pivot_wider(names_from = type, values_from = count) %>% 
  filter(!is.na(Cases) & !is.na(Deaths)) 

ebola_tidy %>% 
  ggplot(aes(x=Date, y=Cases)) +
  geom_line() +
  facet_wrap(~ fct_reorder(country, .x = Cases, .desc = TRUE), ncol = 4, scales = "free_y") +
  theme_few()

ebola_tidy %>% 
  ggplot(aes(x=Date, y=Cases)) +
  geom_line() +
  facet_wrap(~ fct_reorder(country, .x = Deaths, .desc = TRUE), ncol = 4, scales = "free_y") +
  theme_few()

library(forcats)



##6.7.2
mex_deaths <- read_csv("Chapter 6/mexico_deaths.csv")
mex_exps <- read_csv("Chapter 6/mexico_exposure.csv")

mex_deaths %>% 
  filter(!(day %in% mex_exps$day)) 
#all days in mex_deaths are in mex_exps

mex_exps %>% 
  filter(!(day %in% mex_deaths$day))
#all days in mex_deaths are in mex_deaths

mexico <- full_join(mex_deaths, mex_exps, by = "day") %>% 
  select(deaths, day, temp_mean)
  




  
