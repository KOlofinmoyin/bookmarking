require 'pg'

RSpec.feature "viewing features" do
  scenario "A user can see bookmarks" do
    connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

    # Create the test-date:
    Bookmarking.create(url: 'http://www.google.com', title: 'Google Inc.')
    Bookmarking.create(url: 'http://www.bbc.com', title: 'British Broadcasting Corporation')
    Bookmarking.create(url: 'http://www.alltheweb.com', title: 'All the web')

    visit('/bookmarks')

    expect(page).to have_link("Google Inc.", href: "http://www.google.com")
    expect(page).to have_link("All the web", href: "http://www.alltheweb.com")
    expect(page).to have_link("British Broadcasting Corporation", href: "http://www.bbc.com")
  end
end
