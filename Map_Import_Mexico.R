# This script creates a map of sites sampled in Mexico

# Set the working directory
setwd("/Users/jenbaltz/Dropbox/GouldLab/Project_Weevil/R_scripts/Sz_populations")

# Load a library
library(ggmap)


# Import .csv file
MX.latlong <- read.csv("MX_LatLongAlt.csv", header = TRUE)
# Remove rows with NA
MX.latlong <- MX.latlong[complete.cases(MX.latlong), ]
# MX.latlong

# Get the center of the map
# mexico_center = as.numeric(geocode("Mexico"))
mexico_center = c(-95.0, 16.4)
oaxaca_center = c(-97.0, 16.5)
chiapas_center = c(-93.1, 16.0)

# Set map type: for google map, options are maptype = c("terrain", "satellite", "roadmap", "hybrid")
myMapType <-c("terrain")

#######################################################
### For Sampled Cities
#########################################################
# Create array of coordinates by hand
# Vector of cities order: YAV, ZAG, NOP, ISD, YAI, SRL, POC, HUX, GOL, MTC, VLC, NVL
y_lat = c(17.236413, 16.838406, 16.061362, 15.981798, 16.228408
          , 16.076258, 15.710708, 15.072553, 15.433580, 16.936688
          , 16.182116, 16.486405)
x_lon = c(-96.430907, -96.724295, -97.169855, -97.302253, -97.267255
          , -97.610615, -96.483955, -92.540653, -92.650158, -93.307058
          , -93.271110, -92.574365)

# Get the map from google map
gg_MexicoMap <-get_googlemap(center=mexico_center, scale=2, zoom=7, maptype = myMapType)

# Save the map object
mexicomap = ggmap(gg_MexicoMap, extent="normal")

# Add a point on the map
mexicomap +
  geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat)
                     , color = c("red", "blue", "blue", "blue", "blue", "red", "blue", "red", "blue", "blue", "blue", "red")
                     , size = 4) +
  annotate("text", x= -96.430907, y=17.40, label = "Yavesia", size = 5, fontface = 2, color = "red") +
  annotate("text", x= -97.610615, y=16.24, label = "Santa Rosa de Lima", size = 5, fontface = 2, color = "red") +
  annotate("text", x= -92.540653, y=15.24, label = "Huixtla", size = 5, fontface = 2, color = "red") +
  annotate("text", x= -92.574365, y=16.65, label = "Nuevo Leon", size = 5, fontface = 2, color = "red")

# Save the image of the map
ggsave("mapMexico_SampledCities.png",dpi=600)

#######################################################
### Zoomed out view of sampled cities
#########################################################
# Create array of coordinates
# Vector of cities order: YAV, ZAG, NOP, ISD, YAI, SRL, POC, HUX, GOL, MTC, VLC, NVL
y_lat = c(17.236413, 16.838406, 16.061362, 15.981798, 16.228408
          , 16.076258, 15.710708, 15.072553, 15.433580, 16.936688
          , 16.182116, 16.486405)
x_lon = c(-96.430907, -96.724295, -97.169855, -97.302253, -97.267255
          , -97.610615, -96.483955, -92.540653, -92.650158, -93.307058
          , -93.271110, -92.574365)

# Get the map from google map
gg_MexicoMapOut <-get_googlemap(center=mexico_center, scale=2, zoom=5, maptype = myMapType)

# Save the map object
mexicomapout = ggmap(gg_MexicoMapOut, extent="normal")

# Add a point on the map
mexicomapout +
  geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat)
             , color = c("red", "blue", "blue", "blue", "blue", "red", "blue", "red", "blue", "blue", "blue", "red")
             , size = 2) 

# Save the image of the map
ggsave("mapMexico_ZoomOut.png", dpi=600)


#########################################################
### Zoomed in view for Oaxaca
#########################################################
# Create array of coordinates from MX.latlong
MX <- MX.latlong[which(MX.latlong$State=="Oaxaca"),]
y_lat = MX$Mean.Latitude
x_lon = MX$Mean.Longitude

# Get the map from google map
gg_MexicoMapOAX <- get_googlemap(center=oaxaca_center, scale=2, zoom=9, maptype = myMapType)

# Save the map object
mexicomapout = ggmap(gg_MexicoMapOAX, extent="normal")

# Add a point on the map
mexicomapout +
  geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat), size = 2) 

# Save the image of the map
ggsave("mapMexico_Oaxaca.png", dpi=600)


#########################################################
### Zoomed in view for Chiapas
#########################################################
# Create array of coordinates from MX.latlong
MX <- MX.latlong[which(MX.latlong$State=="Chiapas"),]
y_lat = MX$Mean.Latitude
x_lon = MX$Mean.Longitude

# Get the map from google map
gg_MexicoMapCHI <-get_googlemap(center=chiapas_center, scale=2, zoom=8, maptype = myMapType)

# Save the map object
mexicomapout = ggmap(gg_MexicoMapCHI, extent="normal")

# Add a point on the map
mexicomapout +
  geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat), size = 2) 

# Save the image of the map
ggsave("mapMexico_Chiapas.png", dpi=600)


#########################################################
### Zoomed in view for individual cities
#########################################################
# Source makeMap function
source("function_makeMap.R")

# Implement function and save map
makeMap(chooseCity = "YAV", mapZoom = 14, pointSize = 2, pointColor = "red")
ggsave("mapMexico_YAV.png", dpi=600)

makeMap(chooseCity = "ZAG", mapZoom = 15, pointSize = 2, pointColor = "red")
ggsave("mapMexico_ZAG.png", dpi=600)

makeMap(chooseCity = "NOP", mapZoom = 12, pointSize = 2, pointColor = "red")
ggsave("mapMexico_NOP.png", dpi=600)

makeMap(chooseCity = "ISD", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_ISD.png", dpi=600)

makeMap(chooseCity = "YAI", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_YAI.png", dpi=600)

makeMap(chooseCity = "SRL", mapZoom = 11, pointSize = 2, pointColor = "red")
ggsave("mapMexico_SRL.png", dpi=600)

makeMap(chooseCity = "POC", mapZoom = 13, pointSize = 2, pointColor = "red")
ggsave("mapMexico_POC.png", dpi=600)

makeMap(chooseCity = "HUX", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_HUX.png", dpi=600)

makeMap(chooseCity = "GOL", mapZoom = 14, pointSize = 2, pointColor = "red")
ggsave("mapMexico_GOL.png", dpi=600)

makeMap(chooseCity = "MTC", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_MTC.png", dpi=600)

makeMap(chooseCity = "VLC", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_VLC.png", dpi=600)

makeMap(chooseCity = "NVL", mapZoom = 16, pointSize = 2, pointColor = "red")
ggsave("mapMexico_NVL.png", dpi=600)

