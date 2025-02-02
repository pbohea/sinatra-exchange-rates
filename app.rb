require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "http"
require "json"



get("/") do
  api = ENV.fetch("key")

  exchange_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("key")}"

  response = HTTP.get(exchange_url).to_s
  response = JSON.parse(response)
  currencies = response.fetch("currencies")
  @xxx = currencies.keys
 erb(:home)
end

get("/:from_currency") do
  @original_currency = params.fetch("from_currency")
  
  exchange_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("key")}"
  response = HTTP.get(exchange_url).to_s
  response = JSON.parse(response)
  currencies = response.fetch("currencies")
  @xxx = currencies.keys
  erb(:from)
end

get("/:from_currency/:to_currency") do
  @original_currency = params.fetch("from_currency")
  @destination_currency = params.fetch("to_currency")

  api_url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("key")}&from=#{@original_currency}&to=#{@destination_currency}&amount=1"

  response = HTTP.get(api_url).to_s
  response = JSON.parse(response)

 info = response.fetch("info")
 @quote = info.fetch("quote")
  
erb(:from_to)

end
