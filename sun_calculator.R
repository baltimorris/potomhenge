library(suncalc)
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

sun_df_day <- subset(sun_df, elevation_deg > 0)

# Export CSV
write.csv(sun_df_day,
          "C:\\Users\\E062583\\Documents\\sun_position_hourly_2026.csv",
          row.names = FALSE)

head(sun_df)

