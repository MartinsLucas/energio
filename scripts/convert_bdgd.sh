#!/bin/bash

BDGD_SRC_BASE="./src/bdgd/latest/"
BDGD_CONV_BASE="./src/bdgd/converted/"

for entry in "$BDGD_SRC_BASE"*.gdb; do
    bdgd_name="${entry%.gdb}"
    bdgd_name="${bdgd_name#*latest/}"
    bdgd_dir="$BDGD_CONV_BASE$bdgd_name"

    if [ -d $bdgd_dir ]; then
        echo "exists"
    else
        echo "doesn't exists"
        echo "creating"
        mkdir $bdgd_dir
    fi

    echo $entry
    ogrinfo -q $entry | while read line; do
        layer=${line#*:\ }
        layer=${layer%\ (*}

        echo "creating $bdgd_dir/$layer"
        ogr2ogr "$bdgd_dir/$layer" -f GeoJSON -t_srs EPSG:4674 $entry $layer
    done
done