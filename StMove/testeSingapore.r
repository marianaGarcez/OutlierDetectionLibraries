library(stmove)
library(sf)
library(dplyr)
library(ggplot2)

dataStMove<- read.csv("/Users/marianaduarte/Desktop/Singaporepart0003.csv")


dataStMove <- dataStMove %>%filter(!is.na(rawlat))

dataStMove <- dataStMove %>%filter(!is.na(rawlng))

AG195_sf <- dataStMove %>%
  st_as_sf(coords = 6:7, crs = 4236)


AG195_reg <- AG195_sf %>%
  mutate(
    x = st_coordinates(AG195_sf)[,1],
    y = st_coordinates(AG195_sf)[,2]
  ) %>%
  mutate(date = pingtimestamp) %>%
  select(x, y, pingtimestamp, trj_id)

table(is.na(AG195_reg$x))
AG195_final <- stmove::kalman(AG195_reg)

write.csv(AG195_final, "stmoveSingaporepart0003.csv")
rm(list=ls()) 