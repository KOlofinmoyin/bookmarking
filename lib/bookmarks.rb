require 'pg'

class Bookmarking

    class << self
      def bring_bookmarks
      # @bookmarks = [
      #   "www.bbc.com",
      #   "www.alltheweb.com",
      #   "www.google.com"
      # ]
      connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
      result = connection.exec("SELECT * from bookmarkings")
      result.map { |bookmark| bookmark['url']  }
      end
    end
end
