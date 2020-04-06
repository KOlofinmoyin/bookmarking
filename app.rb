require 'sinatra/base'

class Bookmarking < Sinatra::Base
  get '/' do
    'www.bbc.com'
  end

  get '/bookmarks' do
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
