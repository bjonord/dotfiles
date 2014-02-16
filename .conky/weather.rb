#! /usr/bin/env ruby
require 'net/http'
require 'json'

begin
  response = Net::HTTP.get("ip-weather.herokuapp.com", "/")

  if response
    json = JSON.parse(response)
    puts "weather:     #{json["weather"]}",
         "temperature: #{json["temperature"]}",
         "humidity:    #{json["humidity"]}"
  else
    puts "no data available at this moment."
  end
rescue SocketError => e
  puts "not able to reach server, check connection"
end
