### Use the ESP8266 to read sensor data and send it out as a UDP package

The current code uses the DHT module, included in the NodeMCU firmware, to query a RHT03 Temperature and Humidity sensor.

#### Pre-requisits
 * ESP8266 flashed with NodeMCU

#### Upload lua script to ESP8266
 * disconnect any connected terminal programs
 * ```~/git/luatool/luatool/luatool.py --port /dev/tty.usbserial-A6XZ1VI2 --src ~/git/esp-sense/src/read-rht03.lua --dest read-rht03.lua --verbose```

#### HW Connection
 * RHT03 pins:  3.3v, ESP8266-GPIO02, NC, GND
 * 1kOhm pull-upp between 3.3v and ESP8266-GPIO02

#### Run
 * Connect to the ESP8266: ```minicom -D /dev/tty.usbserial-A6XZ1VI2 -b 9600```
 * ```dofile("send-rht03-package.lua") -- Will load the DHT module and send the sensor data as UDP package, over wifi```

#### Todo
 * Move the access point and server settings out of the code.
 * Send sensor data after wake-up/reset. Use deep sleep (dsleep) to save power. 
 * Auto load the script.
