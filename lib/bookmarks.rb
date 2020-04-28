require 'pg'

class Bookmarking
  attr_reader :id, :title, :url

    def initialize(id:, title:, url:)
      @id = id
      @title = title
      @url = url
    end

    class << self
      def bring_bookmarks

      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
      else
        connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
      end

      bookmarks = connection.exec("SELECT * from bookmarkings")
      bookmarks.map { |bookmark|
        Bookmarking.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      }
      end

      def create(url:, title:)
        if ENV['RACK_ENV'] == 'test'
          connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
        else
          connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
        end
        result = connection.exec("INSERT INTO bookmarkings (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")

        Bookmarking.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
      end

      def delete(id:)
        if ENV['RACK_ENV'] == 'test'
          connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
        else
          connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
        end
        result = connection.exec("DELETE FROM bookmarkings WHERE id = #{id}")
      end

      def update(id:, title:, url:)
        if ENV['RACK_ENV'] == 'test'
          connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
        else
          connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
        end
        result = connection.exec("UPDATE bookmarkings SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
        Bookmarking.new(id: result[0]['id'], title: result[0]['title'],url: result[0]['url'])
      end

      def find(id:)
        if ENV['RACK_ENV'] == 'test'
          connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
        else
          connection = PG.connect(dbname: 'bookmarking_manager', user: 'postgres', password: 'pa55w0rd')
        end
        result = connection.exec("SELECT * FROM bookmarkings WHERE id = #{id}")
        Bookmarking.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
      end

    end
end
