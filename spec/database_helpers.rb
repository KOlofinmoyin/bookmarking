require 'pg'

  def persisted_data(id:)
    connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
    connection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
  end
