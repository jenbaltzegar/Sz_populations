### To create a graph of Fst by distance

fst <- read.table("batch_1.fst_summary.tsv", header = TRUE, sep = "\t", row.names = c("SRL", "YAV", "HUX"), col.names = c("x", "SRL", "YAV", "HUX", "NVL"))
fst <- fst[,2:5]
fst

# vector of cities order: YAV, ZAG, NOP, ISD, YAI, SRL, POC, HUX, GOL, MTC, VLC, NVL
city = c("YAV", "ZAG", "NOP", "ISD", "YAI", "SRL", "POC", "HUX", "GOL", "MTC", "VLC", "NVL")
y_lat = c(17.236413, 16.838406, 16.061362, 15.981798, 16.228408
          , 16.076258, 15.710708, 15.072553, 15.433580, 16.936688
          , 16.182116, 16.486405)
x_lon = c(-96.430907, -96.724295, -97.169855, -97.302253, -97.267255
          , -97.610615, -96.483955, -92.540653, -92.650158, -93.307058
          , -93.271110, -92.574365)

gps.coords <- as.data.frame(cbind(city, y_lat, x_lon))

#### City-pair distances
city.pair <- c("SRL-YAV", "SRL-HUX", "SRL-NVL", "YAV-HUX", "YAV-NVL", "HUX-NVL")
distance.km <- c(335, 732, 726, 663, 657, 437)
distance.min <- c(510, 634, 692, 616, 669, 384)
city.pair.fst <- c(0.0861786, 0.0977684, 0.1072850, 0.0990473, 0.1073610, 0.0944839)
city.pair.distance <- as.data.frame(cbind(city.pair, distance.km, distance.min, city.pair.fst))
city.pair.distance

library(ggplot2)
# Basic scatter plot for Fst by distance in km
ggplot(city.pair.distance, aes(x=distance.km, y=city.pair.fst)) + 
  geom_point(size=4, color = "red") +
  geom_text(label=city.pair, nudge_y = 0.2, fontface = 2) +
  labs(x = "Distance (km)", y = "Fst"
       #, title = "Fst by Distance (km)"
       )
ggsave(filename = "FstByDistance.png", dpi = 600)

# Basic scatter plot for Fst by distance in minutes traveled
ggplot(city.pair.distance, aes(x=distance.min, y=city.pair.fst)) + 
  geom_point(size=3, color = "red") +
  geom_text(label=city.pair, nudge_y = 0.2) +
  labs(x = "Distance (min)", y = "Fst", title = "Fst by Time (min)")


# attach(city.pair.distance)
# plot(distance.km, city.pair.fst, main="Fst by Distance (km)", 
#      xlab="Distance (km) ", ylab="Fst")
# 
# attach(city.pair.distance)
# scatterplot(distance.km ~ city.pair.fst, 
#             xlab="Weight of Car", ylab="Miles Per Gallon", 
#             main="Enhanced Scatter Plot", 
#             labels=city.pair)
