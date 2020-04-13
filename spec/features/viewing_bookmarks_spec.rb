require 'pg'

RSpec.feature "viewing features" do
  scenario "A user can see bookmarks" do
    connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

    # Create the test-date:
    Bookmarking.create(url: 'http://www.google.com')
    Bookmarking.create(url: 'http://www.bbc.com')
    Bookmarking.create(url: 'http://www.alltheweb.com')

    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.bbc.com")
    expect(page).to have_content("http://www.alltheweb.com")
  end
end
