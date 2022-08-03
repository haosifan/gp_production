library(jsonlite)
library(readr)
library(dplyr)
library(janitor)

gp <- jsonlite::fromJSON("https://creativecommons.tankerkoenig.de/json/list.php?lat=51.26200631775155&lng=7.12993796630200558&rad=4&sort=dist&type=all&apikey=xxxxxxxxxxxxxxxxxxxxxxxxxxxx")
gp_df <- gp %>% as.data.frame() %>% janitor::clean_names() %>% 
  mutate(datetime = Sys.time()) %>% 
  mutate(hour = hour(datetime),
         weekday = weekdays(datetime, abbreviate = TRUE))


write_csv(gp_df, file = "/home/ubuntu/gp_production/gasprices.csv", append = TRUE)
