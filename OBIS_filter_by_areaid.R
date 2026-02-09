# script to query OBIS for one species in a named marine region
# Stace Beaulieu
# 2026-02-09

# # CRAN
# install.packages("robis")

library(robis) # used to query OBIS API
#library(ggplot2) # robis offers functions to plot map with leaflet or ggplot2

# access data for one species
# also filter by geography using areaid filter
# manually choose areaid by executing request URL at https://api.obis.org/#/Area/get_area__id_
# { id: "40003", name: "California Current", type: "lme" }
records <- occurrence(scientificname = "Pyrosoma atlanticum", areaid = 40003)

# manually confirm this is expected species in WoRMS
# replace the xxxx in the following URL with the unique aphiaID(s) 
# https://marinespecies.org/aphia.php?p=taxdetails&id=xxxx
unique(records$aphiaID)

# plot map to confirm records within expected area
map_leaflet(records)
# map_ggplot(records) # requires package "maps"

# what datasets yielded records?
# note: if the following results in any NA, then this field was not populated for all records
# manually inspect these datasets by searching for Dataset at the following URL
# https://obis.org/search?entity=dataset
unique(records$datasetName)

# this field should be populated for all records
# to link directly to dataset(s)
# replace the xxxx in the following URL with the unique dataset_idID(s)
# https://obis.org/dataset/xxxx
unique(records$dataset_id)
