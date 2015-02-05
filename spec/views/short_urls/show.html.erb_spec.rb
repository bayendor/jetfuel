require 'rails_helper'

RSpec.describe "short_urls/show", type: :view do
  before(:each) do
    @short_url = assign(:short_url, ShortUrl.create!(
      :original_url => "Original Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Original Url/)
  end
end
