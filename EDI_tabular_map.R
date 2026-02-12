# script to directly access tabular dataset from EDI
# and plot on map
# Stace Beaulieu
# 2026-02-12

# import libraries
library(dplyr) # used to transform column headers
library(leaflet) # package to create Leaflet maps from R

# manual inspection of dataset landing page indicates this will be .csv file
inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-cce/104/13/01cc01e9b988aea447b1dd417eca7938" 
# first try base R
df_from_edi <- read.csv(inUrl1)
# Lat/Lon numeric, Depth integer, multiple columns for C and N
# plotting C.N.Molar.Ratio would account for both C and N measured from same Bottle.Number

# consider variable names for Latitude and Longitude 
df_renamed <- rename(df_from_edi, lng = 'Longitude..º.', lat = 'Latitude..º.')

# Create map
leaflet(df_renamed) %>%
  addTiles() %>%
  addCircleMarkers(~lng, ~lat, color = "blue", radius = 5) %>%
  setView(lng = -123, lat = 37, zoom = 5) # Center over California Current


# next: snippet copied from EDI R code
# should yield same number rows and columns but specifies col.names
# note to modify the duplicate "N" and "C"

