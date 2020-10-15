require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'Cook_Blog.db'}

class Cook_Blog < ActiveRecord::Base
end

get '/' do
  @result = Cook_Blog.order('created_at DESC')
  erb :index
end

post '/' do
  erb :index
end

get '/add_post' do
  erb :add_post
end

post '/add_post' do
  p = Cook_Blog.new params[:post]
  p.save

  erb :add_post
end
