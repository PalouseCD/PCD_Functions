# FLOURISH Data
## This script cleans and compiles all bulk density, infiltration and soil sampling
## data into one csv for analysis purposes. It also exports separate csvs of chemical, biological
## and physical data to shiny app folders ready for deployment.

library(tidyr)
library(readr)
library(dplyr)
library(lubridate)
library(ggthemes)
library(plotly)
library(here)
library(wesanderson)
library(janitor)
library(stringr)
library(tidyverse)
library(data.table)
library(janitor)

data <- read_csv(here("data","FLOURISH_MASTER_SoilsData.csv"))
unique(data$Parameter)

# Box plots of all parameters by time period
for (var in unique(data$Parameter)) { 
  print( ggplot(data[data$Parameter==var,], 
                aes(Value)) + 
           geom_histogram() + 
           facet_grid(~Parameter) )
}  

# points a lines of all parameters
for (var in unique(data$Parameter)) { 
  print( ggplot(data[data$Parameter==var,], 
                aes(Value,color=Management)) + 
           geom_histogram(stat = 'identity')
           )
}

#facet_grid() 
