require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "http"
require "json"


api = ENV.fetch("key")


 api_url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("key")}&from=USD&to=EUR&amount=1"

 response = HTTP.get(api_url).to_s
  response = JSON.parse(response)
puts response

info = response.fetch("info")
quote = info.fetch("quote")

puts quote
