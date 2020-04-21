require 'bookmarks'
require 'database_helpers'

describe Bookmarking do

  describe '#bring_bookmarks' do
    it "retrieves bookmarks" do
      connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

      # Create the test-data:
      bookmark = Bookmarking.create(url: 'http://www.google.com', title: 'Google Inc.')
      Bookmarking.create(url: 'http://www.bbc.com', title: 'British Broadcasting Corporation')
      Bookmarking.create(url: 'http://www.alltheweb.com', title: 'All the web')

      browser = Bookmarking.bring_bookmarks

      expect(browser.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarking
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google Inc.'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
      # expect(browser).to include('http://www.bbc.com')
      # expect(browser).to include('http://www.google.com')
      # expect(browser).to include('http://www.alltheweb.com')
    end
  end

  describe '#.create' do
    it "creates a new bookmark" do
      bookmark = Bookmarking.create(url: 'http://www.ilaweekiti.com', title: 'Site ule ra') #.first
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmarking


      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Site ule ra'
      expect(bookmark.url).to eq 'http://www.ilaweekiti.com'
    end
  end
end
