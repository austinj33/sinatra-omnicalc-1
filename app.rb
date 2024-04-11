require "sinatra"
require "sinatra/reloader"

get("/") do
erb(:layout)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_results = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_results = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f/100
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f

  @payment = @principal * (@apr / 12) / (1 - (1 + @apr / 12)**-(@years * 12))
  
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params.fetch("minimum").to_f
  @max = params.fetch("maximum").to_f

  @results = rand(@min..@max).to_f

  erb(:random_results)
end
