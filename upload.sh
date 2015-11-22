#!/bin/bash

# Uploads a lua script to a NodeMCU enabled ESP8266
# Uses https://github.com/4refr0nt/luatool

if [[ ! $# -eq 1 ]]; then
    echo "Usage: $0 <lua script>"
    exit 1
fi

SERIAL_PORT=/dev/tty.usbserial-A6XZ1VI2

~/git/luatool/luatool/luatool.py --port $SERIAL_PORT --src $1 --dest $(basename $1) --verbose
