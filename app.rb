require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: 'sqlite3', database: 'Cook_Blog_db.db'}

class Post < ActiveRecord::Base
  validates :autor, presence: true
  validates :recipe_name, presence: true
  validates :content, presence: true
  validates :path_to_image, presence: true
end

class User < ActiveRecord::Base
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
  if p.save
    erb "Product successfully created."
  else
    @error = p.errors.full_messages.first
    erb :create_post
  end


end

get '/users' do
  erb :users
end

post '/users' do
  @log = params[:login]
  @pass = params[:pass]
  u = User.all

  u.each do |d|
    erb "#{d.pass.inspect} == #{@pass} && #{d.login.inspect} == #{@log}"
    # if @pass == d.pass && @log == d.login
    #   erb :create_post
    # else
    #   erb "#{d.pass.inspect} == #{@pass} && #{d.login.inspect} == #{@log}"
    # end
  end

end
