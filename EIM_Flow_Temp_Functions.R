library(dplyr)
library(plotly)
library(ggplot2)
#library(tidyverse)
library(lubridate)
library(here)
library(tidyr)
library(readr)

# Flow and Temp analysis

#function to import Flow and Temp analysis

FT <- function(file,site){
  dat <- read_csv(here("data",file),skip = 1, 
                  col_names = c("date",
                                "Flow_cfs",
                                "Water.temp_C"))
  dat$date <- mdy(dat$date)
  dat$site <- site
  
  return(dat)
}


EIMr <- function(file,site){
  a <- read_csv(here("data","EIM",file)) #alpowa data
  names(a)
  a <- a[,c(4,9,46,51,52,57,58,69)]
  colnames(a) <- c("site",
                   "date",
                   "Parameter",
                   "Value",
                   "Units",
                   "Data_Qual",
                   "Data_Q_Desc",
                   "Result_comment")
  a$site <- site
  a$date <- mdy(a$date)
  a2 <- a %>% filter(Parameter %in% c("Ammonia",
                                      "Dissolved Oxygen",
                                      "Fecal Coliform",
                                      "Nitrate + Nitrite as N",
                                      "Ortho-Phosphate",
                                      "pH",
                                      "Phosphorus",
                                      "Total Persulfate Nitrogen",
                                      "Total Phosphorus",
                                      "Total Suspended Solids"))
  return(a2)
}



# for (var in unique(combo$Parameter)) { # points a lines of all parameters,  call with lapply
#   print( ggplot(combo[combo$Parameter==var,],
#                 aes(date, Value,color=site)) +
#            geom_line() +
#            geom_point()+
#            facet_grid(~Parameter) )
# }
