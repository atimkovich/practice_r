library(readr)
list.files()
Id_genetics <- read_tsv("ld_genetics.txt")
summary(Id_genetics)

co_measles <- read_tsv("measles_data/02-09-2015.txt", col_names= c("city", "count"))

head(co_measles)

library(readxl)
icd10 <- read_excel("icd-10.xls")

library(haven)
icu <- read_sas("icu.sas7bdat")

ebola <- read_csv(file = "data/country_timeseries.csv")

dim(x = ebola)    # Get the dimensions of the data (`nrow` and `ncol` would also work)
colnames(x = ebola) # Get the column names (you can also just print the object: `ebola`)

vignette()

