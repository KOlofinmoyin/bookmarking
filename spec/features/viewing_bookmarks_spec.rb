RSpec.feature "viewing features" do
  scenario "A user can see bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("www.bbc.com")
    expect(page).to have_content("www.alltheweb.com")
    expect(page).to have_content("www.google.com")
  end
end
