require 'bundler'
Bundler.require()


#Connection
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chirp_chirp'
)

#Models
require './models/user'
require './models/chirp'
#
#ROutes
get '/' do
  erb :index
end


#API Routes
get '/api/users'  do
  content_type :json
  users = User.all.to_json
end


get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end

put '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

delete '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i).destroy
  {message: "one less chirp"}.to_json
end

####################

get '/api/users/:user_id/chirps/:id' do
  content_type :json
  #puts "**********************"
  #puts params
  #puts "***********************"
  user = User.find(params[:user_id])
  puts "***********************"
  puts user
  puts "***********************"
  chirp = Chirp.find(params[:id])
  puts "***********************"
  puts chirp
  puts "***********************"
  return user.j_son
end

post '/api/users/:user_id/chirps' do
    content_type :json
    puts "_____________________________"
    id = params[:user_id]
    user = User.find(id)
    chirp = Chirp.create(params[:chirp])  #what, #name
    user.chirps << chirp
    chirp.to_json
end

put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  chirp = Chirp.find(params[:id])
  user.chirps.update(params[:user])
  user.chirps.to_json
end
