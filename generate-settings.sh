#!/bin/bash

echo "Creating Settings file. Please provide the following info:"

echo ""
echo WiFi SSID: 
read wifi_ssid

echo ""
echo WiFi Password:
read wifi_password

echo ""
echo UDP Server Address:
read server_address

echo ""
echo UDP Server Port:
read server_port

SETTINGS_FILE=settings.lua

echo "
-- WiFi settings
settings_wifi_ssid     = \"$wifi_ssid\"
settings_wifi_password = \"$wifi_password\"

-- Server settings
settings_server_address = \"$server_address\"
settings_server_port    = $server_port
" > $SETTINGS_FILE

echo $SETTINGS_FILE generated

