#!/bin/bash

wget "https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_AFG_shp.zip"
unzip -d data/afghanistan/ gadm36_AFG_shp.zip

wget "https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_PAK_shp.zip"
unzip -d data/pakistan/ gadm36_PAK_shp.zip

wget "https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SOM_shp.zip"
unzip -d data/somalia/ gadm36_SOM_shp.zip

wget "https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_YEM_shp.zip"
unzip -d data/yemen/ gadm36_YEM_shp.zip
