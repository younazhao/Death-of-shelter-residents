#### Preamble ####
# Purpose: Cleans the raw death of shelter residents data into an analysis dataset
# Author: Wen Han Zhao
# Date: 24 September 2024
# Contact: youna.zhao@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have the downloaded data
# Any other information needed? 

#### Workspace setup ####

library(tidyverse)
library(janitor)
library(lubridate)
library(dplyr)

#### Clean data ####

# Load the downloaded data from Open Data Toronto 
raw_data <- read_csv("data/raw_data/shelter_data.csv")

# Clean the column name to avoid "/" 
cleaned_data <- raw_data |> clean_names()

# Select relevant column only
cleaned_data <- cleaned_data |>
  select(
    year,
    month,
    total_decedents,
    male,
    female
  )

# Rename to add in more specific information
cleaned_data <-  cleaned_data |>
  rename(
    total_deaths = total_decedents,
    male_decedents = male,
    female_decedents = female
  )

# Change the format of the variable corresponding to our simulated dataset
cleaned_data <- cleaned_data |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
