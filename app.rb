require 'sinatra/base'

class Bookmarking < Sinatra::Base
  get '/' do
    'www.bbc.com'
  end

  get '/bookmarks' do
    @bookmarks = [
      "www.bbc.com",
      "www.alltheweb.com",
      "www.google.com"
    ]
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
