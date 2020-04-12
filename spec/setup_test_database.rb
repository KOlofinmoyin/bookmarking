require 'pg'
p "Setting up test database"

connection - PG.connect(dname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

#Clear the database.
connection.exec("TRUNCATE bookmarkings;")
