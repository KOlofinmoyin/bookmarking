require 'sinatra/base'

class Bookmarking < Sinatra::Base
  get '/' do
    'www.bbc.com'
  end
  
  run! if app_file == $0
end
