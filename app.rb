require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

class Bookmarking_Manager < Sinatra::Base
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
    url = params[:url]
    connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
    connection.exec("INSERT INTO bookmarkings (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
