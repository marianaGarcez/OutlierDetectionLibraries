library(stmove)
library(sf)
library(dplyr)
library(ggplot2)

dataStMove<- read.csv("/Users/marianaduarte/Desktop/aisdk-2022-11-18.csv")


dataStMove <- dataStMove %>%filter(!is.na(Latitude))

dataStMove <- dataStMove %>%filter(!is.na(Longitude))

AG195_sf <- dataStMove %>%
  st_as_sf(coords = 4:5, crs = 4236)


AG195_reg <- AG195_sf %>%
  mutate(
    x = st_coordinates(AG195_sf)[,1],
    y = st_coordinates(AG195_sf)[,2]
  ) %>%
  mutate(date = Timestamp) %>%
  select(x, y, Timestamp, MMSI)

table(is.na(AG195_reg$x))
AG195_final <- stmove::kalman(AG195_reg)

write.csv(AG195_final, "stmoveaisdk-2022-11-18.csv")
rm(list=ls()) 