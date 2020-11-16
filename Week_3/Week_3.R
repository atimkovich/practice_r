library("readr")
beijing_pm_raw <- read_csv("Week_3/Beijing_2017_HourlyPM25.csv",
                           skip = 3)
head(beijing_pm_raw, n = 3)

library("dplyr")
beijing_pm <- beijing_pm_raw %>%
  rename(sample_time = `Date (LST)`,
         value = Value,
         qc = `QC Name`) %>%
  select(sample_time, value, qc)
head(beijing_pm, n = 3)

beijing_pm <- beijing_pm %>%
  mutate(aqi = cut(value,
                   breaks = c(0, 50, 100, 150, 200,
                              300, 500, Inf),
                   labels = c("Good", "Moderate",
                              "Unhealthy for Sensitive Groups",
                              "Unhealthy", "Very Unhealthy",
                              "Hazardous", "Beyond Index")))
head(beijing_pm, n = 2)

mean(x = beijing_pm$value)
min(x = beijing_pm$value)

beijing_pm 

library("purrr")
beijing_pm %>%
  pluck("value") %>%
  mean()