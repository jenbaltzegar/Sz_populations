# This code is a function to make maps for sample sites in individual cities

# Load a library
library(ggmap)

# Set the working directory
setwd("/Users/jenbaltz/Dropbox/GouldLab/Project_Weevil/R_scripts/Sz_populations")

# Create function to quickly map individual cities
makeMap <- function(chooseCity, mapZoom = 14, pointSize = 2, pointColor = "red"){
  # Create dataframe of samples from a chosen city
  MX <- MX.latlong[which(MX.latlong$City==chooseCity),]
  
  # Create vector of latitudes and longitudes for that city
  x_lon = MX$Mean.Longitude
  y_lat = MX$Mean.Latitude
  
  # Average lats and lons to find the center of the area
  center_lon = mean(x_lon)
  center_lat = mean(y_lat)
  
  # # Set map type: for google map, options are maptype = c("terrain", "satellite", "roadmap", "hybrid")
  myMapType <- c("terrain")
  
  # Get the map from google map
  gg_MexicoMap <-get_googlemap(center=c(center_lon, center_lat), scale=2, zoom=mapZoom, maptype = myMapType)
  
  # Save the map object
  mexicomapout = ggmap(gg_MexicoMap, extent="normal")
  
  # Add a point on the map
  mexicomapout +
    geom_point(aes(x=lon,y=lat),data=data.frame(lon=x_lon,lat=y_lat), size = pointSize, color = pointColor)
}


# #########################################################
# ### Test of function
# #########################################################
# makeMap("NOP", "roadmap", 12)
# makeMap("YAV", 14, 4, "blue")

