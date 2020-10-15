require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: 'sqlite3', database: 'Cook_Blog_db.db'}

class Post < ActiveRecord::Base
end

get '/' do
  @result = Post.order('created_at DESC')
  erb :index
end

post '/' do
  erb :index
end

get '/create_post' do
  erb :create_post
end

post '/create_post' do

  p = Post.new params[:post]
  @image = params[:path_to_image]
  p.path_to_image = "/images/" + @image
  p.save

  erb :create_post
end

get '/users' do
  erb :users
end

post '/users' do
  erb :users
end
