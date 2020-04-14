RSpec.feature 'Adding a new bookmark' do
  scenario 'a user can add a new bookmark to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.ilaweekiti.com')
    fill_in('title', with: 'Site ule ra')
    click_button('Submit')
    expect(page).to have_link('Site ule ra', href: 'http://www.ilaweekiti.com')
  end
end
