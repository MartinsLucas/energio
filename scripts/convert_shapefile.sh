#!/bin/bash

SHAPEFILE_SRC_BASE="./src/shapefiles/latest/"
SHAPEFILE_CONV_BASE="./src/shapefiles/extracted/"

for entry in "$SHAPEFILE_SRC_BASE"*; do
    shapfile_name="${entry#*latest/}"
    shapfile_dir="$SHAPEFILE_CONV_BASE$shapfile_name"

    echo $shapfile_dir

    if [ -d $shapfile_dir ]; then
        echo "exists"
    else
        echo "doesn't exists"
        echo "creating"
        mkdir $shapfile_dir
    fi

    echo "$entry"
    echo "creating $shapfile_dir/$layer"
    ogr2ogr -f GeoJSON -t_srs EPSG:4674 "$shapfile_dir/$shapfile_name.geojson" "$entry/$shapfile_name.shp"
done