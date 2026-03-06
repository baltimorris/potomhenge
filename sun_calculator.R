library(suncalc)
library(leaflet)
library(dplyr)
library(tidyverse)
library(sf)

#dc lat/lon, roughly Washington Cir NW
lat <- 38.9073
lon <- -77.0369

# Hourly timestamps for one year
times <- seq(
  as.POSIXct("2026-01-01 00:00:00", tz="America/New_York"),
  as.POSIXct("2026-12-31 23:00:00", tz="America/New_York"),
  by = "hour"
)

# Solar position
pos <- getSunlightPosition(date = times, lat = lat, lon = lon)

# Build output table
sun_df <- data.frame(
  datetime = times,
  azimuth_rad = pos$azimuth,
  altitude_rad = pos$altitude
)

sun_df$azimuth_deg <- (sun_df$azimuth_rad * 180/pi) + 180
sun_df$elevation_deg <- sun_df$altitude_rad * 180/pi

#drop nighttime
sun_df_day <- sun_df %>%
  filter(elevation_deg > 0)

dist <- 5
heading <- 0.96600459
lat2 <- ((dist/111.2) * cos(heading))+lat
lon2 <- ((dist/111.2) * (sin(heading)/cos(lat)))+lon

map <- leaflet() %>%
  addTiles() %>%
  setView(lng = lon, lat = lat, zoom= 15) %>%
  addMarkers(lng = lon, lat = lat) %>%
  addPolylines(lng = c(lon, lon2), lat = c(lat, lat2)) %>%
  addCircleMarkers(lng = lon, lat = lat, radius = 50, stroke = TRUE, color = 'black', opacity = 1, fillColor = 'black', fillOpacity = 0.2) %>%
  print(map)

# Export CSV -- not necessary tbh mostly for arcpro use
# write.csv(sun_df_day,
#           "C:\\Users\\E062583\\Documents\\sun_position_hourly_2026.csv",
#           row.names = FALSE)
# 
# 
