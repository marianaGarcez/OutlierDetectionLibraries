install.packages("argosfilter")
library(argosfilter)

seal3 <- read.csv("/Users/marianaduarte/Desktop/Singaporepart0003.csv")


lat<-seal3$rawlat
lon<-seal3$rawlng
dtime<-seal3$pingtimestamp

mfilter<-vmask(lat, lon, dtime, 10)


write.csv(mfilter, "ArgoFilterSingaporepart0003.csv")



library(argosfilter)

seal1 <- read.csv("/Users/marianaduarte/Desktop/states_2022-06-27-01.csv")


lat<-seal1$lat
lon<-seal1$lon
dtime<-seal1$time
origin <- 1590364810
row_id <- 1:nrow(seal1)

mfilter<-vmask(lat, lon, dtime, 10)


write.csv(mfilter, "ArgoFilterOpenstates_2022-06-27-01.csv")



library(argosfilter)

seal1 <- read.csv("/Users/marianaduarte/Desktop/aisdk-2022-11-18.csv")


lat<-seal1$Latitude
lon<-seal1$Latitude
dtime<-seal1$Timestamp
origin <- 1590364810
row_id <- 1:nrow(seal1)

mfilter<-vmask(lat, lon, dtime, 10)


write.csv(mfilter, "ArgoFilterAISaisdk-2022-11-18-NEW.csv")

library(argosfilter)

seal3 <- read.csv("/Users/marianaduarte/Desktop/30Trajs.csv")


lat<-seal3$Latitude
lon<-seal3$Longitude
dtime<-seal3$timestamp

mfilter<-vmask(lat, lon, dtime, 10)

rm(list=ls()) 