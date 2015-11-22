#!/bin/bash

# Connects to the ESP8266

SERIAL_PORT=/dev/tty.usbserial-A6XZ1VI2

# NodeMCU uses 9600
minicom -D $SERIAL_PORT -b 9600
