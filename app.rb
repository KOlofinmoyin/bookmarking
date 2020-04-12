require 'sinatra/base'
require './lib/bookmarks'

class Bookmarking_Manager < Sinatra::Base
  get '/' do
    'http://www.google.com'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmarking.bring_bookmarks
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
