require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    'www.bbc.com'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarking.bring_bookmarks
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
