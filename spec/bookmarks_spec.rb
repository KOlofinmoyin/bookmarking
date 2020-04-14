require 'bookmarks'

describe Bookmarking do

  describe '#bring_bookmarks' do
    it "retrieves bookmarks" do
      connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')

      # Create the test-date:
      Bookmarking.create(url: 'http://www.google.com', title: 'Google Inc.')
      Bookmarking.create(url: 'http://www.bbc.com', title: 'British Broadcasting Corporation')
      Bookmarking.create(url: 'http://www.alltheweb.com', title: 'All the web')

      browser = Bookmarking.bring_bookmarks

      expect(browser).to include('http://www.bbc.com')
      expect(browser).to include('http://www.google.com')
      expect(browser).to include('http://www.alltheweb.com')
    end
  end

  describe '#.create' do
    it "creates a new bookmark" do
      bookmark = Bookmarking.create(url: 'http://www.ilaweekiti.com', title: 'Site ule ra').first
      expect(bookmark[url]).to eq 'http://www.ilaweekiti.com'
      expect(bookmark[title]).to eq 'Site ule ra'
    end
  end
end
