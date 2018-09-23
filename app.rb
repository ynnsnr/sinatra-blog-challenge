require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database'

get '/' do
  @articles = DB
  @comments = COMMENTS
  erb :home
end

get '/articles/:id' do
  @articles = DB
  @comments = COMMENTS
  @article = DB[params.fetch('id').to_i - 1]
  erb :article
end
