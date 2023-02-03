library(stmove)
library(sf)
library(dplyr)
library(ggplot2)

dataStMove<- read.csv("/Users/marianaduarte/Desktop/states_2022-06-27-01.csv")


dataStMove <- dataStMove %>%filter(!is.na(lat))

dataStMove <- dataStMove %>%filter(!is.na(lon))

AG195_sf <- dataStMove %>%
  st_as_sf(coords = 3:4, crs = 4236)


AG195_reg <- AG195_sf %>%
  mutate(
    x = st_coordinates(AG195_sf)[,1],
    y = st_coordinates(AG195_sf)[,2]
  ) %>%
  mutate(date = time) %>%
  select(x, y, time, icao24)

table(is.na(AG195_reg$x))
AG195_final <- stmove::kalman(AG195_reg)

write.csv(AG195_final, "stmovestates_2022-06-27-01-teste.csv")
rm(list=ls()) 