### Use the ESP8266 to read sensor data and send it out as a UDP package

The current code uses the DHT module, included in the NodeMCU firmware, to query a RHT03 Temperature and Humidity sensor.

#### Pre-requisits
 * ESP8266 flashed with NodeMCU
 * luatool to upload scripts to the ESP8266

#### HW Connection
 * RHT03 pins:  3.3v, ESP8266-GPIO02, NC, GND
 * 1kOhm pull-upp between 3.3v and ESP8266-GPIO02

#### Install
 * ./generate-settings.sh
 * ./deploy.sh

#### Connect / Debug
 * ./connect.sh
 * To prevent the main script from running, type `tmr.stop(0)` withing 5 seconds

#### Todo
 * Send sensor data after wake-up/reset. Use deep sleep (dsleep) to save power. 
