#!/bin/bash

SHAPEFILE_SRC_BASE="./src/shapefiles/latest/"
SHAPEFILE_CONV_BASE="./src/shapefiles/converted/"

echo "Reading shapefiles..."
for entry in "$SHAPEFILE_SRC_BASE"*; do
    shapfile_name="${entry#*latest/}"

    echo "Found $shapfile_name..."

    shapfile_dir="$SHAPEFILE_CONV_BASE$shapfile_name"

    echo "Checking if destination directory already exists."
    if [ -d $shapfile_dir ]; then
        echo "Directory exists."
    else
        echo "Directory doesn't exists."
        echo "Creating it."
        mkdir $shapfile_dir
    fi

    echo "Converting shapefile: $shapfile_name"
    ogr2ogr -f GeoJSON -t_srs EPSG:4674 "$shapfile_dir/$shapfile_name.geojson" "$entry/$shapfile_name.shp"
    echo "$shapfile_name converted!"
done