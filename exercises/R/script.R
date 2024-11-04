library(here)
library(tidyverse)

#set the data ====

#protip: don't use df as general name
some_flights<-read.csv(here("exercises", "data", "flight_subset_2013.csv"))

#month.name is a base R function that assign to a number the month name
#some_flights$month_name = month.name[some_flights$month] without tidyverse

some_flights %>% 
  mutate(month_name = month.name[month])

##case_when ====
#same logic as if_else/for
some_flights %>% 
  mutate(dep_delay_cat = case_when(
    # condition ~ output
    is.na(dep_delay) ~ NA, # if it is NA, return NA
    dep_delay < -30 ~ "Early", # else if it is lower than -30 return "Early"
    dep_delay < 30 ~ "Kind of on time", # else if it is lower than 30...
    TRUE ~ "Late" # else, return "Late"
  ))

###across()====
#add at the end of the case_when() the across() to turn variables into factors




#df$carrier <- as.factor(df$carrier)
#df$tailnum <- as.factor(df$tailnum)
#df$origin <- as.factor(df$origin)
#for(i in 1:length(df$dep_delay)){
#if(is.na(df$dep_delay[[i]])){
#df[i, "dep_delay_cat"] <- NA
#}else if(df$dep_delay[[i]] < -30){
#    df[i, "dep_delay_cat"] <- delay_categories[[1]]
#       }else if(df$dep_delay[[i]] < 30){
#    df[i, "dep_delay_cat"] <- delay_categories[[2]]
#  } else {
#    df[i, "dep_delay_cat"] <- delay_categories[[3]]
#  }
#}
#df$dep_delay_cat <- as.factor(df$dep_delay_cat)

delay_categories <- c("Early", "Kind of on time", "Late")
