require "rails_helper"

RSpec.describe "ShortUrls", type: :request do
  describe "GET /short_urls" do
    it "lists urls" do
      get short_urls_path
      expect(response).to have_http_status(200)
    end
  end
end
