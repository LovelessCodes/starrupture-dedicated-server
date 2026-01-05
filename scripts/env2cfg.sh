#!/bin/bash

APP_FILE="$savegame_files/my_server_properties.txt"

variables=(
    "SERVER_NAME" "server name"
    "SERVER_PORT" "steam game port"
)

for ((i=0; i<${#variables[@]}; i+=2)); do
    var_name=${variables[$i]}
    config_name=${variables[$i+1]}

    if [ ! -z "${!var_name}" ]; then
        echo "${config_name} set to: ${!var_name}"
        if grep -q "$config_name" "$APP_FILE"; then
            sed -i "s|^$config_name =.*|$config_name = ${!var_name}|" "$APP_FILE"
        else
            echo -ne "\n$config_name = ${!var_name}" >> "$APP_FILE"
        fi
    fi
done

