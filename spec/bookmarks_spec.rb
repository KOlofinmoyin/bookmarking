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
      expect(browser.first).to be_a Bookmarking
      expect(browser.first.id).to eq bookmark.id
      expect(browser.first.title).to eq 'Google Inc.'
      expect(browser.first.url).to eq 'http://www.google.com'
      # expect(browser).to include('http://www.bbc.com')
      # expect(browser).to include('http://www.google.com')
      # expect(browser).to include('http://www.alltheweb.com')
    end
  end

  describe '.create' do
    it "creates a new bookmark" do
      bookmark = Bookmarking.create(url: 'http://www.ilaweekiti.com', title: 'Site ule ra') #.first
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmarking


      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Site ule ra'
      expect(bookmark.url).to eq 'http://www.ilaweekiti.com'
    end
  end

  describe '.delete' do
    it "deletes a given bookmark" do
      bookmark = Bookmarking.create(title: 'Makers Academy', url: 'http://www.makersacademy.com') #.first

      Bookmarking.delete(id: bookmark.id)

      expect(Bookmarking.bring_bookmarks.length).to eq 0

    end
  end

  describe '.update' do
    it "updates the bookmark with the given data" do
      bookmark = Bookmarking.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmarking.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmarking
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  define '.find' do
    it "returns the requested bookmark object" do
      bookmark = Bookmarking.create(title:'Makers Academy', url: 'http://www.makersacademy.com')
      result = Bookmarking.find(id: bookmark.id)

      expect(result).to be_a Bookmarking
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
