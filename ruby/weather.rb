#! /usr/bin/env ruby
require 'net/http'
require 'json'

response = Net::HTTP.get("ip-weather.herokuapp.com", "/")
json = JSON.parse(response)
p "Weather: #{json["weather"]}, Temperature: #{json["temperature"]} Humidity: #{json["humidity"]}"
