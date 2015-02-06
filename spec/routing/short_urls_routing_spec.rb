require "rails_helper"

RSpec.describe ShortUrlsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/").to route_to("short_urls#new")
    end

    it "routes to #show" do
      expect(get: "/1").to route_to("short_urls#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/").to route_to("short_urls#create")
    end
  end
end
