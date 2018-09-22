require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database'

# get '/' do
#   redirect '/articles'
# end

get '/' do
  @database = DB
  @comments = COMMENTS
  erb :home
end

get '/:id' do
  @article = DB[params.fetch('id').to_i - 1]
  @comments = COMMENTS
  erb :article
end
