require 'pg'

RSpec.feature "viewing features" do
  scenario "A user can see bookmarks" do
    connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

    connection.exec("INSERT INTO bookmarkings VALUES (1, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarkings VALUES (2, 'http://www.bbc.com');")
    connection.exec("INSERT INTO bookmarkings VALUES (3, 'http://www.alltheweb.com');")

    visit('/bookmarks')
    save_and_open_page
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.bbc.com")
    expect(page).to have_content("http://www.alltheweb.com")
  end
end
