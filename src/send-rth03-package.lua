-- Reads and sends data from a RHT03 temperature and humidity sensor.
-- The data is sent as an UDP package to a server, over wifi.

-- Nodemcu ESP8266 number of the pin connected to the sensor.
local sensor_pin = 4

-- Access point config. Change to suitable values.
local wifi_ssid     = "WIFI_SSID"
local wifi_password = "WIFI_PASSWORD"

-- Server config. Change to suitable values.
local server_port    = 8000
local server_address = "SERVER_ADDRESS"

-- Connect to the access point.
wifi.sta.config(wifi_ssid, wifi_password)
wifi.sta.connect()

-- Wait 5 seconds to make sure the unit has connected.
tmr.delay(5000000)
print(wifi.sta.status())
print(wifi.sta.getip())

-- Setup a socket to the server.
socket=net.createConnection(net.UDP, 0)
socket:on("receive", function(s, c) print (c) end )
socket:connect(server_port, server_address)

-- Load the module for the rht03 temperature and humidity sensor.
local dht_sensor = require("dht")

-- Read the sensor and get rid of unneeded return values.
local function read_sensor()
    local status, temperature, humidity, temperature_decimial, humidity_decimial = dht_sensor.read(sensor_pin);

    return status, temperature, humidity
end

-- Convert the valiues from the sensor module, into a string to be passed to the server.
local function sensor_to_string(status, temperature, humidity)
    if (status == dht.OK) then
        return "OK "..temperature.." "..humidity

    elseif (status == dht.ERROR_CHECKSUM) then
        return "ERROR checksum"

    elseif (status == dht.ERROR_TIMEOUT) then
        return "ERROR timeout"

    else
        return "ERROR unknown"

    end
end

local function read_and_send_sensor()
    local sensor_string = sensor_to_string(read_sensor())
    print("Response from sensor: "..sensor_string)
    socket:send(sensor_string)
end

-- Read the sensor every second, and send it away to the server.
tmr.alarm(1, 1000, 1, read_and_send_sensor)
