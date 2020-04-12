require 'bookmarks'

describe Bookmarking do

  describe '#bring_bookmarks' do
    it "retrieves bookmarks" do
      connection = PG.connect(dbname: 'bookmarking_manager_test', user: 'postgres', password: 'pa55w0rd')
      # Add the test-date:
      connection.exec("INSERT INTO bookmarkings VALUES ('http://www.bbc.com');")
      connection.exec("INSERT INTO bookmarkings VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarkings VALUES ('http://www.alltheweb.com');")

      browser = Bookmarking.bring_bookmarks
      
      expect(browser).to include("http://www.bbc.com")
      expect(browser).to include("http://www.google.com")
      expect(browser).to include("http://www.alltheweb.com")
    end
  end

  xit "creates bookmarks" do
    browser = Bookmarking.create_bookmarks
    expect(browser).to include("http://www.nairaland.com")
  end
end
