RSpec.feature "viewing features" do
  scenario "A user can see bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.bbc.com")
    expect(page).to have_content("http://www.alltheweb.com")
  end
end
