Read the RHT03 Temperature and Humidity sensor with the esp8266

Uses the DHT module included in the NodeMCU firmware.

Pre-requisits:
 * esp8266 flashed with NodeMCU

Upload lua script to esp8266:
 * disconnect any connected terminal programs
 * ```~/git/luatool/luatool/luatool.py --port /dev/tty.usbserial-A6XZ1VI2 --src ~/git/esp-sense/src/read-rht03.lua --dest read-rht03.lua --verbose```

HW Connection:
 * RHT03 pins:  3.3v, esp8266-GPIO02, NC, GND
 * 1kOhm pull-upp between 3.3v and esp8266-GPIO02

Run:
 * Connect to the esp8266: minicom -D /dev/tty.usbserial-A6XZ1VI2 -b 9600
 * dofile("read-rht03.lua") -- Will load the DHT module and poll the sensor once 

Todo:
 * Read the sensor avery Xth time unit
 * Send the sensor data over wifi
 