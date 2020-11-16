# Copy this code to an R script and add comments describing what each line is doing
# Install any packages that the code loads but that you don't have.
library(package = "haven")
library(package = "forcats")
library(package = "stringr")
library(dplyr)
library(readr)
#Loads the packages we need for the rest of the script

icu <- read_sas(data_file = "data/icu.sas7bdat")

icu <- select(.data = icu, ID, AGE, GENDER)

icu <- rename(.data = icu, 
              id = ID,
              age = AGE,
              gender = GENDER)

icu <- mutate(.data = icu,
              gender = as_factor(x = gender),
              gender = fct_recode(.f = gender,
                                  Male = "0",
                                  Female = "1"),
              id = str_c(id)) 

icu


ebola <- read_csv(file = "data/country_timeseries.csv")
colnames(ebola)
ebola_liberia <- select(.data = ebola, Date, Cases_Liberia, Deaths_Liberia)

head(x=ebola_liberia)
ncol(x=ebola_liberia)
nrow(x=ebola_liberia)

ebola_liberia <- rename (.data = ebola_liberia, 
                         date = Date,
                         cases = Cases_Liberia,
                         deaths = Deaths_Liberia)
head(ebola_liberia)

ebola_liberia <- mutate(.data=ebola_liberia, 
                        ratio = deaths/cases)
head(ebola_liberia)

ebola_liberia <- filter(.data = ebola_liberia, 
                        !is.na(deaths))
head(x = ebola_liberia)
nrow(ebola_liberia)


first_five <- arrange(ebola_liberia, desc(deaths))
first_five <- slice(.data=first_five, 1:5)
first_five
 

# Copy this code to an R script and add comments describing what each line is doing
library(package = "haven") #loading package

icu <- read_sas(data_file = "data/icu.sas7bdat") %>% 
  select(ID, AGE, GENDER) %>% 
  rename(id = ID,
         age = AGE, 
         gender = GENDER) %>% 
  mutate(gender = as_factor(x = gender),
         gender = fct_recode(.f = gender, 
                             Male = "0",
                             Female = "1"),
         id = str_c(id)) %>% 
  arrange(age) %>% 
  slice(1:10)

icu 

ebola <- read_csv(file = "data/country_timeseries.csv") %>% 
  select(Date, Cases_Liberia, Deaths_Liberia) %>% 
  rename(date = Date, cases = Cases_Liberia, deaths = Deaths_Liberia) %>% 
  mutate(ratio = deaths/cases) %>% 
  filter(!is.na(cases))
ebola


