#!/bin/bash

BDGD_SRC_BASE="./src/bdgd/latest/"
BDGD_CONV_BASE="./src/bdgd/converted/"

declare -A bdgd_tables

bdgd_tables=(
    ["BAR"]="buses"
    # ["BASE"]=""
    # ["BAY"]=""
    # ["BE"]=""
    # ["CTAT"]="high_voltage_circuit"
    ["CTMT"]="medium_voltage_circuits"
    # ["EP"]=""
    # ["EQCR"]=""
    # ["EQME"]=""
    # ["EQRE"]=""
    # ["EQSE"]=""
    # ["EQSIAT"]=""
    # ["EQTRD"]=""
    # ["EQTRM"]=""
    # ["EQTRS"]=""
    # ["EQTRSX"]=""
    # ["INDGER"]=""
    # ["PIP"]=""
    # ["PNT"]=""
    # ["PT"]=""
    # ["RAMLIG"]=""
    # ["SEGCON"]=""
    # ["ARAT"]=""
    ["CONJ"]="groups"
    ["PONNOT"]="notable_points"
    # ["SSDAT"]="high_voltage_segments"
    ["SSDBT"]="low_voltage_segments"
    ["SSDMT"]="medium_voltage_segments"
    ["SUB"]="substations"
    # ["UNCRAT"]=""
    # ["UNCRBT"]=""
    # ["UNCRMT"]=""
    # ["UNREAT"]=""
    # ["UNREMT"]=""
    # ["UNSEAT"]=""
    # ["UNSEBT"]=""
    # ["UNSEMT"]=""
    # ["UNTRD"]=""
    ["UNTRS"]="substation_transformer_unit"
    # ["UCAT_tab"]="high_voltage_consumption_units"
    ["UCBT_tab"]="low_voltage_consumption_units"
    # ["UCMT_tab"]="medium_voltage_consumption_units"
    # ["UGAT_tab"]=""
    # ["UGBT_tab"]=""
    # ["UGMT_tab"]=""
)

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

        table=${bdgd_tables[$layer]}

        if [ ! -z "$table" ]; then
            echo "Converting layer: $layer"
            echo "Target table: $table"

            ogr2ogr -f "PostgreSQL"\
                    PG:"host=$POSTGRES_HOST\
                    user=$POSTGRES_USER\
                    dbname=energio_development\
                    password=$POSTGRES_PASSWORD"\
                    "$entry" "$layer"\
                    -nln "$table" -skipfailures

            echo "$layer converted!"
        else
            echo "Tabela não encontrada!"
        fi
    done
done