require 'rails_helper'

RSpec.describe "short_urls/index", type: :view do
  before(:each) do
    assign(:short_urls, [
      ShortUrl.create!(
        :original_url => "Original Url"
      ),
      ShortUrl.create!(
        :original_url => "Original Url"
      )
    ])
  end

  it "renders a list of short_urls" do
    render
    assert_select "tr>td", :text => "Original Url".to_s, :count => 2
  end
end
