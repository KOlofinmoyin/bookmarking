require 'pg'

class Bookmarking

    class << self
      def bring_bookmarks

      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
      else
        connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
      end

      result = connection.exec("SELECT * from bookmarkings")
      result.map { |bookmark| bookmark['url']  }
      end
    end
end
