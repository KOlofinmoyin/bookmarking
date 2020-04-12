require 'pg'

def setup_test_database
  p "Setting up test database"

  connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

  #Clear the database.
  connection.exec("TRUNCATE bookmarkings;")
end
