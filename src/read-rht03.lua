PIN = 4

dht = require("dht")

status,temp,humi,temp_decimial,humi_decimial = dht.read(PIN)

if( status == dht.OK ) then
  temperature = temp
  humidity = humi
  print("Temperature: "..temperature.." deg C")
  print("Humidity: "..humidity.."%")
elseif( status == dht.ERROR_CHECKSUM ) then          
  print( "DHT Checksum error" )
  temperature=-1
elseif( status == dht.ERROR_TIMEOUT ) then
  print( "DHT Time out" )
  temperature=-2
end

dht = nil
package.loaded["dht"]=nil
