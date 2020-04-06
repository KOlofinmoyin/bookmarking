require 'bookmarks'

describe Bookmarking do
  it "retrieves bookmarks" do
    browser = Bookmarking.bring_bookmarks
    expect(browser).to include("www.bbc.com")
    expect(browser).to include("www.alltheweb.com")
    expect(browser).to include("www.google.com")
  end
end
