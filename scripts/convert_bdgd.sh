#!/bin/bash

BDGD_SRC_BASE="./src/bdgd/latest/"
BDGD_CONV_BASE="./src/bdgd/converted/"

echo "Reading .gdb bases..."
for entry in "$BDGD_SRC_BASE"*.gdb; do
    bdgd_name="${entry#*latest/}"

    echo "Found $bdgd_name..."

    bdgd_name="${bdgd_name%.gdb}"
    bdgd_dir="$BDGD_CONV_BASE$bdgd_name"

    echo "Checking if destination directory already exists."
    if [ -d $bdgd_dir ]; then
        echo "Directory exists."
    else
        echo "Directory doesn't exists."
        echo "Creating it."
        mkdir $bdgd_dir
    fi

    echo "Retrieving layers from $bdgd_name"
    ogrinfo -q $entry | while read line; do
        layer=${line#*:\ }
        layer=${layer%\ (*}

        echo "Converting layer: $layer"
        ogr2ogr "$bdgd_dir/$layer" -f GeoJSON -t_srs EPSG:4674 $entry $layer
        echo "$layer converted!"
    done
done