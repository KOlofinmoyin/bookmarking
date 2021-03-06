require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class Bookmarking_Manager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'http://www.google.com'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarking.bring_bookmarks
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb:'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmarking.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarking.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarking.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmarking.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
