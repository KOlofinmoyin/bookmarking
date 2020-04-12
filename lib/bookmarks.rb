require 'pg'

class Bookmarking

    class << self
      def bring_bookmarks
      # @bookmarks = [
      #   "www.bbc.com",
      #   "www.alltheweb.com",
      #   "www.google.com"
      # ]
      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
      else
        connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
      end

      result = connection.exec("SELECT * from bookmarkings")
      result.map { |bookmark| bookmark['url']  }
      end

      # def create_bookmarks
      #   connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
      #   result = connection.exec("INSERT INTO bookmarkings (url) VALUES ('')")
      #   result.map { |bookmark| bookmark['url']  }
      #   end
      # end
    end
end
