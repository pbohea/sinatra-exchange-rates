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
end

get("/:from_currency/:to_currency") do
  @original_currency = params.fetch("from_currency")
  @destination_currency = params.fetch("to_currency")

  api_url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("key")}&from=#{@original_currency}&to=#{@destination_currency}&amount=1"
  
  # Some more code to parse the URL and render a view template.
end
