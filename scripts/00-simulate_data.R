#### Preamble ####
# Purpose: Simulates Data
# Author: Wen Han Zhao
# Date: 24 September 2024
# Contact: youna.zhao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####

library(tidyverse)


#### Simulate data ####

set.seed(304)

# Defining a Starting date & End Date

start_date <- as.Date("2007-01-01")
end_date <- as.Date("2024-08-31")

# Number of dates we want to generate

number_of_dates <- 200

# Creating the simulated data frame

data <- tibble(
  date = as.Date(
    runif(
      n = number_of_dates,
      min = start_date,
      max = end_date
    ),
    origin = "1970-01-01"
  ),
  
  number_of_death = rpois(n = number_of_dates, lambda = 10)
)

#### Write CSV to store the simulation data ####

write_csv(data, file = "data/raw_data/simulated.csv")

