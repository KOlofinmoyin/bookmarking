RSpec.feature "Infrastructure test" do
  feature 'navigating' do
    scenario 'visit the home' do
      visit '/'
      expect(page).to have_content("http://www.google.com")
    end
  end
end
