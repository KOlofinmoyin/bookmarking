require 'bookmarks'

describe Bookmarking do
  it "retrieves bookmarks" do
    browser = Bookmarking.bring_bookmarks
    expect(browser).to include("http://www.bbc.com")
    expect(browser).to include("http://www.google.com")
    expect(browser).to include("http://www.alltheweb.com")
  end
end
