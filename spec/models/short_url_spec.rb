require "rails_helper"

RSpec.describe ShortUrl, type: :model do
  let!(:short_url) do
    ShortUrl.create(original_url: "www.example.com")
  end

  it "is valid" do
    expect(short_url).to be_valid
  end

  it "is invalid without a url" do
    short_url.original_url  = nil
    expect(short_url).not_to be_valid
  end
end
