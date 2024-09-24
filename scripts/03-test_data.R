#### Preamble ####
# Purpose: Sanity check of the data
# Author: Wen Han Zhao
# Date: 24 September 2024
# Contact: youna.zhao@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have the simulated data
# Any other information needed? None


#### Workspace setup ####

library(tidyverse)


#### Test data ####
data <- read.csv("data/raw_data/simulated.csv")

# Since the data is randomly generated with poisson distribution, no negative number should be present in the data

data$number_of_death |> min() <= 0

# Since the data is randomly generated with poisson distribution, no NA data should be present in the data

all(is.na(data$number_of_death))
