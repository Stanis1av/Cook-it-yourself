require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'Cook_Blog.db'}

class Cook_Blog < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/' do
  erb :index
end


