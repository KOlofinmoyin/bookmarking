RSpec.feature 'Adding a new bookmark' do
  scenario 'a user can add a new bookmark to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.ilaweekiti.com')
    click_button('Submit')
    expect(page).to have_content('http://www.ilaweekiti.com')
  end
end
