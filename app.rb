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

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  p = Post.new params[:post]
  p.save

  erb :new_post
end
