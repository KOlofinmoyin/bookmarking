require 'bookmarks'

describe Bookmarking do

  describe '#bring_bookmarks' do
    it "retrieves bookmarks" do
      connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
      # Add the test-date:
      connection.exec("INSERT INTO bookmarkings VALUES (1, 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarkings VALUES (2, 'http://www.bbc.com');")
      connection.exec("INSERT INTO bookmarkings VALUES (3, 'http://www.alltheweb.com');")

      browser = Bookmarking.bring_bookmarks

      expect(browser).to include('http://www.bbc.com')
      expect(browser).to include('http://www.google.com')
      expect(browser).to include('http://www.alltheweb.com')
    end

    describe '#.create' do
      it "creates a new bookmark" do
        Bookmarking.create(url: 'http://www.ilaweekiti.com')
        expect(Bookmarking.bring_bookmarks).to include 'http://www.ilaweekiti.com'
      end
    end
  end

end
