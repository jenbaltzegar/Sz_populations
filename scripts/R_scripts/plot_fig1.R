# Make simple line maps with collection points plotted

# load libs
library(ggplot2)
library(mapdata)
library(ggsn)
library(patchwork)
library(ggrepel)

# load collection data -----
dat <- read.csv("./data/MX_sampledCities.csv", header = TRUE)

# load map data -----
mexico <- map_data("worldHires", "Mexico")
usa <- map_data("usa")
guatemala <- map_data("worldHires", "Guatemala")
belize <- map_data("worldHires", "Belize")
honduras <- map_data("worldHires", "Honduras")
elsalvador <- map_data("worldHires", "El Salvador")

# plot maps -----
fig1a <- ggplot() +
  geom_polygon(data = mexico, aes(long, lat, group=group)
               , fill = "#90a830", color = "#195539", size = 0.05, alpha = 0.7) +
  geom_polygon(data = usa, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_polygon(data = guatemala, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_polygon(data = belize, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_polygon(data = honduras, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_polygon(data = elsalvador, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_point(data=dat[dat$Lane=="2",], aes(x=Longitude, y=Latitude, group = Label),
             fill="blue", color = "dark blue", shape=21, size=1.5, inherit.aes = FALSE) +
  geom_point(data=dat[dat$Lane=="1",], aes(x=Longitude, y=Latitude, group=Label),
             fill="red", color = "dark red", shape=21, size=1.5, inherit.aes = FALSE) +
  geom_text(aes(x = -102.5528, y = 23.6345, label = "Mexico", size = 3, fontface = "bold")) +
  coord_sf(xlim = c(-117.5, -87.5),  ylim = c(14, 32)) +
  ggsn::scalebar(location = "bottomleft", dist = 500, dist_unit = "km"
                 , x.min = -117.5, x.max = -87.5, y.min = 14, y.max = 32
                 , transform = TRUE, model = "WGS84"
                 , st.size = 3, border.size = 0.5) +
  ggsn::north(x.min = -117.5, x.max = -87.5, y.min = 14, y.max = 32
              , anchor = c(x = -115.5, y = 16.6)) +
  labs(x = "Longitude", y = "Latitude", tag = "A.") +
  theme(plot.tag = element_text(),
        panel.background = element_rect(fill = "#89cff0", size = 0.5, linetype = "blank"),
        panel.grid.major = element_line(linetype = "blank"),
        panel.grid.minor = element_line(linetype = "blank"),
        panel.border = element_rect(colour = "black", fill=NA, size=0.5),
        legend.position="none")

fig1b <- ggplot() +
  geom_polygon(data = mxstate.map, aes(long, lat, group=group)
               , fill = "#90a830", color = "#195539", size = 0.05, alpha = 0.7) +
  geom_polygon(data = guatemala, aes(x=long, y = lat, group = group)
               , fill = "#ccc7ad", color="#816e10", size = 0.05) +
  geom_text(aes(x = -96, y = 16.6, label = "Oaxaca", size = 5, fontface = "bold")) +
  geom_text(aes(x = -93.3, y = 16.6, label = "Chiapas", size = 5, fontface = "bold")) +
  geom_point(data=dat[dat$Lane=="2",], aes(x=Longitude, y=Latitude, group = Label),
             fill="blue", color = "dark blue", shape=21, size=3.0, inherit.aes = FALSE) +
  geom_point(data=dat[dat$Lane=="1",], aes(x=Longitude, y=Latitude, group=Label),
             fill="red", color = "dark red", shape=21, size=3.0, inherit.aes = FALSE) +
  ggrepel::geom_text_repel(data = dat, aes(x=Longitude, y=Latitude, label = Label)
           , size = 3, color = "black", fontface = "bold") +
  coord_sf(xlim = c(-97.5, -92.5),  ylim = c(14.75, 17.75)) +
  ggsn::scalebar(location = "bottomleft", dist = 100, dist_unit = "km"
                 , x.min = -97.5, x.max = -92.5, y.min = 14.75, y.max = 17.75
                 , transform = TRUE, model = "WGS84"
                 , st.size = 3, border.size = 0.5) +
  ggsn::north(x.min = -97.5, x.max = -92.5, y.min = 14.75, y.max = 17.75
              , anchor = c(x = -97.15, y = 15.2)) +
  labs(x = "Longitude", y = "", tag = "B.") +
  theme(plot.tag = element_text(),
        panel.background = element_rect(fill = "#89cff0", size = 0.5, linetype = "blank"),
        panel.grid.major = element_line(linetype = "blank"),
        panel.grid.minor = element_line(linetype = "blank"),
        panel.border = element_rect(colour = "black", fill=NA, size=0.5),
        legend.position="none")

# use patchwork() to tile plots
fig1 <- fig1a + fig1b

# save plot
ggsave(fig1, filename = "./output/fig1.png", dpi = 320)


