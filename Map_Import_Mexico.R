#load a library
library(ggmap)

#get the center of the map
#mexico_center = as.numeric(geocode("Mexico"))
mexico_center = c(-95.0221, 16.4407)

#################
### For Sampled Cities
#map type: for google map options are maptype = c("terrain", "satellite", "roadmap", "hybrid")
myMapType <-c("terrain")

#get the map from google map
gg_MexicoMap <-get_googlemap(center=mexico_center, scale=2, zoom=7, maptype = myMapType);

#save the map object
mexicomap = ggmap(gg_MexicoMap, extent="normal")

#display the map
mexicomap

#create array of coordinates
# vector of cities order: YAV, ZAG, NOP, ISD, YAI, SRL, POC, HUX, GOL, MTC, VLC, NVL
y_lat = c(17.236413, 16.838406, 16.061362, 15.981798, 16.228408
          , 16.076258, 15.710708, 15.072553, 15.433580, 16.936688
          , 16.182116, 16.486405)
x_lon = c(-96.430907, -96.724295, -97.169855, -97.302253, -97.267255
          , -97.610615, -96.483955, -92.540653, -92.650158, -93.307058
          , -93.271110, -92.574365)


#add a point on the map
#mexicomap+geom_point(aes(x=lon,y=lat),data=data.frame(lon=c(-73.255),lat=c(-3.7405)), color = "green")
mexicomap+geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat)
                     , color = c("red", "blue", "blue", "blue", "blue", "red", "blue", "red", "blue", "blue", "blue", "red")
                     , size = 4)

#save the image of the map
ggsave("mapSampledCities.png",dpi=600)

#################
### Zoomed out view
#map type: for google map options are maptype = c("terrain", "satellite", "roadmap", "hybrid")
myMapType <-c("terrain")

#get the map from google map
gg_MexicoMapOut <-get_googlemap(center=mexico_center, scale=2, zoom=5, maptype = myMapType);

#save the map object
mexicomapout = ggmap(gg_MexicoMapOut, extent="normal")

#display the map
mexicomapout

#create array of coordinates
# vector of cities order: YAV, ZAG, NOP, ISD, YAI, SRL, POC, HUX, GOL, MTC, VLC, NVL
y_lat = c(17.236413, 16.838406, 16.061362, 15.981798, 16.228408
          , 16.076258, 15.710708, 15.072553, 15.433580, 16.936688
          , 16.182116, 16.486405)
x_lon = c(-96.430907, -96.724295, -97.169855, -97.302253, -97.267255
          , -97.610615, -96.483955, -92.540653, -92.650158, -93.307058
          , -93.271110, -92.574365)


#add a point on the map
#mexicomap+geom_point(aes(x=lon,y=lat),data=data.frame(lon=c(-73.255),lat=c(-3.7405)), color = "green")
mexicomapout +
  geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat)
                     , color = c("red", "blue", "blue", "blue", "blue", "red", "blue", "red", "blue", "blue", "blue", "red")
                     , size = 2)

#save the image of the map
ggsave("mapMexicoZoomOut.png", dpi=600)

