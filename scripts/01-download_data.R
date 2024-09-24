#### Preamble ####
# Purpose: Downloads and saves the data from Open data Toronto
# Author: Wen Han Zhao
# Date: 24 September 2024
# Contact: youna.zhao@mail.utoronto.ca
# License: MIT
# Pre-requisites: Dataset found from Open data Toronto
# Any other information needed?


#### Workspace setup ####

library(opendatatoronto)
library(tidyverse)

#### Download data ####

# Search for the Deaths of Shelter Residents package from Open Data Toronto
package <- search_packages("Deaths of Shelter Residents")

# Get the package ID
package_id <- package$id[1]

# Get the package resource
resource <- list_package_resources(package_id)

# Filter for the datastore resources that we want 
datastore_resources <- filter(resource, tolower(format) %in% c('csv'))

# Get our csv data
data <- filter(datastore_resources, row_number() == 1) |>
  get_resource()


#### Save data ####
write_csv(data, "data/raw_data/shelter_data.csv") 

         
